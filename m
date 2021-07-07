Received: by 2002:ac2:5485:0:0:0:0:0 with SMTP id t5csp2929376lfk;
        Wed, 7 Jul 2021 01:59:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz5snfMbE+8RzeJG3V+j1E4gfNKy+VvJxVF8kWiwF0wchWVrDLDw+ljSSTPj2VipGYjgZjM
X-Received: by 2002:a25:b3c8:: with SMTP id x8mr30801506ybf.466.1625648351497;
        Wed, 07 Jul 2021 01:59:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625648351; cv=none;
        d=google.com; s=arc-20160816;
        b=yMHZ7cieTktB96/uFlpI1bs2bwaC+7XI6MJECaM251i/KsKsa2pYBsmW7IQRyynh6h
         IbADTB+QIaJFrFMpnwMMzcFBrFsM6Q4pooSfdUYIArkPVycNDybKIuiYbx7AYceZgd45
         GsLajtwj/aXnlZvTzlAbxKB+8tYjPvhO9H3mbnibukSjdKbyExLh6wiYerlS9KN9null
         0lBzTlzfWUHuc8sLtcPUlCtyMbCtY+s+P5oiZb+mBclrvJk3eU1GSTl/C/HmP9aPFC0D
         qi7kiTuX9P003taGWgKKr9cSxLa2OnNSW5imlZ0IIaSz2wPUNP/VRIAVNi21xMjC58A6
         E+6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=mdr47SYEb4XwzmWuDW170BuCPGspsoVPn7BPSWQRkPc=;
        b=pnelSeWIx1OhxqP9V4zsJVSPxO16wKrfjp62aZaS1iIK/OPFoP/lLhqyTotx+Ykb+I
         U+PbvTu7mTq3PgLkSN7gR/9wJMu0QSbO5Ko5jjhhwoiZNv68EvkE+IimIv8pmive4XDR
         Ujc7al5AMidu040FEXf3lXmAsXVvJw56MGSIh4Xh7dePfxKokkAIqziGRLnD6Fgv0z4N
         QIK3ac+MA/BUhOZR+LXdmHzjQc0ieJvZDQEWDIAP2O30PUS7W4uJlK0nlfKrPuKW42iX
         dtRHBgcS9MavMpl7B1CbKbNZGBAENbdzwyOGprvtrm09uGHmsne6eNmYQOvyx0a81fx8
         G4ww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZnLdq1Fh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x1si17016755ybn.274.2021.07.07.01.59.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Jul 2021 01:59:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZnLdq1Fh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:37922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m13Og-00026D-S6
	for alex.bennee@linaro.org; Wed, 07 Jul 2021 04:59:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1m10j2-000146-6y; Wed, 07 Jul 2021 02:08:00 -0400
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335]:45757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1m10j0-00023s-2p; Wed, 07 Jul 2021 02:07:59 -0400
Received: by mail-ot1-x335.google.com with SMTP id
 75-20020a9d08510000b02904acfe6bcccaso1188963oty.12; 
 Tue, 06 Jul 2021 23:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=mdr47SYEb4XwzmWuDW170BuCPGspsoVPn7BPSWQRkPc=;
 b=ZnLdq1FhwZDrH4CWH8KCsiP5PtFdF70s2bgqyySZHtBLnaKp+kilkA5N5sezDlScaA
 fjAPjQRyg6FYilWxuZ3VgFsvQZkUbPXerV/6bb+vk8dA7ds4HTFzlrhVbN1cVwYoQjid
 mJexdGicuM/PFMUs+nbIj+1qfRdZIxj9i/5gLLzMoSWZoHPDNHPB3xOMh2d3Q/s+ZBF2
 dUIdo8jhtIp1TGnSUC7ZiJTSdYzhogOgZUREw+bI9muRxfTmwKZSMMTakwSL/2rObsIj
 x9Zs+ys5Q4gUqAKKny3Cj2Woe6hcB0YcE/+HdKclVvhjawvJsLcYr+Sbd/KnZA7blXPm
 GcjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=mdr47SYEb4XwzmWuDW170BuCPGspsoVPn7BPSWQRkPc=;
 b=BhgqJindRF+bfIV8RG15SUNIZpb/elP3wmP1dnJgZEvcSXKbD2gOgwip1ymJ3kn2Np
 bR5Mw7ZlkZ/VdfLcACobHUM7eCJQWDjCm/vlGCAqkwcIUa9nZax5gt4u60tIgEQ47Pjx
 yts04xy2U1qrhafiNBz5sZ2oXorRdOGcPpW94nyAWXTSD8qEiKY8zgg+hfQ3b5MGzSZL
 t+t6GUdHp3On6MLn0IkPpvMDl6b1Mif/uWQN4Oj35HcMv/RP+31ncH2/ekdC0+PW9eOP
 POvI6ksZDOZDuhNeId4rhtCEGVWI7N3/QqYO3qAUyGVe3uiDQEbDrcaCcivEQlNgwSE0
 cl8Q==
X-Gm-Message-State: AOAM532UETf0bM+Dijbai4u+cvvMPjMTj8kLCyWVAaPQZFMJBYDf/O+j
 rlm/YB1tU/x4fXMPvJ8HSrAVShZxFHyz8sQItatai+JTjUw/fscaU5g=
X-Received: by 2002:a05:6830:1101:: with SMTP id
 w1mr17865102otq.156.1625638075663; 
 Tue, 06 Jul 2021 23:07:55 -0700 (PDT)
MIME-Version: 1.0
From: Qiang Liu <cyruscyliu@gmail.com>
Date: Wed, 7 Jul 2021 14:07:43 +0800
Message-ID: <CAAKa2jmatcBonTYeZCHnE4TR543FKQR4Lrv2iMKaZUprXH=3ng@mail.gmail.com>
Subject: [QEMU-SECURITY] Out-of-bounds read in xlnx_dp_read
To: qemu-security@nongnu.org, Alistair Francis <alistair@alistair23.me>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
 yajin@vm-kernel.org, Mathias Payer <mathias.payer@epfl.ch>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=cyruscyliu@gmail.com; helo=mail-ot1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 07 Jul 2021 04:59:03 -0400
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mE/5WKXtBdvR

Hi folks,

I found an out-of-bounds read in xlxn_dp_read and here are the details.

## Root Cause Analysis

1. xlnx_dp_read allows one-element-off read at its default branch
because of an improper index.

```
#define DP_CORE_REG_ARRAY_SIZE (0x3AF >> 2)
struct XlnxDPState {
    uint32_t core_registers[DP_CORE_REG_ARRAY_SIZE];
    MemoryRegion core_iomem;
}
static uint64_t xlnx_dp_read(void *opaque, hwaddr ...
    switch (offset) {
        default:                             // (0x3AF >> 2) is equal
to (0x3AC >> 2)
            assert(offset <= (0x3AC >> 2));  // the op should be <
            ret = s->core_registers[offset]; // one-element-off access
            break;
```

Because the following object is a MemoryRegion whose first 4 four bytes
are part of the type name, this out-of-bounds read may not be harmful.

2. More information.

According to
https://www.xilinx.com/html_docs/registers/ug1087/ug1087-zynq-ultrascale-registers.html,
offset 0x3AC is allowed.

DP_INT_MASK 0x000003A4 32 mixed 0xFFFFF03F Interrupt Mask Register for
intrN. This is a read-only location and can be atomically altered by
either the IDR or the IER.
DP_INT_EN 0x000003A8 32 mixed 0x00000000 Interrupt Enable Register. A
write of to this location will unmask the interrupt. (IMR: 0)
DP_INT_DS 0x000003AC 32 mixed 0x00000000 Interrupt Disable Register. A
write of one to this location will mask the interrupt. (IMR:

```
memory_region_init_io(&s->core_iomem, obj, &dp_ops, s, TYPE_XLNX_DP,
".core", 0x3AF);
```
The size of this memory region is 0x3AF, which is also reasonable (0x3B0
is better).

According to the implementation of xlnx_dp_write, when the offset is
0x3A8 and 0x3AC, the virtual device will access s->core_registers[0x3A4
>> 2]. That is to say, the maxize of s->core_registers could be ((0x3A4
>> 2) + 1). Therefore, it is also reasonable to define
s->core_registers[DP_CORE_REG_ARRAY_SIZE] where DP_CORE_REG_ARRAY_SIZE
is (0x3AF >> 2) (0x3A8 >> 2 is better). However, in xlxn_dp_read, offset
0x3A8 and 0x3AC is not handled like what is done in the xlnx_dp_write.

## More technique details

### QEMU version, upstream commit/tag
3e13d8e34b53d8f9a3421a816ccfbdc5fa874e98/6.0.50

### Host and Guest
Ubuntu 18.04 docker/QTest Fuzzer

### Stack traces, crash details (UBSAN enabled)

```
../hw/display/xlnx_dp.c:717:15: runtime error: index 235 out of bounds
for type 'uint32_t [235]'
SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior
../hw/display/xlnx_dp.c:717:15 in
```

### Reproducer steps

```
#!/bin/bash -x
export QEMU=/root/qemu/build-ubsan/qemu-system-aarch64
export BUILDROOT=./
cat << EOF | $QEMU \
-machine xlnx-zcu102,accel=qtest -qtest stdio -monitor none -serial none \
-display none -nodefaults -qtest stdio
readl 0xfd4a03ac
EOF
```
## Suggested fix

```
diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
index 7bcbb13..ff0b8a9 100644
--- a/hw/display/xlnx_dp.c
+++ b/hw/display/xlnx_dp.c
@@ -713,8 +713,10 @@ static uint64_t xlnx_dp_read(void *opaque, hwaddr
offset, unsigned size)
         ret = 0;
         break;
     default:
-        assert(offset <= (0x3AC >> 2));
-        ret = s->core_registers[offset];
+        if (offset == (0x3A8 >> 2) || offset == (0x3AC >> 2))
+            ret = s->core_registers[DP_INT_MASK];
+        else:
+            ret = s->core_registers[offset];
         break;
     }

@@ -876,7 +878,6 @@ static void xlnx_dp_write(void *opaque, hwaddr
offset, uint64_t value,
         xlnx_dp_update_irq(s);
         break;
     default:
-        assert(offset <= (0x504C >> 2));
         s->core_registers[offset] = value;
         break;
     }
diff --git a/include/hw/display/xlnx_dp.h b/include/hw/display/xlnx_dp.h
index e85e428..99a6d47 100644
--- a/include/hw/display/xlnx_dp.h
+++ b/include/hw/display/xlnx_dp.h
@@ -39,7 +39,7 @@
 #define AUD_CHBUF_MAX_DEPTH                 (32 * KiB)
 #define MAX_QEMU_BUFFER_SIZE                (4 * KiB)

-#define DP_CORE_REG_ARRAY_SIZE              (0x3AF >> 2)
+#define DP_CORE_REG_ARRAY_SIZE              (0x3A8 >> 2)
 #define DP_AVBUF_REG_ARRAY_SIZE             (0x238 >> 2)
 #define DP_VBLEND_REG_ARRAY_SIZE            (0x1DF >> 2)
 #define DP_AUDIO_REG_ARRAY_SIZE             (0x50 >> 2)
```

## Contact

Let me know if I need to provide more information.

Best,
Qiang
