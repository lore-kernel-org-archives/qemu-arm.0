Received: by 2002:a17:906:acd:b0:a66:557b:2f6e with SMTP id z13csp857454ejf;
        Fri, 7 Jun 2024 03:39:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVb1GCyQkDO8E7x7CO5oxqbicrJl8bpmdvfi37GHlIXVsqudV59Q3Hd5Sh13ApzQKEpgMVUPsqLdB/KUPrsjzURXhwDLosd
X-Google-Smtp-Source: AGHT+IG9H9xyGeY5RhRa1teg1XpqqpOj+EZPpDwXfm6BiI83d/4kIbaMn9IviEPYJLc9oK8O912Q
X-Received: by 2002:a05:6214:5884:b0:6af:33ed:87de with SMTP id 6a1803df08f44-6b0595d26eemr27054796d6.20.1717756758132;
        Fri, 07 Jun 2024 03:39:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717756758; cv=none;
        d=google.com; s=arc-20160816;
        b=RQsHmaJ0iJ3g5N2cAdoIKhuprvOEgY2kQMTpnQIzTwC3ZQAsWQBoBFraaC0ZKhYkAK
         0eyFS/vNIx7r0qvC5xhfIiBd+F3iy57fykZqNX0S0WbW9Ahl1fkKkOLz4IRHSOUo4FAU
         fkC9fCUh5qBZsZJ2aMC2VB2g42jk4hgf7PLH8PZtzLHc6Rb4ddh1jbNl+c/hMaDQKtfS
         VtU3j6vG/sHvCl4F3vhhHTarVmvzlaoQwF3krQVZfFYSJ9V3+WjGnFWTSdtdkltdp/ku
         4yrCO0sbfCaeRg6dNQGdL8AAd+0GIGNfSDxj/QZ0DvN3qu1qpc9TGTfgbjzEpRQyiu0G
         R5BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=PCVkTGuF9+q2TU/kwAru4ZdgVCNZGGMKM3nTTSStLM8=;
        fh=V+VS/T1MkPk0w2XvUnHKwYRlsexEMINcJGrNSFFLIrQ=;
        b=YcXIexV2uFnJnVEMu4IdDkhSMcuPASZ3bRefg6l1eXN2KgC80/vu2DRLnfo+wRbcSo
         pP2jwEuBNBqT6+gVDrPbue2ygUXQB7EHLnRlWQN7rY/T3yOnJlCbMBSq1O6QZKYJEsNL
         93kjsO1xPS5E7I6Wrt1x2WPcPPuXpYsWstjQVXJp+0UrlsIZHFn3ycHnZjDHd5aMUoIF
         rlM/fGh/ZD0BdHsFt1L0ozxCVQT5tjo36l8W//rom7QTQEZrVY4NTpUnAYr5Lj0CP71H
         OwXuOMNUPJiDv3AVHjWuYeov5EMnVTby8KNO0IdjbM1B5YyJMr1pJa6FYGskawfIWnC3
         g9aA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b063e3c9f5si1335236d6.242.2024.06.07.03.39.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Jun 2024 03:39:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sFX03-00055p-Gb; Fri, 07 Jun 2024 06:39:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiongyining1480@phytium.com.cn>)
 id 1sFX00-000553-Qx; Fri, 07 Jun 2024 06:39:08 -0400
Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net ([162.243.164.118])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <xiongyining1480@phytium.com.cn>)
 id 1sFWzx-0002c4-Bd; Fri, 07 Jun 2024 06:39:08 -0400
Received: from prodtpl.icoremail.net (unknown [10.12.1.20])
 by hzbj-icmmx-7 (Coremail) with SMTP id AQAAfwDntt1G42JmZF4sAA--.26038S2;
 Fri, 07 Jun 2024 18:39:02 +0800 (CST)
Received: from phytium.com.cn (unknown [218.76.62.144])
 by mail (Coremail) with SMTP id AQAAfwA34tc742JmSdwAAA--.1309S3;
 Fri, 07 Jun 2024 18:38:51 +0800 (CST)
From: Xiong Yining <xiongyining1480@phytium.com.cn>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: rad@semihalf.com, peter.maydell@linaro.org, quic_llindhol@quicinc.com,
 marcin.juszkiewicz@linaro.org,
 Xiong Yining <xiongyining1480@phytium.com.cn>
Subject: [PATCH v5 0/1] ARM Sbsa-ref: Enable CPU cluster topology
Date: Fri,  7 Jun 2024 10:38:24 +0000
Message-Id: <20240607103825.1295328-1-xiongyining1480@phytium.com.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAfwA34tc742JmSdwAAA--.1309S3
X-CM-SenderInfo: x0lr0wp1lqx0bjrumio6sk53xlxphulrpou0/1tbiAQAJBmZiD2QErAAAsJ
Authentication-Results: hzbj-icmmx-7; spf=neutral smtp.mail=xiongyinin
 g1480@phytium.com.cn;
X-Coremail-Antispam: 1Uk129KBjvdXoW7Wr4kAr45ZF1rZFWUWryxuFg_yoWkJrc_Zr
 4kZayFgrs7Jr4v9ayFya1fAry0k3yj9r15GrnxKFW5tw1rCF4DtrsrG3s3Aw1rWr18W34D
 Aay7Cr4fC3sIgjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrnU
 Uv73VFW2AGmfu7jjvjm3AaLaJ3UjIYCTnIWjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRUUUUU
 UUUU=
Received-SPF: pass client-ip=162.243.164.118;
 envelope-from=xiongyining1480@phytium.com.cn;
 helo=zg8tmtyylji0my4xnjqumte4.icoremail.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: HBtWiq+U0HvV

Enable CPU cluster support on SbsaQemu platform, so that users can
specify a 4-level CPU hierarchy sockets/clusters/cores/threads. And this
topology can be passed to the firmware through /cpus/topology Device Tree.

Signed-off-by: Xiong Yining <xiongyining1480@phytium.com.cn>

--
Changes in v5:
- use /cpus/topology to describe cpu topology directly.
- Link to v4 https://lists.gnu.org/archive/html/qemu-devel/2024-04/msg03940.html

Changes in v4:
- align the machine-version-minor to 4

Changes in v3:
- squash the two patches together into one
- add the DTB information in docs/system/arm/sbsa.rst
- Link to v2: 
https://lists.gnu.org/archive/html/qemu-devel/2024-03/msg02951.html

Changes in v2:
- put this code before sbsa_fdt_add_gic_node().
- Link to v1: 
https://lists.gnu.org/archive/html/qemu-devel/2023-12/msg03390.html

Xiong Yining (1):
  hw/arm/sbsa-ref: Enable CPU cluster on ARM sbsa machine

 docs/system/arm/sbsa.rst |  4 ++++
 hw/arm/sbsa-ref.c        | 11 ++++++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

-- 
2.34.1

