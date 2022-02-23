X-Google-Smtp-Source: ABdhPJxCQNK2LkW/r4jfeL6efAu/piHYeTTUI0nWa9GDyAEezZYoozPA8iGcxHHaxRr9BnK7QnKx
X-Received: by 2002:ae9:ee16:0:b0:49b:7b4e:63d7 with SMTP id i22-20020ae9ee16000000b0049b7b4e63d7mr621193qkg.492.1645639271323;
        Wed, 23 Feb 2022 10:01:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645639271; cv=none;
        d=google.com; s=arc-20160816;
        b=oMDlXbHIPIZS4CbSTmhbVLFq+TTvYzytNgdCqDIAUm20Tf+SeVYEuxRzRL9hhFushP
         JiWmNFqY5/W6UxXNo0MzLi60MQazbqW4r+jc4KA6nzxWBi0c/0Zr+Q+90szk9X2B2sta
         h/QN6UVO0B9tpgkRRhARakjP75YPrS7V9w96low1ad64VOkgv7lJsHfqP4rK59glyVwI
         YsaDZsIZW6TirT6mNG3sNtOwT6CSr2x7L4IAcLjvfmhxuotvduU7RwEwCfPLwId0HnvX
         /pJNUdRl+brU3FQGZZ3VyLIz87hoUSAnoAmmJAIkIwWM+VhbLrE5yZWBEiQiiKo7Bfal
         0sjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id;
        bh=vViioc6whi6P49ivwRhJSPIhbXGE0YKlZsDXyAhMF1M=;
        b=KZ0q1ILlOtTm8NiuZAQ9UsB/l0UzS8zRCkjIKhD67A1IWUu5qek8fexVzU5y8uTjsH
         aMLiVeb/lWEQhBAnAOn2gPEDpN6X5/dSNJl8p9W239yUo7ERuX/GzQwwVcyCABAMwJuh
         i/U4ek5cTwuQt9akPRGQwkSN7gV3IcMSxj1dxSM+mLUkSYDQuW/HazJM2nnZ0LWJoLZ7
         8bqUpi6PXeSGd8bQp1OWOGiz5vqjWt0sH7/NeJYUZ/iQZdb768QuaaPzMCh9HUM+pdB+
         YySmJlju1pfqtQHe4yn2ipO3G1sUe8MDwJa113yLZQMKYEVR5vBf4CwW3Jw5K3H4nk0c
         VFNA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w3si182740qkj.152.2022.02.23.10.01.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Feb 2022 10:01:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nMvws-0006MO-RC
	for alex.bennee@linaro.org; Wed, 23 Feb 2022 13:01:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nMvwM-0006Jm-BV
 for qemu-arm@nongnu.org; Wed, 23 Feb 2022 13:00:38 -0500
Received: from 8.mo552.mail-out.ovh.net ([46.105.37.156]:43919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nMvwJ-00012n-Ps
 for qemu-arm@nongnu.org; Wed, 23 Feb 2022 13:00:38 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.98])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 0340423CA8;
 Wed, 23 Feb 2022 18:00:23 +0000 (UTC)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 23 Feb
 2022 19:00:22 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G00100310ca7-9ec1-402b-aaac-cfe6068dea7a,
 B99DB1D1B0B873888386AAA9583771E84E582508) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.58.215.209
Message-ID: <47a30c46-a3ef-72b0-0834-79f1547c6e45@kaod.org>
Date: Wed, 23 Feb 2022 19:00:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH RFC 4/4] rtc: Have event RTC_CHANGE identify the RTC by
 QOM path
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philippe.mathieu.daude@gmail.com>
References: <20220221192123.749970-1-peter.maydell@linaro.org>
 <87a6ejnm80.fsf@pond.sub.org>
 <043096b3-aadf-4f2a-b5e2-c219d2344821@gmail.com>
 <CAFEAcA8OMB_+rxrS1pk4YJ0avj-ZSdyEROJyppOT1+0s6447MQ@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CAFEAcA8OMB_+rxrS1pk4YJ0avj-ZSdyEROJyppOT1+0s6447MQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 51562f3d-fc7e-42ec-958c-1273ba1dcf91
X-Ovh-Tracer-Id: 8518277220518235128
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrledtgddutdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeejuedutdetteeljeekudeiffehgeekhffffeejffegheefheefieduudeuheevnecuffhomhgrihhnpeguvggsihgrnhdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=46.105.37.156; envelope-from=clg@kaod.org;
 helo=8.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hzGNQd/kfzHv

On 2/22/22 14:06, Peter Maydell wrote:
> On Tue, 22 Feb 2022 at 12:56, Philippe Mathieu-Daudé
> <philippe.mathieu.daude@gmail.com> wrote:
>> On 22/2/22 13:02, Markus Armbruster wrote:
>>> Event RTC_CHANGE is "emitted when the guest changes the RTC time" (and
>>> the RTC supports the event).  What if there's more than one RTC?
>>
>> w.r.t. RTC, a machine having multiple RTC devices is silly...
> 
> I don't think we have any examples in the tree currently, but
> I bet real hardware like that does exist: the most plausible
> thing would be a board where there's an RTC built into the SoC
> but the board designers put an external RTC on the board (perhaps
> because it was better/more accurate/easier to make battery-backed).

Yes. like Aspeed machines.

C.


> 
> In fact, here's an old bug report from a user trying to get
> their Debian system to use the battery-backed RTC as the
> "real" one rather than the non-battery-backed RTC device
> that's also part of the arm board they're using:
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=785445
> 
> -- PMM

