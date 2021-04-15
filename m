Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp690270lfr;
        Thu, 15 Apr 2021 09:37:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw5lill3OZbvlAR0vYgZIFzfPBI+lYA9zp+7wlpkkftWBnLjL9yTvLQQwhWLnm74Tmlswco
X-Received: by 2002:a02:cbcd:: with SMTP id u13mr122186jaq.67.1618504621238;
        Thu, 15 Apr 2021 09:37:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618504621; cv=none;
        d=google.com; s=arc-20160816;
        b=RzMoV0hqTAdbuoLA7k0fKmd2cP+W3sDZcG9tZ2z9D1xUk0vdBcMwY/IM/pax4w6P2q
         eeXWvlGPkHUCj95krFH76HpSkKhGDajvXqco9yiwuc11faS74c6sBWVmZUwurrNVtuw5
         NeMrEC/ceXlplBw1U+Pd0/0o0uxRt4etmYL8ihe6G7pqAvX86m+zja713WsvANOw/0p+
         j+gEEJ6usEEcEqVILU+JaSgmm9UvSnuU9o4M1XPRpLGGS6264LcAptb+uO2/Fya5t956
         UWfE0UFiUiFiDuB3mflrh9Q4ewomcRhL7jz+xVP6+qaAl1OmWkozvKvGXc4bwasMiEFA
         lvVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=gAKYUpiR6utyRB/NZb4Oxly+620xy99pZuDdDXjT2Ls=;
        b=eezdigzJvaZtiT744Azc35Vd0qp1kDguoWuZBcEVh3tG6WGfnjr9X/U27KGCBYydGK
         Lz8gfLZMVhP4XRtw34+ho2DywJ8OAlKiyX+snguFgwUOfxo0do5+M8jnK6OOVxv07ugM
         yEHTqm6W5mADts+Cz/a2PxL1nGkAanChJLEKdylVZ1tLQsMFpxMjA2fYR5Y86l8mJ4fq
         l71ovKlt8V/+7kTfrWud0Q9JZczaSX/voBKXKf6uXf/6CFS4/6LnQZvEE9jmOiLtqfO5
         SawkEHjhIpo9iQjv06+QdRXzK1n4H2GY75TPWokJxQXOMOeVXYAhyGA/YDdbW6GxL3i3
         WcSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="P90ld/gq";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n16si3870844jat.35.2021.04.15.09.37.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Apr 2021 09:37:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="P90ld/gq";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lX4zE-0004oL-EJ
	for alex.bennee@linaro.org; Thu, 15 Apr 2021 12:37:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lX4vb-0002vg-3T
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 12:33:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22299)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lX4vZ-00061M-98
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 12:33:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618504392;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=gAKYUpiR6utyRB/NZb4Oxly+620xy99pZuDdDXjT2Ls=;
 b=P90ld/gqpTZWTl7uGVGTtKORbiOW2zDLT3TrmKcSfdEWxfpxW/flTZe/7CELZspP3S/5Cg
 yJX1jZ+/OnqWNOvsT1kbXBth31JNodp6Xz4BmFMshqMLSS8/k94RL58/qGhX1NQo5FW8uy
 Ak/dnGMih618IS2ZNhRk6Rf03BwVFmA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-30-T2PpQLrlPmCRXeAiJoei6Q-1; Thu, 15 Apr 2021 12:33:08 -0400
X-MC-Unique: T2PpQLrlPmCRXeAiJoei6Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 x20-20020a7bc2140000b029012bb4d2b5d6so3063851wmi.1
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 09:33:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Htr10TFlW2FcXfr1pFLx1dnJWpqhMb8YinfCqQXcRyc=;
 b=QIaOK70akrfBj6LQYglm87l0SpKTVDh8OJNDMfDgi8BrIfs5eHVzYPOMV2HxiEPfl4
 xpufXDfCXnh9HcvUS7YZGpdzRficIeXF/CQMA08GsBgcFvuIRbKZg7IEGXA3HYTuX51m
 A/Hk1CNdDTVgSE90uycjVIfA9DxOPWXo4ax4lKiqvtYn6WRqDZLcrBKiNJMFYb6i9cxn
 u87NYCNwiGqBvb6m0W5Rij1rGVIKJMHSHnr4WYZSqbqYtXwlK/ES24bjC8t5LjuQ6tka
 rHAalCkPPQZnaqAETkM2vAfxAfaIGvie7i62dGS4PKkE9JxsE236VeavystjkAKqoitQ
 bFxQ==
X-Gm-Message-State: AOAM530ly8iHniUYeeQ1VIco9HnyP3sC7+cmx6CpQpf9dowlecu+aaka
 nPGga513NsyE0KeXuMKdLkI7j5gZU7uVcojmGLGzshF07+JhfBOSZ+lrlWeyCrD6A+6TxdfEItT
 kk9Mw1JemwssG1JEmD+Ea/q3NEz9xj90rWVtmqyQJA+o0PDz1pjh/AQn/DJ4PwMBj
X-Received: by 2002:a7b:c4d5:: with SMTP id g21mr3883809wmk.55.1618504387208; 
 Thu, 15 Apr 2021 09:33:07 -0700 (PDT)
X-Received: by 2002:a7b:c4d5:: with SMTP id g21mr3883770wmk.55.1618504386894; 
 Thu, 15 Apr 2021 09:33:06 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id h8sm4037396wrt.94.2021.04.15.09.33.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 09:33:06 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 00/12] qtests: Check accelerator available at runtime via
 QMP 'query-accels'
Date: Thu, 15 Apr 2021 18:32:52 +0200
Message-Id: <20210415163304.4120052-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QfcrZ2yX85tL

Hi,=0D
=0D
This series aims at having accelerator-independent qtests=0D
by querying a QEMU instance at runtime to check the list=0D
of built-in accelerators.=0D
=0D
First we add the 'query-accels' QMP command,=0D
then we add the qtest_has_accel() method to libqtest,=0D
finally we use this new method to allow running=0D
bios-tables-test on KVM-only builds.=0D
=0D
As a bonus we remove CONFIG_TCG in config_host, to avoid=0D
building unnecessary objects depending on TCG.=0D
=0D
Since v3:=0D
- Addressed Markus & Drew review comments=0D
- Added qtest/migration-test patch=0D
=0D
Since v2:=0D
- Addressed Eric & Paolo review comments=0D
=0D
Since v1:=0D
- kept over-engineered union (I don't how to do simple enum)=0D
- dropped arm-cpu-features patches for now=0D
- fixed typos (Eric)=0D
- rename qtest_has_accel (Thomas)=0D
- probe accel with machine none previous qtest (Paolo)=0D
- iterate over QAPI enum (Markus)=0D
=0D
Eric's suggestion of conditional QAPI didn't worked out,=0D
as accelerator definitions are poisoned.=0D
=0D
Please review,=0D
=0D
Phil.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (12):=0D
  MAINTAINERS: Add qtest/arm-cpu-features.c to ARM TCG CPUs section=0D
  accel: Introduce 'query-accels' QMP command=0D
  tests/qtest: Add qtest_has_accel() method=0D
  qtest/arm-cpu-features: Use generic qtest_has_accel() to check for KVM=0D
  qtest/arm-cpu-features: Restrict sve_tests_sve_off_kvm test to KVM=0D
  qtest/arm-cpu-features: Remove TCG fallback to KVM specific tests=0D
  qtest/arm-cpu-features: Use generic qtest_has_accel() to check for TCG=0D
  qtest/bios-tables-test: Make test build-independent from accelerator=0D
  qtest/migration-test: Skip tests if KVM not builtin on s390x/ppc64=0D
  qtest/qmp-cmd-test: Make test build-independent from accelerator=0D
  tests/qtest: Do not restrict bios-tables-test to Aarch64 hosts anymore=0D
  tests/meson: Only build softfloat objects if TCG is selected=0D
=0D
 meson.build                    |  1 -=0D
 qapi/machine.json              | 47 ++++++++++++++++=0D
 tests/qtest/libqos/libqtest.h  |  8 +++=0D
 accel/accel-qmp.c              | 49 +++++++++++++++++=0D
 tests/qtest/arm-cpu-features.c | 55 ++++++-------------=0D
 tests/qtest/bios-tables-test.c | 99 ++++++++++++++++++----------------=0D
 tests/qtest/libqtest.c         | 29 ++++++++++=0D
 tests/qtest/migration-test.c   |  4 +-=0D
 tests/qtest/qmp-cmd-test.c     | 18 +++++--=0D
 MAINTAINERS                    |  1 +=0D
 accel/meson.build              |  2 +-=0D
 tests/qtest/meson.build        |  3 +-=0D
 12 files changed, 221 insertions(+), 95 deletions(-)=0D
 create mode 100644 accel/accel-qmp.c=0D
=0D
--=20=0D
2.26.3=0D
=0D

