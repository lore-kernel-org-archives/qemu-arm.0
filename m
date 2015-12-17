Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id g3sm10991653wjw.31.2015.12.17.07.56.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Dec 2015 07:56:17 -0800 (PST)
Received: from zen.linaro.local (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 11D223E0030;
	Thu, 17 Dec 2015 15:56:16 +0000 (GMT)
References: <1447946528-1533-1-git-send-email-eric.auger@linaro.org> <1447946528-1533-6-git-send-email-eric.auger@linaro.org> <87wpt4bv9i.fsf@linaro.org> <56727FDC.1040202@linaro.org> <87wpsdfbm6.fsf@linaro.org> <CAFEAcA8Pmu+Tb_RLXe97APgZEFqNB7SAR=miZkRo_WS_6R6_yQ@mail.gmail.com> <87vb7xf6r6.fsf@linaro.org> <5672D401.2040000@linaro.org>
User-agent: mu4e 0.9.15; emacs 24.5.50.4
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Eric Auger <eric.auger@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, eric.auger@st.com, QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, Alex Williamson <alex.williamson@redhat.com>, thomas.lendacky@amd.com, Baptiste Reynal <b.reynal@virtualopensystems.com>, Patch Tracking <patches@linaro.org>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Paolo Bonzini <pbonzini@redhat.com>, Christoffer Dall <christoffer.dall@linaro.org>
Subject: Re: [Qemu-devel] [RESEND RFC 5/6] hw/arm/sysbus-fdt: helpers for clock node generation
In-reply-to: <5672D401.2040000@linaro.org>
Date: Thu, 17 Dec 2015 15:56:15 +0000
Message-ID: <87twnhf4rk.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: VwnRhsgB+feK


Eric Auger <eric.auger@linaro.org> writes:

> Hi Alex,
> On 12/17/2015 04:13 PM, Alex Bennée wrote:
>>
>> Peter Maydell <peter.maydell@linaro.org> writes:
>>
>>> On 17 December 2015 at 13:28, Alex Bennée <alex.bennee@linaro.org> wrote:
>>>> Usually I would expect to see a pre-declaration of a function at the
>>>> head of the file and only if it is used before the actual definition of
>>>> the function. It doesn't make sense to pre-declare right before the
>>>> actual function definition itself.
>>>>
>>>> I'm surprised to hear the compiler complained, especially as nothing was
>>>> calling this function in this patch.
>>>
>>> The compiler complains if it sees a function which is not static
>>> and for which it hasn't previously seen a prototype, because
>>> generally this means that either (a) the function is file-local
>>> only and should have been declared static or (b) the function is
>>> not file-local but you forgot to put a prototype in a header so
>>> that other files can call it. (This is -Wmissing-prototypes.)
>>
>>
>> Ahh I see now. I guess if its declared static in this patch and not
>> used its going to complain about an unused function as well? Maybe that
>> suggests the patch should just be merged with patch where it is actually
>> used?
>
> my fear is that it becomes too big for review then.

It's a valid concern although I think in this case your patches are
fairly well contained.

> I suggest we wait
> for other comments and I will follow the consensus if any. I just wanted
> to emphasize I did not ignore your comment but I just don't know how to
> handle it at best ;-)

It's OK, there is often dark compromise involved in keeping the compiler
gods happy - as long as it compiles clean ;-)

>
> Thanks for your time!
>
> Regards
>
> Eric
>>
>>>
>>> thanks
>>> -- PMM
>>
>>
>> --
>> Alex Bennée
>>


--
Alex Bennée
