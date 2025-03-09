Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac23973810csm583735166b.118.2025.03.09.05.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 05:05:57 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id E46285F9DA;
	Sun,  9 Mar 2025 12:05:56 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: Peter Maydell <peter.maydell@linaro.org>,  qemu-arm@nongnu.org,
  qemu-devel@nongnu.org,  qemu-stable@nongnu.org
Subject: Re: [PATCH v3 0/9] target/arm: Implement SEL2 physical and virtual
 timers
In-Reply-To: <e5c5e542-f28c-4f4d-884d-ee3defd0a330@tls.msk.ru> (Michael
	Tokarev's message of "Sun, 9 Mar 2025 08:24:23 +0300")
References: <20250204125009.2281315-1-peter.maydell@linaro.org>
	<e5c5e542-f28c-4f4d-884d-ee3defd0a330@tls.msk.ru>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Sun, 09 Mar 2025 12:05:56 +0000
Message-ID: <87msduo1cr.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: /E4qAUTCX5Z/

Michael Tokarev <mjt@tls.msk.ru> writes:

> 04.02.2025 15:50, Peter Maydell wrote:
>> This patchset is a respin of Alex's patches, with some extra fixes
>> for bugs I discovered along the way in our existing code (and
>> a bit of refactoring to make the fixes straightforward). It is:
>> Based-on: 20250130182309.717346-1-peter.maydell@linaro.org
>> ("target/arm: Clean up some corner cases of sysreg traps")
>> because it wants to use the renamed CP_ACCESS_* constants that
>> that patchset introduced.
>> The bugfixes are not super exciting as they mostly are oddball
>> corner cases, but I've cc'd them to stable anyway. The actual
>> implementation of the missing SEL2 timers also should go to stable.
>> Alex Benn=C3=A9e (4):
>>    target/arm: Implement SEL2 physical and virtual timers
>>    target/arm: document the architectural names of our GTIMERs
>>    hw/arm: enable secure EL2 timers for virt machine
>>    hw/arm: enable secure EL2 timers for sbsa machine
>> Peter Maydell (5):
>>    target/arm: Apply correct timer offset when calculating deadlines
>>    target/arm: Don't apply CNTVOFF_EL2 for EL2_VIRT timer
>>    target/arm: Make CNTPS_* UNDEF from Secure EL1 when Secure EL2 is
>>      enabled
>>    target/arm: Always apply CNTVOFF_EL2 for CNTV_TVAL_EL02 accesses
>>    target/arm: Refactor handling of timer offset for direct register
>>      accesses
>
> Hi!
>
> Which stable series this patchset is supposed to be applied to?
> (Current active stable series are 7.2, 8.2 and 9.2)
>
> Or put it in other words, is it supposed to go earlier than the
> most recent stable series, 9.2?

I'd just do 9.2 because I think as you've found too much has changed.
That should become available in backports while we wait for trixie to
stabilise this year.

>
> For example, the very first patch, "Apply correct timer offset when calcu=
lating
> deadlines", does not apply to 8.2 because it lacks v8.2.0-2122-g2808d3b38a
> "target/arm: Implement FEAT_ECV CNTPOFF_EL2 handling" which touches the s=
ame
> line in target/arm/helper.c:gt_recalc_timer().
>
> Thanks,
>
> /mjt

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
