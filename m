Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp2227425lfc;
        Thu, 11 Feb 2021 04:43:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxfprsXRa+eDNWaQaCBGOzeyWBBtfum9U/5VYKSH61DZB+4LxsGt0rvuDaXfYzJCNdLgvjM
X-Received: by 2002:a25:1646:: with SMTP id 67mr11505476ybw.97.1613047428709;
        Thu, 11 Feb 2021 04:43:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613047428; cv=none;
        d=google.com; s=arc-20160816;
        b=olILexW/uhG8BjGJsRV/N86zK6QAZXC5B0GpNpj2qoh74UOYkJTcC9aPArdZ2AWeE0
         XctK74EBaREL1h7JqymW0sso4Fa9KOOM21dSx6pHLMJy7czoVpFbNtLbCEWtXSicVBlk
         6/0A2ZBo+TufNbmYSql4pBvEFJ0g6JLYxp7qxUS7fg4aUU4GAigpvm6aaBPAgy6MocGw
         d2K2TOPssT2VNG2f12msNIznY8rbDQ5liT3TnOqKz5PZ32qe8DXToAaVIFs5pte4pafA
         Xu/LZplALu6oYFVWWB3+skisjky11ObMnM9TML4rouWSiKEWSmqmR++Qd0lGSJqVF34r
         ZM/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=9/wjlcwEeuiTWAdtekuNdjPU5xcMSfyDpFRfiCsZ7FU=;
        b=Forte+I8CL/JDTOZhVC7+9NoS3o11AnBF4HxhRSAIQR0zq+2yuFm6tFbMMoiEHEsHM
         /BcmRNvhDz0+ZLUV53EKo1Jg1lcN9IanTUhHaK0YzlJaTflNNDHK920/zyZdJeS9Jkru
         ldnqLAWKv6ABMFN/Z5hqI/AR7KXXUcqDUDouozoW6B/2NoRYqYv3/XAiT9/RO53vC8Oj
         fwWeHu+TC0U2o7gAEEzNORUerm7lPjP4TKoc8R7/GsTDM4iGa30n4Hz7M5AybDDRrJSI
         usR++2vsThHytmzj0rZnSOqEYZEHAN3PLMXMk71rTvXR8BlgO194/s72+KOUVW8hIzPL
         OXZw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p129si4847786ybc.227.2021.02.11.04.43.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Feb 2021 04:43:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lABK0-0002sr-3i
	for alex.bennee@linaro.org; Thu, 11 Feb 2021 07:43:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1lABDJ-0005Gs-Vd; Thu, 11 Feb 2021 07:36:53 -0500
Received: from muminek.juszkiewicz.com.pl ([2001:41d0:1:43dd::1]:38580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1lABDH-0007Zt-5U; Thu, 11 Feb 2021 07:36:52 -0500
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id D49CC26026D;
 Thu, 11 Feb 2021 13:36:47 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XM36w5xa23ry; Thu, 11 Feb 2021 13:36:45 +0100 (CET)
Received: from puchatek.lan (89-67-26-161.dynamic.chello.pl [89.67.26.161])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 567FE26026A;
 Thu, 11 Feb 2021 13:36:45 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: qemu-arm@nongnu.org
Subject: [PATCH 2/2] sbsa-ref: add 'max' to list of allowed cpus
Date: Thu, 11 Feb 2021 13:36:38 +0100
Message-Id: <20210211123638.1820482-2-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210211123638.1820482-1-marcin.juszkiewicz@linaro.org>
References: <20210211122022.1811362-1-marcin.juszkiewicz@linaro.org>
 <20210211123638.1820482-1-marcin.juszkiewicz@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=2001:41d0:1:43dd::1;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=muminek.juszkiewicz.com.pl
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Leif Lindholm <leif@nuviainc.com>,
 =?UTF-8?q?Rados=C5=82aw=20Biernacki?= <rad@semihalf.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tddMv4QgxSBZ

Let add 'max' cpu while work goes on adding newer CPU types than
Cortex-A72. This allows us to check SVE etc support.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 hw/arm/sbsa-ref.c | 1 +
 1 file changed, 1 insertion(+)

diff --git hw/arm/sbsa-ref.c hw/arm/sbsa-ref.c
index 276243d122..88dfb2284c 100644
--- hw/arm/sbsa-ref.c
+++ hw/arm/sbsa-ref.c
@@ -147,6 +147,7 @@ static const int sbsa_ref_irqmap[] = {
 static const char * const valid_cpus[] = {
     ARM_CPU_TYPE_NAME("cortex-a57"),
     ARM_CPU_TYPE_NAME("cortex-a72"),
+    ARM_CPU_TYPE_NAME("max"),
 };
 
 static bool cpu_type_valid(const char *cpu)
-- 
2.29.2

