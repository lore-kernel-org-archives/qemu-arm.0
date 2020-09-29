Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp4986497lfq;
        Tue, 29 Sep 2020 15:45:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxdZyrXfGhjYRUz+FhhS4IjG7H7bOz2H7VNDKrnqS+HE5IhhgUPMdJQ14DcSxwLbhlbvYSd
X-Received: by 2002:a25:2cd1:: with SMTP id s200mr9996286ybs.110.1601419504055;
        Tue, 29 Sep 2020 15:45:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601419504; cv=none;
        d=google.com; s=arc-20160816;
        b=fWiAXKBSJ8nb/yoPZFJ/LwT6A38dpUUrAsWy19SicQxQFun+wCgISMSdJmpYbXqyQp
         RaHorbYaMUcmN+rpVtqiV69UxZPQZi2UJhRWhO3CdJ9Zyg1VRS1Xaea6MhaNAMm1wAgL
         PR3NDMWBDtDFWIlQJemGyOXtYfoCg+X2h2YnXg/N7gnbAcyXJZsT1/MT7T876Ld/N4Fx
         iyFdHS1PuYmKI64Q9450t1e/ZmAnJdTKnhkQLuu2+xvgdM/w/2ArKwEUihgwGyNBzygH
         2YAOORTOqVaz2/ovFBZeomFnV8gupK5T3BXT+NQn3W/32bPdMaLp9kotF/YXDpsYwvoI
         d63g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=LDAC3FC/MEaPD4LUvl2bkbirLPCAiqLo/YtDEMBCclM=;
        b=beBzuzQogNVW7vx43doAymkBb9wTa15dHNLxgj5u2K+cm1azA33yVwQPE6EmLAkcpU
         oNmgxdPUTQU/emVECWQVcrSIRTw4Ift5IkKVaq+v64C5ZwSnUoB2Et7O813c4eddanU1
         aeX1Ac9fhaa4Ww95rY9UAKvDGT2DP5rkZ06MZs4/ps/s77Yu2BsRBhE+8YeTRM6u9y3F
         brG0C6Xo94Z5E2goONym52nwTeN7Bn5L+NU7imZ3SyKerKXoCtig7Wj6smUhmku6VPp+
         KJB9lts+yLksjro8A9SMBbD5UXbQQfcSQeWQOgcaBe/UEzVt4iHSlbvfST6xl7HFhu6x
         gtMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WiLCU42s;
       spf=pass (google.com: domain of philmd@redhat.com designates 63.128.21.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [63.128.21.124])
        by mx.google.com with ESMTPS id 4si5722101ybo.204.2020.09.29.15.45.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 29 Sep 2020 15:45:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 63.128.21.124 as permitted sender) client-ip=63.128.21.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WiLCU42s;
       spf=pass (google.com: domain of philmd@redhat.com designates 63.128.21.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1601419503;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LDAC3FC/MEaPD4LUvl2bkbirLPCAiqLo/YtDEMBCclM=;
	b=WiLCU42sDZHRBHzrhMjXI7Oy3FQbOA9RQ7DQtr4PPDOWdYsZQ9Fhfv/CV1m28R8tLHWTJ+
	5jKdl8jkxEaUyj3sitQXjJgkYCZ0M8u8Ph2FTOKyrSMekVDMdFOqlRNCxK6gyfQD5cQ03z
	TwTAU/Uok45MMIlKfNBq3YQTKE6rz5c=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-fA-B1kfJMamxZKT3eHZhGw-1; Tue, 29 Sep 2020 18:45:00 -0400
X-MC-Unique: fA-B1kfJMamxZKT3eHZhGw-1
Received: by mail-wm1-f70.google.com with SMTP id a7so2424919wmc.2
        for <alex.bennee@linaro.org>; Tue, 29 Sep 2020 15:45:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LDAC3FC/MEaPD4LUvl2bkbirLPCAiqLo/YtDEMBCclM=;
        b=kG/NdJd4mKqUCysqcWREiIpHZqVsVB0iCH/lWdCVPew4aKxTxIjCiHUh36Sq0DADr+
         4mxuPTKBPbXJNTYn2dI/LAfQLnXb9n/993x02dDQcCOOcbtC2chsbMQW4Pcce5DZgnyZ
         g9md8bCI39NLE5H5ca34jnm7C+guNTuuhRX9eq4ydSU+Xf4Tfzeslcah8L4CautIQzx9
         qw57Udhbt16XkozXwmc/CtjKITaYK0jWSMadclPkQAF9DaJOYvPX2BNuGzIn05qgq6jI
         yhUVuZXgrpW/N173L4UAW6hE9vweied+S6ysLHYruHKA68p9RR2fYUl0QTr8FX7Zsr27
         f8zA==
X-Gm-Message-State: AOAM533ouFkYXuTEN3+oQQ1pQt001TpL3x3kw5r/giKmFh+uVonGyEqp
	A3S6AN2Cf1Mc1DLQVvKTECVzAHyYLe86zdsjbwYfkAfN9fqlVsYhDPB2z8bADKyYzZqTht1BpUt
	M4DILbdrPsPqzj+xM
X-Received: by 2002:a5d:43cf:: with SMTP id v15mr6808330wrr.269.1601419499107;
        Tue, 29 Sep 2020 15:44:59 -0700 (PDT)
X-Received: by 2002:a5d:43cf:: with SMTP id v15mr6808303wrr.269.1601419498855;
        Tue, 29 Sep 2020 15:44:58 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.redhat.com (74.red-83-53-161.dynamicip.rima-tde.net. [83.53.161.74])
        by smtp.gmail.com with ESMTPSA id 76sm7666468wma.42.2020.09.29.15.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 15:44:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Fam Zheng <fam@euphon.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	kvm@vger.kernel.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	Richard Henderson <rth@twiddle.net>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v4 12/12] .travis.yml: Add a KVM-only Aarch64 job
Date: Wed, 30 Sep 2020 00:43:55 +0200
Message-Id: <20200929224355.1224017-13-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200929224355.1224017-1-philmd@redhat.com>
References: <20200929224355.1224017-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: YGqBD3Hb+gIR

Add a job to build QEMU on Aarch64 with TCG disabled, so
this configuration won't bitrot over time.

We explicitly modify default-configs/aarch64-softmmu.mak to
only select the 'virt' and 'SBSA-REF' machines.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Job ran for 7 min 30 sec
https://travis-ci.org/github/philmd/qemu/jobs/731428859
---
 .travis.yml | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/.travis.yml b/.travis.yml
index c75221dca3..cad65cf181 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -402,6 +402,41 @@ jobs:
         - CONFIG="--disable-containers --target-list=${MAIN_SOFTMMU_TARGETS}"
         - UNRELIABLE=true
 
+    - name: "[aarch64] GCC (disable-tcg)"
+      arch: arm64
+      dist: bionic
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
+        - CONFIG="--disable-containers --disable-tcg --enable-kvm --disable-tools"
+        - TEST_CMD="make check-unit"
+        - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-aarch64"
+      before_script:
+        # Only use the 'virt' and 'sbsa-ref' machine which don't need TCG.
+        - echo CONFIG_ARM_VIRT=y > default-configs/aarch64-softmmu.mak
+        - echo CONFIG_SBSA_REF=y >> default-configs/aarch64-softmmu.mak
+        - mkdir -p ${BUILD_DIR} && cd ${BUILD_DIR}
+        - ${SRC_DIR}/configure ${BASE_CONFIG} ${CONFIG} || { cat config.log && exit 1; }
+
     - name: "[ppc64] GCC check-tcg"
       arch: ppc64le
       dist: xenial
-- 
2.26.2
