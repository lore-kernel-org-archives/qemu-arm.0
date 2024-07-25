Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp3551633njc;
        Wed, 24 Jul 2024 23:58:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVHpNk02OBkbyHIz+Eys0DeLE+9fV36R3N/kVwg6RTqeMR7E5tpzKWJzwxwSVhj+01JFtaNPwCX2UAljf4g2sWlpiQMngid
X-Google-Smtp-Source: AGHT+IGtCBxGYp5fuhMxgyZSCtPegg5UP7NXwJ72KnGNGrRjZ11apzjE9I2r+MTvXzrgOgyRaVlM
X-Received: by 2002:a05:6214:da3:b0:6b7:a6eb:c343 with SMTP id 6a1803df08f44-6bb4087082dmr12526696d6.51.1721890711620;
        Wed, 24 Jul 2024 23:58:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721890711; cv=none;
        d=google.com; s=arc-20160816;
        b=TcLP35C481FtFu/wvFinzhGyPaVxTOLkrI9T5lS5NEP4Hjq/fRgMiQzWw5FTgEc/oV
         /KNnwAa8nH5tS5vNE7OAsvscu1CXqPSheewEpPbQg2kL4DpOEDcaSc5c+TorB3rLiqiF
         2XehIe+lZb2vDRFdrdEqt97Z+52Pg9d77tcpnp9TqeFDygeUHfUsapzf+sIAu2XJ/YMD
         KKg0WHbNB0WMKCNsK6WGEJlEi3VqxICHT2GLDtQy3o0x51pzXdBkkqoZjtPsxf2UH6b3
         fjP0gZI6mU14Oi1qaBL4DSzKuW9jgq3EOpYtxSJF+XQKAYeT3mY9IvQdp54SvGfL7gff
         cOQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=PeGEmRBAOhT/xkRbn6ISbWil2tWD4PNocyMx9/v0nys=;
        fh=nVkAIXuVa0oMjWg8LRGh1shL1aR3DvIcz/kGIZU/Gfg=;
        b=pNM09M5IllVFQdYWPR59WLnWuaAZU0WgUb/ZBcNv6BFz2q6f82piUV7y9wnfidnFz9
         sdOxqpPrkd5xZs46mYo5G3ZNL/am11HM2DxkwfoT8ZTOnA9FgCgbczds6gmpODXZ9KNA
         PSyiqghvuUx7R2QKwQ/HGzeLP5dW2/5d7W9ThvKqy63g37gztc9T4xcHdK9jXhGHaDrc
         d0W7HEwDEL7fvJ7pEp+jXPr6T7OzGj2FRBmhNZf/bAL5XcGqXk5TnJx/Y2Vayhno/hfx
         g5DuiMLg6Za2rTDVZ4MyHjPo5GMPsCfeNGTjhTMocUf2hrsCrUa+k8qMNpri8DkRaS9J
         iOxQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=W5aJsVMS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6bb3f8eb698si8588336d6.157.2024.07.24.23.58.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Jul 2024 23:58:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=W5aJsVMS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sWsQP-00050k-Ek; Thu, 25 Jul 2024 02:58:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sWsQN-0004yo-U3
 for qemu-arm@nongnu.org; Thu, 25 Jul 2024 02:58:03 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sWsQM-0000tJ-78
 for qemu-arm@nongnu.org; Thu, 25 Jul 2024 02:58:03 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4267345e746so4212835e9.0
 for <qemu-arm@nongnu.org>; Wed, 24 Jul 2024 23:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721890680; x=1722495480; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PeGEmRBAOhT/xkRbn6ISbWil2tWD4PNocyMx9/v0nys=;
 b=W5aJsVMStgMHgh9fwRa/EP8kSG8YlVBqtaXZUYtF44h5er/f97FMLl9pfe8B700pOy
 Uv5x8MM9CJadiHVQMCPYVnmJxIXZPtBZFoaGoFg6SrruUr6wcN2vSjJBiPgS4Ho8StBL
 LbCG6z6qYDjQY0GrNCPbN/2lpAI5TBPHpConCL/x5AS687X28tkSUgP27n0T6f3R2xz8
 LNGRRjbwmiu90UoEf9A3ZqB8GuCjT4dV6gJS6cI5Kozu5+TB0IiB60Ytm15hoUHMqcRK
 qK7FjzgdTTvSD0gsTCoFhbcDRwO0cKJ01jAn/S4S5mTjZLubfj7TapH3JAn2lXWQGI8p
 jPKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721890680; x=1722495480;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PeGEmRBAOhT/xkRbn6ISbWil2tWD4PNocyMx9/v0nys=;
 b=sqOMoat/km+keGEWpLi4A74AOCw/rzbJ50tVp1J+h4t8C956zA6Tlu97XL6aJFayzQ
 aw87wF4Y/NmibYO9joZtDOc+xz4Mm1MOIUXlqtzrlTAc7U5appsQdfUz/hk6NbKCoIsm
 9MB9/Hn3mdUWfvB5SucQgycXE/EVGCGWjH/IvRH748I1BCZXDi1XQ6bjRc8uCOWftZhw
 kxtXNRG8X7w/p3A5LX+6zxuftuEb5kYZiHFLPifYb1kntRj20uSv3oIfM2B8uxCPkXZx
 m1VmWLAN0HGgnprBd1vSS23PbOGuOoO2VzauwYhuEUiciBzblL4DR6tuJfTnGvYv7GXF
 07AA==
X-Gm-Message-State: AOJu0YyUXq5TEmANXpHSwPK3YEcknjr9AWfBG9U7I/Ml4Wt/hDD1iCSR
 wra/X4U4PrcPlHE/H2V6mFhUlR14KDokfsqHaKVFW5IT5hCAfIAyg0Cnxqc4q5w=
X-Received: by 2002:adf:f281:0:b0:367:9851:4f22 with SMTP id
 ffacd0b85a97d-36b36443da6mr555218f8f.58.1721890680067; 
 Wed, 24 Jul 2024 23:58:00 -0700 (PDT)
Received: from [192.168.114.175] (164.170.88.92.rev.sfr.net. [92.88.170.164])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36b367c0aa1sm1070972f8f.21.2024.07.24.23.57.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jul 2024 23:57:59 -0700 (PDT)
Message-ID: <0fb1abd0-5031-4098-8e76-7f65fcbbddcb@linaro.org>
Date: Thu, 25 Jul 2024 08:57:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] hw/misc/bcm2835_property: Avoid overflow in OTP
 access properties
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-stable@nongnu.org
References: <20240723131029.1159908-1-peter.maydell@linaro.org>
 <20240723131029.1159908-3-peter.maydell@linaro.org>
 <a8291990-e161-4a43-a1c9-69040f1f6f93@linaro.org>
 <CAFEAcA8GPPy4P330P8kgbCxf=S+f8WGmB6tnAHN5bXxxyN9U=A@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA8GPPy4P330P8kgbCxf=S+f8WGmB6tnAHN5bXxxyN9U=A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: e7/WPV7yBmP/

On 24/7/24 14:31, Peter Maydell wrote:
> On Wed, 24 Jul 2024 at 08:06, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> Hi Peter,
>>
>> On 23/7/24 15:10, Peter Maydell wrote:
>>> Coverity points out that in our handling of the property
>>> RPI_FWREQ_SET_CUSTOMER_OTP we have a potential overflow.  This
>>> happens because we read start_num and number from the guest as
>>> unsigned 32 bit integers, but then the variable 'n' we use as a loop
>>> counter as we iterate from start_num to start_num + number is only an
>>> "int".  That means that if the guest passes us a very large start_num
>>> we will interpret it as negative.  This will result in an assertion
>>> failure inside bcm2835_otp_set_row(), which checks that we didn't
>>> pass it an invalid row number.
>>>
>>> A similar issue applies to all the properties for accessing OTP rows
>>> where we are iterating through with a start and length read from the
>>> guest.
>>>
>>> Use uint32_t for the loop counter to avoid this problem. Because in
>>> all cases 'n' is only used as a loop counter, we can do this as
>>> part of the for(), restricting its scope to exactly where we need it.
>>>
>>> Resolves: Coverity CID 1549401
>>> Cc: qemu-stable@nongnu.org
>>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>
>>> ---
>>>    hw/misc/bcm2835_property.c | 9 ++++-----
>>>    1 file changed, 4 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/hw/misc/bcm2835_property.c b/hw/misc/bcm2835_property.c
>>> index e28fdca9846..7eb623b4e90 100644
>>> --- a/hw/misc/bcm2835_property.c
>>> +++ b/hw/misc/bcm2835_property.c
>>> @@ -30,7 +30,6 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
>>>        uint32_t tot_len;
>>>        size_t resplen;
>>>        uint32_t tmp;
>>> -    int n;
>>>        uint32_t start_num, number, otp_row;
>>>
>>>        /*
>>> @@ -337,7 +336,7 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
>>>
>>>                resplen = 8 + 4 * number;
>>>
>>> -            for (n = start_num; n < start_num + number &&
>>> +            for (uint32_t n = start_num; n < start_num + number &&
>>>                     n < BCM2835_OTP_CUSTOMER_OTP_LEN; n++) {
>>
>> I find not making the counter size explicit and use 'unsigned'
>> simpler, since using 32-bit in particular doesn't bring much here.
>> Is there a reason I'm missing?
> 
> I just wanted to match the types between n and start_num and
> number (where the latter two should be uint32_t because we load
> them from the guest as 32-bit values). Otherwise we're relying
> on "unsigned" being at least 32 bit -- it is, but if we need
> it to be 32 bit then why not use the type that is guaranteed
> and says specifically that it's 32 bits ?

Yes OK no problem.
