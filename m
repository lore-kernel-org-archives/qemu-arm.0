Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3022530lfm;
        Mon, 29 Jun 2020 07:10:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzeOyLI6XZ1W/wVebxxrPDF8DXDrGGKoAEQJp0Gd39zG8KG2ljLytA/oGRjZhY2qczyP6C4
X-Received: by 2002:a25:d297:: with SMTP id j145mr27189575ybg.18.1593439833220;
        Mon, 29 Jun 2020 07:10:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593439833; cv=none;
        d=google.com; s=arc-20160816;
        b=EF0kgLTLFBJ0JTrjj0QflLO9lnxaW+iJAxwajWGpOZ8gkxHDp13TPQ5/Wa1eaozy0g
         jBsX3cr22aPzRJZpdm9MMocq23WcBzrTjDfnjNAUaCC0b0ls7ee1V2gLhp/hSPpk3qMh
         i1x3y9Q/NfaJWGzCxM7R006QUfyEKjHC+OUdg9WRVHS2UOc9o/kAV9Fs1CzB/i94qmDb
         ipUIhDqYZQKF0aXLHPfmzLuhc7yMflqYLLiTwSiACUX/+f68U1lZg8gcIu0tx84nYMo/
         0p8MjLebimYtj+YXZz2i4ekhRc5nxpMAe+nSLsPLoXvj72ytNt5baAarPKeW4tTWKA0i
         5pCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=eNE3MkKaseCT8/0eX+0186Xb4pQxbDpNoqSR+57Jmso=;
        b=otoibcoC/ZekVaN0NfH32yBtDnBO+PvzosNncNXOt4ViTnH3CBJay6n16wFDPJB7Uo
         IuP7ayGn5GkzZLzI3ECcieW5WKw32D6/S2VSowZH1JjGVADnB+wRLoGIlwKjdLu/rwmC
         KXR4Z9Bgdpd0sfB6r2thhd+SbNvMRuErl2NuwwNOdIhJyLnyRRe6kEPVnhzESmdrxKGa
         UH1H0vWd/iyL5OTtXf5Eg/IsFkDgeliwNzzicWaDMsJJbZuxDaSYFSwv+AAWUkjOlrxC
         805/kHAVs5x/wvsXZkUD+53P4g83zlSznnpLYSGB46kGbILpxi8oSaQQKUIzicqXx3rQ
         bJmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=C1RSe++S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q187si10209728ybq.232.2020.06.29.07.10.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Jun 2020 07:10:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=C1RSe++S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jpuUS-0006V5-Hr
	for alex.bennee@linaro.org; Mon, 29 Jun 2020 10:10:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1jpuUH-0006TL-Sg
 for qemu-arm@nongnu.org; Mon, 29 Jun 2020 10:10:21 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:34305
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1jpuUG-0004h5-8R
 for qemu-arm@nongnu.org; Mon, 29 Jun 2020 10:10:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593439819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eNE3MkKaseCT8/0eX+0186Xb4pQxbDpNoqSR+57Jmso=;
 b=C1RSe++S9pPWTT/TPzQSYGH9qD9227zwvzg9sznn4xOs9p5KJ803rLuRcouPOr+dQQliqP
 S0B3CtBGItPhgsm2JimstKoiF1gYlt7GbUbDmbFvPTBDWSOD9P/ltOYKVWn/5GrwYf4o8k
 wPAuPWNtWmz3DPkf6Ij0s5H8JeewcMA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-121-5RXyVSw0Opu53x6VA9XP5w-1; Mon, 29 Jun 2020 10:10:09 -0400
X-MC-Unique: 5RXyVSw0Opu53x6VA9XP5w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 87F738015F6;
 Mon, 29 Jun 2020 14:10:08 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.195.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D23961A888;
 Mon, 29 Jun 2020 14:09:58 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH 4/4] tests/acpi: virt: update golden masters for DSDT
Date: Mon, 29 Jun 2020 16:09:38 +0200
Message-Id: <20200629140938.17566-5-drjones@redhat.com>
In-Reply-To: <20200629140938.17566-1-drjones@redhat.com>
References: <20200629140938.17566-1-drjones@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=drjones@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/29 01:37:37
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, mst@redhat.com, philmd@redhat.com,
 shannon.zhaosl@gmail.com, ard.biesheuvel@arm.com, imammedo@redhat.com,
 lersek@redhat.com, eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NAr9BvGnPS/S

Differences between disassembled ASL files for DSDT:

@@ -5,13 +5,13 @@
  *
  * Disassembling to symbolic ASL+ operators
  *
- * Disassembly of a, Mon Jun 29 09:50:01 2020
+ * Disassembly of b, Mon Jun 29 09:50:03 2020
  *
  * Original Table Header:
  *     Signature        "DSDT"
- *     Length           0x000014BB (5307)
+ *     Length           0x00001455 (5205)
  *     Revision         0x02
- *     Checksum         0xD1
+ *     Checksum         0xE1
  *     OEM ID           "BOCHS "
  *     OEM Table ID     "BXPCDSDT"
  *     OEM Revision     0x00000001 (1)
@@ -45,32 +45,6 @@
             })
         }

-        Device (FLS0)
-        {
-            Name (_HID, "LNRO0015")  // _HID: Hardware ID
-            Name (_UID, Zero)  // _UID: Unique ID
-            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
-            {
-                Memory32Fixed (ReadWrite,
-                    0x00000000,         // Address Base
-                    0x04000000,         // Address Length
-                    )
-            })
-        }
-
-        Device (FLS1)
-        {
-            Name (_HID, "LNRO0015")  // _HID: Hardware ID
-            Name (_UID, One)  // _UID: Unique ID
-            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
-            {
-                Memory32Fixed (ReadWrite,
-                    0x04000000,         // Address Base
-                    0x04000000,         // Address Length
-                    )
-            })
-        }
-
         Device (FWCF)
         {
             Name (_HID, "QEMU0002")  // _HID: Hardware ID

The other two binaries have the same changes (the removal of the
flash devices).

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 tests/data/acpi/virt/DSDT                   | Bin 5307 -> 5205 bytes
 tests/data/acpi/virt/DSDT.memhp             | Bin 6668 -> 6566 bytes
 tests/data/acpi/virt/DSDT.numamem           | Bin 5307 -> 5205 bytes
 tests/qtest/bios-tables-test-allowed-diff.h |   3 ---
 4 files changed, 3 deletions(-)

diff --git a/tests/data/acpi/virt/DSDT b/tests/data/acpi/virt/DSDT
index d6f5c617881c4247f55d4dcd06581f9693916b2f..e669508d175f1e3ddf355f8a9b0d419266cac8aa 100644
GIT binary patch
delta 28
kcmdn3c~yhUCD<h-RD^+n>ET2!X{H9}iRuX(-<}f&0DgxFc>n+a

delta 156
zcmcbrv0IbNCD<iow+I6R)5VEg(oAih6V(&y4c&Z#4LIUGJY9Hw{DS-q3=B;fIO0P+
zU4W!>P_UpN7hfAE10w?juv9WcH-WSmV$;Hiu7w4t3#`S$E!^1+q9xGPH`KtuzzAr5
LaERl^1zUvy_;n(J

diff --git a/tests/data/acpi/virt/DSDT.memhp b/tests/data/acpi/virt/DSDT.memhp
index 730e95a46d2cce0af011ffc051d7342beb8f1328..4cb81f692d73526542493a0c4da9c9793cc8366e 100644
GIT binary patch
delta 28
kcmeA%S!T@T66_MPOp<|tiD@F2G*jb@iRuX(-^xn@0CHUjRR910

delta 156
zcmZ2x++)J!66_MfBgMeL^l>7WG*kP$iRuaUhHgH=1|0Doo-VvTenI{Q28N~#9Py!^
zE<n;bC|FRCi?5B7fsp|MSSlH!n?PC&v1wsM*TMqS1=eEW7Vhi@(GuwD8){%+U<5Qj
LIK*+|0yaqism~!^

diff --git a/tests/data/acpi/virt/DSDT.numamem b/tests/data/acpi/virt/DSDT.numamem
index d6f5c617881c4247f55d4dcd06581f9693916b2f..e669508d175f1e3ddf355f8a9b0d419266cac8aa 100644
GIT binary patch
delta 28
kcmdn3c~yhUCD<h-RD^+n>ET2!X{H9}iRuX(-<}f&0DgxFc>n+a

delta 156
zcmcbrv0IbNCD<iow+I6R)5VEg(oAih6V(&y4c&Z#4LIUGJY9Hw{DS-q3=B;fIO0P+
zU4W!>P_UpN7hfAE10w?juv9WcH-WSmV$;Hiu7w4t3#`S$E!^1+q9xGPH`KtuzzAr5
LaERl^1zUvy_;n(J

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 32a401ae35fa..dfb8523c8bf4 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,4 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/virt/DSDT",
-"tests/data/acpi/virt/DSDT.memhp",
-"tests/data/acpi/virt/DSDT.numamem",
-- 
2.25.4

