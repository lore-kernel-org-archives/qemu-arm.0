Received: by 2002:a17:906:3fc4:b0:a04:79f0:9a0e with SMTP id k4csp149682ejj;
        Wed, 22 Nov 2023 20:43:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGgPbqgL6ySrgV50GSTNEwaDCnQrdEyZVpILVnm0euDPmTTVX+BJepoLGGTNRzsOFQb8u2a
X-Received: by 2002:a25:9192:0:b0:d9c:aa29:6180 with SMTP id w18-20020a259192000000b00d9caa296180mr3898006ybl.46.1700714602088;
        Wed, 22 Nov 2023 20:43:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700714602; cv=none;
        d=google.com; s=arc-20160816;
        b=JL430f5uUIW/AWS/nzXXuTsDRZLktHy2d7B9W6/K58WStIznL8UUyLQJDy0nYbNIA/
         H1uwQNbu8tVvSMFLRE5+C+7tsrhpLlaTZAm4tahK+MeSQh1TFhHz7Fota4GiiY1zEZpr
         ZA+tGL6hy0SWSL/HVqY+k/SwkWihzD8RntBJ8GYeNWdiVxPAUQRGzS9jFkimCwza96sz
         DY35DCFzWIwpjPpYlw0wv2YeF/w5W224KNwofktxMaIt/SKQ2FZn9WYQWPVZTtPDcQbD
         ry1c93fR6Hf7nqnKy4JGQleUHHv8iCs9NwXedW6Q1X+9qHQFdvZNMei4zT83eQRpdLRc
         CCuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Jov1TIQPq3PcKK+UAq7hY3OrlerxFsiiZxK31xZdzhs=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=Ni19u2GtAI1+kpwkbIszAxUo32qO+1349AnB6gEg3aLuL1kLeDQXcfLWTzrvb4aY8k
         43DaTjiEKKxAyvNKAg0fHnuGvCAGF5FpTpafBiMNfwQNiLxE/Uq4qauxR4aDXd1MR0M0
         d4qgKEu7lQ4YeDwnHnpYuE/Eo7+2+AsDD45k/8UwGYOzOrK52m1YsdHZSLjC1JTaRp/d
         I4ED0WlUjRJi9xHk+ePxN2DUoTgbhfVHn7WiczTNiiVVE6S/d2L+ygwVKns9nIgF018r
         7JMZPpapp4LOTK4IxSYbGFaa/qrIa5F5Nygt8N3PLSyzbs3OzN5F2RAlRUvAEDXmD3o9
         3YeA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Zf4oCIpr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u3-20020a05622a010300b0042383e1b9c8si430221qtw.79.2023.11.22.20.43.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Nov 2023 20:43:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Zf4oCIpr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r61Y9-0006U1-KX; Wed, 22 Nov 2023 23:42:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1r61Xt-0006MR-1x
 for qemu-arm@nongnu.org; Wed, 22 Nov 2023 23:42:34 -0500
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1r61Xp-00066H-L7
 for qemu-arm@nongnu.org; Wed, 22 Nov 2023 23:42:32 -0500
Received: by mail-oi1-x22f.google.com with SMTP id
 5614622812f47-3b6a837a2e1so325741b6e.0
 for <qemu-arm@nongnu.org>; Wed, 22 Nov 2023 20:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700714547; x=1701319347; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Jov1TIQPq3PcKK+UAq7hY3OrlerxFsiiZxK31xZdzhs=;
 b=Zf4oCIprXg7lz+h439gF4Jy9lbsVuL+f9Aw5nSEqWajgbozKr7tmXR3gaUTpZ/fB6H
 ZnVcmFKbgpmvp5vFqCOSICchFBLTIhmSXX7LRbc5pVohI3DVM3KBUcP7xOfsc9v3WxI2
 /2ZT8246Lzkc/6lCh5dYe2E5ZEh4ss49+HFzuZTBigIbGqU9R2GYS9INvPHLxSWxoIon
 qcEAOSeT8KlbFXDY1OISnQoF1XpUdyVfEWrNQSx7U1zpqxQc9XG8/z7sL40qzKl4zFmC
 GsbjJK+2iSK5MqCKFvUpBxQiPf+NAjgw8ObVXaNfHA/+bErWEzrGtbnXGr0XuVgUNtgP
 x3gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700714547; x=1701319347;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Jov1TIQPq3PcKK+UAq7hY3OrlerxFsiiZxK31xZdzhs=;
 b=U0vPZbLS89Q+XY7LIZlEQ3LbmtPlKIkRZpaGcmgmPKwMmB+I+p+otZ4NRDOhh/hRN8
 ky/U1WPGrKJXgmllMvdrwhYLsHdMvplnj/Brkxx1VSj87jyRszVaUYCSewApweQNH1hX
 5AY0MHDJP85EVKHf01QLH2gKWmqkDZBREfVS/Hd/I6aNkvKrmBjCWb8TUkyIDcC6pqA5
 UrYRRn3Km5QvNuhmm4fptT1xr0lQjmp0aUwy/lXwKlktE4uGRCKEcG+gikg3zRBXgc+y
 oADVv/zg4SthZlw7C893rbWubv/9H8yY6Tx8ECicEDDl5dfcDKJK9am+Z4RfyGE9xjdX
 XoGA==
X-Gm-Message-State: AOJu0YxbbsFRVOGixD33a4tqIYaRp8bdAZuiZJZH/BuQuYzs9J1s9RK9
 BdA06Uqtg3KjpQ0icZbJTluYbuAkRX+I/J9bxtr9OHbp
X-Received: by 2002:a05:6808:1719:b0:3b2:ef9c:d1b1 with SMTP id
 bc25-20020a056808171900b003b2ef9cd1b1mr6239417oib.6.1700714547604; 
 Wed, 22 Nov 2023 20:42:27 -0800 (PST)
Received: from stoup.. ([187.217.227.247]) by smtp.gmail.com with ESMTPSA id
 i7-20020a056808030700b003b8347de3c2sm73888oie.19.2023.11.22.20.42.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Nov 2023 20:42:27 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 06/21] target/arm/kvm: Move kvm_arm_hw_debug_active and
 unexport
Date: Wed, 22 Nov 2023 22:42:04 -0600
Message-Id: <20231123044219.896776-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231123044219.896776-1-richard.henderson@linaro.org>
References: <20231123044219.896776-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22f.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: 3i719PG7TmUY

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/kvm_arm.h |  8 --------
 target/arm/kvm.c     | 11 +++++++++++
 target/arm/kvm64.c   |  5 -----
 3 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 207b7f21b0..ac4856cb46 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -454,12 +454,4 @@ static inline uint32_t kvm_arm_sve_get_vls(CPUState *cs)
  */
 bool kvm_arm_handle_debug(CPUState *cs, struct kvm_debug_exit_arch *debug_exit);
 
-/**
- * kvm_arm_hw_debug_active:
- * @cs: CPU State
- *
- * Return: TRUE if any hardware breakpoints in use.
- */
-bool kvm_arm_hw_debug_active(CPUState *cs);
-
 #endif
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 2898e680fc..4608bea7df 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -1021,6 +1021,17 @@ int kvm_arch_process_async_events(CPUState *cs)
     return 0;
 }
 
+/**
+ * kvm_arm_hw_debug_active:
+ * @cs: CPU State
+ *
+ * Return: TRUE if any hardware breakpoints in use.
+ */
+static bool kvm_arm_hw_debug_active(CPUState *cs)
+{
+    return ((cur_hw_wps > 0) || (cur_hw_bps > 0));
+}
+
 /**
  * kvm_arm_copy_hw_debug_data:
  * @ptr: kvm_guest_debug_arch structure
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index ac3120adaf..352643e066 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -73,11 +73,6 @@ void kvm_arch_remove_all_hw_breakpoints(void)
     }
 }
 
-bool kvm_arm_hw_debug_active(CPUState *cs)
-{
-    return ((cur_hw_wps > 0) || (cur_hw_bps > 0));
-}
-
 static bool kvm_arm_set_device_attr(CPUState *cs, struct kvm_device_attr *attr,
                                     const char *name)
 {
-- 
2.34.1

