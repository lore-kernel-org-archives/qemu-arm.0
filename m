Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp431437njb;
        Thu, 8 May 2025 06:44:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVB/g0UuhHf4kjgGFvbclUcLUULN5TbP0vPE4/1tntJGFllyMebYtFfUxOb/xMaIIusIT5/t+0woUEWfw==@linaro.org
X-Google-Smtp-Source: AGHT+IEc6sgMe5YVHMFudk61JRanJ7prpFDIo2cNri08JNWXHI4uIqs5ljNEMjZiIRRiBHJZcXbn
X-Received: by 2002:a05:620a:1a18:b0:7c5:54d7:d744 with SMTP id af79cd13be357-7caf73a1e7cmr1125110385a.23.1746711870027;
        Thu, 08 May 2025 06:44:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746711870; cv=none;
        d=google.com; s=arc-20240605;
        b=BSgG7w7JOXgAWO/EK2lo10h6QDGO/FcmqweY27AVP/z9JM2E+gO8n29LD9Kj2VjQFR
         SFFm6UUgtItsIifpUBypBcnu+G3wkL1daZEXDOc9BhfJY82CEuO53onMEGXOKVQzmaoP
         DE1x3qVe9rKt0TK7blhsDqgoLg9jb45jW8ADw1rxG9p4cc/3knjh7FrrF9Jblyty5xDq
         7udXEBIyxjCL4Zm27jFcBuyN2EFkm+iWp+2jGQR9MwaONSLdTGCmh//VCc6zJCdRtnjM
         WxSVrs7BDtbiTo6aSd+lXMPc+5/AY3qcW40aTzZ88zsTvD0eM4msWAYA+dmj3OIf/EGA
         R5yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=gMLC32cD5rQa4ngqh9n69biVbtvyYihadQEH/qk7LQg=;
        fh=6K112e27pDPCGR1yRJf+G1XQ/QrxW2fcNvYMHnRnj20=;
        b=Elqk8qGvzpUbVyPGrmi3lwBnwTDcGlLN6pXu1qEZWDANmAgtuXXSbTNVnvLCHHHO6t
         /8mBYbxCP3huSt2WhMnyRAoFjsWclOdGgkPs1qckA/QbXDxaqNEQpbQfkZ30zScJP5Zt
         ETtcMlRFVCdnnKpTUo5Hi8Fetlq1KrZwj8XvNROZD88xBYHf2Q8cLTmbsE/EItGja1Sa
         Fy87tlGGFF4GKajjCD0/EokLwF+P+EytbwBssB2z0973IVBJzM0FTPgmBc/lz2HWuKb5
         OA1RDIMbKg41ibktzIC4CKcRtnyb4QSBRQEQ1LkijWh/m1Q1K1HtcO7E4ALHQwcz3Mbx
         hIaw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dTWvQ8bj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7caf759511bsi439967585a.209.2025.05.08.06.44.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 May 2025 06:44:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dTWvQ8bj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uD1Xw-0000fu-Om; Thu, 08 May 2025 09:44:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uD1Xu-0000XC-Oh
 for qemu-arm@nongnu.org; Thu, 08 May 2025 09:44:18 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uD1Xs-0004wv-U0
 for qemu-arm@nongnu.org; Thu, 08 May 2025 09:44:18 -0400
Received: by mail-pg1-x52d.google.com with SMTP id
 41be03b00d2f7-b1fd59851baso602149a12.0
 for <qemu-arm@nongnu.org>; Thu, 08 May 2025 06:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746711855; x=1747316655; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gMLC32cD5rQa4ngqh9n69biVbtvyYihadQEH/qk7LQg=;
 b=dTWvQ8bjrLumrHb0Cg/sgd0tPT7FLfbCLx5UwPeoOKUxxcgM6Zg0hVNtW2fj61CmMh
 Pt4aMkvbBJ/DzW5apd3hv5W6yTmUe7bw+JTMutNIgXxTCyusKWjwR1u8L8zA48dJP7aH
 +IPK04VXLkQzBv5l50a/ue/CwL398lkL7EjEXgh8zQukJSwcylfbUld/42kpbzhgtmX4
 tZ3PHvyQTJWL4EFuHPfoVv8bWTowfb3ixt6QCLqHhZMKFr4WSXbWl5fCc7fXlidLlRXA
 jrGQNKfQUsmIgDeh9uvseMR+l6N1dzwQrlY8wxX6EDeuw7DSIDgCxpUxSfCTA9zQOBRa
 FnJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746711855; x=1747316655;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gMLC32cD5rQa4ngqh9n69biVbtvyYihadQEH/qk7LQg=;
 b=Sa+iAEUb/b0b4tRgZuF2CueOwmzaisKF6Y+N5hsgPH06PGS+fH6U6Al6Z2RexbCHNS
 QdutHCJYun7lz6k/cOCzKsl9BlxM00tAPLt1A3xlDZrv+u5LeCKgAyGBCVrt4+yinu0q
 q7QzcrZ8XtIDdgBj8GotfSy6cxko7W7SF4G2U7az9+wGbgetnOOXMut8Djl4UY9zj8lu
 QlTDy5TnAE7nEEHA13FHZ/picbO/xPDB4fepMJZJnvPsfDqRXrY3MTeLv+eFZBB2mUJe
 4cXubUWWwGk7dv6Q1BoOTHsqkgzBuv0BNI4carXdTQrxUBtIVFPnNCjF9iXsz8LvL5/N
 6mcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzqnZwrQao1T7mn7DXGo9gALC6LwI2qUYMnV8EDuaenv5WyA947S1Kcb1akesNi3ojR3KatUpUdQ==@nongnu.org
X-Gm-Message-State: AOJu0Yy7x+OtR7qEBShdbtrm1yeeTlv6ryq4xo+8bsGKO3CXMHkwvqsR
 5UN6XQ4sMgXBhF/5Np5sA47fjHDhtPke8JJBh+Nmn5hYwhwjwYe7yiVFGPA9wVo=
X-Gm-Gg: ASbGncu1CoL20zosVLnpDkVW7/3566NlAC6mZCzCwtGOOTUzH8fpYhmy5GV+5bfAS3f
 zE6lxMcKkEYssuF1PizfXtibvnXcay6bHB0ppixhPrV5Dun87ADJnkkK+pQDnTEi7kmuIO6ULsu
 3VxNfjMNaFX2OAn+wmuaTidxqUWVYbrxG1/ewdKEJC455TmBx14uBputqHJNgQys8ZDRcGqK4Xb
 TFImcuJSIgb1rqbg6T5PQP+xhksNHiRbKefxFJnCGIXAyG2Q+iMtWhmudOLg+Q2DReMMdPCdLF9
 PHryExiwn4VC0qbebrEwmtLLSt1iH1/7BYmEcTsC5NhjttP/TIzvqqby7MoXU+lbN4ODhQdD93i
 Vo6M6L4egR4HuZ24=
X-Received: by 2002:a05:6a21:6e41:b0:1f5:852a:dd81 with SMTP id
 adf61e73a8af0-2148d52bbe3mr13246245637.34.1746711854843; 
 Thu, 08 May 2025 06:44:14 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74058df2a6csm13272789b3a.81.2025.05.08.06.44.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 08 May 2025 06:44:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, kvm@vger.kernel.org,
 Sergio Lopez <slp@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Yi Liu <yi.l.liu@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-riscv@nongnu.org,
 Weiwei Li <liwei1518@gmail.com>, Amit Shah <amit@kernel.org>,
 Zhao Liu <zhao1.liu@intel.com>, Yanan Wang <wangyanan55@huawei.com>,
 Helge Deller <deller@gmx.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Ani Sinha <anisinha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?q?Cl=C3=A9ment=20Mathieu--Drif?= <clement.mathieu--drif@eviden.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>
Subject: [PATCH v4 22/27] hw/core/machine: Remove hw_compat_2_7[] array
Date: Thu,  8 May 2025 15:35:45 +0200
Message-ID: <20250508133550.81391-23-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250508133550.81391-1-philmd@linaro.org>
References: <20250508133550.81391-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=philmd@linaro.org; helo=mail-pg1-x52d.google.com
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
X-TUID: 2eAL4+uTF2XS

The hw_compat_2_7[] array was only used by the pc-q35-2.7 and
pc-i440fx-2.7 machines, which got removed. Remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
---
 include/hw/boards.h | 3 ---
 hw/core/machine.c   | 9 ---------
 2 files changed, 12 deletions(-)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index a881db8e7d6..77707c4376a 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -838,7 +838,4 @@ extern const size_t hw_compat_2_9_len;
 extern GlobalProperty hw_compat_2_8[];
 extern const size_t hw_compat_2_8_len;
 
-extern GlobalProperty hw_compat_2_7[];
-extern const size_t hw_compat_2_7_len;
-
 #endif
diff --git a/hw/core/machine.c b/hw/core/machine.c
index ce98820f277..bde19a2ff67 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -266,15 +266,6 @@ GlobalProperty hw_compat_2_8[] = {
 };
 const size_t hw_compat_2_8_len = G_N_ELEMENTS(hw_compat_2_8);
 
-GlobalProperty hw_compat_2_7[] = {
-    { "virtio-pci", "page-per-vq", "on" },
-    { "virtio-serial-device", "emergency-write", "off" },
-    { "ioapic", "version", "0x11" },
-    { "intel-iommu", "x-buggy-eim", "true" },
-    { "virtio-pci", "x-ignore-backend-features", "on" },
-};
-const size_t hw_compat_2_7_len = G_N_ELEMENTS(hw_compat_2_7);
-
 MachineState *current_machine;
 
 static char *machine_get_kernel(Object *obj, Error **errp)
-- 
2.47.1

