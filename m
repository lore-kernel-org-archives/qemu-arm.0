Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp1157250lfa;
        Mon, 12 Oct 2020 08:47:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx5sku4P5SaMV3BmCPKHhJ6RGvL4+5Wh0a9wMIxZdcJYMv1NQw+HIk3XU1TwIrl5WeNmhZH
X-Received: by 2002:a25:418e:: with SMTP id o136mr31708590yba.82.1602517655469;
        Mon, 12 Oct 2020 08:47:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602517655; cv=none;
        d=google.com; s=arc-20160816;
        b=v44pqiLBxTfmqX6+zv89J2br6uUbpfgK1plX3PaMWRGUnGk1zcnFOAM+ZZ6e7T3fD/
         g5dRNuf9ANNrxt6DvXkLzQYYQc9Wrrvcx49L0xM2X5rB4qOQJ0pf/t+ShqrCxAcGGIBj
         tsx+WbQK/d2GtL/xIQroCl8TU4eknA8Vgjd1uJBsl0V1VcFvTiEopuYFwpzPCJyvVCsE
         9v7/1oxeB/CJbzThiZtW1+hgcEYPzBrMurEUdnGrIIOYp71GkELF5/dVWg/HI9U9Zh8I
         jwuris5yYAUY+oi5rf3seQ9L8Dq3DkjYveg+EkBgh3a49IE5i7IbxZiDpwYxc8GYOH4t
         7MsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ZygS7xMaq3Qs9CSNEUUqz2guLfBsLuHXGM1Pvcfwirc=;
        b=OlRUQqsvUiCGONs6QP5pZZrW0vU5YQESt5N+YdD9PbBpNarwukb5Xnrsg72SCGpHC8
         Y8BZX22DPXEaJBTHY9NdElmJTjcoMzBuHGSaTTgGsBRZeAbOUXPkXs/t/6CO6gUc9Lec
         R6f1/0gKSAmKFIWK99ZrAYdQJaEEJHB4nUcg4473rUuF3a7VRrGbt5E4Q1Te42DL86p3
         SuXkZNSIIy83QbaC4sZb+bepTtDB8jzIxfiB+5UdiijwfAzhqoxtFHg2nae8aHwC84Zv
         BWIJVAwC1ZWsu13hTZBvlfH+ycCtDV8ZVX/omp9EB1dn+a+mJyamarn3VVuSh3AF9xTT
         w+Iw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ce6jyDHt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c184si13501765ybf.140.2020.10.12.08.47.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Oct 2020 08:47:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ce6jyDHt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kS02w-0006Y2-Nq
	for alex.bennee@linaro.org; Mon, 12 Oct 2020 11:47:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kRzqW-00077x-9U
 for qemu-arm@nongnu.org; Mon, 12 Oct 2020 11:34:45 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:38394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kRzqM-0007Ko-L6
 for qemu-arm@nongnu.org; Mon, 12 Oct 2020 11:34:43 -0400
Received: by mail-wr1-x442.google.com with SMTP id n18so19693747wrs.5
 for <qemu-arm@nongnu.org>; Mon, 12 Oct 2020 08:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZygS7xMaq3Qs9CSNEUUqz2guLfBsLuHXGM1Pvcfwirc=;
 b=Ce6jyDHtzvLloLLAKvO7z15Q8cvs5dLx3C5wEefPUHUSvaYDZBoby/x/vpPfTFQNRI
 riTzK3LrhaxOTWpS9ceCHfs/ICXOMHmZttSXgcayy1GhjUdrVxrKNpyrmLa3AwoOYbcA
 0hHlzHDpKkVDGylDCaVNBuZbWnnIaS3kYQuT6S/br+nKxo3t+A+ibSYTPOQcYQZGfmC3
 SodEGb087qo8RpMeSMlUAOAKmgGkuKHPB3L2msboL64UNBMzl9ikSoZp+T6LSVynmYcJ
 7VpOlqJpNxIfngl+FC62CFEEuO9IU9XGbhxFUEYwMhQok73o/guDFTDAGvwnK4EIweeC
 WE5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZygS7xMaq3Qs9CSNEUUqz2guLfBsLuHXGM1Pvcfwirc=;
 b=L7gu5ZHv0wPezecHF7f/dt9vxkPfwrVvUoIjqM19/ZF2yCWQ0dlhqqyhnucOPPZn6Z
 lMrfiVMjI6YsDUhtbOWlrMN1mOVIIQA0c+lRSl58SyjuZNTLW6HxwftiHASXyvzD/ksH
 XhS/b9GmCLiyhXM7TYRbasRUs1Y+EmzRn1O2ZjyxavdMEjnKCw2JfLPEL5+RAP8s/wJi
 2AWMYz6ACkf2bvy7s6k0/e1N6zlf1pFH2bgr4N83K1pr8jd00Usj05QsVsSb7aLnZXEZ
 WmlLvjPy/n6tyA1GDZb/gHOpsmhA07uuwB8vuhiUxcD4U/q1+fUPMbNS/v3sNOYORYhA
 5LKA==
X-Gm-Message-State: AOAM533H0R5vwR84w3me9I85PinPzWO0weuy66TBia7FyKeKzen3g5s6
 I/l8GSPFWmGkq9iPN5+TAPw6NM+HSNeiQdpt
X-Received: by 2002:a5d:5609:: with SMTP id l9mr27989065wrv.140.1602516873142; 
 Mon, 12 Oct 2020 08:34:33 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y10sm19675284wrq.73.2020.10.12.08.34.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 08:34:32 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] hw/virtio/virtio-iommu-pci.c: Fix typo in error message
Date: Mon, 12 Oct 2020 16:33:43 +0100
Message-Id: <20201012153408.9747-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201012153408.9747-1-peter.maydell@linaro.org>
References: <20201012153408.9747-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7koPo8KIrSvx

Fix a typo in an error message in virtio_iommu_pci_realize():
"Check you machine" should be "Check your machine".

Reported-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/virtio/virtio-iommu-pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/virtio/virtio-iommu-pci.c b/hw/virtio/virtio-iommu-pci.c
index 632533abaf7..32e3215d1df 100644
--- a/hw/virtio/virtio-iommu-pci.c
+++ b/hw/virtio/virtio-iommu-pci.c
@@ -48,7 +48,7 @@ static void virtio_iommu_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
                    "%s machine fails to create iommu-map device tree bindings",
                    mc->name);
         error_append_hint(errp,
-                          "Check you machine implements a hotplug handler "
+                          "Check your machine implements a hotplug handler "
                           "for the virtio-iommu-pci device\n");
         error_append_hint(errp, "Check the guest is booted without FW or with "
                           "-no-acpi\n");
-- 
2.20.1

