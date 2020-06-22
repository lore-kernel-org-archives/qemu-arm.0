Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2981243lfm;
        Mon, 22 Jun 2020 01:44:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw/jD8iYsAe0YlrY+KOzudEaNSAj9geu/5ApX+nk+C11ESz58YVklV8kMUId+jILTt+LDz/
X-Received: by 2002:a25:c60d:: with SMTP id k13mr25399505ybf.506.1592815446992;
        Mon, 22 Jun 2020 01:44:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592815446; cv=none;
        d=google.com; s=arc-20160816;
        b=WM1XcuEYPbp3x+KliEoSXlB2G5IXo1YV31mYia5SJ0/PnIXydvRY0nKferBDBu2yxy
         kxk79cO9Y2kbjJ4v2D7f6kpsUtDjIZWpoTa08+071DZH21Ul21eVxE4cL/rBCYb4kz/i
         d4bdGeMEpO2mDsDRwVdjaheSJFouPBxlV3Kx18BulCPNn59zK83NFm9g6rObkCi7qndu
         PNuFwUNZSyphzYeAvivc6QCwCJ2f0WfdKZQU+re2IfjO4nZv0hX+P+iF3ueC3NB+YJXX
         9CSF4KkGdIYcLDqaEAP7zUmidd3z8GqASkeYINIY5ghIV2l1RXiw4/Dj3ooCH2191Sdq
         O5XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=gUrhqtUVb7WEXGDDyHWujIuZ94CXofzZzWPqCK1RSmg=;
        b=1EjnaIA1fR6a6Io+kvUCGtUOA/OWr2GRhULzpcsMoYpE6he6sw3ZKKlphru8oRf7Y/
         9TpTLaJd69Hhts5qhY70E8zGr/ecw7m19vLs9RkqJBPfmBNe2GxdmYpvh+3rsPNu4BJf
         87dJ82LINdkYYeGGac75TOAc/PyGfJ6KTYCOXiLkH/ikjn8wj8zkP3il9VHnVQ1Qijg8
         GgPDHXtyx4LBHRkbRDiInaN7XIsZs14kcisvtB29qPIPZDjFVrNZTwTfFy5nTkaN8bj4
         BIY30DlfwqvTz7hnHfghzVQsE+OiNmhEFH1Tz+L0TAqZ1WFVQTbWVz/t35y+44DD0c7m
         sOVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=MfB1lpDO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n10si11855472ybd.465.2020.06.22.01.44.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jun 2020 01:44:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=MfB1lpDO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:56470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jnI3i-0006pc-DG
	for alex.bennee@linaro.org; Mon, 22 Jun 2020 04:44:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jnI3a-0006of-Fz; Mon, 22 Jun 2020 04:43:58 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:39355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jnI3Z-0002OX-0P; Mon, 22 Jun 2020 04:43:58 -0400
Received: by mail-wm1-x341.google.com with SMTP id t194so14852393wmt.4;
 Mon, 22 Jun 2020 01:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gUrhqtUVb7WEXGDDyHWujIuZ94CXofzZzWPqCK1RSmg=;
 b=MfB1lpDO80yf7t27wxUbejKbDUe1PN/OrBagVNezSU0FgZx9Ca6hBFGuganBYZ48ov
 24eOwd2CmnTZD3OpGa4+Td5Fk6oVQf4Jh17antK5OzKeaMlwSuPtGVdVZDGZi0y0Hwus
 GeH3rUY68CPMFkh6Dp7x3h97i7YAjcSIqpTNnGseJuHB8htuLAT8ekHcK3n97Dty2P3F
 Dqi+pKRqA88RuheFjCr6jkAIyohc7mBDRXw+SgDMRVGYooELDQBHzf3Gx6gbKOYkNHeX
 TswWKSc6lJdsCl2fvrkGSLhoz7QdUhpm7bmBI80oLDzgvflstRDaeBtqstHi+PXQta7u
 H8WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gUrhqtUVb7WEXGDDyHWujIuZ94CXofzZzWPqCK1RSmg=;
 b=BNYNUSwQOXbnpVcoCjsk6abkziACTSWeSairSPTfJkXnJ/A0K/8GUCnNRVghn1ML7h
 iVssDXLEw4IVuEAeK25EKs323qBGkcmI76ujj5LI45fgbnW+W0aNa/+9FJLoXVbtHfAg
 A3dPZ+rDuSTznJAX58MRF+QJg7s50gBlxuc2WKPVQ+OJr/ZlhOT8KDbaYlErdwD93rE9
 eONI48/auDGeKJZ3SOY12BX5r/SSPwDWr9pkMJhLnbSFez0Mi42GhVEOoAE0B6XyLf+4
 6YRrnVdJ5gzFv5pHamZb3UzsYVJ3CTme/eMYLeR7Zz2hNYb0ha4/hvS0fuuGxjpzpIZi
 XGfg==
X-Gm-Message-State: AOAM5330ErG9yI/2F3kcnilex3ff8+As1VA2poKnKwc0GZ7rn1f/OYlx
 bJGOjnOP3/02o52ToYx0sNE=
X-Received: by 2002:a7b:ce14:: with SMTP id m20mr8893570wmc.129.1592815434412; 
 Mon, 22 Jun 2020 01:43:54 -0700 (PDT)
Received: from [192.168.1.39] (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id h203sm16080992wme.37.2020.06.22.01.43.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jun 2020 01:43:53 -0700 (PDT)
Subject: Re: [PATCH 7/7] hw/watchdog/wdt_aspeed: Reduce timer precision to
 micro-second
To: Andrew Jeffery <andrew@aj.id.au>,
 Cameron Esfahani via <qemu-devel@nongnu.org>
References: <20200616075121.12837-1-f4bug@amsat.org>
 <20200616075121.12837-8-f4bug@amsat.org>
 <914f089d-e81e-4b01-bd70-4702d8b39724@www.fastmail.com>
 <ad812821-8b06-bb82-d336-ffb1e7c14839@amsat.org>
 <1acc89c9-8a5c-4ba5-9201-2f0124cd7969@www.fastmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <3e3459aa-7179-56e5-3e4d-b25f2ea3b450@amsat.org>
Date: Mon, 22 Jun 2020 10:43:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1acc89c9-8a5c-4ba5-9201-2f0124cd7969@www.fastmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Corey Minyard <minyard@acm.org>,
 David Hildenbrand <david@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Reitz <mreitz@redhat.com>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: M9LiAcL3tFFY

On 6/22/20 2:21 AM, Andrew Jeffery wrote:
> On Wed, 17 Jun 2020, at 13:11, Philippe Mathieu-Daudé wrote:
>> Hi Andrew,
>>
>> On 6/17/20 3:18 AM, Andrew Jeffery wrote:
>>> On Tue, 16 Jun 2020, at 17:21, Philippe Mathieu-Daudé wrote:
>>>> The current implementation uses nano-second precision, while
>>>> the watchdog can not be more precise than a micro-second.
>>>
>>> What's the basis for this assertion? It's true for the AST2500 and AST2600, but 
>>> the AST2400 can run the watchdog from either a 1MHz clock source or the APB 
>>> clock (which must be at least 16.5MHz on palmetto). The reset state on the
>>> AST2400 configures the watchdog for the APB clock rate.
>>>
>>> The Linux driver will eventually configure the watchdog for 1MHz mode
>>> regardless so perhaps the AST2400 reset state is a bit of a corner case, but
>>> I feel the assertion should be watered down a bit?
>>
>> What about this description?
>>
>> "The current implementation uses nano-second precision, but
>>  is not more precise than micro-second precision.
>>  Simplify by using a micro-second based timer.
>>  Rename the timer 'timer_us' to have the unit explicit."
> 
> So is this a limitation of QEMUTimer? I was establishing that the hardware can 
> operate at greater than 1 micro-second precision.

No, I misread your comment about the AST2400 timer which can run
at more than 1Mhz.

The QEMUTimer doesn't have a such limitation; this patch
aimed to simplify the code for reviewers, but you proved
it incorrect, so let's disregard it.

Thanks for your careful review!

> 
> Andrew
> 
