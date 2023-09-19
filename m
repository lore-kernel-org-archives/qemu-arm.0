Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp3490517ejb;
        Tue, 19 Sep 2023 03:14:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYmmxobShAptiH2G9Av4ExuQdOQtjUnHm09xhGFzYJQQeVbV6TnpRDbWMHc000T8Cn0oJ/
X-Received: by 2002:a67:f850:0:b0:44e:96aa:e445 with SMTP id b16-20020a67f850000000b0044e96aae445mr6879556vsp.29.1695118440106;
        Tue, 19 Sep 2023 03:14:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695118440; cv=none;
        d=google.com; s=arc-20160816;
        b=0hSZ9B4puCXdKNR9gMNLrAwbXKsrj6Nm5//BELXWPgIvZEAgrvwthJle1wBEv6RqFp
         ULQPorRcGV7y28m7WOK+ibdMFcwF28fAikwtT99bsCpOYVYe+reCW5DDkPQkkuNvi7+d
         xEP3HXi3cF6EOx7GN3uv+y4MaYCtX1ypqZSKq9wGaX/U3lWEdcxvYEUMEyfkwKcaGIlF
         fYiGWZ+9vTWfxtgFs21e2MlteITv5boe5zY4B+8JsmNKgR4zl6YCkQ8p/Oqv+QaYBGJE
         9zJNHAtwBSn8CEFXzyIxX6XkWU68BfB01bblZ7xuNnZyL9tZaewiMrc/lBbyTvOfvBxn
         C2aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=fkfSZkeHjzHFpYeTpLpvbhlV8kGEAEr7KKI6rYw3cRY=;
        fh=VnLaRVPcN1gpaQWLnE0jAsSHd7/auwbL0WCytLamgZU=;
        b=ANjvZYqSo+oM81FyfK9KPRC3WFLwAn1lnSUNHyfA2FNRX6401Vx1xC6fyZMQqOMwf6
         cKNwu4+E5KaE8uoJo9afwkllEqD4CK+/C8UcgKvNi2s8x6+cn1RcbRdtSfRkgpTNckrD
         W8Vv5kFqMJwCtjL2SD0Snp/cdm+Qr3SFHX0Wb1DjF9cTtcdCkmBKeCSBt0t+3jwN3fwG
         xbFUlRBuuQY54MBctDgg3QphhBSExO/OFNIlznBuITwBhvRIKdRa4dA+9Kx5iBnXl5JG
         2t4JDpI577jL4sTB9dc+RtMg0WO6PbKob4mXGazMXpCpw7UnmcWmxUGLgmSmnw4vWa61
         LF3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MxGlLQbO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u14-20020a0cdd0e000000b0064f55373b9bsi3726830qvk.585.2023.09.19.03.13.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Sep 2023 03:14:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MxGlLQbO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qiXiz-0003Jy-9K; Tue, 19 Sep 2023 06:12:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qiXit-0003GN-5S
 for qemu-devel@nongnu.org; Tue, 19 Sep 2023 06:12:52 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qiXiq-0005M6-NX
 for qemu-devel@nongnu.org; Tue, 19 Sep 2023 06:12:50 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3214cdb4b27so1970443f8f.1
 for <qemu-devel@nongnu.org>; Tue, 19 Sep 2023 03:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695118364; x=1695723164; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fkfSZkeHjzHFpYeTpLpvbhlV8kGEAEr7KKI6rYw3cRY=;
 b=MxGlLQbOF2OjfYJOxLQY8v7xYP7d5ZUsEd6RqGyuN2JTyYy33NqeDtiVqRpyPJRbBa
 A0Xr22/+tgaagCQHb0gngkxPVud7zRxcTu6aZ9tyo52kdgZYISIdbRkjejxR5TVisC4h
 6wkB/WjfBWoaxaFNqca0AEmszNpUPCh4wGMJOb4uxvRp/MhHmA7w2479+zilHgSHaHRf
 UITqkWl3troby2Jc1XXiEAf2WLlSsB7jpy8e93RH/bG9Bae6YLECflRWuxUpeh6cEoyO
 FBTV6QEmQoA1JQaPHrT+eKwjkI4N5+WnjC5hp8/GoWBVI2FbMfKeHW0/l2uLVMP7/YTV
 9UGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695118364; x=1695723164;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fkfSZkeHjzHFpYeTpLpvbhlV8kGEAEr7KKI6rYw3cRY=;
 b=iF9C3c+skIHNAnE8tYGbwnCcy0bw/UoVIe3/nQ3aKrJNSDf+aAn9FeFueYJG+Vuq/A
 U7OnBoKIkA4e1Tj19CIdIGvqnjUvSdwAPwSyBgw+2hgmd5ZyB6Xlm4jjq1MrZlAoGzbX
 KeRyKCMG9Ni52wIIrG/F3qkPjdwHcFe3GabS01Z8yGzMT50YtM7HtgxhDZT57KRVUEnJ
 n5R2Ah5VjKGODVsklz7BqmZTUymL9Wu2JnrBKZGkWv5go14V22GoOA/+Po8JLeqfo0DL
 Wg5x4f+tGp4Z2f8jEPs0nTZD0bSzM5k0qq0cK1hoR817XtYYE7Hgf4OhunpPeD12q3E3
 kb3Q==
X-Gm-Message-State: AOJu0YzklXRONY2V5KgyIYQt79WYdaExxGNh6GQ31/f88XUMUO6uXlFj
 hjSQVS56fcT18a5g6wmK6I48Kg==
X-Received: by 2002:adf:f9c2:0:b0:319:82c9:8e7d with SMTP id
 w2-20020adff9c2000000b0031982c98e7dmr8745698wrr.31.1695118364518; 
 Tue, 19 Sep 2023 03:12:44 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ba13-20020a0560001c0d00b0031ddf6cc89csm12290136wrb.98.2023.09.19.03.12.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Sep 2023 03:12:44 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Leif Lindholm <quic_llindhol@quicinc.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Ard Biesheuvel <ardb@kernel.org>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>
Subject: [RFC 3/3] tests/qtest/bios-tables-test: Update virt/GTDT golden
 reference
Date: Tue, 19 Sep 2023 11:12:40 +0100
Message-Id: <20230919101240.2569334-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230919101240.2569334-1-peter.maydell@linaro.org>
References: <20230919101240.2569334-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: p7VtWb/W7psF

Update the virt/GTDT golden reference file to be a
revision 3 table with space for the virtual EL2 timer.

Diffs from iasl:

@@ -1,32 +1,32 @@
 /*
  * Intel ACPI Component Architecture
  * AML/ASL+ Disassembler version 20200925 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
- * Disassembly of tests/data/acpi/virt/GTDT, Mon Sep 18 16:19:17 2023
+ * Disassembly of /tmp/aml-PXK8A2, Mon Sep 18 16:19:17 2023
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
 tests/qtest/bios-tables-test-allowed-diff.h |   1 -
 tests/data/acpi/virt/GTDT                   | Bin 96 -> 104 bytes
 2 files changed, 1 deletion(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index bcf131fc160..dfb8523c8bf 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,2 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/virt/GTDT",
diff --git a/tests/data/acpi/virt/GTDT b/tests/data/acpi/virt/GTDT
index 6f8cb9b8f30b55f4c93fe515982621e3db50feb2..7f330e04d144f9cc22eef06127ecc19abf9e8009 100644
GIT binary patch
delta 25
bcmYeu;BpUf3CUn!U|^m+kt>V?$N&QXMtB4L

delta 16
Xcmc~u;BpUf2}xjJU|^avkt+-UB60)u

-- 
2.34.1

