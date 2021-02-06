Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp2909930lfo;
        Sat, 6 Feb 2021 06:40:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxXzBrDx7IkMWQCRN8gSVwGSwS4hwoNDT35EmE7r2E4l0VxI+fnS0U7AxJYpeXnN4LODlfB
X-Received: by 2002:a25:4015:: with SMTP id n21mr14353793yba.180.1612622407774;
        Sat, 06 Feb 2021 06:40:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612622407; cv=none;
        d=google.com; s=arc-20160816;
        b=XwJ6/HnXxtT52la8daHf/bEyLkia4UwT5a4G01/30h33eBTSZj5p0srL8WqU/te/Zm
         6n+0CoVFsl4SrXcATZ+Fk9FSiPgl3jVaSlAz8oRYUTC3BOoVJWodZ2Hp/KcOILVe1fSw
         W3pYPPFmXLX8xHKBYzkP6Njzq2lVEV+U2IOGM4FKkQW9BtPFPeYHxU4Ox4pdkHryechj
         NlyL9ddNFTEvnVh7aEgHp1eMSUQ8hx/wOb/SqdOhPYuXGGkshNZoHQQOh6ihmYnOnH/I
         r9TYZY7zCxlI/oCGUPTuWdHttmjMANSxd2Td2BCwryP6AFqX9sxQHd27DFoaODtLcdXz
         Gg+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:message-id:date:subject:to:from
         :dkim-signature;
        bh=KvKuWCIQF7OQoxnfE7BME6o1oPVf1VqyWZGdd/uj+Cc=;
        b=GGU+1dQGvCYNAWl1I2pzei3wYsvXWM2E9YThrRJEcV/qQZwEfK+0aC+A0oTKwsI/ef
         qX92QV7+PFi3ij0HDDioShJNNooVv3OmvhBzy2JI86vhF4cvqm4z+DAs4mUs09bIoxv0
         gLa1ASPZSVA0wKgcG6k3CmGJVr7JR38hCLlwYJBnsZPTcnVzQyUkW6YS1PdAeCd6ETAZ
         C63+W4LRcOI7Xkc69UVjv5GSE9y8yazSwPYkWHfRQraQ6WZlTGDydWWpO6Oi1Ob4+g2s
         qjAbZvCMzHI4b4KrbaRwiULKQ9IacQ604owYe3pDZv2KkHmgRISnrzMca3AHf/X75i5G
         K11A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=X83aNLBc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l193si12066197ybf.82.2021.02.06.06.40.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 06 Feb 2021 06:40:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=X83aNLBc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l8Okp-0004RM-4L
	for alex.bennee@linaro.org; Sat, 06 Feb 2021 09:40:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l8OjP-0003Ua-LM; Sat, 06 Feb 2021 09:38:39 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:41753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l8OjO-0006aK-66; Sat, 06 Feb 2021 09:38:39 -0500
Received: by mail-ej1-x62b.google.com with SMTP id f14so17586075ejc.8;
 Sat, 06 Feb 2021 06:38:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=KvKuWCIQF7OQoxnfE7BME6o1oPVf1VqyWZGdd/uj+Cc=;
 b=X83aNLBc1YNfByUNEMgmpAHbeKszVGBbjPWOeNEY5vxn4qqEbWM1oL5wZSAzE3m3yD
 1BpyXeUN+9D5IQ0b7CxVtnSm8Q9KeLQmVdAR8mhVXCr5oJjasxdFTBjTzXsL4kVmBhA7
 clXYxC4wyjBedJnmEpMJjVebsH495yGC4xjKpoDw8u3TedyEf0PotD77Y0c+d4sTLI3c
 I25yOjRH8AM+J6qPeEgno6tOrhZdFedIxcLcqATjU8fPfjwwZr7sFhh6sOL5xu1Bi/vW
 AKgsbbgdmsN/JslycY4WOQKLtJjIgw1/dXLTZ9KNk+ACGtg0cIQnU+lRvUunpKfant3M
 EwBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=KvKuWCIQF7OQoxnfE7BME6o1oPVf1VqyWZGdd/uj+Cc=;
 b=oZiqIgdox1fzKKxTXLClVzQuvwf11Jy8p0RXpdrmD5p1i0Ux+ku/1eilqa+Ts6z4oI
 MWH5l39KQ2eQCUdkTz+/8ETBKLmhEpOsbepJfQqlKxDSl0RyLjS5v0/zJfFmnBEiEw4I
 ++NrvbatX5oKZs+nwVvp0oh/QiQEonh/4Bf42nFYzh2PlqUBCt7srCW6NJAM2RB+A/JF
 4hIT32JpvZLnZPCIncrWo4vAFVETr325yr8M8wEF5PU+SD/o+9ERGs8gvU4F3JYW/hUX
 JmkXPZzD5HVKtw3+qf/YB3ptBZijB26heXx/LHiPswerNckGQWaLE4454hp+q7FBniDx
 WJkg==
X-Gm-Message-State: AOAM5302hkGz6tb7yz91zUpFWuX9CrTgsPcj//JjOFvzzbu7njG46wfS
 WyPZabGHxlfKX/GJd5tUjgo=
X-Received: by 2002:a17:906:c299:: with SMTP id
 r25mr9238162ejz.80.1612622316031; 
 Sat, 06 Feb 2021 06:38:36 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id g22sm5394513ejw.31.2021.02.06.06.38.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 06 Feb 2021 06:38:35 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH 0/2] hw/ssi: xilinx_spips: Implement basic QSPI DMA support
Date: Sat,  6 Feb 2021 22:38:12 +0800
Message-Id: <1612622294-37297-1-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vfNJ9VSriEw4

From: Bin Meng <bin.meng@windriver.com>

ZynqMP QSPI supports SPI transfer using DMA mode, but currently this
is unimplemented. When QSPI is programmed to use DMA mode, QEMU will
crash. This is observed when testing VxWorks 7.

Add a basic implementation of QSPI DMA functionality.


Xuzhou Cheng (2):
  hw/ssi: xilinx_spips: Clean up coding convention issues
  hw/ssi: xilinx_spips: Implement basic QSPI DMA support

 hw/ssi/xilinx_spips.c | 211 +++++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 183 insertions(+), 28 deletions(-)

-- 
2.7.4

