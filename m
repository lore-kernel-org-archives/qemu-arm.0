Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp443345lfc;
        Tue, 13 Jul 2021 03:25:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy+YvzZ3bC4GOq5C2xxGf5lYKjd7QtdiSkrSWgEXBOb4n9aY7QrcJdQLTO3Ss9EfVnZvLKv
X-Received: by 2002:ac8:5c06:: with SMTP id i6mr3278193qti.343.1626171919054;
        Tue, 13 Jul 2021 03:25:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626171919; cv=none;
        d=google.com; s=arc-20160816;
        b=BB+Kx9nPZRNZ61B/bz9HnEZsrGL5rFNkCYsfOvuEIARrJ/gTH6LSYTs/lmkU7aAvyr
         HM6ltaGAs/aSgeXCuroPKNBa8cYWvul4W8GfpuOlIyaBn0xbPjqe8dKEiIrea9r8uyQt
         KTg1kBU5nQcGpoYujzmQ2mbu92dBa+4GIO0YN6U2nVeDYDnDGXuMCEyGAVlWAaH1Mq2t
         ++Izzvvh0pj9ylQwy1C9O4JQ7VqI+uhG9E8LTgfMYqy+chdO5NFWjoLAddcglq/7MdJG
         lWQDzLkfScPLmyUhwkEQ3YjkHnVBZC6S2xvcJCPa2seheKkDCJqS3oHGdoieRpZ3io2U
         sN7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:to:from:subject:dkim-signature;
        bh=1HCMz0iWi9RUhj/PSFEctuEfNGMM0WRcfmr2izIF/Qc=;
        b=xILeDvedOx9pvXra6NQ/MNWVPUULPN9LmEBrTSYEth1JVAQUqLQLx/egHH3Ef1L2by
         KwEha4y83UC1vXZlVbWwo9XCecp+ieCO4eZddCEck0PcLZBPNIp1OiAJwmp+bzj9sj/t
         yDiQ5Z/SBkwRfqvau/CW8NuQyXKVF4woPWYzord9WLbcvsy13Qgup/oe5Yx4CqISRhw/
         60W0b/zicFugcXc3rbQaZYzrAQVGmmnyoqMVFQ5X/eOF8reJfkFUwcbrrcN+J7Veod37
         k73CVi0aPSW7dZ2z+GXqPmJccSzYHyiVkbHgpxrI9UkwZAMeKW4Ld8j4fxsMol0IQkMa
         gGRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=VJKuJ6vM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i11si2372552qkm.378.2021.07.13.03.25.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Jul 2021 03:25:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=VJKuJ6vM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m3FbG-0001NC-Il
	for alex.bennee@linaro.org; Tue, 13 Jul 2021 06:25:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m3Fak-0001Ja-Ad; Tue, 13 Jul 2021 06:24:42 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:41566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m3Fai-0005j2-KP; Tue, 13 Jul 2021 06:24:42 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 a5-20020a7bc1c50000b02901e3bbe0939bso2002379wmj.0; 
 Tue, 13 Jul 2021 03:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1HCMz0iWi9RUhj/PSFEctuEfNGMM0WRcfmr2izIF/Qc=;
 b=VJKuJ6vMbk9cbM8moUuAR2t+xomkQBscnbqt/Njxsz4kk7pqLIkBEWxx06SEl9pUf3
 NGcfG3RARQ36xH10TC5pCDACw2H8bj4+9m4r5094ewo8YpCu/2pE2rqOHptMyR4qvpal
 Fx40NjrrNtjP/F61DMBNfNX6/EFIVAYMWZ5fU7uxW/LssOX1f6CfhAP8/sMAUhrB87LH
 JkY0bNuFvkiST2HpOUN8C4mqODV+qILxsxe68WERBiYsa4RIE9VPAEIwQJLgP3NWAiz8
 ScbRQ8iJS8rlXaaRQ+gi4nNmhdlb/BJIOVMXaXBRtag/c1f/xfif4jMJ/JUts1NshRVw
 MqFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1HCMz0iWi9RUhj/PSFEctuEfNGMM0WRcfmr2izIF/Qc=;
 b=g722ZSjDtGkfOs4ppRpZVWj4pd5Ux5Fdl1mFY6UGrGmuZO8DqvOOdXM+4d7Ivnftwx
 6kvTCFUQCiM9H86T7GBQm8zvMeEqqbVsnzYDtIA88zrNoMH9MfVwNL26llDfPpoyZtDb
 PqxjV24V4gbU93+TkGvnY1RBCExr5SC94pBFExCVN3luyFibWZQOgf3CE2rQQQ0pvuEe
 ch+PWEBsMZ0eGuzmUwxwpstrF8HIxlfyXE58qeE2+bBUv+dlZRiRxkdbBhf8cfynwsl3
 cbx0UtQXlVMtsQNk2krGY+G+y0gbrrLQXcxWFdypOaO0RRi2sacsJBmEw+BvBKRmw29I
 fHXQ==
X-Gm-Message-State: AOAM533Fg7IPsglmdvvwlJow8zAX/Vm3Z4vG3fmxZQpqHuLcJEMVxW8T
 HZ2Dx73wuntyC1uS8eFRm0k=
X-Received: by 2002:a05:600c:2204:: with SMTP id
 z4mr12942723wml.169.1626171878691; 
 Tue, 13 Jul 2021 03:24:38 -0700 (PDT)
Received: from [192.168.1.24] (abayonne-654-1-142-116.w86-222.abo.wanadoo.fr.
 [86.222.93.116])
 by smtp.gmail.com with ESMTPSA id w22sm1962355wmc.4.2021.07.13.03.24.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jul 2021 03:24:38 -0700 (PDT)
Subject: Re: [PATCH] hw/display/xlnx_dp: fix an out-of-bounds read in
 xlnx_dp_read
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Qiang Liu <cyruscyliu@gmail.com>
References: <1626146083-19434-1-git-send-email-cyruscyliu@gmail.com>
 <5c8d9875-ecf1-4f67-f26d-da010bdab9bb@amsat.org>
Message-ID: <a0fe9b97-f9dd-9122-8b40-342ab3c8a232@amsat.org>
Date: Tue, 13 Jul 2021 12:24:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <5c8d9875-ecf1-4f67-f26d-da010bdab9bb@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-1.479,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Alexander Bulekov <alxndr@redhat.com>,
 "open list:Xilinx ZynqMP and..." <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VF0U7aQRt8H2

On 7/13/21 12:20 PM, Philippe Mathieu-Daudé wrote:
> On 7/13/21 5:14 AM, Qiang Liu wrote:
>> xlnx_dp_read allows an out-of-bounds read at its default branch because
>> of an improper index.
>>
>> According to
>> https://www.xilinx.com/html_docs/registers/ug1087/ug1087-zynq-ultrascale-registers.html
>> (DP Module), registers 0x3A4/0x3A4/0x3AC are allowed.
>>
>> DP_INT_MASK	0x000003A4	32	mixed	0xFFFFF03F	Interrupt Mask Register for intrN.
>> DP_INT_EN	0x000003A8	32	mixed	0x00000000	Interrupt Enable Register.
>> DP_INT_DS	0x000003AC	32	mixed	0x00000000	Interrupt Disable Register.
>>
>> In xlnx_dp_write, when the offset is 0x3A8 and 0x3AC, the virtual device
>> will write s->core_registers[0x3A4
>>>> 2]. That is to say, the maxize of s->core_registers could be ((0x3A4
>>>> 2) + 1). However, the current size of s->core_registers is (0x3AF >>
>>>> 2), that is ((0x3A4 >> 2) + 2), which is out of the range.
>> In xlxn_dp_read, the access to offset 0x3A8 or 0x3AC will be directed to
>> the offset 0x3A8 (incorrect functionality) or 0x3AC (out-of-bounds read)
>> rather than 0x3A4.
>>
>> This patch adjusts the size of s->core_registers and enforces the read
>> access to offset 0x3A* and 0x3AC to 0x3A4. BTW, because the size of this
>> MMIO region is 0x3AF, this patch also removes the assertion in
>> xlnx_dp_write.
>>
>> Fixes: 58ac482a66de ("introduce xlnx-dp")
>> Signed-off-by: Qiang Liu <cyruscyliu@gmail.com>
>> ---
>>  hw/display/xlnx_dp.c         | 7 ++++---
>>  include/hw/display/xlnx_dp.h | 2 +-
>>  2 files changed, 5 insertions(+), 4 deletions(-)
> 
> Can you provide a qtest reproducer please?

See examples in tests/qtest/fuzz*test.c

>> diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
>> index 7bcbb13..8903181 100644
>> --- a/hw/display/xlnx_dp.c
>> +++ b/hw/display/xlnx_dp.c
>> @@ -713,8 +713,10 @@ static uint64_t xlnx_dp_read(void *opaque, hwaddr offset, unsigned size)
>>          ret = 0;
>>          break;
>>      default:
>> -        assert(offset <= (0x3AC >> 2));
>> -        ret = s->core_registers[offset];
>> +        if (offset == (0x3A8 >> 2) || offset == (0x3AC >> 2))
>> +            ret = s->core_registers[DP_INT_MASK];
>> +        else 
> 
> Invalid code style.
> 
>> +            ret = s->core_registers[offset];
>>          break;
>>      }
>>  
>> @@ -876,7 +878,6 @@ static void xlnx_dp_write(void *opaque, hwaddr offset, uint64_t value,
>>          xlnx_dp_update_irq(s);
>>          break;
>>      default:
>> -        assert(offset <= (0x504C >> 2));
>>          s->core_registers[offset] = value;
>>          break;
>>      }
>> diff --git a/include/hw/display/xlnx_dp.h b/include/hw/display/xlnx_dp.h
>> index e85e428..99a6d47 100644
>> --- a/include/hw/display/xlnx_dp.h
>> +++ b/include/hw/display/xlnx_dp.h
>> @@ -39,7 +39,7 @@
>>  #define AUD_CHBUF_MAX_DEPTH                 (32 * KiB)
>>  #define MAX_QEMU_BUFFER_SIZE                (4 * KiB)
>>  
>> -#define DP_CORE_REG_ARRAY_SIZE              (0x3AF >> 2)
>> +#define DP_CORE_REG_ARRAY_SIZE              (0x3A8 >> 2)
> 
> NAck: this breaks migration.
> 
>>  #define DP_AVBUF_REG_ARRAY_SIZE             (0x238 >> 2)
>>  #define DP_VBLEND_REG_ARRAY_SIZE            (0x1DF >> 2)
>>  #define DP_AUDIO_REG_ARRAY_SIZE             (0x50 >> 2)
>>
> 
> 
