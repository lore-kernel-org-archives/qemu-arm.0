Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp1153495eja;
        Fri, 3 Nov 2023 08:21:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7e/MTycQIUph2Ymita5aARIqP77LDI3GaLhUv3Noq/doxpJNUiN4BpItE1BdaiFGqKOST
X-Received: by 2002:a67:c38b:0:b0:45d:9e12:a9eb with SMTP id s11-20020a67c38b000000b0045d9e12a9ebmr1525542vsj.11.1699024916384;
        Fri, 03 Nov 2023 08:21:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1699024916; cv=none;
        d=google.com; s=arc-20160816;
        b=gIlMwg+hcJrFPh50JmYpnb7VSnnt6NuhuXUM4HHgdJdXIAGhkZses4YHOTrvA0AL+a
         GdvhcVexhq19f4Ma+bPbbEuNi6VxNZ09I9eWYhDg0jMqNFe7kYiD2cDEhg0Heie8cvbu
         i26TnrZE47qTnWPMKZB4ybiUNjgGxrC5Jw78PxHofLSHm5AIDvJbkjXLA+cjqITqZ6/u
         YP8KpZqFTJD8kw0090Mwie8tkQPqBbZWR9W7/GEhyirKeCDHtoJDz5JeDV7K7dcMz/7D
         x+JHna3kPlaiSCJBu3iN1KyMQv2BvM1yNogBNUmdcZGVW3rKsKDBCDq4W89DnUL37FnM
         ceFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=2rKfc6wYyTa7eaGHPKOB3cQ0P9rjkcJ/4gZBc+bTbwo=;
        fh=wqfvLaBYopGyGisjq/k8ulPaCl1xshcoDnGh5kvEEbE=;
        b=1FfiydO/01oo9YVczW3JEckio2AUihWyIECxBY5bQuEwMtM9yoD1KzwbLauRm4sZMB
         ykOB9JUsNH+saGGVF7tJ48PdJMaXacgNeE8m5IJQGNu4bthxzZypUpMhQxO86+RWknR/
         9xTOyWJ6NJCfHSwtwDiG6HG0lNC8tEH246Ndv1QU0CoaKQApr8nlUk3eUDrO1eElv6My
         zNKbfi4stAh7Lf5GOefNzWv4SIxCHW8GguAnn5DqAiGZtRoJR3RTJ7DKz4xwYXWslkXE
         6WesylOMDCf37FGr4GQTQnvqX3GO3H7xZ+qbGEVoTwNABEVckTfBxW8OtD/ENXYVI5kY
         DWpw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DvcmfGCM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d25-20020ab07c59000000b007b9d2297d4esi270246uaw.104.2023.11.03.08.21.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Nov 2023 08:21:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DvcmfGCM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qyvzH-0004pj-VH; Fri, 03 Nov 2023 11:21:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qyvzG-0004na-4u
 for qemu-arm@nongnu.org; Fri, 03 Nov 2023 11:21:30 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qyvzC-0002nS-Pl
 for qemu-arm@nongnu.org; Fri, 03 Nov 2023 11:21:29 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-408382da7f0so16175615e9.0
 for <qemu-arm@nongnu.org>; Fri, 03 Nov 2023 08:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699024885; x=1699629685; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2rKfc6wYyTa7eaGHPKOB3cQ0P9rjkcJ/4gZBc+bTbwo=;
 b=DvcmfGCMuVFO/S2tW4Dof+okixNL1i9MoBHRkLqiV/7h8Uc3zgF/5hw326HPOd2Tug
 LIe47kaKGBGlurY8xAG4YW6IbeYSa5Xv6rmo94fudyuNVsoZtoFy9JC/T06RXWDN3xVs
 MfOI91tExa9b0zNODA5FZVSW/br8SBS7fYDkSFUFpIlaI+QTEktfEa4GBiDm5ZLMoLAI
 xuKGMa06dMssJjuZa4NHl7iwNjSMl283zeOQScbJ+TKpSvhKjDzRcJ8DCxsagOUVC9xw
 Mmmd4iq401WKKeGNEjOuhputD9qRGprS++M/YnyXBeSGje+VZ7Kg7XydDRPRNMreKOLa
 sXdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699024885; x=1699629685;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2rKfc6wYyTa7eaGHPKOB3cQ0P9rjkcJ/4gZBc+bTbwo=;
 b=DEnKwpYAuoO3y7T7LL+/QDLlJ2tif/yC7zySvyQNoWKwRIpeYLHSN1qLUfvt1dIaFj
 70aQqJbjeNj1vXE8YnFHf0qxRJgwlijiXbQhD3Ic5u3bLwXZDMlpmMInGq85KtGYBTSl
 tBFWbzj500jAVuyKuHo/5VWyw/gSJGp06udmcRF0fq40qUTNS4Kw55SU6wJaSq/Yglv5
 qcEb0WbNhWlrJ7Xr9uvdSPkRTubJrti4NdaUwdTPV8wlaiHTgsCYxFf/tbk8FErrUVKx
 ceM5qk2Pxjfy82xUkxVz1l0snTXPjm2uS1lobgb2Xe9D+ebU8h9S1EFVobH7bwbAMsu6
 lVKw==
X-Gm-Message-State: AOJu0Yya5FeA4dLNju82YDQ8jfsaQ9WnsPCNrVPNE5g+yb8jP+SNVwnp
 6quwM3RFQabA3uVZjBsKOJ3cNP9F7cKTjXn3L7M=
X-Received: by 2002:a05:600c:5204:b0:408:3f61:cb4f with SMTP id
 fb4-20020a05600c520400b004083f61cb4fmr17106556wmb.23.1699024885300; 
 Fri, 03 Nov 2023 08:21:25 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f16-20020a7bc8d0000000b0040684abb623sm2712165wml.24.2023.11.03.08.21.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Nov 2023 08:21:25 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Udo Steinberg <udo@hypervisor.org>
Subject: [PATCH v3 3/3] tests/qtest/bios-tables-test: Update virt SPCR and
 DBG2 golden references
Date: Fri,  3 Nov 2023 15:21:20 +0000
Message-Id: <20231103152120.829962-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231103152120.829962-1-peter.maydell@linaro.org>
References: <20231103152120.829962-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: K2wtnaAPxA6D

Update the virt SPCR and DBG2 golden reference files to have the
fix for the description of the UART.

Diffs from iasl:

@@ -1,57 +1,57 @@
 /*
  * Intel ACPI Component Architecture
  * AML/ASL+ Disassembler version 20200925 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/virt/SPCR, Fri Nov  3 14:12:06 2023
+ * Disassembly of /tmp/aml-E6YUD2, Fri Nov  3 14:12:06 2023
  *
  * ACPI Data Table [SPCR]
  *
  * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
  */

 [000h 0000   4]                    Signature : "SPCR"    [Serial Port Console Redirection table]
 [004h 0004   4]                 Table Length : 00000050
 [008h 0008   1]                     Revision : 02
-[009h 0009   1]                     Checksum : CB
+[009h 0009   1]                     Checksum : B1
 [00Ah 0010   6]                       Oem ID : "BOCHS "
 [010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

 [024h 0036   1]               Interface Type : 03
 [025h 0037   3]                     Reserved : 000000

 [028h 0040  12]         Serial Port Register : [Generic Address Structure]
 [028h 0040   1]                     Space ID : 00 [SystemMemory]
-[029h 0041   1]                    Bit Width : 08
+[029h 0041   1]                    Bit Width : 20
 [02Ah 0042   1]                   Bit Offset : 00
-[02Bh 0043   1]         Encoded Access Width : 01 [Byte Access:8]
+[02Bh 0043   1]         Encoded Access Width : 03 [DWord Access:32]
 [02Ch 0044   8]                      Address : 0000000009000000

 [034h 0052   1]               Interrupt Type : 08
 [035h 0053   1]          PCAT-compatible IRQ : 00
 [036h 0054   4]                    Interrupt : 00000021
 [03Ah 0058   1]                    Baud Rate : 03
 [03Bh 0059   1]                       Parity : 00
 [03Ch 0060   1]                    Stop Bits : 01
 [03Dh 0061   1]                 Flow Control : 02
 [03Eh 0062   1]                Terminal Type : 00
 [04Ch 0076   1]                     Reserved : 00
 [040h 0064   2]                PCI Device ID : FFFF
 [042h 0066   2]                PCI Vendor ID : FFFF
 [044h 0068   1]                      PCI Bus : 00
 [045h 0069   1]                   PCI Device : 00
 [046h 0070   1]                 PCI Function : 00
 [047h 0071   4]                    PCI Flags : 00000000
 [04Bh 0075   1]                  PCI Segment : 00
 [04Ch 0076   4]                     Reserved : 00000000

 Raw Table Data: Length 80 (0x50)

-    0000: 53 50 43 52 50 00 00 00 02 CB 42 4F 43 48 53 20  // SPCRP.....BOCHS
+    0000: 53 50 43 52 50 00 00 00 02 B1 42 4F 43 48 53 20  // SPCRP.....BOCHS
     0010: 42 58 50 43 20 20 20 20 01 00 00 00 42 58 50 43  // BXPC    ....BXPC
-    0020: 01 00 00 00 03 00 00 00 00 08 00 01 00 00 00 09  // ................
+    0020: 01 00 00 00 03 00 00 00 00 20 00 03 00 00 00 09  // ......... ......
     0030: 00 00 00 00 08 00 21 00 00 00 03 00 01 02 00 00  // ......!.........
     0040: FF FF FF FF 00 00 00 00 00 00 00 00 00 00 00 00  // ................

@@ -1,57 +1,57 @@
 /*
  * Intel ACPI Component Architecture
  * AML/ASL+ Disassembler version 20200925 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/virt/DBG2, Fri Nov  3 14:12:06 2023
+ * Disassembly of /tmp/aml-V1YUD2, Fri Nov  3 14:12:06 2023
  *
  * ACPI Data Table [DBG2]
  *
  * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
  */

 [000h 0000   4]                    Signature : "DBG2"    [Debug Port table type 2]
 [004h 0004   4]                 Table Length : 00000057
 [008h 0008   1]                     Revision : 00
-[009h 0009   1]                     Checksum : CF
+[009h 0009   1]                     Checksum : B5
 [00Ah 0010   6]                       Oem ID : "BOCHS "
 [010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

 [024h 0036   4]                  Info Offset : 0000002C
 [028h 0040   4]                   Info Count : 00000001

 [02Ch 0044   1]                     Revision : 00
 [02Dh 0045   2]                       Length : 002B
 [02Fh 0047   1]               Register Count : 01
 [030h 0048   2]              Namepath Length : 0005
 [032h 0050   2]              Namepath Offset : 0026
 [034h 0052   2]              OEM Data Length : 0000 [Optional field not present]
 [036h 0054   2]              OEM Data Offset : 0000 [Optional field not present]
 [038h 0056   2]                    Port Type : 8000
 [03Ah 0058   2]                 Port Subtype : 0003
 [03Ch 0060   2]                     Reserved : 0000
 [03Eh 0062   2]          Base Address Offset : 0016
 [040h 0064   2]          Address Size Offset : 0022

 [042h 0066  12]        Base Address Register : [Generic Address Structure]
 [042h 0066   1]                     Space ID : 00 [SystemMemory]
-[043h 0067   1]                    Bit Width : 08
+[043h 0067   1]                    Bit Width : 20
 [044h 0068   1]                   Bit Offset : 00
-[045h 0069   1]         Encoded Access Width : 01 [Byte Access:8]
+[045h 0069   1]         Encoded Access Width : 03 [DWord Access:32]
 [046h 0070   8]                      Address : 0000000009000000

 [04Eh 0078   4]                 Address Size : 00001000

 [052h 0082   5]                     Namepath : "COM0"

 Raw Table Data: Length 87 (0x57)

-    0000: 44 42 47 32 57 00 00 00 00 CF 42 4F 43 48 53 20  // DBG2W.....BOCHS
+    0000: 44 42 47 32 57 00 00 00 00 B5 42 4F 43 48 53 20  // DBG2W.....BOCHS
     0010: 42 58 50 43 20 20 20 20 01 00 00 00 42 58 50 43  // BXPC    ....BXPC
     0020: 01 00 00 00 2C 00 00 00 01 00 00 00 00 2B 00 01  // ....,........+..
     0030: 05 00 26 00 00 00 00 00 00 80 03 00 00 00 16 00  // ..&.............
-    0040: 22 00 00 08 00 01 00 00 00 09 00 00 00 00 00 10  // "...............
+    0040: 22 00 00 20 00 03 00 00 00 09 00 00 00 00 00 10  // ".. ............
     0050: 00 00 43 4F 4D 30 00                             // ..COM0.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/qtest/bios-tables-test-allowed-diff.h |   2 --
 tests/data/acpi/virt/DBG2                   | Bin 87 -> 87 bytes
 tests/data/acpi/virt/SPCR                   | Bin 80 -> 80 bytes
 3 files changed, 2 deletions(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 6673e2c4c13..dfb8523c8bf 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,3 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/virt/SPCR",
-"tests/data/acpi/virt/DBG2",
diff --git a/tests/data/acpi/virt/DBG2 b/tests/data/acpi/virt/DBG2
index 86e6314f7b0235ef8ed3e0221e09f996c41f5e98..0a05e1a47f9c303c6a6c9ca8414c62ec4ac90f98 100644
GIT binary patch
delta 37
ncmWF!=W=m!HwtF}f~^y|EJYL;n1M`A5T8MSfx+3|*MI>4b2kL{

delta 37
ncmWF!=W=m!HwtF}g7Xu(EJZjN7=cVq5T8MSfx+3|*MI>4bG-!j

diff --git a/tests/data/acpi/virt/SPCR b/tests/data/acpi/virt/SPCR
index 24e0a579e7d73f432a614380e29aa95113344186..cf0f2b75226515097c08d2e2016a83a4f08812ba 100644
GIT binary patch
delta 23
ecmWFt;0g|K4hmpkU|`xfkxQOgfq{9VjtT%gOa!L@

delta 23
ecmWFt;0g|K4hmpkU|>2ukxQPLgMo3PjtT%g(gddf

-- 
2.34.1

