Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0091CCF9EE
	for <qemu-arm@archiver.kernel.org>; Wed, 29 Oct 2025 13:47:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vE6Vp-0006iv-Fj; Wed, 29 Oct 2025 09:46:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vE6Vf-0006Wl-OW
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 09:46:43 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vE6Vb-0003EV-Fc
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 09:46:42 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-47112edf9f7so48128135e9.0
 for <qemu-arm@nongnu.org>; Wed, 29 Oct 2025 06:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761745594; x=1762350394; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=z28ZgmiJC98xG744tnvm/mLyRQR8+/6a2JjELzwEK+8=;
 b=uDvUx0p6lKpAHEB3skcFw22s5kFji73b2XQ3oiQEFdQF7eWEdotxNnzRUNQTRk+DHy
 jdT9OatZWeSoI6U87Da/Ksn3Ukw3djylkUHk2CR45878tjHWDYFLv4rmXlTIVzKDpO/t
 boQaweBGStZMo/s9RO3TfTfSxPkpoEfVUhCimxP8ESY4nZBFLnk9NHpyu1jTW8+YjYEe
 3u+AUNpvnTU0aMVe5/yDinZJl+xLUwSTBycbmKqtmyqGEQGx3hyWRDvBHpMgUrp7NTee
 8yectzepwgIw5JmAuvrQnYNhQ/hjgawZKK5jmV1pb6WB75IbaY17T6gGn477smwLWpaH
 PZbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761745594; x=1762350394;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=z28ZgmiJC98xG744tnvm/mLyRQR8+/6a2JjELzwEK+8=;
 b=l2L85S+0rwcYefgTE9c4xzUx+N6NN/X0pyDWCkUCSTgT2ewOuMpatDZVvP0VXnRGBH
 IE49TguVl3kAKVGKf5T91Xd6AfFEbUIqK5yp0WB4vk2jK21jsx2Bsx0JX1CwxR3buV06
 l7LjYRdoapx21TsrjCOXJBAT4sudUMpoF7CvRQlBoFWN0gkKJ1j5XE7FbxqLwsE/ytHj
 Y93sIkBCpXwRFn/+9/jL/mBFSi+Lofl3b0k5YvXawWVvzDJPiujJrEYmFfsY8UdAv75N
 yzJGX/fmai1yqEshrqfyU6y+EQpzS3e7+2FAxHksTlAnaVRFaX6ZgmmyyhLGlMZJyUlk
 kPug==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIKII0P0N31zxqXf43gX47eAhSea84JVOD/SqDnKZV1RjtcsyS6+igSP8K0LWEd/iP4w1eZowYMA==@nongnu.org
X-Gm-Message-State: AOJu0Yz/O+2A1INVGfumz8SSNC0cq/h23UEuVKYzCdSjdxNeQSDqywgV
 w9hg47wwakqL0xLqK4DV0UbmcjUtbev2FnvWnDFoic644pygg/sidT7OcXFJqhvrCR8=
X-Gm-Gg: ASbGncttPfa7hVxnzHj9wCw+fIs4678Fe+gwOjidvZcRD7g2m3x4iTboyqC2iKOtqHw
 UcgGPURcr5OxxcK667+j1Eultk35zayNHNouA3DH00U1jcojqXnFQx+M5GjeYP6AB33LsYkFEg5
 6ht9lMzQk7bH9NSFfheQhAdmiFM3XhkZdsacav7SChLnH2p1+be/ZlmppEM2vtTqruaQ3rfO30H
 uctSWbnqjkr1Kywm01orXMALEoSMQ76gowtplmqb6uU0WsWsQRJymlV7dtM2g/yyDXjwyWvCf9g
 zmr0essPTF8mKyrULPDRKFfEwrM8NqICb46GOA6A3JjrnaQs8CBbJXnJuKAIuaePPnw0Z+tVijy
 IIxEHMsCyz/TRQKoYV+32L9UnKW9WNb/6PpGOXiDr5ItXsktPjFiweuJkFcq4sOHBqo7Q8qQnkG
 qBcWjzvpgnngTgMc0IFG4xH/F94o4kdzwvDzEb4c+8T80=
X-Google-Smtp-Source: AGHT+IFIu73iiIADnrroCFGtvADc8jRFxaiWtlWiDzbPB81VMgN4QXbSZR1uA8Q2DELznMuRB4CHTQ==
X-Received: by 2002:a05:600c:530e:b0:475:d8f3:71c1 with SMTP id
 5b1f17b1804b1-4771e1e01a2mr26474835e9.27.1761745594359; 
 Wed, 29 Oct 2025 06:46:34 -0700 (PDT)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4771e20205esm48034695e9.12.2025.10.29.06.46.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Oct 2025 06:46:33 -0700 (PDT)
Message-ID: <75120e9b-9362-4898-96d3-dec9cd7e137d@linaro.org>
Date: Wed, 29 Oct 2025 14:46:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 18/35] audio: keep vmstate handle with AudioState
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: Alexandre Ratchov <alex@caoua.org>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Jan Kiszka <jan.kiszka@web.de>,
 "Michael S. Tsirkin" <mst@redhat.com>,
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
 <20251027151045.2863176-19-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251027151045.2863176-19-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 27/10/25 16:10, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> QOM-ification continues.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   audio/audio_int.h |  1 +
>   audio/audio.c     | 12 ++++++++----
>   2 files changed, 9 insertions(+), 4 deletions(-)


> diff --git a/audio/audio.c b/audio/audio.c
> index 155809dee7..4c3c3fd52f 100644
> --- a/audio/audio.c
> +++ b/audio/audio.c
> @@ -1622,6 +1622,9 @@ static void audio_state_init(Object *obj)
>       QLIST_INIT(&s->hw_head_in);
>       QLIST_INIT(&s->cap_head);
>       s->ts = timer_new_ns(QEMU_CLOCK_VIRTUAL, audio_timer, s);
> +
> +    s->vmse = qemu_add_vm_change_state_handler(audio_vm_change_state_handler, s);
> +    assert(s->vmse != NULL);
>   }
>   
>   static void audio_state_finalize(Object *obj)
> @@ -1671,6 +1674,11 @@ static void audio_state_finalize(Object *obj)
>           timer_free(s->ts);
>           s->ts = NULL;
>       }
> +
> +    if (s->vmse) {

Already asserted as non-NULL?

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> +        qemu_del_vm_change_state_handler(s->vmse);
> +        s->vmse = NULL;
> +    }
>   }


