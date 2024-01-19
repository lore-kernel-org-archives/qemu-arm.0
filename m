Received: by 2002:a17:906:2b99:b0:a2e:1324:ea5c with SMTP id m25csp880099ejg;
        Fri, 19 Jan 2024 03:40:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGfaTv/2iFwNS6hx/dt1olQH1JNTuTFZBFc9DxULygTJtuy/oJKtsCJLLew4N50B83jgtbp
X-Received: by 2002:a05:622a:8:b0:42a:cbb:7e8e with SMTP id x8-20020a05622a000800b0042a0cbb7e8emr2567186qtw.110.1705664405110;
        Fri, 19 Jan 2024 03:40:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705664405; cv=none;
        d=google.com; s=arc-20160816;
        b=iPV42csUHmqofIMdynowd9mR8vxudnFPPaUwJXSmeQrBXhmvHvURX21kq1yBveC4j/
         cLI2iND69AmITYf39o8Emjdi7Z7/WUsn5Fm2f2O3xV/oNJBI2B7juyJOGYUtqvlRV/Jc
         ZFJ0Y665ijcR2x5yli7MBzWQ4D55AMJNJspSMOVp/30ACTqOI0V6QdKM4/m2TEW/wNIv
         rSCKeruPLDqL+W0G1i+g/L4Mr3sd255O+zddX6FInGkW+ZFHi8GtfPCLBh7mA21Eya1d
         nB+Kg05j4b+pj4zLtNK+/zkFIA/90rsMm/p+hEYgpDElZKr0qFLRAiBkU+iBWkSsVK1H
         2yjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=uEVuIq2fAugiO07WlgkO+R3+5CVkxIv0WR9Gtc3uhxc=;
        fh=XLY9/kD9LztQxqN909aTdcehMZxtcAiCmiec2r3FPyM=;
        b=c7Bh34RUDt8cRG470QXYjz0xWBAqQ6SATMtnrQk7u/9nALz9/VrUUJcUNJIDrzEWC4
         yz+DIQy25bg9rYBzJ3Tq3lp8rDytXqPFkBr+qmr7ok70KBuHoOQstzh4GBtPVKOvoYat
         GqHXTgy3T+a7L1hSqCevyo39fkwh23M1Qm/ddIYNKdSg9yIBe/b7c/uhHc9c+iP05JYM
         +PfPzrUcaoRbryy7liE6sX1T8KfjqkmcqANzrwPGG3O2fxeCVjQ9I/XXAJzMFEhQSI2m
         QvFgkW1ntuoiUx0bSYk6Md9KTZuR1XFTwbq+VeVdnQdGVN2hUbz6q5KklWoFPJbCQhUy
         15Jg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="crG/ilcE";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h2-20020a05622a170200b00429e9611ae4si10389795qtk.491.2024.01.19.03.40.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jan 2024 03:40:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="crG/ilcE";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rQnAV-0002gS-0U; Fri, 19 Jan 2024 06:36:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQnAR-0002Z3-AW
 for qemu-arm@nongnu.org; Fri, 19 Jan 2024 06:36:11 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQnAO-0001gV-Fb
 for qemu-arm@nongnu.org; Fri, 19 Jan 2024 06:36:11 -0500
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-33922b66bd7so190683f8f.2
 for <qemu-arm@nongnu.org>; Fri, 19 Jan 2024 03:36:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705664167; x=1706268967; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uEVuIq2fAugiO07WlgkO+R3+5CVkxIv0WR9Gtc3uhxc=;
 b=crG/ilcE51nUFWJXGdgDdvo4UpscOiNrOgxcA1fkKxfx5saDy0xuCs6O7pAdkk3A+e
 bBVB0gIYGAfj2FmH9kO7LxMRaa9Hk/9wdthUAs4pDdIdmZY3jM8GJD3fcvmagDlBt1aK
 V5X4Pw8BPKg91p6x4qMybO2hmG+hr1YIyL9zkSZxAq3olLE+0M5HhuxAj/dSWengmCqZ
 R4p1A+SJDojWwhq+akJizpqmpB5bO+KLZOPq5PPoByapklbGQ4RvUXupX5lDjoPs2cvI
 jDElsE0jOKOJ4a1bug1yBTcT+zZVxF4uRso3M87n4bqa/R6j5buv0n9/pIGmqpuGsjQG
 HMcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705664167; x=1706268967;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uEVuIq2fAugiO07WlgkO+R3+5CVkxIv0WR9Gtc3uhxc=;
 b=pTShbwTIN9yxdf2vYk1U/pbmjZmGXy87eMX3nX4aZmID3pa69ug15cg3efXxQvq3UH
 NXBt7UyjZNB1nzqlyFDevX5o/HJWCRzJXZ/I0TSz03icfpqXRKN/DFPrWEhIOAWHJF/l
 9vF6Hp3lKNoJdLQWeGCXVI7jYTfSlGjBXY9wEyt6Li6OMYo0SfSAdpZFQvxbwf8sS9rS
 djfaRpZYtgvQRdOnaS1ltowG4mGgdvQKyz40LfKAZ6pDqCa48ewzlUjFj7v73J9e1oWf
 si1NmmzZInxas602NPW9+1G8LPCrB+9YfY2RJRvFs7C6UoOOKxAOjm5tgq+hMC9IaroW
 LHqA==
X-Gm-Message-State: AOJu0Yzotkn4zP/gCywt+/9o2bSFXuxnmUm8IYKQxAjkynDS88mOJ4s4
 4e5eyZJYDUZTvAKhcYVf8SIW/DYU6n60hL8CqiAqdXVOn8g3cSXE9iTnfLlUrY4=
X-Received: by 2002:a5d:49cc:0:b0:339:2248:3e30 with SMTP id
 t12-20020a5d49cc000000b0033922483e30mr342492wrs.138.1705664167141; 
 Fri, 19 Jan 2024 03:36:07 -0800 (PST)
Received: from localhost.localdomain (91-163-26-170.subs.proxad.net.
 [91.163.26.170]) by smtp.gmail.com with ESMTPSA id
 p1-20020adfe601000000b00337bf461385sm6296931wrm.26.2024.01.19.03.36.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 19 Jan 2024 03:36:06 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 13/36] target/arm: Ensure icount is enabled when emulating
 INST_RETIRED
Date: Fri, 19 Jan 2024 12:34:42 +0100
Message-ID: <20240119113507.31951-14-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240119113507.31951-1-philmd@linaro.org>
References: <20240119113507.31951-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: HSrXWxKDvM6Z

pmu_init() register its event checking the pm_event::supported()
handler. For INST_RETIRED, the event is only registered and the
bit enabled in the PMU Common Event Identification register when
icount is enabled as ICOUNT_PRECISE.

PMU events are TCG-only, hardware accelerators handle them
directly. Unfortunately we register the events in non-TCG builds,
leading to linking error such:

  ld: Undefined symbols:
    _icount_to_ns, referenced from:
      _instructions_ns_per in target_arm_helper.c.o
  clang: error: linker command failed with exit code 1 (use -v to see invocation)

As a kludge, give a hint to the compiler by asserting the
pm_event::get_count() and pm_event::ns_per_count() handler will
only be called under this icount mode.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-ID: <20231208113529.74067-5-philmd@linaro.org>
---
 target/arm/helper.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 49665bb763..e068d35383 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -954,11 +954,13 @@ static bool instructions_supported(CPUARMState *env)
 
 static uint64_t instructions_get_count(CPUARMState *env)
 {
+    assert(icount_enabled() == ICOUNT_PRECISE);
     return (uint64_t)icount_get_raw();
 }
 
 static int64_t instructions_ns_per(uint64_t icount)
 {
+    assert(icount_enabled() == ICOUNT_PRECISE);
     return icount_to_ns((int64_t)icount);
 }
 #endif
-- 
2.41.0

