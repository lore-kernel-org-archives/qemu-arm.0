Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp1361502ejb;
        Fri, 20 Oct 2023 09:39:04 -0700 (PDT)
X-Received: by 2002:a17:907:60d5:b0:9ae:7502:7d30 with SMTP id hv21-20020a17090760d500b009ae75027d30mr1745445ejc.57.1697819943875;
        Fri, 20 Oct 2023 09:39:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697819943; cv=none;
        d=google.com; s=arc-20160816;
        b=UeOJcagkeS1lJfKAL1X2vTtNM+KYjHR+0qjI9BlSrIPHuoCtm6Lvf7soj0nw1Gs9d7
         usDvuYsTmbCDLAgx0oqUkalj0SZoX6SsSl/YYEo+DdYPChXvygRXMy195KKWh/4eJuSY
         I7cKuVOUX97lwPp8InmYBbl/+g3pubNsv0fZ0sOEv2JYHOBpkYOkZTTV7wBVCEiSLSQh
         hV+j/aumJ5fo6i45/WyunFishF/YUCPCCa50biP16hpCYQJcJkMyfo0Sv1cnR8vaSw6j
         N8BN4hTSpdaKGSq1tCtCFkjX5JNMVc34NR4W86ZtMwlRlPq/ENotlTcwCdX1n14fmVYf
         PzkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=DwpnvxLwaI95t3fo0bAhEO0dcxZPMEfx1RWmGk2WvB8=;
        fh=gUlLUWkIPL0onzCD3xYUadRbfkDHrqUfxzqZ6cOQM4s=;
        b=qsBhnHh9vmD/9i6/25AGEXmVDh4Pw7MlumGFsgvs1GjgDGSEXvjLMDjisSaDps6aL5
         rDa3S64wlP33v349gAhkt0EzxRI4Ta7irxv1NgMA/5rKoaQKVnxMGRmS0OAA1lK6KgSV
         rB1JnY6xa2oe4GmXJh8Zh7QC89UKzGhVzF7WSgp8+QU+bmvgdPZpJNz7R4CcZnS+byV3
         lqoPHmKn8Yz3Z63R5AjgjzXy4r7G3qg33w5CvuS9JPaXRrpZEBGP5Btw0QyZ9+2pZj5Y
         Sw2YEwpf5q3lzSJNUV2r5geQAWFcvo5BMgzlfr2HTw/CcovXRksg/HCuMCqySKnGIIcG
         m2NA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="mqa/vfp4";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id og47-20020a1709071def00b009b2b64c06a9sor699443ejc.3.2023.10.20.09.39.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 20 Oct 2023 09:39:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="mqa/vfp4";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697819943; x=1698424743; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DwpnvxLwaI95t3fo0bAhEO0dcxZPMEfx1RWmGk2WvB8=;
        b=mqa/vfp4w11U6RWJrB7pujiuSDOfPoWPCCJ19EaO+J03z3AVUvzVz3Ncc2cAc9clK0
         UKAWNIlSlaKat/5mBvhbXWfmkhG7GqBgB8KqAFEoSwhqG6Xf7w3Woc5M3vNCh/ToN4L6
         K/sl96RR+8FPErKQZKTFVhWztaezMnL6IHtQmlnoyW5O5kX0eiAUhtkXOoIVBJRoXTC6
         g1ahPWVv4a161XYd/OSyS91QPyEFsr2i8N2vUMbOrZPJkfp47Chozyc1BdEDaKvHS8Dt
         7QicO2ZAJLqZbddOU0inAfqa4xwUCGTnFuwfT1DsUtnrj/MKRKwVkbd1G9rspTDtlq/Z
         t0fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697819943; x=1698424743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DwpnvxLwaI95t3fo0bAhEO0dcxZPMEfx1RWmGk2WvB8=;
        b=izpOk54iOmOTT/FXc/X/PE/nFKBSwAj/iYdV5NhUT/2e46GELStx/UKH/z/LM4Q8Jv
         sLsjluW/XRJta8bdoPEc9TqxBPXO1yn7JoMCUm+TzNo8vZ3G0crmcdtBQhEb+r2hf86t
         Hd4h6Bi4XIRU8eiOziaqXV9t3BTDMyiy5XJd3+6Dl7Y/+PTEBsrbq/1uVaIGUEtOcJaS
         4szGagXTu2+NwtaSa13rafVYaT79RBRURBfeyE8Gb+QrBQuW+gHzH/+vG00IY3lNz5RK
         /8VF0qFgkKYh02zkkYhhHHAxC7fQZvtYz67JW3X09iDK/LFpiUPu7fmdTjMKM0Om9FU7
         LB4Q==
X-Gm-Message-State: AOJu0YydCWnLkNlDsDW8LtOvxjDcXhgbH/FFN2bv/DAEqectcawWF5t5
	kzoYNrnWRDBcEy2/Ec0Ot3+k/AKP
X-Google-Smtp-Source: AGHT+IExBZusHKFknVzBT00DgnJ+sQMCFL/rUyxfIHrHrCZVWnyLQwtly/bAYRyP1CNICc3Jx8Qc4w==
X-Received: by 2002:a17:907:80e:b0:9b2:aa2f:ab69 with SMTP id wv14-20020a170907080e00b009b2aa2fab69mr1819995ejb.30.1697819943414;
        Fri, 20 Oct 2023 09:39:03 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (tbo33-h01-176-171-212-97.dsl.sta.abo.bbox.fr. [176.171.212.97])
        by smtp.gmail.com with ESMTPSA id 16-20020a170906019000b009b2c9476726sm1819672ejb.21.2023.10.20.09.39.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Oct 2023 09:39:03 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	qemu-ppc@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	qemu-s390x@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>
Subject: [PATCH 18/19] cpus: Replace first_cpu by qemu_get_cpu(0, TYPE_RX_CPU)
Date: Fri, 20 Oct 2023 18:36:40 +0200
Message-ID: <20231020163643.86105-19-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231020163643.86105-1-philmd@linaro.org>
References: <20231020163643.86105-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 7roPRug5lLdV

Mechanical change using the following coccinelle script:

  @@ @@
  -   first_cpu
  +   qemu_get_cpu(0, TYPE_RX_CPU)

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/rx/rx-gdbsim.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/rx/rx-gdbsim.c b/hw/rx/rx-gdbsim.c
index 47c17026c7..091f83cc60 100644
--- a/hw/rx/rx-gdbsim.c
+++ b/hw/rx/rx-gdbsim.c
@@ -126,7 +126,7 @@ static void rx_gdbsim_init(MachineState *machine)
          * the latter half of the SDRAM space.
          */
         kernel_offset = machine->ram_size / 2;
-        rx_load_image(RX_CPU(first_cpu), kernel_filename,
+        rx_load_image(RX_CPU(qemu_get_cpu(0, TYPE_RX_CPU)), kernel_filename,
                       SDRAM_BASE + kernel_offset, kernel_offset);
         if (dtb_filename) {
             ram_addr_t dtb_offset;
@@ -152,7 +152,7 @@ static void rx_gdbsim_init(MachineState *machine)
             qemu_register_reset_nosnapshotload(qemu_fdt_randomize_seeds,
                                 rom_ptr(SDRAM_BASE + dtb_offset, dtb_size));
             /* Set dtb address to R1 */
-            RX_CPU(first_cpu)->env.regs[1] = SDRAM_BASE + dtb_offset;
+            RX_CPU(qemu_get_cpu(0, TYPE_RX_CPU))->env.regs[1] = SDRAM_BASE + dtb_offset;
         }
     }
 }
-- 
2.41.0
