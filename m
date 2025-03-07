Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp2449257njm;
        Fri, 7 Mar 2025 12:40:49 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVJ7b45WLlw9Zmmkkny7sOYFFpOYYv7QuxfSxYrr7qs5ZjaGsxt52E2YzEerl5/niq9yjJdz2i1JW9seQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGswxuJbdgIliiOdRAz11MuBkfpXXSxvrQPTBEeLlSd1O5pcqF7lBeXVWdsCYJlfgnwQgo9
X-Received: by 2002:a05:620a:6885:b0:7c0:ab10:1132 with SMTP id af79cd13be357-7c4e61cebbfmr563998185a.38.1741380049158;
        Fri, 07 Mar 2025 12:40:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741380049; cv=none;
        d=google.com; s=arc-20240605;
        b=TUNhc0i+5ZIQeoe0pjrUc/ugG0MaPjUlE9x8GFt1w+KokVdsW5ktIQ2N4uV0R2h79+
         bgJJPs6/wK7D+Mx1/0vPydeHKuPogGHvpbAlsGryMJfkQkCEeozvx1t1SAP/a/vuHb7+
         uaFBmKF8OENdwHoxJZdzYq7aN8AxmainbAuVZZ/GCOKRU1dm9mttf3Zk6fwlbGvMpSPE
         5Wk1QXCaMGKYkzfduAskAvPJ6Dx/EdC4SJvuQUMXRXLmoxLzrbBbA1VSj+tiMEE5lhzI
         CUMU3SpsLScPX0folojBjgdiRKvndQ93wZDKu/dLall16EFFJlXFmHylgL55xM2fT6Bt
         ZIEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=2FWXlQU/7CPw40ZorM5xTztxlUlpDOkFuJBD3+uMXoc=;
        fh=Z6qyPHVO3m31QP0N8c/p+9rrnWZRukaCDtWkNRbrN4Q=;
        b=UaKxSzE4uC0X2BhQhiEq6dly5ujGlcArOKbhtAwcz7l8yELVTQjbLUM31DzVfH3xee
         udQYeNUQR3x+W7r6zG+3PXexaf3lo16p5qYRPWLpbc+WcyTWw84Y/8qWYhcDBxpSr/t6
         rxchtYbFYHn3Xq3IwmcssEBdMsT4H9h5jMd6j2ixJdrC5MZqxcaN/BuhHRlnUZzqCXKD
         uqoRB9Fh9gYXx41zwJlL/vcePSTJc7AoP2w9uueRxAptx0PefsLrA1IwnHYfy9F7Zp+6
         aOMkzigyeeyByYzzB0ZQqsWPkXgQnUf2+LLl7WoCjU5rxO9QrmJ4sZKvuR9T07IAWpL4
         NCow==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=bCftfwvB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c3e550e19dsi412427485a.331.2025.03.07.12.40.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Mar 2025 12:40:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=bCftfwvB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tqeUX-0004OK-I3; Fri, 07 Mar 2025 15:40:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1tqeUW-0004Nr-Cc
 for qemu-devel@nongnu.org; Fri, 07 Mar 2025 15:40:20 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1tqeUU-0001ug-7w
 for qemu-devel@nongnu.org; Fri, 07 Mar 2025 15:40:20 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-2ff6a98c638so4449769a91.0
 for <qemu-devel@nongnu.org>; Fri, 07 Mar 2025 12:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1741380016; x=1741984816; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2FWXlQU/7CPw40ZorM5xTztxlUlpDOkFuJBD3+uMXoc=;
 b=bCftfwvBFIZxShhYR3QFk+HSrZFHnCL4LZ/Uf2/XPJfK3q7miRmbgOwpepDrEPx19W
 Z05KXDNks8cED2GTvUkUk2FC3heRT6hPg2FaFeOY9efOCvrMUJjXzxwL7hirlmeTgENQ
 Jf9OrzKJCKIyDSR/xz719IhZbfn2mYZUI0nQMQXWuEFGYRPy3AvyQMs6Z8/YAXS+B09B
 rmSGjgW5Ut9uypUj4LBW7Aaq5BxThYs33A/VHJgsVpDJr9aiXwsf0L1YNc/KAStf3uRj
 rhYauNxPmwX8+yGmYOAgdbXnA3eKyXCTUMIXRNlEYhebmkRHRp2S+nBq/aDuoZZmmLTG
 ds/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741380016; x=1741984816;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2FWXlQU/7CPw40ZorM5xTztxlUlpDOkFuJBD3+uMXoc=;
 b=KsEOnXj67zygR+UB99iCV9JL5prS9H2m8YlJ7iTefFJv78T5Xelo1JRfFjj0hIctgC
 fkVMNcTvoDxUtp4GGlOxYv/zfOJikoHrJxUIQSq/It7Fg92Hovzl6Aeua00pBI4SZEi9
 TAIUv//c0m9sCgOPbMcpuAWDmzbfiR1Nh+C7SZOuoZUgtaAFP3E/7l1zdmNXieFQAVvm
 sVpgb7F42uJnnqmZsCPll1KfSHJuK3wHgxVseN0g17439WII/Cnl4VSRaxKelaOQGY7m
 aAQp9DJnT96wq8PemXUA9Rks+lj1n66dscQmDw2WbMjG3U6GB54DJCm71yFaG43bw5ug
 +SHQ==
X-Gm-Message-State: AOJu0Yzhq2tSlp4Z4fMbGt/6JFk5dkTu77PmukyvFTYz61Cxi7j3KNNj
 z/23CSI9HBzTG9qbz2TZ4ojxmEWkJallim6PCDP7UydSjVsi+ZN+qz5osQ4yGUPGjHsG9nWfC0L
 xXv648OYFhDDNb/fVTta9/z55JeRsdaiuQmdBFVEttufBqbb4pbHCMmlDHiaWW4buxBSKmPWLjB
 qPgngkLpTJXbHtmon+FeQPSWn6p99bhK0kCY7ez5M=
X-Gm-Gg: ASbGncsMLVK535eGe8WdAkczzjZhUcPn+uQoKUCp3OG0vrmMYpSvB/5PyvsoPzVfCSB
 pAyeS7/r/Qrqw+tq0E3gkAqFhRDVKgS/+QY2PfJQ15V/eEmMckFtzly0CFjjlgwGBSNkZauxA1t
 UMaop3/gxriJ8aKpssCB2eWUu9XMmYllUNsoxZeR/mI07AJ0v3FPF5Paz68hicmb+8FJhMUzBJg
 Ld/mxsgH9lvhPkkZBgNRsVpEqQAnNLxPyu9EQzhJfUyjx8r3xuosDTS+02vgLog2gNllhoHxvgr
 B/eLrF68Yo/V9JRZBn3lb/rUY2RJokFYDgY1xBRwhSEoLKFyMuX7HVyx4LiWBltduRrVdtn4
X-Received: by 2002:a17:90b:3950:b0:2ff:6167:e92d with SMTP id
 98e67ed59e1d1-2ff7cef761amr6758275a91.32.1741380016319; 
 Fri, 07 Mar 2025 12:40:16 -0800 (PST)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ff5aa3d3ccsm3270900a91.0.2025.03.07.12.40.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Mar 2025 12:40:15 -0800 (PST)
From: Jason Chien <jason.chien@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-arm@nongnu.org (open list:MCIMX7D SABRE / i...),
 Jason Chien <jason.chien@sifive.com>
Subject: [PATCH 1/4] include/hw/pci: Introduce a callback to set the
 downstream mr of PCI hosts
Date: Sat,  8 Mar 2025 04:39:34 +0800
Message-ID: <20250307203952.13871-2-jason.chien@sifive.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20250307203952.13871-1-jason.chien@sifive.com>
References: <20250307203952.13871-1-jason.chien@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=jason.chien@sifive.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: LVJcNHdaq87Q

Many PCI hosts utilize struct PCIIOMMUOps to implement their ATUs, preventing
coexistence with IOMMUs, which need to register struct PCIIOMMUOps as well.

To resolve this, set_downstream_mr() is introduced, allowing IOMMUs to
configure the downstream memory region of the PCI host, enabling both to
coexist.

Signed-off-by: Jason Chien <jason.chien@sifive.com>
---
 include/hw/pci/pci.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 4002bbeebd..fcf648da19 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -391,6 +391,18 @@ typedef struct PCIIOMMUOps {
      * @devfn: device and function number
      */
     AddressSpace * (*get_address_space)(PCIBus *bus, void *opaque, int devfn);
+    /**
+     * @set_downstream_mr: set the downstream memory region for the PCI host.
+     *
+     * Optional callback that should be implemented if a PCI host registers
+     * this PCIIOMMUOps. It allows an IOMMU to designate its memory region as
+     * the downstream memory region of the PCI host.
+     *
+     * @opaque: the data passed to pci_setup_iommu().
+     *
+     * @mr: the downstream memory region
+     */
+    void (*set_downstream_mr)(void *opaque, MemoryRegion *mr);
     /**
      * @set_iommu_device: attach a HostIOMMUDevice to a vIOMMU
      *
-- 
2.43.2

