Received: by 2002:a17:906:2b99:b0:a2e:1324:ea5c with SMTP id m25csp2530651ejg;
        Mon, 22 Jan 2024 06:36:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEd9shcpLHlMGvzTA8IIaUOog7VVNHQbamK5FKSbgYAwNG3veOyXBtRM6901tKd4mDi9cEe
X-Received: by 2002:a05:620a:1659:b0:783:3eb7:73d2 with SMTP id c25-20020a05620a165900b007833eb773d2mr4741568qko.124.1705934199160;
        Mon, 22 Jan 2024 06:36:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705934199; cv=none;
        d=google.com; s=arc-20160816;
        b=xhPqRrEZ901BTVZJ9+Kkgxoydq6U5sGIi4igDBQh0VSuzKt5LaVZK5A0OGeF9eba65
         Xrf9HYM9smQMHKK72Ni1oysB8axjLC69SgVFDJjU5DJS43FZqWZANgLUpkUtpWcNiCql
         TPQAJf5ROF4iqeQVxPx7tj5v80i1xY5DYZBURPFF2d4lHcqiErNQ5bN9qt6Yft575tGK
         aI9PbV2L00Sf4VXrl2GEXu498Bm6+rnw8oCdy0iG5ax1XjUTOjKNS3fv4KoRsNVGsjlC
         YjXGpLg8e13i8TUBLCc3G13exXSjPzJVIsTFr8U5gPZ8ZLYzrb+3ExJ+AW/OXDz5IcDX
         l5Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=2zs7MDPOvZWrmEU8IHVt5IQIX44BpOcVLothjZAQjo0=;
        fh=VnLaRVPcN1gpaQWLnE0jAsSHd7/auwbL0WCytLamgZU=;
        b=MsMuYjc20QesUxDkTnXZYuuBofSocoiiRIjt+tGJ36rREBKEjLkD6f/qK2nvuWEZgH
         xmjpT+DYUU6bxNTiYxJ5SAnDPPBuRJRZKiHsJyIDs+dOZGGfV5okHXJW0haQTJcAGq7v
         qAlSaEf02Mh2b177K3Pdd5SiHg9zmweP2bU1l5aNN9sLc8KIGiEsZPZyhSE4048p1IF7
         lwCcZH6lX/ovNpnxlHBqYeuAXLRNSBywKoCx8KdnXK5HrE1qH4YAZA/lwVB+LeDwp/HB
         Dc1koSH2lZrO8gXh8VIbPcWw6EVrZALcAP2KtX1IxUYRC1fhN3R3wPEGOccDhFrj/r6g
         NUdA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=I21BPug1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id qp3-20020a05620a388300b007830a9a0219si5428477qkn.112.2024.01.22.06.36.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jan 2024 06:36:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=I21BPug1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rRvOw-0006TU-RZ; Mon, 22 Jan 2024 09:35:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rRvOu-0006RD-0C
 for qemu-arm@nongnu.org; Mon, 22 Jan 2024 09:35:48 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rRvOo-0003aQ-Uf
 for qemu-arm@nongnu.org; Mon, 22 Jan 2024 09:35:47 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40e80046264so41661915e9.0
 for <qemu-arm@nongnu.org>; Mon, 22 Jan 2024 06:35:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705934140; x=1706538940; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2zs7MDPOvZWrmEU8IHVt5IQIX44BpOcVLothjZAQjo0=;
 b=I21BPug1UNvWaMpP7IQ93wEXPrdtP+Nq0qg8LzzsJ54ZvIHTT0wSW3XLVO7AjY2rus
 E18SC2BzxoyZQEmsGfUozluHVf0amvTwfI2yml+3tuwl3P1O1tFcrtlTcWsT+HM3PUay
 lj7keKQj6Jv3+pRZw1ip1XhX8RpdYjtnh3RWQhx3ODJJyk3zw2bV7tpd6NCTt2Qqkp19
 iV097oESu2tNZhzP1kqgdGEwbUdVEwzIQ/Mksl7Tz7n4Ac9lQll+Jqrb+uXyJFYYs4G6
 VKZoiBbiNOyz4rdGsnN16s7T6LEJGuOpb20+W5Tm75BSG+oPx4gt1vHdM4QhJXvCCYyj
 rHaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705934140; x=1706538940;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2zs7MDPOvZWrmEU8IHVt5IQIX44BpOcVLothjZAQjo0=;
 b=YbDD1L5Te663Sv28/J7VZ6gr6dNpoipjk4+MpyhqXz1dEQOHvQOWCqNk/+8IA+KkoL
 9aoX0aNQA2FQ9w6zWSKs5J3gcUVtngUhNS4XYaJizS9d/oVUrfxf2qWXAbiY0GXBkEQd
 ExgnUoo6HuCjjJ7gct+nonIJLt+WcpKfR7n2OJU4Fxub8jsr8ulZfAaTLzw5Q8kYr2qP
 a06b8NJQewSuXylgonFpPFDnefUNLv6ogOqHxcNteh4FOv3Zje5jkC7hwAeqjxvZEkFU
 8xWNwo617D76b3FLwCQlJdsbNY9lpg6E5FWzkT3vuBSchls/wePtqH10H8dOE3R7F+CL
 gsgQ==
X-Gm-Message-State: AOJu0YwznDbkrT/pSrkbQKjmwa+eoy/ZM4BiOCDtv1WI0huCTFVqC3tK
 VYLmJe5KDZiXduE98dw6G9ub3pjGWrmTGq9v3r2olpSQhOuf9gTGJJ7NYqC0ceT95etwHDjaxML
 a
X-Received: by 2002:a7b:ca46:0:b0:40e:5cf9:e80b with SMTP id
 m6-20020a7bca46000000b0040e5cf9e80bmr2372296wml.151.1705934140559; 
 Mon, 22 Jan 2024 06:35:40 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 je6-20020a05600c1f8600b0040d8d11bf63sm39559584wmb.41.2024.01.22.06.35.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jan 2024 06:35:40 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Leif Lindholm <quic_llindhol@quicinc.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Ard Biesheuvel <ardb@kernel.org>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>
Subject: [PATCH v2 3/3] tests/qtest/bios-tables-tests: Update virt golden
 reference
Date: Mon, 22 Jan 2024 14:35:37 +0000
Message-Id: <20240122143537.233498-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240122143537.233498-1-peter.maydell@linaro.org>
References: <20240122143537.233498-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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
X-TUID: UwrOqY+F8+Vz

Update the virt golden reference files to say that the FACP is ACPI
v6.3, and the GTDT table is a revision 3 table with space for the
virtual EL2 timer.

Diffs from iasl:

@@ -1,32 +1,32 @@
 /*
  * Intel ACPI Component Architecture
  * AML/ASL+ Disassembler version 20200925 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/virt/FACP, Mon Jan 22 13:48:40 2024
+ * Disassembly of /tmp/aml-W8RZH2, Mon Jan 22 13:48:40 2024
  *
  * ACPI Data Table [FACP]
  *
  * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
  */

 [000h 0000   4]                    Signature : "FACP"    [Fixed ACPI Description Table (FADT)]
 [004h 0004   4]                 Table Length : 00000114
 [008h 0008   1]                     Revision : 06
-[009h 0009   1]                     Checksum : 15
+[009h 0009   1]                     Checksum : 12
 [00Ah 0010   6]                       Oem ID : "BOCHS "
 [010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

 [024h 0036   4]                 FACS Address : 00000000
 [028h 0040   4]                 DSDT Address : 00000000
 [02Ch 0044   1]                        Model : 00
 [02Dh 0045   1]                   PM Profile : 00 [Unspecified]
 [02Eh 0046   2]                SCI Interrupt : 0000
 [030h 0048   4]             SMI Command Port : 00000000
 [034h 0052   1]            ACPI Enable Value : 00
 [035h 0053   1]           ACPI Disable Value : 00
 [036h 0054   1]               S4BIOS Command : 00
 [037h 0055   1]              P-State Control : 00
@@ -86,33 +86,33 @@
      Use APIC Physical Destination Mode (V4) : 0
                        Hardware Reduced (V5) : 1
                       Low Power S0 Idle (V5) : 0

 [074h 0116  12]               Reset Register : [Generic Address Structure]
 [074h 0116   1]                     Space ID : 00 [SystemMemory]
 [075h 0117   1]                    Bit Width : 00
 [076h 0118   1]                   Bit Offset : 00
 [077h 0119   1]         Encoded Access Width : 00 [Undefined/Legacy]
 [078h 0120   8]                      Address : 0000000000000000

 [080h 0128   1]         Value to cause reset : 00
 [081h 0129   2]    ARM Flags (decoded below) : 0003
                               PSCI Compliant : 1
                        Must use HVC for PSCI : 1

-[083h 0131   1]          FADT Minor Revision : 00
+[083h 0131   1]          FADT Minor Revision : 03
 [084h 0132   8]                 FACS Address : 0000000000000000
 [08Ch 0140   8]                 DSDT Address : 0000000000000000
 [094h 0148  12]             PM1A Event Block : [Generic Address Structure]
 [094h 0148   1]                     Space ID : 00 [SystemMemory]
 [095h 0149   1]                    Bit Width : 00
 [096h 0150   1]                   Bit Offset : 00
 [097h 0151   1]         Encoded Access Width : 00 [Undefined/Legacy]
 [098h 0152   8]                      Address : 0000000000000000

 [0A0h 0160  12]             PM1B Event Block : [Generic Address Structure]
 [0A0h 0160   1]                     Space ID : 00 [SystemMemory]
 [0A1h 0161   1]                    Bit Width : 00
 [0A2h 0162   1]                   Bit Offset : 00
 [0A3h 0163   1]         Encoded Access Width : 00 [Undefined/Legacy]
 [0A4h 0164   8]                      Address : 0000000000000000

@@ -164,34 +164,34 @@
 [0F5h 0245   1]                    Bit Width : 00
 [0F6h 0246   1]                   Bit Offset : 00
 [0F7h 0247   1]         Encoded Access Width : 00 [Undefined/Legacy]
 [0F8h 0248   8]                      Address : 0000000000000000

 [100h 0256  12]        Sleep Status Register : [Generic Address Structure]
 [100h 0256   1]                     Space ID : 00 [SystemMemory]
 [101h 0257   1]                    Bit Width : 00
 [102h 0258   1]                   Bit Offset : 00
 [103h 0259   1]         Encoded Access Width : 00 [Undefined/Legacy]
 [104h 0260   8]                      Address : 0000000000000000

 [10Ch 0268   8]                Hypervisor ID : 00000000554D4551


 Raw Table Data: Length 276 (0x114)

-    0000: 46 41 43 50 14 01 00 00 06 15 42 4F 43 48 53 20  // FACP......BOCHS
+    0000: 46 41 43 50 14 01 00 00 06 12 42 4F 43 48 53 20  // FACP......BOCHS
     0010: 42 58 50 43 20 20 20 20 01 00 00 00 42 58 50 43  // BXPC    ....BXPC
     0020: 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
     0030: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
     0040: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
     0050: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
     0060: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
     0070: 00 00 10 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
-    0080: 00 03 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
+    0080: 00 03 00 03 00 00 00 00 00 00 00 00 00 00 00 00  // ................
     0090: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
     00A0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
     00B0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
     00C0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
     00D0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
     00E0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
     00F0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
     0100: 00 00 00 00 00 00 00 00 00 00 00 00 51 45 4D 55  // ............QEMU
     0110: 00 00 00 00                                      // ....


@@ -1,32 +1,32 @@
 /*
  * Intel ACPI Component Architecture
  * AML/ASL+ Disassembler version 20200925 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/virt/GTDT, Mon Jan 22 13:48:40 2024
+ * Disassembly of /tmp/aml-XDSZH2, Mon Jan 22 13:48:40 2024
  *
  * ACPI Data Table [GTDT]
  *
  * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
  */

 [000h 0000   4]                    Signature : "GTDT"    [Generic Timer Description Table]
-[004h 0004   4]                 Table Length : 00000060
-[008h 0008   1]                     Revision : 02
-[009h 0009   1]                     Checksum : 9C
+[004h 0004   4]                 Table Length : 00000068
+[008h 0008   1]                     Revision : 03
+[009h 0009   1]                     Checksum : 93
 [00Ah 0010   6]                       Oem ID : "BOCHS "
 [010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001

 [024h 0036   8]        Counter Block Address : FFFFFFFFFFFFFFFF
 [02Ch 0044   4]                     Reserved : 00000000

 [030h 0048   4]         Secure EL1 Interrupt : 0000001D
 [034h 0052   4]    EL1 Flags (decoded below) : 00000000
                                 Trigger Mode : 0
                                     Polarity : 0
                                    Always On : 0

 [038h 0056   4]     Non-Secure EL1 Interrupt : 0000001E
@@ -37,25 +37,28 @@

 [040h 0064   4]      Virtual Timer Interrupt : 0000001B
 [044h 0068   4]     VT Flags (decoded below) : 00000000
                                 Trigger Mode : 0
                                     Polarity : 0
                                    Always On : 0

 [048h 0072   4]     Non-Secure EL2 Interrupt : 0000001A
 [04Ch 0076   4]   NEL2 Flags (decoded below) : 00000000
                                 Trigger Mode : 0
                                     Polarity : 0
                                    Always On : 0
 [050h 0080   8]   Counter Read Block Address : FFFFFFFFFFFFFFFF

 [058h 0088   4]         Platform Timer Count : 00000000
 [05Ch 0092   4]        Platform Timer Offset : 00000000
+[060h 0096   4]       Virtual EL2 Timer GSIV : 00000000
+[064h 0100   4]      Virtual EL2 Timer Flags : 00000000

-Raw Table Data: Length 96 (0x60)
+Raw Table Data: Length 104 (0x68)

-    0000: 47 54 44 54 60 00 00 00 02 9C 42 4F 43 48 53 20  // GTDT`.....BOCHS
+    0000: 47 54 44 54 68 00 00 00 03 93 42 4F 43 48 53 20  // GTDTh.....BOCHS
     0010: 42 58 50 43 20 20 20 20 01 00 00 00 42 58 50 43  // BXPC    ....BXPC
     0020: 01 00 00 00 FF FF FF FF FF FF FF FF 00 00 00 00  // ................
     0030: 1D 00 00 00 00 00 00 00 1E 00 00 00 04 00 00 00  // ................
     0040: 1B 00 00 00 00 00 00 00 1A 00 00 00 00 00 00 00  // ................
     0050: FF FF FF FF FF FF FF FF 00 00 00 00 00 00 00 00  // ................
+    0060: 00 00 00 00 00 00 00 00                          // ........

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/qtest/bios-tables-test-allowed-diff.h |   2 --
 tests/data/acpi/virt/FACP                   | Bin 276 -> 276 bytes
 tests/data/acpi/virt/GTDT                   | Bin 96 -> 104 bytes
 3 files changed, 2 deletions(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 7a6d4f80214..dfb8523c8bf 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,3 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/virt/FACP",
-"tests/data/acpi/virt/GTDT",
diff --git a/tests/data/acpi/virt/FACP b/tests/data/acpi/virt/FACP
index ac05c35a69451519bd1152c54d1e741af36390f5..da0c3644cc4536a0a0141603ed470bd11492b678 100644
GIT binary patch
delta 25
gcmbQjG=+)F&CxkPgpq-PO=u!l<;2F$$vli407<0<)c^nh

delta 28
kcmbQjG=+)F&CxkPgpq-PO>`nx<-|!<6Akz$^DuG%0AAS!ssI20

diff --git a/tests/data/acpi/virt/GTDT b/tests/data/acpi/virt/GTDT
index 6f8cb9b8f30b55f4c93fe515982621e3db50feb2..7f330e04d144f9cc22eef06127ecc19abf9e8009 100644
GIT binary patch
delta 25
bcmYeu;BpUf3CUn!U|^m+kt>V?$N&QXMtB4L

delta 16
Xcmc~u;BpUf2}xjJU|^avkt+-UB60)u

-- 
2.34.1

