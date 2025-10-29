Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23E30CCF9E9
	for <qemu-arm@archiver.kernel.org>; Wed, 29 Oct 2025 13:49:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vE6Y3-0007ns-7F; Wed, 29 Oct 2025 09:49:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vE6XV-0007eU-Nz
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 09:48:44 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vE6XG-0003Zq-Sa
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 09:48:33 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4770c34ca8eso33722545e9.0
 for <qemu-arm@nongnu.org>; Wed, 29 Oct 2025 06:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761745697; x=1762350497; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=c1qQvbqi4yBxcPcwn4iVcr8K3QLP8jEh1kZNbm4KrPQ=;
 b=Nifd+fhdhxIqnyfYDT3hCwwT1tkekHjaG+74xjVk6L9KVQApQ8p8mnWYlwLeeT1BMM
 MBixYTCc3SpOnoI4H4Dn5GZkiUPfpSVXhVxfRa/gjzyJJU7ATUoIebu+ZJSi1uNyZSqj
 L1nsu9o1ryTt8Z28/MJZ+qiAXtfw82fMNrFRoFEy/1NqdQOYfuthX7xZlIDrhJTsoObc
 45cF2p3CuD5HBK2efrNTKNDEWxQq6zdaCPGVzuTsg7zXOsJ12FAaFwSOoF2PhnEQXpSk
 u4UOr7XB7XW0ol3A4prYyE7OoU+dxAKBQaGKrms7X95V/DBWmIwy0WZXNrUdPyYc/Yyz
 13Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761745697; x=1762350497;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=c1qQvbqi4yBxcPcwn4iVcr8K3QLP8jEh1kZNbm4KrPQ=;
 b=LwoHeXJ8bFZ8QEtj0Ci0h4Gni8uE5DmwwScfizz5CGsVvlQ/iYDeP5nHt/4yd9G+9M
 o0ieWe3Ggbzb1P+diGK0ELTA11wtwKYX58OipNPN5BFZn3Z4Azht9CR9sqYMkFEp/yg9
 h1qtp50yQNSy2FEkVQGn0qelHscuVJVbtLnunzfgsuQdX8O48offncEUp8L9SL3oszmQ
 HXjbEt7HdkYMMG93kHXv7lXDloVnL51la+H+xxGHHEasmmURplBUnHJ6R+URwuvi3QMW
 x8xyJ6i+3sPVsITuhLwNwKnXrKNvnxat6DUJ1Ne05ML+sgjAYBMUVNT3m0gjVItmXdAL
 hf/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGUKtzgIRq2VVxKujqtF6PH3/Zdly7w9aMXBwUjMu5cIVmw8NGOdXE2SJd/Si2v4bSOyVWxuMMUA==@nongnu.org
X-Gm-Message-State: AOJu0Ywn9FYN7qskRhOrBrfjI0972CnBcskuxNTMI9eGypToeldtEiRW
 M9sOAxxU01+A523zbywgQSLrAAxl1GaRyHpYUsIQKudfVHKbuV1Adheot8rZJjOjazg=
X-Gm-Gg: ASbGncsBsDbWUc9oZ2O+y4UX95qWGA6rjQs8SPlKlKYjyM5bJd/xfe7jJ/l4COLLZ7Z
 GFDtfGxKJwimTgso7BN4HT6Kr8/N3JDPzC7/yoU62gZ7jLdmjIouAYbG6SYO0HMRo+oi9xBYPIN
 IBpoJL8FHuxqzX/YnDzU5qyAmlXxZfQi7+1wrU+DuZhuOh8z/m1m2kEEnqaLxEROBUJyUrjhsAX
 d0DBkHhjbmR3rjSmInr7tXjdPF0cOOQNeFA9YL3cBiLfabFhybLdzEbQqBRAWIIEPqoFeeVdawv
 ZDSaKMShU6BKygZ4uwr7gmIJ89UbtMfSN+K5qh91ysnawyANgLhN1QnoUVowA0hUNelUhrv9wBu
 TdsB0LUDsIHXGsG2mKlsGug9OZePStLtMRMj4D1Wd6h7YEER6H3LMVNnBcA8VisiL4EnnOivOxI
 bpoPEDVgXLXddw1M7ZYfYUAECUMcN8OX2fyVnHqHGPn0M9O+Q+ddttrA==
X-Google-Smtp-Source: AGHT+IHbgr0INbXg6avQXJ3yz2hy02sD0qNDWaG3WATmfNqpeCTn4IE1Ha92zFGz3/IV2Xd7qcbGEQ==
X-Received: by 2002:a05:600c:6207:b0:45d:f83b:96aa with SMTP id
 5b1f17b1804b1-477208d1be0mr21824675e9.7.1761745697226; 
 Wed, 29 Oct 2025 06:48:17 -0700 (PDT)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952b7b6fsm26617361f8f.1.2025.10.29.06.48.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Oct 2025 06:48:16 -0700 (PDT)
Message-ID: <ffab95ce-9b5d-43ea-93a7-611de6044ad8@linaro.org>
Date: Wed, 29 Oct 2025 14:48:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 19/35] audio: register and unregister vmstate with
 AudioState
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
 <20251027151045.2863176-20-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251027151045.2863176-20-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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
> Proper lifecycle management with QOM state.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   audio/audio.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/audio/audio.c b/audio/audio.c
> index 4c3c3fd52f..853930bb48 100644
> --- a/audio/audio.c
> +++ b/audio/audio.c
> @@ -1614,6 +1614,8 @@ static void audio_vm_change_state_handler (void *opaque, bool running,
>       audio_reset_timer (s);
>   }
>   
> +static const VMStateDescription vmstate_audio;
> +
>   static void audio_state_init(Object *obj)
>   {
>       AudioState *s = AUDIO_STATE(obj);
> @@ -1625,6 +1627,8 @@ static void audio_state_init(Object *obj)
>   
>       s->vmse = qemu_add_vm_change_state_handler(audio_vm_change_state_handler, s);
>       assert(s->vmse != NULL);
> +
> +    vmstate_register_any(NULL, &vmstate_audio, s);

Please avoid legacy APIs:

/**
  * vmstate_register_any() - legacy function to register state
  * serialisation description and let the function choose the id
  *
  * New code shouldn't be using this function as QOM-ified devices have
  * dc->vmsd to store the serialisation description.
  *
  * Returns: 0 on success, -1 on failure
  */


