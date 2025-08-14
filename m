Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1701CA0EE4
	for <qemu-arm@archiver.kernel.org>; Thu, 14 Aug 2025 13:06:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1umXYZ-0002PA-0d; Thu, 14 Aug 2025 08:59:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umXY5-0001lv-V2
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 08:59:19 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umXY1-0004KK-2P
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 08:59:17 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-32326e05b3eso711761a91.2
 for <qemu-arm@nongnu.org>; Thu, 14 Aug 2025 05:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755176349; x=1755781149; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PIk54x6Ar31mjPJaW9KswvmHAxIEFie35EtC6Q/lqj0=;
 b=uYSPIyQfp8P732Biz37FbgYE2jb8rY0MjwxbWagudgW16nafQdCKpcs7fC0ZKp3J9n
 4/1Bam2yGc2/gkb+5AukY6SgAVaHZlLBIciamKySXwTzSAI+ssrob9vH+luFwT6pnmBm
 la8/D2arYq2N3J1zIu6CPI7jtNkpfl61uAMFcdb660wuXBOcGeSR7MkaNtTgr8ix2Rcp
 lTBnERhC+gehV29NkxBmYEXOM8Gb8V0ro4OEIXKs5XbwEy6/KnoHQxbcPuA1L1chCUfR
 qfEIZXNoOP6kuHQf42sW5O6a0QYrorHgLSW9kegnoMj38z10ieZ9YXsDbE1PzgSxzb1h
 g84w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755176349; x=1755781149;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PIk54x6Ar31mjPJaW9KswvmHAxIEFie35EtC6Q/lqj0=;
 b=jd9MU/ZHVMlp8dhHtOVkfDcoExddhFWzow1/CGkdxRE3FHP7Eigf08gtPVSFEtCg8h
 x1/o46kXQKGmFXIK1GIreum4EvvSW7uuqY8ydhOUmPSTjMQ9YSkZBIJ5K3pbUfW11PA1
 wasjQZA69w1Ny70X4JiL9m/QLs+sPemXB+CgkmEOTfVDrpTiechStHCGhz8E0pqughUR
 z8mchkprkUul0O+8kj34sdOvwYm753Zx50i8hVg6g3gIebB/N05mJdYRmJdSkz8QtSEb
 j0Bikv4PgKZyVsLPYZwnmAcu/s3/BvVhPFKXjQi5eJoZLl1jXEQwCgSyweEDWZO8ptb6
 ZSSA==
X-Gm-Message-State: AOJu0Yy69yjcElAfvpwGQdm/rC/2ydp9yBlnLCYiQGTx9PM7mZXzkXy6
 KemecjdrO8qDbMQKwk5Zn+gt+MoNPmVIKwb8WzeqHTbDjQQG+qWVPaYkLuIjpQtqWBvw7caOKWM
 XHWHhzMw=
X-Gm-Gg: ASbGncv8diPTBtZ/l57ZG/H0mVt/WvTaYGgcCWxrQejNrzhSOAVvTmPpWO5e/6BHu/q
 LSFxN57gCDWcRyi3kTP139ot3Kn3liJZwtIbOiQajAUeTzxJSv5agUeQCXqzgZxjoI4dNmMdylP
 5y8V/46FmCcAqplq5kVySvd5GvR0TsLOT9383Qp1jEU1K72/JO/tk8+F5Xn4KTfknyCYCLU6dlq
 Mq3Ed0kNecMTwGyVTUPl/iS+llZlKsF2YtV/HU+n8VR+voeHLVK4ogxMKkzEc0zaRIWI5omH7Yp
 vyG7ckLlCJnOoQAIKaCavYi3T7hkW3dqD762DKvP67O6Un7MuIHhtW+SMpy1HmpPr8CDglnxx1g
 6Dwq8gfLScp1rrGNz9lXaKzuEcT3qN/1+WvkckRA5oKhc+XQ=
X-Google-Smtp-Source: AGHT+IH2SrOCJcXzbfqJwesiJLb3orJdB4G6FVXiprlTyjYZ62LJwGuryXI0P0o/jCpZgCnUL/Oxtw==
X-Received: by 2002:a17:90b:2882:b0:321:c9e7:d9ef with SMTP id
 98e67ed59e1d1-32327a3e51cmr5119106a91.21.1755176349165; 
 Thu, 14 Aug 2025 05:59:09 -0700 (PDT)
Received: from localhost.localdomain ([206.83.105.236])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3233100c994sm1766256a91.21.2025.08.14.05.59.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 05:59:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 21/85] target/arm: Do not migrate env->exception
Date: Thu, 14 Aug 2025 22:56:48 +1000
Message-ID: <20250814125752.164107-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250814125752.164107-1-richard.henderson@linaro.org>
References: <20250814125752.164107-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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

These are not architectural state, only placeholders
between identifying the exception and delivering it.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/machine.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/machine.c b/target/arm/machine.c
index 6986915bee..8dbeca2867 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -1085,9 +1085,9 @@ const VMStateDescription vmstate_arm_cpu = {
         VMSTATE_UINT64(env.exclusive_val, ARMCPU),
         VMSTATE_UINT64(env.exclusive_high, ARMCPU),
         VMSTATE_UNUSED(sizeof(uint64_t)),
-        VMSTATE_UINT32(env.exception.syndrome, ARMCPU),
-        VMSTATE_UINT32(env.exception.fsr, ARMCPU),
-        VMSTATE_UINT64(env.exception.vaddress, ARMCPU),
+        VMSTATE_UNUSED(sizeof(uint32_t)),
+        VMSTATE_UNUSED(sizeof(uint32_t)),
+        VMSTATE_UNUSED(sizeof(uint64_t)),
         VMSTATE_TIMER_PTR(gt_timer[GTIMER_PHYS], ARMCPU),
         VMSTATE_TIMER_PTR(gt_timer[GTIMER_VIRT], ARMCPU),
         {
-- 
2.43.0


