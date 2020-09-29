Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp4986440lfq;
        Tue, 29 Sep 2020 15:44:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxiYB6lBjFUvGRJbVyGjjrxb6Fo+xl5ZFiofJC7EwN+McMJrH8Jvo+9WVbLyIcBQA9M+8rl
X-Received: by 2002:aa7:d35a:: with SMTP id m26mr5489165edr.183.1601419498080;
        Tue, 29 Sep 2020 15:44:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601419498; cv=none;
        d=google.com; s=arc-20160816;
        b=qUTHzdQt/47jU32neTcc+lU8Fu9g6x1h8ezDSQ5q7Hpyn2+n2o/bmXFgIMen6lTBqz
         SqvU3r11xjOTNXWFRfPMdnATVE/iAXSwT0N2XTyxeuG5djXAQV5XXXORdEie7LdFG7dX
         G3hr+tYfBcEKAQcv7Yr0BUcm8G9y5/SiUm6QBOn9RZ3dTExTE3v0jDU4FAlWELBXqdCX
         uNo0+iUEPSjUH29qBbjI9g2zl1+DvAVJfWWkm6YjiFgolDngxXjrU/gmtFYM+aktaIXz
         0/cH9GpZsJi6F2Edh5QcuMvqvEJdWSlnc7IGGnF9WLrfRKx5tWgGyNaW80kfSK/YZD2y
         j+ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=mwQAv7GT5EoZ2YwHLMCVUEVsXLr1pwlweOoW7BxG2J0=;
        b=dUPzoTOeNhT/2tvcA5IlMd1hJTlXkgUm3h4bozvhSA9Gl/Cp1mmInm6/SoDmLQSCIN
         pLkNeqMi0z/KVFDtbujhdNC3YxkyAzF3mAbWWgt2q4giHK8ifPqvPEMPGgkqg8F+BgLt
         jCHSw+JzF8RbguM/6H1O/cfh3Ql9tPq+zygZXnicT1GVQpNncj+olEea1L5zC8gsk2qy
         mRQ5YxwaSqH7a08PdxPwfgGZRwoQxd/47iQA7it+ggakMLPRrBANJEXyZdM9LBRbhIPn
         xYaRUVELDxz3uQ8m9G5/D4Vs33t0uh1/tvtOxrta5MA8Hb5rAyec8razXju7dKhs1FQe
         iu7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SVGoPejg;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id r1si3306510eja.274.2020.09.29.15.44.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 29 Sep 2020 15:44:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SVGoPejg;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1601419496;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mwQAv7GT5EoZ2YwHLMCVUEVsXLr1pwlweOoW7BxG2J0=;
	b=SVGoPejg+bie8mbth1G5nm1BuvywCCMQlBwene5VCwFe1KD//ysh2MDbX3queh7o7JJVi1
	nHKWiBY0LGYiJJrdpJXRx1ctNTry/FLLPT26dEfd06PBsOhcjN5ik2IH/8ck4qFEXuPdeU
	OTF5KWJVkOfpbq9dEyOLwMCILOGaO10=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-MER8FHVHPFqb65bCOnm91g-1; Tue, 29 Sep 2020 18:44:55 -0400
X-MC-Unique: MER8FHVHPFqb65bCOnm91g-1
Received: by mail-wm1-f70.google.com with SMTP id m19so2416380wmg.6
        for <alex.bennee@linaro.org>; Tue, 29 Sep 2020 15:44:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mwQAv7GT5EoZ2YwHLMCVUEVsXLr1pwlweOoW7BxG2J0=;
        b=RoiYbrlt5nE3jsUaKXw0mIcZ+BhdR0vsZbA8+Afmo3Usk8ikzunIh5PXDwKeFRc41d
         JpFCGD7c7nxYvNTHJP6ffGTCyHVSiov4lUHu4v6X89WR2jCReTPWpigvUIHRHtRSWyN1
         If6s0vRYx5DgpAV/9w/nwH17Ex83q+ppw8kSq2muckonFjICmqc75kNLpLhaHog5XVBr
         puqKQMPr2yqcQrIZWWWtOhPQPIdEtXv6axWBaCcQmBDmVQf4RIOny0AFHNq+NygYD/Bm
         4R8UAQVAvGfH0GaAr8tmkGJimhvlSLnYcB1g8KtHBZSW2rthBCA3z3ye+qoAiTDUp7ou
         NRwA==
X-Gm-Message-State: AOAM532MdiWg2HZKMN3/ULJHzy9mqo+U9Qr+n0M4EXG5mb19yioL+PKA
	h7+UzG4kK5Khtr7kV3sewmanc3v7yKu88WzbPmiuEl4d3flQ6GPbPqmVXztN/05vUnQ99Wo/Bcu
	yVU1LcUurWEhddKjn
X-Received: by 2002:a5d:680b:: with SMTP id w11mr7120260wru.73.1601419494004;
        Tue, 29 Sep 2020 15:44:54 -0700 (PDT)
X-Received: by 2002:a5d:680b:: with SMTP id w11mr7120247wru.73.1601419493850;
        Tue, 29 Sep 2020 15:44:53 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.redhat.com (74.red-83-53-161.dynamicip.rima-tde.net. [83.53.161.74])
        by smtp.gmail.com with ESMTPSA id u66sm15214592wme.1.2020.09.29.15.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 15:44:53 -0700 (PDT)
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
Subject: [PATCH v4 11/12] target/arm: Reorder meson.build rules
Date: Wed, 30 Sep 2020 00:43:54 +0200
Message-Id: <20200929224355.1224017-12-philmd@redhat.com>
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
X-TUID: sBsrsirwFiEA

Reorder the rules to make this file easier to modify.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
I prefer to not squash that with the previous patch,
as it makes it harder to review.
---
 target/arm/meson.build | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index 9b7727d4bb..341af8f2ca 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -14,6 +14,7 @@ gen = [
 
 arm_ss = ss.source_set()
 arm_ss.add(gen)
+arm_ss.add(zlib)
 arm_ss.add(files(
   'cpu.c',
   'gdbstub.c',
@@ -21,6 +22,13 @@ arm_ss.add(files(
   'vfp_helper.c',
 ))
 
+arm_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c', 'kvm64.c'), if_false: files('kvm-stub.c'))
+
+arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
+  'cpu64.c',
+  'gdbstub64.c',
+))
+
 arm_tcg_ss = ss.source_set()
 arm_tcg_ss.add(files(
   'arm-semi.c',
@@ -35,26 +43,16 @@ arm_tcg_ss.add(files(
   'vec_helper.c',
 ))
 
-arm_tcg_ss.add(when: 'CONFIG_ARM_V7M', if_true: files('m_helper.c'), if_false: files('m_helper-stub.c'))
-
-arm_ss.add(zlib)
-
 arm_ss.add(when: 'CONFIG_TCG', if_false: files('m_helper-stub.c'))
-
-arm_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c', 'kvm64.c'), if_false: files('kvm-stub.c'))
-
-arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
-  'cpu64.c',
-  'gdbstub64.c',
-))
+arm_tcg_ss.add(when: 'CONFIG_ARM_V7M', if_true: files('m_helper.c'), if_false: files('m_helper-stub.c'))
 
 arm_tcg_ss.add(when: 'TARGET_AARCH64', if_true: files(
   'helper-a64.c',
   'mte_helper.c',
   'pauth_helper.c',
-  'sve_helper.c',
   'translate-a64.c',
   'translate-sve.c',
+  'sve_helper.c',
 ))
 
 arm_ss.add_all(when: 'CONFIG_TCG', if_true: arm_tcg_ss)
-- 
2.26.2
