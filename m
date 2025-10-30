Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B56DCCF9F8
	for <qemu-arm@archiver.kernel.org>; Thu, 30 Oct 2025 16:32:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vEVZ6-0003K3-BA; Thu, 30 Oct 2025 12:31:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vEVYs-0003Fh-BP
 for qemu-arm@nongnu.org; Thu, 30 Oct 2025 12:31:50 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vEVYg-0002HH-Or
 for qemu-arm@nongnu.org; Thu, 30 Oct 2025 12:31:40 -0400
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-b3c2c748bc8so171259366b.2
 for <qemu-arm@nongnu.org>; Thu, 30 Oct 2025 09:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761841885; x=1762446685; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JgscATsSSMPRhIE7wz4646HaTTG/bQuticFNhSwlNrE=;
 b=FVirLy0BHNI5tFETiNN0sHu157Xr4aJXoZERNkspSvVlEBwrcBJ4tDGnxGse1jZ6HH
 FvXl4hTBBUO1f0OuqlhxMuQzFafDfI+PApVHOq4Tz8I5rsivzRhzmqzsEl8E8uaOnoIJ
 wsEmH7XNpmabokkTpZlyPQq6JfcCbPmJhfOOJXeaiFgBO9cke2p4rE6g2B2BeXLKh4tb
 MKQ9sI9KAkxBUi3jEObZypqSFrfaauMO4mfb0JWACmAeblODX7LFKjBzzAJdaTP+b7Mb
 OfOq41FFrk60RwSljH54d4My41YuDYobgSp/DvGdF6KcrVQmlqW8NjToo2J5RM6aKKiJ
 z3Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761841885; x=1762446685;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JgscATsSSMPRhIE7wz4646HaTTG/bQuticFNhSwlNrE=;
 b=j4gO9N+UXU5wIFdO6glmaRAWrwd7ArrO7I7fdwYkkoADL7gsgLDL7tGoP4OEi13Vpu
 2+GlLdLMgxUO6hVDYA5qmdhxQJzW2rPwcfz4lYF3xOQ/F4UXdSqEtCqDmgkeYfsCTUWb
 Qkdx9gj2a2Ik4BObnD7ldmAd4Uu/CrH5GOPja2sDwpkQnC715qYOVeY6A+cIzOgrQrOh
 GTIhvLjdIsTjKimaEwq7QW/37MfHR2yyi0xNkAC6yV7e6YNocAuUyAjn5WZA8djHtmMh
 VFy7Z7J0hqVHvr/DY8SKZ88SsK6jSggCuIpJLHDLQY+7Tx2KEuqgIZPfiWCAd8gwa51N
 Ca0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXuT0WfBKD/heQ8xHsEDgBwCjgOmtgZ9eJM9JfvLFjj8UJ7BTYx4uu3oAGPu56Ew8jiQBP1nmXjw==@nongnu.org
X-Gm-Message-State: AOJu0YyTRLErq2ayagy41qXbt/HflaqfpJa2RLmaVrZI6geDIrnUR1Xr
 bOnfa1rvDJj9sCTbyR1irdLiBDnIJoXFvarobsoQksyQ4dBUo4Yuy39l/4XCI9ss3Q4=
X-Gm-Gg: ASbGncsSqJfzjA95/rASbDi/GBDi4jxKPM9vXSGOrHcyFUzwY1SC8loia/gnsUBo4+j
 bgnbzAlAatYzIpA+8J5oFW/9fbQS58o9ur0KMR0FGj0L5DPa1B5AeO/hTYgbY4Rb0twR26R4jI5
 LqXtFC9bg0Xhtn7nRMb8tw9Fp6nrf0Jr0XVx+/M27jiSvJx4YtplSZsu4IqAjf7FVv6Q0mndKcC
 yUt81a9nuZioYdRs8EEYuP8EsjYzMaM5q0OKNXaB11xnpJen/gy2QunqeoCZpmESP7ChVJeBXsz
 xWul/ZHfahGflBG2ApvJHPT+DQHjNgvhMS07tB5MVLWgqCoQIKUanCU03yvmCCjuf0x3JblZ+ix
 vRuaeONPOqfbkW6n2RE5S9JhCukXmj57Jj/laMjoxm3ZDIaqEVWoXIkSUZ+IvbgiaoXUXrHSWNG
 qJ+FWWh9tRBzrTcKIP+Ieiclu90cmq2+wYKgeLIrjUrg==
X-Google-Smtp-Source: AGHT+IEaR40rPReIDElPoY/lykrSRr94vSFRr8kIjKRRLKYlHa3IYGcn1UCdkaHGEnqXb3oADxWolg==
X-Received: by 2002:a17:907:6d26:b0:b6d:5cc5:89d9 with SMTP id
 a640c23a62f3a-b7070631082mr6705066b.47.1761841884855; 
 Thu, 30 Oct 2025 09:31:24 -0700 (PDT)
Received: from [10.180.230.213] (183.105.204.77.rev.sfr.net. [77.204.105.183])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d853f3851sm1791968366b.48.2025.10.30.09.31.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Oct 2025 09:31:24 -0700 (PDT)
Message-ID: <100e6967-9090-4531-871a-1118ef83dd65@linaro.org>
Date: Thu, 30 Oct 2025 17:31:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 19/35] audio: register and unregister vmstate with
 AudioState
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@gmail.com>,
 Peter Xu <peterx@redhat.com>, Fabiano Rosas <farosas@suse.de>
Cc: qemu-devel@nongnu.org, Alexandre Ratchov <alex@caoua.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Jan Kiszka <jan.kiszka@web.de>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Thomas Huth <huth@tuxfamily.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, qemu-ppc@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 qemu-arm@nongnu.org, Alistair Francis <alistair@alistair23.me>,
 Zhao Liu <zhao1.liu@intel.com>, =?UTF-8?Q?Volker_R=C3=BCmelin?=
 <vr_qemu@t-online.de>, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, Laurent Vivier <laurent@vivier.eu>
References: <20251027151045.2863176-1-marcandre.lureau@redhat.com>
 <20251027151045.2863176-20-marcandre.lureau@redhat.com>
 <ffab95ce-9b5d-43ea-93a7-611de6044ad8@linaro.org>
 <CAJ+F1C+qnkm=F1q0YSHZ9WbAMcz+-NJo5mzj1b-DcU24dNpRLQ@mail.gmail.com>
 <adbf6cd9-72b0-4ce9-93a6-4f83338ca8a3@linaro.org>
In-Reply-To: <adbf6cd9-72b0-4ce9-93a6-4f83338ca8a3@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 29/10/25 22:42, Philippe Mathieu-Daudé wrote:
> On 29/10/25 20:00, Marc-André Lureau wrote:
>> Hi
>>
>> On Wed, Oct 29, 2025 at 5:51 PM Philippe Mathieu-Daudé
>> <philmd@linaro.org> wrote:
>>>
>>> On 27/10/25 16:10, marcandre.lureau@redhat.com wrote:
>>>> From: Marc-André Lureau <marcandre.lureau@redhat.com>
>>>>
>>>> Proper lifecycle management with QOM state.
>>>>
>>>> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
>>>> ---
>>>>    audio/audio.c | 7 ++++++-
>>>>    1 file changed, 6 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/audio/audio.c b/audio/audio.c
>>>> index 4c3c3fd52f..853930bb48 100644
>>>> --- a/audio/audio.c
>>>> +++ b/audio/audio.c
>>>> @@ -1614,6 +1614,8 @@ static void audio_vm_change_state_handler 
>>>> (void *opaque, bool running,
>>>>        audio_reset_timer (s);
>>>>    }
>>>>
>>>> +static const VMStateDescription vmstate_audio;
>>>> +
>>>>    static void audio_state_init(Object *obj)
>>>>    {
>>>>        AudioState *s = AUDIO_STATE(obj);
>>>> @@ -1625,6 +1627,8 @@ static void audio_state_init(Object *obj)
>>>>
>>>>        s->vmse = 
>>>> qemu_add_vm_change_state_handler(audio_vm_change_state_handler, s);
>>>>        assert(s->vmse != NULL);
>>>> +
>>>> +    vmstate_register_any(NULL, &vmstate_audio, s);
>>>
>>> Please avoid legacy APIs:
>>>
>>> /**
>>>    * vmstate_register_any() - legacy function to register state
>>>    * serialisation description and let the function choose the id
>>>    *
>>>    * New code shouldn't be using this function as QOM-ified devices have
>>>    * dc->vmsd to store the serialisation description.
>>>    *
>>>    * Returns: 0 on success, -1 on failure
>>>    */
>>>
>>
>> qdev/Device have vmsd, but not plain Object (or legacy code without 
>> object).
> 
> Hmm right. Cc'ing Peter & Fabiano.

Not blocking, so:

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

But please consider an alternative. We really ought to remove this
legacy API.

Thanks,

Phil.

