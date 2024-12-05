Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp48915njb;
        Thu, 5 Dec 2024 03:34:20 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXAA3NfeowXDEI2fhVmqLLfei+PTQd/5/qZb3jM+UnujTBiOpQ1v27IdR2VcjJ/JdcdR/SX6SnYB9759w==@linaro.org
X-Google-Smtp-Source: AGHT+IHXdmIGLwC7n2OQ4Ermq9spAXPjAE8xg9sNiMRzVaFOn9kAsRPpDPn3+Kd4L7xRFslMO2oP
X-Received: by 2002:a05:6214:1d04:b0:6d8:8667:c6c2 with SMTP id 6a1803df08f44-6d8b736a640mr149667496d6.18.1733398460535;
        Thu, 05 Dec 2024 03:34:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733398460; cv=none;
        d=google.com; s=arc-20240605;
        b=HV2H74+5okYt+4nrTdWH+U0tvJGMVqxLaG1ZqVTUqUp5ijtZbviQ//lSsObIIpICeT
         a7em4VaX7mkQLfrq4NAHus7UnyXjHAJIhFRVbxh/FS2k2pzA5qidIhJvi7DgE6FxQXqG
         krJVqVG/rr/fNUc9o9+RhWTenGuaWaxKaoR1FnaaKFKXppa2G89olCny7oamovgJJbN6
         s8pCFst0FHZLHJIlMmx+1ARxIJemGtW9xxANqbQmUq/GB2hVMTaYollkCmILEpOBp/Xz
         peK+UOiRkoUzJDFZezUdBTWpgJSjrRl8WHNlAveTkNZErL5DmrT4Oz90NYlPCFF+34kg
         tvNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=xLyLgpxdcbshTfFwTDnzPZwcJq+JcqaPzUo5DjXHXTw=;
        fh=fQPx/rTyKaD3jV35R7mQtKM8leaazPAR4Yu7rSDGHV8=;
        b=OL52JM+/IxyGcI1n+QHo6wXcjey4MZVpVg01iOk79ov/JuHURFMAbg6jt556m/pr2R
         04G/B9oPEUE7Xye0/ERzgpfLRcX6X9ZQ6l9fa9BiQSWpziVd53FqVvDJuJXSL9i4T5VT
         h2+vzsK9LPr2ipe7yZZkUDj9aW2vtmi3/K0mLrazAON1CcWF2Da89hqIf5oKpQc40TlQ
         WUPwqmo1iCBOno+q+GptodIaoavgJJSWIM5OOXIbpqb38mqHaRlHVoEEcTsXle/fhKTK
         GAuwr1IB108ZTUa5P/qYVnYM1b0oSMCAXAyuVP1sXtuM/cGK6bPZj0cNjuFQ+dYD8+1a
         /tHw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d8da68001dsi14428056d6.108.2024.12.05.03.34.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Dec 2024 03:34:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tJA7Y-0006VE-6X; Thu, 05 Dec 2024 06:34:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyuquan1236@phytium.com.cn>)
 id 1tJA7Q-0006Ui-9l
 for qemu-arm@nongnu.org; Thu, 05 Dec 2024 06:34:06 -0500
Received: from zg8tmja5ljk3lje4ms43mwaa.icoremail.net ([209.97.181.73])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wangyuquan1236@phytium.com.cn>) id 1tJA7N-0001Q8-BI
 for qemu-arm@nongnu.org; Thu, 05 Dec 2024 06:34:04 -0500
Received: from prodtpl.icoremail.net (unknown [10.12.1.20])
 by hzbj-icmmx-6 (Coremail) with SMTP id AQAAfwCnCPKdj1FnR+plBw--.5623S2;
 Thu, 05 Dec 2024 19:33:49 +0800 (CST)
Received: from phytium.com.cn (unknown [218.76.62.144])
 by mail (Coremail) with SMTP id AQAAfwAHW3eYj1FnCEljAA--.7475S3;
 Thu, 05 Dec 2024 19:33:44 +0800 (CST)
From: Yuquan Wang <wangyuquan1236@phytium.com.cn>
To: jonathan.cameron@huawei.com, fan.ni@samsung.com, mst@redhat.com,
 marcel.apfelbaum@gmail.com
Cc: marcin.juszkiewicz@linaro.org, qemu-arm@nongnu.org,
 Yuquan Wang <wangyuquan1236@phytium.com.cn>
Subject: [PATCH 0/1] cxl/cxl-host: Support creation of a new CXL Host Bridge
Date: Thu,  5 Dec 2024 19:33:29 +0800
Message-Id: <20241205113330.818888-1-wangyuquan1236@phytium.com.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAfwAHW3eYj1FnCEljAA--.7475S3
X-CM-SenderInfo: 5zdqw5pxtxt0arstlqxsk13x1xpou0fpof0/1tbiAQAKAWdQsnoFiQADs6
Authentication-Results: hzbj-icmmx-6; spf=neutral smtp.mail=wangyuquan
 1236@phytium.com.cn;
X-Coremail-Antispam: 1Uk129KBjvJXoW7uFWxtry8GF4fJF1fZF13urg_yoW8CF15p3
 WDGrWfGr1DCry3Jws3A3yUJa1rWrs5WFW5Zr1I9w18AF15tF4DJr1kKa1ava4DC345uw1f
 tFnFqrn5K3WUZ37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 DUYxn0WfASr-VFAU7a7-sFnT9fnUUIcSsGvfJ3UbIYCTnIWIevJa73UjIFyTuYvj4RJUUU
 UUUUU
Received-SPF: pass client-ip=209.97.181.73;
 envelope-from=wangyuquan1236@phytium.com.cn;
 helo=zg8tmja5ljk3lje4ms43mwaa.icoremail.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: VsnJ/WZ4cxbz

Background
==========
Currently the base CXL support for arm platforms is only on Jonathan's
patches[1] which have not yet merged into upstream. Some platform like
SBSA-REF can be more like a real machine, thus the support of cxl could
be meaningful. However, the pxb-cxl-host realization on this platform
seems not satisfying their requirements[2].

New CXL HOST design
===================
This work defines a new cxl host bridge type (TYPE_CXL_HOST). This
could be considered as a prototype of an independent cxl host bridge
which combines gpex features (ecam, mmio windows & irq) and pxb-cxl
features(CHBCR) at meanwhile.

The root bus path of CXL_HOST is "0001:00", that would not affect the
original pcie host topology. In the previous, the pxb-cxl-host with
any cxl root ports and cxl endpoint devices would occupy the BDF
number of the original pcie domain. This new type provide a solution
to resolve the problem.

Also the CXLFixedWindow struct adds a new member 'target_chb' to
record the target list of CXLHostBridge. And necessary is to adjust
the logic of 'cxl_cfmws_find_device' and 'cxl_fmws_link_targets' to
allow different types of cxl host bridge.

Move 'cxl_get_hb_cstate' & 'cxl_get_hb_passthrough' from pxb code
into cxl-host code.

Link:
[1]: https://lore.kernel.org/linux-cxl/20220616141950.23374-1-Jonathan.Cameron@huawei.com/
[2]: https://lists.nongnu.org/archive/html/qemu-arm/2024-11/msg00522.html

Yuquan Wang (1):
  cxl/cxl-host: Support creation of a new CXL Host Bridge

 hw/cxl/cxl-host-stubs.c             |   2 +
 hw/cxl/cxl-host.c                   | 220 ++++++++++++++++++++++++++--
 hw/pci-bridge/pci_expander_bridge.c |  20 +--
 include/hw/cxl/cxl.h                |  23 +++
 include/hw/cxl/cxl_component.h      |   4 +-
 include/hw/cxl/cxl_host.h           |   6 +
 6 files changed, 242 insertions(+), 33 deletions(-)

-- 
2.34.1

