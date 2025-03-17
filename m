Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp2160918njb;
        Mon, 17 Mar 2025 04:17:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVkKHV7+BFH6Jtwy8S9X9S7g5WTlQpHbJwI0Da+mi1g3DTikb8fi3CxTvgyOB0CxG7aPmfCma/vLz1Zfw==@linaro.org
X-Google-Smtp-Source: AGHT+IGeNf3m0MxJslvCGHlonuj3Dn9HbdCx4DvN2K4aoLkJjju7Oscw/w/HYLawGntP50ZFrrIx
X-Received: by 2002:a05:6214:1c08:b0:6e8:97c0:76f8 with SMTP id 6a1803df08f44-6eaeaa65c0amr177192936d6.27.1742210244937;
        Mon, 17 Mar 2025 04:17:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742210244; cv=none;
        d=google.com; s=arc-20240605;
        b=VYkzhI6Fw/p0CtlzAIPTeH56ofId1JQpPofiWOikiO812DTXJyHGBF8nDtseFs+tad
         qVOnOfKwaeQIzytcWcDby6rbIvkDEpWTUTlWWd1uqNIhYfnGL9jDaI0aF/lT/KXVaNmJ
         KPVkwJjTioMjG+u/ckaJd9X70WEsHoiTmK2grcvL3qyeJq9OQVs+h3wBBV0mJNOd0Cc3
         e2SYf4O8lqJNzgNQcV6iiZErzz2TPbnleJhxzsFnFAMbRdjv5yT8L0atpmV/aQ0RM84z
         NsEtziAxwe46w3ydF/9zXKX+gsRMWvLzLW9e4AnMbtwhGmkSBs5mG0rmOIOByiR6e8Sr
         4nZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:in-reply-to:references
         :message-id:content-transfer-encoding:mime-version:subject:date:from
         :dkim-signature;
        bh=nvZxXJ1GvFvx4INbCk9ERB4VBpXlB9W+lCDR6eWj6sU=;
        fh=wnuv7w5P59iPptp55xIrmneJU+96uYLRYHNRt4nUg4g=;
        b=EuME2qlWn5BzMu+19CI2t8K3fz/whNP4GXvKOD0XInrYbuc6N3ofraI9KvJ/Sb71I8
         +WRrC/3riNlUXWkRDwkY21pezY7PCh3RpmoUfi5sSF6O9Z7KxKWY1ZDJxcti6qsq0zV1
         AkH0pNGSpZ9+tZf6onwhDmmgp5C/HQIvN9GvU3zCGMOoEjPn1bDrP9z3aawHlij4hw5/
         uEUsHVP2Mim9yNYfpcrFy2LsUpJ3IhTlKNXZGbEkRx1xSTxiRB6LkuoakTaWDAUjA82H
         iVNZizHK7UUPsmHzOU9Pb0Kn4vFJZgo26s34am2xecgnGxPfACC1x82Ojsp9LsJ1Do14
         ULrw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=H+T2cYL7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6eade1db199si98586276d6.19.2025.03.17.04.17.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Mar 2025 04:17:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=H+T2cYL7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tu8Sh-0003Gd-VR; Mon, 17 Mar 2025 07:16:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1tu8SZ-0003Dk-Os
 for qemu-arm@nongnu.org; Mon, 17 Mar 2025 07:16:43 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1tu8SV-0003lB-Hc
 for qemu-arm@nongnu.org; Mon, 17 Mar 2025 07:16:43 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-224171d6826so27816635ad.3
 for <qemu-arm@nongnu.org>; Mon, 17 Mar 2025 04:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1742210198; x=1742814998;
 darn=nongnu.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=nvZxXJ1GvFvx4INbCk9ERB4VBpXlB9W+lCDR6eWj6sU=;
 b=H+T2cYL7X13cQy/ILr0gZ4ommCJzEMgEryES6tKL7Dn+OizwwbEv8Ms6JolnzPF5O/
 6oIBNlydBU2i9RtDRyrs1DVEOp4nXa/kqiFk0MnvvrEXNl+YuwWmSpF66mIbsl2FD+af
 G5SRolE4add1EYVN8Z8kZhXW3Ebvi8hYY+lmm8gvS5IIhcr2axdZt5M1j09ZqSU7BEby
 FXY/1dLT4CVcE9lUVfZ6Ea0mT6sABXQkqRu/ugf7qEkn96kF1qEy7v7zqj0GpACY79I5
 FGjswFqhYyqPBPiZG1AJYPwdwVb1JtrybxJgB9SaDF7mDJglWSz/xdhXPC7CQZIaZM7o
 7/rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742210198; x=1742814998;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nvZxXJ1GvFvx4INbCk9ERB4VBpXlB9W+lCDR6eWj6sU=;
 b=h+n3KXzBIq/cnGp0lmlMzITuXb7qeNuD/WUctAXYJPlbvvdhGzup9HNYJu3EJrPjMh
 eNZnRq4E9UfpsR5U0tPXU+bvcTIJb/7wefDzi0h1Gw5i2wHSs2TG4PFmQ70gMRWzJxGd
 Bdze7DO9cz/EwTG2W9FbS3mhfgxEmiFin7nOakIsyyaoFVX28wLASyHaRhQF/9CA1Xkr
 52GnMt4cI4fIUm0kvRcsh9szwz3hs45lQPaOOqdqBDXW8wsGKnbtfOMxBqWQHCcSkaNI
 Pd/Xw/JwKRHcHrkxI6JJVo7GiqcTHjnpbfVLrPyJppUF/rjPHE31agUzJ1yKHZwEZ2lK
 X11g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyQFqfbdlzkjw4+xrTA8fKJHZH/ojra3E0cqkOAHVIMBWDw8RbUhIo6NdxxFnTonVlqZ4UYZt61A==@nongnu.org
X-Gm-Message-State: AOJu0Yy+mOkho2Y8cghAf1ZgvqfPRp8zkDC8EdfrzLrQChCAF/zpBbf8
 VSt+i5VJ6JMApJqouyQ5hSRh1M6QCEcRwX7uSZk4aLAJF+MAjHoNKM9UuQ1gJu4=
X-Gm-Gg: ASbGnctXQY87rsJgXZjFNsK8rqXVeK1JX42jFrDAD6mVc0P9DwL6MngqQCiZhLVnQ/s
 AXH1n7jCBa8T1FzQhs3iiv6SYVoFxgS46ZVetV/Kxcr5DURlN5j92uElXobyFhngLgwu6bdm/aW
 klihIwnml7qdLd8yPCSdOIsPquAN9xpZMUwg1b73+2651P8gwH5Ee5TvRIsYmvYBRCOJzNBhl37
 npH6VvlcXZ65KR+ebxlG3Wo4gaAUeVzRk0D04JwRUNPLr+f8MfMT2tr3H65eRkwqWC522590zB5
 B+Mn2Kys1Y7LpX6IKKAu5IQkolIT2ZEPvjsNUV0XsmH3TSXG
X-Received: by 2002:a05:6a00:4f82:b0:736:3d7c:236c with SMTP id
 d2e1a72fcca58-737223b9711mr13501161b3a.14.1742210197806; 
 Mon, 17 Mar 2025 04:16:37 -0700 (PDT)
Received: from localhost ([157.82.207.107])
 by smtp.gmail.com with UTF8SMTPSA id
 d2e1a72fcca58-73711694430sm7254565b3a.122.2025.03.17.04.16.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 04:16:37 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Mon, 17 Mar 2025 20:16:23 +0900
Subject: [PATCH 2/4] target/arm: Do not imply ARM_CP_NO_GDB
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250317-raw-v1-2-09e2dfff0e90@daynix.com>
References: <20250317-raw-v1-0-09e2dfff0e90@daynix.com>
In-Reply-To: <20250317-raw-v1-0-09e2dfff0e90@daynix.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
 devel@daynix.com, Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.15-dev-edae6
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x631.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: xUVBXBhJhdKm

Do not imply ARM_CP_NO_GDB when ARM_CP_NO_RAW.

A register without raw access support may still expose some state to GDB
that is managed by something else.

A register may its state with another register but may not be used for
either migration or KVM state synchronization. For example, a
multiplexing register cannot support raw access. KVM may also have
a problem when synchronizing a register.

Such a register can be flagged with ARM_CP_ALIAS | ARM_CP_NO_RAW, but
its value can be still exposed to GDB as it's usually the case for
registers flagged with ARM_CP_ALIAS. ARM_CP_NO_GDB should not be implied
in this case.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 target/arm/cpregs.h  | 8 ++++----
 target/arm/gdbstub.c | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index 52377c6eb50f..99e2afc84250 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -75,10 +75,10 @@ enum {
      */
     ARM_CP_IO                    = 1 << 9,
     /*
-     * Flag: Register has no underlying state and does not support raw access
-     * for state saving/loading; it will not be used for either migration or
-     * KVM state synchronization. Typically this is for "registers" which are
-     * actually used as instructions for cache maintenance and so on.
+     * Flag: Register does not support raw access for state saving/loading; it
+     * will not be used for either migration or KVM state synchronization.
+     * Typically this is for "registers" which are actually used as instructions
+     * for cache maintenance and so on.
      */
     ARM_CP_NO_RAW                = 1 << 10,
     /*
diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index 30068c226273..4459e90811b8 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -270,7 +270,7 @@ static void arm_register_sysreg_for_feature(gpointer key, gpointer value,
     CPUARMState *env = &cpu->env;
     DynamicGDBFeatureInfo *dyn_feature = &cpu->dyn_sysreg_feature;
 
-    if (!(ri->type & (ARM_CP_NO_RAW | ARM_CP_NO_GDB))) {
+    if (!(ri->type & ARM_CP_NO_GDB)) {
         if (arm_feature(env, ARM_FEATURE_AARCH64)) {
             if (ri->state == ARM_CP_STATE_AA64) {
                 arm_gen_one_feature_sysreg(&param->builder, dyn_feature,

-- 
2.48.1

