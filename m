Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp8361581lfk;
        Tue, 16 Nov 2021 17:16:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwniqkVO6CVnqIL6iwZfnLaZXuhd3n9XArzJWrOX5JS2bfWoAGgW01NyIkzeo7nkO7osYH3
X-Received: by 2002:a67:d80c:: with SMTP id e12mr61158183vsj.18.1637111801655;
        Tue, 16 Nov 2021 17:16:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637111801; cv=none;
        d=google.com; s=arc-20160816;
        b=DagEc+ad6Y4lrpOHM7i/MOqjSMn3YHG+k2JidCBc28JPUUd5Eh98sCAlUvSTGYvbgR
         N5HtvRtVnPdeH0sD53G3+q7tAlCLvh4ZWPx1266vKQkj0KnpNUgdAdzMjbzo0MDsBTTh
         aSGCQU940lC1tsknx3wGF5DJXVaD+T4j/cwaSqUCFXwY9inSG4RKxBRxdFsFMvagCL4Y
         4ofUaBheuBokZlZ9+dudizm9kvn6ldlJlZCGIUKj2Szvi+NFIJIYZ5+rvg63bUS39eYw
         ywxugxxBOfyOXN5cZNBPI4/5oLELglJ2AYIkJbt2Hef3LIfZO/I8etqj1WEM/2/jZH9M
         BWZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=SXZ3fPAhSlY/YYT+4570e1VSE89AH7k22PbVV/xlh+k=;
        b=WWQgTTD1Z/HHqPPQcVP2VtKoAWcP4j9b0xgdHJjOLkC71XmZiUrpCtegbX8x4F7UOl
         aPwvsLwIfCh+LFzmMgZNUapwM/ykXIGaX0RfkMdwqGgGv76ZwPifmT6BxellvslBL6MY
         l1zDPurR/2BPsXJdUSo8rHDzD7WfYAfNefC/b3F1Kz4EJGLanC75a2cDFTS/xLcuEZec
         pYmT0V1uwB8IpKK9Y3NP+5GEWiEb7se4q24jGK7pWHkpEzDAXesRK3LM09o9gqZdOq8H
         lTOOYwwH+KNQL6CF/ihj7appQ0s/jvaiz3HFTtROemz25xDXDuk7g07RTrjv+stk91DN
         VhHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=TuGdr4UH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u17si3275601vsk.72.2021.11.16.17.16.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Nov 2021 17:16:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=TuGdr4UH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mn9Z2-0008Ei-TW
	for alex.bennee@linaro.org; Tue, 16 Nov 2021 20:16:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1mn9Xj-0007ou-UK; Tue, 16 Nov 2021 20:15:19 -0500
Received: from [2607:f8b0:4864:20::f36] (port=46760
 helo=mail-qv1-xf36.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1mn9Xh-0003HT-O4; Tue, 16 Nov 2021 20:15:19 -0500
Received: by mail-qv1-xf36.google.com with SMTP id jo22so821485qvb.13;
 Tue, 16 Nov 2021 17:15:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SXZ3fPAhSlY/YYT+4570e1VSE89AH7k22PbVV/xlh+k=;
 b=TuGdr4UHA3XQPq7CvbdtPANZ09CbFg+2jNoEPB+KBeP/wlUnJatfDc2FGbKGiaRTOh
 6rY2xifFS63+NsPo+4gIpxmIT0pFjFgGSqHMjiFE4E1UtN1MTnyEtHSkXk+EKDym8HnR
 2Pj8woJoiJgt9v+Cp5MqgDGMmtkR3rXlEV1rJZbsA7DYDNm0uqf+DeAXBGXFPlSD0Q+n
 BNQPZslFbrUu152/1X2cG5o9KoYz+mybyuu5Jq3H/eYUSz05l3MFhf5GHgx7Rp8vX0C4
 BNAyaYNQuTRhrGQPnsvAhjugndPFMgNc3PZraoFiHawvyQT7BolNFpYUKHaP/nDtB56Z
 CYMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=SXZ3fPAhSlY/YYT+4570e1VSE89AH7k22PbVV/xlh+k=;
 b=3HE1ACxfK21UxZAinQrYEawRa5qQi33EfUH/f8MzT3zImYI4xEZ2GqZ80aHzq0/IUm
 ZEo529tYeRVIf9oj0BJvmNjRfKgOkq0LP4M8xX+b8USOG1Wtk+Vk8GfH2DudXaw3l9kH
 cC9+RUxsjWTko55CKBIxXcOxGdI2WWcchr3xymn0D6DTJHk5jn0eM3jamghvpK7gd/pj
 Ss4HqqYaaSVmjzIWi5W/RuD/vypP2N1hpjx8OtbZOjTSEa8I7uioPbh/dn2DkYi41ZFt
 eg+v/qQvNSpYYXXLEjUc0tuUw0Crs5gq76a6BSoW6ylWvp9yLwSJ8wbN2TxU9sg2Lea3
 LynA==
X-Gm-Message-State: AOAM5313i4o3MdEppW1aSiiXt9MpgMCgwUMfxJYXCNtV5AYmJbNrfogd
 dZfPJBH8ujG9rUXb8izuj41Ydcvs60PMuPRE
X-Received: by 2002:a17:902:e885:b0:142:1500:d2ba with SMTP id
 w5-20020a170902e88500b001421500d2bamr50403621plg.19.1637111399361; 
 Tue, 16 Nov 2021 17:09:59 -0800 (PST)
Received: from voyager.guest.fluxperth.local
 (210-10-213-150.per.static-ipl.aapt.com.au. [210.10.213.150])
 by smtp.gmail.com with ESMTPSA id z16sm15211376pgl.29.2021.11.16.17.09.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 17:09:58 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [RESEND PATCH 0/3] docs: aspeed: Minor updates
Date: Wed, 17 Nov 2021 09:09:44 +0800
Message-Id: <20211117010947.297540-1-joel@jms.id.au>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f36
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f36;
 envelope-from=joel.stan@gmail.com; helo=mail-qv1-xf36.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fSTzEIJdxBZC

Here are some small updates to the aspeed docs.

Joel Stanley (3):
  docs: aspeed: Add new boards
  docs: aspeed: Update OpenBMC image URL
  docs: aspeed: Give an example of booting a kernel

 docs/system/arm/aspeed.rst | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

-- 
2.33.0

