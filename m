Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2038322ejb;
        Tue, 24 Oct 2023 06:15:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmA9jwuNmLVhCqOAYIVmi6I04SrALxiH8uU9PCEyy9mQOzQoCEJ+KuT3UQhUjF7TxQYXg7
X-Received: by 2002:a05:6214:e61:b0:66d:bb9:43d3 with SMTP id jz1-20020a0562140e6100b0066d0bb943d3mr15839717qvb.50.1698153302754;
        Tue, 24 Oct 2023 06:15:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698153302; cv=none;
        d=google.com; s=arc-20160816;
        b=F8Hi3HizAeA+gva/VEwlUfou+MZXYxIJ+LsLsbieI8UfD73MHKLVpS8evsT/Vr6jQq
         Niu5HPtytyDbTl/PkWrBMBGnHjtQrd+Yl/pvlwrPKgR2URSblAZA87KUP30kCyoqomz7
         L9loZ1kfIFZGEPNReqr078SauD87oT2CBPLWcCFeL2kPokoEeMKQeol2GJEJu0tPNcQs
         J/K4RPrA4atoy/xbdi8Brf15YyAaSiORnm8//7tGISxtTWf/hxdh+5PioD1SRoXruE92
         cDF0KI7OVIcajVEqjnf0ClFWbjXEDoOXoJ0Ha8b7nYB+YLd/L2MldoSJG7OktHrEoT4A
         eUeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=0wLme3tPLHrsytkaTz20AbsMQdVkg50xoNnDIj0EyAo=;
        fh=e9feSw8SSOtT/dgZZLe6uilVOFwjb0itHlOwuVUfZns=;
        b=k8MAheAFQatXWVUt1CBlU2ZCx/Oibx2V3/+OIIOGp3TJ8gOqIwJ31sVKMP4Uv39Rak
         cf341sHdk+KlNcCU+jIypTY0glnPhbBWeBrsQQ6eAFXhUexkOaQ+Cn3HqZs/WaJ10TRs
         Q82cwFoDS8NeE9r1Y9fd3vD3njdLQokBgoWtm3pPF56NHczCFo7mTYBMVu7oiRvxtLlc
         +o8e/QUmWET/93hcQgb08AWuQUeuZXJs2B2F9lLm+ES0Upp9DrE+hbw5QaTSQPAwSz6I
         pFPAnxX3aWw7H/8SFtOzSeYyNftKjZwhJTtq/T2TIpvRZ1OjGhz+O49lfpSypvRVejrE
         XHxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=akIfDFI8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id em8-20020ad44f88000000b0065d033bfb5fsi6881829qvb.125.2023.10.24.06.15.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Oct 2023 06:15:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=akIfDFI8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qvHEH-0003ss-QC; Tue, 24 Oct 2023 09:13:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qvHE9-0003iL-7b
 for qemu-arm@nongnu.org; Tue, 24 Oct 2023 09:13:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qvHE5-00011l-SW
 for qemu-arm@nongnu.org; Tue, 24 Oct 2023 09:13:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698153221;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0wLme3tPLHrsytkaTz20AbsMQdVkg50xoNnDIj0EyAo=;
 b=akIfDFI8YoMp5YvPLXzGNZg+gSlxjU5uB/7rC5Ihd55ctaXlnUIefHJbNyc+dhdqyFS2H5
 OGinP4kUuASdfAXQ1Sfsw5NzF4cuBXyZx2P8xOojR0kYHmfsV5rsjzFe8zf22qYR4+p0KR
 kEkHDwS0niLUqNty74yALxr1zO73juo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-39-_frJOCvMP2uPEtxuXDXUUA-1; Tue, 24 Oct 2023 09:13:38 -0400
X-MC-Unique: _frJOCvMP2uPEtxuXDXUUA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0FB51811E7B;
 Tue, 24 Oct 2023 13:13:34 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.127])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AB2E41C060BA;
 Tue, 24 Oct 2023 13:13:27 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Corey Minyard <minyard@acm.org>, Li Zhijian <lizhijian@fujitsu.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Corey Minyard <cminyard@mvista.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Kevin Wolf <kwolf@redhat.com>, qemu-s390x@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 libvir-list@redhat.com, Stefan Weil <sw@weilnetz.de>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Xu <peterx@redhat.com>, Leonardo Bras <leobras@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Fam Zheng <fam@euphon.net>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Eric Farman <farman@linux.ibm.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, qemu-ppc@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-block@nongnu.org
Subject: [PULL 03/39] migration/doc: How to migrate when hosts have different
 features
Date: Tue, 24 Oct 2023 15:12:29 +0200
Message-ID: <20231024131305.87468-4-quintela@redhat.com>
In-Reply-To: <20231024131305.87468-1-quintela@redhat.com>
References: <20231024131305.87468-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: xI/QYDVB004t

Sometimes devices have different features depending of things outside
of qemu.  For instance the kernel.  Document how to handle that cases.

Acked-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Fabiano Rosas <farosas@suse.de>
Signed-off-by: Juan Quintela <quintela@redhat.com>
Message-ID: <20231018112827.1325-4-quintela@redhat.com>
---
 docs/devel/migration.rst | 97 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/docs/devel/migration.rst b/docs/devel/migration.rst
index 6fe275b1ec..974505e4a7 100644
--- a/docs/devel/migration.rst
+++ b/docs/devel/migration.rst
@@ -1138,3 +1138,100 @@ machine types to have the right value::
     +    { "virtio-blk-device", "num-queues", "1"},
          ...
      };
+
+A device with diferent features on both sides
+---------------------------------------------
+
+Let's assume that we are using the same QEMU binary on both sides,
+just to make the things easier.  But we have a device that has
+different features on both sides of the migration.  That can be
+because the devices are different, because the kernel driver of both
+devices have different features, whatever.
+
+How can we get this to work with migration.  The way to do that is
+"theoretically" easy.  You have to get the features that the device
+has in the source of the migration.  The features that the device has
+on the target of the migration, you get the intersection of the
+features of both sides, and that is the way that you should launch
+QEMU.
+
+Notice that this is not completely related to QEMU.  The most
+important thing here is that this should be handled by the managing
+application that launches QEMU.  If QEMU is configured correctly, the
+migration will succeed.
+
+That said, actually doing it is complicated.  Almost all devices are
+bad at being able to be launched with only some features enabled.
+With one big exception: cpus.
+
+You can read the documentation for QEMU x86 cpu models here:
+
+https://qemu-project.gitlab.io/qemu/system/qemu-cpu-models.html
+
+See when they talk about migration they recommend that one chooses the
+newest cpu model that is supported for all cpus.
+
+Let's say that we have:
+
+Host A:
+
+Device X has the feature Y
+
+Host B:
+
+Device X has not the feature Y
+
+If we try to migrate without any care from host A to host B, it will
+fail because when migration tries to load the feature Y on
+destination, it will find that the hardware is not there.
+
+Doing this would be the equivalent of doing with cpus:
+
+Host A:
+
+$ qemu-system-x86_64 -cpu host
+
+Host B:
+
+$ qemu-system-x86_64 -cpu host
+
+When both hosts have different cpu features this is guaranteed to
+fail.  Especially if Host B has less features than host A.  If host A
+has less features than host B, sometimes it works.  Important word of
+last sentence is "sometimes".
+
+So, forgetting about cpu models and continuing with the -cpu host
+example, let's see that the differences of the cpus is that Host A and
+B have the following features:
+
+Features:   'pcid'  'stibp' 'taa-no'
+Host A:        X       X
+Host B:                        X
+
+And we want to migrate between them, the way configure both QEMU cpu
+will be:
+
+Host A:
+
+$ qemu-system-x86_64 -cpu host,pcid=off,stibp=off
+
+Host B:
+
+$ qemu-system-x86_64 -cpu host,taa-no=off
+
+And you would be able to migrate between them.  It is responsability
+of the management application or of the user to make sure that the
+configuration is correct.  QEMU doesn't know how to look at this kind
+of features in general.
+
+Notice that we don't recomend to use -cpu host for migration.  It is
+used in this example because it makes the example simpler.
+
+Other devices have worse control about individual features.  If they
+want to be able to migrate between hosts that show different features,
+the device needs a way to configure which ones it is going to use.
+
+In this section we have considered that we are using the same QEMU
+binary in both sides of the migration.  If we use different QEMU
+versions process, then we need to have into account all other
+differences and the examples become even more complicated.
-- 
2.41.0

