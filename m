Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1232617ejc;
        Fri, 27 Jan 2023 07:16:07 -0800 (PST)
X-Received: by 2002:a05:600c:3549:b0:3da:acb1:2f09 with SMTP id i9-20020a05600c354900b003daacb12f09mr37027008wmq.19.1674832567668;
        Fri, 27 Jan 2023 07:16:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674832567; cv=none;
        d=google.com; s=arc-20160816;
        b=EkuQHzLyCjvQELP26nrfWe/S1c6Ge1A3uc4ZMyfsqT3xgr1qaEvQJSbxaRIQMa0/UV
         oYXFBE+MZCc2PZKLLwAcc8kifs5P6p10MV4W2uBVNEU+2k6DjUGWz3vk+tLW8npq2UF6
         RGVcrPAjPxc1Y4GVv5my3sRADLiXi6FA12Eh9lG7dtGyvrwDvvz1oPXKgPQpFDQ1akjX
         Uuw+txjLtQANhmZAE3JlYk7HIgmBp7flowAyuSncat6VPFoMG+f9oLw4AyeWhzroeIsL
         mxRlQwx2pV8onoVmqYHJeNHU5cbClgpkPyb3Z2wUiWTKLMh2j9QMpmHqK4OtXO4XZSjd
         2Vbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=iUGz5LpQ3EDL/VJ3l1j+YJ+y/POf2GoDlmEHrO+uK2A=;
        b=039YanEhNTXLsCVnJbeJBUjxMbzOnMTY7JRARCd5C/o8iuCYm2dAfLwLCGgR1rYKh4
         n4S2vrChbuqX40GQjGZFu0cDRQ/c2AFJQJA1T6JuX6VurrOFubIg5jk1EMoN480Qut1q
         clHvc7TvGX41Zz0psbNU8WVQGCW8tNxxBrtnS+g7VCyywAJme5uOUHqC16NacUirKsef
         sYz9nf6Fhlla3oYGL/ScDRAar5txKV7yMpD3wEzpxvMz9mt8S3Kc/zQdeRCnshqXu2/Q
         IQtrAr/+xgY9XJHnWNbbWKUp24Fy4ATuaQYPqdONs1zkV8wryv+JxmiFck/DKWJWUYoS
         HThA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wXyJZGPR;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u15-20020a05600c440f00b003dc1b9c3eb9sor1560560wmn.1.2023.01.27.07.16.07
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 27 Jan 2023 07:16:07 -0800 (PST)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wXyJZGPR;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iUGz5LpQ3EDL/VJ3l1j+YJ+y/POf2GoDlmEHrO+uK2A=;
        b=wXyJZGPRtmBDbVtTRWtQpdOWsoVhXY8Xn/2X3IF+mR+L8+eJcOAYqOy6PKvxnuh9hk
         SxHS1tLb37F0Neh5H+FgpqZ65Yhgxf8rpEwVVY6SrVhyhdBmq8hP1ptHr9+BhGB+Br1J
         /5sitb2htqalTdGWN06JCHHi5gSusbW3f+kMP30VIYea0vk8Nqo/nGBt+LKDW+sEBekB
         VF4Fy6oK1OEbWiW3hz/59KN78yVAVtg45HuttMnOhGVOkwWDfx0v1TBs0W5ULmIjyRhq
         QDJ1J8nEe1bCqoN8pN9uaYbG0pWFOQtuvrneRYL51xiad/t+yNWFxCSycrLCWTXBfF7Z
         QVDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iUGz5LpQ3EDL/VJ3l1j+YJ+y/POf2GoDlmEHrO+uK2A=;
        b=NBvtiFxd9TRljvDjIctY9hq2FdvTbl8sTkGOjvxYimC122rSobN8btPWj69elzeGdT
         0sqgUqlASgSBdrZNNiMw9rv74lTLTofob94UZTNxRddJUOJ/YUDtfwMXcsRJVIb+Sg3m
         Psx2CsYbodfz1EYK05a6wOf0mOusHu08uX0RDkf3YZnUy4bH/RUopqvXAT2AJB0rxbYC
         UPIQPX0qXti3cs52gV03jh/lqpDU4xg/FuJnfnE4kkDztZ0Il/845Cfau9xOkoL8SPd8
         jrUZ8QClb7p/JxYtA/N5jtUag8sVtzhFEzzUzYZRyaOCZvI5mbf/EcVjj0Cgnelsd7Qa
         aMZQ==
X-Gm-Message-State: AO0yUKWl2S/0uONG420iIIhnSIPyfsgPxVlQ3XB3CJxQdBpAW3W7fs53
	IhQdr211u2f/yH4o5SCCS8iUVDbF
X-Google-Smtp-Source: AK7set8gfQYjQ+GYxO80U7CUehAz2XW16FvZhYy4OJlItng3MUCW4ws9HcFwY3tNs5fcwHLaGW+Ubw==
X-Received: by 2002:a05:600c:198d:b0:3dc:1031:14c4 with SMTP id t13-20020a05600c198d00b003dc103114c4mr14786447wmq.14.1674832567445;
        Fri, 27 Jan 2023 07:16:07 -0800 (PST)
Return-Path: <jean-philippe@linaro.org>
Received: from localhost.localdomain (054592b0.skybroadband.com. [5.69.146.176])
        by smtp.gmail.com with ESMTPSA id l7-20020a05600c47c700b003dc3bbdf518sm1656628wmo.21.2023.01.27.07.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 07:16:06 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	pbonzini@redhat.com,
	eblake@redhat.com,
	armbru@redhat.com,
	berrange@redhat.com,
	eduardo@habkost.net,
	alex.bennee@linaro.org,
	richard.henderson@linaro.org,
	Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [RFC PATCH 15/16] target/arm/kvm: Disable Realm reboot
Date: Fri, 27 Jan 2023 15:07:28 +0000
Message-Id: <20230127150727.612594-16-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230127150727.612594-1-jean-philippe@linaro.org>
References: <20230127150727.612594-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: FtR8N/XR+5Ey

A realm cannot be reset, it must be recreated from scratch. The RMM
specification defines states of a Realm as NEW -> ACTIVE -> SYSTEM_OFF,
after which the Realm can only be destroyed. A PCSI_SYSTEM_RESET call,
which normally reboots the system, puts the Realm in SYSTEM_OFF state.

QEMU does not support recreating a VM. Normally, a reboot request by the
guest causes all devices to reset, which cannot work for a Realm.
Indeed, loading images into Realm memory and changing the PC is only
allowed for a Realm in NEW state. Resetting the images for a Realm in
SYSTEM_OFF state will cause QEMU to crash with a bus error.

Handle reboot requests by the guest more gracefully, by indicating to
runstate.c that the vCPUs of a Realm are not resettable, and that QEMU
should exit.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 target/arm/kvm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index d8655d9041..02b5e8009f 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -1071,7 +1071,8 @@ int kvm_arch_msi_data_to_gsi(uint32_t data)
 
 bool kvm_arch_cpu_check_are_resettable(void)
 {
-    return true;
+    /* A Realm cannot be reset */
+    return !kvm_arm_rme_enabled();
 }
 
 void kvm_arch_accel_class_init(ObjectClass *oc)
-- 
2.39.0
