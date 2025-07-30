Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 401FEC87FCB
	for <qemu-arm@archiver.kernel.org>; Wed, 30 Jul 2025 22:10:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhEyv-0008RG-Sq; Wed, 30 Jul 2025 18:09:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhEwb-0001Wi-JL
 for qemu-arm@nongnu.org; Wed, 30 Jul 2025 18:06:41 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhEwW-0002cz-Vm
 for qemu-arm@nongnu.org; Wed, 30 Jul 2025 18:06:41 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-2402bbb4bf3so5179775ad.2
 for <qemu-arm@nongnu.org>; Wed, 30 Jul 2025 15:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753913195; x=1754517995; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eYVzb4uq0baaeef2y1FkUKGWc2LoUDQfH7PSKL+/DMA=;
 b=MQ/jEYcYNEjq6TxSGssHhV8x9biZJIkG04+K2tv/vUGGFAtUUQkgmKlVL9N0NJPNFf
 T0PvaRiHxya1ZmGfS3dF7NKyNP+nfqq3a1KDcZax5oYlbWO5PHNEhYkPYM8pcTNqc8Qf
 9U1kfk2jsFQnrNdXf9Nww5U6kInyGx13rMrWs0YOX1g5TRoGK7AWZ2+HesSqxcwz6/b7
 O1VV3IazsTP2k/Q7tLZgLbPKRBCMxNCICoMSwe3yM0sEUngWJhUJIJImFIKan8yYs9mE
 QhJhr6csTJmXlJinEh7CMcTSbz+T4TLRPnU+AtE99S8nRPpxOcRVycV7gv3FN/gj2asr
 5hDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753913195; x=1754517995;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eYVzb4uq0baaeef2y1FkUKGWc2LoUDQfH7PSKL+/DMA=;
 b=nGB+619yl2k5aAMg8pjhtuXE7Dti4JXCLST+7+2vGq3kdBpbJ44VrC9zCvZDSS+x68
 v4tLtAWm+/skVdqeR5r64nti7hUeQbZtnw4RVZR8OtJWeldSC6OKw7Dov5RNdlyLEdTh
 xBdVGWSupjfs/7g/Qk3R21dAAK3kjkO3EmPyTUKEc7qvYfgW5WuUQcdJaCUa8bWcVF6Q
 /JNbIQRTljLxcT0eDvpXSLd6xirrrfoQ+GcUAqObpuqz+oHI0h+m+D6nqxAHViaEXqTO
 K82viKwIsCcP0r2+JJOhGg9EhK6d13298e0OPt8xANjYYf8g9pYQUHugRsvwqbHesjHl
 86UQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgHrPQotoR35UrvZZIhmLuSWqpW/+ginADIVNzRoYy07REcPqIeAQ66zBeNrkMOhIM2ymBLQd5Hg==@nongnu.org
X-Gm-Message-State: AOJu0YznLXBBaTJ1x4wWEMySCDoynqHmxLjQpyNaF/56DbYlfjF0d0il
 9bLZdsx9dxtXzCjGkcIuVKtVn1eTWT4zq/inQH2A72HBfp/30+/80g9SlIdrXonAhLQ=
X-Gm-Gg: ASbGnctx0lOejVSP1tWzNA5ZvOxlCbXZoVpzvQxuyX6KqQg9WNaA333G5VTKKrGkn5L
 HCbHJnCAeDQ3HLptQ9Sa7MgoEI6hOnPDVX0I4A/T1F2TDH6X3bOun8NPGxZpWZdv0Oh7ArnAb3g
 UynUh/13EdRupAKOg5BNagYmImnm0+TDr4jxKYoqvzeFd46FooEQCInQCmimfneY0qhcx8Z83kU
 SCbZ3zxWPDPcmDCT4yVRb/HwrX4ONxZT3EID6L7N/lMSRHrwhsWRa/pZxFSRQQ9JxhPFDJbaOwI
 a2Wh5HmNCRZbrd3Pm6ySKsAR1o6UCw9L5PA3zn8P4cgS8TXBxBuiw+v2yvT904Ca1uXKSrMwMaW
 LuRFZgL8yCIDivIhfxEuOYQ==
X-Google-Smtp-Source: AGHT+IGI2PRNJyX+U9IB2YJ0M51aEc7bvKmIioUeE3kGyANoDpfdqKVo1stDC30X16tEyAdaQ1ALwg==
X-Received: by 2002:a17:902:d4cb:b0:240:52d7:e890 with SMTP id
 d9443c01a7336-24096bb30e1mr75335325ad.47.1753913194435; 
 Wed, 30 Jul 2025 15:06:34 -0700 (PDT)
Received: from pc.. ([38.41.223.211]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e899d272sm981535ad.135.2025.07.30.15.06.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jul 2025 15:06:34 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>, philmd@linaro.org,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, richard.henderson@linaro.org,
 qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 07/10] semihosting/arm-compat-semi: replace target_ulong with
 uint64_t
Date: Wed, 30 Jul 2025 15:06:18 -0700
Message-ID: <20250730220621.1142496-8-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250730220621.1142496-1-pierrick.bouvier@linaro.org>
References: <20250730220621.1142496-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 semihosting/arm-compat-semi.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index e5a665d604b..e3b520631b3 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -123,7 +123,7 @@ GuestFD console_out_gf;
  */
 
 typedef struct LayoutInfo {
-    target_ulong rambase;
+    uint64_t rambase;
     size_t ramsize;
     hwaddr heapbase;
     hwaddr heaplimit;
@@ -214,7 +214,7 @@ static LayoutInfo common_semi_find_bases(CPUState *cs)
  * global, and we assume that the guest takes care of avoiding any races.
  */
 #ifndef CONFIG_USER_ONLY
-static target_ulong syscall_err;
+static uint64_t syscall_err;
 
 #include "semihosting/uaccess.h"
 #endif
@@ -260,8 +260,8 @@ static void common_semi_rw_cb(CPUState *cs, uint64_t ret, int err)
 {
     /* Recover the original length from the third argument. */
     CPUArchState *env G_GNUC_UNUSED = cpu_env(cs);
-    target_ulong args = common_semi_arg(cs, 1);
-    target_ulong arg2;
+    uint64_t args = common_semi_arg(cs, 1);
+    uint64_t arg2;
     GET_ARG(2);
 
     if (err) {
@@ -300,9 +300,9 @@ static void common_semi_seek_cb(CPUState *cs, uint64_t ret, int err)
  * is defined by GDB's remote protocol and is not target-specific.)
  * We put this on the guest's stack just below SP.
  */
-static target_ulong common_semi_flen_buf(CPUState *cs)
+static uint64_t common_semi_flen_buf(CPUState *cs)
 {
-    target_ulong sp = common_semi_stack_bottom(cs);
+    uint64_t sp = common_semi_stack_bottom(cs);
     return sp - 64;
 }
 
@@ -389,9 +389,9 @@ void semihosting_arm_compatible_init(void)
 void do_common_semihosting(CPUState *cs)
 {
     CPUArchState *env = cpu_env(cs);
-    target_ulong args;
-    target_ulong arg0, arg1, arg2, arg3;
-    target_ulong ul_ret;
+    uint64_t args;
+    uint64_t arg0, arg1, arg2, arg3;
+    uint64_t ul_ret;
     char * s;
     int nr;
     int64_t elapsed;
@@ -462,7 +462,7 @@ void do_common_semihosting(CPUState *cs)
 
     case TARGET_SYS_WRITEC:
         /*
-         * FIXME: the byte to be written is in a target_ulong slot,
+         * FIXME: the byte to be written is in a uint64_t slot,
          * which means this is wrong for a big-endian guest.
          */
         semihost_sys_write_gf(cs, common_semi_dead_cb,
@@ -688,11 +688,11 @@ void do_common_semihosting(CPUState *cs)
 
     case TARGET_SYS_HEAPINFO:
         {
-            target_ulong retvals[4];
+            uint64_t retvals[4];
             int i;
 #ifdef CONFIG_USER_ONLY
             TaskState *ts = get_task_state(cs);
-            target_ulong limit;
+            uint64_t limit;
 #else
             LayoutInfo info = common_semi_find_bases(cs);
 #endif
-- 
2.47.2


