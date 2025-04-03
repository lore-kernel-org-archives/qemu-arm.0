Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp4185689njd;
        Thu, 3 Apr 2025 08:19:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCULOsHG4dgdA5eFSi6vybJGITqlmu7zNl0JkTy0AxqJZ0fWZvKdQtaCxGJhaRoDJwUNNm5OsZSmbI0dZw==@linaro.org
X-Received: by 2002:a05:6000:1862:b0:394:d0c3:da5e with SMTP id ffacd0b85a97d-39c30388217mr2755339f8f.47.1743693584405;
        Thu, 03 Apr 2025 08:19:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743693584; cv=none;
        d=google.com; s=arc-20240605;
        b=ZtPEulPZIZAUysuExqxO0ytfFo9yq7RuX4KcnmRXRlMLJND59MDqpxQ8hhViAbBddN
         3cZAYN7AFPMa9tyT+4bLpMLA1t52bWcuylijraSXnGpdtt8m4IDOHI/yMhWNQ7mgouFz
         WKknXC9nHvhlIP4gn5qyjQ4VwEqWbS2geuoCcG6nhm+nDKzNrK1RwSfMSldEXpr3YCyl
         gldj6wsALLgv62pt4s+4yY1cQ60Yf5OzmF1VKcc4U3MhGPNzdbbO5ajdRpPCseLk0Av6
         opP3SZAYxdhzgkQbymzlhr0C/eKAtpBzbUXfItwkYtvMJuxVW267SR+lMsy5yuRSDx6A
         1JhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=MLYRdVVgThynsCkkZUPojC5QmxuF1gOqeLFrpCloSHE=;
        fh=uYFAGlC/bz9fgjZICQiiM/ChyNqdWsGdgcGQNb2kFEg=;
        b=PBwEufeMDI8rF4bym27V9pspjrhLRqYg+fcP7kyR8wuBCQm4XyNCCqRs9QsmhkAbnZ
         N8ddJ8iXFzlLOkc64V1QJVnup/5dKJqNCynZuhjzwlmAlEGrts0NgLAlHk1ITj+m0VOa
         LY0C7ZgnENUc1Xzbr8ZojtDTj6F0NJA/c0pHIEft7c6/tpnqSoXdL17FNIqn9ShfNVNU
         DVAQp1hZ6zpzFQXDXuts5U1DTg4ZugVkxwUexYuhbNE8pCD/XMusjQyNKXlTCFATVmpa
         cget8z74z9kCxeutrSj5uYAIeTPOxrqGc1D0U7nxpwDzwfFW1DlTh5P5cdHtHe27SAGg
         eqUA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eMfZEf70;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43ec36428fbsor7454285e9.7.2025.04.03.08.19.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 03 Apr 2025 08:19:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eMfZEf70;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743693584; x=1744298384; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MLYRdVVgThynsCkkZUPojC5QmxuF1gOqeLFrpCloSHE=;
        b=eMfZEf70Yj0vcymGxi/dUbOeBRoWkenUzBcxSbg+Pmv6r+CqMVqLQ3OQKwsOOsYs2y
         Iogtty6fWJYYUbSg4Kaoo1NPfbeCxSk9U3wVnGeNNSop8uy/YFAjxGWcOtE4n3PVTeGs
         SSJni2bHxqtvsVxu7yWDnPRYxbl5lpefhvgc4zDtlU2fEltUlfUTkKR7y7Wso3X1lfRA
         m1rIJAjTwR3ndyU/QknJwxGa1vXogAaEdQDiYh8A/hkIS5bfMp9orEJ+83ixcOVAbvlp
         gGT8cROS3YC5VIloz7q35q2wQYPBi9bBXy3u/H4RCVfS/QwGvZ22u/KPZOriZjHFizuu
         gjvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743693584; x=1744298384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MLYRdVVgThynsCkkZUPojC5QmxuF1gOqeLFrpCloSHE=;
        b=GOlXxx3UVk5q5ViuE4Ccv4pmeWcph8rv8gaXT9PBvRGcOqBfReL1zstKddmHxZsVtt
         Uv9xjmm7Qxl30m6xJcPeBh5pAnPrJy9UzwB6GMrxlNEZIBbn3qRVdjHwnrhpzFxou6QS
         Ps0+TFCVbXZegks5C2NhXRW9/YpNUtanvv0LmT75wAZGNu5HmC6qovVU7swCKXb4R5q1
         UZ2bVzRLbG9Ejy8rPVMjWCLNeWwK1iDqRc2yO27x0QbeNgYnZL/9Y88xuFuUvDgevUym
         aUQEOZ0xxAOkb6VLTqdYMJNri5S71aw63zAlPPQpJEPh+MS6gwfy16DGHboCf9eDvXF3
         VlKg==
X-Forwarded-Encrypted: i=1; AJvYcCX1wAE/gjgaCKj1wJRHdIBrrajnaXT6a91nII/iS5x2JwgBeDX6jN9K3hDoJGibYVbekTInv4XsXdA10A==@linaro.org
X-Gm-Message-State: AOJu0Yw4QxNEtqSRU1qgnko2Y7Su89oDfK5YXqVdp0RqtzZl7vBOlU+Y
	u45nSbqYs9uhj1YAaD58KdzqTRS4hwoS2X4+ZKUzA7Vf/79jjIvcV0D4Fzem7y5jvg==
X-Gm-Gg: ASbGncvdAPXEtzkChG2ALHKgJHjftMcAIerPDIkyk8JHDG6fTz1T++gguf+H+h5BHQR
	WFnCH+wum5XcblOiSqnUKrUA/K219p2HkKOBu6G/qe7JUKncdMoZzbaGzc4ueDrwRme2T/UB2jK
	FgFjTSxGzB35MUuQk/EK+I5z5sJUdb61G+Gf+7+AnRYNIo7gPkYO7hhcPQWrKtjrSLsmTMDjMLJ
	+Y4eVUNEaDC/PIjUF4CK7NcZAH/GWasZQVEnvegEgJSPvBMJtGhOdRS2H/Q2MB1rzvhycQAfkuw
	cd7fEEe7XPB3h7H3hgVSz5j61Rvjam+HyMWtag1ppcesvKFqhCREKmUfjXoWF+uhybueHaaPHeX
	hOLtVKkS8Zo3pB0SnrTQ=
X-Google-Smtp-Source: AGHT+IENZTVyKkRY1W/b+AkkGyWGuqGp4yOMjd8Bjsjt2DdngZ1luNGpYjMfCIJLIyGZmX/C5Virpw==
X-Received: by 2002:a05:6000:4010:b0:391:2a9f:2fcb with SMTP id ffacd0b85a97d-39c30387633mr2572096f8f.36.1743693583885;
        Thu, 03 Apr 2025 08:19:43 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (145.171.88.92.rev.sfr.net. [92.88.171.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30096b9csm2088473f8f.13.2025.04.03.08.19.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 03 Apr 2025 08:19:43 -0700 (PDT)
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
Subject: [PATCH-for-10.0? v2 11/14] qtest/bios-tables-test: Whitelist aarch64/virt 'its_off' variant blobs
Date: Thu,  3 Apr 2025 17:18:26 +0200
Message-ID: <20250403151829.44858-12-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250403151829.44858-1-philmd@linaro.org>
References: <20250403151829.44858-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: mmbJcm2hDUrK

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
