Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp125445njf;
        Thu, 29 Aug 2024 21:16:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWfcCmTgDyHR+sh65oRfB3J/JBpgLqq1+hGR5cyBah9BDIAZx5hSNezF7T1EqI7WT4kuc4+7D1c1tygqA==@linaro.org
X-Google-Smtp-Source: AGHT+IGD+mZwEz+VHSZ2DGLRL+SFa7rGf+D2cRXbkA+LLsNFmUelA7pC1LIUf4BjRc2NL5WZcAP/
X-Received: by 2002:a05:620a:c44:b0:7a6:5dbf:72d7 with SMTP id af79cd13be357-7a8042797e4mr689049985a.57.1724991418347;
        Thu, 29 Aug 2024 21:16:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724991418; cv=none;
        d=google.com; s=arc-20160816;
        b=cBCTJ9ftOO4WBLyzlR1OjFO+iIKArC/8zYJ25fNtc1y/iuxQ1GUkoU3t70OeBlzKkq
         ecjf4WWZXZI8zhRvegOP+TA6jfJp8lPwpBRrcs9FiKvObW9zkzCd0xzTeCjF4el4mG6l
         Z2ZZ+28rOmF1HdK9EMGqZCDpQpcSDI/Ldk5dlyyJ51p8a/GcdIuzPu/3eEaTiJebq0n/
         KmFNDTPVOAWwyckOvZLUsaFpmOEZ+/EzyViGG+PhnD7+hChaxMFpB7gmPMgcBaYG0fRz
         Mpb4vu16pUBmeetrpWAtVxDBhwHG/0YzIzuYjnU/S8sKqq548pvW6jnP+YngMOVTxSTv
         2T9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=a0oUqJJd6dWi1zFD4MaQ0MV8QHYeNgqGv0K790BEhOU=;
        fh=/h09bVioAV4yu/E3g+1edoyb8Le1SBCky9cY4Yrmy7Q=;
        b=qhrLWQlkkQVXAc8SWvckEQLIFIH6euRYTpBofN+awVd1Q201fpNcenOXrsNSiVFfeD
         rsxHq9kOAnyDZp69Y7J3Iqi44uY9T+QDiE6cDqxAj15HjWetQ3meDdTJhp7AUuWhg4Q/
         nQKu/oRzByv94xOYnJzcsh7d4gYT7QqtJgNSvdrZFkTnMC8X6/DrfxKynQw9SmpL2XZz
         iQldYeGmKzmj3xv0bce7/t3j7x8Iow1AtvK/StdTZg3df9oUyFzPbhmvMdwPUypl+okA
         OxFWxF1+AD9iULQQTidc8wexBQ9h2lQMe/teO0Z8TUJ3f+nblpvk18O74uKu8pEU5Ccv
         P0xg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a806d54525si315529185a.336.2024.08.29.21.16.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Aug 2024 21:16:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sjt3u-0005j9-6X; Fri, 30 Aug 2024 00:16:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyuquan1236@phytium.com.cn>)
 id 1sjt3q-0005f2-R2; Fri, 30 Aug 2024 00:16:35 -0400
Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net ([162.243.164.118])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wangyuquan1236@phytium.com.cn>)
 id 1sjt3n-0001gm-5j; Fri, 30 Aug 2024 00:16:34 -0400
Received: from prodtpl.icoremail.net (unknown [10.12.1.20])
 by hzbj-icmmx-7 (Coremail) with SMTP id AQAAfwD3_DCUR9Fmo85CAg--.63470S2;
 Fri, 30 Aug 2024 12:16:20 +0800 (CST)
Received: from phytium.com.cn (unknown [218.76.62.144])
 by mail (Coremail) with SMTP id AQAAfwC34bGOR9FmmakpAA--.16568S3;
 Fri, 30 Aug 2024 12:16:15 +0800 (CST)
From: Yuquan Wang <wangyuquan1236@phytium.com.cn>
To: Jonathan.Cameron@Huawei.com, quic_llindhol@quicinc.com,
 peter.maydell@linaro.org, marcin.juszkiewicz@linaro.org
Cc: qemu-devel@nongnu.org, linux-cxl@vger.kernel.org, qemu-arm@nongnu.org,
 chenbaozi@phytium.com.cn, wangyinfeng@phytium.com.cn,
 shuyiqi@phytium.com.cn, Yuquan Wang <wangyuquan1236@phytium.com.cn>
Subject: [RFC PATCH 0/2] Sbsa-ref CXL Enablement
Date: Fri, 30 Aug 2024 12:15:55 +0800
Message-Id: <20240830041557.600607-1-wangyuquan1236@phytium.com.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAfwC34bGOR9FmmakpAA--.16568S3
X-CM-SenderInfo: 5zdqw5pxtxt0arstlqxsk13x1xpou0fpof0/1tbiAQANAWbQ2MkCEgADs5
Authentication-Results: hzbj-icmmx-7; spf=neutral smtp.mail=wangyuquan
 1236@phytium.com.cn;
X-Coremail-Antispam: 1Uk129KBjvJXoWxurWrXF15JFWrKw4xZryfCrg_yoWrJr4fpa
 yYgr13Kr48Gw1aya93X34kXr15ur1kuFWUZr97ur97Cws0grn7ZrZ7ta1Yya4UXryrKry7
 CF1qqw1F9a4UZ3DanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 DUYxn0WfASr-VFAU7a7-sFnT9fnUUIcSsGvfJ3UbIYCTnIWIevJa73UjIFyTuYvj4RJUUU
 UUUUU
Received-SPF: pass client-ip=162.243.164.118;
 envelope-from=wangyuquan1236@phytium.com.cn;
 helo=zg8tmtyylji0my4xnjqumte4.icoremail.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 7lEhN005Xk1i

RFC because
- Many contents are ported from Jonathan' patch on qemu virt design

- Bring plenty of PCDs values and modifying the original PCIE values

- Less experience and not particularly confident in ACPI area so this might be
  stupidly broken in a way I've not considered.

Currently the base CXL support for arm platforms is only on Jonathan's patches[1] which
have not yet merged into upstream. SBSA-REF can be more like a real machine, thus the
support of cxl could be meaningful.

Regard to the burden of edk2 firmware, I try to build a static CEDT table and add acpi0016,
acpi0017 objects on DSDT at the initial development phase[2][3]. Hence it doesn't need to
communicate cxl contents via DT to edk2. 

This series leverages Jonathan's patches[1] to design [SBSA_CXL_HOST] and [SBSA_CXL_FIXED_WINDOW]
spaces for sbsa-ref layout. 

For [SBSA_CXL_HOST], new memory layout places 1M space for 16 host bridge register regions
in the sbsa-ref memmap. In addition, this only creates a default pxb-cxl (bus_nr=0xfe) bridge 
with one cxl-rp on sbsa-ref, so only one cxl device could be added by user on this cxl Bus.
With the 'create_pxb_cxl', users don't need to input '-device pxb-cxl' and '-device cxl-rp'
parameters.

For [SBSA_CXL_FIXED_WINDOW], this extends 1TB space from the hole above RAM Memory [SBSA_MEM]
for CXL Fixed Memory Window. 0xA0000000000 is chosen as the base address of this space because
of 3 reasons:

1) It is more suitable to choose a static address instead of that
implementation in virt, since a dynamic address space layout of
sbsa-ref is not appropriate for its original purpose as a reference
platform.

2) The Hotplug Memory address range should in the range of maximum
addressable range of sbsa-ref platform(0x10000000000-0x80ffffffffff).
It is satisfied the requirements of memory hotplug in linux kernel.

3) The start pfn of CFMW should exceed the reserved_pfn_range for
onlined numa node.

Based on 'cxl_fmws_link_targets', this adds a new function
'sbsa_cxl_fmws_link_targets' for binding cfmws.target with the default
pxb-cxl-bus on sbsa-ref.

In addition, this also adds 'create_cxl_fixed_window_region' which
based on 'machine_set_cfmw' to support creating a static cfmw region on
sbsa-ref, so users don't need to input '-M cxl-fmw' parameter.

Thus, to run sbsa-ref with a cxl device could use:
qemu-system-aarch64 \
-machine sbsa-ref \
-cpu cortex-a57 \
-smp 4 \
-m 4G \
-object memory-backend-ram,size=2G,id=mem0 \
-numa node,nodeid=0,cpus=0-1,memdev=mem0 \
-object memory-backend-ram,size=2G,id=mem1 \
-numa node,nodeid=1,cpus=2-3,memdev=mem1 \
-object memory-backend-file,id=mem2,mem-path=/tmp/mem2,size=256M,share=true \
-device cxl-type3,bus=cxl.0,volatile-memdev=mem2,id=cxl-mem1 \
-hda ubuntu.ext4 \
-pflash SBSA_FLASH0.fd \
-pflash SBSA_FLASH1.fd \

This series patches are here to hopefully some comments to guide me!

Link:
[1]: https://lore.kernel.org/linux-cxl/20220616141950.23374-1-Jonathan.Cameron@huawei.com/
[2]: https://edk2.groups.io/g/devel/topic/rfc_patch_0_1/108173029
[3]: https://edk2.groups.io/g/devel/topic/rfc_patch_edk2_platforms/108173682

Yuquan Wang (2):
  hw/arm/sbsa-ref: Enable CXL Host Bridge by pxb-cxl
  hw/arm/sbsa-ref: Support CXL Fixed Memory Window

 hw/arm/sbsa-ref.c                   | 127 +++++++++++++++++++++++++++-
 hw/cxl/cxl-host-stubs.c             |   1 +
 hw/cxl/cxl-host.c                   |   2 +-
 hw/pci-bridge/pci_expander_bridge.c |   1 -
 include/hw/cxl/cxl_host.h           |   1 +
 include/hw/pci/pci_bridge.h         |   1 +
 6 files changed, 128 insertions(+), 5 deletions(-)

-- 
2.34.1

