Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp2965015lfk;
        Tue, 25 Jan 2022 15:34:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwhcZ9Cr1KZqnhkZJYkcXevEq2BDkbXf8Dkd7vXM4KGNdUQJxJSuL7BH/4JGTITm4grRSRS
X-Received: by 2002:a05:6902:13c8:: with SMTP id y8mr23820618ybu.183.1643153680203;
        Tue, 25 Jan 2022 15:34:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643153680; cv=none;
        d=google.com; s=arc-20160816;
        b=FuA87tjKumemWtf10SMaugVfwR/RgfMIyUjlTEz5UIybzyVpOn9Eu0GLJZvDIwizn3
         YRXIJiUAeGQ5YsLTfOfgrxI1Eh7MUN4E8NszivB640wen7TUsti7DuJqU7U/dR0jTaPk
         4f6+IDYl19TN/1imJM2LPIavkSS34DqUzqs8n9Ha8X4kZz0PrdPNQcHxPu3yHf73zZsZ
         EKgAPgCEFYNCuA+1dkz5XdWbUcUzMNepatGgHh+PvDidVecF9R0lOatrFjtRqxoM/BcB
         r5InklsvXFEkCH/zpOGk3rlcWGF2H8AvCTGRSmArFmeTKGcyUr9WrC1oDwOrEp/IVH99
         +XaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=21Gf1Lcuk1GPxXtvDKJ8nweB1hNGOxeI5gT2k3UrGOo=;
        b=vnQHRRmhiYxbkGbLLwc+pn++uR95le9Gu3tzucjQpZQ7uYmXHmsLQ0rO0ZIEs9RTnp
         c9QpIkJpJnmSWrJSykW4KdR0qp6ZD/XFHV2eaV661/Z6BelCWbxxwAUWmuNFTnN5ju7Q
         3ovYvBv/FjeJAEmpHpE7p2EEKrFPhyJCFbbt/85dI8/h9h9NGtC4ON57iXt0OMfmfb5b
         lcO7NDqXXtvaB5P5ei7P/EvTR/7C9uTxCbnAgA7+qaI+InkqkLg+n60ZPFtHjuzP7VGR
         onYSrba921EptVrB9dxLdfyiScOJ4prdjOFBGEbdhisoU6X4OsrIJDuJt78lY2yJ3Y4/
         3IoA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gJWwQqC9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 188si1004081ybz.599.2022.01.25.15.34.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jan 2022 15:34:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gJWwQqC9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nCVKh-0003I4-Kn
	for alex.bennee@linaro.org; Tue, 25 Jan 2022 18:34:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCVKY-0003H9-PP
 for qemu-arm@nongnu.org; Tue, 25 Jan 2022 18:34:30 -0500
Received: from [2607:f8b0:4864:20::102c] (port=43975
 helo=mail-pj1-x102c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCVKW-0000ad-99
 for qemu-arm@nongnu.org; Tue, 25 Jan 2022 18:34:29 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 d15-20020a17090a110f00b001b4e7d27474so4402929pja.2
 for <qemu-arm@nongnu.org>; Tue, 25 Jan 2022 15:34:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=21Gf1Lcuk1GPxXtvDKJ8nweB1hNGOxeI5gT2k3UrGOo=;
 b=gJWwQqC9Sl/KZbbkY4VfkJnGQ5wOkmc66HHox5bLQdAuNXkI6JXPNjDMmsX/AVzoqh
 a11DRWquSU4VaJp1sNda/HAx6p7PbrPTpWe+Tp64STdcKN6iM4lyLEyYrHhRC+qTHmhK
 jDIp+vp2Chy7U7c3xCI3WHP0WcdLJy58a7Wsj8Wd4lU0n+hOoxo4FlSHGYbt8JNDh8c/
 QNcsVv87n362BnlFKmzFPttOXO55v6k13n4+mJNKq6Mdsq/vgF16tp3TwuiriajL6XZ+
 0k+8QVc8+AleSTjzeztCtLumsmBFMkW9I7QDrmBl5oix3bH2rPMdKu79tVDlwy5QXUdK
 DJPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=21Gf1Lcuk1GPxXtvDKJ8nweB1hNGOxeI5gT2k3UrGOo=;
 b=BiQCYFZw/tpmk9Yx6wvXzHFnku86/tl6qllCyUX+76q41HuaqsmCsynntDuXtuDDz9
 vwTWvNhAhpj/epJqUobPoYjtCnVKeqD7F8tN8UElM5s+bx42OZjQ/ve5iH7couD65wTd
 BBBBuJwh7WJIzi4iWGX4a9CusZ43mx74VtxcJe9iU455aoYF9vWW1fo19ea5sj8YsiYh
 UyX+fB3xuYy+17rhLBjM2acDucSuPZQC5PJIt0jBf0X45fk7S8vgzrWLr/tKQwWzNrjt
 C2jHcL1QWes3SqVlOSmHr1fwwS2k5MGVYGaEJlUgShPHTklj6/A4zuzBdtI0hgSEjPtO
 kUCg==
X-Gm-Message-State: AOAM533EfxBrvFmBiCEgQt8jRxRuXtiVO6NA5ZVCxxmmutYc1sT58dUh
 wObYWP9WVJ84S3UCt2LAcOZY8g==
X-Received: by 2002:a17:903:2342:b0:14a:e540:6c83 with SMTP id
 c2-20020a170903234200b0014ae5406c83mr19811353plh.69.1643153666861; 
 Tue, 25 Jan 2022 15:34:26 -0800 (PST)
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id j4sm1347696pjv.46.2022.01.25.15.34.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jan 2022 15:34:26 -0800 (PST)
Subject: Re: [PATCH 2/2] target/arm: Bail out early on 0-length tlb range
 invalidate
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220110164754.1066025-1-idan.horowitz@gmail.com>
 <20220110164754.1066025-2-idan.horowitz@gmail.com>
 <0f211c09-4b4d-2c82-cff6-64711563c6d8@linaro.org>
 <CAFEAcA-VuVPfDaPCZ9ta+vtmj9RUb_BBMCihTGKsEV4SSphaEw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3f89816f-5e59-bac5-01bc-d9cc73d15927@linaro.org>
Date: Wed, 26 Jan 2022 10:34:20 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-VuVPfDaPCZ9ta+vtmj9RUb_BBMCihTGKsEV4SSphaEw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: pbonzini@redhat.com, qemu-arm@nongnu.org,
 Idan Horowitz <idan.horowitz@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xIs0KdpzJLjj

On 1/26/22 9:06 AM, Peter Maydell wrote:
> On Tue, 25 Jan 2022 at 22:05, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 1/11/22 3:47 AM, Idan Horowitz wrote:
>>> If the given range specifies no addresses to be flushed there's no reason
>>> to schedule a function on all CPUs that does nothing.
>>>
>>> Signed-off-by: Idan Horowitz <idan.horowitz@gmail.com>
>>> ---
>>>    target/arm/helper.c | 4 ++++
>>>    1 file changed, 4 insertions(+)
>>>
>>> diff --git a/target/arm/helper.c b/target/arm/helper.c
>>> index cfca0f5ba6..1e819835c2 100644
>>> --- a/target/arm/helper.c
>>> +++ b/target/arm/helper.c
>>> @@ -4564,6 +4564,10 @@ static void do_rvae_write(CPUARMState *env, uint64_t value,
>>>        length = tlbi_aa64_range_get_length(env, value);
>>>        bits = tlbbits_for_regime(env, one_idx, baseaddr);
>>>
>>> +    if (length == 0) {
>>> +        return;
>>> +    }
>>> +
>>>        if (synced) {
>>>            tlb_flush_range_by_mmuidx_all_cpus_synced(env_cpu(env),
>>>                                                      baseaddr,
>>>
>>
>> Looks good.  I guess we could sort the extractions above so that we do
>>
>>       length = ...;
>>       if (length == 0) {
>>           return;
>>       }
>>
>>       addr = ...
>>       bits = ...
>>
>> Either way,
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> Should we handle this in the tlb_flush_* functions themselves,
> or is it just Arm that has to fix up a special case of "actually
> the length is zero" ?

Hmm.  Probably should handle this in tlb_*, yes.
So far, Arm is the only user regardless.

r~


