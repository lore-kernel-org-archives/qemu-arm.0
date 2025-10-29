Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8568CCF9EB
	for <qemu-arm@archiver.kernel.org>; Wed, 29 Oct 2025 13:50:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vE6Yc-00087z-3j; Wed, 29 Oct 2025 09:49:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vE6YZ-00086o-58
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 09:49:44 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vE6YS-0003qe-Ew
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 09:49:42 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-471b80b994bso99800745e9.3
 for <qemu-arm@nongnu.org>; Wed, 29 Oct 2025 06:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761745773; x=1762350573; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bFG8gwDo2dMIA+dlMTwwaXhTvZBM52R0Qxu7TU/qj7Q=;
 b=JwlKJb1385LKVKX49BazKQkAlRfYkCeGY0m6YCstsqRkPd2FsB8BmJiuOxOzk9FvfR
 HoGbACF5zeuhAl2risDhg9YccHTPmZooRe5I5BjsQsmZr5v53onBegQ6O4KaSzKbZAIs
 4vvQeJkq8wSEcXtpv6jcHBHaCovfmC+DbiGQJKb40LTwvtN0FVS5HOmDCCiwx9rL3FpU
 kv824BKVpb6J/Sqha9AHezR04spmWeQ+iBACGmrMs+CeUmt9RY/cmKP0W1oLLmHqZQ8E
 Q0SCz9d5cZ/S1vvPV4BnL0drP9WSUqwgaeEZbuJGI6IZG4eYX4nJquBQ+HYQ0MuIOXbX
 6IRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761745773; x=1762350573;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bFG8gwDo2dMIA+dlMTwwaXhTvZBM52R0Qxu7TU/qj7Q=;
 b=TbGhbs/mqfgxbeFpQP03BhLUN4BLHRtVpqkjTwXUh8+8ZrFT8XsTyNIWbeOSqI9hr+
 RHotIc7WlZfBnQF7SJM8aHJTtMQwhNhszv6Av1zSHsbSVTlMA0PkhVY9gErzOmoSayok
 g7r1VFIK8U1MBCQVfxc4Rj+T893VQRliddNbzM7J5ehcuz3HdnLyxiFn6EKEsT08a4eb
 zhSU8LAHojj6Dx8o1ic6HpTY9HRc6sBJy6UUt/rbt3FI6n8ZEZMzI2EEGryLTUIUjzzD
 /RN6+Lcjp2/gQihy8RezyamUbmY2z+/rSQLZyes/qNhdFzr7uxgMCoe7P3wO+EcG7lnL
 ipRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5UHMawnrzgf5ml4nEK0PrU8IgqOsGw+s0C93YkzlZ99s31R31KMcuNGsGNXMTxGRCJ1HF2O2nxQ==@nongnu.org
X-Gm-Message-State: AOJu0Yz6iO4Ue9T5pPrFldSK6q5u5VitycHqHbZUzHHHs896NiF1znfH
 yLnX3tFb/4bGMMrzSmJVoguvo2uoTWmh1Ja+VLfFcRgO1wwPuMHq2Tp1mKEDKI4/Lc8=
X-Gm-Gg: ASbGncvrLXhZRBHpP+CeL9j9ojrI1cRgVVhePKsnFmGcwE0Q5nAIm61mBKJrJduoOir
 Bz7TXCXrm8an6w7wDv0vW/czVyc2xt78XItjnvmAKzRD5NjazQrLU130EhoN2XNWw8V+Vq/nYUx
 kWWAxkU7cyblgAAWdbHCY1zX3WHfvSeJWVu2Btrq8iNh/t2gL7KuHDU4mxBgJ6pTx/c4QY0HDY0
 2YMZyzHpNIoYv8NKo7EAfLnbmxeRIkaXn15IYNbuhITeB0ETOUSwkwFWtfsT/7NDNvkXWHwreLA
 gcOT3or5vZgHr46Jtt4nROnHvxFNjoefKTHjDKdobXo500bBUlhH9x0kgxSUg1WYl0hOrbzpvq8
 qPTur7BIUntJJjltPjUw3KeoawYg7Qs33WI9lyUroG+zDz3HcGSZuy99WIz6xY4P0qGLYo3oFVs
 ZoG6Ros3sf+yOfyIbATxs5rBNtcRuH7tZ5KHv9vkOw1ew=
X-Google-Smtp-Source: AGHT+IGW7vqGhnc32I0Hvi6ZMqV8kemWcyz0ay9PLO7I7j3Jy5wubYCgZ12VZOnfsmtjMwQ8zfCklQ==
X-Received: by 2002:a05:600c:a087:b0:477:58:7cf4 with SMTP id
 5b1f17b1804b1-4771e16e3a3mr28569825e9.4.1761745772558; 
 Wed, 29 Oct 2025 06:49:32 -0700 (PDT)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47718427409sm45422115e9.1.2025.10.29.06.49.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Oct 2025 06:49:31 -0700 (PDT)
Message-ID: <fbdafda9-642d-4010-a9c4-881189065ea0@linaro.org>
Date: Wed, 29 Oct 2025 14:49:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 26/35] audio: rename AudioState -> AudioBackend
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
 <20251027151045.2863176-27-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251027151045.2863176-27-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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
> Naming is hard. But in general in QEMU, a host "backend" is the term
> used to fullfill the request made by the device or frontend.
> 
> AudioBackend will become an abstract base class in a follow-up series.
> 
> Currently the frontend is QEMUSoundCard, we are going to drop that next.
> 
> Note that "audiodev" is the corresponding QAPI type name (or configuration).
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   audio/audio.h                    | 16 +++---
>   audio/audio_int.h                | 20 +++----
>   audio/audio_template.h           | 20 +++----
>   ui/vnc.h                         |  2 +-
>   audio/alsaaudio.c                |  2 +-
>   audio/audio-hmp-cmds.c           |  2 +-
>   audio/audio.c                    | 90 ++++++++++++++++----------------
>   audio/dbusaudio.c                |  8 +--
>   audio/ossaudio.c                 |  4 +-
>   audio/wavcapture.c               |  2 +-
>   hw/audio/pcspk.c                 |  2 +-
>   hw/core/machine.c                |  2 +-
>   hw/core/qdev-properties-system.c |  6 +--
>   ui/dbus.c                        |  8 +--
>   ui/vnc.c                         | 10 ++--
>   15 files changed, 97 insertions(+), 97 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


