Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fa777c8bbesm7525601a12.22.2025.05.06.03.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 03:13:03 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id A9FC55F8BD;
	Tue,  6 May 2025 11:13:01 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>,  qemu-devel@nongnu.org,
  Thomas Huth <thuth@redhat.com>,  Alexandre Iooss <erdnaxe@crans.org>,
  "Michael S. Tsirkin" <mst@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  David Hildenbrand <david@redhat.com>,  Pierrick
 Bouvier <pierrick.bouvier@linaro.org>,  qemu-arm@nongnu.org,  Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Peter Xu
 <peterx@redhat.com>,  Peter
 Maydell <peter.maydell@linaro.org>,  Mahmoud Mandour
 <ma.mandourr@gmail.com>
Subject: Re: [PATCH 6/9] MAINTAINERS: add myself to virtio-gpu for Odd Fixes
In-Reply-To: <2e72ddae-2198-41ca-a31f-aab583ea4be7@collabora.com> (Dmitry
	Osipenko's message of "Mon, 5 May 2025 19:07:56 +0300")
References: <20250428125918.449346-1-alex.bennee@linaro.org>
	<20250428125918.449346-7-alex.bennee@linaro.org>
	<9115fa7c-ed94-449d-816b-a13125275dac@collabora.com>
	<cdc4d710-2b7a-44fc-b58c-78a81ca83b36@daynix.com>
	<2e72ddae-2198-41ca-a31f-aab583ea4be7@collabora.com>
User-Agent: mu4e 1.12.10; emacs 30.1
Date: Tue, 06 May 2025 11:13:01 +0100
Message-ID: <87y0vanj2q.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: a+AzMy4EPSuE

Dmitry Osipenko <dmitry.osipenko@collabora.com> writes:

> On 5/4/25 10:20, Akihiko Odaki wrote:
>> On 2025/04/30 3:56, Dmitry Osipenko wrote:
>>> On 4/28/25 15:59, Alex Benn=C3=83=C2=A9e wrote:
>>>> Seeing as I've taken a few patches to here now I might as well put
>>>> myself forward to maintain virtio-gpu. I've marked it as Odd Fixes as
>>>> it's not my core focus. If someone with more GPU experience comes
>>>> forward we can always update again.
>>>>
>>>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>>> ---
>>>> =C2=A0 MAINTAINERS | 3 ++-
>>>> =C2=A0 1 file changed, 2 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>> index 661a47db5a..f67c8edcf6 100644
>>>> --- a/MAINTAINERS
>>>> +++ b/MAINTAINERS
>>>> @@ -2636,7 +2636,8 @@ F: hw/display/ramfb*.c
>>>> =C2=A0 F: include/hw/display/ramfb.h
>>>> =C2=A0 =C2=A0 virtio-gpu
>>>> -S: Orphan
>>>> +M: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>>> +M: Odd Fixes
>>>> =C2=A0 F: hw/display/virtio-gpu*
>>>> =C2=A0 F: hw/display/virtio-vga.*
>>>> =C2=A0 F: include/hw/virtio/virtio-gpu.h
>>>
>>> Thanks a lot for stepping up!
>>>
>>> This reminded me that I wanted to propose myself as reviewer for the
>>> virtio-gpu patches. Will do it soon.
>>=20
>> Thank both of you for stepping up.
>>=20
>>>
>>> Akihiko Odaki is also good at reviewing virtio-gpu patches. Wondering if
>>> Akihiko would want to be added as reviewer or co-maintainer of virtio-
>>> gpu?
>>>
>>=20
>> Yes, please add me as a reviewer.
>>=20
>> I guess it would be better if Alex add you and me with the next version
>> of this patch or add follow-up patches to this to avoid change conflicts.
>
> +1 Feel free to add us as reviewers in v2 of this patch. Otherwise I'll
> send the separate maintainers-update patch along with nctx v12
> patches.

I shall add you both ;-)

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
