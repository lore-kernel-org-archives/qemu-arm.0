Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp2711381lfg;
        Mon, 2 Mar 2020 09:58:55 -0800 (PST)
X-Google-Smtp-Source: ADFU+vvCB0z+KKewiP35Qqu0OE0EbfibxtF3KiV/YJ6AnHgukKlj+/SpkYANGd6P/SX9QUZQNRhD
X-Received: by 2002:ad4:5051:: with SMTP id m17mr543124qvq.53.1583171935609;
        Mon, 02 Mar 2020 09:58:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583171935; cv=none;
        d=google.com; s=arc-20160816;
        b=XMReHoLu+BtvdmNs7QWqpwVxEmVAhXoEFmYfp5u8JbdeXHSe8ZF36d6/eaf8vr8kJL
         J8vkY4rff3vVePyzJqh9ZFuPWe5/4dwBtiRz8nATRXamowIaDJ3HhWxBUZIrjyVqewOs
         HL7BDSOh/7WEqviKDn5OJHUOe5LRzy7mDNNP2cbekvGtZXUnR07prHK7nUMLuMWf8W1l
         24XrYs1ir6mK9rB5fvY6ifNgdEg9DwsEJF7LIcFTl416SM64u2W9XIN6zhHaM7ID+d2J
         vNXMPTZ5whRGDoa0H/P3uuQEt5fVNg5l7ipC+DO8WD34q7TGoDzxFnA7vs6fdLCapttg
         UZyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=uuvmt8nnRxpkzrlRvGkzXacr9M5W6UoCPdAN4Hxg8gg=;
        b=L4MoZvWrWpu4epydwDBAC1nLbU5vlBZ7igsvprEH/rBuGdJ7lysO0x14dVu68CX7vk
         sNoDjSxckdKz0HO2AF6Tt//nGmbDxhDR4WWzmSH4b26sQih+aHIJ7GtowIXCl8ENOulK
         sjieriHYEz8SWI5aQL9Lfc21shAMQy5kP8Enfc1hEnWa5sHxFR2+bfyCXFke2qni4P+0
         LR5CsaiqnVsAei+JCLpEWISbRSgL9eGwnI+W6O7ILxkaiwmxABWINH8WhNJ4B6WdkbkS
         gewV9m18DDdgj90KMWs965HoxltUk3DNPN/jJ658mqpqFa/jXeCf51BSb82oUMnAuQQ+
         +ePA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JgQTd5Ua;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l184si6013365qkc.220.2020.03.02.09.58.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Mar 2020 09:58:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JgQTd5Ua;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j8pLC-0006ty-UJ
	for alex.bennee@linaro.org; Mon, 02 Mar 2020 12:58:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39160)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j8pL0-0006jV-1a
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 12:58:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j8pKz-0007bF-1Q
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 12:58:41 -0500
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:33663)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j8pKy-0007ap-R8
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 12:58:40 -0500
Received: by mail-pg1-x541.google.com with SMTP id m5so195434pgg.0
 for <qemu-arm@nongnu.org>; Mon, 02 Mar 2020 09:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uuvmt8nnRxpkzrlRvGkzXacr9M5W6UoCPdAN4Hxg8gg=;
 b=JgQTd5Uam3c76kYxK5iuzGdkmvCMFZaz2gRBOAzcas+O7KsG7sexziMGBYq5Ih3sQK
 L7YRkafhys+Ik7+Toag/mRHmKmep7sFRPe8mzj3Bn13ragNfmBXrq/zSDgtDbGTJ6MvK
 904SNobNuOdZrEmMQGEXDPpfTEd83OC3WFkCsG5ds0vJ5hliqXfhDTK56Sy2eYHP5cum
 el1L274mOlUTHMDz7mLzsS3tYKTuizryQI7Qr9yxqKjnp3KmEBm3EE0RtXVvTLg3Jeob
 BmdY+QGRby4yHiLbErUTsLWN+WwbvIOcTBbcjCjoN8mnDxrGikz2XtIFt8ykZtpHO+Oo
 sLyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uuvmt8nnRxpkzrlRvGkzXacr9M5W6UoCPdAN4Hxg8gg=;
 b=Cz43RnOHoXEOJvUooF+lSMvaXT6Uuw658uPsHBDv+iAULHQ8KGtf2c33GraUaMp2Dg
 6l/+lTfDvfYg0Rm9CoQZGZlsssCJIUtcZ+rYQ4EBqNj//DpHdAymVEG9No3Hu6rL3K6A
 aY4r8lOc8wDWUsx0/P51q/PnEMXs3IQPrvdNNcHrrkXSH4vtmcLXFfwpgxu8w4euEZWv
 KnpZxpCUAUJWD+a+7fTzSPaUBUumJ45VcOboBehHnJ6YMjBjt9zOVCXgPBm9b2gnIqfz
 /zrGbVZBSOrQlK5cu7uskBclYY3F58Wt8NbsbQz+xP26OEtwXlVn8pseAS2Fb5nYand8
 Lg+g==
X-Gm-Message-State: ANhLgQ3Upvp4+G/y0y+geBRzZjaBiToKAf+4VYiUJleB2adrex4SF+P3
 VYprpDWEuOXWcvqv6TQ7q3ERew==
X-Received: by 2002:a62:be0a:: with SMTP id l10mr250698pff.110.1583171920020; 
 Mon, 02 Mar 2020 09:58:40 -0800 (PST)
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net.
 [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id s18sm99510pjp.24.2020.03.02.09.58.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 09:58:39 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 7/9] target/arm: Clean address for DC ZVA
Date: Mon,  2 Mar 2020 09:58:27 -0800
Message-Id: <20200302175829.2183-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200302175829.2183-1-richard.henderson@linaro.org>
References: <20200302175829.2183-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
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
X-TUID: KyVn4VP8IJVi

This data access was forgotten when we added support for cleaning
addresses of TBI information.

Fixes: 3a471103ac1823ba
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index c910a49b4e..fefe8af7f5 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1784,7 +1784,7 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
         return;
     case ARM_CP_DC_ZVA:
         /* Writes clear the aligned block of memory which rt points into. */
-        tcg_rt = cpu_reg(s, rt);
+        tcg_rt = clean_data_tbi(s, cpu_reg(s, rt));
         gen_helper_dc_zva(cpu_env, tcg_rt);
         return;
     default:
-- 
2.20.1

