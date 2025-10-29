Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E0C0CCF9EE
	for <qemu-arm@archiver.kernel.org>; Wed, 29 Oct 2025 21:42:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vEDw3-0005fJ-PH; Wed, 29 Oct 2025 17:42:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vEDw1-0005dy-6v
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 17:42:25 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vEDvp-0005oO-Pm
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 17:42:24 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4770c34ca8eso2666165e9.0
 for <qemu-arm@nongnu.org>; Wed, 29 Oct 2025 14:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761774123; x=1762378923; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QAAOCxQ3njC9sd38gRl2lcX4tyoH13t+XkOmzilp5O8=;
 b=Va5r2qcmCXfmpQsPB57lxY23RulNHd1mKi7HhdRQBp9Cc23Kz83ttVrHF2P+3ZFB/U
 5MhCWnUWiX+GHe44Wz4jTWSE5Wvw7/NySVmtCTl1nIre22Zb9wv6b0nejQJlA8/86ssE
 +CyP8UNRgJCUNZ0NgiJJiSBmQUFHjv1NntfBRI3WKIdfDlxCNA5sIaFpN4V63rgIGSGf
 BD/79lp5ZLt8xGhGSS6wpwOsPBoRK2DAWvsigMfmQ8Q/o9sRlJytTzG7acPDCt2f80M2
 KiBH8XQKBWLKcQx0gNrKDPkjV/q1jvMXJr6r0l6KtZOG0Hs4Gchqn1xVI03LJFhFrSuF
 cC0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761774123; x=1762378923;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QAAOCxQ3njC9sd38gRl2lcX4tyoH13t+XkOmzilp5O8=;
 b=XrRy8kEHeEw0Iv/F2+zF/cynGGOh1Ow1HG+mikJD/5IjUhI1GHuitrcdpiDH6DQPR+
 o18CLF8lBOSk3FEvKS24px9Yr4zIaZ9azaU0/o3h8lz6XPlV1EGV8NsLDzWkSYEBpZFB
 2M6/iXKSd4kZMLRze4Lq0uBlnj3Ftf+DgJAB1szqgJtrw9B5T0DnlyJ4QJUDTyTw/fwL
 Xk79b4oXmHpGgb/YV+y+W3OiX4wvmv5mLingSBiQRCtAZ9+E6fJ9xFTCxuQsNQ+ASPyW
 SGwZwOzKtICS6WHC6MqzP5S8DjRnd1z3uEg/kHz0FVFa6YL4gON7YOWH71IlfQgRzlT9
 SsUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqeb+Dz2KLDeGuYJZA/EJRweHCLEB6TDG1szx49+DGO5JTkPxIQfOg8dF5KFQL+Ok1CF6sxf0inQ==@nongnu.org
X-Gm-Message-State: AOJu0YxjYC9AhqwFXMgkg9QtU5ZfkcTPKZV78C5qBlXBbRJ1OSRW7Bns
 K4c57Qp3foVIf2BO/Pu7jr9tmX4Xj/+b7ur3VAWmey7yzdrcrvD/AYbxi0xXPOzfeY0=
X-Gm-Gg: ASbGncsJasFAxzMZ6yxmOjqISEuiJzOkMlnpKk0tbAjZT8c5VopIpVkPwQYDEy4zON+
 Jj0ZrfUkToplYPNQCDAjzkajZa/4xridVoD+lDXUg5T/z6JMPtZE3eKvn0PL042Fl6GXCwrs3NK
 1UDnsmvmmv1ucqsi0HjvRmXkvw5lfFcx7Qnz+xepcusX7zPbCEn9FhTnKa5CvvX5mH3roxHR+l7
 EnsfecQ5EP4ubwivVTGI1z3w67IWjSA0CAFVy9sCNLnsFCypI+2v9n31WG3U9kguwFgRZZd0glS
 aCk2Cxz46YHBmyi0IkUycrlWnvCzmzu1MdPR0gn2Kn59AiecLxg1bMHlo31xyYJRslA+9zOqNfE
 H4KcZ5VM3pSImcftD4L9pBCqlkyMnf5k2Rbm4DHULB8BTH0TmOhbQFGC+rAExZzH4gyiW7CR7F3
 w03+zF0I2t/UjysZLEq7kH/igvdjJ5QW+CdwWj4/sThW4=
X-Google-Smtp-Source: AGHT+IGnB4KRWCBDbIHVNsOMOSYmdoSFBuOFopMo/r5gQ8CYOJ7qC/h5Z0Tfdef5fEmjqZd0Aw4EyQ==
X-Received: by 2002:a05:600c:46ce:b0:471:15c1:45b9 with SMTP id
 5b1f17b1804b1-4771e3b84c0mr47555425e9.29.1761774122790; 
 Wed, 29 Oct 2025 14:42:02 -0700 (PDT)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4771832e857sm55417945e9.0.2025.10.29.14.42.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Oct 2025 14:42:02 -0700 (PDT)
Message-ID: <adbf6cd9-72b0-4ce9-93a6-4f83338ca8a3@linaro.org>
Date: Wed, 29 Oct 2025 22:42:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 19/35] audio: register and unregister vmstate with
 AudioState
Content-Language: en-US
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
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAJ+F1C+qnkm=F1q0YSHZ9WbAMcz+-NJo5mzj1b-DcU24dNpRLQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 29/10/25 20:00, Marc-André Lureau wrote:
> Hi
> 
> On Wed, Oct 29, 2025 at 5:51 PM Philippe Mathieu-Daudé
> <philmd@linaro.org> wrote:
>>
>> On 27/10/25 16:10, marcandre.lureau@redhat.com wrote:
>>> From: Marc-André Lureau <marcandre.lureau@redhat.com>
>>>
>>> Proper lifecycle management with QOM state.
>>>
>>> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
>>> ---
>>>    audio/audio.c | 7 ++++++-
>>>    1 file changed, 6 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/audio/audio.c b/audio/audio.c
>>> index 4c3c3fd52f..853930bb48 100644
>>> --- a/audio/audio.c
>>> +++ b/audio/audio.c
>>> @@ -1614,6 +1614,8 @@ static void audio_vm_change_state_handler (void *opaque, bool running,
>>>        audio_reset_timer (s);
>>>    }
>>>
>>> +static const VMStateDescription vmstate_audio;
>>> +
>>>    static void audio_state_init(Object *obj)
>>>    {
>>>        AudioState *s = AUDIO_STATE(obj);
>>> @@ -1625,6 +1627,8 @@ static void audio_state_init(Object *obj)
>>>
>>>        s->vmse = qemu_add_vm_change_state_handler(audio_vm_change_state_handler, s);
>>>        assert(s->vmse != NULL);
>>> +
>>> +    vmstate_register_any(NULL, &vmstate_audio, s);
>>
>> Please avoid legacy APIs:
>>
>> /**
>>    * vmstate_register_any() - legacy function to register state
>>    * serialisation description and let the function choose the id
>>    *
>>    * New code shouldn't be using this function as QOM-ified devices have
>>    * dc->vmsd to store the serialisation description.
>>    *
>>    * Returns: 0 on success, -1 on failure
>>    */
>>
> 
> qdev/Device have vmsd, but not plain Object (or legacy code without object).

Hmm right. Cc'ing Peter & Fabiano.

