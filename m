Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3751FCCF9E9
	for <qemu-arm@archiver.kernel.org>; Wed, 29 Oct 2025 13:39:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vE6Nt-00023W-8b; Wed, 29 Oct 2025 09:38:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vE6Nq-000233-4x
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 09:38:39 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vE6Nm-0001bs-2Q
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 09:38:37 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-4270491e9easo5990947f8f.2
 for <qemu-arm@nongnu.org>; Wed, 29 Oct 2025 06:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761745108; x=1762349908; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=drrCDzzWp9ZAwjtaL394EHQhDbbkx5hV5hdBSxYB0RQ=;
 b=tD7H3U1AspMid5PPUVOeTES19eLjucApbPmcfQCqB14dw2sXH8oqths7EKjKTrXYru
 ZVGjlFsWsrxDt6lEn3fz9t81TYqvl7Tt9qW8flbJNPI1BAinpvXlM2gxo1+1K4dY7zpv
 ZrQrDNUWsGCxdzpacN9d7ZbP+oT4Q4mIoJ3zsi0u43oaNna+1g1+DbGErh6WOKyuItzk
 cOBCEdG+BL6dsxYSKRDngiMFpHsZj/u3NkijLdzpvDO8sS9wzmFMrqI+naDEodBf6FQO
 pHwOLCmCGRzMOHWQ9hhJnPBW52RkwkeOFKUtDyL5i+Byq4YpKCAHVgchO4OD867/+i44
 C2wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761745108; x=1762349908;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=drrCDzzWp9ZAwjtaL394EHQhDbbkx5hV5hdBSxYB0RQ=;
 b=heGRZ8o58I5nKINTJBgl5nbFM/eeQXtE5xpE3X2wD9ene76Kl/hW5v6bQo/2B1u9i6
 qDvxHD235Z1haJ3hF2Xp6ukjJ7wRrielE2swoBm+FbC3VsPTG+G/KtXouA7ZHUXRDWEC
 iiVMRBOet/2X3MLwGIdO+321a1Y5tcOF4reNbboK0Ak4vilvoI0g+dwWs7cV7hxyZaTm
 c4f2sW0smfm8b6Ed5xOYzA08t90+1QxshVbhcQGe9PEExgmi+Q3Q6nT4eaV/gzG1438p
 s95Os8I+1+FGSxbqCzyakhSGq0UtTGemeGCyUqodyVG90NIcgebL2fn01L24CUWv/U+k
 Ba1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXT7KQ0y/ZmGXRFF6hAfoUqHvYhQRuG9XoitENGfXZBrsGvJak1/KWtJ+7/Xencq26D1uuSftxwyg==@nongnu.org
X-Gm-Message-State: AOJu0YzSlWyPWa5U5t4rY4fun/RfvDktwzcvRc0mAjqmjJsDt1JmO1vo
 O8VYn27MAG9RsL8IRB72NovqirdpH89Iq8OwsSpydiJvofWzRbxfoM+2Pv2nAKnN1UM=
X-Gm-Gg: ASbGncsjHY5lzk/OCUf0d7upMiaRUqvr2ofNBhV0alFxksupUiFu3IpGBDaIduJA70g
 MW+p/qHbnmhhkq/XpdWG/NBA46tEe1QagC91/2b9A3VLGS9C3MX0XMdGj/uFvY3EBQvHk+GPnNw
 557hf9u26BiPUhvBac1DZ4NXUDdKBftj8HcYZQUWu9JBX0SbvwiQ9f0Pzr/Sf3HPy8NSw6pjmGb
 FxGUNho93RQ4iWssuMjPiL41UNdFcj7kGBBLNUBI1PsNZkdNFGoJQ+dT5mlgZTROWushRR/MsRQ
 RBMnc7qRpOgwoOpVE0jZOtriqrPlPZ/uNicqXslcJ4DcyXsnsXyPo0YJKgOg1iDcAvzb1GpgsI/
 YCcjY8d68g1kr9gM6/ywZnoXFIHSnYT0Qn5OD0UPcNqap5cj4pqU8Y0Lq4sB8jctD6q370VQ7+z
 ATNfiyPXNhRyfw2qejC7Fh8qTvsrCLtNl0ao9H1CU6X6g=
X-Google-Smtp-Source: AGHT+IHnmTE0PCsxvTSPlvw3ewTff3emjQYCm99APNOqESiVm8YIW2N6NxeKcXRRUvLYtifSp6iDJQ==
X-Received: by 2002:a05:6000:144d:b0:425:8577:9cd4 with SMTP id
 ffacd0b85a97d-429aefcf870mr2349329f8f.54.1761745108374; 
 Wed, 29 Oct 2025 06:38:28 -0700 (PDT)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952df6b9sm27326076f8f.44.2025.10.29.06.38.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Oct 2025 06:38:27 -0700 (PDT)
Message-ID: <9242eddc-718d-40e6-854c-4847898ebd2a@linaro.org>
Date: Wed, 29 Oct 2025 14:38:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/35] audio: start making AudioState a QOM Object
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@gmail.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Alexandre Ratchov <alex@caoua.org>,
 Jan Kiszka <jan.kiszka@web.de>, "Michael S. Tsirkin" <mst@redhat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>,
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
 Laurent Vivier <laurent@vivier.eu>
References: <20251027151045.2863176-1-marcandre.lureau@redhat.com>
 <20251027151045.2863176-10-marcandre.lureau@redhat.com>
 <342519b4-4de6-f54b-606e-b1b3b1c97dc9@eik.bme.hu>
 <CAJ+F1CJj__oPiBwXKeH88tF8k6vEjqqe6KMO4g9HmcnNqbpRfA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAJ+F1CJj__oPiBwXKeH88tF8k6vEjqqe6KMO4g9HmcnNqbpRfA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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

On 28/10/25 13:34, Marc-André Lureau wrote:
> Hi
> 
> On Mon, Oct 27, 2025 at 8:29 PM BALATON Zoltan <balaton@eik.bme.hu> wrote:
>>
>> On Mon, 27 Oct 2025, marcandre.lureau@redhat.com wrote:
>>> From: Marc-André Lureau <marcandre.lureau@redhat.com>
>>>
>>> QOM brings some conveniences for introspection, type checking, reference
>>> counting, interfaces etc. This is only the first step to introduce QOM
>>> in audio/ (I have more in the pipeline)
>>>
>>> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
>>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> ---
>>> audio/audio.h     |  7 +++++++
>>> audio/audio_int.h |  2 ++
>>> audio/audio.c     | 43 ++++++++++++++++++++++++++++++++-----------
>>> 3 files changed, 41 insertions(+), 11 deletions(-)


>>> diff --git a/audio/audio_int.h b/audio/audio_int.h
>>> index f78ca05f92..b2b4d2d10e 100644
>>> --- a/audio/audio_int.h
>>> +++ b/audio/audio_int.h
>>> @@ -217,6 +217,8 @@ struct SWVoiceCap {
>>> };
>>>
>>> typedef struct AudioState {
>>> +    Object parent;
>>
>> Coding style says parent_obj, not sure other names are acceptable.
>>
> 
> 
> Alex, since you wrote that section in docs/devel/style.rst, should we
> enforce that naming?

Yes please!


