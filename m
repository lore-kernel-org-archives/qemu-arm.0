Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp2373063lfr;
        Sat, 10 Apr 2021 06:53:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzZrSolEezz1QxgOm7j8w9s6ybdX8rYgS2CN+XNGVxRpkZ54M9Hk0csd7jTuXu42ARItcaV
X-Received: by 2002:ac8:7dd2:: with SMTP id c18mr17701616qte.301.1618062834221;
        Sat, 10 Apr 2021 06:53:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618062834; cv=none;
        d=google.com; s=arc-20160816;
        b=c1YqBtxYa/+XSAiOGnV5E3t/bgzJoTPMHcU4dfXjWI42B2xW7Aj2UApg28b//y5qVc
         IikIMZIaJkderxBpxHWvGV7Urrazh1svaFfNahJ1LmTUZXKaMFfYRnn7qJYkxKu4umun
         NvVOar/tAdOcDJbIhKpxLxmLhkScZZr5EIg1W+hA5QMn7kWvgHP2DeCESiXT0gLdKeMQ
         NXJe3ttVsJ7CM2eeJKJwz+ydYRXpuR+SVtlLlmIS0YVBaYv9v4CMY5GuMugLE/wyImaL
         37wM6wjBit7k08HoTg5XBjr8El/65RUD7Ab/9AGNOqRnSeGbMEZnquZgU4DdmBDg35Js
         rNfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=UeZFIhM++2FYLJLIE0k1TTzDzyVMoFh04CbgRPL6Q9o=;
        b=Byoe5dVUPXjQ0ZfELEg7G+bEDLkQYl8s8AFfuon3aZNXzFtjMwKUtXgTcrLNDWW+T+
         2+727xqaHsfgNHkf/FiplA/hNG2VQPuyDWGh70eXimwuLBh746M1zSI7HmyNy4vw6hW9
         EByDtYYvws39uA7pJaZ/Z1SFtIH6SJdKzcG7z6hte4PY30Fny5lndQGUJxE3Lf5i0Qo6
         8OKyRhrjMmny7gKTVON2q1oK02iYecTilIDWnHushdx05X1vPNkizfsq8/p6VwTj5W/2
         jFu93WUXEyZSQd9HH68SBqzPOhSMo4/639pHFqSfYvKIh1/AaBujS5vTAZLFkddTrsaH
         VUGA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=HAy3bw8w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v6si4318445qvn.59.2021.04.10.06.53.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 10 Apr 2021 06:53:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=HAy3bw8w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:56366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lVE3d-0002fk-II
	for alex.bennee@linaro.org; Sat, 10 Apr 2021 09:53:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lVE3S-0002ej-1l; Sat, 10 Apr 2021 09:53:42 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:42627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lVE3Q-00021i-Fi; Sat, 10 Apr 2021 09:53:41 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5-20020a05600c0245b029011a8273f85eso4400794wmj.1; 
 Sat, 10 Apr 2021 06:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UeZFIhM++2FYLJLIE0k1TTzDzyVMoFh04CbgRPL6Q9o=;
 b=HAy3bw8wgau/OSVn9VqtDeYXB6ntOiSEABws+T6PISQwtMrZXXBmd7fnGt+ob7nt1+
 rbNRFGztqEkY5SvOoMA5M7ptasKjShChRWK/4l8pSoEaZBOyxMLUa1OqBnbJRdeP/r9F
 CrUKGIJe8Kw36JOQYRX8h7RZ354FluYd5L+Pmf9h2K2gERqNUI5n0g23LsNYNdZoYelI
 FieSzz5a/NIfe0rSL4pIzvvjIhJkslI4QDy0eYeJ8qZSRxM4U5cdSh6GPM3rE5MEKqho
 rDsPTShx48PWMJgy98d/igDsUon2Cnsphc1H1P+EbkTAhCLINW9788ttWyIyxeblTFDL
 cR6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UeZFIhM++2FYLJLIE0k1TTzDzyVMoFh04CbgRPL6Q9o=;
 b=SzV+HLE73CkA0Ow79Py3O/Ozn5Q/97dijgJwIXt+gcUJKOqZBpqTsTV9wxN9XwqGFb
 78mZWvpNVfjSD/06VEWYtm25hHdXmK8nsuHBT4j4EqBuTUa5WY/EVPxqwnTm5d5dy2wo
 ZJ6JUegrYNYRgRYf9RQKUFwnJcwZgDrlTe8yvKJ178hYNtRSt79cJnIQzHfxMTWPTQNl
 +aNmvYA80czfhbvX464XZM6VoNLdUxTOTgvRQ2nPNwTXqC8uR5NK5EuBkPZZK7zA3uzh
 Yv/FVS1gvEhSv8GbDN+1w+yhEY5s3bacvd15KbannrF6LWiUdwJ2FuNq9XsCzECHVOFV
 8DBQ==
X-Gm-Message-State: AOAM531R56z6aoKfTPTcZy3jkDWk+vK7cdNFthVVl8EwM27D463rqvDo
 I5uBoR6sN9xHZNjxAHjwpYk=
X-Received: by 2002:a1c:4102:: with SMTP id o2mr18343585wma.177.1618062818325; 
 Sat, 10 Apr 2021 06:53:38 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id y2sm6836998wmi.20.2021.04.10.06.53.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 10 Apr 2021 06:53:37 -0700 (PDT)
Subject: Re: [RFC PATCH-for-6.1 0/9] hw/clock: Strengthen machine (non-qdev)
 clock propagation
To: Luc Michel <luc@lmichel.fr>
References: <20210409062401.2350436-1-f4bug@amsat.org>
 <20210410131932.i6no5tvvaldyomvp@sekoia-pc.home.lmichel.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <09a63c3e-aa68-0d2d-b447-db9cd84dab09@amsat.org>
Date: Sat, 10 Apr 2021 15:53:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210410131932.i6no5tvvaldyomvp@sekoia-pc.home.lmichel.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0LTJ3L9fE92o

Hi Luc,

On 4/10/21 3:19 PM, Luc Michel wrote:
> On 08:23 Fri 09 Apr     , Philippe Mathieu-Daudé wrote:
>> I've been debugging some odd issue with the clocks:
>> a clock created in the machine (IOW, not a qdev clock) isn't
>> always resetted, thus propagating its value.
>> "not always" is the odd part. In the MPS2 board, the machine
>> clock is propagated. Apparently because the peripherals are
>> created directly in the machine_init() handler. When moving
>> them out in a SoC QOM container, the clock isn't... I'm still
>> having hard time to understand what is going on.
> 
> I think there is a misunderstanding on how the clock API works. If I
> understand correctly your issue, you expect the callback of an input
> clock connected to your constant "main oscillator" clock to be called on
> machine reset.
> 
> If I'm not mistaken this is not the way the API has been designed. The
> callback is called only when the clock period changes. A constant clock
> does not change on reset, so the callback of child clocks should not be
> called.

They why the children of a clock tree fed with constant clock stay with
a clock of 0? Who is responsible of setting their clock to the constant
value?

> However devices that care about this clock value (e.g. a device that
> has a clock input connected to this constant clock) should see their
> standard reset callback called during reset. And they can effectively read
> the clock value here and do what they need to do.
> 
> Note that clock propagation during reset has always been a complicated
> problem. Calling clock_propagate is forbidden during the reset's enter
> phase because of the side effects it can introduce.

Ah... Maybe this is related to the generic reset problem in QEMU :(

>> Alternatively I tried to strengthen the clock API by reducing
>> the clock creation in 2 cases: machine/device. This way clocks
>> aren't left dangling around alone. The qdev clocks are properly
>> resetted, and for the machine clocks I register a generic reset
>> handler. This way is safer, but I don't think we want to keep
>> adding generic reset handlers, instead we'd like to remove them.
> 
> I find your API modification a bit restrictive. I think creating a
> standalone clock can be useful, e.g. in complicated devices that may
> want to use internal "intermediate" clocks. I would not remove this
> possibility to the API users.

Well, this is the point. I can't see a justification to have a clock
on a non-qdev object. We should be able to model complicated devices
with qdev.

We are having various problems with the CPUs which are non-qdev devices,
or recently even with the LED model...:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg798031.html

Phil.
