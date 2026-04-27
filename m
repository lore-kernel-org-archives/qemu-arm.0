Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1192FFF8861
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Apr 2026 09:24:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wHICw-0001ka-Ta; Mon, 27 Apr 2026 05:24:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1wHICv-0001ja-35
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 05:24:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1wHICt-0006CC-Am
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 05:24:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1777281886;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=vnrWyFixkZmF7NSNdTKBiv87sCBhY0EKh692TW1byGY=;
 b=f4FHCdI55+0W+T8aXHwm/A7JJbHDcWdvtFgCxtUArK52dkb3MY3fvP3iPPPlz1U9XdsKEU
 mp5tKlsb/7OsENSSjA7rNlQ8hdNfZZOKUT7BwLl0a0S0RL97SE7V8sVedzMhHDHR+DUu9H
 K++BMUvsahWU/tA9QEwMB4WlSPQE3EQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-553-fKxkRhuDOZyB4EQ_19rIiQ-1; Mon, 27 Apr 2026 05:24:44 -0400
X-MC-Unique: fKxkRhuDOZyB4EQ_19rIiQ-1
X-Mimecast-MFC-AGG-ID: fKxkRhuDOZyB4EQ_19rIiQ_1777281883
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-43e52dc8a04so8711227f8f.3
 for <qemu-arm@nongnu.org>; Mon, 27 Apr 2026 02:24:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777281883; x=1777886683;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :references:cc:to:from:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vnrWyFixkZmF7NSNdTKBiv87sCBhY0EKh692TW1byGY=;
 b=W+wRW+Ci0adUXZRlJSRmal2SvHVQ4zW4jtP95Kp07f+s2wT+/Z1M4LPqGPhCKmnRRj
 uwmAFn6p7tNu6hstTN2wtUTZkEPOWtaUQJ2RM6l4sKqCXXbWm4eMgriyUIHiTL/lf3PX
 mD2ck+DFuXyiaIHkt3lgK57KZyeOdKafXQsUElvdt9eIHgzI9uqBUiX/ViozIEFeU4N0
 R+f5kKmUk57aGRNqmFeIETnS8cbZ+X0Gk5/3+0XHwsmmCMk4nUJKYZfB8CCvhxewX6gi
 54sKch+9SBl7iw5gWa+txHogUdjgpd+H0e9AGdvEDmI5gX05wVzl+1MjC3ZM7yfL0dx6
 WC6w==
X-Gm-Message-State: AOJu0YwC8nXErkpDnMXo5JhIzn+8cvReQkjle4yehOvAra54599BbOT7
 w1UDTbKDQ5RjxM/+b335JdP7LZFwTuKX+f0C/63g//Ksp0Kzx/7tvR6mMjt/sNzq7hBQlyGo2uA
 PiJwxRZ64MjHA3LebaswzGS2I5fnQ+2ZlfsY1lwuF4R9U+icqTUO16w==
X-Gm-Gg: AeBDietkD+iFbfsWZHdwuX639bt5y5wHtc8af9YLF0FlvKw3etxntSiMmnYbKHDHXBd
 ly7AwETSjqEZXZm0tU0joQO+CW8gYj8ZnQ7KV977aimxNlh9ba5lwwQHRLUmyWEWuj0Tn4R2x9I
 fSaFKhhkQt31q+s2CBq9Sxp6TsWgm7XHyCnGaclegzvxOMWxG3SiWz2YRg9VeCFy+qCuv42Fnb0
 qGgDkaUDKIzL+6tCyAbNicAqhYMkikiDnacdjM8gDj47CVSZ6NMIybLWpqhdsPMSoF7fiH4aixf
 /tK1UFOmxoMGPStz70w8+WogOmGJ4bjmHe3FAOoeBzr+qOd4Sx+yIKB4GLprEXAIwsH5c2JG5gt
 EAtTUHcC+GGLMk8yqBAn6dVuN5DzUqeo=
X-Received: by 2002:a05:6000:1a89:b0:43d:7125:e79f with SMTP id
 ffacd0b85a97d-43fe3e25c89mr65889956f8f.47.1777281883097; 
 Mon, 27 Apr 2026 02:24:43 -0700 (PDT)
X-Received: by 2002:a05:6000:1a89:b0:43d:7125:e79f with SMTP id
 ffacd0b85a97d-43fe3e25c89mr65889888f8f.47.1777281882558; 
 Mon, 27 Apr 2026 02:24:42 -0700 (PDT)
Received: from [192.168.1.53] ([151.237.207.243])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4cc0f31sm80008300f8f.12.2026.04.27.02.24.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Apr 2026 02:24:42 -0700 (PDT)
Message-ID: <c6b6f903-2afe-4753-a522-64ffdbe427c8@redhat.com>
Date: Mon, 27 Apr 2026 11:24:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL 02/32] hw/misc/aspeed_sbc: Connect ASPEED OTP memory device
 to SBC
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
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
 <94332917-c953-4ccf-9e9e-ccb0f2c784b8@redhat.com>
Autocrypt: addr=clg@redhat.com; keydata=
 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
 uVKe8BVz4atMOoktmt0GWTOC8P4=
In-Reply-To: <94332917-c953-4ccf-9e9e-ccb0f2c784b8@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cC65vvxokiomKYHHhA0yz3L3P9a1R5Vr_8dGaN4-u9o_1777281883
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

On 4/27/26 10:59, Cédric Le Goater wrote:
> On 4/27/26 05:16, Kane Chen wrote:
>>> -----Original Message-----
>>> From: Peter Maydell <peter.maydell@linaro.org>
>>> Sent: Friday, April 24, 2026 11:58 PM
>>> To: Cédric Le Goater <clg@redhat.com>
>>> Cc: qemu-arm@nongnu.org; qemu-devel@nongnu.org; Kane Chen
>>> <kane_chen@aspeedtech.com>
>>> Subject: Re: [PULL 02/32] hw/misc/aspeed_sbc: Connect ASPEED OTP memory
>>> device to SBC
>>>
>>> On Fri, 24 Apr 2026 at 16:46, Peter Maydell <peter.maydell@linaro.org> wrote:
>>>> But here in the prog path, we use the address from the guest directly
>>>> in the call to address_space_write. This means that the address the
>>>> MemoryRegion in the OTP device sees is not necessarily
>>>> 4 aligned, and that it can have values that exceed the valid size of
>>>> the OTP.
>>>>
>>>> The OTP device on the other end seems to try to account for this
>>>> difference: its read function uses the offset it is passed as-is,
>>>> whereas its write function uses "otp_offset = otp_addr << 2" to
>>>> convert the offset into a byte offset before using it as an array
>>>> index etc. But the write function doesn't check whether it's got an
>>>> overlarge value, so I think it can write off the end of the storage.
>>>
>>> I found a repro which triggers a clang asan failure, so I filed a bug:
>>>
>>> https://gitlab.com/qemu-project/qemu/-/work_items/3436
>>>
>>> Would you mind having a look at it?
> 
> Thanks Peter. I really appreciate the simplicity of the test case.
> 
>>>
>>
>> Hi Peter,
>>
>> Sorry for the confusion. I plan to move the address conversion
>>
>> otp_offset = otp_addr << 2;
>>
>> from aspeed_otp_write to the upper layer (aspeed_sbc_otp_prog) to ensure
>> consistent behavior between the read and write paths. This should help reduce
>> confusion and align the implementation more clearly.
>>
>> If there are no concerns with this change, I will proceed with submitting a
>> patch shortly.
> 
> Hello Kane,
> 
> See below.
> 
> https://github.com/legoater/qemu/commit/f2967c5bb6084903db178c08afe2b410dd98d3ff

There is more to it. The additional shift in Aspeed OTP model should
be removed too. With that, the memory transactions on the OTP storage
should be safe. I think.

I pushed a new version on branch aspeed-11.1

Thanks,

C.

> However, the functional tests are broken. These tests should be using
> real HW values preferably and not values expected by QEMU.
> Can you please fix the tests and send the patch below ?
> 
> 
> Thanks,
> 
> C.
> 
>  From f2967c5bb6084903db178c08afe2b410dd98d3ff Mon Sep 17 00:00:00 2001
> From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
> Date: Mon, 27 Apr 2026 10:50:21 +0200
> Subject: [PATCH] hw/misc/aspeed_sbc: Add bounds checking for OTP write
>   operations
> MIME-Version: 1.0
> Content-Type: text/plain; charset=UTF-8
> Content-Transfer-Encoding: 8bit
> 
> There is a mismatch between the Aspeed OTP model and the Aspeed SBC
> model in how the guest-provided address is handled.
> aspeed_sbc_otp_prog() passes a word-indexed address directly
> to address_space_write() without converting it to a byte offset,
> whereas aspeed_otp_write() expects a byte offset and applies an
> additional shift (otp_addr << 2). This double-shift confusion means
> that an out-of-range word address can lead to a write beyond the
> allocated storage.
> 
> Fix this by adding bounds checking on the word offset before
> converting to byte offset and passing to address_space_write().
> This matches the existing bounds check in aspeed_sbc_otp_read().
> 
> Cc: Kane-Chen-AS <kane_chen@aspeedtech.com>
> Cc: qemu-stable@nongnu.org
> Fixes: 1a00754ccf15 ("hw/misc: Add Aspeed Secure Boot Controller model")
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3436
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Cédric Le Goater <clg@redhat.com>
> ---
>   hw/misc/aspeed_sbc.c | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/misc/aspeed_sbc.c b/hw/misc/aspeed_sbc.c
> index 065e822e70d9..50d499f924dc 100644
> --- a/hw/misc/aspeed_sbc.c
> +++ b/hw/misc/aspeed_sbc.c
> @@ -159,9 +159,16 @@ static bool aspeed_sbc_otp_prog(AspeedSBCState *s,
>       MemTxResult ret;
>       AspeedOTPState *otp = &s->otp;
>       uint32_t value = s->regs[R_CAMP1];
> +    uint32_t otp_offset;
> 
> -    ret = address_space_write(&otp->as, otp_addr, MEMTXATTRS_UNSPECIFIED,
> -                        &value, sizeof(value));
> +    if (otp_addr >= OTP_TOTAL_DWORD_COUNT) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "Invalid OTP addr 0x%x\n", otp_addr);
> +        return false;
> +    }
> +
> +    otp_offset = otp_addr << 2;
> +    ret = address_space_write(&otp->as, otp_offset, MEMTXATTRS_UNSPECIFIED,
> +                              &value, sizeof(value));
>       if (ret != MEMTX_OK) {
>           qemu_log_mask(LOG_GUEST_ERROR,
>                         "Failed to write OTP memory, addr = %x\n",


