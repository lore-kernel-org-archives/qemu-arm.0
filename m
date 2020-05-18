Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp3089537lfb;
        Mon, 18 May 2020 07:30:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx4IabBlmp5zxCA7TGQOYt0Lxe+qSQB40ZRrP8RHv4D5hr4HmFmNWxSlctZVRMocctvVWBv
X-Received: by 2002:a37:7086:: with SMTP id l128mr13524777qkc.61.1589812251681;
        Mon, 18 May 2020 07:30:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589812251; cv=none;
        d=google.com; s=arc-20160816;
        b=QuWKW6pplYZv4r70UrrGiTZAFaAXi9jipNpO0j5QHht3o99Hug8niU/yKjOPeqZOpC
         xYYLI2vVc/daELLNg/NSCJXMzojwSJK9Hr1GjOpzowOrmShUXGvNi5EU+WULXwmMxOE8
         QggnVFzAA/RLO+bmPvN7X3P8AalcBlQeSQ6BmajzfOqdmbmLN87i439zt8qcJqFhySy7
         HxRPArJ8Pj38Csc8f0tNOY6HVDRzIN8yTpYjCqtMGKtzA/ve1XG8J8e1EIXUbXFrELgv
         vggoNoV8MxKVgTZSDZSWoBx+fPJNUuFUTWriMx0oqcc2JBcsrjPkd2uD9J1kapII6IeZ
         T0/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=8TBzzcsFazlljQPoOpAMIzgSdLt0n2ByqDt37jz37+s=;
        b=Za919gMaq355qYLmOqD6PTedMpfsj/1Isuyy4FbKSGawGwwvMjpSQbt97lUzJ1hEs7
         PO0Giw8OWcR0dhBVZ3SmU6nAPZG8Wb1f0SBYON7UPwNkjn4bDsSWOW2DamlOEPwOI4AU
         IkJkkQ2a5gIixQfbuQX1Jekm5yb0oGYpGjVE2qeYuhl5hUIjtIH9faRACb3ALRKX3UAb
         N7PE4MaYzrFlqIhEIT0jTHcQ1eLQd0qsVxJip39ZWPwWPPk3Q8iEHrv+1YL7lT1FN1uV
         g01acpBmas8Qh/BhfUA9WMZaVQulgI1KYoOe2lJ879W75XGW3ZPJVHSiUM8cK7jgHtRI
         P1XQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rD4snTRV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 1si5741701qtb.18.2020.05.18.07.30.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 May 2020 07:30:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rD4snTRV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jagn4-0004ge-Vq
	for alex.bennee@linaro.org; Mon, 18 May 2020 10:30:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jagmb-0003uh-7C
 for qemu-arm@nongnu.org; Mon, 18 May 2020 10:30:21 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:34246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jagmY-0001Uw-SK
 for qemu-arm@nongnu.org; Mon, 18 May 2020 10:30:20 -0400
Received: by mail-wr1-x441.google.com with SMTP id y3so12166448wrt.1
 for <qemu-arm@nongnu.org>; Mon, 18 May 2020 07:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8TBzzcsFazlljQPoOpAMIzgSdLt0n2ByqDt37jz37+s=;
 b=rD4snTRV3Wwn3W3X1jN40jdKx5l3FCSpwB7/3dBRSKfHRpcCf67NZFaz9DbiLFOE4P
 t/Vry0Kf3vdMl9+zMMBvFkehxo6KD7umFIltUk5k+APjCnaZ40zGKfyR2ls8KnHgO0Nq
 J/wUf2498NYLLUYOv+kqe+AiBd3ki/72QyBJcMSEBGFHNyvy15ql7URnbhuPCaT4nEY2
 Bl4XNl9de1w1IVCiEpGbCaoVUzLXSQRK0ncL0e4DRlGPrFDck7KJzX5QGMs4MVQdbcjx
 avPjA0fkwmxgIbzJ2iFbEpa0opGAp7m61ps7OM6Wp1B7mgkjye+1MSUuIDTWN2ouATo9
 f39w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8TBzzcsFazlljQPoOpAMIzgSdLt0n2ByqDt37jz37+s=;
 b=DjWBG/ltujVChr9SAcAK+GB75XdZVzRivQKiYmpXxpUZsui67/F5v0XHuRYg6mvdEZ
 ci/kNbvRzGBjDrQJJvhffCzsl5/1UPfGm4mnNII4iNiNoDeuJ7v9bCghhnS0Xzmrunx+
 jBVlKAH9qJWM119thrERJ/M/6K5nHnFKm+12IBvXPSLl57VEz/vcVqxX23hqzWn64DIQ
 vsPE4OzmRjxz0qOPRqR71fjAtH8xbtrg/TrEfMVGG16K3X6FBP/38yOlifPqcvDoY/yV
 T3+JsNVyNBbl1D4iQu4y4qg+msYzok+A4SNMYB3GldgXhAwczRhlkQp5oTLR5JNcUt5T
 UK7g==
X-Gm-Message-State: AOAM532nG+VYLhRpZgUPqPww43Czf428uPCblSEFYXbaHWaTpG4VTUYV
 /LWkzzmKKU255ELcnjgZwqlMrb9YFm1QpQ==
X-Received: by 2002:adf:c38c:: with SMTP id p12mr21142380wrf.357.1589812216950; 
 Mon, 18 May 2020 07:30:16 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id x24sm17756487wrd.51.2020.05.18.07.30.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 07:30:16 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] linux-user/arm/signal.c: Drop TARGET_CONFIG_CPU_32
Date: Mon, 18 May 2020 15:30:14 +0100
Message-Id: <20200518143014.20689-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RkVlzkzLR6Yq

The Arm signal-handling code has some parts ifdeffed with a
TARGET_CONFIG_CPU_32, which is always defined. This is a leftover
from when this code's structure was based on the Linux kernel
signal handling code, where it was intended to support 26-bit
Arm CPUs. The kernel dropped its CONFIG_CPU_32 in kernel commit
4da8b8208eded0ba21e3 in 2009.

QEMU has never had 26-bit CPU support and is unlikely to ever
add it; we certainly aren't going to support 26-bit Linux
binaries via linux-user mode. The ifdef is just unhelpful
noise, so remove it entirely.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Based-on: <20200518142801.20503-1-peter.maydell@linaro.org>
("[PATCH v2] target/arm: Allow user-mode code to write CPSR.E via MSR")
to avoid a textual conflict.

 linux-user/arm/signal.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/linux-user/arm/signal.c b/linux-user/arm/signal.c
index 698985a647e..f21d1535e4d 100644
--- a/linux-user/arm/signal.c
+++ b/linux-user/arm/signal.c
@@ -126,8 +126,6 @@ struct rt_sigframe_v2
     abi_ulong retcode[4];
 };
 
-#define TARGET_CONFIG_CPU_32 1
-
 /*
  * For ARM syscalls, we encode the syscall number into the instruction.
  */
@@ -187,9 +185,7 @@ setup_sigcontext(struct target_sigcontext *sc, /*struct _fpstate *fpstate,*/
     __put_user(env->regs[13], &sc->arm_sp);
     __put_user(env->regs[14], &sc->arm_lr);
     __put_user(env->regs[15], &sc->arm_pc);
-#ifdef TARGET_CONFIG_CPU_32
     __put_user(cpsr_read(env), &sc->arm_cpsr);
-#endif
 
     __put_user(/* current->thread.trap_no */ 0, &sc->trap_no);
     __put_user(/* current->thread.error_code */ 0, &sc->error_code);
@@ -549,11 +545,9 @@ restore_sigcontext(CPUARMState *env, struct target_sigcontext *sc)
     __get_user(env->regs[13], &sc->arm_sp);
     __get_user(env->regs[14], &sc->arm_lr);
     __get_user(env->regs[15], &sc->arm_pc);
-#ifdef TARGET_CONFIG_CPU_32
     __get_user(cpsr, &sc->arm_cpsr);
     cpsr_write(env, cpsr, CPSR_USER | CPSR_EXEC, CPSRWriteByInstr);
     arm_rebuild_hflags(env);
-#endif
 
     err |= !valid_user_regs(env);
 
-- 
2.20.1

