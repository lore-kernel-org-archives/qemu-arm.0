Received: by 2002:a17:906:ae84:b0:982:368b:d395 with SMTP id md4csp536558ejb;
        Tue, 13 Jun 2023 06:36:48 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7ro78yxWWzka6EIX3LZgRoOBcv0nrd3xLeHHkTf4Jybrdbne94OqvlkGXmlLiNez8fYniT
X-Received: by 2002:a81:5252:0:b0:561:e540:b1b3 with SMTP id g79-20020a815252000000b00561e540b1b3mr1921920ywb.38.1686663408402;
        Tue, 13 Jun 2023 06:36:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686663408; cv=none;
        d=google.com; s=arc-20160816;
        b=BqNroJX4nwxFBUYZDIska4IYCwM7qyxUpauIn0I5dCLN2kPL8ARttghVdHX6N83zYy
         ztc3s7Yy4dOZMVBRXzmeNF/HuSzlMz2f2c0J45812tN+W95tYi0xLAlX4cFTPzpwFo+i
         QKboY9BId7OeEY76u5urzlLu2+42mjvlhQFWiV3/YdME96ioazJpANlo8KEPh7GktQFy
         u3khMB8jzAhYvuxGwylY7Fenp6PPtv4ERVZ+HO+5MVs6G+EFt/9JZpfTwbB0NQfQ1nzJ
         S54TdplayYIFLMpkhYNndcquy7c8uCuNHm2bWJrtV8eklZOGp1TosrWV+4EHOatJmDMM
         /XDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Ry/cjrg7XOxc8uRAKLAirJAwrBWEpGHjMR46sXnWNn0=;
        b=nmeS0pxIYHsCr7o3Qxdo7hGj3Ju0IoGfTgh/H59FbXsqkheFcLtjk8i1frUbm48LEX
         TsASYJXBKSWQCj92IxbUzfLylWW7yRnA7Tj6VPQUXdGbdndthq4tOfbpRX/T6EKbntH7
         vEdx4tLe9ud4f353T+GTW5qEjQmH3bTw7NjOkHHqThtiJWu7jiu3NhKkI2Bjab1Mfvtc
         G9jncF7PBm1ylSfnBRtvx+TMCHXWt0toAmYKn+LhMc5KRb33oZ8YhnzrJSagF7T2GgSu
         i8OhMxozQDWtGXXZE3u9821+5FkmvMcBtHORGhyEXmcsEDTBuoIt1ZXLCGH7BwQP8jvE
         XOMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Chbfm/4p";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k17-20020a05620a139100b0074e116e5af2si7331902qki.276.2023.06.13.06.36.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Jun 2023 06:36:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Chbfm/4p";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q94CF-00026m-Gc; Tue, 13 Jun 2023 09:36:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q94Bv-0001Wh-1m
 for qemu-devel@nongnu.org; Tue, 13 Jun 2023 09:36:14 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q94Bt-0002gT-3y
 for qemu-devel@nongnu.org; Tue, 13 Jun 2023 09:36:10 -0400
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-51878f8e541so873214a12.3
 for <qemu-devel@nongnu.org>; Tue, 13 Jun 2023 06:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686663366; x=1689255366;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ry/cjrg7XOxc8uRAKLAirJAwrBWEpGHjMR46sXnWNn0=;
 b=Chbfm/4pI28YU3JI6nhR4UtiXjsaLsUVuUbtdFvkuyscadYJNsIKxLkvc/hwoJP+36
 qeq+Ul1KsAwrcLsqikHBwedCOTw9QwoLq2DyOvqjYEgOew0wzXF2qchSiIHvrx46NJSP
 TYVW3hnT1JOmKvC1Px5NTx05V2fE0338Au+belQ+pAXogMkoPebgTp5XwPG4MDyfetDa
 r3u5OM0NeDBUzGCTrZFJOR7NqUtIZwRtNOqgxHtp2PREg63HItxtzb9w4218c1NzRVZe
 3zN2tihZhTSuHV0l8Dk1/v6en1rTAxtg+G1+PEOtFAdkcb7sWgh+NOYNunYaA/dk8Wq+
 spwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686663366; x=1689255366;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ry/cjrg7XOxc8uRAKLAirJAwrBWEpGHjMR46sXnWNn0=;
 b=GQJu1oN6zSeQcUtoXbWxiqiS18X7gVHnCxlCZuNXJQEMhOxVBQyvQ/2bOmabcbHzvl
 GiJ5OREzICiQcF/FfstyJBRm6AIaUEDBmiRkdQrtLy26SLj+RvcBSzRXcS7F2VR6dYRd
 imbKc+BMAOgMydgI6zSTwbo6axcZrkdk8XqzdT3y6WXmNyGHNBilO7aoscdxlTGAH39g
 lGHwAPeXJajhCjYFITFeKHbr9an7NNSYoAH1Dwa1oIa03fAL287hZTCYodezL4FEIUPV
 Fp+qRgUxAWz2ZZ2vlw12wq48/8EMkcJIiZsDHqabKgAjsg7z/No6F5BcyV/1sVG9F+y0
 m+nA==
X-Gm-Message-State: AC+VfDzDrY730QYVzjng5LlpgjxacvYRV//Zwk7EtUrIepQ2moCbjOec
 nM2pJIAt3YZXjRDmyZlE2uisrYM/nhCDV7XYCvs=
X-Received: by 2002:aa7:d691:0:b0:514:9e26:1f51 with SMTP id
 d17-20020aa7d691000000b005149e261f51mr7004399edr.24.1686663365840; 
 Tue, 13 Jun 2023 06:36:05 -0700 (PDT)
Received: from localhost.localdomain ([213.235.133.109])
 by smtp.gmail.com with ESMTPSA id
 f14-20020a056402004e00b00514b3dd8638sm6473595edu.67.2023.06.13.06.36.03
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 13 Jun 2023 06:36:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 6/9] accel/tcg: Check for USER_ONLY definition instead of
 SOFTMMU one
Date: Tue, 13 Jun 2023 15:33:44 +0200
Message-Id: <20230613133347.82210-7-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230613133347.82210-1-philmd@linaro.org>
References: <20230613133347.82210-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 1R9f3YexEfgH

Since we *might* have user emulation with softmmu,
replace the system emulation check by !user emulation one.

Invert some if() ladders for clarity.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/internal.h | 6 +++---
 accel/tcg/cpu-exec.c | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/accel/tcg/internal.h b/accel/tcg/internal.h
index 24f225cac7..65380ccb42 100644
--- a/accel/tcg/internal.h
+++ b/accel/tcg/internal.h
@@ -17,10 +17,10 @@
  * memory related structures are protected with mmap_lock.
  * In !user-mode we use per-page locks.
  */
-#ifdef CONFIG_SOFTMMU
-#define assert_memory_lock()
-#else
+#ifdef CONFIG_USER_ONLY
 #define assert_memory_lock() tcg_debug_assert(have_mmap_lock())
+#else
+#define assert_memory_lock()
 #endif
 
 #if defined(CONFIG_SOFTMMU) && defined(CONFIG_DEBUG_TCG)
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 42086525d7..1f592adc05 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -563,7 +563,7 @@ void cpu_exec_step_atomic(CPUState *cpu)
         cpu_tb_exec(cpu, tb, &tb_exit);
         cpu_exec_exit(cpu);
     } else {
-#ifndef CONFIG_SOFTMMU
+#ifdef CONFIG_USER_ONLY
         clear_helper_retaddr();
         if (have_mmap_lock()) {
             mmap_unlock();
@@ -1020,7 +1020,7 @@ static int cpu_exec_setjmp(CPUState *cpu, SyncClocks *sc)
         /* Non-buggy compilers preserve this; assert the correct value. */
         g_assert(cpu == current_cpu);
 
-#ifndef CONFIG_SOFTMMU
+#ifdef CONFIG_USER_ONLY
         clear_helper_retaddr();
         if (have_mmap_lock()) {
             mmap_unlock();
-- 
2.38.1

