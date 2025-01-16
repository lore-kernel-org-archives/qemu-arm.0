Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp3811542njn;
        Thu, 16 Jan 2025 07:04:30 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW1DZYulVoC4uKgCecJaGVAanPJoqWsrChPxBU4Rjj5JJbrQRnTOC34L/QtCgMl42j4rtaR8I5mErSktw==@linaro.org
X-Google-Smtp-Source: AGHT+IEy3nQ0xylXfzFsrQZCg6mdidItQUfk/TfF9c5sD2MM8gMs/YJNftpi4fwDpnEX4kjD7AWu
X-Received: by 2002:a5d:64ed:0:b0:38a:4b8a:e477 with SMTP id ffacd0b85a97d-38a87306a84mr31486449f8f.22.1737039870027;
        Thu, 16 Jan 2025 07:04:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737039870; cv=none;
        d=google.com; s=arc-20240605;
        b=dVpTh85CBbuODX69PJ5+ZZB82faMbaEI2ljWWKSYv82Uuyxid7m3dSdp1xNkDQbrRi
         I+3BJkUHc43EANmb4egYXPseQYNrVdc7x/2epF8Dmq29GnKsKWvZHNQ69aEs/P54msgD
         Nd9aK3I8UnuNwWxRa2cOrxUkolfHPAyUJYFwbBYHafufMzsHbQbC+kKJU8r6wwjR1JQl
         nZVBS1PPlMufYLm0rCSf7HVO/UEjmqeXYtwPOxuXOBUEOkTqNOOS4sszj3dvdY8i8a8w
         prymaP5+9kljPcG6k8vVNLjFTw889GBiRIntNnD+SnI2+cUDWW1nlf2om9TO+BKHkM5C
         MiKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=cYzGP6d4KrcAWacK9hFHH1x2EKu15pc5aRijUf74uhE=;
        fh=PH+fPEZeLLEAFwQ129BxLi2nNqv4RfkzAnb3sXgXdlE=;
        b=NE2qJ0VxPcb9WKLazkWy17b0N5dsIqFHtmniOv/GxSqVFMkt3/0EnEHM4WRfPab7ma
         841UF0eeFkGr3/ywhn81XixrZuBrorzynkaoZiXwJYAal9gxvzCEu2AaIx4UUOYdO2hj
         4Dxoiu3xMeMF+sxVCYt11Nlwi7b4WmJ2fUIN8UQQx1xuNSLZkwbH+X2AG8cqaVyK+8eZ
         ZJUMqRLwK+2dwT+HNClMHmaclcLz8jv409tS+c/tZ1c1UNJ4JhPK9WIGssEAtRMrPmBN
         OD/TeGpeVGFBA5yJJ9qnHJTYmsdBaZkWNFypFnClRLqDrAsLjiMoEB4XeSM3t1gasNen
         q7Nw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ac2Ww1De;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-38bf3284414si54074f8f.469.2025.01.16.07.04.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Jan 2025 07:04:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ac2Ww1De;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tYRNY-00045b-Qq; Thu, 16 Jan 2025 10:01:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tYRMc-0002k6-JC
 for qemu-arm@nongnu.org; Thu, 16 Jan 2025 10:01:00 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tYRMa-0000HD-4P
 for qemu-arm@nongnu.org; Thu, 16 Jan 2025 10:00:53 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4364a37a1d7so9639025e9.3
 for <qemu-arm@nongnu.org>; Thu, 16 Jan 2025 07:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737039651; x=1737644451; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cYzGP6d4KrcAWacK9hFHH1x2EKu15pc5aRijUf74uhE=;
 b=Ac2Ww1De0YGjaLkOp0L9zXwnF7lG4qwaTuxb1kfIIb/CvDu1/vQQCyv0vG062zCL00
 vhqgWs0itcuShnW+TAN/HXi4nWQQ77wJaOd++Bt1OzROgNkSlCGmqAP9/pzawUkww9Mt
 eUbNrAAPTe8scAI/kEdPWgBoN+AxpZ4H5Jo3nA9kmIX+zFOABN4brXrsfCtG22wd3LLp
 JDsSdjMhg/I1NafS+drBz2sxDylzSD9H+P5gQV1ITzhtsWAA65U+FjduJjtT051kGCPx
 qzKHYxSr+3bhcYHpcKyqXxh40/N34yXU9WRYXuozUl1EGKziyZcJPzzd6zGU8yMnfCol
 8Idg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737039651; x=1737644451;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cYzGP6d4KrcAWacK9hFHH1x2EKu15pc5aRijUf74uhE=;
 b=SGwxnQRIie5zxhqPYMu8+JjiZ0nORm02Qbo86SaLGr39OeUE2usOxFsCZExCI928ew
 dJ/MDcssCfGaUlu4OJwteDN+AqdZWpnl993PU85mo554qPK4PnlCv8XCjmxg4QyidPLI
 6YL81GjF4zbOepS7wCl9Wx4viReJ98c2xv/NfgJo5uBzANvb5oEJpmGVH8kKJ4owgTzt
 SPmi8AzQSsgr2Cajzo49lWPG+xvdoXlTRkuQqb65jxoZwfeO4DWf5K/mlEG12zi8jA2T
 E/vrs0btZ46Q/59js/Lg57JXzzFTFlCCVwOXGn450mkPKW8BEJnmRDNc5MacSUq9ZNFO
 bK1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmMvs2PHBnQLsgiwW+BTKo0LiS1c99bAHWvrqYVgvyZ+q8NyroZ1FxEPoq+s7IaenN7gEGxWgY+w==@nongnu.org
X-Gm-Message-State: AOJu0Yw+xyYIGqARvmcg7CE8VWQbsDiEUC1O+fZtErEuBNtkyRgDv2w6
 SYkq9OPOwdO6ZjYV3bkVfSTV7bA3ZnKsHHoCgnAzGLqs9t/RsN11qsHj7UEontc=
X-Gm-Gg: ASbGnctgmsiwpPhSkGcv04QAzYtylbi0FFR+gdy1X6p9LUx1SiRqeCuYX3nFfTQzBMo
 d4W0cgk0QkN/xRPGWoHyaRdEVhx4Ht3+sbNaR+iKz9E63Xtqi6cMjjac+fud7CSYJFIIEqVX6Bs
 k+cVEVTAfsr0pvOy6vmh/DsI5qPw86tSEoo4JcwtNCLmXmw7a9EPP5MRPITphUHtba2qGFVlHvY
 3/CflruB855dReKX6/T69tpMSInAG5yUeAD56142ldcC9Qa2mwg+60Dp6bTKhkmZeFkoTw5rOT3
 ttR8t0O4Kb0nBdcvgyQdBxyZPjWiM5s=
X-Received: by 2002:a05:6000:18a6:b0:38b:d8e0:a862 with SMTP id
 ffacd0b85a97d-38bd8e0aa1emr16675777f8f.43.1737039649256; 
 Thu, 16 Jan 2025 07:00:49 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38bf3275622sm69834f8f.69.2025.01.16.07.00.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 16 Jan 2025 07:00:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Igor Mammedov <imammedo@redhat.com>,
 Andrew Jones <ajones@ventanamicro.com>, Thomas Huth <thuth@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-10.1 v2 13/13] hw/arm/virt: Remove
 VirtMachineClass::no_highmem_ecam field
Date: Thu, 16 Jan 2025 15:59:44 +0100
Message-ID: <20250116145944.38028-14-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250116145944.38028-1-philmd@linaro.org>
References: <20250116145944.38028-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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
X-TUID: Bw6P6fZkeqRs

The VirtMachineClass::no_highmem_ecam field was only
used by virt-2.12 machine, which got removed. Remove it
and simplify virt_instance_init().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 include/hw/arm/virt.h | 1 -
 hw/arm/virt.c         | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index b2cc012a402..9a1b0f53d21 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -119,7 +119,6 @@ struct VirtMachineClass {
     MachineClass parent;
     bool no_tcg_its;
     bool no_highmem_compact;
-    bool no_highmem_ecam;
     bool no_ged;   /* Machines < 4.2 have no support for ACPI GED device */
     bool kvm_no_adjvtime;
     bool no_kvm_steal_time;
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index d22b445fe99..8c5ca6b59d3 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -3283,7 +3283,7 @@ static void virt_instance_init(Object *obj)
     vms->highmem_compact = !vmc->no_highmem_compact;
     vms->gic_version = VIRT_GIC_VERSION_NOSEL;
 
-    vms->highmem_ecam = !vmc->no_highmem_ecam;
+    vms->highmem_ecam = true;
     vms->highmem_mmio = true;
     vms->highmem_redists = true;
 
-- 
2.47.1

