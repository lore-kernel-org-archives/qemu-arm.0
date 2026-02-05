Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E98BFE9129A
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Feb 2026 15:12:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vo11u-0001tO-Sj; Thu, 05 Feb 2026 10:12:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vo11t-0001sn-2Q
 for qemu-arm@nongnu.org; Thu, 05 Feb 2026 10:12:25 -0500
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vo11q-0008Jl-1g
 for qemu-arm@nongnu.org; Thu, 05 Feb 2026 10:12:23 -0500
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-79518cc2bb4so7830887b3.0
 for <qemu-arm@nongnu.org>; Thu, 05 Feb 2026 07:12:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770304340; cv=none;
 d=google.com; s=arc-20240605;
 b=Ck7FNyoEqpP6oIIQ3VwJ/KX212dLVAQPHfhjGSElbM23gBMMouZFAJtO6rezHPgdwt
 hEjhRNY23mxb8xSqJqwcnV/8CBWC7CFJ8kSXrhsX80vf6tvzGX3CE8Sn0+7nVan9P7bz
 eONVsYM9srZN8mWjhqoXRMaRUgRCByjH5aOVyUr73jVrQpv/YaFx+VnnV/aiqQ0vKEfx
 YlCwSNN8ZDBLaHlr0ocMttg6a93EqKSKOjsKhe4ZrrucvZ0lxbStqvqulf6mUGuMssFP
 g0JMKwntCinzWG0WFvAmQVXmwMpKAji437Aau/JtemljVC0+jeukV+iNq6rWwyAiBMdL
 ZbCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=cI5NC2Kni0Acuyjg8ldXu0EkyNdRKFpDNc/CvQJcYCs=;
 fh=0RpKF94qJZ8/9pQRIGB1MwZDtF1l9zZL/gtrgFkA2NI=;
 b=YJmG4cwrxt6+zvJAYZuC3hAQMyRgwmfa1fO2x703WGgXJGyO0YqNSiQbDD0lAJYDOx
 MmETWjisw+aSDHFzDdV1q+SPYDVL2DKlWagQK9UBrHl6NG3749FCjasxbBa20rf79GeY
 9E0tOxRQggw90gMj/wyKEQDBvfCu5AP96H0ZAfJikeO52hJMoiW9sOK/OJqqMMgYM/zm
 veV9uWK4U3M8uwRpA2IZeQ7Cc+XQzyRMdgevYImMHfDAYVEbj9cVO7g5xzMja4E1k29z
 Vgx5TVT4ciNawZcsK8IroVR3QcdKsq8b3TQlmohlWKfBfP0aWXWHyw64AavS9FKp8oWz
 YWPQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770304340; x=1770909140; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cI5NC2Kni0Acuyjg8ldXu0EkyNdRKFpDNc/CvQJcYCs=;
 b=XqRMGjB+crwZdbNWj44my0EqYRaUj4lqbwf8ewiiaXSocz4x3o/KngkmrZ8Fubpohn
 zhn28jS7pRFuc+0xaeGAW5/otl511svy5V/MNsTcCy/wwdTkVNV45Zbe/itqK2zAS9fe
 qzXcdmf3jFkQ8u5Y/0AN7fa2ccGLOrh1cCXKotTgzMQ9Ebc+HZrcLTCpYKqPlwJTQO5d
 UXl2uF1V1Mf3nx2hkKqOSsauaI3cY6Ojyv13/aOFcZLXXrnYuT8kngF3CVhlmumKofps
 R/wJRcjvzTNAhcV44FpIg4+0MwvffNx6pXPnbb50SVgtY0rHVYZFm6mJY5I5G/4c/94b
 ZYCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770304340; x=1770909140;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cI5NC2Kni0Acuyjg8ldXu0EkyNdRKFpDNc/CvQJcYCs=;
 b=krLRNGxztOXHd4SF8fwJdxvXwwL9M7yb6LYUHKhSEFCI/tCzVAC6Azg3HZqaItjLBL
 NevWERdp4qJLJNqy7dmFwjj6RivsHTk6q3EQnmX5m0ien9zmvitGr5XKANkbRrvrY1Ae
 8daxtFxhhzdR7rc6a5H7XoYVirzh0k6sjdUndfiGV5uPgMZc++1qlYRyg9K6xvEepsPv
 UY936ZwEkZlwmlq9kNBEPoO49vyv9vEtgFm6dYXljEcjiF3NXHQ2soTZwJaLEGpkBnEM
 LAXcHz2KdP2zhKWOqaCf/U4TAfwwqsnIjQIvLlo1yYc8ydfXoqNfzGjJgMJLtH/fpygZ
 3Tcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHMLZ+6Lsp11yL0heppbXdTjS3m5UW8gN/89HVzRu+nvxciHWwH7L77+vfAzykiYX6x1OgH07vew==@nongnu.org
X-Gm-Message-State: AOJu0YxU1CZj85SjZ3fnVtOIV57zQlFl2idGSGwF+ZDR/SQJambzHKB1
 FI4FDXi2o4AuoB7Y0bagwoqeJ8YKQNtsIOfS7npAhaDKcL7gcjQ2ad7rsGei4N77Fn/20QxRm1r
 dqP0dZ0Q3iPb6UyK8WYa7lk0O8wHz8BDdF1eEB/FmIA==
X-Gm-Gg: AZuq6aIE47EQenEijFH+ZjuQOX7gCk175z6DcBxXxBCHouvOW8oA+Jeo9CiltbJes8y
 Tcfo68p2wkf/0ybaOHWNq0B4hb6vSBCbSi1HOJAeu0R3UNmG0DmrI5V5klBi7cPqinjOsD9qutR
 Gpo8cqVNdmtriGzoe8rvQEd+7c3mGo7r8Ezy42B/t8RaTo8a/GM/KI+ZlnCJhiVaT0yxN19zriX
 lNpcPmR27rUl7kkOJLnUD/tB01pWRDgw0VNFSqiCAlU4nV9H3gbT6GUKyaLTG1jBlyI6A==
X-Received: by 2002:a81:ff0b:0:b0:794:bb73:8a21 with SMTP id
 00721157ae682-794fe827fefmr52744707b3.44.1770304340331; Thu, 05 Feb 2026
 07:12:20 -0800 (PST)
MIME-Version: 1.0
References: <20260205142543.64818-1-mohamed@unpredictable.fr>
In-Reply-To: <20260205142543.64818-1-mohamed@unpredictable.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Feb 2026 15:12:09 +0000
X-Gm-Features: AZwV_QhwFyo4wHrNORTLssMnbNCUomQiKMUWT5MqIB1AmVdnA0_X464o8jydLXE
Message-ID: <CAFEAcA9pBwSJ6PFM0qOJWau7H0sDY5Rk5NKg8OgTxr+fgOvFsw@mail.gmail.com>
Subject: Re: [PATCH v21 00/22] WHPX support for Arm
To: Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: qemu-devel@nongnu.org, Zhao Liu <zhao1.liu@intel.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>, 
 Cameron Esfahani <dirty@apple.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Phil Dennis-Jordan <phil@philjordan.eu>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Alexander Graf <agraf@csgraf.de>, Pedro Barbuda <pbarbuda@microsoft.com>, 
 Yanan Wang <wangyanan55@huawei.com>, Ani Sinha <anisinha@redhat.com>, 
 Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Eduardo Habkost <eduardo@habkost.net>, Roman Bolshakov <rbolshakov@ddn.com>, 
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Thu, 5 Feb 2026 at 14:25, Mohamed Mediouni <mohamed@unpredictable.fr> wrote:
>
> Link to branch: https://github.com/mediouni-m/qemu whpx (tag for this submission: whpx-v21)
>
> Patches without a review: patches 3, 5, 6, 7

Thanks for the respin; this one applies, but fails "make check"
on the aarch64/acpi/virt/msi_gicv2m subtest of the bios-tables-test:

lanath:noble:qemu$ (cd build/arm-clang &&
QTEST_QEMU_BINARY=./qemu-system-aarch64 V=1
./tests/qtest/bios-tables-test --verbose -p
/aarch64/acpi/virt/msi_gicv2m)
TAP version 13
# random seed: R02Sd03fb0e0b32d3a49a936bee40a272caa
# starting QEMU: exec ./qemu-system-aarch64 -qtest
unix:/tmp/qtest-2950429.sock -qtest-log /dev/null -chardev
socket,path=/tmp/qtest-2950429.qmp,id=char0 -mon
chardev=char0,mode=control -display none -audio none -run-with
exit-with-parent=on -machine none -accel qtest
# starting QEMU: exec ./qemu-system-aarch64 -qtest
unix:/tmp/qtest-2950429.sock -qtest-log /dev/null -chardev
socket,path=/tmp/qtest-2950429.qmp,id=char0 -mon
chardev=char0,mode=control -display none -audio none -run-with
exit-with-parent=on -machine none -accel qtest
# Start of aarch64 tests
# Start of acpi tests
# Start of virt tests
acpi-test: Warning! IORT binary file mismatch. Actual
[aml:/tmp/aml-VKZEK3], Expected
[aml:tests/data/acpi/aarch64/virt/IORT.msi_gicv2m].
See source file tests/qtest/bios-tables-test.c for instructions on how
to update expected files.
acpi-test: Warning! IORT mismatch. Actual [asl:/tmp/asl-RLZEK3.dsl,
aml:/tmp/aml-VKZEK3], Expected [asl:/tmp/asl-F40EK3.dsl,
aml:tests/data/acpi/aarch64/virt/IORT.msi_gicv2m].
--- /tmp/asl-F40EK3.dsl 2026-02-05 15:10:08.823721717 +0000
+++ /tmp/asl-RLZEK3.dsl 2026-02-05 15:10:08.821977596 +0000
@@ -1,32 +1,32 @@
 /*
  * Intel ACPI Component Architecture
  * AML/ASL+ Disassembler version 20230628 (64-bit version)
  * Copyright (c) 2000 - 2023 Intel Corporation
  *
- * Disassembly of tests/data/acpi/aarch64/virt/IORT.msi_gicv2m, Thu
Feb  5 15:10:08 2026
+ * Disassembly of /tmp/aml-VKZEK3, Thu Feb  5 15:10:08 2026
  *
  * ACPI Data Table [IORT]
  *
  * Format: [HexOffset DecimalOffset ByteLength]  FieldName :
FieldValue (in hex)
  */

 [000h 0000 004h]                   Signature : "IORT"    [IO Remapping Table]
 [004h 0004 004h]                Table Length : 000000AC
-[008h 0008 001h]                    Revision : 03
-[009h 0009 001h]                    Checksum : 97
+[008h 0008 001h]                    Revision : 05
+[009h 0009 001h]                    Checksum : 95
 [00Ah 0010 006h]                      Oem ID : "BOCHS "
 [010h 0016 008h]                Oem Table ID : "BXPC    "
 [018h 0024 004h]                Oem Revision : 00000001
 [01Ch 0028 004h]             Asl Compiler ID : "BXPC"
 [020h 0032 004h]       Asl Compiler Revision : 00000001

 [024h 0036 004h]                  Node Count : 00000002
 [028h 0040 004h]                 Node Offset : 00000030
 [02Ch 0044 004h]                    Reserved : 00000000

 [030h 0048 001h]                        Type : 04
 [031h 0049 002h]                      Length : 0044
 [033h 0051 001h]                    Revision : 04
 [034h 0052 004h]                  Identifier : 00000000
 [038h 0056 004h]               Mapping Count : 00000000
 [03Ch 0060 004h]              Mapping Offset : 00000000
@@ -67,27 +67,27 @@
                             Device Attribute : 1
 [08Ch 0140 004h]               ATS Attribute : 00000000
 [090h 0144 004h]          PCI Segment Number : 00000000
 [094h 0148 001h]           Memory Size Limit : 40
 [095h 0149 002h]          PASID Capabilities : 0000
 [097h 0151 001h]                    Reserved : 00

 [098h 0152 004h]                  Input base : 00000000
 [09Ch 0156 004h]                    ID Count : 000000FF
 [0A0h 0160 004h]                 Output Base : 00000000
 [0A4h 0164 004h]            Output Reference : 00000030
 [0A8h 0168 004h]       Flags (decoded below) : 00000000
                               Single Mapping : 0

-    0000: 49 4F 52 54 AC 00 00 00 03 97 42 4F 43 48 53 20  // IORT......BOCHS
+    0000: 49 4F 52 54 AC 00 00 00 05 95 42 4F 43 48 53 20  // IORT......BOCHS
     0010: 42 58 50 43 20 20 20 20 01 00 00 00 42 58 50 43  // BXPC    ....BXPC
     0020: 01 00 00 00 02 00 00 00 30 00 00 00 00 00 00 00  // ........0.......
     0030: 04 44 00 04 00 00 00 00 00 00 00 00 00 00 00 00  // .D..............
     0040: 00 00 05 09 00 00 00 00 01 00 00 00 00 00 00 00  // ................
     0050: 00 00 00 00 00 00 00 00 00 00 00 00 6A 00 00 00  // ............j...
     0060: 6B 00 00 00 6D 00 00 00 6C 00 00 00 00 00 00 00  // k...m...l.......
     0070: 00 00 00 00 02 38 00 03 01 00 00 00 01 00 00 00  // .....8..........
     0080: 24 00 00 00 01 00 00 00 00 00 00 03 00 00 00 00  // $...............
     0090: 00 00 00 00 40 00 00 00 00 00 00 00 FF 00 00 00  // ....@...........
     00A0: 00 00 00 00 30 00 00 00 00 00 00 00              // ....0.......
**
ERROR:../../tests/qtest/bios-tables-test.c:555:test_acpi_asl:
assertion failed: (all_tables_match)
not ok /aarch64/acpi/virt/msi_gicv2m -
ERROR:../../tests/qtest/bios-tables-test.c:555:test_acpi_asl:
assertion failed: (all_tables_match)
Bail out!
Aborted (core dumped)


thanks
-- PMM

