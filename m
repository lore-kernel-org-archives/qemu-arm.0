Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1923891ejc;
        Fri, 10 Mar 2023 05:49:33 -0800 (PST)
X-Google-Smtp-Source: AK7set8tjfV7OS6BntzuKC/fc6UUFxwM6g9sE30Wt7ldQP+ppdTvAAZc2z8/kTA2Qjp9e/wSM3ro
X-Received: by 2002:ac8:7dd6:0:b0:3ba:3ac7:ccf1 with SMTP id c22-20020ac87dd6000000b003ba3ac7ccf1mr42380727qte.58.1678456173004;
        Fri, 10 Mar 2023 05:49:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678456172; cv=none;
        d=google.com; s=arc-20160816;
        b=XcSbuBckaelR8ulZ2TSIz04gFnNtQL0M7AhO69QApKt5SnoMkscO/sT6FQfk3YdKcE
         NV6t9F4k/fP4drW9LOgIGxQhN7+h08EdOiDzst3NPJiX6aizEfVjHGQuj/Eg65KHbPEf
         huy5TlWYnMiLNPVemXuLh5BRmwM2FxW8jhjZOjQ3JsXMYLJ6mCuTHNrdwKE7M6XFYShQ
         CHZV3vrshVc4icbQj7OIVMGrZX0CKPLI7nry6FHkKGh5vFtryQL8dlCI0CX6aRJT6SKp
         oVSQfJ4JgtVADKz8BBxJlNQ+D5JFCcnjbzfncV66U1s6GFLz+SOoCW2NNwHdSO6oa48a
         OloQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=oi9DJgYRGOxRK2boYk9yZZ1jBscShlzbluATUYS2c6k=;
        b=wDhqWoFWWMfITe6Y2GFwnvGJsQ7sbIFPc0E9f4q400QXsRO8JDSYQ7rH2MeVx+8XSg
         J39o110mpFUwLZIHr2aCPqgTvk7GMJIjOiYR772uaxzaOlpEbwaKnrSRkqaHFrUV0bU5
         A/uQIi5Lwf1KyjLEUb4AEpogbAAy/GKAS+adVxWA58CLS79whJhq4NifrJ5lWbrKiNap
         hKH/1PgXATopxtRtdUwe5bWvoUPA6t82cOXF92l7j8PaH0s/MytN6KfNpeZ4TZL3u+XA
         Xmsap/J15XEXmpQcbanu3T2+0ZLY7fAgMRKrEYegpi8EkBU2XmX8ej8p92dIO2XCttB0
         0uDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s202-20020a37a9d3000000b00739136cc027si1355803qke.358.2023.03.10.05.49.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Mar 2023 05:49:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pad7R-0007IP-CK; Fri, 10 Mar 2023 08:49:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1pad7P-0007Hn-RP; Fri, 10 Mar 2023 08:49:11 -0500
Received: from mail.csgraf.de ([85.25.223.15] helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1pad7N-00068h-G1; Fri, 10 Mar 2023 08:49:11 -0500
Received: from [0.0.0.0] (ec2-3-122-114-9.eu-central-1.compute.amazonaws.com
 [3.122.114.9]) by csgraf.de (Postfix) with ESMTPSA id 8CA486080292;
 Fri, 10 Mar 2023 14:48:57 +0100 (CET)
Message-ID: <44c6459b-f17f-8cb7-ba2d-a9187f32cde0@csgraf.de>
Date: Fri, 10 Mar 2023 14:48:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 0/2] hw/intc/arm_gicv3: Bump ITT entry size to 16
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Shashi Mallela <shashi.mallela@linaro.org>,
 Eric Auger <eric.auger@redhat.com>, Neil Armstrong <narmstrong@baylibre.com>
References: <20221223085047.94832-1-agraf@csgraf.de>
 <CAFEAcA-1PUCFZPAF25uy1VqjgciKXiYmfW-89q6QqKhf1io7Lw@mail.gmail.com>
From: Alexander Graf <agraf@csgraf.de>
In-Reply-To: <CAFEAcA-1PUCFZPAF25uy1VqjgciKXiYmfW-89q6QqKhf1io7Lw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: v0A0ADUrLqwk


On 03.01.23 18:41, Peter Maydell wrote:
> On Fri, 23 Dec 2022 at 08:50, Alexander Graf <agraf@csgraf.de> wrote:
>> While trying to make Windows work with GICv3 emulation, I stumbled over
>> the fact that it only supports ITT entry sizes that are power of 2 sized.
>>
>> While the spec allows arbitrary sizes, in practice hardware will always
>> expose power of 2 sizes and so this limitation is not really a problem
>> in real world scenarios. However, we only expose a 12 byte ITT entry size
>> which makes Windows blue screen on boot.
>>
>> The easy way to get around that problem is to bump the size to 16. That
>> is a power of 2, basically is what hardware would expose given the amount
>> of bits we need per entry and doesn't break any existing scenarios. To
>> play it safe, this patch set only bumps them on newer machine types.
> This is a Windows bug and should IMHO be fixed in that guest OS.
> Changing the ITT entry size of QEMU's implementation introduces
> an unnecessary incompatibility in migration and wastes memory
> (we're already a bit unnecessarily profligate with ITT entries
> compared to real hardware).


Follow-up on this: Microsoft has fixed the issue in Windows. That won't 
make older versions work, but the current should be fine with GICv3:

https://fosstodon.org/@itanium/109909281184181276


Alex


