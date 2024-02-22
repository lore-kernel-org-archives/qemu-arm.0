Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp230619ejf;
        Thu, 22 Feb 2024 14:24:30 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWsroQKhtgQpPS59jq8l8WV+1pMORtBEY/zv5A2zfpjBaAjOXh+/mg9YejSzRNlojqkrSXwlbMi/8HiY2vbnpz+n+khUShZ
X-Received: by 2002:a17:902:d50d:b0:1dc:1fda:202e with SMTP id b13-20020a170902d50d00b001dc1fda202emr193827plg.51.1708640670456;
        Thu, 22 Feb 2024 14:24:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708640670; cv=none;
        d=google.com; s=arc-20160816;
        b=cj8rPIHRneaecdp++k6urrf8hjWM/9J3mdUQlvOpAYwuvLdyDou6XXwKTJgo8OANhe
         VXJGUwgVMPCJTS/FkhssmNCzw+v43cPEQInrhOe/kiLNHP65Vr1vE74q2uJZ4TeUHE0Y
         sq/Xqsn9aqY8Tgo95uDhQarKZ6OHqm7TOF83zR27VU0vo6jFJx+E1dGFGkHM1/+u6Xsd
         QaZaz8vwNPE/yFC19nhYbAgeYOelnz265KIA4ERXYh1K0ySjlAp/gBaT+NumPfQo2/qU
         eJ6u5tebLPcnrzrWsHCgBT8EiJ6cn9E4wUwNJAuA6rmCB/NS/SxHK/ojWGTNjPbyOx2+
         IIuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=aV4SgQZuDXWBRvw2n8ljUcfJ5DI/n/OkG0enno6mss4=;
        fh=TjDxQiCj/B3LeP0UqdBa8v3e17W9o26kQ6xkxEpXxt0=;
        b=ZTPxnKM5KZEwpa/ho8ONC5aJvK8aPJoPfHb3+LCpKKt+z22U/UVVw0wO+3uVltZXEz
         SS42zFSTDJgiNc0z6Dbo8spad324wcQvGDKivol20hHLj5g91YKii/VFVZ7jRpgYsxbg
         CWR/0I2Hm4hIp1iDut9zy2ezykibAtlkt7gumgCmWv2lo/6CoeJiwxgBre0U7oyd1UXm
         jSA8apiMd++7PLpKDqb4j1KSqoPXFJsR3/c+AhEpiHDz08KAxsQqvLql5HqcuknVBMQs
         Sua1ndQRU/lXExgVqiSaaF7WC92oO7Y4ruCrN2/tu7+JEGvhuSzpZuY6E1J8NDl0nscg
         R/NA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eF+FpZzn;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id jz11-20020a170903430b00b001d70690b3ecsor6754300plb.3.2024.02.22.14.24.30
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 22 Feb 2024 14:24:30 -0800 (PST)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eF+FpZzn;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708640670; x=1709245470; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aV4SgQZuDXWBRvw2n8ljUcfJ5DI/n/OkG0enno6mss4=;
        b=eF+FpZznnY+94l1jXiGRVFK4wyErO6NwgPsTJK1/Aub+FStR9BgDVbhvmrBZAe6nXb
         h6TLoEVN8qOuVNnRwxVD3Qwj13xOucw2i6pkWtHPCsR1m7BuAr3KBC2hNafOX7Zpl+3v
         MCoulDq7d9ZqmTqOv5KobLOH/2+s/aFr5/bxPYR1JGSf9TSaHPGYfMwNd1pmDHlx9UVE
         1VnHIv8S/zEKZg0fw30VJsBZ7j76MWzgVjZ2D27F/0GYqttEuF2pHKQkUPu0tz2HlsUK
         qUou+Ui4oUWMEwmn/+1OuGz+Ypf8MM0bhbDFkm/ukecsvXZ7Tpz6++jHUx1JhaqK9Nbf
         VQZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708640670; x=1709245470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aV4SgQZuDXWBRvw2n8ljUcfJ5DI/n/OkG0enno6mss4=;
        b=w4zJymKeT531iqud4ZpMmvu5zx07yjzl7LjbL4k8fqLtIWY2q1LenXNrshYIa/zOaI
         QD0bugPQXyOoU+oLw88ZzfCQVT5/+m0MbVJGmTyKYQrWRAYn4M0wOTu7YQNI3Z+NFykA
         XjafoYKmPVcOFSGSb29Ql0n3+2krfwQ9XUXJtaNt4trkDNUAygUnctoQs84S0Iq32OZm
         1YYFW6iiovBPwPhZnnyDSo5QSuqkxenm54TqGPTAtUWuW7mLekck7Ebhu26CQ+B8Pk3H
         VorXqyOVUxFi/Pb6c+8tetwJvZc7D1WttSnM7jkWucoFvFHyWGPFhhQi2rHtKVPHA5Jn
         muIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVuaib/MCm3Xtm16HoRLgQTgNWhwOf2IKZ1eoXMGJfnHbdL9LjYjzOOgoPn1kxyAUrT8Ox/SflxeyJDCDCKDabOeffNVOG
X-Gm-Message-State: AOJu0Yycqzwk9h56xjghh8DEadQ9V/VpDFTicYoJau1ge6mrzyywKcR/
	vb7PaqM1tKBVb471lGQ37NijlrdpyepSOlPe7cC1kLRF+yOZL7QVVLNBAJE0P6GCiw==
X-Google-Smtp-Source: AGHT+IEHDHhXrjOaOlv8eYLNQVqmtLZFZvkRRRNMtoPIYbR1t1kj5OWTJB5SJcgtpifQ0Cedc3YFMw==
X-Received: by 2002:a17:902:e74f:b0:1dc:19e:3d9d with SMTP id p15-20020a170902e74f00b001dc019e3d9dmr246112plf.30.1708640669975;
        Thu, 22 Feb 2024 14:24:29 -0800 (PST)
Return-Path: <gustavo.romero@linaro.org>
Received: from amd.. ([2804:7f0:b400:285a:3e7c:3fff:fe7a:e83b])
        by smtp.gmail.com with ESMTPSA id ji7-20020a170903324700b001d7057c2fbasm10457210plb.100.2024.02.22.14.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 14:24:29 -0800 (PST)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org,
	philmd@linaro.org
Cc: thuth@redhat.com,
	lvivier@redhat.com,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	pbonzini@redhat.com,
	anton.kochkov@proton.me,
	richard.henderson@linaro.org,
	peter.maydell@linaro.org,
	gustavo.romero@linaro.org
Subject: [PATCH 4/6] hw/misc/ivshmem: Rename ivshmem to ivshmem-pci
Date: Thu, 22 Feb 2024 22:22:16 +0000
Message-Id: <20240222222218.2261956-5-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240222222218.2261956-1-gustavo.romero@linaro.org>
References: <20240222222218.2261956-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: rJfKNY5rjs4o

Because now there is also an MMIO ivshmem device (ivshmem-flat.c), and
ivshmem.c is a PCI specific implementation, rename it to ivshmem-pci.c.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-ID: <20231127052024.435743-5-gustavo.romero@linaro.org>
Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
---
 hw/misc/{ivshmem.c => ivshmem-pci.c} | 0
 hw/misc/meson.build                  | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename hw/misc/{ivshmem.c => ivshmem-pci.c} (100%)

diff --git a/hw/misc/ivshmem.c b/hw/misc/ivshmem-pci.c
similarity index 100%
rename from hw/misc/ivshmem.c
rename to hw/misc/ivshmem-pci.c
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index 84dff09f5d..4a9369082b 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -39,7 +39,7 @@ system_ss.add(when: 'CONFIG_SIFIVE_U_PRCI', if_true: files('sifive_u_prci.c'))
 subdir('macio')
 
 # ivshmem devices
-system_ss.add(when: 'CONFIG_IVSHMEM_DEVICE', if_true: files('ivshmem.c'))
+system_ss.add(when: 'CONFIG_IVSHMEM_DEVICE', if_true: files('ivshmem-pci.c'))
 system_ss.add(when: 'CONFIG_IVSHMEM_FLAT_DEVICE', if_true: files('ivshmem-flat.c'))
 
 system_ss.add(when: 'CONFIG_ALLWINNER_SRAMC', if_true: files('allwinner-sramc.c'))
-- 
2.34.1
