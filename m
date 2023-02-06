Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp4642041ejb;
        Mon, 6 Feb 2023 14:35:55 -0800 (PST)
X-Google-Smtp-Source: AK7set+wtCYgN1bVscTVuJtR4DBlX8VqyfjDf9gdRSsHYJROp9E7Lc2iOqY+Pa3qyV3AgjgVwG9R
X-Received: by 2002:a05:622a:1346:b0:3b8:6ae9:b104 with SMTP id w6-20020a05622a134600b003b86ae9b104mr1895134qtk.17.1675722955254;
        Mon, 06 Feb 2023 14:35:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675722955; cv=none;
        d=google.com; s=arc-20160816;
        b=I+mT+sIvNCK/+iMuFNJ7A8kNBMrsGFdZqVIPFKHSVaYebi7/BY2Rx0iWUvPqPFPJwd
         Rs0foqkxjNvPa0d4MDSyf52cWuzVXa11WsMh7nOuVVmqnQBTVYbKSHYdK368GCIX2PEn
         19c1xbE/uM1sorrc5cL7lTXRlWE9cdI0hAwgqlmQBedfBIVu+uShrVvp5YkBfZ1daE5R
         BHuicEKEsy8nwnjMYhs9Hai+iB7WcyiNIUfY/VylwOEqLlqNaB2I/Bdc54rShfOJjMsE
         7fryOymlVoHq2xwcYjMPAWBQ+XlCXAZHoe6XhpM/auNKgGU69KKSpus1Tt7Z+TY3g3he
         ZOMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=tq6DPJouguMrWtZeeVmDD2Re+mYoIDnT0PaG7kqN/mg=;
        b=ehnAhhocW/uYEDGCmKuJV3GoK6fxS/FqccxJoY0+sDZYtsIt5po7VGrG5CpzskVfxr
         KbjANh3Ia+d6Zr4rLVP2nFP7z0BYYkePQ2wPi5Tjvcs5ansym41OFSqj6k5n3Pykt4Pw
         TnVHQ7jKf+18U6g26jLRjP0sokgzLKcsKTWQHEXyJAahuVitLsjaXgOAbylcbkzqKsev
         iJqVXKXDhA8nVxf0yEgJK8zq3ER4R0iBDNg8zcwHoRbjlg2ZgziPGgaCetAz8W41qHh1
         tnamCPJy2F2NoLL4BYGNLbSgIUHFQOzFQw1qQgMFs7fXjqyp9EiZwOTa5KNOHzW7Sy/M
         o9kg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Mek3dnXt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s16-20020a05620a255000b007207f3adc1csi10803964qko.131.2023.02.06.14.35.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Feb 2023 14:35:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Mek3dnXt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pPA5T-0001uW-Sq; Mon, 06 Feb 2023 17:35:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPA5S-0001tm-1p
 for qemu-arm@nongnu.org; Mon, 06 Feb 2023 17:35:46 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPA5Q-0004Wi-HM
 for qemu-arm@nongnu.org; Mon, 06 Feb 2023 17:35:45 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 hn2-20020a05600ca38200b003dc5cb96d46so11898013wmb.4
 for <qemu-arm@nongnu.org>; Mon, 06 Feb 2023 14:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tq6DPJouguMrWtZeeVmDD2Re+mYoIDnT0PaG7kqN/mg=;
 b=Mek3dnXtIUsl1ep7k31ICMi0nee9DTCTRphEZbvt9Mqke9VUlh3Ka2Jy4qTXD9HOXn
 cEOZ3GH9dv1fw9LUQB0j113HA6zRXOuRfB+j33Vv2Nkwocyfs5Q1XE4wFOG8pUd67V7b
 rOs5Co5ziRFjuqm6PkSaUtgutU7SgPKxYissaaGUMlN2evYs+g9Y/i4mR/8L27vQubRj
 +zbtNdYROkk74UogvuHQ425jQI7Ar+d+oGZhj5MOs7HKsQ9G4OjqEtA3xAyXm4Bb1Onm
 1AGRfwXRp1vwme+eE/Sa73ETLso1jP+KrmITyoiVpt9YevghxkuwHCoQlWi0flM4yH5w
 a/rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tq6DPJouguMrWtZeeVmDD2Re+mYoIDnT0PaG7kqN/mg=;
 b=3JTagts0yNY5lKrZkb2VWuqJKSq03LhGWSbOgTum7mGwZfRBO6Dm/ECbSewoyhzhBA
 EW8v2cnh8+C0AH61BzTGlrJ9+Hoef82ALSPXV/T1DzUWAkwCdgLwXI5j2BlXbxgKHBuf
 oUdq5D6H+hd4Az8PUK+00bKhaShePOwnlEuswJHbV31Te9QFXl4EyYKm84khKSWepbIQ
 92UCQc/QaaLS307bl32ec5mpfSoXBKi0E51507doeDkmsO4oCWkmyvOI+d0LO8qEHJ3g
 e5rKLLDRWlkqF9uZ9HM638n/w3ORh+8+9TOmc8zA8AjDfX0lDJsnpFZ5U0seW76pswSi
 j7fQ==
X-Gm-Message-State: AO0yUKU0EryWW02zBuTzkUEkzDnNlK9E/u3McatWt2o32+HPwNBQTMAA
 lrt+GZ8j2minNH7Wsr5srE108j21uKKml6YD
X-Received: by 2002:a05:600c:35c6:b0:3df:9858:c034 with SMTP id
 r6-20020a05600c35c600b003df9858c034mr12591508wmq.9.1675722943215; 
 Mon, 06 Feb 2023 14:35:43 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 h27-20020a05600c2cbb00b003db12112fcfsm13356593wmc.4.2023.02.06.14.35.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 06 Feb 2023 14:35:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 07/11] target/arm: Restrict CPUARMState::gicv3state to
 sysemu
Date: Mon,  6 Feb 2023 23:34:58 +0100
Message-Id: <20230206223502.25122-8-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230206223502.25122-1-philmd@linaro.org>
References: <20230206223502.25122-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: uPHCyvpSaxrQ

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/cpu.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 1c1e0334f0..002082eb5b 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -769,9 +769,10 @@ typedef struct CPUArchState {
 
     void *nvic;
     const struct arm_boot_info *boot_info;
+#if !defined(CONFIG_USER_ONLY)
     /* Store GICv3CPUState to access from this struct */
     void *gicv3state;
-#if defined(CONFIG_USER_ONLY)
+#else /* CONFIG_USER_ONLY */
     /* For usermode syscall translation.  */
     bool eabi;
 #endif /* CONFIG_USER_ONLY */
-- 
2.38.1

