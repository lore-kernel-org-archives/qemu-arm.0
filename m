Received: by 2002:a17:907:991a:b0:a45:b507:d90a with SMTP id ka26csp369324ejc;
        Sat, 9 Mar 2024 11:27:57 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWE+OSOh7AgqZHUXd/e68IxcKlnAMzP0qqsnRhm1yR+AmLUi8A3juKkwPZ4jBDx/y150y7mTQ45Lz4LDy/uFbLVjV4sUmgm
X-Google-Smtp-Source: AGHT+IFd+Rqec60aLLb2RWTa6u5saFMZc6kGnfI4I6DAyQlVJsC8/OvcFUDFNTDf8rMkDhulwqVO
X-Received: by 2002:ad4:48c5:0:b0:690:ae50:780b with SMTP id v5-20020ad448c5000000b00690ae50780bmr2357187qvx.34.1710012476957;
        Sat, 09 Mar 2024 11:27:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1710012476; cv=none;
        d=google.com; s=arc-20160816;
        b=jhXDITnj89eDiXzsv6ySXHDKxJzFIVlWV1dlZdIEcOsoEZgMxD9TpV7vWTNzf1Vo2z
         e0bElu0jatvLb6ej+roJeR1T2irFzk+0HKCLPbZ41ZCehzPgjEoISkKO9V9gIDOixsYw
         YWHQPSVX45Lcc40FlaN7psd/tRAnuz9cfdCaEabC10QA5Py1xK2g7GtaQG+DwIIwm9XL
         VbBPCrkpjZu+Vtxg9a22jQ/usW6d+CEVi6Wt6ZjzhdjFbNPEGDkhNWPIqQCrcYErHfOv
         nhhuT9vAM/yiHb7fllmbEvgUXi7+u7IwoQKwhAXwMVVuEpFn8UicYD5NBvtb2roEK7Fo
         T9IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=7zPZ+tfLA0kEM+leCIAJpOJfakF+P7OF5niFNRbs0QA=;
        fh=WXAsiNWZ7gvWqHkben+kCmCPhPuQk1iIljCKivxMAco=;
        b=Y/KbvOEF1XdOTQGCHoody1/zgf6rITk91Wv+Yka7dK13HS7qw9SJQiP3hLIP1fxyM4
         pzdBRD4JrzNDiRxHcuNHlBCrrN26ym06F9m6ki5SgS8K7ghygaKijg0h9G2ttABeHTkS
         fpq+rsCHEjiitIP+O7Cbyb8o9/45z4aqo0L2fBGvPMWyttky4sPXf/jsHeoWtne6Rxi7
         /6k1RYqdS05hb7sIZ2m3O14GWNg3E1L5P+BZG8woJ1Z1pyM7hhuh/bUEar6NfW02hHuL
         pF2dxPXFiAkKSK5nCfPcwe7Bhz9x+PuNQkY+SUu+NJQnDBYTPD6efDRNHiBQn3qPHcsR
         RyiQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AHBwVgXq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kd28-20020a056214401c00b00690b67ee92asi2075515qvb.460.2024.03.09.11.27.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 09 Mar 2024 11:27:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AHBwVgXq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rj2LA-00081g-Oa; Sat, 09 Mar 2024 14:26:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rj2Jl-00071j-Th
 for qemu-arm@nongnu.org; Sat, 09 Mar 2024 14:25:15 -0500
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rj2Jf-0003GT-3r
 for qemu-arm@nongnu.org; Sat, 09 Mar 2024 14:25:10 -0500
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2d33986dbc0so34059811fa.2
 for <qemu-arm@nongnu.org>; Sat, 09 Mar 2024 11:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710012303; x=1710617103; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7zPZ+tfLA0kEM+leCIAJpOJfakF+P7OF5niFNRbs0QA=;
 b=AHBwVgXq9ZG3/uDg62TUf5rnj5n6AJIgCw2RdDjkDn7Re4d2QILaZs2k5kW71jtwoh
 rm6zAao15W9zINZ3R2OKC+q/vdo6pbjLZ/UYX/3yMW5TSHtdn8pEMg1MQtHnENWpa/mG
 PJM8e57q+iJIWQS1ZIlwzvhWDEGA0GTjnOV1uvZVQ3sed7toNFxtDOIMDVW74UnUBRWt
 2ZWnl7R/uDmtqOU36ZSmwOIcV+s9IzmarAuFOMHq8O/l/7uF9zWW1LcHd4G+eljxvGNH
 2mNgOMIj13yIqI/ddN4mp5asQKSunHm1p96NKJCoNZGg73gPwQ6KAmDfQFg6Xvr6iLI3
 6hPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710012303; x=1710617103;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7zPZ+tfLA0kEM+leCIAJpOJfakF+P7OF5niFNRbs0QA=;
 b=MXp3TjRH5byZ8LSarpwQXwwtcKWw7UxpimPd9P5xgXLHVQ4SmefmK0RmyKzxzVQ2gP
 NjbC7Wphi+lfD+EiiFUD57ZyKs65QkzNG6EUEkfcsPZbX7GoQrsa0qQC5BlfszOPGYp5
 P7Jhw34WzLyGN6IjcZF3l4xr7FOiq1A2A/3oLnz5xuqSbEAZ8uAnNeFZcu0A0MItz4/l
 T707vddIhVWOgJQG9KDTYD66Mojf/BYT3uYwhGWOOKblLfjXQQI7pPlFf5UppfxjnmFA
 /p1gllTX0eYZOBrkKo3U6rhucAQUfDV2fT4eKLOxmH0oAFhxCzi1akqNfRVtDw0jaAQN
 7ZUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQulJSB6hL/CcE4lz/FJGbxkxataI8XI5DLhjMILe4MqVMjUJuY+uuJhh/IAYDRH6vnUQkDwtZPojM3vrNNqEXm/lB
X-Gm-Message-State: AOJu0YyMoSuDwiEFIcwE5Mr9RSoWLe954/k6OWw5CPHZxH5+7X1loI7x
 jxDuLi7o10ynD4cOpGpqsHU3jTerCf93cszgGUXqiCwBv+7pgyXKOhAUeXyLvaw=
X-Received: by 2002:a2e:87d3:0:b0:2d4:31a0:6adf with SMTP id
 v19-20020a2e87d3000000b002d431a06adfmr299482ljj.24.1710012303605; 
 Sat, 09 Mar 2024 11:25:03 -0800 (PST)
Received: from m1x-phil.lan ([176.176.181.237])
 by smtp.gmail.com with ESMTPSA id
 cn19-20020a0564020cb300b0056828004c75sm1167790edb.51.2024.03.09.11.25.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 09 Mar 2024 11:25:03 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Kashyap Chamarthy <kchamart@redhat.com>
Subject: [PULL 28/43] docs/interop/firmware.json: Align examples
Date: Sat,  9 Mar 2024 20:21:55 +0100
Message-ID: <20240309192213.23420-29-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240309192213.23420-1-philmd@linaro.org>
References: <20240309192213.23420-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::233;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x233.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: PeUJcjpf2yJs

From: Thomas Weißschuh <thomas.weissschuh@linutronix.de>

Adjust indentation for commit d23055b8db8 (qapi: Require descriptions
and tagged sections to be indented).

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Message-ID: <20240307-qapi-firmware-json-v2-1-3b29eabb9b9a@linutronix.de>
[PMD: Reword description using Markus suggestion]
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 docs/interop/firmware.json | 374 ++++++++++++++++++-------------------
 1 file changed, 187 insertions(+), 187 deletions(-)

diff --git a/docs/interop/firmware.json b/docs/interop/firmware.json
index cc8f869186..a024f1b9bf 100644
--- a/docs/interop/firmware.json
+++ b/docs/interop/firmware.json
@@ -435,203 +435,203 @@
 #
 # Examples:
 #
-# {
-#     "description": "SeaBIOS",
-#     "interface-types": [
-#         "bios"
-#     ],
-#     "mapping": {
-#         "device": "memory",
-#         "filename": "/usr/share/seabios/bios-256k.bin"
-#     },
-#     "targets": [
-#         {
-#             "architecture": "i386",
-#             "machines": [
-#                 "pc-i440fx-*",
-#                 "pc-q35-*"
-#             ]
+#     {
+#         "description": "SeaBIOS",
+#         "interface-types": [
+#             "bios"
+#         ],
+#         "mapping": {
+#             "device": "memory",
+#             "filename": "/usr/share/seabios/bios-256k.bin"
 #         },
-#         {
-#             "architecture": "x86_64",
-#             "machines": [
-#                 "pc-i440fx-*",
-#                 "pc-q35-*"
-#             ]
-#         }
-#     ],
-#     "features": [
-#         "acpi-s3",
-#         "acpi-s4"
-#     ],
-#     "tags": [
-#         "CONFIG_BOOTSPLASH=n",
-#         "CONFIG_ROM_SIZE=256",
-#         "CONFIG_USE_SMM=n"
-#     ]
-# }
+#         "targets": [
+#             {
+#                 "architecture": "i386",
+#                 "machines": [
+#                     "pc-i440fx-*",
+#                     "pc-q35-*"
+#                 ]
+#             },
+#             {
+#                 "architecture": "x86_64",
+#                 "machines": [
+#                     "pc-i440fx-*",
+#                     "pc-q35-*"
+#                 ]
+#             }
+#         ],
+#         "features": [
+#             "acpi-s3",
+#             "acpi-s4"
+#         ],
+#         "tags": [
+#             "CONFIG_BOOTSPLASH=n",
+#             "CONFIG_ROM_SIZE=256",
+#             "CONFIG_USE_SMM=n"
+#         ]
+#     }
 #
-# {
-#     "description": "OVMF with SB+SMM, empty varstore",
-#     "interface-types": [
-#         "uefi"
-#     ],
-#     "mapping": {
-#         "device": "flash",
-#         "executable": {
-#             "filename": "/usr/share/OVMF/OVMF_CODE.secboot.fd",
-#             "format": "raw"
+#     {
+#         "description": "OVMF with SB+SMM, empty varstore",
+#         "interface-types": [
+#             "uefi"
+#         ],
+#         "mapping": {
+#             "device": "flash",
+#             "executable": {
+#                 "filename": "/usr/share/OVMF/OVMF_CODE.secboot.fd",
+#                 "format": "raw"
+#             },
+#             "nvram-template": {
+#                 "filename": "/usr/share/OVMF/OVMF_VARS.fd",
+#                 "format": "raw"
+#             }
 #         },
-#         "nvram-template": {
-#             "filename": "/usr/share/OVMF/OVMF_VARS.fd",
-#             "format": "raw"
-#         }
-#     },
-#     "targets": [
-#         {
-#             "architecture": "x86_64",
-#             "machines": [
-#                 "pc-q35-*"
-#             ]
-#         }
-#     ],
-#     "features": [
-#         "acpi-s3",
-#         "amd-sev",
-#         "requires-smm",
-#         "secure-boot",
-#         "verbose-dynamic"
-#     ],
-#     "tags": [
-#         "-a IA32",
-#         "-a X64",
-#         "-p OvmfPkg/OvmfPkgIa32X64.dsc",
-#         "-t GCC48",
-#         "-b DEBUG",
-#         "-D SMM_REQUIRE",
-#         "-D SECURE_BOOT_ENABLE",
-#         "-D FD_SIZE_4MB"
-#     ]
-# }
+#         "targets": [
+#             {
+#                 "architecture": "x86_64",
+#                 "machines": [
+#                     "pc-q35-*"
+#                 ]
+#             }
+#         ],
+#         "features": [
+#             "acpi-s3",
+#             "amd-sev",
+#             "requires-smm",
+#             "secure-boot",
+#             "verbose-dynamic"
+#         ],
+#         "tags": [
+#             "-a IA32",
+#             "-a X64",
+#             "-p OvmfPkg/OvmfPkgIa32X64.dsc",
+#             "-t GCC48",
+#             "-b DEBUG",
+#             "-D SMM_REQUIRE",
+#             "-D SECURE_BOOT_ENABLE",
+#             "-D FD_SIZE_4MB"
+#         ]
+#     }
 #
-# {
-#     "description": "OVMF with SB+SMM, SB enabled, MS certs enrolled",
-#     "interface-types": [
-#         "uefi"
-#     ],
-#     "mapping": {
-#         "device": "flash",
-#         "executable": {
-#             "filename": "/usr/share/OVMF/OVMF_CODE.secboot.fd",
-#             "format": "raw"
+#     {
+#         "description": "OVMF with SB+SMM, SB enabled, MS certs enrolled",
+#         "interface-types": [
+#             "uefi"
+#         ],
+#         "mapping": {
+#             "device": "flash",
+#             "executable": {
+#                 "filename": "/usr/share/OVMF/OVMF_CODE.secboot.fd",
+#                 "format": "raw"
+#             },
+#             "nvram-template": {
+#                 "filename": "/usr/share/OVMF/OVMF_VARS.secboot.fd",
+#                 "format": "raw"
+#             }
 #         },
-#         "nvram-template": {
-#             "filename": "/usr/share/OVMF/OVMF_VARS.secboot.fd",
-#             "format": "raw"
-#         }
-#     },
-#     "targets": [
-#         {
-#             "architecture": "x86_64",
-#             "machines": [
-#                 "pc-q35-*"
-#             ]
-#         }
-#     ],
-#     "features": [
-#         "acpi-s3",
-#         "amd-sev",
-#         "enrolled-keys",
-#         "requires-smm",
-#         "secure-boot",
-#         "verbose-dynamic"
-#     ],
-#     "tags": [
-#         "-a IA32",
-#         "-a X64",
-#         "-p OvmfPkg/OvmfPkgIa32X64.dsc",
-#         "-t GCC48",
-#         "-b DEBUG",
-#         "-D SMM_REQUIRE",
-#         "-D SECURE_BOOT_ENABLE",
-#         "-D FD_SIZE_4MB"
-#     ]
-# }
+#         "targets": [
+#             {
+#                 "architecture": "x86_64",
+#                 "machines": [
+#                     "pc-q35-*"
+#                 ]
+#             }
+#         ],
+#         "features": [
+#             "acpi-s3",
+#             "amd-sev",
+#             "enrolled-keys",
+#             "requires-smm",
+#             "secure-boot",
+#             "verbose-dynamic"
+#         ],
+#         "tags": [
+#             "-a IA32",
+#             "-a X64",
+#             "-p OvmfPkg/OvmfPkgIa32X64.dsc",
+#             "-t GCC48",
+#             "-b DEBUG",
+#             "-D SMM_REQUIRE",
+#             "-D SECURE_BOOT_ENABLE",
+#             "-D FD_SIZE_4MB"
+#         ]
+#     }
 #
-# {
-#     "description": "OVMF with SEV-ES support",
-#     "interface-types": [
-#         "uefi"
-#     ],
-#     "mapping": {
-#         "device": "flash",
-#         "executable": {
-#             "filename": "/usr/share/OVMF/OVMF_CODE.fd",
-#             "format": "raw"
+#     {
+#         "description": "OVMF with SEV-ES support",
+#         "interface-types": [
+#             "uefi"
+#         ],
+#         "mapping": {
+#             "device": "flash",
+#             "executable": {
+#                 "filename": "/usr/share/OVMF/OVMF_CODE.fd",
+#                 "format": "raw"
+#             },
+#             "nvram-template": {
+#                 "filename": "/usr/share/OVMF/OVMF_VARS.fd",
+#                 "format": "raw"
+#             }
 #         },
-#         "nvram-template": {
-#             "filename": "/usr/share/OVMF/OVMF_VARS.fd",
-#             "format": "raw"
-#         }
-#     },
-#     "targets": [
-#         {
-#             "architecture": "x86_64",
-#             "machines": [
-#                 "pc-q35-*"
-#             ]
-#         }
-#     ],
-#     "features": [
-#         "acpi-s3",
-#         "amd-sev",
-#         "amd-sev-es",
-#         "verbose-dynamic"
-#     ],
-#     "tags": [
-#         "-a X64",
-#         "-p OvmfPkg/OvmfPkgX64.dsc",
-#         "-t GCC48",
-#         "-b DEBUG",
-#         "-D FD_SIZE_4MB"
-#     ]
-# }
+#         "targets": [
+#             {
+#                 "architecture": "x86_64",
+#                 "machines": [
+#                     "pc-q35-*"
+#                 ]
+#             }
+#         ],
+#         "features": [
+#             "acpi-s3",
+#             "amd-sev",
+#             "amd-sev-es",
+#             "verbose-dynamic"
+#         ],
+#         "tags": [
+#             "-a X64",
+#             "-p OvmfPkg/OvmfPkgX64.dsc",
+#             "-t GCC48",
+#             "-b DEBUG",
+#             "-D FD_SIZE_4MB"
+#         ]
+#     }
 #
-# {
-#     "description": "UEFI firmware for ARM64 virtual machines",
-#     "interface-types": [
-#         "uefi"
-#     ],
-#     "mapping": {
-#         "device": "flash",
-#         "executable": {
-#             "filename": "/usr/share/AAVMF/AAVMF_CODE.fd",
-#             "format": "raw"
+#     {
+#         "description": "UEFI firmware for ARM64 virtual machines",
+#         "interface-types": [
+#             "uefi"
+#         ],
+#         "mapping": {
+#             "device": "flash",
+#             "executable": {
+#                 "filename": "/usr/share/AAVMF/AAVMF_CODE.fd",
+#                 "format": "raw"
+#             },
+#             "nvram-template": {
+#                 "filename": "/usr/share/AAVMF/AAVMF_VARS.fd",
+#                 "format": "raw"
+#             }
 #         },
-#         "nvram-template": {
-#             "filename": "/usr/share/AAVMF/AAVMF_VARS.fd",
-#             "format": "raw"
-#         }
-#     },
-#     "targets": [
-#         {
-#             "architecture": "aarch64",
-#             "machines": [
-#                 "virt-*"
-#             ]
-#         }
-#     ],
-#     "features": [
+#         "targets": [
+#             {
+#                 "architecture": "aarch64",
+#                 "machines": [
+#                     "virt-*"
+#                 ]
+#             }
+#         ],
+#         "features": [
 #
-#     ],
-#     "tags": [
-#         "-a AARCH64",
-#         "-p ArmVirtPkg/ArmVirtQemu.dsc",
-#         "-t GCC48",
-#         "-b DEBUG",
-#         "-D DEBUG_PRINT_ERROR_LEVEL=0x80000000"
-#     ]
-# }
+#         ],
+#         "tags": [
+#             "-a AARCH64",
+#             "-p ArmVirtPkg/ArmVirtQemu.dsc",
+#             "-t GCC48",
+#             "-b DEBUG",
+#             "-D DEBUG_PRINT_ERROR_LEVEL=0x80000000"
+#         ]
+#     }
 ##
 { 'struct' : 'Firmware',
   'data'   : { 'description'     : 'str',
-- 
2.41.0

