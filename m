Received: by 2002:a17:505:57c2:b0:1be9:327d:8ee3 with SMTP id yd2csp1872226njb;
        Sun, 15 Dec 2024 16:51:16 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVcoKKZVdcef34EyQX+ctSFVGkVaRTM3jUXa70ZirJco4vpUt6MCD4arR9KQwHiRfiVh2bAMpSaLa1LHg==@linaro.org
X-Google-Smtp-Source: AGHT+IEOHX9dzf8b073tHjiONkQC6lk5hRa+gmhN5CzuwHTaTTueYOIQ6fjB6laLfCox0mTaq9P1
X-Received: by 2002:a05:620a:2690:b0:7b6:e931:460a with SMTP id af79cd13be357-7b6fbee660emr2019228185a.21.1734310276699;
        Sun, 15 Dec 2024 16:51:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734310276; cv=none;
        d=google.com; s=arc-20240605;
        b=StqF2SkuLyXhppaF8nOhTWZPFuHlzWaerHTna5sZc4DWwQ2xz4RlhBgJ4Zol4NKmyw
         K9GeInU4AG96x2NmqkSRg90Kc6j74Fegf3hESC5cnnikyq07blHKeS9+k8VFkcTPP6s1
         Ee6hl7b901fEBPpnfmBjrQvf1vEMbjTS/Pw8KO+fdvE6XO8/L7Ub+piK/3kRXUMHPcuj
         TUgV/dMiBKiwVX4H4r25IyHbGOKGfPHjJDuxnkRpKSYAARY2nAUkv6lsJFWdY+IEXpVi
         iSm/wHboo7THtFmkcuinTuCtjcUqFhJwJopsVjy7t2U6JwkfMay9PakyZDKjKHkAirJI
         drmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=/txMo+Nnraz9AAcWBO+Ht1SEClLczXwE0l/xGp309E0=;
        fh=FoqVOCLHFvOjAAi5fGiv2QLBxwlAznykbBkjETlfp7o=;
        b=U4yJGg/LAcrgDTIfnU9dkNATWA4ZqBNfpWMfiJI/uACSUHYcWuFw6O+DigYSWw0ui+
         Q5uvFmkuakqV45b9Bt84nAb3o1CrXPXGtqrr98RAz5bG+iaAKUiqANRoXoeSywb13VYC
         5fKBGeuAI+7YjNljo5vEnpneXNeu+roGQRnqMT1x4fuZjn5YD2hr66Y+g+5E70XDOE67
         aUe5iQS4i2jPMBvvsirRqBdpZUlD3g7IrjR9WofkvAGj6NvTDlO0ZQoe6xZ443p6EQSr
         iqp8OW098JkgomGE460AeJJan7oOdE4fjklet4HTWc+a3Y4HWqlnxUfciUd9Q7c2imls
         AR4A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=cALPZs4g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b7048ff9b8si546905885a.698.2024.12.15.16.51.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 15 Dec 2024 16:51:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=cALPZs4g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tMzJJ-0001Ny-Db; Sun, 15 Dec 2024 19:50:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1tMzJC-0001Ik-Eg
 for qemu-arm@nongnu.org; Sun, 15 Dec 2024 19:50:04 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1tMzJ9-00075M-PO
 for qemu-arm@nongnu.org; Sun, 15 Dec 2024 19:50:02 -0500
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-725dac69699so2916937b3a.0
 for <qemu-arm@nongnu.org>; Sun, 15 Dec 2024 16:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1734310197; x=1734914997; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/txMo+Nnraz9AAcWBO+Ht1SEClLczXwE0l/xGp309E0=;
 b=cALPZs4gPoplCd4xK+AsOxHGgOm0gazgl2ccmMBlj/SCNEHh1KbYzkk5jEwJrHiOuj
 A0pBlO3Wj79MfHIGJOl6aRWTA9hYUGHOof3hGlMcFGbuANBeCnzREK0VGZZKIeUaGHWn
 Y4EzBqP8fqB+WJGdmnACWXz9zOYIhPSD8UPNRhji78lCQ1QbR78ojNnZW9g6aL7eFjf5
 Rrj+ZkqWVUJPC5lJCVnAP9A9Tk0Yelwwe2qOeRETBMaaNaktfqK6+vd73DlNaGJUcj7q
 9v5sb9qMoTEwSiQuMBe/t+IURoUVTbP8BjbX5WE27/Y15RhyB/X7SkfxDkEPMuEzs/yL
 Rwfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734310197; x=1734914997;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/txMo+Nnraz9AAcWBO+Ht1SEClLczXwE0l/xGp309E0=;
 b=OoVGAuEKMHKqCMduVIZZn9i/aqMxXPljs8cFjSju/PqYrIyID9K5xX7btE0cvnhWe/
 5E98KCm/WQiTttNun6fYj1DbmWsfuyuX+JxjP2jP0RNsEtMSVsoR56lQ1zqW7BoIJQO5
 u+kcDcx9DlsR2j3955Llro6lSzlqe3UVkVH0Ih4dV6jYRszKD4X7n2YjWXq+GIoeNm9R
 x9fv5BElS/a1yVi6naFkZxDiJQn2k01f4utGuSKvOt+9q96j4Dt+3OKCMoW+kJfMD0yt
 HPPLCWC8TvvS1EbWUcAfx8fN+eTjIUq6NcG6l8Y2ArHPLa4B8tP1iMsLoSwex47PM5jM
 M4VA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUclN25pPHhd3/2FawgfvMcZyhNMDgbpjiouVugzIcw3oDutOB77UIcF8HFNBxkYWOpxpap23hI2w==@nongnu.org
X-Gm-Message-State: AOJu0YyYYeC1tjLfBpnSJOKDi9ZlEElI41SsyNWED+Jjd0tzLt73Nt6N
 OAFemO9Hi25zQt39PsXOmm66lfL0BaDHWRY7R5j0JZReKrtKGwXkNLdRBKD+q0g=
X-Gm-Gg: ASbGncu/PFI4U7aNtdLqpE8/nJfaJmuRSwTNe1CuttzMba20Nz6mlCmvjvcQiSneD8W
 CsX6rLe3VDosOofXrF+PjTWxZZzp3FOS/VnOXe2M7e7ddz6TuvTwVQEbhoiCwpf7gpFI67LmQIz
 yBwNBwODjPBeNF2Ujx4oOg/qqTyI4pVk4pdhOVeTkQu+Xd8cgWnlkNW3nzvx/qGHRVxwxMmeLtd
 Okd9Zir8lvgOKaB/uRO4Ivec+0Y3w9MJGeMsY7KJ+wOTnWU69HugZMu971J/KKA794snuPaUApf
 Ejeix+jG
X-Received: by 2002:a05:6a20:9f05:b0:1e0:cf9a:87b1 with SMTP id
 adf61e73a8af0-1e1dfbfbcbemr15265933637.6.1734310197718; 
 Sun, 15 Dec 2024 16:49:57 -0800 (PST)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-801d5addbf9sm3059586a12.47.2024.12.15.16.49.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Dec 2024 16:49:57 -0800 (PST)
From: Jason Chien <jason.chien@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-arm@nongnu.org (open list:MCIMX7D SABRE / i...),
 Jason Chien <jason.chien@sifive.com>
Subject: [RFC PATCH 4/6] hw/riscv/riscv-iommu: Allow PCI hosts with iommu_ops
 registered connecting to the IOMMU
Date: Mon, 16 Dec 2024 08:48:55 +0800
Message-ID: <20241216004857.9367-5-jason.chien@sifive.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20241216004857.9367-1-jason.chien@sifive.com>
References: <20241216004857.9367-1-jason.chien@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=jason.chien@sifive.com; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-TUID: 32iTjUfpcH4w

pci_setup_iommu_downstream_mem() is called to set the downstream memory
region of the PCIe devices.

Signed-off-by: Jason Chien <jason.chien@sifive.com>
---
 hw/riscv/riscv-iommu.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
index e9a0775d6e..f5d53a36b2 100644
--- a/hw/riscv/riscv-iommu.c
+++ b/hw/riscv/riscv-iommu.c
@@ -2436,6 +2436,14 @@ void riscv_iommu_pci_setup_iommu(RISCVIOMMUState *iommu, PCIBus *bus,
         QLIST_INSERT_AFTER(last, iommu, iommus);
     } else if (!bus->iommu_ops && !bus->iommu_opaque) {
         pci_setup_iommu(bus, &riscv_iommu_ops, iommu);
+    } else if (bus->iommu_ops && bus->iommu_ops->set_memory_region) {
+        /*
+         * TODO:
+         * All memory transactions of this bus will be directed to this AS.
+         * We need to distinguish the source device dynamically.
+         */
+        AddressSpace *as = riscv_iommu_space(iommu, 0);
+        pci_setup_iommu_downstream_mem(bus, as->root);
     } else {
         error_setg(errp, "can't register secondary IOMMU for PCI bus #%d",
             pci_bus_num(bus));
-- 
2.43.2

