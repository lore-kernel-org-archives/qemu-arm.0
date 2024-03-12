Received: by 2002:a17:907:991a:b0:a45:b507:d90a with SMTP id ka26csp1678217ejc;
        Tue, 12 Mar 2024 01:33:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV7UQOfIw4a8+tVFOSDN5wD9/KcNt/AqSbzQWAS/Fmfd6VwUN6/uq4aIryWY96qBYM/jcTgolZct7tM6pKWa8udyNd5HpL6
X-Google-Smtp-Source: AGHT+IHdNLgfP6Wj4E6SLkja5g6ahySlfYkh2dfyy/YJPjVwE/ixH6C9xY8zflA5mg/HbKEGLiyp
X-Received: by 2002:a25:aa2d:0:b0:dcb:e82c:f7d with SMTP id s42-20020a25aa2d000000b00dcbe82c0f7dmr5924920ybi.41.1710232407587;
        Tue, 12 Mar 2024 01:33:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710232407; cv=none;
        d=google.com; s=arc-20160816;
        b=ZkwKNfRNfn6gQo0TPQkycjVGDdAysLY8moT64eQh9BzwXz/6lKRMvRX+huCblBN2sk
         LS78tRG9zFffMnd9UM8TBZHnj27gFk5gS/5lppCfEGmE/x9Ab32EnyMvGPhkwD9VPp9q
         npkl0y3LBcAuLKRUKH/rrX2oclrmv0Z59jXeGaSHxDPecK68WwUWSJxxUqZeKj0hcFvM
         aSgeAni9n6BGAgBupVb+O9m/7HXdNz9SXNHZyq8JgEDI2TrNi5rv6BVWQDiWGDD11fnp
         UMbq1ihCtStE5y2eShaAeQcksrgSjOBoghgdvbFoQjjZxHIYcaWHjYjerK9D5HiTAeuw
         s1PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=jswTqNvic9/BqSs3GaYcK1yloKoFIDX9P/RXZBDjdjQ=;
        fh=V62SyzSV+ORx9MxfSywlMhFNCQ0iauv2bPti7F9lav0=;
        b=S1NLxbMBO2Gk3cB3h9GOLFKfmiIO1nZOs+pYju8gdH2T92NX/GBB/uuPPZ3JonCQ+v
         taTojmsDdXeZv6Z2GlVzK1+p9k+GeTGbxt93MDrL1es18/Za0BpxBgTcK49wUV8avMAG
         +Vn5R5ogdcdd2ci/ox4SAo2K43aY5yMp6hX5mlTZ5byoiw3wSDBvXCaWAPRQwpMIsG32
         KutQjLDAitkAANm2+sgG4OQ1r64jeEs2Lss3MXEOY1lL2qpCMdB/3InG9ZE82cHT6sa2
         hZTTrgDl4mPrjITDTv7GPDGewAZhHN4Ri45TJsXtIrB06lJr8QPjun4j7ujC2IbLAMu6
         eThA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b8-20020ac85bc8000000b0042f512eaa89si2064334qtb.10.2024.03.12.01.33.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Mar 2024 01:33:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rjxYi-0002yr-Jd; Tue, 12 Mar 2024 04:32:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiongyining1480@phytium.com.cn>)
 id 1rjxYb-0002wY-8c; Tue, 12 Mar 2024 04:32:21 -0400
Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net ([162.243.164.118])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <xiongyining1480@phytium.com.cn>)
 id 1rjxYY-0002hP-Pi; Tue, 12 Mar 2024 04:32:20 -0400
Received: from prodtpl.icoremail.net (unknown [10.12.1.20])
 by hzbj-icmmx-7 (Coremail) with SMTP id AQAAfwAXH2sGE_BlOCThDA--.24686S2;
 Tue, 12 Mar 2024 16:32:06 +0800 (CST)
Received: from phytium.com.cn (unknown [218.76.62.144])
 by mail (Coremail) with SMTP id AQAAfwCXjPAEE_BlkXMAAA--.584S3;
 Tue, 12 Mar 2024 16:32:04 +0800 (CST)
From: Xiong Yining <xiongyining1480@phytium.com.cn>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Cc: rad@semihalf.com, peter.maydell@linaro.org, quic_llindhol@quicinc.com,
 marcin.juszkiewicz@linaro.org, chenbaozi@phytium.com.cn,
 Xiong Yining <xiongyining1480@phytium.com.cn>
Subject: [PATCH v2 0/2] ARM Sbsa-ref: Enable CPU cluster topology
Date: Tue, 12 Mar 2024 08:30:47 +0000
Message-Id: <20240312083049.3412522-1-xiongyining1480@phytium.com.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAfwCXjPAEE_BlkXMAAA--.584S3
X-CM-SenderInfo: x0lr0wp1lqx0bjrumio6sk53xlxphulrpou0/1tbiAQABBmXuC2cExgAEsn
Authentication-Results: hzbj-icmmx-7; spf=neutral smtp.mail=xiongyinin
 g1480@phytium.com.cn;
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
 ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU8nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
 nUUI43ZEXa7xR_UUUUUUUUU==
Received-SPF: pass client-ip=162.243.164.118;
 envelope-from=xiongyining1480@phytium.com.cn;
 helo=zg8tmtyylji0my4xnjqumte4.icoremail.net
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_BL_SPAMCOP_NET=1.347,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: l7UTNnpFSFMy

Enable CPU cluster support on SbsaQemu platform, so that users can
specify a 4-level CPU hierarchy sockets/clusters/cores/threads. And this
topology can be passed to the firmware through DT cpu-map.

Changes in v2:
- put this code before sbsa_fdt_add_gic_node().

xiongyining1480 (2):
  hw/arm/sbsa-ref:Enable CPU cluster on ARM sbsa machine
  hw/arm/sbsa-ref: Add cpu-map to device tree

 hw/arm/sbsa-ref.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

-- 
2.34.1

