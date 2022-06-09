Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp684497lfb;
        Thu, 9 Jun 2022 13:36:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwMM/G5zWtORCX0ia40GELt8y29cKLkg5LNfk26t8sf4IR7upCcMXtyKkrAB2CmsBRvXNus
X-Received: by 2002:ac8:4e42:0:b0:304:b364:e567 with SMTP id e2-20020ac84e42000000b00304b364e567mr33499903qtw.151.1654807014400;
        Thu, 09 Jun 2022 13:36:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654807014; cv=none;
        d=google.com; s=arc-20160816;
        b=VAXjzcS3zB+DQ0elVlr1yav8h8GrADucaYK0HTLfqQ4+9SWruWTLfnlKEgncoK8//f
         9ANgLex5oIHp2As74iIiqOXfeqeDXTSGCpix937saFr8cfCf6owIV57ugtRzhJyPNl5f
         ip7h24bJLLwsVoYnSjGKaZyZ5IyTz9cfqfOWP+Bw9p42IkwYk/DuZnTy1xWR3uPelxz+
         YrardVVy1kKlfVMPtHayj3u/9tNIAmkca2Y5ZRHTaKbxw3IX84YL6SMxdSYNa+EVQgYm
         VRZqC5L9aIYGlKGzsCAVv+g8enkxslQlkqsWYaPVc5rYETt7619zUNHdfdGxd0I4OZ2p
         Jd8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=teH34tLGM/uhEwiASP92UVNlQhKQkgbQt9R4Fk9V4dg=;
        b=WazcQRblF0uDNC3jOYWONjURy+B2eTlIWrXhAG2UJDMU0FgSkMaR4WJR5YOwD4ppSh
         2YvrMSu3/am39JnqLbUeD1QP9HQO8cU1I4ASD7rHCPD9o4g/2OcBGnroVvJ7M0Ai72Qp
         ycc3p5mvuyRt/kk+RglQvm+RBHMsRdMhbbD4LA9zgxn079/2GnlQh4kGE342sJu25fqy
         OSRChpZ6Lje5sKWNHkdsRq4xCwv5iE2Jf6AamY7zFraWXhnDv/CdpywXIfVVaPgAMV7A
         y5RAq4ivge5ZHx16AA+jH1xzYuMXHbzt1MCLaBzEAf1pskHqmJ+YOsoGiRW5+jwDFlG5
         lPRw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bPty2NdE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ay33-20020a05620a17a100b006a6ed810103si4562420qkb.393.2022.06.09.13.36.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jun 2022 13:36:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bPty2NdE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nzOth-0003y1-SU
	for alex.bennee@linaro.org; Thu, 09 Jun 2022 16:36:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzOmE-0003bC-VI
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 16:29:11 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:33542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzOmD-0008S0-Dx
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 16:29:10 -0400
Received: by mail-pg1-x529.google.com with SMTP id r71so22904385pgr.0
 for <qemu-arm@nongnu.org>; Thu, 09 Jun 2022 13:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=teH34tLGM/uhEwiASP92UVNlQhKQkgbQt9R4Fk9V4dg=;
 b=bPty2NdEKHE35lMWD9se1mbyIEhUyWDa41JV5I9vM+dO5NKupJHsRxU2yNOEmbpusF
 EhZH0IfJCEUbyWNtSawlrwWu0rOy4YOUY78TDw9bh83kRMmtPSXkvmf08lK6DexJ6x8t
 pLNdd70S6FB+fFuUxyVqm5/O4NL4oEaThtfC8nVg6Qavq80sofJ8xKiMem5rMkaW3gm4
 4soP62tFYNXXUMjjeufpByn78MxyvnvXqN2gE3Rgpq5ewWj50xiM8R3IypFxZUAKw8ZX
 6/vkHD+Li+hPTNsnbA+Et37QW0nPIjT0mmBbJJ9cO7Q47pnDiQCMoojlEv5tasoREMqn
 uhLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=teH34tLGM/uhEwiASP92UVNlQhKQkgbQt9R4Fk9V4dg=;
 b=L9tLFScsctLSl09hRKaemTZPUKE7Th/4PLXBAXEO88DqJc6lpsrVG7DPVyGRDqGtwh
 7RJZr9p87lwpHxTTEDWvf93NrZjl+diGzzF1C+k+LkMFv+VHi/ohS/+L5ZesDhrEfbXz
 pCUXol7EmxIIj+50nc65uLOYInCxlihEC/I0ov3cafk6mwOMTEKTPbbxJtY3+3O+aH+v
 922Ik8DY6RXDb+E9YogkkPU5zR2yyyMwbh+WNqhe+iYzasCsQA7RDfKqq3k9vIkSC78r
 nj42342WDxp527Lk1HwwIPmYwv7y39RvX4FAc5jYkZ9x9RW3rJopTzYaTqLGTzjEINfu
 O3MA==
X-Gm-Message-State: AOAM531LIdDfz+4wdc22b4HH8GrW0FDfJH2NO4j4FtPlZKjnMEp9P2X8
 PN06VFCHcPiO7efPkp83+3MUdXrf+Bo/Nw==
X-Received: by 2002:a63:2a16:0:b0:3fe:192a:2d3 with SMTP id
 q22-20020a632a16000000b003fe192a02d3mr11525941pgq.39.1654806548002; 
 Thu, 09 Jun 2022 13:29:08 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:839f:476f:678:38a])
 by smtp.gmail.com with ESMTPSA id
 r20-20020a635d14000000b003fded88238esm7528139pgb.36.2022.06.09.13.29.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 13:29:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 06/23] target/arm: Use is_a64 in
 arm_generate_debug_exceptions
Date: Thu,  9 Jun 2022 13:28:44 -0700
Message-Id: <20220609202901.1177572-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609202901.1177572-1-richard.henderson@linaro.org>
References: <20220609202901.1177572-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AobYq5O4MkOU

Use the accessor rather than the raw structure member.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/debug_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index 20a0e4261a..a18a09a0c3 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -99,7 +99,7 @@ static bool aa32_generate_debug_exceptions(CPUARMState *env)
  */
 bool arm_generate_debug_exceptions(CPUARMState *env)
 {
-    if (env->aarch64) {
+    if (is_a64(env)) {
         return aa64_generate_debug_exceptions(env);
     } else {
         return aa32_generate_debug_exceptions(env);
-- 
2.34.1

