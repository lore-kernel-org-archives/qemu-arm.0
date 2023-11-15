Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp2813673ejc;
        Wed, 15 Nov 2023 06:34:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFX/R7ms0pzBoWCFZJG6tL5VNz+RmVrrMDGj4LQ7xaJ23PcXWJSb6nlhcJgVhbasXcO/UUG
X-Received: by 2002:a05:620a:d82:b0:775:8fab:8c6f with SMTP id q2-20020a05620a0d8200b007758fab8c6fmr9587494qkl.29.1700058889767;
        Wed, 15 Nov 2023 06:34:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700058889; cv=none;
        d=google.com; s=arc-20160816;
        b=NOdrY+7uzl1DjKc2Br+5PkT4V1VEV5JG1r041kmld72b8JJgLdozlHHVGF3xR4W8oN
         n6Mr4ZJVOUU8Ju0US3ebEYZGDNw1Yn96eAiFbP4AIepNK2R4VW/xLzITjOLMQhIMxziO
         zJ3F0MsPH6PTxsjc0Eev+7fqnx8ViJILD28jCChBSbvg8Wg9Q4SZ7wMg77vUGn9IiDgz
         usXedQ6FV+lnDDzMup7qOXDNCtrg7hkaDDx5tKIfyqXxspPyJaprXwQps2BaRoaoIclm
         vza0uwyKCvWZDpgGhkWqBXr0x2z0wxp3miYuLyvVu+kxgfiQsSBAHtVXKN1D+3Pmkvec
         RpCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=+C/VrQrhq4780YNyMmwIgAPUdeApku0KscWWMgpJMuM=;
        fh=usG7HSbX+ppIdZ8S6Yecerp/4Ix7uDfnNi1g9n+wGgw=;
        b=kaS2UnI0ABaD8gKh6oEhjreJGEvMGrmL32WJbROeYDK+373BD78+Dqgaa+c/UxzeXL
         pf46QQcjJsV4wmYjouuFfLg80o76u5U2PcLHt5TIglDpzVEDoIfztrx78Qd33+IdLAO/
         G78nxNhmLiUEKmeUY/mQYUOevTXTBP3BGX6GpVYVuLb4/WgMmgmuEkYCMqG+DQ44K+ub
         Bkn3nKhjk5EWA/BkpJz3oQ4SRZIf9jt2JCXjrX44RHnhegHg4LO53ZqMaAbyuzLsKL79
         4jei+nVjluhx6mVEX8LYQDnIPI1x1eSFQEs3EYTSwU+p1w9VxfxqgyQDtpBva6anXqgc
         j6KQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=diBEyCEL;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i11-20020a05620a27cb00b00778b115b7b4si9612090qkp.440.2023.11.15.06.34.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Nov 2023 06:34:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=diBEyCEL;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1r3Gxr-0005Q6-Ny; Wed, 15 Nov 2023 09:33:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.hsu@sifive.com>)
 id 1r3Gxl-0005Or-0j
 for qemu-devel@nongnu.org; Wed, 15 Nov 2023 09:33:53 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.hsu@sifive.com>)
 id 1r3Gxh-0000pc-JO
 for qemu-devel@nongnu.org; Wed, 15 Nov 2023 09:33:51 -0500
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-6bf03b98b9bso682395b3a.1
 for <qemu-devel@nongnu.org>; Wed, 15 Nov 2023 06:33:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1700058828; x=1700663628; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+C/VrQrhq4780YNyMmwIgAPUdeApku0KscWWMgpJMuM=;
 b=diBEyCELrPmHSeys125rARqQKeSTTolq9M5m0m3+gfe7pwqbL2/MH0gYDPK6tg2kUK
 Yd/NAIeAIE0U0uDiT6P+j/TZk1gFGchfoBBztH53f0239Orh9E2Xcm874yiLzkU2CqfU
 uENk1xkBe0cFqoaO0guKWOp47XPEj/sV03ENsPwLWZLOnsNhJW98r/WIYK4b1UTuf2Sg
 uFItzq2lq9GX4hXBkOyHujAx7SpEM0jZVQTRNgvucMqRefjawEz68ot8jRnVfjGwLF5A
 uVM7SESbeIlNdhvbhCYmgwERQf1ycXfCK0jkjmQ8dOul6XM01C7ZJB4f67GkUYjYOqcc
 mg2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700058828; x=1700663628;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+C/VrQrhq4780YNyMmwIgAPUdeApku0KscWWMgpJMuM=;
 b=Rw3a4QcI7voOqGTzcqM2kFuLbfBbTGypCEYsLP3V2qZ4QjshYqqzGVKF4zrbnMWkFL
 QJXAL7/Yc5w0+L3s6f1csYBEs4DKygRypGA5NgpuFAnrSee13F6UjrtiB8gCy9Pqjaa7
 6UDKu8Cs+Y+V7TtsJqILiUMzr2edpr0GCf/foSEnRuDwYyLcLG1K/aQ6dZttaOJFMWfg
 3mYMYMytmRVVX6rzRd+WALb6eCO28X5EtARcpU2ZM8jN1w/sphQLuLVdab0/fMib3FTE
 ZkoOiEhVrgm+GI6z5abjutK3H+a6KWnNomWSEHwtxpIpNrsMRTdYlflofYrgGyLFUkLM
 D2JQ==
X-Gm-Message-State: AOJu0Yz2F18uKQoieBql5T9HLu8KpmHH01+rGlsWDQXMz+BZX6YcQC9s
 gRP3+cQB+adaNJnwhoOcmIskFA==
X-Received: by 2002:a05:6a20:72a2:b0:187:5db4:168c with SMTP id
 o34-20020a056a2072a200b001875db4168cmr2806358pzk.31.1700058828035; 
 Wed, 15 Nov 2023 06:33:48 -0800 (PST)
Received: from maxhsu-SiFive.. (61-230-7-62.dynamic-ip.hinet.net.
 [61.230.7.62]) by smtp.gmail.com with ESMTPSA id
 r2-20020aa78b82000000b006c871f3ad1csm1443496pfd.71.2023.11.15.06.33.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Nov 2023 06:33:47 -0800 (PST)
From: Max Hsu <max.hsu@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: Frank Chang <frank.chang@sifive.com>, qemu-arm@nongnu.org,
 Greentime Hu <greentime.hu@sifive.com>, qemu-devel@nongnu.org,
 Max Hsu <max.hsu@sifive.com>
Subject: [PATCH 2/2] hw/pci-host: Designware: Add outbound iATU no address
 match behavior
Date: Wed, 15 Nov 2023 22:33:41 +0800
Message-Id: <20231115143341.13068-3-max.hsu@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231115143341.13068-1-max.hsu@sifive.com>
References: <20231115143341.13068-1-max.hsu@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=max.hsu@sifive.com; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: zj+a5SKDBd+R

IMX6DQRM Rev4, in chapter 48.3.9.2, specifies for outbound iATU with
no address match: 'If there is no address match, then the address is
untranslated.'
The current model implementation only considers inbound occurrences,
neglecting outbound scenarios.

To address this, we introduce a new MemoryRegion to handle the behavior
of no address match in outbound transactions.

This fix has been tested with the integration of Designware PCIe RC
along with the e1000e Ethernet card, ensuring proper functioning of
network transmissions and MSI interrupts.

Signed-off-by: Max Hsu <max.hsu@sifive.com>
---
 hw/pci-host/designware.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/hw/pci-host/designware.c b/hw/pci-host/designware.c
index 83dd9b1aaf..d0be8dec68 100644
--- a/hw/pci-host/designware.c
+++ b/hw/pci-host/designware.c
@@ -499,6 +499,7 @@ static void designware_pcie_root_realize(PCIDevice *dev, Error **errp)
      * to have the lowest priority.
      */
     MemoryRegion *inbound_untranslated = g_new(MemoryRegion, 1);
+    MemoryRegion *outbound_untranslated = g_new(MemoryRegion, 1);
 
     memory_region_init_alias(inbound_untranslated, OBJECT(root),
                              "inbound untranslated pass",
@@ -510,6 +511,16 @@ static void designware_pcie_root_realize(PCIDevice *dev, Error **errp)
     memory_region_set_address(inbound_untranslated, 0x0ULL);
     memory_region_set_enabled(inbound_untranslated, true);
 
+    memory_region_init_alias(outbound_untranslated, OBJECT(root),
+                             "outbound untranslated pass",
+                             &host->pci.memory, dummy_offset, dummy_size);
+    memory_region_add_subregion_overlap(get_system_memory(),
+                                        dummy_offset, outbound_untranslated,
+                                        INT32_MIN);
+    memory_region_set_size(outbound_untranslated, UINT64_MAX);
+    memory_region_set_address(outbound_untranslated, 0x0ULL);
+    memory_region_set_enabled(outbound_untranslated, true);
+
     memory_region_init_io(&root->msi.iomem, OBJECT(root),
                           &designware_pci_host_msi_ops,
                           root, "pcie-msi", 0x4);
-- 
2.34.1

