Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1241447lfb;
        Fri, 10 Sep 2021 07:46:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz+c7oJBpjR0VgJrAzzgAPOqITiOYOpQpuPkeImawTX7Z5gmBmNIlp2jvJePJR7lXJIf7u9
X-Received: by 2002:a7b:c441:: with SMTP id l1mr8419628wmi.69.1631285215181;
        Fri, 10 Sep 2021 07:46:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631285215; cv=none;
        d=google.com; s=arc-20160816;
        b=kqtfnHfSmIef6X6n32F3hLhqMOnzL6VjDYiWIRPtYMYFD4g7C7yD44poNdzh93sW6d
         S7t7sS3EWUfDGVorKvGqQrdhx1P1giW91a/2wjx9grO3oQR9PslDMXFnwpQVPyUB1hYY
         vnI2EzBt4IQNOh0MpPb1yHjGgyqsygWd1eqZFnXDnDr4n54A1O7sAa1JzFVHKPBz0zLZ
         6Sa8/1eX9bAFyWshqajJ5GJYP0fLwvFdqmuX1KQGXzxbLM2bzAGjvd2xHEsaX6wTNuXK
         /n9T1UmbvRKHVJAXCP7nJoVtfKEc4m6tfuavpYSl5BsfuyjTORjL0yW0/RUSA7FO1TH9
         KcWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=nS8mesEcmZKgzshoWZwF/7J6f8xQK7vihPWc8F8kwjI=;
        b=hPfobBx63kv594a6Px+kA8hlkD+tOodxue1tJefhm/PsZ5IKh+NEcSroOw8sQmgRmT
         uSUYx750dKNEE3yhdSP3s5FmRlwUaqEejvmzJDOXTun47j6uJOivgeJFk9A/mFtXEhUi
         pHKs1IEqZVjr263nj118xZ+3+fl/LLancQsjfD7JzWcCorlma9rxtoH79ie4Q/4mzCR/
         RctzSVng/hEhWVEqxx5ZEpz6PkJG2dw1c1k3EzZKswqa5Rf7SKFeO6rseEWVeYd1OP1O
         /uXjCY/wBI6SzsCunyDVZudZlB8m3BNA/mvdaTuul9TyEuxzi3Uz+uok49hdnGPPG8Ey
         6/5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=g+DRF5MK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f20si5002577wrd.145.2021.09.10.07.46.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Sep 2021 07:46:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=g+DRF5MK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mOhnq-0004ix-6v
	for alex.bennee@linaro.org; Fri, 10 Sep 2021 10:46:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1mOhhH-0002Sj-Or
 for qemu-arm@nongnu.org; Fri, 10 Sep 2021 10:40:07 -0400
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731]:37728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1mOhhC-00030Z-Hb
 for qemu-arm@nongnu.org; Fri, 10 Sep 2021 10:40:07 -0400
Received: by mail-qk1-x731.google.com with SMTP id w78so2154886qkb.4
 for <qemu-arm@nongnu.org>; Fri, 10 Sep 2021 07:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nS8mesEcmZKgzshoWZwF/7J6f8xQK7vihPWc8F8kwjI=;
 b=g+DRF5MKiB9UyLo4httOHAdxMfA8E/g6mzXyHeYibGAke7eurwIaNJGRos+2xTxMzT
 nC3mxF9oMecS3tovshCFV2SlFSObeJAHn6hjV0xSy95vfDTP1tKsYKhd5UhTJPCpdN3h
 DUn2fhMA84WgqErg6LFAprxOXj3acUs9L2TL18Vd36bgDyeGM16K9oqI+PpL1Hi9ChSo
 Rkf12ocP3UfSVLBRdqDhdUyRGN8oG1nvwK5mAeraoP8274B5yAD2cRj7wFZ0F+nR2WI1
 nixmZgL6kH9u/1lkxS0GAzUapN7j2a4IW8Oo4FhsxDDjXMI8EKPGxsBAgBQ++xmuUEAl
 Vesw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nS8mesEcmZKgzshoWZwF/7J6f8xQK7vihPWc8F8kwjI=;
 b=j+qZUAT2ssY5AN6uGVYBEmhUwAOmbYufOfKIpz8aXHcp6QTmHI4M6sgf0TJ66EtVqW
 n5q80TPIoVfiYawNYey0n9UjkMqmpkjvjzjLcTPxqLFXznkybS8OrLdacBDlpzZNNmrJ
 VYrZR/3I9YH8dm47yn9lGjHdFDlRokfch3b+JBCloEaqZidluU+P+nMisYnXk7OQreXi
 jXPXTvHq74Y/mzEQaSblWlQTWBOilj1Q2kw0t2eURGiAzMjdtndsovdQsiik5SsXMWca
 2H2EkQu8K1FDjGXZVn3acKGbhIdu8H4bFEDUO0QQhrcqkG30+zIKggmrw1df4GxtoloM
 PNhg==
X-Gm-Message-State: AOAM5323V2Z1DaTSp5FHtbYEzIHAMvNfTC8Z1WEx5SKCURDAqP58RSdG
 ie3BKb3AWpPW1BOeOdhDWQrhEA==
X-Received: by 2002:a37:634d:: with SMTP id x74mr8014024qkb.453.1631284801088; 
 Fri, 10 Sep 2021 07:40:01 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-22-142-114-143-47.dsl.bell.ca. [142.114.143.47])
 by smtp.googlemail.com with ESMTPSA id a9sm3827042qkk.82.2021.09.10.07.40.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 07:40:00 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org, leif@nuviainc.com, rad@semihalf.com,
 mst@redhat.com, imammedo@redhat.com
Subject: [PATCH v9 9/9] tests/data/acpi/virt: Update IORT files for ITS
Date: Fri, 10 Sep 2021 10:39:51 -0400
Message-Id: <20210910143951.92242-10-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210910143951.92242-1-shashi.mallela@linaro.org>
References: <20210910143951.92242-1-shashi.mallela@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::731;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qk1-x731.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: eric.auger@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 narmstrong@baylibre.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: e8P7IlQuKAOi

Updated expected IORT files applicable with latest GICv3
ITS changes.

Full diff of new file disassembly:

/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20180629 (64-bit version)
 * Copyright (c) 2000 - 2018 Intel Corporation
 *
 * Disassembly of tests/data/acpi/virt/IORT.pxb, Tue Jun 29 17:35:38 2021
 *
 * ACPI Data Table [IORT]
 *
 * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
 */

[000h 0000   4]                    Signature : "IORT"    [IO Remapping Table]
[004h 0004   4]                 Table Length : 0000007C
[008h 0008   1]                     Revision : 00
[009h 0009   1]                     Checksum : 07
[00Ah 0010   6]                       Oem ID : "BOCHS "
[010h 0016   8]                 Oem Table ID : "BXPC    "
[018h 0024   4]                 Oem Revision : 00000001
[01Ch 0028   4]              Asl Compiler ID : "BXPC"
[020h 0032   4]        Asl Compiler Revision : 00000001

[024h 0036   4]                   Node Count : 00000002
[028h 0040   4]                  Node Offset : 00000030
[02Ch 0044   4]                     Reserved : 00000000

[030h 0048   1]                         Type : 00
[031h 0049   2]                       Length : 0018
[033h 0051   1]                     Revision : 00
[034h 0052   4]                     Reserved : 00000000
[038h 0056   4]                Mapping Count : 00000000
[03Ch 0060   4]               Mapping Offset : 00000000

[040h 0064   4]                     ItsCount : 00000001
[044h 0068   4]                  Identifiers : 00000000

[048h 0072   1]                         Type : 02
[049h 0073   2]                       Length : 0034
[04Bh 0075   1]                     Revision : 00
[04Ch 0076   4]                     Reserved : 00000000
[050h 0080   4]                Mapping Count : 00000001
[054h 0084   4]               Mapping Offset : 00000020

[058h 0088   8]            Memory Properties : [IORT Memory Access Properties]
[058h 0088   4]              Cache Coherency : 00000001
[05Ch 0092   1]        Hints (decoded below) : 00
                                   Transient : 0
                              Write Allocate : 0
                               Read Allocate : 0
                                    Override : 0
[05Dh 0093   2]                     Reserved : 0000
[05Fh 0095   1] Memory Flags (decoded below) : 03
                                   Coherency : 1
                            Device Attribute : 1
[060h 0096   4]                ATS Attribute : 00000000
[064h 0100   4]           PCI Segment Number : 00000000
[068h 0104   1]            Memory Size Limit : 00
[069h 0105   3]                     Reserved : 000000

[068h 0104   4]                   Input base : 00000000
[06Ch 0108   4]                     ID Count : 0000FFFF
[070h 0112   4]                  Output Base : 00000000
[074h 0116   4]             Output Reference : 00000030
[078h 0120   4]        Flags (decoded below) : 00000000
                              Single Mapping : 0

Raw Table Data: Length 124 (0x7C)

    0000: 49 4F 52 54 7C 00 00 00 00 07 42 4F 43 48 53 20  // IORT|.....BOCHS
    0010: 42 58 50 43 20 20 20 20 01 00 00 00 42 58 50 43  // BXPC    ....BXPC
    0020: 01 00 00 00 02 00 00 00 30 00 00 00 00 00 00 00  // ........0.......
    0030: 00 18 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0040: 01 00 00 00 00 00 00 00 02 34 00 00 00 00 00 00  // .........4......
    0050: 01 00 00 00 20 00 00 00 01 00 00 00 00 00 00 03  // .... ...........
    0060: 00 00 00 00 00 00 00 00 00 00 00 00 FF FF 00 00  // ................
    0070: 00 00 00 00 30 00 00 00 00 00 00 00              // ....0.......

Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
Acked-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/data/acpi/virt/IORT                   | Bin 0 -> 124 bytes
 tests/data/acpi/virt/IORT.memhp             | Bin 0 -> 124 bytes
 tests/data/acpi/virt/IORT.numamem           | Bin 0 -> 124 bytes
 tests/data/acpi/virt/IORT.pxb               | Bin 0 -> 124 bytes
 tests/qtest/bios-tables-test-allowed-diff.h |   4 ----
 5 files changed, 4 deletions(-)

diff --git a/tests/data/acpi/virt/IORT b/tests/data/acpi/virt/IORT
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..521acefe9ba66706c5607321a82d330586f3f280 100644
GIT binary patch
literal 124
zcmebD4+^Pa00MR=e`k+i1*eDrX9XZ&1PX!JAesq?4S*O7Bw!2(4Uz`|CKCt^;wu0#
QRGb+i3L*dhhtM#y0PN=p0RR91

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/virt/IORT.memhp b/tests/data/acpi/virt/IORT.memhp
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..521acefe9ba66706c5607321a82d330586f3f280 100644
GIT binary patch
literal 124
zcmebD4+^Pa00MR=e`k+i1*eDrX9XZ&1PX!JAesq?4S*O7Bw!2(4Uz`|CKCt^;wu0#
QRGb+i3L*dhhtM#y0PN=p0RR91

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/virt/IORT.numamem b/tests/data/acpi/virt/IORT.numamem
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..521acefe9ba66706c5607321a82d330586f3f280 100644
GIT binary patch
literal 124
zcmebD4+^Pa00MR=e`k+i1*eDrX9XZ&1PX!JAesq?4S*O7Bw!2(4Uz`|CKCt^;wu0#
QRGb+i3L*dhhtM#y0PN=p0RR91

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/virt/IORT.pxb b/tests/data/acpi/virt/IORT.pxb
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..521acefe9ba66706c5607321a82d330586f3f280 100644
GIT binary patch
literal 124
zcmebD4+^Pa00MR=e`k+i1*eDrX9XZ&1PX!JAesq?4S*O7Bw!2(4Uz`|CKCt^;wu0#
QRGb+i3L*dhhtM#y0PN=p0RR91

literal 0
HcmV?d00001

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 2ef211df59..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,5 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/virt/IORT",
-"tests/data/acpi/virt/IORT.memhp",
-"tests/data/acpi/virt/IORT.numamem",
-"tests/data/acpi/virt/IORT.pxb",
-- 
2.27.0

