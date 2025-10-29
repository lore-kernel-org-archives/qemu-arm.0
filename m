Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A3DECCF9EB
	for <qemu-arm@archiver.kernel.org>; Wed, 29 Oct 2025 21:47:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vEE0V-00017h-Ej; Wed, 29 Oct 2025 17:47:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vEE0M-0000yj-LR
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 17:46:57 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vEE0A-0006Ti-9r
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 17:46:54 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-475dd559b0bso4229925e9.1
 for <qemu-arm@nongnu.org>; Wed, 29 Oct 2025 14:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761774388; x=1762379188; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/+DITEUqnNP7BCcatCMcmAtM/fKrxvvfAMRydrHbu1c=;
 b=AByWHUe6wOcsSAfdkgny6VrSkRinBerCloDlcuN5j692RFcRT6dcvgkezW7bk5HGTX
 b7q0j4dcB6Jxa2GlwlVhz/gKLflZu9NB4eZuVkLd3PABe7iIysSDjJz7NqU/6NZwMUON
 Owm9g/dWHXwatKPuMPe2cU3VwFnZi2RPz5dWRoj1puEI6BS9/HoRZE6o2jSRosK5AEDt
 k/4AvVJZLhmBSvFGDH9b/UoZS6bouxxhTRrCCer/aNf+eWjNZGe9+bkmmPcPE6tBjvsE
 bFClvAldWrjkQXydlRNjyKuw+U1o/bk/ki9A6KoMLwuLKGMzTo2gaDtyHHZLgdFzO9QG
 toFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761774388; x=1762379188;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/+DITEUqnNP7BCcatCMcmAtM/fKrxvvfAMRydrHbu1c=;
 b=TlgT/hFT/3KOHSUvoj7/ffkhLZSK+uhZCSWZKgvqm6JpHmyNi8q8SB1+V8dJ1Uzvz9
 VOrirvn8lcwtNWw9PvscQR/3u+tl7eGR+A95uMHQX9RR/W1hZds/Jp98YEU8qhi0raxz
 +Nz/TyPZsV8g/lcnMm05hl07Evb2/AZLjXWjFWaF2Emb9arqpZEV5dYgp+1iF9QLMbEK
 Dq63CX/1QqQsu2dBO9wQE3lNQZwOmyPx4HSdwwiv3TCnL5X4C6Z2sLslZzGSdJpDQk7q
 xOhvBKHqkC1/SRvLJk05xbhf+3bUQL6PoWtGiDWcGW7vG4UNw1I52HuDFRIhjZaNPC54
 QArQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0kMlAsB8Cx7fVNXhXDlROjnY9ODi6+TVP5QGNDcqdHkz6attg/rb79tIE3BuoFxhOqgNqEO2gGw==@nongnu.org
X-Gm-Message-State: AOJu0YzLv7XhbBTh6vjbufHHtK8girOEIPUVnF2/Ia2kER9sqhcPTlpE
 +ZODkkbD6xF3ug29WQHPVPXZAEWQ2zpT+wpJTtT7ffCl7dDtcz06gNhKHoZUgdTEzsQ=
X-Gm-Gg: ASbGncv79ThDCVczFidYfgdnKUBNkxqojZZnBUUAGiOZEbJOWPaEh+y5pnUnuGSOCsu
 KVNqXlCjQofxbXCas9S+P24PnU2bDP1PVKjuzXOM8ysn+cadYXKs9NgzmrVVUjhtu5zZdyvtRH3
 5odRYBtTIBRYufSKfpjdUKEf5E0Z8zWoEn71F5kqmg7JmYFRdqn8Pl7YuRndYxwMmOntG26/OS2
 G2irbi4pBboW8HQ3LBXz9quxzX1qfM9ocen0/2LfZ6rlhwqroJ9vJSVdG7bvg10nXOY19ygbZTi
 jhBwriQZuAZfblwoYILfGhH4ldMYWjeghrKd2lulchqwvyMgFMK+2ZfwUqSqfN/0wFNAfC5ldsX
 013hHi/EyAZ4xf64QL4AiNE7l0xVQhUTPCB2HyH37zoC4hOgGfYAqfz3Sih3lEAufAF2Avx5X2t
 0uEgHh+Y14mMZtPBr/lpyP4/efzLZhweJu2eWeY7Pvwlo=
X-Google-Smtp-Source: AGHT+IHghAnyYt/9CZ9HchAxLLZbVy0Zf7yKLjdqFlxRpok0ysIg8K6FaIQQYnMhsPdr3rD28MC//Q==
X-Received: by 2002:a05:600c:5197:b0:46e:2e93:589f with SMTP id
 5b1f17b1804b1-4771e17ef8cmr44273815e9.14.1761774388499; 
 Wed, 29 Oct 2025 14:46:28 -0700 (PDT)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4772899fdfbsm4351795e9.4.2025.10.29.14.46.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Oct 2025 14:46:27 -0700 (PDT)
Message-ID: <9777ac6c-2e36-460d-a4b7-a2d3b53a4482@linaro.org>
Date: Wed, 29 Oct 2025 22:46:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/35] hw/audio: simplify 'hda' audio init code
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
 <20251027151045.2863176-7-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251027151045.2863176-7-marcandre.lureau@redhat.com>
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
> For consistency, use only qdev_device_add() to instantiate the devices.
> We can't rely on automatic bus lookup for the "hda-duplex" device though
> as it may end up on a different "intel-hda" bus...
> 
> This allows to make init() callback bus-agnostic next.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   hw/audio/intel-hda.c | 16 ++++++++++------
>   1 file changed, 10 insertions(+), 6 deletions(-)

Nice!

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


