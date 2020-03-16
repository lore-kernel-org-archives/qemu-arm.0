Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp251907lfe;
        Mon, 16 Mar 2020 09:08:28 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtdYJRNLxdhl/wqG1XRP9FhW8mR/315/Y6MboDrDY/ICwtjPM8QouxCoWyJ+IC7Epxt2gI/
X-Received: by 2002:adf:ed06:: with SMTP id a6mr90717wro.346.1584374908493;
        Mon, 16 Mar 2020 09:08:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584374908; cv=none;
        d=google.com; s=arc-20160816;
        b=IwojBYIObjg/hq+HkuaVr2LjWu1c5vDUF9EjvOsmi07ezC+HbsEWQD62wHHrR1qWr0
         9rb4cHz+JTiRKSvaS0Xc+hQnuQt63Ow6R1WqlpFJ6Z174bPxOF4de0tmaW/WoqbRfiSg
         aimBSs5z1vlUeRW8QML/z2SVYmc1sgGBsUf6QTFFO4y9l9BrziLAZ9Kl48AyL99qAMa5
         mcCY1BkX2IKhQwSwmAK/D3OAhEy/75Kx8V4/XNj7FWjB4SnUVMjdnbBpYcEWJBTzAP3F
         RhwSg4FXC/SJcmLlap8I7VtAXDJq4XvYwzAOzhfE1wCfEYonk7FFF+3SEA94BYbpDbIr
         vgGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=/ssNU1W6JmcL4kU4cWyqsOdXjUb4r7kWMVEvWGvo+2k=;
        b=CQinIfbJ/9Dkf8Nu5Q4ytE8fj9ei9OcAtslyQEc3aBmfwPGtex+z/PMm7XyBIZm4Ti
         ObCDvNNBi1bVBtVUuBcS+CX0UkIkYB1LaDC4wD9iDFbRXtDb3d8NTLq+gekzeyvTe1EE
         60Tt4COrfqGfbG9hNGRYZQmh3uHzrxPWeUMddupDy0ye0eYtx4iGtUHsDdcQhrrFL9o9
         IzwElGbYA69oekHHUPysyB+xTATz8o/DZ1xQgZ5YS+EhnAi++GsK/aePfe3mS7FIDc49
         2lfWjqnW+CI9uCtvlyxLyl6N3kEueH6oYRh7qXhUYegDtmqcPJTUgxDTAsZ7D4b1ljWH
         U9ZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BT4qdTI0;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.74 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com. [216.205.24.74])
        by mx.google.com with ESMTPS id m14si15265463wmi.87.2020.03.16.09.08.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Mar 2020 09:08:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.74 as permitted sender) client-ip=216.205.24.74;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BT4qdTI0;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.74 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584374907;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/ssNU1W6JmcL4kU4cWyqsOdXjUb4r7kWMVEvWGvo+2k=;
	b=BT4qdTI0zrXUXTvYnlFG1lZpwEbVxQAdHUxR00nwz/om3NMB96E/4D9XNPR8yJs+Rqsr/R
	hGQ16TuIHzd/vH3dgiFo7o5xOipJ8D8X8LZWcfoZYENtIpha8Uo83Odpvn0htqoVzCOvdB
	Nbde84PumbcTkfmfiO+5X2Rfwl6xffM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-fcdvLecGN6G_4SQJz6G9qQ-1; Mon, 16 Mar 2020 12:08:23 -0400
X-MC-Unique: fcdvLecGN6G_4SQJz6G9qQ-1
Received: by mail-wr1-f69.google.com with SMTP id t10so2954547wrp.15
        for <alex.bennee@linaro.org>; Mon, 16 Mar 2020 09:08:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=N7+HmyV0D4vFSs4ZL/u4BopejDTWdgLZjfeVHLnQ9M4=;
        b=bEGNYpoAdK+iPbwAoMbkrmoPEr0JcjCm1fR9QpqmO67F9Mm9S1GkJvWwlieMPnBSOs
         otH5hsKC5CDJoRDTa/GSrin+QIg5PEVLATX97EGDR92RCz1mNcwskdEQOcK3e0+k6yA7
         zJfPFVD1D+PPHjLPE2IRh8oljn+ws7kAaODskedYU0ej7z4RMfR7mohKAXL/KeZlMQjN
         U2cnKnSIOOGNQDmlUEglqXaKIuxrBwILyzyGa4D7wW0Qwax9pWhIuQ7n1vxR8NUOj0zC
         emigyT3jPh/AeNmaq8GLyV+Yt1JGgdcVd20rUez/RVIPV5WAtY3mfpREf6ycJZhhunIT
         S0Aw==
X-Gm-Message-State: ANhLgQ33s5tMM2QKCRDiJ8rIzwne+aABaepiu+PhZgGKvyzeFSCgCb9w
	058qMvYYzradiXKgNNXc4HR0RcvSGmYNmZB+zCzss/d+26Wv0Ddu1K5A8wBmobRnkf7e1k+92MV
	EdtOPh/1oc6P9PjxL
X-Received: by 2002:a1c:984a:: with SMTP id a71mr29937831wme.185.1584374902203;
        Mon, 16 Mar 2020 09:08:22 -0700 (PDT)
X-Received: by 2002:a1c:984a:: with SMTP id a71mr29937801wme.185.1584374901937;
        Mon, 16 Mar 2020 09:08:21 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from localhost.localdomain (96.red-83-59-163.dynamicip.rima-tde.net. [83.59.163.96])
        by smtp.gmail.com with ESMTPSA id v10sm170121wml.44.2020.03.16.09.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2020 09:08:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	kvm@vger.kernel.org,
	Thomas Huth <thuth@redhat.com>,
	qemu-arm@nongnu.org,
	Fam Zheng <fam@euphon.net>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 19/19] .travis.yml: Add a KVM-only Aarch64 job
Date: Mon, 16 Mar 2020 17:06:34 +0100
Message-Id: <20200316160634.3386-20-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200316160634.3386-1-philmd@redhat.com>
References: <20200316160634.3386-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: b044lL8H2Y6W

Add a job to build QEMU on Aarch64 with TCG disabled, so
this configuration won't bitrot over time.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
Job ran for 13 min 1 sec
https://travis-ci.org/github/philmd/qemu/jobs/663122258
---
 .travis.yml | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/.travis.yml b/.travis.yml
index b92798ac3b..ea3c0df185 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -450,6 +450,38 @@ jobs:
         - TEST_CMD=3D"make check check-tcg V=3D1"
         - CONFIG=3D"--disable-containers --target-list=3D${MAIN_SOFTMMU_TA=
RGETS}"
=20
+    - name: "[aarch64] GCC check (KVM)"
+      arch: arm64
+      dist: xenial
+      addons:
+        apt_packages:
+          - libaio-dev
+          - libattr1-dev
+          - libcap-ng-dev
+          - libgcrypt20-dev
+          - libgnutls28-dev
+          - libiscsi-dev
+          - liblttng-ust-dev
+          - libnfs-dev
+          - libnss3-dev
+          - libpixman-1-dev
+          - libpng-dev
+          - librados-dev
+          - libseccomp-dev
+          - liburcu-dev
+          - libusb-1.0-0-dev
+          - libvdeplug-dev
+          - libvte-2.91-dev
+          # Tests dependencies
+          - genisoimage
+      env:
+        - CONFIG=3D"--disable-containers --disable-tcg --enable-kvm --enab=
le-fdt --disable-tools"
+        - TEST_CMD=3D"make check-unit"
+      script:
+        # Only select the 'virt' machine.
+        - echo CONFIG_ARM_VIRT=3Dy > ${SRC_DIR}/default-configs/aarch64-so=
ftmmu.mak
+        - make -j3 && travis_retry ${TEST_CMD}
+
     - name: "[ppc64] GCC check-tcg"
       arch: ppc64le
       dist: xenial
--=20
2.21.1
