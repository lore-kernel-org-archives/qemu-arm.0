Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp1090015lfo;
        Sun, 6 Mar 2022 16:00:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwaogODGt+XqZigUhT23uMsBa6s57D1G/0C53RWnFA8afXKYTOyOvcCgAzqDLOudNTgxduT
X-Received: by 2002:a25:31c4:0:b0:629:f72:99cc with SMTP id x187-20020a2531c4000000b006290f7299ccmr5809909ybx.549.1646611233655;
        Sun, 06 Mar 2022 16:00:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646611233; cv=none;
        d=google.com; s=arc-20160816;
        b=nR8zrbAPhXELBvzwJEDWwUaXHqazG3RxyJwoy3h1eatK61FfoKoLbuP0hf1mX/OO/c
         i9tCE7eSsNrjY1b7XbrfcrxvoQb7RMWWwTQQiAzkAodDs3ZY8XZjhgCAtVzjFs7qXQO8
         f7y+Uov/xc/nBZt5EAw+OM2Gn52y9gAh4agycUEE2gxmc9CkYTl5M686oBJvJyDgvhxn
         CS2BceOr29WITkAbU04mo0f7uRTooZJr7o+Vs/GZu72DZdBONrxCNR7HxoMMDbTELGFX
         dmJLl+4H7t8jrvZHIHks6o3SRLE/HedmJhzj61/50g4sNwkdTDzCooZU+5XDNDcKKdYS
         L6+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=9jUzM3h68dB2doXx5iieL8MIWnihNaAzc5IOtQGPZXM=;
        b=P/TSdEY5HxwVbOKHcXGNTs07s1mlYRK2l/8R1vGiA/SfkN0S33g904gln2dc5t7dZf
         y3xv3YYtyPiC1jABfVIuP2uknnOs4UqnJn5MaBjD7GNwekaiKMi+AQj1W3WAK3E0C9+1
         pFRurJEpuDHfpUF13fGhlhpGtA5urE7c7qdZeOzXkAbCwQhIacxfrsoBv1qBtnqEC//M
         xKAdnNp6/9aQoXuCZADxdKd034Wqje6jEOIoDjACNxW8JnCmgZXCztvqGjYxqUyCUgvS
         XRcO0x0Jo6P3iR076YVrhKZSxoVoHed8VBRLkuVNmP3Ex2lKxwXkp8cQRW4VamWdzQ0v
         Q4gQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=lTWP00Gj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k18-20020a25bed2000000b0061d8cb92f23si7909643ybm.84.2022.03.06.16.00.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 06 Mar 2022 16:00:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=lTWP00Gj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:53948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nR0nh-0000TC-3G
	for alex.bennee@linaro.org; Sun, 06 Mar 2022 19:00:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nR0nH-0000So-EG; Sun, 06 Mar 2022 19:00:07 -0500
Received: from [2a00:1450:4864:20::42f] (port=35570
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nR0nF-0005WD-TV; Sun, 06 Mar 2022 19:00:07 -0500
Received: by mail-wr1-x42f.google.com with SMTP id b5so20762808wrr.2;
 Sun, 06 Mar 2022 16:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=9jUzM3h68dB2doXx5iieL8MIWnihNaAzc5IOtQGPZXM=;
 b=lTWP00GjQdR0GKejhKwJUk5eR70uHt4KwgMssBVU3QtfaDS3vAMmqQNMTmk3ag7EI0
 GQGXdetV8g/YyfXOlLbxsectvTgdpQObnS2xPGdE0TXgiOlbaY1i5Vu2hwIiIfpX7hqO
 HxQldOgNkhzDKL+pafGV3TPXrI2Q8fByR8IryVp6VKqXBZ63Ory8toNrKDWVQdeha6LY
 Tg4wW40vVqXWvxuGrerbDas2sxKKogPQC2Tk1VKAc+6VhYpXz7yyHGsQsvfTS5txXSdl
 /LtBi2eaFibJ3/4Dxvxiwku8jQNMJsZzCR7lhchWkVJrL8PvRjT+QYGCv76apJk16NxN
 NClw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9jUzM3h68dB2doXx5iieL8MIWnihNaAzc5IOtQGPZXM=;
 b=BvinT7fD+z24GJUqYM8B031xR9gi8dBdEacLXEPCgoabn75TOK8ypY7khFOZUd6SW5
 WHjf/PlTmPRN9F6y2moo20TeqjceJZm4zMLFH5Rxw+jq79m1f8Wz2Tp+iAGa5qYqSMBb
 oxU5OsfE9SErsbs/SYGxPSS7Z1H4z2zQFiX1O4pEUs+1MdCwljM6XBzuJ97ps5Q/Mh3Y
 139SV7bAxWOalHxKOkKfJ9nQBe4H3x49/HNoYUV8Lpq0h2MndHnNF6I8NPMegtg8PAMn
 jJkeYidhUjwpWTSIwZiuhDCnlPSmPDTuM8jhT88HsjPu8gJ8R83hDXsln/cryow0McZR
 rIWQ==
X-Gm-Message-State: AOAM532TcOPs+wqIq3x/EM+8MAnybaRGTPQa4JyIbooHaUCmJOWU9lo4
 4qQfFGQ7m+CsviMGyK85wN0=
X-Received: by 2002:a05:6000:22c:b0:1f0:ff85:948d with SMTP id
 l12-20020a056000022c00b001f0ff85948dmr6234508wrz.494.1646611203879; 
 Sun, 06 Mar 2022 16:00:03 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 m3-20020a5d6a03000000b001f06621641fsm7786226wru.96.2022.03.06.16.00.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Mar 2022 16:00:03 -0800 (PST)
Message-ID: <1af23dba-8f7a-8d93-706d-6e16067cdce2@gmail.com>
Date: Mon, 7 Mar 2022 01:00:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v3 0/9] This patch series contains updates to PMBus in
 QEMU along with some PMBus device models for Renesas regulators. I have also
 added myself to MAINTAINERS as this code is in use daily, where I am
 responsible for it.
Content-Language: en-US
To: Titus Rwantare <titusr@google.com>, minyard@acm.org
References: <20220302015053.1984165-1-titusr@google.com>
 <20220304214354.GL3457@minyard.net>
 <CAMvPwGpzO3VyCqGJY28QVQoo9AwYxxrvP3RqPS6JTgpTk8ojtw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <CAMvPwGpzO3VyCqGJY28QVQoo9AwYxxrvP3RqPS6JTgpTk8ojtw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, venture@google.com, qemu-devel@nongnu.org,
 f4bug@amsat.org, wuhaotsh@google.com, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4YumHNfRDf2V

On 5/3/22 00:42, Titus Rwantare wrote:
> On Fri, 4 Mar 2022 at 13:43, Corey Minyard <minyard@acm.org> wrote:
>>
>> On Tue, Mar 01, 2022 at 05:50:44PM -0800, Titus Rwantare wrote:
>>> v2:
>>>    - split PMBus commit with updates into individual fixes
>>>    - renamed isl_pmbus[.ch] adding _vr for voltage regulators
>>>
>>> v3:
>>>    - split uint refactor commit and removed commit renaming files
>>>    - rename rolled into preceding commits
>>>    - update commit description for uint refactoring change
>>
>> This all looks good to me:
>>
>> Acked-by: Corey Minyard <cminyard@mvista.com>
>>
>> Do you have a plan for getting this in to qemu?  Like through the ARM
>> tree?  I could take it into an I2C tree, but there's really not much
>> activity or work there.
>>
>> -corey
> 
> In general PMBus is more specific to i2c than ARM, but I'm not sure of
> the QEMU implications.

Titus, could you address my comments?

Corey, if you are busy, I can take care of this series.

Regards,

Phil.
