Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp6255056njc;
        Sun, 10 Nov 2024 13:56:56 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX6ltOlrseV9Jg5uKb0pEHZLQ3G5wjJmj/fAhOY3Kbq3Fg+EwBoHUGW3XHNtL4mWRk27LPQ29YU/40M1g==@linaro.org
X-Google-Smtp-Source: AGHT+IH4S9AlUeM9Y5I6UjoPmd29GX3tvGsMFUHaommBFeWoiN3+0MHKUhyOSO7guBQxGL+chT9o
X-Received: by 2002:a05:6214:5707:b0:6cc:598:67a8 with SMTP id 6a1803df08f44-6d39e1e1a5bmr124412826d6.38.1731275815883;
        Sun, 10 Nov 2024 13:56:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731275815; cv=none;
        d=google.com; s=arc-20240605;
        b=h7sLyLUxTAgHWtXEsx9OuwRG5jrlyB/J/K52Jai4g6oPOK7NjQXTHY9NB2psJW/y9z
         P2fI4W3YFUINNHDyok1UeLGX2QOCAZ+gvCaRRsE6UNhflpxK+nzi73HYRWoklhR6YpwG
         0VwXjf9kv+rNKRo2fxu9PGw3SyC/8g9sVfg7BkzS2994IPOX8FpLjEvCE9SLHaq8Sum8
         dNVnPHHspoCdMHSEH+X4jorYcXlPAwSPTlls0s/01RGEibSXWgN1tF8yn55N9BAEKiOg
         xgGezpyjKdpbHw9FiTThZXPB9ZKzyagN2yMRkVIvuXsr8sahUgN0v9RF0G9mS5c6Jmo4
         e8gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=OIhXQnoj/9ouYAI2nP3PoRv/lz28A9hOVY2Snhhf/9M=;
        fh=EON/uwfBjvI7jfpkIY4K5DULxoZ6EnfmBHl0OueVxWY=;
        b=LLYB5wbkEM+0jI93/GvkKIsa1kLl4GRdMzzHfdCRK8MR9K4FZmMzX/iunJrj5YHXcB
         xqWsPpHTCB1ZOHWGZlsIOr1QQd48bbWChwgOkMlEWiE/G5gqQnLikNQ5/0c+/yMbIqa5
         CZTm1a+arY4yrEuX/tO6ElAJ7wjsqqVKdjEqZ/d5gbKU0HDyDKEuutGEcAwoG6Czuptn
         BMFdhH6nzPVprdrXtPST3/jWlEYmfNo0BVtDHT6TdiCBm1ss12doAODxJiqciwu6+kCd
         pGtVPSVBPvGdIdlUYwrhanT2lxF6aULqX3QAcPFG22WpN4vuACvZpTTz1hEGRrjV7Hbw
         pFcQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b="SeHQ5o/d";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d3966b22b1si95143076d6.480.2024.11.10.13.56.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 10 Nov 2024 13:56:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b="SeHQ5o/d";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tAFuL-0003l3-AJ; Sun, 10 Nov 2024 16:55:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tAFuH-0003hB-BI
 for qemu-arm@nongnu.org; Sun, 10 Nov 2024 16:55:42 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tAFuD-0003xD-Sg
 for qemu-arm@nongnu.org; Sun, 10 Nov 2024 16:55:41 -0500
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a99f3a5a44cso524766366b.3
 for <qemu-arm@nongnu.org>; Sun, 10 Nov 2024 13:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1731275736; x=1731880536;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OIhXQnoj/9ouYAI2nP3PoRv/lz28A9hOVY2Snhhf/9M=;
 b=SeHQ5o/do/7angSREGqS65fkKuSyhDB9B3AIvEPyTCuOuw1KZOgz79nc5XeTGvLikV
 0bUGv+QPTcSRnWNCS4g83ik+b7CSifp/ccdyhZIHbtDWZSFmtk9mt85YwwI2z+2Puo9k
 YrCWIK3AL6gwAf1M4SlZARKuf74aSUSYB0gE/yu8/4dov2Vzn0pJV1xlz3Y52ZGljP7A
 yG6V5SA9XwOlBw2JQG7c2qMLLlFnopXdqFMA9TQ1hunBz9dBYWuHWFmkM00c9h9cHr+n
 pIgpvRO5Mhxv7YWIGbkkvWfnPodTRb1Gk1J7dby1J/tP6wQO89u5ecee7d2WYiamn5Pv
 64oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731275736; x=1731880536;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OIhXQnoj/9ouYAI2nP3PoRv/lz28A9hOVY2Snhhf/9M=;
 b=jSczrPHI/r2UV11gSJOTpCQwXtKMB2DHXkHPe3fEOdgwg4H6SOmni2Gwit9/7y4pzk
 a/nymg6h98XZxbRboyGyK6MabA6PXrXyYOzHqBqYLIM3n3BD0tvJGEPnTJDi0/lBvUNO
 8kd0S6nw0bD/IxwYOXnIZg6Rai7O3d8XmQKLEDd2cBF9E42BIw3jCcLX690cURyZfzVj
 PJbrxqWZGz5/0lOqnx/g2l63Le2Zq+fVkaYpEMJ1K9Vgslx5wz3NJATGtV2v+a17i+Lq
 cMfgLUVNtFNF9uh5Z1YKPiY/J67NQPypqDYgHUm4hJ46ttSU+vnkbA5bp6t02vKnGdL2
 RnhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1CEhtry7sZugJf8Xa31+qpP6vrODhlH5oCPPuHgKzI0TCBKa88r5YmGGhZNjC8A6Ie/1B5d7TGA==@nongnu.org
X-Gm-Message-State: AOJu0Yziw2RfdW9AzCBYahC8N3N8f0etUU91f2AM9Vk4W2mYqNfwyM23
 8hl3pT0mARdjxYVq3/Aq9L+Gtm0SAy2gqYf91VhuqkLrS+jsx55dNbswgNOJ9A==
X-Received: by 2002:a17:907:c09:b0:a9e:45e6:42cb with SMTP id
 a640c23a62f3a-a9eefee4bddmr1033790966b.18.1731275735589; 
 Sun, 10 Nov 2024 13:55:35 -0800 (PST)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0e2f731sm523715566b.189.2024.11.10.13.55.33
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 10 Nov 2024 13:55:35 -0800 (PST)
From: Phil Dennis-Jordan <phil@philjordan.eu>
To: qemu-devel@nongnu.org
Cc: agraf@csgraf.de, phil@philjordan.eu, peter.maydell@linaro.org,
 pbonzini@redhat.com, rad@semihalf.com, quic_llindhol@quicinc.com,
 stefanha@redhat.com, mst@redhat.com, slp@redhat.com,
 richard.henderson@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 chenhuacai@kernel.org, kwolf@redhat.com, hreitz@redhat.com,
 philmd@linaro.org, shorne@gmail.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bmeng.cn@gmail.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 jcmvbkbc@gmail.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 akihiko.odaki@daynix.com, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, Roman Bolshakov <rbolshakov@ddn.com>
Subject: [PATCH v9 05/16] MAINTAINERS: Add myself as maintainer for apple-gfx,
 reviewer for HVF
Date: Sun, 10 Nov 2024 22:55:08 +0100
Message-Id: <20241110215519.49150-6-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20241110215519.49150-1-phil@philjordan.eu>
References: <20241110215519.49150-1-phil@philjordan.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::635;
 envelope-from=phil@philjordan.eu; helo=mail-ej1-x635.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779 autolearn=no autolearn_force=no
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
X-TUID: 2i5cok17kfXW

I'm happy to take responsibility for the macOS PV graphics code. As
HVF patches don't seem to get much attention at the moment, I'm also
adding myself as designated reviewer for HVF and x86 HVF to try and
improve that.

I anticipate that the resulting workload should be covered by the
funding I'm receiving for improving Qemu in combination with macOS. As
of right now this runs out at the end of 2024; I expect the workload on
apple-gfx should be relatively minor and manageable in my spare time
beyond that. I may have to remove myself from more general HVF duties
once the contract runs out if it's more than I can manage.

Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>
Reviewed-by: Roman Bolshakov <rbolshakov@ddn.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 095420f8b0e..b28267b6286 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -507,6 +507,7 @@ F: target/arm/hvf/
 X86 HVF CPUs
 M: Cameron Esfahani <dirty@apple.com>
 M: Roman Bolshakov <rbolshakov@ddn.com>
+R: Phil Dennis-Jordan <phil@philjordan.eu>
 W: https://wiki.qemu.org/Features/HVF
 S: Maintained
 F: target/i386/hvf/
@@ -514,6 +515,7 @@ F: target/i386/hvf/
 HVF
 M: Cameron Esfahani <dirty@apple.com>
 M: Roman Bolshakov <rbolshakov@ddn.com>
+R: Phil Dennis-Jordan <phil@philjordan.eu>
 W: https://wiki.qemu.org/Features/HVF
 S: Maintained
 F: accel/hvf/
@@ -2609,6 +2611,11 @@ F: hw/display/edid*
 F: include/hw/display/edid.h
 F: qemu-edid.c
 
+macOS PV Graphics (apple-gfx)
+M: Phil Dennis-Jordan <phil@philjordan.eu>
+S: Maintained
+F: hw/display/apple-gfx*
+
 PIIX4 South Bridge (i82371AB)
 M: Hervé Poussineau <hpoussin@reactos.org>
 M: Philippe Mathieu-Daudé <philmd@linaro.org>
-- 
2.39.3 (Apple Git-145)

