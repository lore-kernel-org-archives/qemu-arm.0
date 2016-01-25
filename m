Received: by 10.25.159.19 with SMTP id i19csp1290538lfe;
        Mon, 25 Jan 2016 06:52:14 -0800 (PST)
X-Received: by 10.28.35.6 with SMTP id j6mr19806180wmj.80.1453733534217;
        Mon, 25 Jan 2016 06:52:14 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from mail-wm0-x22b.google.com (mail-wm0-x22b.google.com. [2a00:1450:400c:c09::22b])
        by mx.google.com with ESMTPS id vh6si1864397wjc.32.2016.01.25.06.52.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 25 Jan 2016 06:52:14 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::22b as permitted sender) client-ip=2a00:1450:400c:c09::22b;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::22b as permitted sender) smtp.mailfrom=eric.auger@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-wm0-x22b.google.com with SMTP id n5so83821309wmn.0
        for <alex.bennee@linaro.org>; Mon, 25 Jan 2016 06:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-type:content-transfer-encoding;
        bh=G3G8ZbDSJ1IcwOIAqQrdFMmXbXJQ19aHf0M+LyIqFc4=;
        b=I6kMR0JyUsX39V/GP1tLpKST1PX2Lx3UHO3C25uQ04Z6GpdraEpzFivoxZsgzqNj2S
         X47fnC7GcCO75UPCgjUo8m+0VITSrwUiAghk3C2iqLjJzSBtBrf5tZS+4o3g7lC32Xdf
         5KWjDMMnW0OLCEfrqroULd6hJiGMEvOuzdyx0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-type
         :content-transfer-encoding;
        bh=G3G8ZbDSJ1IcwOIAqQrdFMmXbXJQ19aHf0M+LyIqFc4=;
        b=bJFjfPGgIUwyc+C58zzGUaglsQuAkngavX9owZDDe49Iz02MgslogY6HlArbWePWuP
         xAZ+9nc8auAnaiWqUKg09twQ15VJSZbuZo4bqSHIUZJo2jSkZJV9sNQGxxdZotWGD8eF
         2CE1QXj7YsyVRocOqFCRJQc4aIjf6UU4hGBu2u3IxiOkfD+Ek5MLu1ugoILhscRbr32u
         ZG00G0Gn+uyh1jO+Gzyb8TyNfAKbgMDq7LmNT2UNQEHLRMOYtFYbvaOQ6DNdVc7p0XqL
         erzvwGIV6aT/+wD/knFerVGWUP+BbkxgAlMkaJ2kn35vZuH/A4M+L/9lMsy1kvcBiJqE
         yLog==
X-Gm-Message-State: AG10YOT5Kn3nAkIQv5tTqYROm4GrNjIX/R6fagcpQNg7uvyRU8wRYyKzYSwSCYFs5llES/QDvHo=
X-Received: by 10.194.117.68 with SMTP id kc4mr17629135wjb.111.1453733533982;
        Mon, 25 Jan 2016 06:52:13 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from [192.168.2.12] (LMontsouris-657-1-37-90.w80-11.abo.wanadoo.fr. [80.11.198.90])
        by smtp.googlemail.com with ESMTPSA id p9sm19504011wjy.41.2016.01.25.06.52.11
        (version=TLSv1/SSLv3 cipher=OTHER);
        Mon, 25 Jan 2016 06:52:12 -0800 (PST)
Subject: Re: [PATCH v5 6/8] hw/arm/sysbus-fdt: helpers for clock node
 generation
To: Peter Maydell <peter.maydell@linaro.org>
References: <1453130204-655-1-git-send-email-eric.auger@linaro.org>
 <1453130204-655-7-git-send-email-eric.auger@linaro.org>
 <CAFEAcA9ZximjpaZ_rSdfM1JRyhW9dz1DZfcRRqQR+03heSPg2A@mail.gmail.com>
 <56A62CAD.50405@linaro.org>
 <CAFEAcA9+31D4yGnYr6DgQQLfSmp3wMiLLhuX07sje0oBRiLEFg@mail.gmail.com>
 <CAFEAcA-ByZWz0mpbVJTTsSzyn24M_DnREptu73w=UUtiHK69Hg@mail.gmail.com>
Cc: eric.auger@st.com, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, David Gibson <david@gibson.dropbear.id.au>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Peter Crosthwaite <crosthwaitepeter@gmail.com>,
 Patch Tracking <patches@linaro.org>,
 Christoffer Dall <christoffer.dall@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Baptiste Reynal <b.reynal@virtualopensystems.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 thomas.lendacky@amd.com
From: Eric Auger <eric.auger@linaro.org>
Message-ID: <56A6368C.5000409@linaro.org>
Date: Mon, 25 Jan 2016 15:51:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-ByZWz0mpbVJTTsSzyn24M_DnREptu73w=UUtiHK69Hg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-TUID: 9ZF6RUPIPvjL

On 01/25/2016 03:43 PM, Peter Maydell wrote:
> On 25 January 2016 at 14:34, Peter Maydell <peter.maydell@linaro.org> wrote:
>> On 25 January 2016 at 14:09, Eric Auger <eric.auger@linaro.org> wrote:
>>> Hi Peter,
>>> On 01/25/2016 03:05 PM, Peter Maydell wrote:
>>>> On 18 January 2016 at 15:16, Eric Auger <eric.auger@linaro.org> wrote:
>>
>>>> Don't we want to return here, rather than continuing with the
>>>> rest of the function? ("goto err;" with an err: label before
>>>> the g_free() at the bottom of the function probably best since
>>>> some of the error paths need to free that.)
>>> due to the &error_fatal, we are going to exit here. I thought it is not
>>> worth going further if we can't find the clock node.
>>
>> Yes, sorry, I didn't notice the error_fatal til I got to about
>> the last patch I reviewed. You can ignore similar comments
>> I made about some of the other patches.
> 
> ...so if you fix the 'asserts' comment thing, you can have
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

OK thanks for the whole review

Eric
> 
> thanks
> -- PMM
> 
