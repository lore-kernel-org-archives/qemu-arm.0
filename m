Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6850731wrv;
        Wed, 7 Aug 2019 11:04:49 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwiEQUQINc+DOEKu+b9tN2IyPLWXfrPoATJg+0r77vu62TzCWw72UYX1VLmgtAcy7uYQNbL
X-Received: by 2002:a50:9153:: with SMTP id f19mr11534727eda.70.1565201089330;
        Wed, 07 Aug 2019 11:04:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565201089; cv=none;
        d=google.com; s=arc-20160816;
        b=W0z01B0RAE+Dd9t3tqc1CjizJHbMbRCMIHY4vgyGbc+6wcXuiDPUE3qFQr1O1otxcs
         BJmIsqAyKcEqEdbT84XrXoYgEQ9c2NQPZJCPU+ipELX3uxuHWTcQfy1sDfZc6Ucv6IK2
         mwcRuHir3xm9wn50PhcNZVyHEcjXuYVzeLWlFqaNdaOQtwGBFshjHwf+YmlAohRfaptc
         GS8GwjheEy3rhFXJiMsLddwBWA1RDuL2U5aIOPfqC4kDd3XvSJbQwHdKV1MK9v3bnWVT
         uK9+VKAt39pqvuOIJYBD8vfZgbuW/28NDk6cGKrVUJlQTPW83BfnnhBBE09eYJ46zhZu
         yayw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=4Ht3Xb3OUB4vYkmrYsa4/SfHlW4yw444r3BHGm6YfjA=;
        b=Qpi7N4PY7PH6PpfgTZZRjCj2WvLhR04BVY0KoRNqMaOslawG2maIoCECAmNPFGw2zc
         nNSYdwaBtiG5dDwaUUPdygiWhVMTqdKG+cenf6AkEpScqGFi+iCGEnfdjZxTwge0Hs1o
         q+QRwzKWDZrnIQc836v2xQoeVlCidKJ1BGiLJYmrRGMupXPBxW60kHlPCZPuzDHt9PuS
         v9pnW0k0YrampwnYblLfs82eiXDi3V/nLYFQncYOV7BqHV9HAVuedLA9llUMfQvL0n7o
         xrv92RX3BPG+8mh3JBleT88yWoCoLzyqHyJHvgIPCAaTydvF2BGqgXudt6Mcuci+UtAT
         33Tw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=s3riSf2A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d57si34512578ede.386.2019.08.07.11.04.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Aug 2019 11:04:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=s3riSf2A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hvQIq-00076O-E4
	for alex.bennee@linaro.org; Wed, 07 Aug 2019 14:04:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33998)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hvQIj-00072U-6D
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 14:04:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hvQIi-0008JK-6c
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 14:04:41 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:45991)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hvQIi-0008HH-0i
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 14:04:40 -0400
Received: by mail-pl1-x642.google.com with SMTP id y8so41962126plr.12
 for <qemu-arm@nongnu.org>; Wed, 07 Aug 2019 11:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4Ht3Xb3OUB4vYkmrYsa4/SfHlW4yw444r3BHGm6YfjA=;
 b=s3riSf2ApSTxNZmZBm7KL2xc6RrVcnctRRmtVYRPIwcjrHboIQvGjEwo7ZWu7646eG
 zqWbSWXRtB19TkvT3u8hv3b+op3fswSIpDtv4n2+d7hA9UENsKISUQqoU3AbUvPjz/UB
 XlZkhBXNIZzXvMgOh9AtRNnhpJpL7rRoPW2XItjlPPjWx7GhMwg+Wk3ky7TXboVdGm9l
 Iak+RGcT1l99xWEMUx+0IVBISto7dtxwJyOKbg0Rk4eOAknjTobkw3R3RXptswUf+002
 FK4bi/szC4pa/sdtUDHKkAz8VZv4tTd4M9k++m4LxlsPcTZSE4fLJh0T1onaQIcAWPF7
 +qUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4Ht3Xb3OUB4vYkmrYsa4/SfHlW4yw444r3BHGm6YfjA=;
 b=UlNbr0mW2BanjVX7xyCIlGPEM36eSC5uxb/2TxH3DOT5e/Le76cVk1ja/kKr9rGz5U
 hg38cN6idAmOudwpgnYDFvCp9kK3sXbTsVxD8AGRderv4X+daDzDzSPmXxBm03lhbxUZ
 C1++ofNycwPWnYk6rfD5VFOXWex8xidSaTeAjfNRQ8UdLGbZA0bfz9/W4kWv/egrK4oi
 DcPP9pdRddW+BHQ9UAmt/ZpMSm5J5hiuFjEg/SJR9VzpszvgdtlKnCbDaaOIGSJVxhq6
 MQjonSW/Lt5R9fkWtVM1/n7LnsTngqFiV6u/J1VCAyUKHtaHNVPh/U+QjfcVZO35pldf
 F8/w==
X-Gm-Message-State: APjAAAVFGlks+kLEtpABFQn3J0y4KceoWIuZDcz2XnXSFDpBbBbV+QM/
 +oqIyocnqIaofF9EZ1NHp/EgobAUA9o=
X-Received: by 2002:a17:902:b497:: with SMTP id
 y23mr9441484plr.68.1565201078711; 
 Wed, 07 Aug 2019 11:04:38 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id j6sm653961pjd.19.2019.08.07.11.04.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 11:04:37 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20190807045335.1361-1-richard.henderson@linaro.org>
 <20190807045335.1361-4-richard.henderson@linaro.org>
 <CAFEAcA_MFg1_gpaT5+X71s8r5SYZFTizdXs2vQ_6mLooP7E+kg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <061145be-4cd4-b8e6-ae5c-562a59e8088f@linaro.org>
Date: Wed, 7 Aug 2019 11:04:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_MFg1_gpaT5+X71s8r5SYZFTizdXs2vQ_6mLooP7E+kg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
Subject: Re: [Qemu-arm] [PATCH 03/11] target/arm: Introduce read_pc
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Z0SP97pPG7oG

On 8/7/19 10:27 AM, Peter Maydell wrote:
>> +/* The architectural value of PC.  */
>> +static uint32_t read_pc(DisasContext *s)
>> +{
>> +    return s->pc_curr + (s->thumb ? 4 : 8);
>> +}
>> +
>>  /* Set a variable to the value of a CPU register.  */
>>  static void load_reg_var(DisasContext *s, TCGv_i32 var, int reg)
>>  {
>>      if (reg == 15) {
>> -        uint32_t addr;
>> -        /* normally, since we updated PC, we need only to add one insn */
>> -        if (s->thumb)
>> -            addr = (long)s->pc + 2;
>> -        else
>> -            addr = (long)s->pc + 4;
>> -        tcg_gen_movi_i32(var, addr);
>> +        tcg_gen_movi_i32(var, read_pc(s));
> 
> So previously:
>  * for A32 we would return s->pc + 4, which is the same as s->pc_curr + 8
>  * for T16 we would return s->pc + 2, which is the same as s->pc_curr + 4
>  * for T32 we would return s->pc + 2 -- but that's not the same as
>    s->pc_curr + 4, it's s->pc_curr + 6...
> 
> Since s->pc_curr + 4 is the right architectural answer, are we
> fixing a bug here? Or are all the places where T32 code calls
> this function UNPREDICTABLE for the reg == 15 case ?

I believe that this is UNPREDICTABLE.

The T32 cases that reference the PC that are not UNPREDICTABLE, literal memory
references and adr, are all of the form (s->pc & ~3) and do not come through
load_reg_var().  Those will be unified by add_reg_for_lit() in the next patch.


r~
