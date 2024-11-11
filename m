Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp6581220njc;
        Mon, 11 Nov 2024 03:59:41 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX0hRK/ySscTOUZKaTKk7PCwIcPbGt1+QPqGJ79hqSxFMIepDGei9Uh9PsCCvh5p90NaseJvoOBpPfgdg==@linaro.org
X-Google-Smtp-Source: AGHT+IHTTHcJedE4+mp3qZUFwVvNIKy/pZ7FSfOvda6Ra9QlyV9L5xpOAsV61+nnWnXPkNBQitLk
X-Received: by 2002:a05:620a:4491:b0:7a9:b9c6:ab4d with SMTP id af79cd13be357-7b331f2eb63mr1486463385a.51.1731326381496;
        Mon, 11 Nov 2024 03:59:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731326381; cv=none;
        d=google.com; s=arc-20240605;
        b=XfFCXatv1PFvHjH/SA+/1M4mhdtUwLblwz+m/gsD4UASjLx9OHWxzk9fcrT1/B24kP
         jCPjJ4wgvHisXsuoxjTj9eXtIHwxe96t5BBA/3Yv2orpZPrA0ybqb7vQsZkBiPM7i4LY
         +hgbWEW6SRAx+eQ8uAHsdRuntf61qjVMyaMxEgvJwFvAjnT/yJ036rhzKtn8eB5gWdUn
         CXWX3ZQf0gvaTaWHD4QMb8XHKl+XYp/DbJFyqErisBFaO9tRxaYHh0f3qAzj0jjLnt48
         pWSDU5BoMXWAkvf5d5uSlT3W0u+e93v9x9a7oqzbhkCWtrttKKub8SQMvApfMFzcg6om
         MoVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=kn9Rue13f/u+Er6gLvrFcstgO2g6Uo1SDafHxtBdCH4=;
        fh=QvrOo4buaF+G43EwTw5xQLJ8zaMYoHkspwqVCXqyoDE=;
        b=kxzMbD4hV0JQWB8uHltJ7PdMXRVq4XND+kvYxjio/AjQgT39mQlidrvJVpLR+cSxVf
         nyH/qHD7pqByLuDtGRPrZbHMTVWwlgwThU1W0zoW/Y3YGsosUf0P/D/XPMI4bHj0EbZI
         Q3S8oFOEIPCZRnzsILakJqg49yMmUhXhZJIeWBMS/O/mlIUJ4FoNj9cYlMJ77zhBez1c
         H+htB1q1h6BEWqelavEun+xnapnr2nau0ADJAuXDIVbXuHYwA6pmgVrZoAtv8w6IzEnX
         o55XG0/XzozcV8O3p2TjYwDtCqbVXsAgUXzy0YLKHfugok1t3vc+7Z3Rle+5YnQ2+jdu
         tCHA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nTOVhpQO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b32ac3d3fcsi1129163885a.29.2024.11.11.03.59.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Nov 2024 03:59:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nTOVhpQO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tAT4Y-0006S8-9s; Mon, 11 Nov 2024 06:59:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tAT4W-0006RI-NR
 for qemu-arm@nongnu.org; Mon, 11 Nov 2024 06:59:08 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tAT4U-0006RF-JP
 for qemu-arm@nongnu.org; Mon, 11 Nov 2024 06:59:08 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4315df7b43fso38007215e9.0
 for <qemu-arm@nongnu.org>; Mon, 11 Nov 2024 03:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731326345; x=1731931145; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kn9Rue13f/u+Er6gLvrFcstgO2g6Uo1SDafHxtBdCH4=;
 b=nTOVhpQOkObRC/7ySUMynkj5MonKnRB4uHglPGFVhQNXbcZAWFSeBaiQhJrKbdLxJk
 TE15nj1fP9bbvBTDBL/JSgkP1fjTn3WWDptEpGKV1bF0YlGzCfeAI9YMNolFP14J3JDQ
 fTx+c8ljLXWasEz6Pnuzvyp44XQ3QUUkLazRnkfA+9kpRTsqJegSYhi492xphWmxpbUD
 pyN5DRwxzg+PVKLg+5RdVi/dUr7mA9Ku/mhMr5MuWOT37ntp2RM2kmwhdXkPWhtbEucR
 YFn+HEDgum9dcZiTSTbpqt+/NGTj4hLBa822r9qzP3CBALXJ4D3PED1bBSJbHSb7Ltlr
 /9bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731326345; x=1731931145;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kn9Rue13f/u+Er6gLvrFcstgO2g6Uo1SDafHxtBdCH4=;
 b=Jnp1aFdkBB6efaKX6R483B2bMYozIhHDxtKo+obuKShTNtG7Q8yxAZdktXVl6UYCh1
 goifOPdpaEQvOouq8z7xQlSE/mxffCBIK6B7bM9wgBwkZ4Ds2wOztpy3XpadOMo4SfJR
 4NSGc/3ftfeOS9T93CZXkyfbvoiwUcsIXnRCtuUdjJ9eV2ehnYi88QnmfOC/Cc/uWt7Q
 0RjRwSo2MhvcxB7MCX29p+gkMXkoaO9AwH3CjQf6kQSPMgxYHwXnghXhuiEs5pUo93Ci
 QPTCf2YKePcuBQvT79UagqKcPEgv4F5GXmWbkREwl+bD/Df7dnME0vAXKu+FRZODBid/
 Jtrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOAGa0doaI+Bl7DuiN8SzfJufpxEBRIQDHkmbauaKw5SdtLbvOsevEbbk7Esi5/xlRQM0CJsUtTw==@nongnu.org
X-Gm-Message-State: AOJu0YyhmnIoCGriO20f59Ej0CoOHcYGujQ35ORBr0wfovjRnKxaR+aw
 itBrixTK9Xstlvzwz7UN17A8le02D2QFj9BILRi8k3Ee9YJbGa8sf0KtMwrmfmE=
X-Received: by 2002:a5d:47a4:0:b0:37d:3f5c:5a83 with SMTP id
 ffacd0b85a97d-381f186cb79mr9979467f8f.19.1731326344961; 
 Mon, 11 Nov 2024 03:59:04 -0800 (PST)
Received: from [192.168.69.126] (cnf78-h01-176-184-27-70.dsl.sta.abo.bbox.fr.
 [176.184.27.70]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381ed970e18sm12628331f8f.10.2024.11.11.03.59.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Nov 2024 03:59:04 -0800 (PST)
Message-ID: <07782067-bd0a-44da-ab89-f3bbe443e349@linaro.org>
Date: Mon, 11 Nov 2024 12:59:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 15/17] hw/microblaze: Support various endianness for
 s3adsp1800 machines
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Anton Johansson <anjo@rev.ng>
Cc: Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, devel@lists.libvirt.org,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>
References: <20241108154317.12129-1-philmd@linaro.org>
 <20241108154317.12129-16-philmd@linaro.org>
 <cf73685f-df95-4165-a642-ddbbb5efb64e@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <cf73685f-df95-4165-a642-ddbbb5efb64e@redhat.com>
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: tTUiLmuV9+UI

On 11/11/24 07:56, Thomas Huth wrote:
> On 08/11/2024 16.43, Philippe Mathieu-Daudé wrote:
>> Introduce an abstract machine parent class which defines
>> the 'little_endian' property. Duplicate the current machine,
>> which endian is tied to the binary endianness, to one big
>> endian and a little endian machine; updating the machine
>> description. Keep the current default machine for each binary.
>>
>> 'petalogix-s3adsp1800' machine is aliased as:
>> - 'petalogix-s3adsp1800-be' on big-endian binary,
>> - 'petalogix-s3adsp1800-le' on little-endian one.
>>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   hw/microblaze/petalogix_s3adsp1800_mmu.c | 62 +++++++++++++++++++-----
>>   1 file changed, 51 insertions(+), 11 deletions(-)
> ...
>>   static const TypeInfo petalogix_s3adsp1800_machine_types[] = {
>>       {
>>           .name           = TYPE_PETALOGIX_S3ADSP1800_MACHINE,
>>           .parent         = TYPE_MACHINE,
>> -        .class_init     = petalogix_s3adsp1800_machine_class_init,
>> +        .abstract       = true,
>> +        .class_size     = sizeof(PetalogixS3adsp1800MachineClass),
>> +    },
>> +    {
>> +        .name           = MACHINE_TYPE_NAME("petalogix-s3adsp1800-be"),
>> +        .parent         = TYPE_PETALOGIX_S3ADSP1800_MACHINE,
>> +        .class_init     = petalogix_s3adsp1800_machine_class_init_be,
>> +    },
>> +    {
>> +        .name           = MACHINE_TYPE_NAME("petalogix-s3adsp1800-le"),
>> +        .parent         = TYPE_PETALOGIX_S3ADSP1800_MACHINE,
>> +        .class_init     = petalogix_s3adsp1800_machine_class_init_le,
>>       },
>>   };
> 
> Do we really want additional machine types for this? Can't we simply let 
> the user set the machine property instead? (otherwise, all tests that 
> run for each machine types (see qtest_cb_for_every_machine) will now be 
> executed three times instead of only once). IMHO it should be sufficient 
> to have a machine property for this and add proper documentation for the 
> machine.

Machine property was my first approach but then I figured when merging
the 2 binaries in one, it is confusing for the CLI users.

Having 3 more tests until we unify the endianness binary doesn't seem
a high price to pay to me. Besides, not we are not exercising the same
code path. We need to prove the tests are really duplicated so we can
merge the binaries. If you really insist I can modify qtests to skip
these machines meanwhile.

> 
>   Thomas
> 

