Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp699254njc;
        Tue, 25 Jun 2024 08:10:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWHQ0QNtsSwuyjFooVA6H6SEOglISwZKKwL9jEKxIwCfY/gkZt+/spktcU4OccC8Yd5CvVgBtAufTYHq0iqLEi8++L66JfK
X-Google-Smtp-Source: AGHT+IHXYdzh08qaYti8VlbIw8tPXLvenqlhiuRHR1cboyO4WobJGpZlXJKAgLmRro0ciPRF737y
X-Received: by 2002:a05:6808:1a1e:b0:3d5:1bd8:ab17 with SMTP id 5614622812f47-3d5459b4aa5mr9580275b6e.27.1719328215435;
        Tue, 25 Jun 2024 08:10:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719328215; cv=none;
        d=google.com; s=arc-20160816;
        b=ZnEpIOjBglWpVmzLtBVd1FJrz/62eVZ7Q89WFC4ZBVFuILW2j3QFPWKukpJrC8B1OO
         omiY0sVZquU1TAP71re+vncji0eZWGFE8oE+/g7HulJnlB+MplpT/CRXASymELExp2sl
         AmxUcLvtvHLly5hP6m2f7V2P4e+SB4niP5E35/pQUEaczB9V6aEzPqdcS+hiw7UHMbQI
         E1XeXeZqwFbnpgPEqAj6K+erKZ7Iuu7WT7UnxPsmCvP4JD9wA/bSNv3HtNw3KGhAPfJR
         kLYCfNNmROPhkFDbr50EalOv6lkD2amcmzaulaEBadSpDoMw6aVc3+S2+bf9zHz0PcYE
         3Tqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=TlnNdGhu04ossposrlJzR1bD3NKaX/zo3I7lspvtgbQ=;
        fh=/u5zJSmHDGKS77GEFhMC7YUUQe7hNPlXha/BlXshkFY=;
        b=RyZAiOsqich2FKMRY7rgyVxfgtMBPmDpPT7bTxoAEwQ/01ufp/uweVNkrw89JCmIMr
         CT8PHoqLtRsfIfRfHrIEFHlYuaZko6J/V3cBI0CdGS4r7G4aXdjnPLwX+Cgi/q2Lxd1P
         bzRILgf99X6U4dRHizm3MvCo+qzfjoTMh0nshPnepKAaeDfHflMP5ULQmvp87RcmeD67
         qm52WjhglspnGwE+I04jSiLtYtYWN7wTM2DgplvyyGO55Is/KW17V22KnmEcl0K0qQww
         dyW9JJg4dliLD8NjptgzuI2EZLRp4wpz/dCu2b6gB8718ySzZKiB1MofEGSJ3w+SpmXx
         YEYA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=k+euOehw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-4ef64a27575si1049874e0c.133.2024.06.25.08.10.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jun 2024 08:10:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=k+euOehw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sM7n3-0001Db-7V; Tue, 25 Jun 2024 11:09:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sM7n1-0001Ca-6L
 for qemu-arm@nongnu.org; Tue, 25 Jun 2024 11:08:59 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sM7my-0006PX-Jd
 for qemu-arm@nongnu.org; Tue, 25 Jun 2024 11:08:58 -0400
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-70679845d69so1899167b3a.1
 for <qemu-arm@nongnu.org>; Tue, 25 Jun 2024 08:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1719328135; x=1719932935; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TlnNdGhu04ossposrlJzR1bD3NKaX/zo3I7lspvtgbQ=;
 b=k+euOehwtAsnCIXdp+q1irZu49z1Z5GVos5dpwHH+ORDa34pNDHnfe0C5lnspYeRV3
 PluWG2uAaytIyrI4WMx0u+z/LkM4eMA4bncPrRR22yUy67EoVb7HwA+I1eXWRjL6kl/i
 5WGVycZcQQ5HIz498vJHX0MEcBiWilpp8HlfhkcRA45Y0xs5KQkv9K8vzaK8Dnu+uZG/
 S574oY9K2oYVDN5dh7qcq8FwpfKIBhr/2niCkpjs2MEWffZ2EmYjRzvybbIV+IxSjDR1
 aW3Yt5fLHezBTq2Y7qvuRnrJgRewqKZVGxewh7xiuK6g0p+664Ysfp1Lu7JT5WsS3qyc
 rJxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719328135; x=1719932935;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TlnNdGhu04ossposrlJzR1bD3NKaX/zo3I7lspvtgbQ=;
 b=FyiBZszr7yYjgyF+PfUc8h3WI6DJ8XoXoMhSeJmXgBw8FIWaHXFxHKaivRrwkLlUAZ
 WcgKzvI7QdMGfTqs5eshdYh/B2iyBxvqDc+tv/uf80NVkrK7Bet+CNCzXWYWThAG1F2e
 y5sBp6P6FRORD77J4WK4wPddW9vIhSpWm1YJYw/TEaJiNp1wxFIL6JHIYH31x0k6zW2Z
 igK1tEk0U9svlU9uOsGilhjFwRMTF1TiGIs9X3KMH4PHemZTHyo/zjXBFZcX+mN8L4wu
 P2qsoPIhwM4gieI1ywjvev7UQMK3MgKBjwsavkGhk/Vc0lUeIqp+NOxTYEtkQXNE9iV1
 JozQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWI+lml6Vo6MscWtVNpBi7WKyhMv8zc6of6VqWaDrEaHEAZuQ3ZmXZ54q0l+ZKC3YF5aQSdAn35UrI/DDGcur2DFfl3
X-Gm-Message-State: AOJu0Yy81gRCWUO9KvQdH4QVWRSHSoOji5kldtcnlOqcXhSxt8YcxWX7
 HRwlCMgA35BvFwQ31h55pnDW8UOnXeTeurUaQcH5m6n8bhQMdpzg5dhKKLGujgs=
X-Received: by 2002:a05:6a00:4fcd:b0:706:8066:5cd8 with SMTP id
 d2e1a72fcca58-70680665dc3mr7938064b3a.11.1719328134781; 
 Tue, 25 Jun 2024 08:08:54 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.187.237])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70681722219sm4142636b3a.73.2024.06.25.08.08.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 08:08:53 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Sia Jee Heng <jeeheng.sia@starfivetech.com>,
 Alistair Francis <alistair23@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Sunil V L <sunilvl@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v4 01/16] hw/riscv/virt.c: Make block devices default to virtio
Date: Tue, 25 Jun 2024 20:38:24 +0530
Message-Id: <20240625150839.1358279-2-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240625150839.1358279-1-sunilvl@ventanamicro.com>
References: <20240625150839.1358279-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pf1-x429.google.com
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
X-TUID: 1gTAkfRX6LWR

RISC-V virt is currently missing default type for block devices. Without
this being set, proper backend is not created when option like -cdrom
is used. So, make the virt board's default block device type be
IF_VIRTIO similar to other architectures.

We also need to set no_cdrom to avoid getting a default cdrom device.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/virt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 5676d66d12..e578c6dba7 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1746,6 +1746,8 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     mc->init = virt_machine_init;
     mc->max_cpus = VIRT_CPUS_MAX;
     mc->default_cpu_type = TYPE_RISCV_CPU_BASE;
+    mc->block_default_type = IF_VIRTIO;
+    mc->no_cdrom = 1;
     mc->pci_allow_0_address = true;
     mc->possible_cpu_arch_ids = riscv_numa_possible_cpu_arch_ids;
     mc->cpu_index_to_instance_props = riscv_numa_cpu_index_to_props;
-- 
2.40.1

