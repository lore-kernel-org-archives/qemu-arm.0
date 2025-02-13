Received: by 2002:a17:504:240b:b0:1be9:327d:8ee3 with SMTP id v11csp535336njc;
        Thu, 13 Feb 2025 04:15:47 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXrh7HeSnPV+oPiGlvuVUBFldLJq01K5uMXh4tygvVnFKyKI6zO6JMiNzV0H2cUbU02NOgoVnVZ5raQCw==@linaro.org
X-Google-Smtp-Source: AGHT+IHt4VK4hagueBUJyG6agvUd+UJiQ0N4fEfNkApxIAz5+x2np6ij6U44aiywu8QfAAOQQV05
X-Received: by 2002:a05:620a:170d:b0:7c0:69c8:9015 with SMTP id af79cd13be357-7c07a10de5bmr515570685a.9.1739448947539;
        Thu, 13 Feb 2025 04:15:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739448947; cv=none;
        d=google.com; s=arc-20240605;
        b=F+rXmS20Q3JZu4JF+93BLN1kyEkFJADYUNXp9BNsMZccvMMyKfJZ+XqlwEakuy/8kV
         j1+0uscWfOc3SMeh0SrFbxqI/6v3VbBWAjHS5h2Uq1LZLLM/jw6cPnHfNsBFxh95hDLl
         byb18NtXRq6Ip87d9z7ulatTCPcRl93Jbi25pn5jYFn1C5i4qiBjTaRi2yz9AR1OhVo0
         b4zE1tSXIbkfkx09I13jDSNsv3+BIH1TVo0gtiuQUA/lu9S97ZudjZ113wiH1lK3CHAD
         /5p93w3SnBHsmYaxVt+zWmnrbRWD8JbbHyZApTFi5OOuN7/Rp4k/eavMGuZyWANh30QZ
         MEzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=vzaZlFcD7N8Wjjl/eyiqiLniNbSdtEp+pnDniDyde9g=;
        fh=S9Adz2kfDwkumqhJ5HIrdoXUKoToleRNm+JrxDnEDR0=;
        b=YP0O29jH8Z2y7xy1ba+IjHK/L/vA2svbi/kF7j0ilwS7qnf/EeJ2ESDdnFNsBrjWET
         F+ZqEBXY0eTHjhjLy4XowqXIgkDZ4MDZyj34Kg3yo70BQJeWc+R4Uzd7gQZLxHKVgWXi
         kKYZNFeqrG+wyM3kBLt8f3l7FBbI6BjAczVDj64fJ9+lq7j4tdipollCpM0r9BGvMYf/
         6yTp0TcyeQouV7lR+3f0wLBuRTvKoip8SVhsZzk+V2CbrA4V0jkr94c9YlQ0+C5KFjLt
         17PtsjDpQztyaIRZUSxyB7qFWZgg+r/Wc+QNxY9UPfy6RF2WPJprdPwmtIYTflcvQRZY
         bb8A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Pg3FHKIS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c07c8921ccsi124261285a.342.2025.02.13.04.15.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Feb 2025 04:15:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Pg3FHKIS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tiY7r-0000MZ-QC; Thu, 13 Feb 2025 07:15:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiY7h-0000D5-W8
 for qemu-arm@nongnu.org; Thu, 13 Feb 2025 07:15:24 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiY7d-0001bV-3A
 for qemu-arm@nongnu.org; Thu, 13 Feb 2025 07:15:14 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4394036c0efso5024505e9.2
 for <qemu-arm@nongnu.org>; Thu, 13 Feb 2025 04:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739448911; x=1740053711; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vzaZlFcD7N8Wjjl/eyiqiLniNbSdtEp+pnDniDyde9g=;
 b=Pg3FHKISHaAtXrGWtFVY08TIL9aysYhOYseQmcTFL8CK2Eno5IVrGE5PCwC/2AhwWo
 5BOHM7y+9q1djsgMw9Up3FQARK7f+666Qvs7AKlyIGbbLbnBY2fvvMcIVPWKeAJKN8HZ
 Val2BwDAiFFmx9a7ntb6nizQYrG+TEFo6VfTnekbXJ3d+viBk6L8z525voyeWozQE7OA
 kIaVZHhSzJgTquFRCMFpV7MKIT6/OF/lpgiOYhe1gaMlMbq1uEj4olGPOdijo78k1x+b
 Xdss8pQb3GuvdA+I3hWniuPOXKufIemugpilf+Rcl2zJispv9gqiD+33+S4zXlo9g4bB
 TSxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739448911; x=1740053711;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vzaZlFcD7N8Wjjl/eyiqiLniNbSdtEp+pnDniDyde9g=;
 b=nP3f6hIlaotI7AYnIpQkzdoNYCWKB1uhygm4RjZsEAgRKELo1i8aL21BmPpDnJ8/gd
 ijTB1teUNq7BgUJOvL/xJT7cJeEFwHT9S2HT84qo9uxHXLFCPRFw8KYWVelpjYv5pepS
 UBdgzHDeq5lb1u+bNy4R8M/kBgO3+dhaZLCUV0Lq4jSD2ztgXZb/4B0ESoNftpG6KQcJ
 O5Uks5z64Qs0t8b4gmRir05cGgk1H/eSc9EOSAQrzOvZyjuAzV1JHN5sgSosXlUYRuTN
 2MyC8IUgrDWqPi/WIoD45JrzAInMumJZMHjRpBQgU/QJqsYFY7zUKST67Y/YSPoPyuvT
 BcPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3lSZqMclUzStYzsGigDL87iIxrn3bZMUQJMxtZCNhR2xasfgcvSmgzf77lKcmISIXBow7a5mJZg==@nongnu.org
X-Gm-Message-State: AOJu0YzeWZu3n/XeilIxuht2WrIlTJOU8/VVkcLaMDq334d/m3M55ovU
 sI2DTeEf/Myah0IA2s5IlaNZRm6yapcS8pflhLf/3+17tVNXW/aKKHs7vg9Amtw=
X-Gm-Gg: ASbGncu243EImJD5ofS0yXdWBvUmgFNFkg5Y4dsdR+FdKcmMoYrWzvnDBF+x5CcEe/J
 pBWHAKKq1r/fVgTFTMUyEcR5IPihMnEVnuLmOawB+l03wP0TPVxe81A4vyexwuJtK0jlZDqKvY9
 yXhs1foRiM6KSlJqBr2NYmQ2xI8FRwE0Y4t+aWnzZRTdEGtxn9o7QS7m5ULKjJ2pdEpPsLJlQNe
 Dn368E9+t/P7AmAmGa0Hjg74/PeQvBSANaSjJYVUPlf+JNlkpksmvW6qF5DwtxUbifbBJC5a4aI
 veuLTg8jqDO5UN5q1xN8jtLNV2bBtkzuwyhihtkLQIc2GuA=
X-Received: by 2002:a05:600c:444d:b0:439:5529:33e0 with SMTP id
 5b1f17b1804b1-439581bf09fmr64411835e9.27.1739448910744; 
 Thu, 13 Feb 2025 04:15:10 -0800 (PST)
Received: from [10.223.46.213] (6.170.88.92.rev.sfr.net. [92.88.170.6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4394f2c2c41sm63499255e9.1.2025.02.13.04.15.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Feb 2025 04:15:10 -0800 (PST)
Message-ID: <57ab57e3-65cc-4301-922f-87dbaaf85d8b@linaro.org>
Date: Thu, 13 Feb 2025 13:15:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 02/10] hw/intc/xilinx_intc: Make device endianness
 configurable
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 Sai Pavan Boddu <sai.pavan.boddu@amd.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
References: <20250212123659.52764-1-philmd@linaro.org>
 <20250212123659.52764-3-philmd@linaro.org>
 <8e5050d7-2792-44af-8317-2dd6948f72c7@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <8e5050d7-2792-44af-8317-2dd6948f72c7@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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
X-TUID: 7Eo8+dOKqy/V

On 12/2/25 13:56, Thomas Huth wrote:
> On 12/02/2025 13.36, Philippe Mathieu-Daudé wrote:
>> Replace the DEVICE_NATIVE_ENDIAN MemoryRegionOps by a pair
>> of DEVICE_LITTLE_ENDIAN / DEVICE_BIG_ENDIAN.
>> Add the "little-endian" property to select the device
>> endianness, defaulting to little endian.
>> Set the proper endianness for each machine using the device.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
> ...
>> diff --git a/hw/microblaze/petalogix_ml605_mmu.c b/hw/microblaze/ 
>> petalogix_ml605_mmu.c
>> index 8b44be75a22..55398cc67d1 100644
>> --- a/hw/microblaze/petalogix_ml605_mmu.c
>> +++ b/hw/microblaze/petalogix_ml605_mmu.c
>> @@ -111,6 +111,7 @@ petalogix_ml605_init(MachineState *machine)
>>       dev = qdev_new("xlnx.xps-intc");
>> +    qdev_prop_set_enum(dev, "endianness", ENDIAN_MODE_LITTLE);
> 
> Do we still need a TARGET_BIG_ENDIAN ?: check here, too? ... the 
> petalogix_ml605_machine_init() code still contains it, though big endian 
> is marked as deprecated and untested ...

Oops, I guess my mind already discarded it...

> Anyway, assuming that nobody uses this in big endian anymore:
> Reviewed-by: Thomas Huth <thuth@redhat.com>

Thanks!
