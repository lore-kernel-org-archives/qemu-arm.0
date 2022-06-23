Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3013607lft;
        Thu, 23 Jun 2022 07:44:32 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1td8kcDs03953fA6I3YJw8Bt8Xmi3M8lT8e/8zYJDBcYGEm3XK4+c71WTZq3kMrW2p+K2ht
X-Received: by 2002:a05:620a:4505:b0:6a6:f875:a609 with SMTP id t5-20020a05620a450500b006a6f875a609mr6688764qkp.710.1655995472729;
        Thu, 23 Jun 2022 07:44:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655995472; cv=none;
        d=google.com; s=arc-20160816;
        b=P8OY/D9cpLNXHJYnRAk1Mjn6lMhsW9O85889u6+vgcxGHGO7km5caay41lflWbFhFP
         A0W8HOamuCW+Neq+1DIk5vniIRfhIrQrzfdbFFuFB9LsJxklH5WU8Bns2AHM16wNEpD0
         J/o77dLpuew/o1QsCKV/g3zNQqcMfR1apoWvXNvmZzHEsMYo/8g0IqcCR7HdBkH1SfHq
         oVZ36zE7rtxVJVAWaYuMdQsxn1JbCmnX8IN7QufIwE8PuD7jTy01Zz3esxyse9AhrXQK
         Bn8Eq8Dbc8cDs6ZJx7aB83U4QZIqkeSXE9WuqqHg3JXiFZWHvgzYq2IXtVib6iKmrXJK
         P2TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=WAYlGURz1ImDMSr4/9X8JnApIuOiPyTPttYWz1fPiiI=;
        b=0H3PHIxRZwjou+S36gukNS5AZyxqxHBO5+0a1k+a9aPdjFfDBcSJ6EYVl4qgSmP5zy
         kAuqi2HtlDQRQYwQrS2fzMzjmEa2v0Uar3Yp9nkwsS95cZmv/nTNjHp5zj7iROaBzklU
         oAkQGEfiWMPRmKoVnuVO1bbkvBrAhuTArRLxTmT1lVqO+3gYf6HQirHAB4wTbrnfDpBG
         bVxpFbAJUZaHVLgr7i2hpxxiaUhBC/l4Bu0ZeoWKyQHdI4Q/fccVGOSL6T4j9KMMtOb0
         X+vYeDggL2yeZ5Ld+uePYMSdaQSchX+RgVEeorYN1j7VUyOpZOj/r65Vts5Bd0EhLgzD
         5+lA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QMdBwGn7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q22-20020a05622a031600b002f917a19c05si12464620qtw.341.2022.06.23.07.44.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Jun 2022 07:44:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QMdBwGn7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o4O4O-0006on-7A
	for alex.bennee@linaro.org; Thu, 23 Jun 2022 10:44:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o4O4D-0006oS-Cm
 for qemu-arm@nongnu.org; Thu, 23 Jun 2022 10:44:21 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:43606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o4O4A-0001yt-QY
 for qemu-arm@nongnu.org; Thu, 23 Jun 2022 10:44:20 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 dw10-20020a17090b094a00b001ed00a16eb4so2788810pjb.2
 for <qemu-arm@nongnu.org>; Thu, 23 Jun 2022 07:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=WAYlGURz1ImDMSr4/9X8JnApIuOiPyTPttYWz1fPiiI=;
 b=QMdBwGn7znQBWkz4555GQWr+audo/oO5LJZ8gnOJ4cspAUfx1972q/BLl3TUokQtvj
 Dkdtr3YDaE2qeKZnxUTCqsEAXB29Jq4wGogwWPmSijesrNZU0fmLm2aH49sL1/UHnzGJ
 AttwgHjWxQJCLRV5XM27f/H+ZHsK2nbKst3I5bSIuqH8aZP3untiinfbINdm7exWITk/
 pRdCsEek21DxVIn8AvINsvhmV2gy81xkmneYTF1JErjPX6G2vCKThhRCIrAR1wpP2rfw
 JslRRbdNkDZe3vF8xJxGVTCjWLHFRwRKn3fn47SL8Jst4n4OYCuMr1LMksxm3yFX4Nqc
 xCfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WAYlGURz1ImDMSr4/9X8JnApIuOiPyTPttYWz1fPiiI=;
 b=eGkeix5TFhVBs6cygryyX2tRGpTh4Oh0xtVsQF1USj9qbGBc4j9rz4H5ZMd07vMSyc
 O13Hjc1GuALNsR+/6ZFLcNmrjkiJlP6GPSlFxV45IsENLVwBXyvSZ7HsE19pW2xH617a
 ZtCLA76vtWJH06mwmAVI74Ka+GQt2ej50P5EeeHCLMf9ZxPtMCytpQWMrtdXUBUbbPFh
 EylxsR3VS0UobWdws/xt55VNXCnp/lnh5LEpywJgNFaDWmD+O/6S4H83BkH46cQFOpLs
 2h7HYQBBLoME4Uwlg7qZqsS6Ji3BXVwUPGjKC2eWx0TK8zYj9Cm09xsGBgNRkW2KtAKa
 Oe+A==
X-Gm-Message-State: AJIora+ishVZb188pc8/lmutcjCDblPvdDVhIBuj2YVARYoNufeoUxyZ
 WugGw2TjUFrXOayuIuKx+drB3lSVhknKqQ==
X-Received: by 2002:a17:902:e5c9:b0:166:34ff:72a3 with SMTP id
 u9-20020a170902e5c900b0016634ff72a3mr39381327plf.80.1655995457187; 
 Thu, 23 Jun 2022 07:44:17 -0700 (PDT)
Received: from ?IPV6:2602:ae:1543:f001:393f:6246:99c5:ff8a?
 ([2602:ae:1543:f001:393f:6246:99c5:ff8a])
 by smtp.gmail.com with ESMTPSA id
 s13-20020a17090302cd00b0016a5f1722absm1289720plk.75.2022.06.23.07.44.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jun 2022 07:44:16 -0700 (PDT)
Message-ID: <28c72d0c-05fe-a8f5-9a60-bdf3675a9d53@linaro.org>
Date: Thu, 23 Jun 2022 07:44:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 25/51] target/arm: Implement SME MOVA
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220620175235.60881-1-richard.henderson@linaro.org>
 <20220620175235.60881-26-richard.henderson@linaro.org>
 <CAFEAcA-_Cof12Oe=4HTJx_4Nmtfq1Oj7BRdFmzv989H13kUVTg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA-_Cof12Oe=4HTJx_4Nmtfq1Oj7BRdFmzv989H13kUVTg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xbKj0LD/ASWj

On 6/23/22 04:24, Peter Maydell wrote:
> On Mon, 20 Jun 2022 at 19:20, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> We can reuse the SVE functions for implementing moves to/from
>> horizontal tile slices, but we need new ones for moves to/from
>> vertical tile slices.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/arm/helper-sme.h    |  11 ++++
>>   target/arm/helper-sve.h    |   2 +
>>   target/arm/translate-a64.h |   9 +++
>>   target/arm/translate.h     |   5 ++
>>   target/arm/sme.decode      |  15 +++++
>>   target/arm/sme_helper.c    | 110 ++++++++++++++++++++++++++++++++++++-
>>   target/arm/sve_helper.c    |  12 ++++
>>   target/arm/translate-a64.c |  19 +++++++
>>   target/arm/translate-sme.c | 105 +++++++++++++++++++++++++++++++++++
>>   9 files changed, 287 insertions(+), 1 deletion(-)
>>
>> diff --git a/target/arm/helper-sme.h b/target/arm/helper-sme.h
>> index c4ee1f09e4..600346e08c 100644
>> --- a/target/arm/helper-sme.h
>> +++ b/target/arm/helper-sme.h
>> @@ -21,3 +21,14 @@ DEF_HELPER_FLAGS_2(set_pstate_sm, TCG_CALL_NO_RWG, void, env, i32)
>>   DEF_HELPER_FLAGS_2(set_pstate_za, TCG_CALL_NO_RWG, void, env, i32)
>>
>>   DEF_HELPER_FLAGS_3(sme_zero, TCG_CALL_NO_RWG, void, env, i32, i32)
>> +
>> +DEF_HELPER_FLAGS_4(sme_mova_avz_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
>> +DEF_HELPER_FLAGS_4(sme_mova_zav_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
> 
> What do the 'avz' and 'zav' stand for here? I thought that
> 'zav' might mean "from the ZA storage to a Vector", but
> then what is 'avz' ?

It was supposed to be z <- av and av <- z.

I've used "z", "p", "w", "x" single letter argument indicators for sve.  I think "av" was 
supposed to indicate "array vertical", but it's definitely non-obvious.  I'll fix this up 
and add some commentary.

> This is too confusing -- I spent half an hour looking at it and
> couldn't figure out if it was correct or not. I can see roughly
> what it's supposed to be doing but I don't really want to try
> to reverse engineer the details from the sequence of operations.

Ok.

> Perhaps (a) more commentary and (b) separating out the
> horizontal and vertical cases would help ?

Ok.


r~
