Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp31344lfb;
        Thu, 2 Sep 2021 01:18:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJydaGJr8b3GHZK6XhBvCIod5yiyQfJxdYgW4NbQSvHlLiSsIComBD/5MHjeDpH2ohMctJk9
X-Received: by 2002:a05:6e02:144:: with SMTP id j4mr1395892ilr.75.1630570715723;
        Thu, 02 Sep 2021 01:18:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630570715; cv=none;
        d=google.com; s=arc-20160816;
        b=XYryAsTb24Po9CRveqGN4N6PfKz0/c8nNyygk1lR+aHsJA44tgIuXYEqDSSCxvoNes
         g0guxAU5IXryyslEiYTuNwV0IUVPSAA9wxC6W0j8c9WhJTzwt05r7z0SadHzACfS+WGQ
         ZPWD1lOKJBQrpLbco59+OF1B/e0fGLkgAvdBHSYfSdql4WED/QBvAEqbUoHjcELVA9HL
         UcKWXNGxJs3cF5igIMEvWVUf0NQPJby2GR8VFDNvazNfSCealWKdpE6T1XFfMVOM1mTO
         msthU4amoRcBVCt6t33RulcLpqQ/po64Y3RfcNk46o6rPLo0bZqyzOtN1gG2cCTghMkk
         nNrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=LLz7MuXk94N5NpwifA+hCazYs6PD/HGvxU0CKAVtH2Y=;
        b=StyICt99Z26nZZUfoKCKzMnsh7CZU8oxZU4fiiDOuK04CG1FV4LL4O+H3DZnIyzcnh
         KUUlUrrSEXgMmjF1Qv1c07bSFSdHNnyrN2Gw6LXQCNobSJsvgqifnfvFh9XKw99ES+iA
         QRcoGkXqKpQx39+KL60Nt9StP8BuPI95NGWXkLNORRWUcWBSv8uE6hRWmXlcWNKrCW8K
         36QnNcbRqD6HmDydYSimH+XOmH4NYm0J9p30FcVY7hmtzKNokA8PMiO7bAOBzljKiZOc
         xAY/9DIZ6RxEPBcp6JzKoE6LqWNiqmP3YnIvMpmbizDf3UgGSNf6+ZladEt00jBPBEpA
         9LVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@163.com header.s=s110527 header.b=MY4L8YkJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=163.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f36si1152675jaa.30.2021.09.02.01.18.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Sep 2021 01:18:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@163.com header.s=s110527 header.b=MY4L8YkJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=163.com
Received: from localhost ([::1]:44354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mLhvf-0006tW-4b
	for alex.bennee@linaro.org; Thu, 02 Sep 2021 04:18:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chunming_li1234@163.com>)
 id 1mLhsO-0001n8-Ce; Thu, 02 Sep 2021 04:15:12 -0400
Received: from m12-16.163.com ([220.181.12.16]:52784)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <chunming_li1234@163.com>)
 id 1mLhsI-0002jK-0c; Thu, 02 Sep 2021 04:15:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=LLz7M
 uXk94N5NpwifA+hCazYs6PD/HGvxU0CKAVtH2Y=; b=MY4L8YkJXH/xB2oY1hlR+
 ueB81n/W59s4k3isM1DkgMR3F0KtfJNi8sotcC0magiYT3EVDdMDwkI1H29w4NBy
 3jSbe/b4IIE09Dq65zSz6Pm5+QnNJj66KUOAFXkLFaqS+lVp8xI7rez5cmJORn6Y
 DtJloal9RcXakhkVV9Ur3c=
Received: from lcm-VirtualBox.verisilicon.com (unknown [182.148.13.201])
 by smtp12 (Coremail) with SMTP id EMCowABXMRDmhzBhan7BAQ--.86S4;
 Thu, 02 Sep 2021 16:14:43 +0800 (CST)
From: chunming <chunming_li1234@163.com>
To: eric.auger@redhat.com,
	peter.maydell@linaro.org
Subject: [PATCH v6 0/4] hw/arm/smmuv3: Support non PCI/PCIe devices
Date: Thu,  2 Sep 2021 16:14:25 +0800
Message-Id: <20210902081429.140293-1-chunming_li1234@163.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: EMCowABXMRDmhzBhan7BAQ--.86S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7uw1DCr48Wr4kGryrAr15XFb_yoW8Xw4rpF
 WYgrs8G3sxCry3Cw13Za1xWrWrJa95GFyUtrsrKry3Cr1DtFWUXr4Utw1rt3yUZr1xZFsr
 ZFW2qF4fKr4UZw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jN8nOUUUUU=
X-Originating-IP: [182.148.13.201]
X-CM-SenderInfo: xfkx0zplqjszjlrsjki6rwjhhfrp/xtbBDRQCdlaEE-hfWAABsS
Received-SPF: pass client-ip=220.181.12.16;
 envelope-from=chunming_li1234@163.com; helo=m12-16.163.com
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) BAYES_40=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: renwei.liu@verisilicon.com, qemu-arm@nongnu.org,
 jianxian.wen@verisilicon.com, qemu-devel@nongnu.org,
 chunming <chunming.li@verisilicon.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: N0yaxD+fj1FG

From: chunming <chunming.li@verisilicon.com>

The current SMMU v3 model only support PCI/PCIe devices, so we update it for 
non-PCI/PCIe devices.
  . Add independent IOMMU memory regions for non-PCI/PCIe devices
  . Add SID value property setting for non-PCI/PCIe devices
  . Add PL330 DMA controller into "virt" machine and connect with SMMU v3
  . Test PL330 DMA controller and PCIe e1000 network with SMMU v3 enabled

Notes:
  You need apply PL330 memory region patch before compile "virt" machine:
  https://patchew.org/QEMU/4C23C17B8E87E74E906A25A3254A03F4FA1FEC31@SHASXM03.verisilicon.com/

  The old PL330 model cannot configure its memory region manually. 
  So we update it and provide path.
  The patch was reviewed and will be merged in target-arm.next for 6.2.

v6 - Reviewed by Eric:
  . Rename sid_map -> peri_sid_map, num_sid -> peri_num_sid
  . MOve peri_sid_map and peri_num_sid to SMMUState
  . Add "peri_sdev_list" looking up to replace "g_hash_table_remove()"
    for non PCI/PCIe devices.

chunming (4):
  hw/arm/smmuv3: Support non PCI/PCIe device connect with SMMU v3
  hw/arm/smmuv3: Update CFGI commands to support non PCI/PCIe devices
  hw/arm/virt: Update SMMU v3 creation to support non PCI/PCIe device
    connection
  hw/arm/virt: Add PL330 DMA controller and connect with SMMU v3

 hw/arm/smmuv3.c              |  75 ++++++++++++++++++++----
 hw/arm/virt.c                | 110 ++++++++++++++++++++++++++++++++++-
 include/hw/arm/smmu-common.h |  14 ++++-
 include/hw/arm/virt.h        |   3 +
 4 files changed, 188 insertions(+), 14 deletions(-)

-- 
2.30.2

