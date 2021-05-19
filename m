Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp1741550lfm;
        Wed, 19 May 2021 11:24:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzjkNMbnf+vVSD284Ug//0zbI46klkJscH2eCdk45tWqb+xPckv0C3Px0ed6Lj4N9VvMdaS
X-Received: by 2002:a92:c24b:: with SMTP id k11mr277612ilo.303.1621448659279;
        Wed, 19 May 2021 11:24:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621448659; cv=none;
        d=google.com; s=arc-20160816;
        b=h+mC3UsJv2JCMUnpIZ+vmeWynAs0KgB3qYaizwJLFoizKTc6+atUAnQlhm9bfdKvnk
         ogi4cO6Z6DwRA23QPORnPrDXchISDlTgB3mNO7Y6Jx/bcPBZzDnHDz/ki3C5MDZyuQu+
         P8M+UOnpyzt0KZaacbsAJd04PNVEv1O7iV1l/06nnQYCZx7g8LQw/F9utWRgTpfd/LfD
         RcIJeHzOH1N4I11A6qMGuW+RHG1EiHR1XWF7STF2drONj6bomV2GW5I7845kWOjHtBff
         HFv4/rOYswr86AyA+Qo5PJKpxMNXXOJsKUSJuguJFBqvk4f+mvMvYcJQjXNWMS9uPfgX
         8Tgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=jHO8dmw1MigvtVCo4d6zcWwIP4phs2Z1g6GWUe3kglk=;
        b=xpHkJJJmHBWYZACHwR4dCHR4Ff5l5C5qwhwKeNhHfV2oJcZxfpfyXC7bJeEEvbm9zl
         tF3YSCNJ+eEPfZB1bX51BxMfUjVDg+Gvm2g200USYH7GiyNpTofkTBifSaChCmWNE42Q
         GI+FlA6q3wvvgKT6HQJmQ1DKLGf4k7uQVJDT1O3BTNiJkprUGgv9CMzSijiqFado871E
         SOXnoQxJYzXzhHlLoTsTN05TT5/59PdP9reVKsYHpReRyG1OAC6+ydZ1T6sOs3b1mZj8
         rqqwuAwj/K2nYdJ8i0f0OXNwHJZXJ5uOPTYq4MutXHlBWVfYymzljyDzxAKRKvHsNFZp
         pf1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Uqv9IdoV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d12si35084ioi.7.2021.05.19.11.24.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 May 2021 11:24:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Uqv9IdoV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:55426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ljQri-0007Ky-Jb
	for alex.bennee@linaro.org; Wed, 19 May 2021 14:24:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ljQqN-0005XU-B5; Wed, 19 May 2021 14:22:55 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:37537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ljQqL-000159-C7; Wed, 19 May 2021 14:22:54 -0400
Received: by mail-wr1-x42a.google.com with SMTP id q5so15010617wrs.4;
 Wed, 19 May 2021 11:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jHO8dmw1MigvtVCo4d6zcWwIP4phs2Z1g6GWUe3kglk=;
 b=Uqv9IdoVp+aqmWJfvvNBQl/R/hztTqTCv8QNxdVyiemf7/xNs9ybj1G467XE9aTqvQ
 9KKweVgUwkUM/NY9Fo7XCvQAL1QzoSz3FQPZ9yWAOq+e24L8hPfc+i1ojHJmIRRepJTu
 d5WkS3jD0q5/FOiFD6AxZyrekpBfLWPHQLJuu25wI1wc7VHFqU8znp/N1/CHMq1a8k2S
 VF4zsDet9hG/0DNw72Psve0LnZfCAGvx5QI3QhxeI9Yj0D/l1Sd4k6E3bNcReitvE6Of
 0fGszCsntLFzQB/eIbhtwAOlGxtQ825SrOkZIWpklB7BPZMgKN5XdZiPh4wHaT4/CHln
 dbIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jHO8dmw1MigvtVCo4d6zcWwIP4phs2Z1g6GWUe3kglk=;
 b=Y0gBbFkTS9oMjGkYj8JjOwd4DV5DKEU7T5w4NYAntZy6xy+rISfvltQOSj/96yItQY
 Y5iJx9AyHYeiBiorGcV9OlzgOwblbBR8G8q6JTWoGlZ68gSPIk3GvZZajzLG7tuLbmkS
 Tj8nhDzfMowM28+CX3NmRQR9r5oQaNb/xQLLcNKcVyTXhGICm1Yg+fWpqRDb1gtyftWY
 vMQ5pIKMrhdjvirSuo+ofYvQJOwRblC7+pCLbouAtM4m5e3wByGEgywl8ZfFdWxi7s81
 WRtEvGl5DVg+53wMEHEIu1/exfwf+ICacX0UqfYy8E3fqGis/YegIO+Hmluv1yPn7JI2
 ti6A==
X-Gm-Message-State: AOAM532KJfy7y4FfwXg+SiY6nbr7XHSDxgKRRvYKkOQYDFLHfGgTLEXJ
 jFlWY1tPBxttrQIJqccIQxU=
X-Received: by 2002:adf:e944:: with SMTP id m4mr293525wrn.10.1621448571585;
 Wed, 19 May 2021 11:22:51 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id q27sm153972wrz.79.2021.05.19.11.22.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 May 2021 11:22:50 -0700 (PDT)
Subject: Re: [PATCH v2 1/3] hw/display/bcm2835_fb: Resize console on reset
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20210323161443.245636-1-f4bug@amsat.org>
 <20210323161443.245636-2-f4bug@amsat.org>
 <CAFEAcA8hKY2XGUhWoyvB8wb+mqc8nhUJHhM7J2=0EUiMBXsstQ@mail.gmail.com>
 <2953bd3c-bdde-0a51-8938-eb3fa4808213@amsat.org>
 <20210329055915.zvkxo5u6cvk7hycp@sirius.home.kraxel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <7520ac3d-3505-ada6-d277-763c5c9f6229@amsat.org>
Date: Wed, 19 May 2021 20:22:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210329055915.zvkxo5u6cvk7hycp@sirius.home.kraxel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LsN9aqjrLqTq

Hi Gerd,

On 3/29/21 7:59 AM, Gerd Hoffmann wrote:
>>> and realize
>>> already calls qemu_console_resize(), so how can adding a
>>> call to resize here in reset cause the console surface to
>>> be created any earlier than it already is ?
>>>
>>> I also don't understand how the GUI timer can call us before
>>> the device is realized, given that we only register ourselves
>>> via graphics_console_init() in the device realize.
> 
> Yes, should not happen.  Also note that graphics_console_init()
> creates a surface.
> 
>>> Is it possible to get the UI layer to
>>> not start calling into graphics devices until after the
>>> system has been reset for the first time, for instance?
> 
> Can that actually happen?  I don't think it could in the past,
> but maybe now with the initialization changes.  We can add a
> check to gui_update() ...

Do you mind sending a patch?

Thanks,

Phil.
