Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp2498067ejd;
        Fri, 19 Apr 2024 08:59:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW+u32dA1SwQXzNJ9ND4u3terCoW7vmm8HDiIeabAMFGpkWG8/iAJaqfoK9OMSbBukXhPVD3P+Z607b7GtkgzN7b0y1cmxK
X-Received: by 2002:a5d:456d:0:b0:343:6b09:7551 with SMTP id a13-20020a5d456d000000b003436b097551mr1582103wrc.38.1713542399133;
        Fri, 19 Apr 2024 08:59:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713542399; cv=none;
        d=google.com; s=arc-20160816;
        b=gXustZydJZbVCS3jBOv7PDDjjFRj9y7Nmxjfjt/aiGTi7/vJA345xr8ythHmJEbPWk
         uC37IgtACVwdDCpZKWDlqu3qolQWhRnbFA2cNJRBj+p4aa3tpF/WMsRERya7Lc+TUcTR
         GiG3tbmbhsX7fhYUdt8XNZ+GvSs3F4SsWWdxgqSYqECxtDFGZafVFFrchiCbr4WP07Kx
         U/DoRUBNwR3Sr2Dky6XvYLH+3gP2JGR4DP2Ssn8Qigyxflkq3BcPsUchMkvvZScF/PQl
         vLs9UHJARrxs0Er1PusdMWhheV7fJ4bsVd9Bo6e3BLb3amhWpXSor7T+StICw5kBeN87
         hkfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=x3JoLPVQQvT5k1rWnbAuPJlJNM/iQBnM7RUlxuCBbcU=;
        fh=VtLZ0NeVPMyfldDvZyS85gJ2i/BAwcZDOoRFkiYtvGM=;
        b=RuW80znR+5LYdoPJ1r+nY2hvI9o+TnB7ZJ31Cz3ph3hyDdQI0lVCGNQ86kZwhekDni
         Dudy4R4xlq+0p7QSHcpQseGzrv38it09VOcWvhuMcmwQ+KF1ylXpN3qgPxBv7yDghwb7
         ytcynihqx2b0QQx5C+n8mjs388ce0aACxMeaTgZPvs8I5LuuDcdHOezWiwxTKSPl1Qrj
         1wky+wxiJmk2Z3E0yUSMeiXL2IvrWOXDOD79hY+LUcj2+IpLga+IgrTgiKk3tJWMujpQ
         SO4Xi6pGziCKOieomWzZKNnf5LSmiaeKeZyYUnzA/MixJjKoHipBXG9R7r3tYvQv/8uW
         nBkw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sqC8nrc8;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id s22-20020adf9796000000b00345e3ea155dsor1324006wrb.3.2024.04.19.08.59.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 19 Apr 2024 08:59:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sqC8nrc8;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713542399; x=1714147199; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x3JoLPVQQvT5k1rWnbAuPJlJNM/iQBnM7RUlxuCBbcU=;
        b=sqC8nrc8E6G0NCBVUKXRoT0WZ66dPPe35UEw/V2s3/KNSn/2jVa7LiG87Mf+OsmaVX
         GDj1Jj0IS1yFPOZnD9J8D1Rg9iPQhEtfMkl6tGxBv7fJ9j2IFBtPJPhXaK+rK0iO4mCB
         Y18Q91zKdDmFUQZLFB8iCaHRHtrhBtZjWdFOf8ylQA86QFpuxZQIF9k2xlnd+dMxY5hJ
         kVPPsJzjbHy3HCIdeS+/Xt/miMWPlP6wBYgDyXIEF4ZSYpHKgvmzSJT/uG6k7FN+IDcq
         J0DVz4hytd/Cv6ck5XAdN5ZxXzRD8MaAPwkgBgSMnKaNvqeexYw/Fkamr77eg/xZZYfv
         ZkqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713542399; x=1714147199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x3JoLPVQQvT5k1rWnbAuPJlJNM/iQBnM7RUlxuCBbcU=;
        b=WeAftoWXZJMlJk2V21zdI22M6mv16ZrgwrdTy01aRLk+xUkuGA+Cs/Z+swKB8j+XXW
         nBc750YJoBpNVOZuD/MLVWUnwKqarcRTxJfW6wYPGxGMpgRP2RzJphx28KXubg5ZZ/3b
         T4R8bVlk6TD8JxPAjmai4aCzuMk5gsWAgE2IvmqHH2AEIFPG+IaH2s2cBlDFN1lGl1E6
         8Is0ppAKHfaXuWvNYy/6JAfGQaCCSAiuGMQxzl4DpDdjDswRxMvatR0BIgyGbZWx3waQ
         ge9WvTyJ75D88aViiIhcQg6vv0QXc/z3/oNcydq6z1yQEM7c6dQu/g6dxH5V2kI8e6JQ
         eQnA==
X-Forwarded-Encrypted: i=1; AJvYcCWu8YA6r8cDb7e8lRePniGKRjWEoFNE2vcsL/WP3LmzJy4Ot7HkcPl7SbR3rHH403Lbhev927B2uovfqLbZ0iycmMyRDsLr
X-Gm-Message-State: AOJu0YyfScFzLlWfiZKloW2UnVVb6gAR93YUhQmbKAURAfCpagnbU0RT
	88fMMil4en+hfjZrnZPGYd8osD8zDRLxBJSjxS54GXwTPwjzqiZlueO/Nf7lNfly8Q==
X-Google-Smtp-Source: AGHT+IHnxptXvLJAPUL2didr1nfepWS4oCESmrqqIlU1k9RReNLLbvyLdOAWHLHwb9pBReExK6Cq2A==
X-Received: by 2002:a5d:628c:0:b0:349:cba9:572d with SMTP id k12-20020a5d628c000000b00349cba9572dmr1732749wru.54.1713542398799;
        Fri, 19 Apr 2024 08:59:58 -0700 (PDT)
Return-Path: <jean-philippe@linaro.org>
Received: from localhost.localdomain ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id p13-20020adfe60d000000b00349b73143e7sm4793089wrm.75.2024.04.19.08.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 08:59:58 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Cc: philmd@linaro.org,
	pbonzini@redhat.com,
	alex.bennee@linaro.org,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH v2 18/22] target/arm/kvm: Disable Realm reboot
Date: Fri, 19 Apr 2024 16:57:06 +0100
Message-ID: <20240419155709.318866-20-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240419155709.318866-2-jean-philippe@linaro.org>
References: <20240419155709.318866-2-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 8RUwRvqzl8Dy

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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 target/arm/kvm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 9855cadb1b..60c2ef9388 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -1694,7 +1694,8 @@ int kvm_arch_msi_data_to_gsi(uint32_t data)
 
 bool kvm_arch_cpu_check_are_resettable(void)
 {
-    return true;
+    /* A Realm cannot be reset */
+    return !kvm_arm_rme_enabled();
 }
 
 static void kvm_arch_get_eager_split_size(Object *obj, Visitor *v,
-- 
2.44.0
