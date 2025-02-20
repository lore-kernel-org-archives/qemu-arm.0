Received: by 2002:a17:504:6615:b0:1be9:327d:8ee3 with SMTP id h21csp173812njk;
        Thu, 20 Feb 2025 08:15:07 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWzMyjHSRvsVQd0ZtodiAtxsQbc+0NAyT2sKonIyzMeHMVslIxPWXEpnlvzS4/jyIytS+uaFOWuhEQeAQ==@linaro.org
X-Google-Smtp-Source: AGHT+IG2yAfd9B28vwA8wOEBIVZ2YuGMY43qvppen6+ba662Vw+I3oHNmubbnjkdfd4m4bn3V4A9
X-Received: by 2002:ad4:5f0a:0:b0:6e4:3eb1:2bde with SMTP id 6a1803df08f44-6e66ccbd138mr318441736d6.19.1740068107170;
        Thu, 20 Feb 2025 08:15:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740068107; cv=none;
        d=google.com; s=arc-20240605;
        b=KwguxH+ttpapkTL4X7vGsG/VEW34hxagVLXxJUIRX6r7vh3f8gXqry0YLvTgm2seoJ
         6/bCJ9w54LTzdoSxJIHBS4Mb72S9xVnvSlt/xNoP3sStaLPAhxbYqqwXASH5uo0krSQN
         5ONwYjO6LY4oHWb7mFKOAawZdVJuolD8nzUZtYxhTGgR3gDr5kMOiv/a+4c8ODL/BXWR
         b3pSTEVew8C3z928d/kBciFzjEQTXB+S1CHdn/auMLCaLiLvWgJSBM2dwqgKdUahYHpe
         ZGppolXWi1OYxkeVUeLgddSAWFqGrv/eX8cd4dJG5JpV3lzLD5aN3DxeXY0RRgVlfg5h
         GwTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=7Smdb1C+s1cDlSOZsrFF86ZErHElhYVQWrEWtL0Vg7k=;
        fh=ARoT4oWY30c1kBopAsHUyi2RT2lOyN+WElwcOQcYM9k=;
        b=GspSmdfNhyhjtmzxwjgVw3x8B7oJhs1mvJqPujq6V+GGfE0EIRSYKHDtiFjIP9W0Hk
         7jh+nPNkTrglKU8hK6hvND+QrQAAo6JFq8L9NFb8J2FyfL9IzGLhS+kyPXndfji/Fe2b
         FzinsEU5rITzDILZz/j2kAMCv/Uv2rmAjd8IEi8C/vAKi+1Xw3qpxUE2ZYpVc0LC3xRi
         y0RyfQXNRoxyjeQzgqF8+N6QsLmgaK39GwzxOCcs5I7qGpeHctqhgPMmiKsTFcoyMmcQ
         3P7NRaoAzNPAzlP6P/BltWA+JIQotiz1kEMld4y4ViadqhHj0I6x+vEkkE8Uy/fEkbDH
         EK2g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="G/ngnFDJ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e65d6e06fasi152752856d6.0.2025.02.20.08.15.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Feb 2025 08:15:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="G/ngnFDJ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tl9CU-0002Su-Uo; Thu, 20 Feb 2025 11:14:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1tl9CT-0002SY-Cq
 for qemu-arm@nongnu.org; Thu, 20 Feb 2025 11:14:57 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1tl9CR-0007Le-ID
 for qemu-arm@nongnu.org; Thu, 20 Feb 2025 11:14:57 -0500
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-38f31f7732dso795515f8f.1
 for <qemu-arm@nongnu.org>; Thu, 20 Feb 2025 08:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740068093; x=1740672893; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7Smdb1C+s1cDlSOZsrFF86ZErHElhYVQWrEWtL0Vg7k=;
 b=G/ngnFDJm8tF7rnO5I0w0iHO3WuYzmFUCU1cj8ngQBnbWaSnZ0q5M3UWA40nmeijNl
 FljwJ0xIks3xwD1XBFUN0XsB4nnmAlB/ZRo1atD/pAuY8J2J2ZMZWLrqM3PSfoWYVeVd
 vxHqnSn34vpHNYs77AgOqRMSli9vmfr1kGrRtVAs0nXMpe01oc1RcpuNwVz+sKtUoQaM
 FrTIYbhYRsP8b7H3YJD+RbYwve6lbVwXxrCEW2qkmKC1asloVd4OchVtacrkRqg10Vgm
 G3eLYi4UgcFqHxSVgkzuaOQlek+MX7yoJxdenbJgFWua2kv8XG/UBcO5ybQdnFCZd9sP
 g5BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740068093; x=1740672893;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7Smdb1C+s1cDlSOZsrFF86ZErHElhYVQWrEWtL0Vg7k=;
 b=tvV2BJZ52SL0BB4nkMQqsLms87/pNbZ0OeI2OQ1XJXye2eV6GVQr+D7QvE8l1Gv9uo
 amvRC4Wv0jv8vnGu0hncons6QqyweEuv+xvMc6V6vkBrgHLTmK051Ar8f+5Pc9I+mDk6
 DfR30REcFwkRcu1ItCaexSqdSfRkGKR9kdD7ZkWH9tTGW4FpCfScYdjo5+eLHEu96SaC
 w4hGUpe4AXocsndwPOSa1LbZnpeKKcTRLv/GbjYq1vQxfUcGG2xOllgGxINdHOi28T2j
 bNLNH+pIJHPBdAgkfu4i9AMNOFWvuDGBF+H5DdHUKn1ERGqwOhHfmbRfCOHwK6hSouSZ
 V9hg==
X-Gm-Message-State: AOJu0YwTjsCcvfpdloyel11S9gIBWMHkjMw27ik5bD2HuewYAEwhZY2a
 jwRdWqjxdQgkAWZ7LTp5MUeJJDKcQxqQtlF+bYSaShUkvQegMqTQCGnGKmrJM4U=
X-Gm-Gg: ASbGncvi0j1Nydf1KtH0gssyLOgDN0FLB0kAShP3e+pQw2un9ni9k5lQaUzEiKxLdBS
 5YArswDkU3oGRLG9xBVQqXocUAW3mGt0olLKzyp+HL1VLI7mhRrf7DCAoTdTkI+s5lt/e0LlxZP
 b6EEw5AzQB2TSEbD1iybWaFvXWkJ/533BViDGPGiUEueiOfoAuNHSd7b18oSTKjWLnCs9XszYYr
 x0UrOn3VIY9uGNYk1fv4IC+0lrbb2Tu/Tq1KsTriQ8B0kWpcBeP4vhn7f2LiKE0glmN0PciAGDX
 fAZgYMS+hrWHLYZgnxEbHU0wN36AER14pQ==
X-Received: by 2002:a5d:648a:0:b0:38d:ae1e:2f3c with SMTP id
 ffacd0b85a97d-38f6160772amr4419616f8f.25.1740068093003; 
 Thu, 20 Feb 2025 08:14:53 -0800 (PST)
Received: from localhost.localdomain ([2.221.137.100])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259fe1efsm21197741f8f.97.2025.02.20.08.14.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2025 08:14:52 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: philmd@linaro.org, david@redhat.com, peterx@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [RFC 0/2] arm: Add DMA remapping for CCA
Date: Thu, 20 Feb 2025 16:13:19 +0000
Message-ID: <20250220161320.518450-2-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: kC89tpFvuVe7

These two patches will be included in the series that adds support for
Arm CCA guests to QEMU, which isn't ready to be merged [1], but I'm sending
them as RFC first to seek advice about the best way to implement this.

There is a breaking change to CCA guests, where DMA addresses now have
the "shared" top bit set. The VMM needs to strip the address before
accessing memory. See more details on patch 2 of this RFC and on the
Linux change:

https://lore.kernel.org/all/20250219220751.1276854-1-suzuki.poulose@arm.com/

Patch 2 inserts an IOMMUMemoryRegion on the DMA path, so all DMA
accesses get the top bit stripped. It also adds RAM discard listeners
(guest_memfd -> IOMMU notifiers) so that we can create VFIO mappings in
the top half of the guest address space. Patch 1 is a hack to support
GPA->VA translation during the discard_populate notification.

I'm testing VFIO support using Chenyi Qiang's series for shared device
assignment [2]

[1] https://lore.kernel.org/qemu-devel/20241125195626.856992-2-jean-philippe@linaro.org/
[2] https://lore.kernel.org/qemu-devel/20250217081833.21568-1-chenyi.qiang@intel.com/

Jean-Philippe Brucker (2):
  system/memory: Allow creating IOMMU mappings from RAM discard populate
    notifiers
  target/arm/kvm-rme: Add DMA remapping for the shared memory region

 include/exec/memory.h |   5 +
 target/arm/kvm_arm.h  |  15 +++
 hw/arm/virt.c         |   2 +
 system/memory.c       |   3 +-
 target/arm/kvm-rme.c  | 220 ++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 244 insertions(+), 1 deletion(-)

-- 
2.48.1

