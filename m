Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp744234lfg;
        Thu, 18 Mar 2021 14:56:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxWUgVXrlE8j4/8H1tvzc+8WXa/QKzBVXJcCYzawZY8PpI8XlPiBxWBJSLX18RT5x5xSOLg
X-Received: by 2002:a02:3304:: with SMTP id c4mr8838095jae.68.1616104595818;
        Thu, 18 Mar 2021 14:56:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616104595; cv=none;
        d=google.com; s=arc-20160816;
        b=mvQyprI+rvs/J6llHMJxqeHSZznOKqYTErN68G7Hr2ZuY6tIIVWrtMoDhpJlSqhrHF
         esaJOe4U+toMnb/k14JwSKcMSOjoG7kSuIEublTfN/7bQ8ljaiKiApj1PTsHK7dmeWYl
         1oL+oi9lz/7xX3J19Il+Ap4iNfFFZlzvrcv48BSe9siCG9Ofqp5DpAvWaWnMehARn6ja
         gS0VRdOVQ8/ZyL8uMjgjeCVX84xqcA1KfOJzpjjw1n8PcglN+qqw7h27YfGY+GDTdLPx
         Vu+xQrCCiW9DATGDxGnDN443iymwYg7NdH8lc++oJyYjEmUAMVwOiAl7whRsIwPOIlu2
         SfRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=wWoxWk6iH+D7yn1pettTTwgNja5Zzig50vwkwOCThGg=;
        b=oRJ36/eWW+Ah0+s7ACN5aYb7084CoO7YJq1W0UqMv2gqTyRNrjQDsC17liNriVCRpH
         PZU3T79Udpl1kHG9ak84PKT/u1my36dvJSdFsqcL+JRKB/nal8i/E6QTP8rv0b5pss5v
         OPF+vxOGYnYh7XQe9VZArQbFpv+cB/QJ0w4x7Hro+VbwcLUSbrY/YcX+cwfqHxQcP5EP
         CQFq/hqOQlDIC9kRwk0Mydm2EH6LiKqP+EWbpmf6B3yjUZYkYgtz/R+fglo6vp/cb7bJ
         1YzMJySwp88YzBZWdV+WgZ+/qJ8iB/0uO2WNdBCEVLx/tNyHC68lrcYq7stwiBeOMmdc
         btUA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HSbvmRFW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n17si2414673ilo.20.2021.03.18.14.56.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Mar 2021 14:56:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HSbvmRFW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lN0d9-0003aq-4a
	for alex.bennee@linaro.org; Thu, 18 Mar 2021 17:56:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lN0cx-0003ae-R2
 for qemu-arm@nongnu.org; Thu, 18 Mar 2021 17:56:23 -0400
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335]:37774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lN0cw-0001Ib-45
 for qemu-arm@nongnu.org; Thu, 18 Mar 2021 17:56:23 -0400
Received: by mail-ot1-x335.google.com with SMTP id
 t23-20020a0568301e37b02901b65ab30024so6643216otr.4
 for <qemu-arm@nongnu.org>; Thu, 18 Mar 2021 14:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wWoxWk6iH+D7yn1pettTTwgNja5Zzig50vwkwOCThGg=;
 b=HSbvmRFWz0cRqYtH7QIMl3E40DUyVPCsB6giJJGduuxQ5r+EFOEoVmnV7WHN7nnok7
 6s2MJ4usi2sYpC3HLdjJaSd9FiPKC0MP8IlDtZ8jlX4ry9jRoYLnuWtBpal6UkX6IMJ7
 ZRvXr7G/0On7RFZFI2d7kSYbaizv3UkFuPYhw42btPPET9c6syKenzAjjWYtA5EVMrse
 +7KfcDLzv4J7trVOP17BRAqVltmknZGhgDZI6FvzCA89GzBgJJca71KiZ4t8TFu3vtNd
 iNor8Mo6LjvnC6r/6WrRYUKVmlv2F4v+hEvJ4iyzs5iajS656e5IJf36w1cUbDKG04MW
 gmnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wWoxWk6iH+D7yn1pettTTwgNja5Zzig50vwkwOCThGg=;
 b=kGjiSQqR1px8iG8N7KkoTElaYcgD/VdEHnLbJAV49OOsAbWB0+STTo7po7aUfBy26z
 lFGAQTRELLIqxMXrp1IS9NJQex3SfOyz75SDyK4dq0tjZ40zhPfJUz78GHgQ5GGDpnAO
 strf0mfbzNzmI2EydBcLiI6J+xCbnngvY3hetWomNk0fgXHRuMiLPvVKAQfcLqTvnGoN
 NUrB3ej9N2SJ4+Di3JhHmJu+mK8TB3rJLm80a6ege5icxLPXHG63zi2U1vgDhYZNd6sa
 s7jEa98eQMc5wwCUHihm1lEe9MJ0JPqNzFes1+AdN1Wi8PBqoe7onagkFtZZ60B5zSi4
 0pRQ==
X-Gm-Message-State: AOAM531xK1hZ1VAzsRsnxeasmhM9zepe/EwSFWhcRdWo/1Fq6fKVBF6T
 dk69u2Qog5RuXpl+uTxfm0mD7w==
X-Received: by 2002:a9d:6a0a:: with SMTP id g10mr9092512otn.236.1616104580356; 
 Thu, 18 Mar 2021 14:56:20 -0700 (PDT)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id r22sm754334otg.4.2021.03.18.14.56.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Mar 2021 14:56:19 -0700 (PDT)
Subject: Re: [PATCH for-6.0 v2 4/5] hw/core/loader: Add new function
 rom_ptr_for_as()
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210318174823.18066-1-peter.maydell@linaro.org>
 <20210318174823.18066-5-peter.maydell@linaro.org>
 <176ca6cf-f917-eb5d-a5ce-d8a98db8fce4@linaro.org>
 <CAFEAcA-mZMP0LPmGKvMuUq8C_V6cG9AVpaAQ4SoWvihObO_VXA@mail.gmail.com>
 <ec96b321-80d4-948d-b482-dfad61eff67f@linaro.org>
 <CAFEAcA9i21sTkYoMfMt8sgN+18B3uHSqzG3No7k-+XJkzREi9A@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <706a2b95-f0ba-4abf-fdf7-09b7b856db45@linaro.org>
Date: Thu, 18 Mar 2021 15:56:16 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9i21sTkYoMfMt8sgN+18B3uHSqzG3No7k-+XJkzREi9A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 445+i0i6CkVP

On 3/18/21 3:28 PM, Peter Maydell wrote:
> On Thu, 18 Mar 2021 at 21:14, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 3/18/21 1:02 PM, Peter Maydell wrote:
>>>>> +     * Note that we do not check @as against the 'as' member in the
>>>>> +     * 'struct Rom' returned by rom_ptr(). The Rom::as is the
>>>>> +     * AddressSpace which the rom blob should be written to...
>> ...
>>>> Should you really have this special case?  Nowhere is this going to verify that
>>>> @addr is in @as.
>>>
>>> It's the "happens almost all the time" case. Nothing verifies
>>> that @addr is in @as anyway -- see the "Note that" part of the
>>> comment above.
>>
>> The comment explains why we don't examine Rom::as.
>> But we do check @addr vs @as via @as -> @fv -> flatview_translate.
> 
> All we do is look for "every other address in the AS that
> maps to the same MR as the address we started with".
> Are you asking about the !cbdata.mr exit ?

Well, I suppose.  I guess I didn't read the cb properly.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
