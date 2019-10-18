Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1237585wrm;
        Fri, 18 Oct 2019 10:59:45 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw0V01HpU/NSYco+lEVojtIP1oCZZEeehymd8AGAsK+873uxMENcfVBtrNfLU3MyOBim8S6
X-Received: by 2002:a50:8dc5:: with SMTP id s5mr11001516edh.115.1571421585804;
        Fri, 18 Oct 2019 10:59:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571421585; cv=none;
        d=google.com; s=arc-20160816;
        b=WeTH6ghq3+TXQSPVqMFEhUl7Xpz8E/dNzZBNOBXTN9uyB8RlRIImgFxf+jbrSA8yUk
         61GHu8MURxgVSWhjN1Y7yPH6UbJohJe8K3Rgo7Lv7OvvNUq4yusHXfqv5UE7wv/XGJbV
         0jtSdOH+ziUN5uUM7dFonZYD98SRW8DGXSSXGhqd/m8NfthOsaQhowd/cb+en5Rxzsw3
         MvMa3XxfKc8bKuedHPUdNfMxDNQ4XqBWssKnl7F6MaNUelDOCGmQIBRtJZSrOC9NUNWU
         OOb99pHwZ0cChe+0DaR9neMgeqwMeSS10iG3dB6G6sM7D9x5VcbkLM0o0U9zbxVAIPO0
         zv5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Iym+ywFHjEBpwuu12wdHsU0gouX4jDUf3/+DDNH9pyk=;
        b=s44L28UZsXh2XTcCNkU5JWANxNMJ0zU+KM8E1QhfB1xQ723EmxdroCfmiXIMC7lqiC
         upD4WRvffk8oYe3HMKq/xLrDXNqc7zKd8aNM/RNP3FBzFQ8y3mjhQM/CCs5LlxDsSTr/
         lQKNJA2gvwrQIrIPD7Ke9g/dYvBkMsQD3sjrz+OGvzufCQLzbsWIb4Fu/EK9DA1DQjAq
         Ouuo+W11jb11AzBY8ZL9GP4HNrnv7hLA6P6spO3XIn86dyTGjEVSRMw25heaIGopUVhR
         467HNG4/MgipabnBsBh3AG7qVAUkRciMgNWXMSY9Hnzxz5WZ5f+GtCmgpNtRYhc4ooRx
         ZH8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=pATM9ssF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g50si4576956edb.47.2019.10.18.10.59.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Oct 2019 10:59:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=pATM9ssF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iLWXQ-0006Xu-HY
	for alex.bennee@linaro.org; Fri, 18 Oct 2019 13:59:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59450)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iLWJ7-0006oR-GA
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 13:44:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iLWJ6-0005cL-CZ
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 13:44:57 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:45049)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iLWJ6-0005bt-6e
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 13:44:56 -0400
Received: by mail-pf1-x443.google.com with SMTP id q21so4303600pfn.11
 for <qemu-arm@nongnu.org>; Fri, 18 Oct 2019 10:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Iym+ywFHjEBpwuu12wdHsU0gouX4jDUf3/+DDNH9pyk=;
 b=pATM9ssFkxdigDI20QfMiusWkLq9ZFxqjeIY84nbG+ObLMz20Bk5mN8NBKXHLAtYCK
 SqSxE4tOdn6VrESxF94B1nPMlHxkEi+ROiz9wEXeruDUOJvEz1m8LPuvpAgiE27FzrcV
 Q875XXTvOR1tnKjLjl6hkAg7+a/SL9rt+XXKaQM/1Xzf4QovmWHlpMpCvx6lmxD2tdcI
 uWbYbNHtH27PEHBekoL9PEDQM8qatIauBE2asth1uVJ7PX9CPQvtyZwRWAnRNRa0JMJN
 S/uEHGcknS5SONOXKK+djAeyziJIJQtNLLqBrX+WCcrKNMivoe8f6qB+rKJvL7SoXwS8
 RZaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Iym+ywFHjEBpwuu12wdHsU0gouX4jDUf3/+DDNH9pyk=;
 b=M1h16tNPIS5ly7AJozjQld/P1TLIeznLPxh5+KxoGNWsYjgBAOK3DiM3e13Wpf5nvZ
 /7Qiz0kzldJydgFV8l6SyGNEEzI9mel8TsTn1QxGb8ck3D7vl6IWD1BEu3Z57olJseO2
 eJXYNzmzGFRQnsTgrTYxxLymBgHka/y5/KGGX9HoLrKnBITsOI6RlNFA7sbFzPru2z1U
 Y7ZscdyEQAjIkfx3WF4nv/iCOBTnID4Cbq9VspqgxRwIjNRfXMr08aImo+ANylozu8Zb
 xq2NieuDoFcBQrnjWJvCvjO4zT4ZyWPNujp7/Ip8EFv3ogtwvinVUmC4DX8J6POf3jHx
 kCJA==
X-Gm-Message-State: APjAAAV6jLUdtndIhQdPau0rjjolvCckAScjJlfftCPshnz2eHUnDMfG
 oLXljlZ2xVqEOLdQ7Db7nDWf5A==
X-Received: by 2002:a63:3104:: with SMTP id x4mr11264412pgx.135.1571420695215; 
 Fri, 18 Oct 2019 10:44:55 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id d20sm7857534pfq.88.2019.10.18.10.44.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2019 10:44:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 18/22] target/arm: Rebuild hflags at CPSR writes
Date: Fri, 18 Oct 2019 10:44:27 -0700
Message-Id: <20191018174431.1784-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191018174431.1784-1-richard.henderson@linaro.org>
References: <20191018174431.1784-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +rOVnP5CCZXS

Continue setting, but not relying upon, env->hflags.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/op_helper.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index ccc2cecb46..b529d6c1bf 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -224,6 +224,7 @@ uint32_t HELPER(usat16)(CPUARMState *env, uint32_t x, uint32_t shift)
 void HELPER(setend)(CPUARMState *env)
 {
     env->uncached_cpsr ^= CPSR_E;
+    arm_rebuild_hflags(env);
 }
 
 /* Function checks whether WFx (WFI/WFE) instructions are set up to be trapped.
@@ -387,6 +388,8 @@ uint32_t HELPER(cpsr_read)(CPUARMState *env)
 void HELPER(cpsr_write)(CPUARMState *env, uint32_t val, uint32_t mask)
 {
     cpsr_write(env, val, mask, CPSRWriteByInstr);
+    /* TODO: Not all cpsr bits are relevant to hflags.  */
+    arm_rebuild_hflags(env);
 }
 
 /* Write the CPSR for a 32-bit exception return */
-- 
2.17.1

