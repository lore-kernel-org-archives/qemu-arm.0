Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp815216njc;
        Sun, 9 Mar 2025 15:51:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVERtvaURfi7+Z3sThQhjwl73z+2pNwNnml5B+P5toc8rIKixPmRvwmS3DiDEAkdduUbV3KKCfxN8sZLw==@linaro.org
X-Google-Smtp-Source: AGHT+IF2fk8PeTQGMrNKkSNcoiwwTKk+azTXZSSbTPC7w5V6t1JRgeOZ1tlTPXS9cJ7/25QkTUUC
X-Received: by 2002:a05:622a:438a:b0:476:7a49:b391 with SMTP id d75a77b69052e-4767a49c122mr40551041cf.13.1741560667262;
        Sun, 09 Mar 2025 15:51:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741560667; cv=none;
        d=google.com; s=arc-20240605;
        b=lkeCv0lDiqO9ZAW2N6GBBU8rggqowi2i94Oar0/NpbIKb4DInAJ92KwnhkKJdG2Fj2
         doYftcJs5Je/qhbrcFhZK3nbGRW1zP4YnBRLGCovf+ahDhEyhsyNOE7L0H8+SYEyDPzy
         uYTQocbc4FroKqC+9dmhQBml+PcAGVmI6SzW3F0G0fLSDZ/sN4XzhkP60AIuKVB9PeNN
         H26t/b9yDQRGFY/bS/ziuXzX76FGNXpHQaQ9eMpYy4z/QJYXy8xhBsIjpJyWRTBgKREw
         LwFFrWCqD2v48fRaKvFXIkYFzT19XprpYjm7T4kGyp4yGnhPqB6lNw65tXUlit/WlvlJ
         6afA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=emhrjQh6rm6pY3Eq5kh1A/vXP/P4B0XqxYTQWqK6tq0=;
        fh=ijswxb4O7NSQ7QoQTLiNnHpiCUpL3W8SKsC7qhREvuY=;
        b=avKvhb4j6h6952YjpYGoaeMtgyfHboycx7MJj5yb5ClDfKoGjUfvHaBmInYTNkOg8P
         Rm8RdEmE7C+4y5TrIPYI1oyzjNxoUVbPt68muEcuq0tsu+qk2ZKeoqtTZXkoyNVaEin/
         PTSWTTJR3sv76XhPCbF/FM3LlFjls4PiKppkPch6PS5GQW0bi9BLJ6Lcexqb8DpHNCzt
         +Sh602L+9qOoy6R+gH0UeWOdRGNl8z+wdpyw4OVJs3M+jShedo6AYx2JEpi1NVoPEK9K
         eqZJefpIKzWkeSX6YDSN5IRW0SmDpG6At69XCJJofDN0iSg9SPAglaBRZBFxGRTu4UPB
         BM+w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZUP78vkN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4767d8e5c2csi20122461cf.27.2025.03.09.15.51.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 09 Mar 2025 15:51:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZUP78vkN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1trPTR-00075V-Pk; Sun, 09 Mar 2025 18:50:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1trPTI-00074f-CC
 for qemu-arm@nongnu.org; Sun, 09 Mar 2025 18:50:12 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1trPTG-0001oi-LF
 for qemu-arm@nongnu.org; Sun, 09 Mar 2025 18:50:12 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-390cf7458f5so3401694f8f.2
 for <qemu-arm@nongnu.org>; Sun, 09 Mar 2025 15:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741560608; x=1742165408; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=emhrjQh6rm6pY3Eq5kh1A/vXP/P4B0XqxYTQWqK6tq0=;
 b=ZUP78vkNV65fXrXAomApTqyaEPoVw0MJqUi0URoqt51+WJWKLQs7IbVL1JanquYJZk
 5ZjAcKJ4IB1o+wKaXCVdNTVe+5MDRQTggtVHvYeqbJEyMMa9d2CL+V806BAxYAThGDnw
 WHrfmpZb3BloZUg8b+estLDpinnPummFZ1mpgzk97PyU47xHzlqShtdjxER2expvKpEb
 gObp/IoHZ4j4OV2JBc4ajuEuEEUqkygbUeMjtmy/4bf1kCWoS5s79qrCsYQfR9eJT5TD
 hokBXWh0Pc4N3RZm1InhUd/757J/cbrbA422OuO4LTRkFpBrTULjWxYyZkSblg/UhuJf
 jMig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741560608; x=1742165408;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=emhrjQh6rm6pY3Eq5kh1A/vXP/P4B0XqxYTQWqK6tq0=;
 b=JDUS8Tr3uzJFL2q84Tdr23LtM6ZaA96gpQNjM2Atsmzh7RIUtMQGL2/05GO9YffK8Y
 nlppBpFrKNWQ0CFR3m92zfc8S4szsjuxbTuc9sdi7uYZ52QfTWqvgxE4Gry26Q7fGH7x
 UU0vNNMwsn3hdneQgZ10qqqgm8xOFB6FhZq8Op62YWngZ8gax5bOB2Hmf0HtTje5DKd4
 F87HY98Hz8hf4UCc+GgcJ4d1aKswNh/pn618J8z0BKF0fR+WPg+x9uoU1r3ME1rcCUJ2
 tRGw6iWs4b3FoB0smZ9zmB5mOLQRfq5/poIGSQ3mFmC4b03RwrEX7Myl5vF8FzoD+kWz
 3qPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJjLZSgoE5Zum92xRsuKut0lTpukKZk2gb8uoos91SBm212xwxaBW4zCs2jkANL4UZD7NFWO/K1w==@nongnu.org
X-Gm-Message-State: AOJu0YwERlmM0drLWQ+grOgyKL1g9ISxtTw0tQtRcHdppvl/C6CRSvcq
 /NMvxkCxuEDACNoGwGmZMVBa2Zvce3c20FSwGdX0AtlX+o82e3Mlet/yk+KiMGw=
X-Gm-Gg: ASbGncvF1Oo+H8Oz/wXjEKDO41tPmBr2nw53u8HDMe5bWQoxP2+7jiVEDm2U9ctQ70A
 K7q25vVt02EvZ/uZwZ3rsbXLtvFWIPua1tmTmxRYrNL+lnIXCgbSlZZDWrbDyGPgMMp2eESLzF4
 hgnq94kTQhFjgP0LttUQ7cCwjNk+EFJ5MeHcI0rVP8h73BJexHHt5TX/n7HPE+mBBC83sNjXJFI
 rIiQI21ZGskiQMYMkIO1u74AXGELm/rHPX66EH8Cn/TXZDLEOXf58rEoV4D3B0akxc3NvCYB1wf
 lMmeFMGe4lCln9C3WeF+QI+yDDOr2ji0WwFAvngKOKIgxFlFJuHXYgnoqM80vskxX1L3OVnwuwE
 IwLFxQUET3ZRg
X-Received: by 2002:a05:6000:1f8a:b0:391:2e31:c7e5 with SMTP id
 ffacd0b85a97d-39132d093f8mr8314320f8f.6.1741560608090; 
 Sun, 09 Mar 2025 15:50:08 -0700 (PDT)
Received: from [192.168.69.199] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912c01d2cdsm13216634f8f.57.2025.03.09.15.50.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Mar 2025 15:50:07 -0700 (PDT)
Message-ID: <6797072b-6a7d-46e0-bfdb-17b9888d8b0b@linaro.org>
Date: Sun, 9 Mar 2025 23:50:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/14] hw/sd/sdhci: Unify default MemoryRegionOps
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Guenter Roeck <linux@roeck-us.net>, qemu-block@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>, qemu-arm@nongnu.org
References: <20250308213640.13138-1-philmd@linaro.org>
 <20250308213640.13138-10-philmd@linaro.org>
 <6FAA573C-D92D-451B-B69B-F4B9095F9F0C@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <6FAA573C-D92D-451B-B69B-F4B9095F9F0C@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
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
X-TUID: AP03mwjJnOdH

On 9/3/25 10:27, Bernhard Beschow wrote:
> 
> 
> Am 8. März 2025 21:36:35 UTC schrieb "Philippe Mathieu-Daudé" <philmd@linaro.org>:
>> Note, sdhci_mmio_le_ops[] was missing .impl.access_size = 4.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>> hw/sd/sdhci.c | 46 ++++++++++++++++++++--------------------------
>> 1 file changed, 20 insertions(+), 26 deletions(-)
>>
>> diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
>> index a2e7162e289..23af3958a1d 100644
>> --- a/hw/sd/sdhci.c
>> +++ b/hw/sd/sdhci.c
>> @@ -1372,30 +1372,22 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
>>                         value >> shift, value >> shift);
>> }
>>
>> -static const MemoryRegionOps sdhci_mmio_le_ops = {
>> -    .read = sdhci_read,
>> -    .write = sdhci_write,
>> -    .valid = {
>> -        .min_access_size = 1,
>> -        .max_access_size = 4,
>> -        .unaligned = false
>> +static const MemoryRegionOps sdhci_mmio_ops[2] = {
>> +    [0 ... 1] = {
>> +        .read = sdhci_read,
>> +        .write = sdhci_write,
>> +        .impl = {
>> +            .min_access_size = 4,
>> +            .max_access_size = 4,
>> +        },
>> +        .valid = {
>> +            .min_access_size = 1,
>> +            .max_access_size = 4,
>> +            .unaligned = false
>> +        },
>>      },
>> -    .endianness = DEVICE_LITTLE_ENDIAN,
>> -};
>> -
>> -static const MemoryRegionOps sdhci_mmio_be_ops = {
>> -    .read = sdhci_read,
>> -    .write = sdhci_write,
>> -    .impl = {
>> -        .min_access_size = 4,
>> -        .max_access_size = 4,
>> -    },
>> -    .valid = {
>> -        .min_access_size = 1,
>> -        .max_access_size = 4,
>> -        .unaligned = false
>> -    },
>> -    .endianness = DEVICE_BIG_ENDIAN,
>> +    [0].endianness = DEVICE_LITTLE_ENDIAN,
>> +    [1].endianness = DEVICE_BIG_ENDIAN,
>> };
> 
> We introduced sdhci_mmio_be_ops and the endianness property specifically for the e500 machine. We always lied about the endianness property to be implemented for all SDHC types, e.g. USDHC doesn't implement it. Since you'll introduce a dedicated FSL_ESDHC type a few commits later, along with its own MemoryRegionOps, I think we should drop the endianness property and sdhci_mmio_ops doesn't need to become an array. Dropping the endianness property also results in avoiding the error conditions you have to deal with in the realize method.

Great idea!

