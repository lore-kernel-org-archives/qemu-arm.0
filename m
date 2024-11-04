Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp2009269njc;
        Mon, 4 Nov 2024 02:33:33 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVisySi//5BGr7DqejQIYme2NsGRR0bkmslRxhcVi5GAgt3xfnsQzE6kUbdYWoS7SFzH4Q1hKhgwslIog==@linaro.org
X-Google-Smtp-Source: AGHT+IEe8iLajdW8N2utgOZ24ZbxLZmNrrw7ywUV6vHyj/65ozSgf+T6A3gdTSmv4UWD0deZ8mar
X-Received: by 2002:ac8:7d0f:0:b0:460:d105:c74b with SMTP id d75a77b69052e-4613bff9ce0mr509513801cf.14.1730716412950;
        Mon, 04 Nov 2024 02:33:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730716412; cv=none;
        d=google.com; s=arc-20240605;
        b=UiHF+dzdbujwburdvU2+qS200ISyDmKWEOKIdCUxdSfDRt3hL9fodrFzLS5P3aBn0h
         DqH3cDon8bZk94V+bbBNjvu0s5tnhxCSZ9CUFuZN/Pk4wt/N8wElnRPYwHz9+ETMvY+4
         BqDbbotkkzWZzm4kFzrZwZ+64AkGtJ2jlpkEHKGxoRAL4Zj47Lya1XDTE3MUYDMvgQAW
         /6fVnYVyQaAPtbmhTtZDOd0yNxfjaRR24nW9P2/UCk4IdUvNjyYvEoMa+CaSX6whqTzs
         Walnl9n0dBcGBQoJZfAvFTnd9mSexOeUqDtUnC0ULWVWopyOQ8yledphj0d16YzgjOPx
         +usQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=KzVHIa4009J5lHNdd+RPwSYq34F+AL83D7dZKkSBSu8=;
        fh=T7T3FvWt+K2UwFyFCe4yHy4tTL0D85SgIKzFuISN0Sg=;
        b=dufg6gqOgby5EtZxYQZZCADXAHMH7UIxDzU4iCCaPrtsHe6apL/z+k8JHFWbS8Q4S7
         q7zwscDhxzLXvepGRrmz4x1oLDAAvlAfC8sG5WXFKyMRtKejnqCWr42ZUu6I+IQwVDS7
         /THDkSvFCWID6QROvvlHdVKzBKp5FxS1OneMfGROuBRHUyWjS8vlsHKEXd0fNGAtEInU
         M6q0eFZ1ObpRvu0/CebyuGQ9giMKC7mtfg12v+mbx6r/pL1HMmLyZ5/ftppthK3flfCy
         UhuEiZUXhWvB4Ru7rKK2VmVxxAnD1IVwQvkkyM8EYyZV6TE3O5v8VQbAC0HCgBhWPBUj
         T3WA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Vl6ejsj3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-462ad0b1c36si109978641cf.36.2024.11.04.02.33.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Nov 2024 02:33:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Vl6ejsj3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t7uOk-0004BX-EP; Mon, 04 Nov 2024 05:33:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t7uOi-0004B8-Oc
 for qemu-arm@nongnu.org; Mon, 04 Nov 2024 05:33:24 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t7uOg-00010p-SF
 for qemu-arm@nongnu.org; Mon, 04 Nov 2024 05:33:24 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4315e62afe0so34982865e9.1
 for <qemu-arm@nongnu.org>; Mon, 04 Nov 2024 02:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730716401; x=1731321201; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KzVHIa4009J5lHNdd+RPwSYq34F+AL83D7dZKkSBSu8=;
 b=Vl6ejsj3/bsBMPi1Bsdr9i88FFeWd904aJyLEDbYkuzrcAIwk/kiq2TPv+WdRPoo/x
 SoK0gD3njjAk/robrkpZY25PL7kPEDgQMd82dLsU51Zs+9juphrRc8d8dywO5fA64L+S
 E2Xjba3X7uIeB61drVL2WSM3AoYHcECYspExjf0OMZIJx5NlO2Bg8RbH4RCJyP/rg2ka
 fPlPeFSYpQWz9nsyaCmHWlm0C3ShEUH0L38boyU+aQWSI4oY39YBSDnKp46DzhuCn1me
 GVNQY+bw7cuGlMVNbJRpT6MuDVWyUCx9MvbQvVclu4TJUJ/uYIhT8/Mqw933ahDXFcIH
 j7Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730716401; x=1731321201;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KzVHIa4009J5lHNdd+RPwSYq34F+AL83D7dZKkSBSu8=;
 b=EwBsB6anpuKYy3glHa9M4GlMz5SNxLkGGJT+UYjzvhmOqZJ5anrxPkbUfDraPwWGiM
 yEFKR9nRJGRf2pnBIg4YKpbgWI88HoE5WG8CSSSUdz1ZChwScZwRZ68zvVfmGDefOTtH
 vxJjmPvpU1XZ/HAONLyoyhxZf9wHcJudGVjh45NW3v9Cho37I00cpPkuHukSK0BN0EoL
 SrC52Hmzusuz3wix+qyZ6LF/moxppP5u77jxHA+RDGXPYPyGdiwnL7y2ofYxAsc+j/gd
 G2yPaEAOnsBq0t/ebJY/CASJ8qEOoeZTKxqoZABFbFYHHHA4S/azsFkVuZgTkiee45FE
 KM3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXPvIfCF8j0CjAZfdvoNt5WJOLbAMd1JPkxkMO0DSN4hoMjfCyizq5WqF2Yq80xesuhHTAKH5Icw==@nongnu.org
X-Gm-Message-State: AOJu0YxnTr/mUttAc5tC1wHbcd5Ozl+VBQpnSKhIspm6e7YuFQ3LeNpf
 ++A0XOXS8cSU1DulclaisGji2DMrGexckyn3R2OxLiTKSx2xpI+8cFJCtLofDz4=
X-Received: by 2002:a05:600c:458e:b0:42c:baf9:bee7 with SMTP id
 5b1f17b1804b1-4328250f211mr122777275e9.12.1730716401195; 
 Mon, 04 Nov 2024 02:33:21 -0800 (PST)
Received: from [192.168.69.126] ([176.176.145.27])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4327d5e8562sm149387215e9.23.2024.11.04.02.33.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Nov 2024 02:33:20 -0800 (PST)
Message-ID: <9ecb2c75-3e1f-4c3b-918b-af40fa3d6fac@linaro.org>
Date: Mon, 4 Nov 2024 11:33:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/sd/sdcard: Fix calculation of size when using eMMC
 boot partitions
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Jan Luebbe <jlu@pengutronix.de>, qemu-devel@nongnu.org
Cc: Guenter Roeck <linux@roeck-us.net>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org, qemu-block@nongnu.org
References: <1bce4c22-9281-44c5-8acb-860881dc271c@kaod.org>
 <20241028162308.2152712-1-jlu@pengutronix.de>
 <9fa94cbc-8010-4805-be44-939ce35182dc@kaod.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <9fa94cbc-8010-4805-be44-939ce35182dc@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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
X-TUID: E8pwbwGLjYvR

On 2/11/24 12:06, Cédric Le Goater wrote:
> Philippe,
> 
> I can take this patch through the aspeed branch.

I missed this patch because it was deeply buried in a long thread.

Since you mentioned this feature will be reworked in the next cycle:

Acked-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> 
> Thanks,
> 
> C.
> 
> On 10/28/24 17:23, Jan Luebbe wrote:
>> The sd_bootpart_offset() function calculates the *runtime* offset which
>> changes as the guest switches between accessing the main user data area
>> and the boot partitions by writing to the EXT_CSD_PART_CONFIG_ACC_MASK
>> bits, so it shouldn't be used to calculate the main user data area size.
>>
>> Instead, subtract the boot_part_size directly (twice, as there are two
>> identical boot partitions defined by the eMMC spec).
>>
>> Suggested-by: Cédric Le Goater <clg@kaod.org>
>> Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
>> --->   hw/sd/sd.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
>> index 2d3467c3d956..8430d5ae361c 100644
>> --- a/hw/sd/sd.c
>> +++ b/hw/sd/sd.c
>> @@ -826,7 +826,9 @@ static void sd_reset(DeviceState *dev)
>>           sect = 0;
>>       }
>>       size = sect << HWBLOCK_SHIFT;
>> -    size -= sd_bootpart_offset(sd);
>> +    if (sd_is_emmc(sd)) {
>> +        size -= sd->boot_part_size * 2;
>> +    }
>>       sect = sd_addr_to_wpnum(size) + 1;
> 

