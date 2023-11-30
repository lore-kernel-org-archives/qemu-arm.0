Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp264566ejb;
        Thu, 30 Nov 2023 06:26:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGXmH2LGZnvzBg6wndBFV0mcwkvdV+RKMk55yOvQQLwNvALLLaGjD2J/qCikaa9e2cqdHl2
X-Received: by 2002:a0c:f808:0:b0:66d:d6b:f24f with SMTP id r8-20020a0cf808000000b0066d0d6bf24fmr20416992qvn.50.1701354400707;
        Thu, 30 Nov 2023 06:26:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701354400; cv=none;
        d=google.com; s=arc-20160816;
        b=l5ldBfQunxsVug8/qGk5N1uBOT6B4Q+nBxL2r1xR+RIXc8DeXMmoQQwgvwth1efhZo
         dpIpuNmJj0I0mZbu0KGky1bwlTOv94Gw3knRfaEKJvRkYo5zs9zyU/JLQS7yhHRjgxPn
         tncqbd4+HHsRpX3PJiqG5QK5SyzkIGXk4mrF4Ouj72ge6/K0gJV2lOBPNRYCo4lNPKv8
         lU2VqaR1UDqA6+yZBSELzIFgWTy5OKk1Crl4QKac4qKgChTlGueOmm3kW9hYu7jU2+kv
         qTHZRf2QKwlTtQVVhBlmcy6c/gTCBFhoyegvQmFPEeo7eS6UrUt0gLJk49uK9jMqZu/o
         sgxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=/RVrwZHzqL53D0d21SzvbYXyLe3vUhOAbfQcX8nMf5Y=;
        fh=DKQFoSm5rvXVk6AUqpSavFv+IR+qPwKdgcCOIx8jJm4=;
        b=T4757VGryIbSAN8QH/lfTidH2QzxKqypb09sFgOhVv7s8LCtXv2SFp1p7ieKzKb4is
         yRrFXfGdNDziPDeeY/8hzDsHcRru6TMVW0vhbivf71fjyy5RxLSaXPRcVr/qb53IUq/R
         Y3tmmIarTagJGXwwARIdQnDwEjPOdc1g+0yV6Hd5/7BBycSy8hBSimmbO9SjLrOStA8o
         ZNrv1+knIaWuu0voH90ke9SKtjk8lkxs6R9hDG+kTrUYF2MtGZjfZobrDxJGNlsa0o+o
         xrIFzpvMla+04CgJM8FDfWx8DxGZ4zjYq/wTRiHOegrVIXct46tUZ2LtT9eKkDTAsAeA
         DLKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="NpP/uEpw";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k13-20020ad4450d000000b0067a52bdd3d5si1099181qvu.179.2023.11.30.06.26.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Nov 2023 06:26:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="NpP/uEpw";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r8hz1-0006G5-6y; Thu, 30 Nov 2023 09:25:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r8hz0-0006FV-1M
 for qemu-arm@nongnu.org; Thu, 30 Nov 2023 09:25:38 -0500
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r8hyx-0008Pj-Ax
 for qemu-arm@nongnu.org; Thu, 30 Nov 2023 09:25:36 -0500
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-50bc743c7f7so1397118e87.3
 for <qemu-arm@nongnu.org>; Thu, 30 Nov 2023 06:25:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701354333; x=1701959133; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/RVrwZHzqL53D0d21SzvbYXyLe3vUhOAbfQcX8nMf5Y=;
 b=NpP/uEpw5XkiKyWF/D0NUol+2idkFYl1Vqm4Z8PiTyeB5h4HaaNz73DqH5oA64bjBO
 ABv3V3n5SsdttRmCF8AYcTwwo1av94dgxft5KEV1oJpHFfwg4EIRlbtIdwJXE3AeyHsO
 WNOEBZ1hqfr4o3PkZpqCnznS7b5RAfUKHxKJmdvTYGJkLqIO5WDJLhTx97jLcOQ6cZNM
 frmURUwIVrbeZHqkEI0w2hG6aAq6pNdUc0K63jupeT3PwF9hvm+Dv0I5/1Mlu3CkeLiy
 Nl37KwTq5X3oww/GC+f/6cax0rw8oXOGsoleZJmvY3HrSG/FnKct91f5WjICZOJ0fANr
 U1SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701354333; x=1701959133;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/RVrwZHzqL53D0d21SzvbYXyLe3vUhOAbfQcX8nMf5Y=;
 b=pv42jrvU7BNuL9eb6UnNe7JV/6mGAoFE29qRyizhvahPqk6hXVGWN4wbJHNyU50az2
 ncgVMQuhF2ap+BphCHQU7gLYUq8rUobopw6/5BfqMUGB08wUwTK9KP1cP9G5y1BcGBH8
 aFgX29cg/tYKYyIHmtCEy0SxiRX7KqUC/SbtIaZPevGlSPPPdB6rdmvwa1RP0dbUg4JZ
 I2ptZ0UIlCqNn6JWg9jxbdV6YETspGiIqxUW+S/4ocen5f0ahujeEbKd/mdvXCD86Ynv
 ilX0S7vx4jBw3znU0uXlCAEkrdYnLD16AvzQCLTOtpETb3xqlw3nab72ZBm2vrP9cL+d
 6sfA==
X-Gm-Message-State: AOJu0YxwDjxEoIVkubBySSs/b8zYndz0eCyV4SON7jArNlJ906PAaa+m
 2yZhrRmnplQAewl5G4rlO4ukFQ==
X-Received: by 2002:a05:6512:3da5:b0:50b:d4c7:193c with SMTP id
 k37-20020a0565123da500b0050bd4c7193cmr460444lfv.24.1701354333339; 
 Thu, 30 Nov 2023 06:25:33 -0800 (PST)
Received: from m1x-phil.lan (sev93-h02-176-184-17-116.dsl.sta.abo.bbox.fr.
 [176.184.17.116]) by smtp.gmail.com with ESMTPSA id
 w8-20020a056402070800b0054aeac2c4b9sm591628edx.81.2023.11.30.06.25.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 30 Nov 2023 06:25:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-9.0 2/3] target/arm: Restrict DC CVAP & DC CVADP
 instructions to TCG accel
Date: Thu, 30 Nov 2023 15:25:18 +0100
Message-ID: <20231130142519.28417-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231130142519.28417-1-philmd@linaro.org>
References: <20231130142519.28417-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x135.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: XHtuIcwa2Zhx

Hardware accelerators handle that in *hardware*.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/helper.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 4844cf1d78..20e13215bb 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7645,6 +7645,7 @@ static const ARMCPRegInfo rndr_reginfo[] = {
 static void dccvap_writefn(CPUARMState *env, const ARMCPRegInfo *opaque,
                           uint64_t value)
 {
+#ifdef CONFIG_TCG
     ARMCPU *cpu = env_archcpu(env);
     /* CTR_EL0 System register -> DminLine, bits [19:16] */
     uint64_t dline_size = 4 << ((cpu->ctr >> 16) & 0xF);
@@ -7669,6 +7670,10 @@ static void dccvap_writefn(CPUARMState *env, const ARMCPRegInfo *opaque,
         }
 #endif /*CONFIG_USER_ONLY*/
     }
+#else
+    /* Handled by hardware accelerator. */
+    g_assert_not_reached();
+#endif /* CONFIG_TCG */
 }
 
 static const ARMCPRegInfo dcpop_reg[] = {
-- 
2.41.0

