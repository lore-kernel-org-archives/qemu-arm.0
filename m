Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp2996416lfh;
        Mon, 30 May 2022 13:06:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwL/f5ZMk7sn7evTIMg2pP2yWmM1FicncuV0iWAvEvthR8GvXiiCr6aDJh7CfEeBuLQ43Cz
X-Received: by 2002:a05:620a:22c3:b0:6a6:48f6:6ae7 with SMTP id o3-20020a05620a22c300b006a648f66ae7mr2245260qki.422.1653941218490;
        Mon, 30 May 2022 13:06:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653941218; cv=none;
        d=google.com; s=arc-20160816;
        b=Ep+ixytfMCnwQy4c0Ie+66Fs/ASbjWRvq3yb/Dh8djWa2baTPN4KVRRUZhPq3qNTkD
         QkZeO46aRVMJ1ZDpxUe9YFdBAckF78igny/Fg7ycnTMraeS51HDiLUqHcpGVUbX3AG1S
         ncxL4rL3/VzrCCwxO5X8zGQd8pOXlPLrO568j9w8UO+XJP6hhgRUkmrkBTEuSJMBG8hm
         NWsT0WhV8jRTzQW8m1J5hCwdicSIcsFQC4/dmXd9uuamJpClO7GXRsfzgaEM0tSj9My+
         MSQ3Lj7hp2QDSbW0WzFXHOJoh3jWdo6PLjMZhaVGT6FLVdUfKkmnq3boUp5VKpcO6H0D
         ADfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=hTPnGpAfJ8zMvfkD/hTU8PhEyKnLyhjxnq3sSlG9sGc=;
        b=hysdEAz2ClO3DFz1jjZcaD20TOoZcqzRwVvDwVIJAW5MMapAbz7Ixe3I0+9HCzOzAt
         5NYRF7afvNdH05e0ev5hj5TNDGo6hDiODx+mL9P9UQx5snAJz7XWFzi8NHSbm5npHM8w
         dsEhM1V32tTMlg+rSK4VoeqBt6e5zkGoJhLc1ImyUl9IRX0CXf6Ygq7LHilTpdDVi8Cb
         3r1ES5vktKGaIrtPSrF0F4Ame4+E/6oTKtSkjdFqC938gG8px/Prr0RhHzW0IYbRyKBn
         Cgn5gS7vUM4CPF6EcjFhDHQb9r7ZZR/LgnHOKEzafrtgni7lQOXwC9dt2z22KRBdNTsl
         033A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CBEjfnyA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f12-20020a05622a104c00b002f947b92064si8420127qte.151.2022.05.30.13.06.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 May 2022 13:06:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CBEjfnyA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nvlfF-0000Eg-Sr
	for alex.bennee@linaro.org; Mon, 30 May 2022 16:06:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nvlPw-00080u-FM
 for qemu-arm@nongnu.org; Mon, 30 May 2022 15:51:08 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:45884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nvlPu-0001sP-Qx
 for qemu-arm@nongnu.org; Mon, 30 May 2022 15:51:08 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 w2-20020a17090ac98200b001e0519fe5a8so199720pjt.4
 for <qemu-arm@nongnu.org>; Mon, 30 May 2022 12:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=hTPnGpAfJ8zMvfkD/hTU8PhEyKnLyhjxnq3sSlG9sGc=;
 b=CBEjfnyAS5GVcn6b6QKtAh7YsdYyaOnXVSxdSu2aY8Kzrw4MfoP3af2llGig09y1Il
 lhzO5Lih3nFdS5l8Rflg/6+hNwvo24Lb0NG4n0CMd4O3dqdmEb+Ah0jLUqhLPrXKFKy8
 RQcXJpDcbwkreVcgIHxg+49pq02JFLM/9GjjPwVMCyn5yD67tKxSCVRUKOLTugv0i0nD
 dPX9Gw/pQIyIWd4USILv8+j/x2aGUUnszvy4MNlVicAkymLgQU8BPkyLnmlnfRmRBgU+
 HJo6yfERIBLBwqS/NKHmRa+COsUGh078RbdlFKA2Oi9tak1d8zVDlo8VW/AxoxVHlrjc
 R4og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hTPnGpAfJ8zMvfkD/hTU8PhEyKnLyhjxnq3sSlG9sGc=;
 b=HVOpk5VctpgOwkSpsXHwo11KCZWq8S79HSHi6rlmWJaoIzYtuC2a2WrHHdA9TzGyZT
 DiAKNM6bOck0lTLmWToUh0cF3kuUUChpw5641omSxyKqff0UxaFx64vElTcb8K2sRSh4
 BPuAyYxyV8e8Cs9wxzw0kCdExzho8b7QEJkPEWvxBXKTUUUEAL2d8lFoLSqr7N4fvybn
 qqEj3zzBw+raUimx8fWQes+Ys1nh++Ao5DOUCqvPb39ndxRxsovQOZlVDwbxPH4n2+Gx
 Wrxq8RUE+hAhyLnULQnfpKE4PLAG/JEZbDEe1nYDzdrALe6fI/idRJqIpYncZtK2OQq4
 1fWg==
X-Gm-Message-State: AOAM530BQ1Qv7DwdJQs7U1b7l5fYqc9cR5pBogZ6pOanvosY/HC7B3Bf
 tpMAgSee6ixdHOuyznUSRxy/Vw==
X-Received: by 2002:a17:903:1108:b0:156:73a7:7c1 with SMTP id
 n8-20020a170903110800b0015673a707c1mr56869763plh.101.1653940265233; 
 Mon, 30 May 2022 12:51:05 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:feab:28bd:b064:f797?
 ([2602:ae:1547:e101:feab:28bd:b064:f797])
 by smtp.gmail.com with ESMTPSA id
 be1-20020a170902aa0100b0015ec71f72d6sm9453909plb.253.2022.05.30.12.51.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 May 2022 12:51:04 -0700 (PDT)
Message-ID: <62f36b58-604a-80e7-1e94-0d6d3611ec84@linaro.org>
Date: Mon, 30 May 2022 12:51:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 01/18] target/arm: Allow raise_exception to handle finding
 target EL
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220523204742.740932-1-richard.henderson@linaro.org>
 <20220523204742.740932-2-richard.henderson@linaro.org>
 <CAFEAcA9Q8FQpG6RF4rnMS3EXZqBXzOs=n-3oH8iq5gU2wV4Emw@mail.gmail.com>
 <da0ad208-948b-1da0-5c61-039c084d50dc@linaro.org>
 <CAFEAcA9bT0_tKH7vS+gt05rr+tskPh4JuzRTMvTN=CokQfFUdw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9bT0_tKH7vS+gt05rr+tskPh4JuzRTMvTN=CokQfFUdw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: alBy+2A8j4Mp

On 5/30/22 12:01, Peter Maydell wrote:
>> I'll have another go at this reorg this week.  If it still doesn't feel cleaner, we can
>> drop it, and I'll make some changes to the SME patch set building on this.
> 
> I was wondering if it would work better the other way around, so that
> raise_exception() doesn't mess with the target_el at all, and all the
> "work out which EL to take the exception to" is done in
> target_exception_el() and similar ?

We need some place to put the EC_ADVSIMDFPACCESSTRAP special case, and it has to be done 
at the same time we're handling HCR_EL2.TGE.  Perhaps that can be separated out to its own 
helper.


r~
