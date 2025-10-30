Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9650ECCF9E3
	for <qemu-arm@archiver.kernel.org>; Thu, 30 Oct 2025 16:31:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vEVYI-00030F-9P; Thu, 30 Oct 2025 12:31:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vEVYG-0002xQ-8d
 for qemu-arm@nongnu.org; Thu, 30 Oct 2025 12:31:04 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vEVY3-0002DP-T2
 for qemu-arm@nongnu.org; Thu, 30 Oct 2025 12:31:01 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-63c3d7e2217so2092949a12.3
 for <qemu-arm@nongnu.org>; Thu, 30 Oct 2025 09:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761841844; x=1762446644; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DQEefFoXOGbbclOSElXowMt4zbsVDwOKRTZCZG0/hcQ=;
 b=pZ7vmbT6OL0VGlHMm0uI1vovHhBjWf9/wplkO+Fa8pookrP1Svc2fra/lNx90QUEjp
 qjhRmD4QgbK68JVa8b5ChEhF2D1Eum2NoFBNfLC2lDi9DgQeY1mdTKRtrEF8uejFGMsn
 ybBVkTOug7mpeAYYVMsDhG9n8VU6VJn/9IU8boVm74HsesWOyY+fmMhjEOOrW80OVKAO
 qpQFoeK8PpTnInQUefZ/o8/D6UaK63aqDaS+csE6Z2tx6C3lAtPA/86zu5eX5TmhOEyI
 FhExKNrQqiIxsu2miqMzpzHxZQSnQ0CiLowDdk7mrsIXrLPA/2WmQOFTBmS61NaDvW/Q
 i4Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761841844; x=1762446644;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DQEefFoXOGbbclOSElXowMt4zbsVDwOKRTZCZG0/hcQ=;
 b=VdFPGi0cmQ0NV5Q8gGQ7lstRj7FqQXxRpvYzVo37AA7O7aNNsPHe2ewK/Xq49bdFfM
 mAKAu01ruhUMw7sC7Mjyyfl4HLrp395WPbsnv2s/LbtJCEAhyAZR9I5nAtl1V8TWKJQ+
 iyyU+hTVVCmGcRJXkjkw+0C40118NjBk8f/FCbMIdIrF+OXSXDuzicBWdIDhyim6yyKC
 QKYvPRY8uDxzL4Y5IZd1b0HP5UYGzYOounbO7mVc7JrcypdY87JF0bSgXRcDgVIUKlo0
 yl67IDEfNRz2nm1rgKO/1mBaxH6gwqwTUtadrmtjOZdie1C9qC37dG7oZAAU25LGbgZP
 FPYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJWk5b3NSmElZbyJcKGR6KTOKtacm4GcLMwGt4yDaJ+BhJxhES53NWHICxNV1rYYmIUjp+goyBRg==@nongnu.org
X-Gm-Message-State: AOJu0YwmVivBFl6ARP3vY9HCQA5ZMWAEhI82EPxpbeIC8XdzMr6f7k61
 mtmV9jCMa1NGkRQ0ZEH+09xo07+glNgnRAYEZfWPRQw1RSOZz6cn2t7C9TbO4ZtX1Zw=
X-Gm-Gg: ASbGncvPOscerBLOWjeRVntfD/GigquHrH1H4DQQsfYjPiObCQzrfpGKPXZmURKbdH1
 73AXsU7PcZD5WpcF1eDT9zAc+m4uRkkif2JpgaR9xT0d3iRT3HrMC4+o9uay1rbzSxXkZAEAgG6
 +aWDLFPAH1mPw0b/fEjX9uqkJF6Gs0KjJuArqF3SRI8Qkb7U3RswkPVOQ5Kz2T5LPIT9kKCNHGD
 +Oe9En1JdjQQzPaNXHWZO1gmUdMvaqjHZtKdE26129fJ1ohpH+iUdhXBbRuYB1Wkw8Xar61Dg2m
 oN+i9xo/p2r24SO0CAXetx7i/iTrPGGVdYNjhuWSDPFRYApmxm3yLoMYcKXlC6mMjJA9XYau8kE
 ddpIcksOgRsBIevdb7L+j4wV1fA9U/TYJ9B70TOwybZfV8PIUOzt9yUCd/qQTPhxWc48DiRisiA
 2BpTKJGRzQ+C6Exqoa4WyZWOzuxunus0opEnqr2zY0Iw==
X-Google-Smtp-Source: AGHT+IHnYrNZxUyWoONL46qOnJ/BGUoKXVfQ7thK/SUZQb9c4PzRPL9w091Lk5JnMfm++vOfoSJnzg==
X-Received: by 2002:a05:6402:5353:20b0:63e:19ec:c8e4 with SMTP id
 4fb4d7f45d1cf-64077025460mr44521a12.28.1761841844306; 
 Thu, 30 Oct 2025 09:30:44 -0700 (PDT)
Received: from [10.180.230.213] (183.105.204.77.rev.sfr.net. [77.204.105.183])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64068f74a56sm1888001a12.15.2025.10.30.09.30.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Oct 2025 09:30:43 -0700 (PDT)
Message-ID: <d0b66630-40ea-40a3-9da4-d817b9febc88@linaro.org>
Date: Thu, 30 Oct 2025 17:30:41 +0100
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
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

