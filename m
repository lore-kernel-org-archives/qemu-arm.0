Received: by 2002:a17:907:c9e:b0:a27:13b6:eed5 with SMTP id gi30csp986648ejc;
        Wed, 27 Dec 2023 07:07:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHs7QFN7T/yNc7SwNvwxUR5v3w9p/tRrxCPSWQx8ZH7uDKq7zvopCRFFzcmw80R4RNyteKC
X-Received: by 2002:ad4:5be3:0:b0:67f:1a6e:ce06 with SMTP id k3-20020ad45be3000000b0067f1a6ece06mr14942446qvc.68.1703689624028;
        Wed, 27 Dec 2023 07:07:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703689623; cv=none;
        d=google.com; s=arc-20160816;
        b=oFcWB+aDoh9pkR5fLziYCy9j8yQZmFxIXxTgzhmsbH+rFBqF4RZBgC9HuYOERNGhIP
         1qJalPZfzWVbaCGi/wOKead78cd2YXqeaDr+0EjVVJ5DwTcYsq7ERArGDSoIe5Q4Mb5W
         iViWrMRA9bSifpIQYNgly90aivKVgr0WRs636qGw+FbEXebeLLXEovCPqVdmnNN2VVyp
         X4wdZnsKvF4Y6/+DWcVeNEyQ63NVLtTSDB3EpZ5GfRufmz/xhNXAWP5B3TX3hBrHzz43
         ys2qS53XTT94LDJqFO4z7oP7Sfb2vx4NW0EWew4B387geszwLmu8cxIvaCtrWQuCE2ni
         norA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=P11vohxqiXb6YTxPa+W8PnNkTvKer2U4sImXV9qoxCY=;
        fh=9opAbzvFMbzdrexr/nqZVQK9innArJIGfjgv6694uII=;
        b=xY6HVMduAQQude2W8fUES3JTBiuy8O5mpnllv7Kp0L1QONAWM69Ev8JgxKOhHR5FZ+
         PYev+alPudseKToDoRkcejypJBmbJBseBCs3vXYqzMe/TjjUAb5qKxsrox1JsBNgeC7d
         y0JIeLPUMU6EhWL31dgkJA65FgVBffcJvC82PuLHniAcm9856OvbCV+3lPtQdEEc9ghD
         Hu+QxSdqiwTDnzZ05lZsbzppwh3iCQwM8HRRufc/yj5sOTfRfJ0goZhAY+BCBm3C1Ua/
         of/PaLfjrbx9lEAnuKf0htAU/oNg3/wQzJvyKwmDP4w7tHw6XRsR4Uo9vxX8CCR+Higt
         F8pw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id op33-20020a05620a536100b007815cbd3e21si1984770qkn.686.2023.12.27.07.07.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Dec 2023 07:07:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rIVUd-0007XQ-0q; Wed, 27 Dec 2023 10:06:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiongyining1480@phytium.com.cn>)
 id 1rIShq-0002IV-Ku; Wed, 27 Dec 2023 07:08:14 -0500
Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net ([162.243.164.118])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <xiongyining1480@phytium.com.cn>)
 id 1rIShd-0006Pe-KK; Wed, 27 Dec 2023 07:08:14 -0500
Received: from prodtpl.icoremail.net (unknown [10.12.1.20])
 by hzbj-icmmx-7 (Coremail) with SMTP id AQAAfwDHzUWUE4xlj+hpBA--.1396S2;
 Wed, 27 Dec 2023 20:07:48 +0800 (CST)
Received: from phytium.com.cn (unknown [218.76.62.144])
 by mail (Coremail) with SMTP id AQAAfwDX+OWSE4xldrYAAA--.2783S3;
 Wed, 27 Dec 2023 20:07:47 +0800 (CST)
From: Xiong Yining <xiongyining1480@phytium.com.cn>
To: rad@semihalf.com, peter.maydell@linaro.org, quic_llindhol@quicinc.com,
 marcin.juszkiewicz@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, chenbaozi@phytium.com.cn,
 Xiong Yining <xiongyining1480@phytium.com.cn>
Subject: [PATCH 0/2] ARM Sbsa-ref: Enable CPU cluster topology
Date: Wed, 27 Dec 2023 12:07:20 +0000
Message-Id: <20231227120722.1683361-1-xiongyining1480@phytium.com.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAfwDX+OWSE4xldrYAAA--.2783S3
X-CM-SenderInfo: x0lr0wp1lqx0bjrumio6sk53xlxphulrpou0/1tbiAQAGBmWLKugHVgABs9
Authentication-Results: hzbj-icmmx-7; spf=neutral smtp.mail=xiongyinin
 g1480@phytium.com.cn;
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
 ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU8nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
 nUUI43ZEXa7xR_UUUUUUUUU==
Received-SPF: pass client-ip=162.243.164.118;
 envelope-from=xiongyining1480@phytium.com.cn;
 helo=zg8tmtyylji0my4xnjqumte4.icoremail.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 27 Dec 2023 10:06:43 -0500
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
X-TUID: DRzQePRnaUGQ

Enable CPU cluster support on SbsaQemu platform, so that users can
specify a 4-level CPU hierarchy sockets/clusters/cores/threads. And this
topology can be passed to the firmware through DT cpu-map.

xiongyining1480 (2):
  hw/arm/sbsa-ref:Enable CPU cluster on ARM sbsa machine
  hw/arm/sbsa-ref: Add cpu-map to device tree

 hw/arm/sbsa-ref.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

-- 
2.34.1

