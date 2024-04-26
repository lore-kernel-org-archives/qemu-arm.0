Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp200974ejb;
        Fri, 26 Apr 2024 00:36:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVPmVTJviC9/lNPS4WiX3YK9+2V38Fm208/RKVdXks3Yx2/taOIlRc5wL/8pYQ+MWLLoJj0yC9nvIvkdBKP1KxNWUNPEhDL
X-Google-Smtp-Source: AGHT+IHpvDOpEWyR7YCLetYFyEDDUYfWb4zIMZHqZHEiOlmLUe6/vcsjj5LNZWtUYmzfiGWNeove
X-Received: by 2002:a05:622a:4c6:b0:43a:70af:4808 with SMTP id q6-20020a05622a04c600b0043a70af4808mr1243520qtx.30.1714116991643;
        Fri, 26 Apr 2024 00:36:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714116991; cv=none;
        d=google.com; s=arc-20160816;
        b=jaysbZNm2wHuFa6JmKdSvMRJrAdNmlbXUgCYjXTFyJngroAAxqR8p/zuByqmDaLn9C
         cBaNJxO7xtyRLop7CP/jaKyuBxGLNrDQi7/pyk+CAtn2OlXpMgIS+LGPR1k4Xt5oiiNJ
         pft5sVS1GIJdz88U5jWgYvR5un+99kUzmwYYKoaHqpVjB4mBGMJGOAyFjXjxLr1NsVQ+
         xb3w47Bf/lLfdKyvPN1YWnXsZqF+Dfj/gvXW9MlqN2KgfhVTAfZ+d6ZynM74vG1COADA
         GAcA4+7IF5WtzJ8H0bRhhJyC0Hf7+2o439bPuukI2rmMlyimLSA7sCfDQnsjI70b5yyI
         vW6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=G7YDnwqBN7Fx5GS+UkcTr10YrcGSApbUzF3luKyx5g0=;
        fh=V+VS/T1MkPk0w2XvUnHKwYRlsexEMINcJGrNSFFLIrQ=;
        b=TxZ5PcLopmMYokMMVTpW1sdItjsxwiLoiPepMMUfGtdUzab2yA1gYijpPl9hSA3xcP
         1ufquDyHPB7VIvCTo30bh4k/KvrAJq9m0vBwPqhnwRvBTDpsNeajeAh4p6iTR45pNSVY
         HMZ/obvhWzu/wLV9FOiYRsUJRX4vIv89CwEdBdMGf2ra5jfXiew3XDjmnoYmDynvk4Zk
         oi5xHNpA89H8RqXQD05QlF3zohdcF18BX5u9SBJag3trEdGkKLGrn5wUsqM20fwMGLrc
         rbvSp7Pa3Xgutv49fsyNw6DSB+u3HJbLzW6db/ln7e7RTxb9U4VogC7SST6mWIDuO7p6
         JB/w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e17-20020ac85dd1000000b00434614f21d4si20272219qtx.766.2024.04.26.00.36.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Apr 2024 00:36:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s0G87-0001HW-HB; Fri, 26 Apr 2024 03:36:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiongyining1480@phytium.com.cn>)
 id 1s0G85-0001GZ-Uq; Fri, 26 Apr 2024 03:36:22 -0400
Received: from zg8tmja5ljk3lje4ms43mwaa.icoremail.net ([209.97.181.73])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <xiongyining1480@phytium.com.cn>)
 id 1s0G83-0002TP-Nq; Fri, 26 Apr 2024 03:36:21 -0400
Received: from prodtpl.icoremail.net (unknown [10.12.1.20])
 by hzbj-icmmx-7 (Coremail) with SMTP id AQAAfwC3vRFtWStmIcEAAA--.471S2;
 Fri, 26 Apr 2024 15:36:13 +0800 (CST)
Received: from phytium.com.cn (unknown [218.76.62.144])
 by mail (Coremail) with SMTP id AQAAfwAH2EtlWStmgmcAAA--.464S3;
 Fri, 26 Apr 2024 15:36:05 +0800 (CST)
From: Xiong Yining <xiongyining1480@phytium.com.cn>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: rad@semihalf.com, peter.maydell@linaro.org, quic_llindhol@quicinc.com,
 marcin.juszkiewicz@linaro.org,
 Xiong Yining <xiongyining1480@phytium.com.cn>
Subject: [PATCH v4 0/1] ARM Sbsa-ref: Enable CPU cluster topology
Date: Fri, 26 Apr 2024 07:35:52 +0000
Message-Id: <20240426073553.326946-1-xiongyining1480@phytium.com.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAfwAH2EtlWStmgmcAAA--.464S3
X-CM-SenderInfo: x0lr0wp1lqx0bjrumio6sk53xlxphulrpou0/1tbiAQAGBmYpXuMFaAAIsW
Authentication-Results: hzbj-icmmx-7; spf=neutral smtp.mail=xiongyinin
 g1480@phytium.com.cn;
X-Coremail-Antispam: 1Uk129KBjvdXoW7Wr4kAr45ZF1rZFWUWryxuFg_yoWftrc_Ar
 1kZa9YgrsrAF1vkay0yF1fJry0krWjgr15GFn2kF45t34Fkr4UJFsrK3s3Aw1rWr1UWw1x
 Aa1UArWfC34aqjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrnU
 Uv73VFW2AGmfu7jjvjm3AaLaJ3UjIYCTnIWjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRUUUUU
 UUUU=
Received-SPF: pass client-ip=209.97.181.73;
 envelope-from=xiongyining1480@phytium.com.cn;
 helo=zg8tmja5ljk3lje4ms43mwaa.icoremail.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: S+IOBlmDGFQM

Enable CPU cluster support on SbsaQemu platform, so that users can
specify a 4-level CPU hierarchy sockets/clusters/cores/threads. And this
topology can be passed to the firmware through DT cpu-map.

Signed-off-by: Xiong Yining <xiongyining1480@phytium.com.cn>

---
Changes in v4:
- align the machine-version-minor to 4

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
 hw/arm/sbsa-ref.c        | 37 ++++++++++++++++++++++++++++++++++++-
 2 files changed, 40 insertions(+), 1 deletion(-)

-- 
2.34.1

