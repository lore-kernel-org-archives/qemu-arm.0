Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp1192768ejb;
        Thu, 23 May 2024 09:54:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWvv8F1PPQ95dT8N/KKtJk5oEvbvlmC1515w2GTsjo4IPjkWv4IA9CzCr6mt4etIAa3ETOVz88JgP7uoGjpWRyzBAGgVjva
X-Google-Smtp-Source: AGHT+IF7oBzVL2spi1uLyFZaQnDYsvJxB+uyp2LOFmsKofA9xphXtUH+ZfrveE9B9GLJBbYtUnIJ
X-Received: by 2002:a05:620a:728d:b0:792:b96d:370b with SMTP id af79cd13be357-79499411553mr595873985a.13.1716483282750;
        Thu, 23 May 2024 09:54:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716483282; cv=none;
        d=google.com; s=arc-20160816;
        b=Sfe8uK4hCCZljx/17PJv7olhDOXI/kVEa5pS1zGXd4G52+JqHDMfNmJxTxeJ1MYEq7
         f8q2TvFykt/y+gamoWeCo2O1JIm6COfZh8AJN/hU5yszL7fEAa0Fgwe6AScQjF/RRprZ
         BC+z7t7HOxTr8vbEaaxPmtDn4e3vtqBVhwxe1NDazOYsS+s9Z8RrO+WpqAqht0TlvG8W
         oBjLTpSIDws/PLd1ralibgp5I3IhWEekoQKAB7i3FAx6pLP4eyhysphbHzhl2GiDPZWB
         sl52GIQ2YaAFGiHMgV0Bo1P1RxL2fu29irX8P04Xbwk9wNNR5W/vbVbbSViQ/1wOSyOV
         QwmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=1Fb0VmZJ3Rr1Wc8kYftUyQjNBuE76+9pDPpnUASsNMQ=;
        fh=du/epK6u+BjD4/PElefJ0Ung7GOcNNERvVWeMq+vBi4=;
        b=pu9FjbwAz0vT4AciXX5NES0OWfdmVb+5iXlBQPB1KriYYNfWq/d49iNfrkGDdZ/1VY
         ak817XpEhcGa2cVpvL1fdS1/6T7CQkXmz4W0coSDSV4SKiBsDaq8VqugVfsjAlUaEGry
         ZnSNnMbM+YcIQ4zgVM4JK1XHqh0U6dFi6DVrWowEFekGhLc87X/PVfB0FhRtevSEEJ3w
         +W26xtmtI0d5On1K8vp/bidL20HjglykbONbKcLWrrM98X8ubdtrSCLH4mhB6nvW/vIx
         6oQUJAt/eJUc5CODGYcU+0X1SNhYRKCwXD9bjF/ZNidwNGPe/tdUDusryZeQf1zot/Kw
         8TDw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-792bf277dd6si1209832985a.30.2024.05.23.09.54.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 May 2024 09:54:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sABho-00077Q-Jg; Thu, 23 May 2024 12:54:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1sABhk-00075X-PN; Thu, 23 May 2024 12:54:14 -0400
Received: from muminek.juszkiewicz.com.pl ([213.251.184.221])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1sABhh-0000re-Ql; Thu, 23 May 2024 12:54:11 -0400
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id E4D6E260CC8;
 Thu, 23 May 2024 18:54:05 +0200 (CEST)
X-Virus-Scanned: Debian amavis at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavis, port 10024)
 with ESMTP id JjoDwtTKo0vG; Thu, 23 May 2024 18:54:04 +0200 (CEST)
Received: from applejack.lan (83.11.37.15.ipv4.supernova.orange.pl
 [83.11.37.15])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 6CA4026073E;
 Thu, 23 May 2024 18:54:03 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>, qemu-arm@nongnu.org,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: [PATCH 1/1] arm/sbsa-ref: move to Neoverse-N2 as default
Date: Thu, 23 May 2024 18:53:53 +0200
Message-ID: <20240523165353.6547-1-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=213.251.184.221;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=muminek.juszkiewicz.com.pl
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
X-TUID: ixHc5g3ZA+E4

Moving to Neoverse-N2 gives us several cpu features to use for expanding
our platform:

- branch target identification
- pointer authentication
- RME for confidential computing
- RNG for EFI_PROTOCOL_RNG
- SVE being enabled by default

We do not go for "max" as default to have stable set of features enabled
by default. It is still supported and can be selected with "--cpu"
argument.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 hw/arm/sbsa-ref.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 57c337fd92..e884692f07 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -891,7 +891,7 @@ static void sbsa_ref_class_init(ObjectClass *oc, void *data)
 
     mc->init = sbsa_ref_init;
     mc->desc = "QEMU 'SBSA Reference' ARM Virtual Machine";
-    mc->default_cpu_type = ARM_CPU_TYPE_NAME("neoverse-n1");
+    mc->default_cpu_type = ARM_CPU_TYPE_NAME("neoverse-n2");
     mc->valid_cpu_types = valid_cpu_types;
     mc->max_cpus = 512;
     mc->pci_allow_0_address = true;
-- 
2.45.1

