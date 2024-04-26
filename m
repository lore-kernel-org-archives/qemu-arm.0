Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp197613ejb;
        Fri, 26 Apr 2024 00:29:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWAoCMUGYybd/LtHgVTjr4rJ+g4uTcgj01ENuw6els5iX9QFL+Y++v2tR/jZQHc9m39aMel2e810qV2gfQmTiMaUZdtJpCn
X-Google-Smtp-Source: AGHT+IGsDeVDPsN0GwVmtIprcMZ2mqG+u6GQDECHf91/0DUPlDV1fhNXKFVEoaNxOmIb151VN8zk
X-Received: by 2002:a05:6358:e9c5:b0:17e:2943:c75e with SMTP id hc5-20020a056358e9c500b0017e2943c75emr1908742rwb.12.1714116548367;
        Fri, 26 Apr 2024 00:29:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714116548; cv=none;
        d=google.com; s=arc-20160816;
        b=B7Qd0uveHgu3zASjyxsOwpywUA15uMjh1Wga+7toUNvgEZBBLHfue0NXd+TTsrE6r8
         Yfe3FVjilscohXjJRCBj5tgXhjVc9OY2fj9+DVqN6PZisoopwinvTQR0QKOC1t+F/9Az
         7BIc1X5N58H0JNmCDVt3KswKweD6uEaQ/rYiBPC79yHi7LzmB3KLAB3uUSNXtc/XPXR6
         scY2EuRkBeFxnV3VOquCaJjrGezbfQ8dkLzBT5n4fHumzESGgzyPORaWPLpLIvJHj4Zv
         ITeawQU2xSVP06GSwazZ5PLp6saZsXRqo5EVXh9Ki7um6b7HZBhm7kRCZ+y8WehO/LnH
         iwqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=meqoN+TAheqW8j+c0nchXsOlN+Pwyl1wiRSbg6dtWpU=;
        fh=V+VS/T1MkPk0w2XvUnHKwYRlsexEMINcJGrNSFFLIrQ=;
        b=W2ancEXVxiObgmXvXxPhtpkjGDOcn2mvB/biaHtoshrUTBoTboDnlUYgX21xwiZjfA
         DEW+Dcf+D8MJcYwLT2CxE1d2KoyCDWSPa4sUyekS0g303HwsRQjCjuYF4DKP/O3rT/Zb
         nlQMueS+j9leIza+Wn4CLmvZqR6W4mltIA3DZ3wBIOtMelizIRZ10BogT159wSq8qZYq
         lQj9aSogxxRPQmRoY0mOTcV2QLst1Wfc8QtYc+KtFANEXThbS2KpoWwArn3yA0FoRaSG
         JZAlLsVbfomC1AxXfijWPab9Peeu3Etq3F9HpaJ72FAR4U629g2T7Pixtk0h6svoVOvR
         b6Bg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ex17-20020a05622a519100b0043a433a6d14si3803600qtb.578.2024.04.26.00.29.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Apr 2024 00:29:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s0G0S-00070g-O3; Fri, 26 Apr 2024 03:28:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiongyining1480@phytium.com.cn>)
 id 1s0G0R-00070A-6l; Fri, 26 Apr 2024 03:28:27 -0400
Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net ([162.243.164.118])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <xiongyining1480@phytium.com.cn>)
 id 1s0G0L-0008FB-FJ; Fri, 26 Apr 2024 03:28:26 -0400
Received: from prodtpl.icoremail.net (unknown [10.12.1.20])
 by hzbj-icmmx-6 (Coremail) with SMTP id AQAAfwCnWAmJVytmQ7X1CQ--.42S2;
 Fri, 26 Apr 2024 15:28:09 +0800 (CST)
Received: from phytium.com.cn (unknown [218.76.62.144])
 by mail (Coremail) with SMTP id AQAAfwCXaEyDVytmqGUAAA--.521S3;
 Fri, 26 Apr 2024 15:28:03 +0800 (CST)
From: Xiong Yining <xiongyining1480@phytium.com.cn>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: rad@semihalf.com, peter.maydell@linaro.org, quic_llindhol@quicinc.com,
 marcin.juszkiewicz@linaro.org,
 Xiong Yining <xiongyining1480@phytium.com.cn>
Subject: [PATCH v3 0/1] ARM Sbsa-ref: Enable CPU cluster topology
Date: Fri, 26 Apr 2024 07:27:03 +0000
Message-Id: <20240426072704.325883-1-xiongyining1480@phytium.com.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAfwCXaEyDVytmqGUAAA--.521S3
X-CM-SenderInfo: x0lr0wp1lqx0bjrumio6sk53xlxphulrpou0/1tbiAQAGBmYpXuMFaAAEsa
Authentication-Results: hzbj-icmmx-6; spf=neutral smtp.mail=xiongyinin
 g1480@phytium.com.cn;
X-Coremail-Antispam: 1Uk129KBjvdXoW7Wr4kAr45ZF1rZFWUWryxuFg_yoW3Zrc_Ar
 n7Za95Krs7AF4vkay0y3WfCry8ArWYgr15tFn7KF4jqw1fCF4UJrsFk3s3Ar1rWr18W348
 AF48A3yfA34agjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrnU
 Uv73VFW2AGmfu7jjvjm3AaLaJ3UjIYCTnIWjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRUUUUU
 UUUU=
Received-SPF: pass client-ip=162.243.164.118;
 envelope-from=xiongyining1480@phytium.com.cn;
 helo=zg8tmtyylji0my4xnjqumte4.icoremail.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-TUID: b7Ba5ZMTEiKX

Enable CPU cluster support on SbsaQemu platform, so that users can
specify a 4-level CPU hierarchy sockets/clusters/cores/threads. And this
topology can be passed to the firmware through DT cpu-map.

Changes in v3:
- squash the two patches together into one
- add the DTB information in docs/system/arm/sbsa.rst
- Link to v2: https://lists.gnu.org/archive/html/qemu-devel/2024-03/msg02951.html

Changes in v2:
- put this code before sbsa_fdt_add_gic_node().
- Link to v1: https://lists.gnu.org/archive/html/qemu-devel/2023-12/msg03390.html


xiongyining1480 (1):
  hw/arm/sbsa-ref: Enable CPU cluster on ARM sbsa machine

 docs/system/arm/sbsa.rst |  4 ++++
 hw/arm/sbsa-ref.c        | 35 +++++++++++++++++++++++++++++++++++
 2 files changed, 39 insertions(+)

-- 
2.34.1

