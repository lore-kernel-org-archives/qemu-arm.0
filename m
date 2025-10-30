Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5508CCF9F8
	for <qemu-arm@archiver.kernel.org>; Thu, 30 Oct 2025 16:40:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vEVhB-0007RT-M6; Thu, 30 Oct 2025 12:40:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vEVh8-0007PQ-Nv
 for qemu-arm@nongnu.org; Thu, 30 Oct 2025 12:40:15 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vEVgz-000329-Eg
 for qemu-arm@nongnu.org; Thu, 30 Oct 2025 12:40:13 -0400
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-63c09141cabso2070410a12.0
 for <qemu-arm@nongnu.org>; Thu, 30 Oct 2025 09:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761842399; x=1762447199; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EwLZaMQ2xkYLb8CZxVsf81o4GwM6pprJR6dDncgMZCI=;
 b=P0TwnlSySemosWYjNblTGF3shklD/VNPMz15ipuTIexShTtqYoSPy+EYRS3cojNqaP
 RWW8FSbV1ZljJDY3Yh58nKlSWJp7sZTx5RiRI/ijmo7hcmAO+Rf8ZeuIkINlc88UWWuJ
 rY/Hm6pMPM/0FN4ug9WPOUegpM7C1bP0d95wSFbAqvXOodMsqk6MrlPXlmnduKHHQi6W
 CeArGKweGLPO3fe3J4lg9XXzBVplZJyvd9AdAi0EwmwNJm/q2pBRJ/MGgw1UEQQM2q0k
 Alp0Y9ncX+Q7W7DxXlp5p+rXNeD2Qmy8irQsV5zO2p+9dN0yPCvowp2cYmknT+359mNJ
 q8qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761842399; x=1762447199;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EwLZaMQ2xkYLb8CZxVsf81o4GwM6pprJR6dDncgMZCI=;
 b=cz/OUBogeAGJuTaeJ8CqkiY7uA5YhE1Bzm5WU0VUBLVqdvyKU1udJwri+COUPWFaMg
 3VT6G8Fbpbfcfr+mDbBaGUCtCgz7Sr24l/YCoI0mc/o2Am8mCUZMceHqJJ69KA+7nt7B
 S6koSgDVdapu6VRRPwfMZKY8M6iyCnKKiaryzSPDox5GWrFvCPJtcMCNHR+pNb/vSd+h
 xwa5Yntmq54SlL5D+ELlUYh+C5ghwV4udeZbpDnK6XzSZ+WSYcASvuOPpsmmSBaNmI5v
 tXFTuEbw+7g9j3jN5HHkh5e8SP/XEi+5xps/g+FfpLUGQ2ZiPJy2cOS3vvAsF/qXgKi9
 sqPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9LHnlrT9zFhJXr73GvnX9j5udfVWfvYFlh5fAwEJ2zt21JELBxL9hjegl7n8K3KkSSGw1Bb3lFw==@nongnu.org
X-Gm-Message-State: AOJu0YwFCbGzJdRQ2blfSzPZG3iRypcK1b3YkwAq6ydxKvuljwcLjSK7
 hPosK1R/3vo9fx6pr3NALTWJuCPZxkApLaEYQrOGiXobmkza4sxbMLbCPsFDwMrJP/I=
X-Gm-Gg: ASbGncsHhOfab/XHZHdSZ1NLnAtls9NXNEcUwigW8W5khLL02bDc5kFQevsOxS7Ssoi
 eStBtLwcOStNc1vWg4FxGfES6eqi6waWvqynERCoG6eHCb0t6xnbqEWXi1Qoni9j7O7tvXpq3Pl
 vOdYDkXOscT0ADM2G0Coe91PjXYu1cYpLwBJw8ICrvfeBgWKY6kW/JcIug9oEcUexOog6sEqM8h
 +jsjXujUornFslMKso2zWvxBT7Ta1HkSO+PQF7/+efxliwyn5pNy8D79zIpha/MMLNrdfDeSlsb
 delWtIfkfEbqrru91V/WwQhsJ2LnhH7ueYDgGOX61zLQmyBqP3pSOk8Xt2SuXMMb9WnUQOsVVTA
 8z7t35umcB1oRY0exOFdJHgvYZenMUJufI5LPOHncNojd0A7D0OpF6SciHfz02g1RxSJomezfnU
 LFxGXo0Tl4KWhW5fY24zVFOi6pRYJ1IEv6OI1W7SxsWQ==
X-Google-Smtp-Source: AGHT+IGgyheceNatEFPKSZgnNYvP+OIpOEbIJH7SFWR4ihk3foSYIZgt79Ewlk923QElIXMO0Xuivg==
X-Received: by 2002:a17:907:2d87:b0:b32:2b60:f13 with SMTP id
 a640c23a62f3a-b7070834a6fmr11532766b.54.1761842399399; 
 Thu, 30 Oct 2025 09:39:59 -0700 (PDT)
Received: from [10.180.230.213] (183.105.204.77.rev.sfr.net. [77.204.105.183])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d85353ff7sm1796403466b.22.2025.10.30.09.39.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Oct 2025 09:39:58 -0700 (PDT)
Message-ID: <39eac421-7ced-4d48-ad59-e615bed8e31a@linaro.org>
Date: Thu, 30 Oct 2025 17:39:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 29/35] audio: move audio.h under include/qemu/
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
 <20251027151045.2863176-30-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251027151045.2863176-30-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Reviewed-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
> ---
>   MAINTAINERS                                         | 1 +
>   audio/audio_int.h                                   | 2 +-
>   hw/audio/lm4549.h                                   | 2 +-
>   include/hw/audio/asc.h                              | 2 +-
>   include/hw/audio/virtio-snd.h                       | 2 +-
>   include/hw/display/xlnx_dp.h                        | 2 +-
>   include/hw/isa/vt82c686.h                           | 2 +-
>   {audio => include/qemu}/audio.h                     | 0
>   include/system/replay.h                             | 2 +-
>   ui/vnc.h                                            | 2 +-
>   audio/alsaaudio.c                                   | 2 +-
>   audio/audio.c                                       | 2 +-
>   audio/audio_win_int.c                               | 2 +-
>   audio/dbusaudio.c                                   | 2 +-
>   audio/dsoundaudio.c                                 | 2 +-
>   audio/jackaudio.c                                   | 2 +-
>   audio/mixeng.c                                      | 2 +-
>   audio/noaudio.c                                     | 2 +-
>   audio/ossaudio.c                                    | 2 +-
>   audio/paaudio.c                                     | 2 +-
>   audio/pwaudio.c                                     | 2 +-
>   audio/sdlaudio.c                                    | 2 +-
>   audio/sndioaudio.c                                  | 2 +-
>   audio/spiceaudio.c                                  | 2 +-
>   audio/wavaudio.c                                    | 2 +-
>   hw/arm/integratorcp.c                               | 2 +-
>   hw/arm/musicpal.c                                   | 2 +-
>   hw/arm/realview.c                                   | 2 +-
>   hw/arm/versatilepb.c                                | 2 +-
>   hw/arm/vexpress.c                                   | 2 +-
>   hw/arm/xlnx-zcu102.c                                | 2 +-
>   hw/audio/ac97.c                                     | 2 +-
>   hw/audio/adlib.c                                    | 2 +-
>   hw/audio/asc.c                                      | 2 +-
>   hw/audio/cs4231a.c                                  | 2 +-
>   hw/audio/es1370.c                                   | 2 +-
>   hw/audio/gus.c                                      | 2 +-
>   hw/audio/hda-codec.c                                | 2 +-
>   hw/audio/lm4549.c                                   | 2 +-
>   hw/audio/marvell_88w8618.c                          | 2 +-
>   hw/audio/pcspk.c                                    | 2 +-
>   hw/audio/sb16.c                                     | 2 +-
>   hw/audio/wm8750.c                                   | 2 +-
>   hw/core/machine.c                                   | 2 +-
>   hw/core/qdev-properties-system.c                    | 2 +-
>   hw/ppc/prep.c                                       | 2 +-
>   hw/usb/dev-audio.c                                  | 2 +-
>   replay/replay-audio.c                               | 2 +-
>   system/runstate.c                                   | 2 +-
>   system/vl.c                                         | 2 +-

Alternatively "system/audio.h". Regardless,

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

>   ui/dbus.c                                           | 3 +--
>   audio/coreaudio.m                                   | 2 +-
>   scripts/codeconverter/codeconverter/test_regexps.py | 2 +-
>   53 files changed, 52 insertions(+), 52 deletions(-)
>   rename {audio => include/qemu}/audio.h (100%)


