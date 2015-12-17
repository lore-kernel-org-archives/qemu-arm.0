Received: by 10.182.158.201 with SMTP id ww9csp455980obb;
        Thu, 17 Dec 2015 07:26:32 -0800 (PST)
X-Received: by 10.194.24.97 with SMTP id t1mr57852439wjf.127.1450365992808;
        Thu, 17 Dec 2015 07:26:32 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from mail-wm0-x235.google.com (mail-wm0-x235.google.com. [2a00:1450:400c:c09::235])
        by mx.google.com with ESMTPS id n19si18150594wjr.18.2015.12.17.07.26.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Dec 2015 07:26:32 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::235 as permitted sender) client-ip=2a00:1450:400c:c09::235;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::235 as permitted sender) smtp.mailfrom=eric.auger@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-wm0-x235.google.com with SMTP id l126so26710032wml.1
        for <alex.bennee@linaro.org>; Thu, 17 Dec 2015 07:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-type:content-transfer-encoding;
        bh=rXBySLgBbIQ8YIohuR5fquXRxalaVvTBQfo9AYriyHI=;
        b=h3akr90ZuWJcyEdH36boknPEmtd9tDr6wY/sTxC/sEuhq/m+lygvbKhAKbgD93iDjJ
         KGeJJ7kM7oNEHCaobS2GhUXnA+3M4DPvTRKt4hewfVSGtphkrKt6BNiA5zzwl3Mfk0S0
         Pd+IhEmHqH51ch2Fi41Y5Iy0B0qBOVF3pBMHE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-type
         :content-transfer-encoding;
        bh=rXBySLgBbIQ8YIohuR5fquXRxalaVvTBQfo9AYriyHI=;
        b=IHtkC/i4B148W595Lk7H1v2OCrAmZ5vYTobgR22uGsOy2ZoTaJ/DHlq4lcc/GZd7HU
         +vByZRISAABTh9D3eRUkHB1tWe2fhXgezEmm+qj1MK4KGpbnFnhVLtP8XDcorJSojKig
         FVZ00aMyamia83NHBA05k1KZm/xpIZeAwUM1fwrP12HxYDAIraYhRkp6rhHDTE/ZGwoZ
         kwiKzvJBbGH935UdYAQM0qpJjHs0zqH5KTzhUC/1NAsGTwGiJYk5OJLiBN8I2tBXG7kq
         l2AjCpQdAYoxJhY9IHvqQ2/Gfc7xm3XAxX+y9UcqOufVQ0IYIZ41Kpw5P4XnBgwZqD10
         E94Q==
X-Gm-Message-State: ALoCoQl+6+Dc3Rc7WaI7tPBKgWIwzSw9SW9dQ6sOrkNc7h84g8A6k72FGtiLDxkAoqfoqNeQrQLen32fTsvmNBA6aBmuaZtlaQ==
X-Received: by 10.28.90.132 with SMTP id o126mr5093860wmb.1.1450365992495;
        Thu, 17 Dec 2015 07:26:32 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from [192.168.2.12] (LMontsouris-657-1-37-90.w80-11.abo.wanadoo.fr. [80.11.198.90])
        by smtp.googlemail.com with ESMTPSA id b84sm2779503wmh.15.2015.12.17.07.26.30
        (version=TLSv1/SSLv3 cipher=OTHER);
        Thu, 17 Dec 2015 07:26:31 -0800 (PST)
Subject: Re: [Qemu-devel] [RESEND RFC 5/6] hw/arm/sysbus-fdt: helpers for
 clock node generation
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <1447946528-1533-1-git-send-email-eric.auger@linaro.org>
 <1447946528-1533-6-git-send-email-eric.auger@linaro.org>
 <87wpt4bv9i.fsf@linaro.org> <56727FDC.1040202@linaro.org>
 <87wpsdfbm6.fsf@linaro.org>
 <CAFEAcA8Pmu+Tb_RLXe97APgZEFqNB7SAR=miZkRo_WS_6R6_yQ@mail.gmail.com>
 <87vb7xf6r6.fsf@linaro.org>
Cc: eric.auger@st.com, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Alex Williamson
 <alex.williamson@redhat.com>, thomas.lendacky@amd.com,
 Baptiste Reynal <b.reynal@virtualopensystems.com>,
 Patch Tracking <patches@linaro.org>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Christoffer Dall <christoffer.dall@linaro.org>
From: Eric Auger <eric.auger@linaro.org>
Message-ID: <5672D401.2040000@linaro.org>
Date: Thu, 17 Dec 2015 16:25:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <87vb7xf6r6.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: E4b6cCH2vTCU

Hi Alex,
On 12/17/2015 04:13 PM, Alex Bennée wrote:
> 
> Peter Maydell <peter.maydell@linaro.org> writes:
> 
>> On 17 December 2015 at 13:28, Alex Bennée <alex.bennee@linaro.org> wrote:
>>> Usually I would expect to see a pre-declaration of a function at the
>>> head of the file and only if it is used before the actual definition of
>>> the function. It doesn't make sense to pre-declare right before the
>>> actual function definition itself.
>>>
>>> I'm surprised to hear the compiler complained, especially as nothing was
>>> calling this function in this patch.
>>
>> The compiler complains if it sees a function which is not static
>> and for which it hasn't previously seen a prototype, because
>> generally this means that either (a) the function is file-local
>> only and should have been declared static or (b) the function is
>> not file-local but you forgot to put a prototype in a header so
>> that other files can call it. (This is -Wmissing-prototypes.)
> 
> 
> Ahh I see now. I guess if its declared static in this patch and not
> used its going to complain about an unused function as well? Maybe that
> suggests the patch should just be merged with patch where it is actually
> used?

my fear is that it becomes too big for review then. I suggest we wait
for other comments and I will follow the consensus if any. I just wanted
to emphasize I did not ignore your comment but I just don't know how to
handle it at best ;-)

Thanks for your time!

Regards

Eric
> 
>>
>> thanks
>> -- PMM
> 
> 
> --
> Alex Bennée
> 
