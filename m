Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DBB9FF8861
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Apr 2026 09:00:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wHHoY-0002Bx-KJ; Mon, 27 Apr 2026 04:59:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1wHHoS-0002BL-K5
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 04:59:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1wHHoQ-00050F-9X
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 04:59:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1777280369;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=MBLm3Rj1OPJ7HWgbpmHKrCHR5BCKxx8wrmNUUngkjA8=;
 b=gOrjTl5CccchpnGEgUnuqSdAWc5NJcP2Y1UFeIy4IcEVtTYK+zbGAQLEzOEvcfwR4g3uZV
 PYJ2p14QcckrJVUKP8S0G4w9h+RlDS0HMh8aRCnFxVCcbTpjGnUk6/cmuQPVXo8dwKfltU
 ZtxKLgm1x8iuxZbd0Zz05Ic7XaVbzdM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-661-SHZgeAhLN8aQq9kmGMy89Q-1; Mon, 27 Apr 2026 04:59:27 -0400
X-MC-Unique: SHZgeAhLN8aQq9kmGMy89Q-1
X-Mimecast-MFC-AGG-ID: SHZgeAhLN8aQq9kmGMy89Q_1777280366
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-488dcaf2f2fso87284995e9.0
 for <qemu-arm@nongnu.org>; Mon, 27 Apr 2026 01:59:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777280366; x=1777885166;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MBLm3Rj1OPJ7HWgbpmHKrCHR5BCKxx8wrmNUUngkjA8=;
 b=d24U7jfqYVfhgpM+Ho36GlvV4WQ4g2xQVE9ur94PTS1+QEAK3QGq87WbMe4u28frNG
 jE38QtPanzNpKmvip+3P3qDF5rmic/zDefMr4ViCNEACyRM6ervJ8VJpa+V6J+BetNm+
 nzC3rYKZB2XzVtPt6oXvBoHSEunQWXKdqvJMJrr+9lZ12neT8nb/Yg/pAnw/8Gw662aE
 Lrxk77lbVOIgxHIa12yU1dhVbQiv8nIjvCF+hDKPErnl7O/xnaFuHoaCGD9VehQ+v1xA
 f2TFSOAl1T0nu3SzWCuJQyfeBCAi/f+o+fqKq2pMyGx4aSKA7a3gTzXKtfpxtSE7Dptw
 5Fsw==
X-Gm-Message-State: AOJu0YzjZfs2OwgcNGslMPXh1KjtVqQhgDdfZvscGmdOl3w+6O9dkJLc
 ODMncB7wtcmZ1dW5o8MxTpGW12bCzhyAEN1XCo7SVtOQ7fimoe+DAg/g/AuB1hn93vSQfIj6qhR
 7LM2hjJ2rIUm/evZr5VHHnqkYYwC55iWxLUA48eIkp4BOMMQjlfCD3g==
X-Gm-Gg: AeBDievTZjGs4iQReqK6Kbm/LmLG4ZTRTiljpM520AnL8gOpATKUrPXCwoTmSB2ertc
 1Ooo72kB49CGwnLRzdFheMBdliC6BRuU6lLsfidZelR+7/z02cIwYAstrtlKxY5fwkgHL1qwFxN
 r/dsvC/rAIdZby/iuMxBOwSL4JS/mixEBMT8b3ioYmirnAWN9BNGc4CCEZeNDq+yUYtslPMnnEs
 RDG5K1lFaLjZDhM9jcZm+gsP6az9fwntfkaO0YvtxLIPX/U3FHG0h50FMkeFuCGvjv9HIaTzVk+
 5xPzBk2woK0ekC5fFmdj40zY2MwpQYu8fXEfgY7feXcvmCJZVjaTm+/KJPZaBwTr5m68tX+rx7G
 Eq9N17nxhR421BNeh2f4Rn2PQRZj+YSw=
X-Received: by 2002:a05:600c:1616:b0:489:1cd2:6106 with SMTP id
 5b1f17b1804b1-4891cd261f1mr265827425e9.6.1777280365604; 
 Mon, 27 Apr 2026 01:59:25 -0700 (PDT)
X-Received: by 2002:a05:600c:1616:b0:489:1cd2:6106 with SMTP id
 5b1f17b1804b1-4891cd261f1mr265827085e9.6.1777280365063; 
 Mon, 27 Apr 2026 01:59:25 -0700 (PDT)
Received: from [192.168.1.53] ([151.237.207.243])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fb735d3dsm555068725e9.2.2026.04.27.01.59.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Apr 2026 01:59:24 -0700 (PDT)
Message-ID: <94332917-c953-4ccf-9e9e-ccb0f2c784b8@redhat.com>
Date: Mon, 27 Apr 2026 10:59:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL 02/32] hw/misc/aspeed_sbc: Connect ASPEED OTP memory device
 to SBC
To: Kane Chen <kane_chen@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Troy Lee <troy_lee@aspeedtech.com>, Jamin Lin <jamin_lin@aspeedtech.com>
References: <20250929165230.797471-1-clg@redhat.com>
 <20250929165230.797471-3-clg@redhat.com>
 <CAFEAcA8Dja4yqnaHsXc9pg6EzEAVZFR3=E0sGa9Bz4bvuf+_bA@mail.gmail.com>
 <CAFEAcA8nyngyeWi4Vb=ZWJfxNsyFfSqFJMnWnYG2ce95xaCfPA@mail.gmail.com>
 <SI6PR06MB76313BC0842AFB0A8C204E42F7362@SI6PR06MB7631.apcprd06.prod.outlook.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Autocrypt: addr=clg@redhat.com; keydata=
 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
 uVKe8BVz4atMOoktmt0GWTOC8P4=
In-Reply-To: <SI6PR06MB76313BC0842AFB0A8C204E42F7362@SI6PR06MB7631.apcprd06.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zjVS7BuXjuBCn14hTBvkiSxuFXtfIh8z0VgXaAagRoI_1777280366
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 4/27/26 05:16, Kane Chen wrote:
>> -----Original Message-----
>> From: Peter Maydell <peter.maydell@linaro.org>
>> Sent: Friday, April 24, 2026 11:58 PM
>> To: Cédric Le Goater <clg@redhat.com>
>> Cc: qemu-arm@nongnu.org; qemu-devel@nongnu.org; Kane Chen
>> <kane_chen@aspeedtech.com>
>> Subject: Re: [PULL 02/32] hw/misc/aspeed_sbc: Connect ASPEED OTP memory
>> device to SBC
>>
>> On Fri, 24 Apr 2026 at 16:46, Peter Maydell <peter.maydell@linaro.org> wrote:
>>> But here in the prog path, we use the address from the guest directly
>>> in the call to address_space_write. This means that the address the
>>> MemoryRegion in the OTP device sees is not necessarily
>>> 4 aligned, and that it can have values that exceed the valid size of
>>> the OTP.
>>>
>>> The OTP device on the other end seems to try to account for this
>>> difference: its read function uses the offset it is passed as-is,
>>> whereas its write function uses "otp_offset = otp_addr << 2" to
>>> convert the offset into a byte offset before using it as an array
>>> index etc. But the write function doesn't check whether it's got an
>>> overlarge value, so I think it can write off the end of the storage.
>>
>> I found a repro which triggers a clang asan failure, so I filed a bug:
>>
>> https://gitlab.com/qemu-project/qemu/-/work_items/3436
>>
>> Would you mind having a look at it?

Thanks Peter. I really appreciate the simplicity of the test case.

>>
> 
> Hi Peter,
> 
> Sorry for the confusion. I plan to move the address conversion
> 
> otp_offset = otp_addr << 2;
> 
> from aspeed_otp_write to the upper layer (aspeed_sbc_otp_prog) to ensure
> consistent behavior between the read and write paths. This should help reduce
> confusion and align the implementation more clearly.
> 
> If there are no concerns with this change, I will proceed with submitting a
> patch shortly.

Hello Kane,

See below.

https://github.com/legoater/qemu/commit/f2967c5bb6084903db178c08afe2b410dd98d3ff

However, the functional tests are broken. These tests should be using
real HW values preferably and not values expected by QEMU.
   
Can you please fix the tests and send the patch below ?


Thanks,

C.

 From f2967c5bb6084903db178c08afe2b410dd98d3ff Mon Sep 17 00:00:00 2001
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Date: Mon, 27 Apr 2026 10:50:21 +0200
Subject: [PATCH] hw/misc/aspeed_sbc: Add bounds checking for OTP write
  operations
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

There is a mismatch between the Aspeed OTP model and the Aspeed SBC
model in how the guest-provided address is handled.
aspeed_sbc_otp_prog() passes a word-indexed address directly
to address_space_write() without converting it to a byte offset,
whereas aspeed_otp_write() expects a byte offset and applies an
additional shift (otp_addr << 2). This double-shift confusion means
that an out-of-range word address can lead to a write beyond the
allocated storage.

Fix this by adding bounds checking on the word offset before
converting to byte offset and passing to address_space_write().
This matches the existing bounds check in aspeed_sbc_otp_read().

Cc: Kane-Chen-AS <kane_chen@aspeedtech.com>
Cc: qemu-stable@nongnu.org
Fixes: 1a00754ccf15 ("hw/misc: Add Aspeed Secure Boot Controller model")
Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3436
Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
  hw/misc/aspeed_sbc.c | 11 +++++++++--
  1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/hw/misc/aspeed_sbc.c b/hw/misc/aspeed_sbc.c
index 065e822e70d9..50d499f924dc 100644
--- a/hw/misc/aspeed_sbc.c
+++ b/hw/misc/aspeed_sbc.c
@@ -159,9 +159,16 @@ static bool aspeed_sbc_otp_prog(AspeedSBCState *s,
      MemTxResult ret;
      AspeedOTPState *otp = &s->otp;
      uint32_t value = s->regs[R_CAMP1];
+    uint32_t otp_offset;
  
-    ret = address_space_write(&otp->as, otp_addr, MEMTXATTRS_UNSPECIFIED,
-                        &value, sizeof(value));
+    if (otp_addr >= OTP_TOTAL_DWORD_COUNT) {
+        qemu_log_mask(LOG_GUEST_ERROR, "Invalid OTP addr 0x%x\n", otp_addr);
+        return false;
+    }
+
+    otp_offset = otp_addr << 2;
+    ret = address_space_write(&otp->as, otp_offset, MEMTXATTRS_UNSPECIFIED,
+                              &value, sizeof(value));
      if (ret != MEMTX_OK) {
          qemu_log_mask(LOG_GUEST_ERROR,
                        "Failed to write OTP memory, addr = %x\n",
-- 
2.53.0





