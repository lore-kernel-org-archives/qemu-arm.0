Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp2449038njm;
        Fri, 7 Mar 2025 12:40:23 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVLjPaWL10n0m34YW/FSqrZ8LN3G/FRlatWNVziwMJeoZwI39ZtII5olyZYOyCBnIxAS+NZAbxJJ8psCQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFuhZM7Xb+Qrq+vAR13d2o9YWeFzYgGG8qKhxAN+S+3KDl8t7s4ki+Sz89Ej/5uCpLqCwIs
X-Received: by 2002:a05:620a:4388:b0:7c0:ca33:6a97 with SMTP id af79cd13be357-7c4e16826abmr747327085a.18.1741380023207;
        Fri, 07 Mar 2025 12:40:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741380023; cv=none;
        d=google.com; s=arc-20240605;
        b=SxUojEK+YeZSxmwaFHJqYmu10F7R51RxIxf2zcxBkoVJ5DOLbBLmeFDU421yQHheLq
         WGUUY9cubZFx1pC+p+BkDDJkg6E9Pu3v/YW3jC+bNZyzBA1hL7TqfETYy9OYOpwjBU/H
         nvYHb/f0xMI5trUIm6RXi/FvSonvmpcT/oS5FenawRa69cCAtfDKbhrI8c9sLMJpERCs
         GQ2zPKth0bKCH7Aveett2bJuyxZcXabyuHMq6hkHHSJdXFTc+ltEAJULU7zOlB6HeZvY
         4ZufsWIOpzud7STtAFbJpgz0qdTEMb7FxF02hG6yGwfelk+XcZz//ijBEUaPdpZW5UJo
         70Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=dppJGFKe0O8FEfkLqUZJx0Vx/phQ/obvZ/lkzgf8YXE=;
        fh=uJ3UyDp3rgukg0yJHqOkTbx6za4CM5CbiNX/C3uWAs8=;
        b=CxarC86bDXStbnK9cTQlLhxJSrXNR/5qSVbKL08f5Lmx7Cc636zHlD4HpUudV4lLU8
         9rcr2zSKtYITtI/uGWbutEusq1jJqK18igFGk/x3qqeilByg7DadJA9LOummncmbBEuA
         7LwxKC1r1ZwlY/PpduAdHzyQebb5SEspGUMEa7ZLTLms8SZBjEcAPTa3/+vaT+XFxPCu
         3kM4quQrs900Td1pHMUrM5cyisG0/WDbebDg6zXLz8MAnSiffH5kXJHKAQjSxAYft8hv
         p9eEM7blwtw0vktPFppa0z7U+Hsxrtege4nXFxeN0RN+2bX2tls11PHHdwRMzsM0/YIB
         uDfQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=VxVV8h0N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c53e6e7059si1914885a.555.2025.03.07.12.40.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Mar 2025 12:40:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=VxVV8h0N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tqeUQ-0004KV-TF; Fri, 07 Mar 2025 15:40:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1tqeUP-0004Iz-I2
 for qemu-arm@nongnu.org; Fri, 07 Mar 2025 15:40:13 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1tqeUM-0001tJ-RX
 for qemu-arm@nongnu.org; Fri, 07 Mar 2025 15:40:13 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-2fef5c978ccso3682639a91.1
 for <qemu-arm@nongnu.org>; Fri, 07 Mar 2025 12:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1741380008; x=1741984808; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dppJGFKe0O8FEfkLqUZJx0Vx/phQ/obvZ/lkzgf8YXE=;
 b=VxVV8h0NemvJa/e5VP8rK1NQBI1TCdw2xhx71Azvzq7+uDbpBKrRwgGCN2OxNmLFGy
 xS3ghE3xHdw/mjGObf4EZztQVsrZoavynYIfIFZ4E3TRBXYjYgxVSvzf5imx354YwxwL
 D6x5RagxFjky8+jbqhjtnwdVbgLkYUHyOS4XarM8Fj5z17Ra2Exfmxq2+8HxD1Ck+kZr
 JjeLkHWdx9bdRI0/4JDXqPc+L5RP9Uo2gVQNl/yszj/Hv36eZQ8BYZWsqtmYxfydxE7K
 rizOExCUR7wr+2QjSnlG0s20pfg0MrnD5Fy6LvPUVYnTi+t0U+1Fw8mRZsoCcXnEdpkI
 TgHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741380008; x=1741984808;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dppJGFKe0O8FEfkLqUZJx0Vx/phQ/obvZ/lkzgf8YXE=;
 b=csufrtoqwPLYN/t1w7K7tKf2W3pcfyt3asxTmInkRH86hLECO/AzFql5pjX9vm+lNX
 Ot5T2rgkX0FvXgnCjjwgDH1bHCFDWshuu+1q6Vrta1CMOdJpHGr639UZRGawIkChUNQw
 SHiAK74Qa/LLQvYXEV+JQxS0gX4KwVMGg3w1FN/VRqjwFXlexJbf0gg3yxeVobQJ/0cX
 AX9hD+r1uIj8ejMjfbbdJkzWsFQIUTsws459BB+qwXHtUxoPF8y2ijshQotXU5jowdT3
 8mKNu4+S1gAsT2xAcUf8r7JU9jaWzmUODIXqvRnlPw7+KgyTwNmFHAGYWJ43B3hsOQCW
 /iPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV48uhyojYCeDdrfLGRf2rJ4DJ21VnzeRSPyAASpEYXq0ksjwbHFHGECu54whQ3Txpp2Is/FLIg0Q==@nongnu.org
X-Gm-Message-State: AOJu0YzarzOc2qC3+P3rWiZq6neI9Vgb86Q81J7EqlqjQEKi1cY4Ui1a
 yI+vq8Bc2EF6uGdlARXzbNvwv4tD8XpCszpllEmI7iHqO5/yaGdYHSXPjZLoQJM=
X-Gm-Gg: ASbGncv5HMbUvbMDC3JqJXErTGwTH0bp9F/EG3Q9s3KA/c8SpZrfOfQBBnQYKaMoswP
 aJrfR0NrSvUAenuDGIsNe5f+DeVRPvy7BifmqYaNAN/T9lAkXA+gBmobd5PeWprdS2f9FzbsJfq
 6wLALuSegtq5ISHP5cD5XiEezNRJnVTrAJvmIN5vvS5G2GUDrL/4KNJtFsMLI9UpO0+QmVk9nv1
 R5SoLzzFDITanpjOGmFYNBxKGXv0gFArg5aN+sj+8VDgpKCui/rFxEFLsj6QEsNK0nFY+IK+Bon
 bzYGOsB27wFJTQ+BSQaXwk0v9962RFo7+FRLUSJK8m5Fg8NsRasNL+zdVLruwKZHAecRZLBb
X-Received: by 2002:a17:90b:1dce:b0:2ff:62f3:5b19 with SMTP id
 98e67ed59e1d1-2ff7ce6f0bcmr7494655a91.13.1741380008547; 
 Fri, 07 Mar 2025 12:40:08 -0800 (PST)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ff5aa3d3ccsm3270900a91.0.2025.03.07.12.40.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Mar 2025 12:40:08 -0800 (PST)
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
Subject: [PATCH 0/4] Integrate IOMMUs with PCI hosts that have ATUs
Date: Sat,  8 Mar 2025 04:39:33 +0800
Message-ID: <20250307203952.13871-1-jason.chien@sifive.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=jason.chien@sifive.com; helo=mail-pj1-x102c.google.com
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
X-TUID: uoc6j/OnH6Yz

The struct PCIIOMMUOps is designed for use by an IOMMU, but many PCI hosts
also utilize it to implement their ATUs, preventing coexistence with IOMMUs.
Overwriting a PCI host’s PCIIOMMUOps disrupts its translation rules.

This patch series introduces a mechanism to route inbound transactions from
PCI hosts to the IOMMU, enabling proper integration.

The final patch depends on another patch series:
https://lists.nongnu.org/archive/html/qemu-riscv/2025-03/msg00003.html

Jason Chien (4):
  include/hw/pci: Introduce a callback to set the downstream mr of PCI
    hosts
  hw/pci: Introduce an API to set PCI host downstream mr for IOMMU
    integration
  hw/pci-host/designware: Implement PCIIOMMUOps.set_downstream_mr()
  hw/riscv/riscv-iommu: Connect the IOMMU with PCI hosts that have ATUs

 hw/pci-host/designware.c         | 18 +++++++++++++++---
 hw/pci/pci.c                     |  8 ++++++++
 hw/riscv/riscv-iommu.c           | 15 ++++++++++-----
 include/hw/pci-host/designware.h |  2 ++
 include/hw/pci/pci.h             | 21 +++++++++++++++++++++
 5 files changed, 56 insertions(+), 8 deletions(-)

-- 
2.43.2

