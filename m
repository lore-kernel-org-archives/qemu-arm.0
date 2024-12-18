Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp881690njk;
        Wed, 18 Dec 2024 04:31:48 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWKCmoGdVxuyH7dwWvf7CX531QhY09xZ/sYB1GYx/5q91RRepYfOos1e5l+abmuLawOtSG6+I6aPUbV6Q==@linaro.org
X-Google-Smtp-Source: AGHT+IEh4mb47OJiowZuw/990BGaWq7BAgocrcS1DTccUFOW1V++cnM6HJWygWJU8RFswziWXx+P
X-Received: by 2002:a05:6122:1e08:b0:516:11c9:f46 with SMTP id 71dfb90a1353d-51a36df2c31mr1815705e0c.12.1734525108116;
        Wed, 18 Dec 2024 04:31:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734525108; cv=none;
        d=google.com; s=arc-20240605;
        b=Y+PHTGzLpujpIgY0Yevg7cxUT5s18ENXfpUih40jKCxvdh/12hAJZ+BJM3yEgGIC8G
         kU9oLLnDc+mCUnptPS72f2DX530599SFUFxBR5y3aRS4+8nOPFJ/1wdXYAZ7i4CmB+jZ
         /A/+FiUTc7BbRuVvTzbaN4m5BcF4oISKj1a0ZnKo6x7xwdpoh6qOt8vKcxWu4JGpxxSU
         lRJlLPYP0KhJkgTpryozf2PvwEPD4EEWja9NR1eCf1pcWNLg1VToQfP1GjHRp/gTUIIf
         K0GDyqTSEJOJNJzlpv6ERbfoMbK1AZeDfROmzLp2GO61hkSJ4anlYYWUhkf6OMlyYNT5
         uTEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=0lGxPdDUNres/qgj71MFksVE9EyY0fMEzGI3zvEKGlA=;
        fh=TaCIvpf94pZ18TzJ7KN7khzwA8pBb+zTi+fOApVR+VU=;
        b=cjBiAb07neNiJPGfjt8lT+O2FGuK+Ja89kxeI3340PPRU9E3roETJmPJOL2C/7d8iZ
         AK3/hE4wQZU7Y3k4KqvXJwUF80rpdc5RW5ZNyn1IDKf0lZKEGhRo6XAPo+9V+CoIjLJb
         o2boCZ9tPU9pxJz1MeJCsEjoj5oncnSLVHYpDrPdAA92I6gyI3ArahLJGJqsyKR/vbDY
         cLU5yV1Li/Rr3GGAdlR1j89PM8XZZNWhECN9Rjwm/pH8XP8D1d1yGz9f/IkVmmMPA/Ms
         omowfJWZ8QKOezuovZJ7MMjZrlh3A7tmkaYKmQvhKR/NHCW/jiKA5YHL9O6mbPbBUO+6
         2tVg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=C+PtcgqX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4b270251025si2623988137.168.2024.12.18.04.31.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Dec 2024 04:31:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=C+PtcgqX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tNtD1-0003k3-6K; Wed, 18 Dec 2024 07:31:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1tNtCw-0003jR-72
 for qemu-arm@nongnu.org; Wed, 18 Dec 2024 07:31:18 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1tNtCn-0007pU-AB
 for qemu-arm@nongnu.org; Wed, 18 Dec 2024 07:31:16 -0500
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a9f1c590ecdso1109480866b.1
 for <qemu-arm@nongnu.org>; Wed, 18 Dec 2024 04:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734525065; x=1735129865; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0lGxPdDUNres/qgj71MFksVE9EyY0fMEzGI3zvEKGlA=;
 b=C+PtcgqX86EW/rO3puRiMQvevsl46Zlpa+u4e1imJhix71B6aNamgT3/xVlxL5BZZ/
 xuZ0B2KpikXusGtqCLVPHLZQJ3mk7BqS/bRsrlHhD55l7EV7+WDWgOupSUB1eENz3RWz
 7ynKyrjDGPeRLPnJi2igMRtngiJ5Pj0Y/zx/Gk3tcTQFoJfB0AHvc14HqQDPVVgVQluF
 cPfiUatpjS/e83Fn5zluMd3L1ebXUQmjstkkOWnNPR0eH1Icz7pBSF154kWr2yeALs27
 b6Ht99sCkHV8N5X18/Juous2JJCDN4W/PbW/50QVpzi3xUvtFpyQD2igcMO/DQkeb7jL
 4cjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734525065; x=1735129865;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0lGxPdDUNres/qgj71MFksVE9EyY0fMEzGI3zvEKGlA=;
 b=rfJofTbYr4m4rH3mTleKu8dgSVsOfIA+bH3kUu8Fc+SuEL8GYowkT8sjuii/hLM7C+
 FMaEYF+Hu3zTOit3BLgUs9saM0EBpLePeUJxiNmlH8GJzYh6wJAIXmUWuchztl/xKxEI
 gGqTli0E3XlNTayzsJflvqB6klTWH9NX6/LRXD2nSri5rHFkUEyiY6xb0mgnMtm6330+
 8oM3JIE9uCcSzLMvcn1A6PxiSh+SewnnEOYLB7prwS+0g1ceEm9rCfRNFkIpx5ZZEoHA
 tkuVTga8Z+hHW6ymynPAhFmoEvESfkmSAvG+mHqVYjZV8UKIpnDsqGvY15npfwgvUEEc
 VRFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUo98ohHjuUOgDCIYdoXbF9ZmZDn02y+qkJhVbSSuXMOWZ1SAIgE/UH9xpLcqJpF/tsYJ+fvN3abw==@nongnu.org
X-Gm-Message-State: AOJu0YzUL7RQmDLaKz6Od1mQM8AB80avSCBDx439oWohXfDsMJaskSqr
 DaA9GaWSyaWeHaMw9cEQlK48wIG0No6jdE0l6gRQnspwZ/zd6DboBC5e6FjWsDM=
X-Gm-Gg: ASbGnctq+QrWMYicioRiSlFx484qJAlQNSycm3ZjI8DVhStJYb52DDdsX8Gg+7Ya91A
 eUSZswyYa3ilVyolrV+UrzNbTb2M7s8sxvizWg5MC+9dBij+fXEAdpswc3gGN7ELFgWLSyM9CBE
 u+Nrn7770iQyrvoi5t6MmRcGX8SCqMPkCWqZb9Gq7wg8/I3nbFq1IFLyGtUaQVULz4wMVcB5DDl
 4vcul86QBTaM524YPgmN+2ZaDu+YXWnyH1lAQIt90dOE1Pg1Aeeyeher5AWP1IOXIt4fL+8qBwa
 vBzWa48vOkw0jJspDr+JEcNo64tcyYY=
X-Received: by 2002:a17:907:6d05:b0:aa6:abe2:5cb8 with SMTP id
 a640c23a62f3a-aabf497ae81mr170152066b.60.1734525065378; 
 Wed, 18 Dec 2024 04:31:05 -0800 (PST)
Received: from applejack.home (83.8.62.35.ipv4.supernova.orange.pl.
 [83.8.62.35]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aab9606891dsm550550166b.72.2024.12.18.04.31.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 04:31:04 -0800 (PST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: qemu-devel@nongnu.org
Cc: Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>, qemu-arm@nongnu.org,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: [PATCH 1/1] MAINTAINERS: remove myself from sbsa-ref
Date: Wed, 18 Dec 2024 13:30:55 +0100
Message-ID: <20241218123055.11220-1-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=mail-ej1-x631.google.com
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
X-TUID: F6YbryH0W4p3

I am ending my time with Linaro and do not have plans to continue
working on SBSA Reference Platform anymore.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 822f34344b..776e0b997d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -918,7 +918,6 @@ SBSA-REF
 M: Radoslaw Biernacki <rad@semihalf.com>
 M: Peter Maydell <peter.maydell@linaro.org>
 R: Leif Lindholm <leif.lindholm@oss.qualcomm.com>
-R: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
 L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/arm/sbsa-ref.c
-- 
2.47.1

