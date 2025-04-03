Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp4185209njd;
        Thu, 3 Apr 2025 08:19:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXfMRtoTrMFexkgrDrcQPDrsXBEzFeH2AjBCHpmEer5OVz4FkXXS/ETzGRnKnwwfE2fk/Mz4r1uFtccGA==@linaro.org
X-Received: by 2002:a05:600c:3c9e:b0:43c:f689:dd with SMTP id 5b1f17b1804b1-43ec1405904mr29914795e9.19.1743693546447;
        Thu, 03 Apr 2025 08:19:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743693546; cv=none;
        d=google.com; s=arc-20240605;
        b=BLaOQTDNT8N47hRmXJ9WAnTHIW1hFmQiKq7w/eIpYiMEQoJyCvHBbzHLWchVuAsSXd
         oCc/slnDy37hP3bcEm+wzLIEtt8E3AJKxHI+QxEH7IEsx+vq1TJ6So13pJWua91c96hr
         u9RSABCvlyK87Fwt9t2dQf0FJP5gpv2QaRwiIRaEbTgGY15PKHxd56z+G7OqIoiVD83/
         rbm0Kz18h7MUjW6oiVEVxU96+Xym6cIwctLGewZio50i6IFaHoKUz6GdR5XdNb9J6obI
         m+ro9uTiY4yOaP/PSiFfVy95M5wQevDxflxSMamECO+W89gb+Ajsl4TgN697iwPzvj4r
         P9Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=tqcs/vjgWLBfW1Dulxq85k2YfPnbkRu1MyFMZFId7I0=;
        fh=Fr9vsAQK/QhIIkhPzQ9AKBX99Sw6+Vczf6M3x59BKR0=;
        b=MPT9Po0nBmqTYD6g0GUEUvOQIl6eVD/UWeqNFHGec90qM2c6UCHhdJpXnvKxoVcpFU
         qimVAnbbJ602w6/6CywERQu/TpPZfI0j4Q2aN4aqwcC9rclp1McZLusUztYpkxDzcwVi
         LxfKiu3IrJQBoWHPN3INRMUNVNvMXImmZAzFtS+3tcx+kyzrQTPqMfUhChAuDvqb30yF
         OXhovkq1fUcRzp1Sa2Sru9eMdaef3mkUduM6Gymd1TifAUtj0+LXZhncVBHW6iGBlGKv
         sQJui9RZF9JXmf9skaHqFUqhE9bjzurGImGQM0PamG/vDVhFpKwaUJgD0csVioYHMUZN
         +rIg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AP2HOqyF;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-39c2fe98c78sor568197f8f.0.2025.04.03.08.19.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 03 Apr 2025 08:19:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AP2HOqyF;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743693546; x=1744298346; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tqcs/vjgWLBfW1Dulxq85k2YfPnbkRu1MyFMZFId7I0=;
        b=AP2HOqyFVM2szh8+nHlrar1RyuvWur73eiMHVhqKYPYIU6YJuLgpqWfsxWP7/qB2qg
         c8H52YFje/hqdmLjwHsjDQxLNtRK89d9YqRNJRoBgF1OGdiJ7xN//0ApzXwogFVQKin0
         sBknEemNjOvayu9gCFZyNTOHXAKU/EpY97TReR5uXL9j9pLqGABibjlUwT71igZ0f7GA
         /LdNW7daABjMf75GHGNvFi0qG9dsS4FQtDhT3yMBgoJ8dVBPaAbfUoaWjkchm+2gR5cD
         ftuK0S62xPAyrQXF2OzLkDFHmwd16K6wTVOc091VCnGDFjUZ53cDVv/OuYN5EdXA7VMA
         pXrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743693546; x=1744298346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tqcs/vjgWLBfW1Dulxq85k2YfPnbkRu1MyFMZFId7I0=;
        b=JEybTBw5VFB1eXsZSdxZNRc2GhDYL3eyZcyY2JiiOzvWR4xZG/hevjPd+lwLwPia1Z
         7N5mkMKg4v91nUKbNVu5hmnI6dYkjgjTX7tM9k5d5Lz5KycimeBT6CoJyAC/z657O2EU
         jgIVyy29Pp+27aZl/ued/uCu6Z2myv2w4xucSr4loZH5daPNfkGCCPfqZOkelIe5uYlv
         fh09KIH1lGTgBM7lBoDsNL/+ycXqOS3IspleSqYJfJerXJS2DD7A45thQbFjVPQlZPJ2
         Bi0frYE4p3QJlNMopcOUqOlGMuioQyiYlfb376OqXnxRK+Kj4xcAd42FWXL4EOH4VqN4
         ZHBg==
X-Forwarded-Encrypted: i=1; AJvYcCUp1VsHU0rikTUbjDlGZ7Ocq3d/BVOOMbM+RaYjY5gHlVZK/CIsBJ6AjwxofssbjymhkwNmhYQz03xT6g==@linaro.org
X-Gm-Message-State: AOJu0YycYZ9QjBmTRO+h1ZHej7R9q0dO/cWTN8IU8llnBuLncGOEBCNo
	E8cod7cpOSlG2hJSpcW3Nh8QAqqG/DKrLlQ+cOwwUasTJfSji5QoHOl1iElYdPta4w==
X-Gm-Gg: ASbGncu4KCazheSvKOQFPssZQeDQiRkTGIprJ7lUzugg+FImHLIydbYUtIlYjQE3A7j
	qi0Wx9CYPSbcqDNB1k5hxjRWkGZTaUk1XFLM7TlXxwty8lmxsXLz1J/+X+9n0ILAEoio/Ka/2TY
	kuCJDFX+cEZhFY/G4OKUJZpsWGzYINXmOSkkXTpQ2N4Bu7yWdiwhDpk/xV/mYXhrXdCi9h3pZE7
	uVzqtZxDJq1GjUYJJzR1B9xP+fR1BJ9oxy69UtuZRgmqoNtQrKnb+gNXT6zsAKS7/y2EoZDlacc
	slmCnv9hkD4PnTuNbCTGthEhdU4a1f8ARfAykx0g5So1xRm8n0fkJ3C2cZCRaEbZl8WhJouxKic
	5uN8EE9c0EU6kx7rAicE=
X-Google-Smtp-Source: AGHT+IHM79vtkBMKrwSvTmbPoS3xdbBc/Ee74rmGb2o5mNZRfJz4rqKPJA31jHQP6Eldgb+r8LRRLw==
X-Received: by 2002:a5d:5886:0:b0:391:43cb:43fa with SMTP id ffacd0b85a97d-39c2f958db2mr2877374f8f.51.1743693545912;
        Thu, 03 Apr 2025 08:19:05 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (145.171.88.92.rev.sfr.net. [92.88.171.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301b69c4sm2040603f8f.43.2025.04.03.08.19.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 03 Apr 2025 08:19:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Gustavo Romero <gustavo.romero@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>,
	Ani Sinha <anisinha@redhat.com>,
	Udo Steinberg <udo@hypervisor.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Fabiano Rosas <farosas@suse.de>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Shannon Zhao <shannon.zhaosl@gmail.com>
Subject: [PATCH-for-10.0 v2 05/14] hw/arm: Do not build VMapple machine by default
Date: Thu,  3 Apr 2025 17:18:20 +0200
Message-ID: <20250403151829.44858-6-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250403151829.44858-1-philmd@linaro.org>
References: <20250403151829.44858-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: OLs9m9TSUd9R

Unfortunately as of v10.0.0-rc2 the VMapple machine is unusable:

  $ qemu-system-aarch64 -M vmapple [...]
  *** Terminating app due to uncaught exception 'NSInvalidArgumentException',
      reason: '-[PGIOSurfaceHostDeviceDescriptor setMapMemory:]: unrecognized selector sent to instance 0x600001ede820'
  *** First throw call stack:
  (
    0   CoreFoundation          0x000000019c759df0 __exceptionPreprocess + 176
    1   libobjc.A.dylib         0x000000019c21eb60 objc_exception_throw + 88
    2   CoreFoundation          0x000000019c816ce0 -[NSObject(NSObject) __retain_OA] + 0
    3   CoreFoundation          0x000000019c6c7efc ___forwarding___ + 1500
    4   CoreFoundation          0x000000019c6c7860 _CF_forwarding_prep_0 + 96
    5   qemu-system-aarch64     0x000000010486dbd0 apple_gfx_mmio_realize + 200
    6   qemu-system-aarch64     0x0000000104e6ab5c device_set_realized + 352
    7   qemu-system-aarch64     0x0000000104e7250c property_set_bool + 100
    8   qemu-system-aarch64     0x0000000104e7023c object_property_set + 136
    9   qemu-system-aarch64     0x0000000104e74870 object_property_set_qobject + 60
    10  qemu-system-aarch64     0x0000000104e70748 object_property_set_bool + 60
    11  qemu-system-aarch64     0x0000000104e69bd8 qdev_realize_and_unref + 20
    12  qemu-system-aarch64     0x0000000104e258e0 mach_vmapple_init + 1728
    13  qemu-system-aarch64     0x000000010481b0ac machine_run_board_init + 1892
    14  qemu-system-aarch64     0x0000000104a4def8 qmp_x_exit_preconfig + 260
    15  qemu-system-aarch64     0x0000000104a51ba8 qemu_init + 14460
    16  qemu-system-aarch64     0x0000000104f7cef8 main + 36
    17  dyld                    0x000000019c25eb4c start + 6000
  )
  libc++abi: terminating due to uncaught exception of type NSException
  Abort trap: 6

Disable the machine so it isn't built by default.

This is tracked as https://gitlab.com/qemu-project/qemu/-/issues/2913

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 configs/devices/aarch64-softmmu/default.mak | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/devices/aarch64-softmmu/default.mak b/configs/devices/aarch64-softmmu/default.mak
index 93f4022ad62..ad8028cfd48 100644
--- a/configs/devices/aarch64-softmmu/default.mak
+++ b/configs/devices/aarch64-softmmu/default.mak
@@ -9,3 +9,4 @@ include ../arm-softmmu/default.mak
 # CONFIG_XLNX_VERSAL=n
 # CONFIG_SBSA_REF=n
 # CONFIG_NPCM8XX=n
+CONFIG_VMAPPLE=n
-- 
2.47.1
