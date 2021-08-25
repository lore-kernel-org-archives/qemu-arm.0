Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp253309lfb;
        Wed, 25 Aug 2021 06:08:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz5ywBd62fWXoApxjJ9MQLSMGuTSh2T5cOH16oeRKnRzzvD7fqu+7oc2c+K9W5s+seDh6Pk
X-Received: by 2002:a05:6000:1864:: with SMTP id d4mr26266642wri.250.1629896896163;
        Wed, 25 Aug 2021 06:08:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629896896; cv=none;
        d=google.com; s=arc-20160816;
        b=RC/8FJdJM4P6/oXe8YKurtlUvLEsMvR1ZfWpe8vERk18Z0/HofxL8VzacBXqYCLfQG
         uGElW8Pl943yUufaUdsYQ5bVYb1ok/co4IQS7i3zIj3LrvXbPRyXqRpSQE49Fa+8IFiQ
         nSR8Geg4cGk0+aB0RJagpjtqzJi6iBuWg/bi5cntqW7PfoV91t9nv2KS1rKtVb8HQuud
         jYBJOkNlizz/3npZerMycTGy6lZK/hf8JieokS1j2byEZiqtiDfv9nbHZZAuE0qmXARd
         1s46rkf5irc2JIzUz2UpXiXp1PeB1y/kFarD8UtFHGfXr17k8c4EIOqtSPVGNIVMgcxL
         HNHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:message-id:date:subject:to:from
         :dkim-signature;
        bh=A4ons/D72mOTb9PTXTmdADsOkLkh1zX6jxX2rLQrLCA=;
        b=0ZcETEmozyEno57hQ3NMcLqGaBAN62+732iYjZXEocdxMCWXLC1xXrHEG9oQ6zzUJu
         X4o3GlLe+5fsoqEkcI+oGLMyv2ipHv3XTJBu5OQiPThi1rzRqnnOyWnvkW/xGzMP/1Rv
         4P80T8FCssGVn5/r4OnVOpG8kkpXeQSOfU9a1Egbf/Z+1+6gmKal50GC0Bf5CqgwlKa1
         Aj3HMO3aMQI+nvqa0gMARsjhDdHi9OF5YIYCBXhn2eFWcjGF1oDYejxDGqEOygj8atll
         j2zGOiZUcYwf/PE7hgen3wWhcEaC2FGzvy9ODmjuvQXJ7Sq/pzzhDteonFW1i9pIF91B
         n4aA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@163.com header.s=s110527 header.b=BJTOHhH2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=163.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b7si4793979wrp.410.2021.08.25.06.08.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Aug 2021 06:08:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@163.com header.s=s110527 header.b=BJTOHhH2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=163.com
Received: from localhost ([::1]:58194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mIsdb-0003tr-8B
	for alex.bennee@linaro.org; Wed, 25 Aug 2021 09:08:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chunming_li1234@163.com>)
 id 1mIoDN-000414-GW; Wed, 25 Aug 2021 04:24:53 -0400
Received: from m12-13.163.com ([220.181.12.13]:48192)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <chunming_li1234@163.com>)
 id 1mIoDL-00042F-Ab; Wed, 25 Aug 2021 04:24:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=A4ons/D72mOTb9PTXT
 mdADsOkLkh1zX6jxX2rLQrLCA=; b=BJTOHhH2kwLYQHb9ZOg1EVq4HQ69QngDjE
 2ledAeLuyKCwe0nCYxiL9dre59E8AWRt7cI/0ZYPt1N+XK6AijWPPtG2gSY/WUlV
 JHkBs5TS7dfzMyx2EmM8ZR4dijQ4Fcr5Zhe+k734oGcY3j35E6UOc5atK0G9nmPq
 L7m9daH8w=
Received: from localhost.localdomain (unknown [180.169.130.89])
 by smtp9 (Coremail) with SMTP id DcCowABnCwWL+iVhtO7SAQ--.38418S3;
 Wed, 25 Aug 2021 16:08:50 +0800 (CST)
From: chunming <chunming_li1234@163.com>
To: eric.auger@redhat.com,
	peter.maydell@linaro.org
Subject: [PATCH v5 0/4] hw/arm/smmuv3: Support non PCI/PCIe devices
Date: Wed, 25 Aug 2021 16:08:38 +0800
Message-Id: <1629878922-173270-1-git-send-email-chunming_li1234@163.com>
X-Mailer: git-send-email 2.7.4
X-CM-TRANSID: DcCowABnCwWL+iVhtO7SAQ--.38418S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7uw1DCr48Wr4kGryrAr15XFb_yoW8GrW8pF
 yYgrs8K39xCry3ur13Za1xWFZ8Ja93GFyqyrsrKrWfCr1DtFWUXr4Utw1rK3yUZFy8Zr47
 ZrW2qF1Sgw1UZw7anT9S1TB71UUUUj7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07bOD73UUUUU=
X-Originating-IP: [180.169.130.89]
X-CM-SenderInfo: xfkx0zplqjszjlrsjki6rwjhhfrp/xtbBrRL5dl75bWj18AABsW
Received-SPF: pass client-ip=220.181.12.13;
 envelope-from=chunming_li1234@163.com; helo=m12-13.163.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 25 Aug 2021 09:00:08 -0400
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: renwei.liu@verisilicon.com, qemu-arm@nongnu.org,
 jianxian.wen@verisilicon.com, qemu-devel@nongnu.org,
 chunming <chunming.li@verisilicon.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FwEKbhIx8j31

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


chunming (4):
  hw/arm/smmuv3: Support non PCI/PCIe device connect with SMMU v3
  hw/arm/smmuv3: Update implementation of CFGI commands based on device
    SID
  hw/arm/virt: Update SMMU v3 creation to support non PCI/PCIe device
    connection
  hw/arm/virt: Add PL330 DMA controller and connect with SMMU v3

 hw/arm/smmuv3.c              |  81 ++++++++++++++++++--------
 hw/arm/virt.c                | 108 ++++++++++++++++++++++++++++++++++-
 include/hw/arm/smmu-common.h |  12 +++-
 include/hw/arm/smmuv3.h      |   2 +
 include/hw/arm/virt.h        |   3 +
 5 files changed, 178 insertions(+), 28 deletions(-)

-- 
2.30.2


