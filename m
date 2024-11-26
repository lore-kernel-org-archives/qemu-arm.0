Received: by 2002:a17:505:4c56:b0:1be9:327d:8ee3 with SMTP id do22csp1937138njc;
        Tue, 26 Nov 2024 03:26:46 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUmqIxjLgOhxgQEDkQfDMBEuRECeC+nDFMTZkdJx2M1m/6UDtKybe9R4w3qpvV2Y1EKO3viEcKU3rFz1g==@linaro.org
X-Google-Smtp-Source: AGHT+IFwrAjPLMUKh26eroNaRLKuH5PhyUu4xJQh0GjH2a10ZduYxyQ0G/UNV2jYhl+HXd5ZXCKA
X-Received: by 2002:a05:6902:2b93:b0:e33:2220:27fa with SMTP id 3f1490d57ef6-e38f8aceafamr11261488276.9.1732620406190;
        Tue, 26 Nov 2024 03:26:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732620406; cv=none;
        d=google.com; s=arc-20240605;
        b=WY4s0aSBURHX+294wqEoP3bPCwSkYq0L+PtNcqaiUkapR9q7iERz/5wioEn9X8NN88
         K04XJSyEfHQntFWDt+DHx3QX/sd3HXipUT1Oei7FrKtudRnFnDHC+X6y6/xFYAEyJBpn
         Iak4w0tpfcZNCzKW2/JcgPiPQvAOdgaN5UGCdT6GJeJVxlrlBr8+dni5EHwdJloLFYs5
         a5d9b+R0pBd+YHYIBJC/ZrftN7ihBAkOr/ofpHzvJxALgLBJ1YucKaJ4dSWHMyjGMvoF
         b9Ob/+3eCuylTO97BUFxmA4j0ArltdYHBklKmA+X6McTTLaVR1MziJl+8uHiRQCt5kDm
         To0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=P0iDFiy4g206+uiI3tz8kmnBegTpSA+b+66gFGs5ekU=;
        fh=h+il+46I9EwaFCyXWLROSS1UtlWi4vjk6RmXQ3UlfQU=;
        b=QVOVTfkd5lO0v4paRqO0uE3kkk8JnC/sbG9Tmv/G2BpVT9rBoN+DVVtK/KTEKASx1L
         HhvM1OPIh4Ceum05cyVCZxsZnaGaf3XqpZ94uNf62tXbldxekAR1x6pDGNcSb3jqJhcW
         5BSnJEydOR68LG8uU9TtHVyjioB7uLwalIuJoCisvtu9v8fPd0oTfsxPGPYQAH+cUo/A
         m9NUsS6cay61fcIRB8WMNsXEvN/w2JTZwULYOYsj66n9wjpZvw3koigWjQ6ioPvmqkrh
         nzSZFL1O46yrGyoUpuqcdoCy6u3jB9WU2PMjNifqfnyeAUNWJ/Wa/5diD5SZw5nHj47H
         6uFQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xMNe6qCs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4669891c0d4si36901351cf.491.2024.11.26.03.26.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Nov 2024 03:26:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xMNe6qCs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tFtgh-00084J-Eg; Tue, 26 Nov 2024 06:24:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tFtfk-0004kC-7R
 for qemu-arm@nongnu.org; Tue, 26 Nov 2024 06:24:01 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tFtfh-00031N-JC
 for qemu-arm@nongnu.org; Tue, 26 Nov 2024 06:23:59 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43494a20379so23233315e9.0
 for <qemu-arm@nongnu.org>; Tue, 26 Nov 2024 03:23:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732620236; x=1733225036; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P0iDFiy4g206+uiI3tz8kmnBegTpSA+b+66gFGs5ekU=;
 b=xMNe6qCssTdvInzhR/rWRpAKzc4TYxKSKdMEHWwPrU2iE40rqgBcSEJlsTBc5AxlMO
 4Kn5qmdYpj0mbq0pbZmavVwYbreK9DWWaE26bkkCtkCJRDPx0763nz6yejg3750uxQPj
 aHhk1FNsvMyaMgVYT3yeCIGeMmfgV5rEvceNsDJ0kSjndjJSTziqQB9jq9kCWYjIW3uw
 3IkU/zTylI6qmITcNzqmy9lJSbmYrSOgO4iQp05k9Um+IZOysMowECSq1jDNDg7noiSc
 /YNrE8TykBCbWERq2fLxvWiTS19s5SdArGyiQ7JTtAZYZUOZkZvpYDDj+t5XX/I2s1Ze
 BXow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732620236; x=1733225036;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P0iDFiy4g206+uiI3tz8kmnBegTpSA+b+66gFGs5ekU=;
 b=aaNmctUn1U2cE7ifQnlQpg69oHrT1nsuBfW8HLLpaK/IArI7Ltn8HJ1mDnsZHI/0uX
 8uh5wAAhJ3a8/XoLM91ZXsoflmYz+d3S9UWomNtVOHuy6z03/VKk/5HwsACxRKIyvJjO
 54dcMHjtHbzXeZB3OCREtV7XLuthn4gPG0ry69lon7Olrjadnsr98I0XKIKEfNHNbcdF
 xLgol+bn9cZe465ZcIyvtxflURi7uAKsFkVMWzQMNnC4fBbMYdFJPGdjIxAeoqisTXsi
 NTCDuTFewb1B3emqAIvYsTBxvbqsaN3dmsbqJeEfLyh6j/wWBasN1Gli/VIc1/orNgol
 3Tdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNHeCzu7fmO2xJWFyxglLlxZA28E1DFXTSFt2DF1gjMNr+w/DE45vPcc306NAoflqTUOsdZHki6w==@nongnu.org
X-Gm-Message-State: AOJu0YyNX6uLyYkJ1kBho5W9qzqQ9F3C7KKfzn4uvGfs9LWolhqAFxIU
 uKg7pPEviiIzpPZ7CYJ/9B6NwZwt8zv7ns6J7o7JyAFxpcN+VTJD1ozN7zPzvtM=
X-Gm-Gg: ASbGncvnktvgFkwP3enw1B72B5t8zNiE40Vu5HzGtw8N6xMmGehCV9mYvUROvGoS94g
 uyhgTMHeBu1kvkgzLBN5e/pY2pAiU3iD9TbpD7NwVFJk7LPcXrXB35cwzvUMeNaGQC8Xz7e0P9w
 wr29U9pgp/LIlXCaLL45XP9SBlW77cu9s/kexeOgnuiGXsQWVRY0JFBN6aumPP7thkeU7uMmkD5
 hZvQA+U2zO2PPcg6+k+sO3AbK4dCVWFNgOST2VeFi1GOD2ALarmnVDAPoDj3pcCLHk/fqMX
X-Received: by 2002:a05:600c:4683:b0:42f:7e87:3438 with SMTP id
 5b1f17b1804b1-433ce39e773mr149650775e9.0.1732620236161; 
 Tue, 26 Nov 2024 03:23:56 -0800 (PST)
Received: from localhost.localdomain ([176.176.143.205])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4349eeb375fsm75702535e9.3.2024.11.26.03.23.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 26 Nov 2024 03:23:55 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-riscv@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-10.0 v2 12/13] hw/riscv/virt: Create GPEX host bridge
 without refuse-bar-at-addr-0
Date: Tue, 26 Nov 2024 12:22:11 +0100
Message-ID: <20241126112212.64524-13-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241126112212.64524-1-philmd@linaro.org>
References: <20241126112212.64524-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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
X-TUID: vp9i6XePYqC4

RISCV virt machine set MachineClass::pci_allow_0_address
(see commit acead54c78 "riscv: virt: Allow PCI address 0"),
directly create the GPEX host bridge using the default
'false' value of the "refuse-bar-at-addr-0" property.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/riscv/virt.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 8999fc348cb..b28edb9ffd5 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1158,8 +1158,6 @@ static inline DeviceState *gpex_pcie_init(MemoryRegion *sys_mem,
                             pio_base, NULL);
     object_property_set_int(OBJECT(GPEX_HOST(dev)), PCI_HOST_PIO_SIZE,
                             pio_size, NULL);
-    object_property_set_bool(OBJECT(dev), "refuse-bar-at-addr-0",
-                             true, &error_fatal);
 
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
@@ -1807,7 +1805,6 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     mc->default_cpu_type = TYPE_RISCV_CPU_BASE;
     mc->block_default_type = IF_VIRTIO;
     mc->no_cdrom = 1;
-    mc->pci_allow_0_address = true;
     mc->possible_cpu_arch_ids = riscv_numa_possible_cpu_arch_ids;
     mc->cpu_index_to_instance_props = riscv_numa_cpu_index_to_props;
     mc->get_default_cpu_node_id = riscv_numa_get_default_cpu_node_id;
-- 
2.45.2

