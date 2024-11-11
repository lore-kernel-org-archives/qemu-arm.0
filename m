Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp6584616njc;
        Mon, 11 Nov 2024 04:03:29 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW21Qo+LYhrcfasn4S9yx/SU6OqlqRfGL6iaE0NH9ViZWp5Uspl+8DHQkErXboPK1pKb/ZtQxGVmqZo8w==@linaro.org
X-Google-Smtp-Source: AGHT+IHnzGcwzfLlAzMwdBK9kzTxQFmCUcz7hoN5uUh+06zBBLql91ZCWz3ftj+QNDL0BE8MeAxe
X-Received: by 2002:a05:6122:da6:b0:50d:354a:19ae with SMTP id 71dfb90a1353d-51401ebddefmr10043301e0c.10.1731326609269;
        Mon, 11 Nov 2024 04:03:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731326609; cv=none;
        d=google.com; s=arc-20240605;
        b=QeuwXh0Citl/pfqEf+Wa44q8dptN8HVZ67qMirmm8El6W8+nD1T5KdAM4fMuXRJiHm
         jU0lhkDE/6FtFVm7ZWcP5P21G+XHIlofQfVqCbpgmov2xfokXzb4/r6E3Q3sLJGtLnc/
         t6OtB9NBzNfjAn6fW5F8yX+qFdH+O2XjE2N3vIZAg+TDof9vrLpUcIxLF1wb/j7Y+rWh
         KkURJjBhwjLIkuu8yPfILgE84C+10uEDxDgqXRTCQawWwUpxO/vwRzWbjnvXAhYnU8bC
         Ne4EXc1nJMDi6hjXuWmZY0aoIZ6mLlNdN306ANld96X3ynyHNzzx6NPxuV6txoU34I+G
         aAVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=dnMmNO50aDzoHtK5dRqtoMLJToObkbj4apMesAz6wjQ=;
        fh=wFVISeno+KNxs811KkWGgYDI6lcenMm5nUQ4zweCVM8=;
        b=TReTJUNllpCSwXXe8eCSqqzJpXCSozjP7wbK1p6vFGjNdzMoNebZWGGwi9XGDv/5Mc
         gMxr+25Q7AqvBJadpbuMho/bwDPi0RIyCKBunyF6k6fmgA62X2YR4aCeJMjvId1URijl
         l+SLu9koUWCtXZvUXF2krAwYO75me6rbyzRp1UUQNTTvi+yOPS0AhG2nXTJjxetdyt0d
         oznXBG8XGIvrPE+omy7blcn+FOphYQqHRu824jE8axy10FdR6QBKwXdmjhmvot4+wV+I
         CmlNAme3an9FLnNas09f38AH5iluOLygz5P/B6m6OlGPojpP1JZqY31EYjBARjcjHqbm
         nF7A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="a/T8Mb/k";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-513f321beb7si2522560e0c.175.2024.11.11.04.03.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Nov 2024 04:03:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="a/T8Mb/k";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tAT8E-0007UV-GI; Mon, 11 Nov 2024 07:02:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tAT88-0007Tp-DG
 for qemu-devel@nongnu.org; Mon, 11 Nov 2024 07:02:53 -0500
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tAT84-0006pN-54
 for qemu-devel@nongnu.org; Mon, 11 Nov 2024 07:02:50 -0500
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2feeb1e8edfso54509311fa.1
 for <qemu-devel@nongnu.org>; Mon, 11 Nov 2024 04:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731326565; x=1731931365; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dnMmNO50aDzoHtK5dRqtoMLJToObkbj4apMesAz6wjQ=;
 b=a/T8Mb/kHJSa1n9r8ko00cR7FTxEMODHLJr+1O9Jm4Wt/mgmIMRtTZ8wzUzXoxsDJt
 S/GLyi+WDQstIh0MObMCby4ki1tgprb9EhnDR9saxD8rcQHF7gMqgDLfhdSjgTLbF5Ur
 Lal2pahE0m7bavj0OUqK9jS4Io8sT0ASkvnqjhA/KvxVhipnRnzLGsRbv2jf+jAoJEir
 ZvtCTqfXDFHNycAM4K06U67PR4bRC5FT0wYpNfR7JisQjE8BiZ1iw4otbBODxxEv1zDQ
 6lZpOm0JKx7wlFrAHkilUwdRGtUVWPI4KlSIqEXrDj3BZ/ICEurXluCeHJlqKtISufPP
 J93Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731326565; x=1731931365;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dnMmNO50aDzoHtK5dRqtoMLJToObkbj4apMesAz6wjQ=;
 b=R2KHxLZp+qLzHKewgA9OSbGZkDUmaQykiY/1MtLaILOTBJt4dQFIk0n9m96H3U07wf
 y7JsYLqPff/OXbuZ/tfs1m+8JHOGyUFGwtDdUAchG8DCz7nIIH4LRF+eeKayfalLYeO4
 qAoux8wKZJ7CTuC4YUnLsYNElGjbfbNjFnmGGjDgYSfK2euQBM7fepapLXUzbqOCjFPK
 GkWgal0bNoQLvfUeZwDtotRvWaHUrNLr/HREWjvPSb20NLIOooov08B2PsKkzeOp06Iw
 oPMR+muN0wT3mwjJGt+1hbry0d6mbnSIaDou9KEhNsIYSFhRTaAYX3E3y1zbZyvzDdQT
 50zQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1am/siLOAz9DviUSPhV6F/JuQd3v9rMfqUcx0tNp1y+TklzJWNUnZNzQJZvceyYAP5eBexFUX7mh/@nongnu.org
X-Gm-Message-State: AOJu0YztGcO7R0IwCkAe67Hx7M12oneYl7xnL+bFGCDfLe3OpIkSTbC6
 wjD7pw0llOSQBdDNYjX0WoxzuYcSDTPKErk3qC/o57BPv/Du6fbtBdu0DTiIi5c=
X-Received: by 2002:a2e:bc1a:0:b0:2fa:d4ef:f234 with SMTP id
 38308e7fff4ca-2ff2016361fmr59045781fa.1.1731326565447; 
 Mon, 11 Nov 2024 04:02:45 -0800 (PST)
Received: from [192.168.69.126] (cnf78-h01-176-184-27-70.dsl.sta.abo.bbox.fr.
 [176.184.27.70]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432b054aed6sm170869455e9.15.2024.11.11.04.02.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Nov 2024 04:02:44 -0800 (PST)
Message-ID: <0efff9f3-6053-4e2d-80b5-27b4c86da813@linaro.org>
Date: Mon, 11 Nov 2024 13:02:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 04/17] hw/net/xilinx_ethlite: Simplify by having
 configurable endianness
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Anton Johansson <anjo@rev.ng>
Cc: Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, devel@lists.libvirt.org,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>
References: <20241108154317.12129-1-philmd@linaro.org>
 <20241108154317.12129-5-philmd@linaro.org>
 <71a10d65-dd73-4f39-93ee-2c36928f8f4f@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <71a10d65-dd73-4f39-93ee-2c36928f8f4f@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22d;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x22d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: v2NUq0cp46La

On 8/11/24 16:05, Paolo Bonzini wrote:
> On 11/8/24 16:43, Philippe Mathieu-Daudé wrote:
>> The Xilinx 'ethlite' device was added in commit b43848a100
>> ("xilinx: Add ethlite emulation"), being only built back
>> then for a big-endian MicroBlaze target (see commit 72b675caac
>> "microblaze: Hook into the build-system").
>>
>> I/O endianness access was then clarified in commit d48751ed4f
>> ("xilinx-ethlite: Simplify byteswapping to/from brams"). Here
>> the 'fix' was to use tswap32(). Since the machine was built as
>> big-endian target, tswap32() use means the fix was for a little
>> endian host. While the datasheet (reference added in file header)
>> is not precise about it, we interpret such change as the device
>> expects accesses in big-endian order.
>>
>> Instead of having a double swapping, one in the core memory layer
>> due to DEVICE_NATIVE_ENDIAN and a second one with the tswap calls,
>> allow the machine code to select the proper endianness desired,
>> removing the need of tswap().
>>
>> Replace the DEVICE_NATIVE_ENDIAN MemoryRegionOps by a pair of
>> DEVICE_LITTLE_ENDIAN / DEVICE_BIG_ENDIAN.
>> Add the "little-endian" property to select the device endianness,
>> defaulting to little endian.
>> Set the proper endianness on the single machine using the device.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>> RFC until I digest Paolo's review from v1:
>> https://lore.kernel.org/qemu-devel/34f6fe2f-06e0-4e2a-a361-2d662f6814b5@redhat.com/
> 
> tl;dr: this works but would break migration compatibility with the 
> previous version.  If you want to keep that, you need to add
> 
>> -            r = tswap32(s->regs[addr]);
>> +            r = s->regs[addr];
> 
> if (s->little_endian_model)
>      r = cpu_to_le32(r);
> else
>      r = cpu_to_be32(r);
> 
> 
>> @@ -161,23 +165,26 @@ eth_write(void *opaque, hwaddr addr,
>>               break;
>>           default:
> 
> if (s->little_endian_model)
>      r = le32_to_cpu(r);
> else
>      r = be32_to_cpu(r);
> 
>> -            s->regs[addr] = tswap32(value);
>> +            s->regs[addr] = value;
>>               break;
> 
> These pairs ensure that RAM goes through an even number of swaps.  I 
> don't think they are needed but you decide.

Indeed; I didn't realize it was RAM.

> However, I am wondering if the double MemoryRegionOps are needed *at 
> all*.  Since petalogix is arguably a little-endian only machine, can you 
> just use DEVICE_LITTLE_ENDIAN?

1/ This petalogix machine is actually built in the big-endian binary
2/ As Edgar mentioned elsewhere, Petalogic IP can be synthetized as
    big-endian
3/ This machine is used to prove we can remove the TARGET_BIG_ENDIAN
    definition and unify big/little endian binaries in our build system.
