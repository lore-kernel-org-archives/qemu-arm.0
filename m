Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D757BCD98C7
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 17:25:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wX0Cc-0007KV-K2; Tue, 09 Jun 2026 13:25:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1wX0Ca-0007KB-Vd
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 13:25:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1wX0CY-0001oP-H5
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 13:25:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781025920;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=mFHoPhGhsuTmv+EEN396O5Two+rm7exFxgwa3OtldZU=;
 b=dOa3OcOOJr5xCFMm9I3Qe9CCagF6+uRGD1YkBLTQwA0Hfhh3sulOhIu2uJVrw+rTBAdUgA
 Tb2BmnLgXOwVCn1gro9EneaX2H4JYt4BDZl/u/2FwuaK8jLk1olpXFbclR861Fq9iWGPUO
 bw8+7dsknwHMDIuQf/bPVXJ6gm64Jjk=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-348-Y-zzZX2nPrCPC9kWNtcVcg-1; Tue, 09 Jun 2026 13:25:18 -0400
X-MC-Unique: Y-zzZX2nPrCPC9kWNtcVcg-1
X-Mimecast-MFC-AGG-ID: Y-zzZX2nPrCPC9kWNtcVcg_1781025917
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-5175bf22b1bso81814721cf.3
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 10:25:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781025917; x=1781630717;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mFHoPhGhsuTmv+EEN396O5Two+rm7exFxgwa3OtldZU=;
 b=gvxhawtafjV76LiARmdPzim9axckXiRwNQAsDC4NbIILowFG/0CHn2GwAMTlVy8ZUO
 cVmXZw7iuBk4bD46VOnW3ykC9QNFsqVNVFNvF0Jf4CQwE8lR9nOV4JY46PrqW45sF/tf
 fBBj9nTXLGlDVTdlwDiTYAOJXyrFvIf2uqojGH46ZA8l0cgfAItNBf4XW8lBZar0+rGn
 1gQTLVZBERt5pEaAziIXpJC44EtJ5ivxLUZTmlxAVfT0yiBSIyZ8JSIRlucxlYDEB2lO
 6cUlC8VbC061nnSo406Z8FG6tNOc4lFrUr99XwO/d3/b3JbsrmfFhcKFMBqMuCJVXbnj
 UCZw==
X-Gm-Message-State: AOJu0YzKeQc0/G8XpX90zdutTZGUfDa8xthZWk2lixCQ3N9FVf63ye3b
 rHpoquLQU726dh4KOultkjg6dkTMRLzm6YN8/PFjFOdyl/Lu1XzGtVeaLTshPTXd/wmg0O7c8Lw
 e7J19MRbakkZhBirbFRqos6qkRDWGh3+b4rbcC0nWgdBIpfhu3Fesww==
X-Gm-Gg: Acq92OEHiqOMzmSGguZJKqSDLRn0TRPAiB/LEhkkjdG+pHuEid2tcDAv4f7NoJTZJEK
 hZUNoEnFpj4Zq3RhxzGDyc6lnYn9gh/utfnOyFNEMd1O1foBpNVgpP6VUXnNHKke8Ama6tkcSVz
 dHsLQAxKHBWa/ZRfNFvtREDGPCklRecIZ4hA4zDEQlWhe0ALRKWEiF+hKOyHBhMRs8jzwPk6TAJ
 5vPK5wq24TUIfBz3+zdaz9sHxCjwfUzB8R49NuqF7q/Pe4zlfivt3/R/XeU9S7hiWhTzv+bUT3I
 TQHT4IJ0j7falP8kMJyM1gIMpTyWYjcY91IX4qGx+oB90ncIDv4WE2934mVCOUM7TNqGKIkdOSQ
 Xmjhkjx85ieQ2wlPAMZ+o1RE=
X-Received: by 2002:ac8:53d7:0:b0:517:9648:f725 with SMTP id
 d75a77b69052e-5179648fbb3mr210643541cf.50.1781025917360; 
 Tue, 09 Jun 2026 10:25:17 -0700 (PDT)
X-Received: by 2002:ac8:53d7:0:b0:517:9648:f725 with SMTP id
 d75a77b69052e-5179648fbb3mr210643101cf.50.1781025916804; 
 Tue, 09 Jun 2026 10:25:16 -0700 (PDT)
Received: from x1.com ([142.189.10.167]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-51775da2c56sm187524711cf.21.2026.06.09.10.25.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2026 10:25:16 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Fabiano Rosas <farosas@suse.de>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Dr . David Alan Gilbert" <dave@treblig.org>,
 Eric Blake <eblake@redhat.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Sana Sharma <sansshar@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Juraj Marcin <jmarcin@redhat.com>, qemu-rust@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>
Subject: [PATCH v2 00/10] migration/qom: Remove TYPE_DEVICE dependency on
 migration object
Date: Tue,  9 Jun 2026 13:25:04 -0400
Message-ID: <20260609172514.2037645-1-peterx@redhat.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rCR0p1S95dScKSrctW-2cdtKpjbBoR7tg9WfuP9Wi50_1781025917
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

CI: https://gitlab.com/peterx/qemu/-/pipelines/2588717620
    (two irrelevant failures due to no runner)

rfc: https://lore.kernel.org/r/20251209162857.857593-1-peterx@redhat.com
v1:  https://lore.kernel.org/r/20260604231118.1584889-1-peterx@redhat.com

This v2 is a full rewrite of v1, changelog doesn't apply.

This version majorly addressed the concern in v1 having object API exported
in qdev files. Instead of trying to expose qdev properties, this patchset
switched migration object to use the object property API to add properties.

Not all QOM facilities are ready for it, there're a few prior patches to
improve QOM API to achieve it.

The major concept that this series introduces that does not exist
previously is the default value mechanisms for object properties (rather
than object class properties).  Here migration object will rely on that to
set default values.

Patch 1:   A cleanup to use OBJECT_DECLARE_SIMPLE_TYPE for migration
Patch 2-4: Qdev changes needed for the transition
Patch 5-9: Improve QOM API to prepare for the property switch
Patch 10:  Switch migration object to use TYPE_OBJECT and object props

Comments welcomed, thanks.

Peter Xu (10):
  migration: Use OBJECT_DECLARE_SIMPLE_TYPE
  qdev: Export global_props()
  qdev: Introduce DEFINE_PROP_*_NODEFAULT for bool/uint32
  hw/arm: Use nodefault version of qdev props when not needed
  qom: Create object-property-ptr.[ch]
  qom: Add object_property_add_bool_ptr()
  qom: Add object_property_add_size_ptr()
  qom: Add object_property_add_*_ptr_def()
  qom: Allow default values for instance properties
  migration: Switch to TYPE_OBJECT with object properties

 include/hw/core/qdev-properties.h |   7 +
 include/qom/object-property-ptr.h | 162 +++++++++
 include/qom/object.h              |  99 +-----
 migration/migration.h             |   9 +-
 migration/options.h               |   8 +-
 hw/arm/bcm2836.c                  |   3 +-
 hw/core/qdev-properties.c         |   2 +-
 migration/migration.c             |  42 ++-
 migration/options.c               | 526 +++++++++++++++++++-----------
 qom/object-property-ptr.c         | 394 ++++++++++++++++++++++
 qom/object.c                      | 266 ++-------------
 target/arm/cpu64.c                |   3 +-
 qom/meson.build                   |   1 +
 rust/bindings/hwcore-sys/lib.rs   |   2 +-
 14 files changed, 957 insertions(+), 567 deletions(-)
 create mode 100644 include/qom/object-property-ptr.h
 create mode 100644 qom/object-property-ptr.c

-- 
2.53.0


