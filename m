Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp4377133njd;
        Thu, 3 Apr 2025 13:41:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXKVGPZouRKMTKJzGtZiSfYL1viPpNca9flXGFFfhEi6otbm/+KPc7mHb6JhA87im/EEItBxuifSOUAYQ==@linaro.org
X-Received: by 2002:a05:600c:1e28:b0:43d:aed:f7d0 with SMTP id 5b1f17b1804b1-43ed0da07b5mr1507745e9.28.1743712864296;
        Thu, 03 Apr 2025 13:41:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743712864; cv=none;
        d=google.com; s=arc-20240605;
        b=Sv2T9Sos4iwCGJoufg0VQaGAV2/3jnjWxDxJEWIaSe/Ta/xl/WBZ1kLeab2xIqV5qK
         peirj+Uq1tlhlq8+fgsEvHs2YvmThRkZi8+bdSs4BF9zMO5TDCY1TkxnMeuqLKj8+aw7
         fB8m1EYUA3MFm5qXe3KoErx7h8dhT9B9KvJkyharMU/+oX3P9IkeKX/phEAF+dqawt5k
         2h9Alh8InJLx4bca+kw0Za907yjv2DdYoDAWQg5sXmkFzrdg4LEe7Q/QzoRJn53pB2Ec
         u7dttkw8p+/nO98nRF7wIKkthOOv7JuLP7AAbdc7kOiJCUJ3YYp3Qm0HGlan8M1zj/nU
         YRGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=MLYRdVVgThynsCkkZUPojC5QmxuF1gOqeLFrpCloSHE=;
        fh=N4I54Ppf6z/1mGIKXspLX0sRPH4vm+H19KV4NPYyvjY=;
        b=dH1tEPljaKySZDIMPMa8z2eXtRq/yLZMU6tnOqN03fJhigOf5HD+Q6cQbeDixDidxz
         PRomNIesU6G1zj5Eorqrb46LNeunkPMn+SYg3F5vMWwSWllldALj19qb9dXl4xGygOj/
         MtdFtK0Ugb06v0bvhuJoF4deJWYdhIPByNM0eNaj92uiUlOZSzioOreniaDN/skxIHZ9
         hXIq9j8+pd/dYJAgTlCiEvtKRblVx6tI0igwjKyfICG0J97e1kQvoeiEfQ5zaV9y4gX4
         e895AqSyKIsGlbj2qeT8oZae99E9SLvamQwNVhfjES/IOqlk3Q7ergwZwfAiAC/Q49fW
         QSqg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aoqcwMz6;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43ec34280desor11193835e9.2.2025.04.03.13.41.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 03 Apr 2025 13:41:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aoqcwMz6;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743712864; x=1744317664; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MLYRdVVgThynsCkkZUPojC5QmxuF1gOqeLFrpCloSHE=;
        b=aoqcwMz6YBHF7AQlNXHqFzSI1krWbprDIyL7l/wsHj8nU25RumnScdvCe1F8t16LgQ
         HNc2/dU/IyQ+rPxK9fpedPdpRVcWbgKyu1xB9r9gyOmwq+TYPIjcs8a4u8V8BrKnZ8tJ
         z5YxUMbRc25o7Xi4yrV0fj2VcTnqf9XWzKXM5wgufOD0xgMBli8NRnZ1EfCm9t8JZOOG
         oDXeHhVTjb/A/1goD+K1TMy+9L9aZYjNpYz4v00+MV0VNHOHKwkHFf9vYU5wCseqKmUd
         ppG+4KOqfBFGEQCX4VY6qXIZZZMa3D3ai44OcQlZNCVto4Bur22C3yGi/PmUZxAzuAmR
         SWvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743712864; x=1744317664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MLYRdVVgThynsCkkZUPojC5QmxuF1gOqeLFrpCloSHE=;
        b=wJgInFLwcXOX86aqHf/Qeay7BiHLTXz0sifz2fQZ/V52ThoCRaaL2QkmWt2AolGUX6
         sXpjBPWlBhUao6DaZvrmnTQTMpHo5SWk+xc/H3d5w7ZCCDk4jFzNIvHONJ4ZNR6B3BMF
         8RGpLkzMkmYKiwKjxKXZOVeoJ+CvPp1xkBm74qnDZIrFNhiPC2EOl+1FUeGC0TyeLWuW
         TmBYXYixfjnyhn66Ni7+VcnY1N33funsPm3EnmEzoZSus+uNRbN4n7A39gvridK0K1VV
         2MmzPvqBl3qOtGdoVOYtPIE5N46xx1pCGixkMUpSUo69XyjKfBBvYUwtMfupqgUPI+IS
         txSw==
X-Forwarded-Encrypted: i=1; AJvYcCXuUt8FWwsu8srrGjliHfWcD3F5NqfkqcLwCNWsgQwtArLAgY9Gciotrufl5lYyg8t5tezsaoXF5JLcQg==@linaro.org
X-Gm-Message-State: AOJu0YxqPlQYWW7So66vLBQ/DaqchtxXTGVXnBy2gQ5PZd0b9ckqh5ht
	RCyTOLTHhlR69F0/MALDuOXJDyGlMJGhW86rZZNmJ811voOhAbTFF507uYcygFpbsIQXlKF6mMC
	ROMk=
X-Gm-Gg: ASbGncuYzAqpi8tR36IKICB+eI42uEeQBF/zZV/K19g27ae2TURPV7goplnnerw1f4E
	0BFfHTPLtQHfNWf39XmsEKPLOdm4c2g+g/GsVmfuzzs3qg68WQDGNqOi/XJWR2xKnL2/HoBIKEe
	Dfq9IKj33HVIT9PByLulZPiZxCiw6Fm3Bfs/D/5YjI7V5PdRB03kJPkB17hV68+7VwsW5zZzldr
	1Yt+2ojSItxb83eZka92DzINuzQ2qZm6usJijmS3XSgiW2NXloR+ayvIJtE2ySyFdcC6nKmGZmz
	XEJFvnrwQxPe/JQFkWfQbwzwVE5rHtqPh699+sRUJBDzb/bi25Anxf49yqzKlSPKdkmOnS5Mhro
	1WQaZ4vX/zs4GaJd6nyHHluM5
X-Google-Smtp-Source: AGHT+IHojbYMTI2SxjbDhqL1jep68YzCCoAPzFjtnoNR9EhzKBd3AcnPJyCUlbk4mdyAKPNG58yR5A==
X-Received: by 2002:a05:6000:270e:b0:39b:fa24:9519 with SMTP id ffacd0b85a97d-39d0de2d383mr130133f8f.35.1743712863777;
        Thu, 03 Apr 2025 13:41:03 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1662feesm30696335e9.12.2025.04.03.13.41.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 03 Apr 2025 13:41:03 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Andrew Jones <ajones@ventanamicro.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	qemu-arm@nongnu.org,
	Udo Steinberg <udo@hypervisor.org>,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	Gustavo Romero <gustavo.romero@linaro.org>,
	Igor Mammedov <imammedo@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Ani Sinha <anisinha@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-10.1 v3 6/9] qtest/bios-tables-test: Whitelist aarch64/virt 'its_off' variant blobs
Date: Thu,  3 Apr 2025 22:40:26 +0200
Message-ID: <20250403204029.47958-7-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250403204029.47958-1-philmd@linaro.org>
References: <20250403204029.47958-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: XkQJeb0QL7qB

We are going to fix the test_acpi_aarch64_virt_tcg_its_off()
test. In preparation, copy the ACPI tables which will be
altered as 'its_off' variants, and whitelist them.

Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/qtest/bios-tables-test-allowed-diff.h |   3 +++
 tests/qtest/bios-tables-test.c              |   1 +
 tests/data/acpi/aarch64/virt/APIC.its_off   | Bin 0 -> 184 bytes
 tests/data/acpi/aarch64/virt/FACP.its_off   | Bin 0 -> 276 bytes
 tests/data/acpi/aarch64/virt/IORT.its_off   | Bin 0 -> 236 bytes
 5 files changed, 4 insertions(+)
 create mode 100644 tests/data/acpi/aarch64/virt/APIC.its_off
 create mode 100644 tests/data/acpi/aarch64/virt/FACP.its_off
 create mode 100644 tests/data/acpi/aarch64/virt/IORT.its_off

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8bf..3421dd5adf3 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,4 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/aarch64/virt/APIC.its_off",
+"tests/data/acpi/aarch64/virt/FACP.its_off",
+"tests/data/acpi/aarch64/virt/IORT.its_off",
diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index baaf199e01c..55366bf4956 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -2151,6 +2151,7 @@ static void test_acpi_aarch64_virt_tcg_its_off(void)
     test_data data = {
         .machine = "virt",
         .arch = "aarch64",
+        .variant = ".its_off",
         .tcg_only = true,
         .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
         .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
diff --git a/tests/data/acpi/aarch64/virt/APIC.its_off b/tests/data/acpi/aarch64/virt/APIC.its_off
new file mode 100644
index 0000000000000000000000000000000000000000..c37d05d6e05805304f10afe73eb7cb9100fcccfa
GIT binary patch
literal 184
zcmZ<^@O0k6z`($=+{xeBBUr&HBEVSz2pEB4AU24G0Uik$i-7~iVgWL^17JJ`2AFzr
bgb+@aBn}xq0gwb2)Q)cq{30-g9B_L93G4|0

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/aarch64/virt/FACP.its_off b/tests/data/acpi/aarch64/virt/FACP.its_off
new file mode 100644
index 0000000000000000000000000000000000000000..606dac3fe4b55c31fd68b25d3a4127eeef227434
GIT binary patch
literal 276
zcmZ>BbPf<<WME(uaq@Te2v%^42yj*a0-z8Bhz+8t3j|P&V`N}P6&N^PpsQ~v$aVnZ
CVg~^L

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/aarch64/virt/IORT.its_off b/tests/data/acpi/aarch64/virt/IORT.its_off
new file mode 100644
index 0000000000000000000000000000000000000000..0fceb820d509e852ca0849baf568a8e93e426738
GIT binary patch
literal 236
zcmebD4+?q1z`(#9?&R<65v<@85#X!<1dKp25F11@1F-=RgMkDCNC*yK9F_<M77!bR
zUBI%eoFED&4;F$FSwK1)h;xBB2Py`m{{M%tVD>TjFfcO#g+N#Zh@s|zoCF3AP#UU@
R!2`+%Dg6Hr$N|zYvjDIZ5CH%H

literal 0
HcmV?d00001

-- 
2.47.1
