Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp4986069lfq;
        Tue, 29 Sep 2020 15:44:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz57cjpj+sYjsr3bET10tWC9en8ok09D8MpCpn1VfXx3GvlBrXmJ/QMoIpDH5+H8gioAskM
X-Received: by 2002:a25:6887:: with SMTP id d129mr9747558ybc.434.1601419457130;
        Tue, 29 Sep 2020 15:44:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601419457; cv=none;
        d=google.com; s=arc-20160816;
        b=n96ab0kz8ZSLzV3kiSseLRMmhmJnIoEbWWgxQ7Kra44N3BvRJEkffL4nxgApfGYxj2
         izrMEV0w+Ze9rN7Zb27P8Hj02WU5UVQNDrDQ+8ExPLzl5QFrbwKYWR1TwWgNvskumx85
         OlpHqdwEcCiAO3qUyNsufyaXFAMW4q/5R7j50+d2Ynd4w5TpNvy410qdZGS5Oz2MlnNP
         JllPVtQTSyn1G4/qyy/334VddbIzfFDf5iwCR/zw/5uHLFkuoX4m6rq4GvVlbksIsnHk
         NBir8sIdxuWxs/vWM+Ba+DWq5zTynhg+PJam1iAZVq7HPPrW0uoma1ABkRagCVFJ6ioD
         y/oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=fVtzhoPQ9oRe5A4whgi5/tX3r24KuxvOyig0n+4hw6k=;
        b=e12SIx9YRKAnOfV5NoAsE5Q8esLC7AZ6WGX02U8wft4aqtQK4b3tqKBRuzearwSsZL
         68lzdgaWd6aoHIkkewPt086PMfbLehGsA6tdfl1ukWIS7lBzykUMPH9Xd+9Eh6QCjD3+
         762+4CXOCl8fl6Vpd0K4Yqa6rDzOv7CLuAVUNulqgFHgKZwunHp+EqE3gjRmPTbA76Ub
         K0QetdBJlNl3w5nkdAo2qVDx6Z6+u6u/vGSKwnrAsBJRLhMmWtKvDLMv/A0NLiVuJiJS
         N9oJLzl2H4EpUyHSgw1+fcoWtxx96sNw8F/MCWEahheZPGSbiLUOSbRyH7KK67Y6LEnB
         sbBg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aBF9pNrH;
       spf=pass (google.com: domain of philmd@redhat.com designates 63.128.21.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [63.128.21.124])
        by mx.google.com with ESMTPS id w4si4905084ybt.392.2020.09.29.15.44.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 29 Sep 2020 15:44:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 63.128.21.124 as permitted sender) client-ip=63.128.21.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aBF9pNrH;
       spf=pass (google.com: domain of philmd@redhat.com designates 63.128.21.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1601419456;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fVtzhoPQ9oRe5A4whgi5/tX3r24KuxvOyig0n+4hw6k=;
	b=aBF9pNrHMqQNbow0wsE4Sz6MQ4k5OJ3SFX2z4J9nq6w4cwFI+dBPFoS18bZoyUAuaYx5Hd
	eKWk2fUvsU/LGbbeoPrmoEMEPHebKtMU6PKl723UTEsVPJrDN4g5ZvZwOSaogEWLtLAnQG
	QnbV45rzO8k1irs2wQ8cgtzfrEl2f6g=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-584-c8sCsAfyMvibSB_e946CoA-1; Tue, 29 Sep 2020 18:44:14 -0400
X-MC-Unique: c8sCsAfyMvibSB_e946CoA-1
Received: by mail-wr1-f69.google.com with SMTP id b7so2359593wrn.6
        for <alex.bennee@linaro.org>; Tue, 29 Sep 2020 15:44:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fVtzhoPQ9oRe5A4whgi5/tX3r24KuxvOyig0n+4hw6k=;
        b=rFNNuUmP0V6MYwxRwb0S9qqyvTPakwoAqY3RpxkWj+UIH/fZexSVmaQsNqQBL68rT+
         f2ZNx1BehNTqri2Bk4kkdklHZEKDGhNwih3V29AcybNI1t2ECTCu1w5o0h8tjftYTGgd
         b49qrzu4rP+8nxSR0JfBPy9YEkNltf418NPrkTm1NFST2xRTuq8/Shzoo3ZHk/JCjVI1
         uRu+JJc6aNeDfVlwrPrOBKfnf9mfmo95D8FE1AaUNpiMFYeyUn/1t9Oibh9Qjf1Wusj7
         /Vf0Nrq04EmCF8CDgR/jcBwtugiPeD17UgJIjXJ76+uTQxIZPjs0SaLUUJILxwMai+dN
         EZJg==
X-Gm-Message-State: AOAM532YozqaBi88G/DaxKx1rcqrrKDDhInkOtci/dOrky9g/PnA1IN8
	lKN14dm7puC/cGq1sdiudf1Fxh3JCMzn+R9kj4tbMYcvnr1JVdtsemxcO346NIzp++9l57Lhb5w
	EORcCCXyR8hsJHkAL
X-Received: by 2002:a5d:5261:: with SMTP id l1mr6619431wrc.193.1601419453411;
        Tue, 29 Sep 2020 15:44:13 -0700 (PDT)
X-Received: by 2002:a5d:5261:: with SMTP id l1mr6619416wrc.193.1601419453250;
        Tue, 29 Sep 2020 15:44:13 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.redhat.com (74.red-83-53-161.dynamicip.rima-tde.net. [83.53.161.74])
        by smtp.gmail.com with ESMTPSA id l18sm7902646wrp.84.2020.09.29.15.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 15:44:12 -0700 (PDT)
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
Subject: [PATCH v4 03/12] target/arm: Select SEMIHOSTING if TCG is available
Date: Wed, 30 Sep 2020 00:43:46 +0200
Message-Id: <20200929224355.1224017-4-philmd@redhat.com>
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
X-TUID: obiRAiJ7bwFs

Add a kconfig entry which not explicitly selected by another
entry, but which selects SEMIHOSTING if TCG is available.

This avoids:

  /usr/bin/ld: libqemu-aarch64-softmmu.fa.p/target_arm_arm-semi.c.o: in function `do_arm_semihosting':
  target/arm/arm-semi.c:784: undefined reference to `qemu_semihosting_console_outc'
  target/arm/arm-semi.c:787: undefined reference to `qemu_semihosting_console_outs'
  /usr/bin/ld: target/arm/arm-semi.c:815: undefined reference to `qemu_semihosting_console_inc'

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/arm/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)
 create mode 100644 target/arm/Kconfig

diff --git a/target/arm/Kconfig b/target/arm/Kconfig
new file mode 100644
index 0000000000..972d9a1b9a
--- /dev/null
+++ b/target/arm/Kconfig
@@ -0,0 +1,4 @@
+# arch-specific rule to select SEMIHOSTING if ARM && TCG
+config ARM_SEMIHOSTING
+    default y if TCG
+    select SEMIHOSTING
-- 
2.26.2
