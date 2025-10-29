Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C32F5CCF9EB
	for <qemu-arm@archiver.kernel.org>; Wed, 29 Oct 2025 21:54:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vEE76-0007wq-Gp; Wed, 29 Oct 2025 17:53:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vEE75-0007qw-Bt
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 17:53:51 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vEE6p-0007uM-P0
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 17:53:50 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-475dc6029b6so3634125e9.0
 for <qemu-arm@nongnu.org>; Wed, 29 Oct 2025 14:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761774809; x=1762379609; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WES+Ny/Ud3VzQoIwxHp4O8mqJxD7akPdqbRdRNtliZ8=;
 b=O+FguzARQO3i2gKqFnqudW68wyar1c/LsEJxBkF4OTxu5pGlqum0jv2ZPpFS85Ikjl
 lacIw4WNLfi5/Ax6KKXScF/Vy8yzoLG17b+kZpnaaymXkDmLOuXZmgu6D/YPsX4dtz0s
 SHqF0gjxRZT8gge3QbfRVx1gmyesKRjE7JIDU33gsySkpXg/NjQI6GeATEXvS1ifxGrx
 1/0HI9Ds6B8jm39r2DkIIqQh5PjcMUuiVLrk6fQgiEcQxz9PODo0XBv068Z53VbHNZCc
 bXQQl58NMa2Us0WgBdP81T1unMDzpjRLwjDPhnNmv5EnokOL/+RqWUlnAMEmr6SPlY7y
 W1gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761774809; x=1762379609;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WES+Ny/Ud3VzQoIwxHp4O8mqJxD7akPdqbRdRNtliZ8=;
 b=WJgyh6c/dVUSKFSn2kOVP5Ky693+Zk1SLFAoyFiNIyB9mFQ0SOzNtWdQ8DvOxSw+EN
 FFl9DK7ICMLkecyV2FTqEHRCyTAb1z+4VgDal+iR0lztHXX4XjhHeWEv/tdaGFBg1vth
 dTcSm5WPq7mWUcDf5rPR70cIg61mncCsuYP0wBLwpAnZhxP8zZI65EKO8+HcQDxZ0duu
 HI0J6Dk6stiz/d+kLL2JStex1YfHsG2jOYqJr5gdrqLi56lGDPI9w74RCHJMO3V7Ffwp
 Ylx4V5dzjwOfvSsaMxrhc3kCOux1xalaeg1dIMvH7c+BuwlLOMNgyzC9PSnAGyvmhEXK
 MPKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnd6x7XH7hwRBi1NXt1+hj0wXyMBY8bx4/isIC9YmAaMcDTH5wPUGof/ft1PdUA+r7egXM/T9jmQ==@nongnu.org
X-Gm-Message-State: AOJu0YxZuc0wyPLclo/bdKVfr3o0YDjUswLYLnE0wjNCzG3e4XvQHF9n
 eBrFigD/L24PO9awQGUq8rLXI5A8LrwzcetJzaNBIWqzf2DfjcETXjlBeQ1PBTFAP2k=
X-Gm-Gg: ASbGnctkM52w402IhFMhDc0hfXTRD0Nu7DmUcJCVYobPOdU4FYDz+kdrccmwQXQWGjS
 jrIvz1B2yTKVJlHY9RfMsAXSPYGQfw5e34ifHBLsaAKYo8cDxBq3Bo7uoIZYuLBq/VSwcLixPO1
 Pjqorar9RxIjwZMg8m7TU8HVGTgQhvHSim5Pd4gepUavkJlGWN7bKDMGcVlB0AaYHBUivmmHz7s
 ct1wB5tRANZMgSxc20hVHIuSBt7Z0gYIvyM2mWnX2F+Cyp7+9MnOxW57TM5g/TohwfGc7wxYUvW
 /26tgzzfOGZYvfvD/kJzZaLpujE84PzY33NOgZKSQVWqBnvelREIgPj+4xjLb8rdb1xGUGEQRD9
 mUC0wX6NPZqwRDd3M5oUf8wgx9WdoCpRDKDMHkIBkAH+Q+ovVWf9LhQ+LfxtM23aaDSsFKPOHko
 hiQpTw/oyMTr/5pAjGkaIsKxqFepSjBOBiS0KS57f83z0=
X-Google-Smtp-Source: AGHT+IGcR4bC/xf/lphkVM8QuDJxmg24Ru8600hRUtjOHSapqItFKzUwH9vxElpQuYEGo8n3sW+1hw==
X-Received: by 2002:a05:600c:5488:b0:477:10c4:b4e with SMTP id
 5b1f17b1804b1-4771e1f59demr38937505e9.41.1761774809144; 
 Wed, 29 Oct 2025 14:53:29 -0700 (PDT)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47726396832sm5873175e9.1.2025.10.29.14.53.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Oct 2025 14:53:28 -0700 (PDT)
Message-ID: <6a095121-ed37-4d51-8115-f436d2d95028@linaro.org>
Date: Wed, 29 Oct 2025 22:53:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 23/35] audio: introduce AUD_set_volume_{in,out}_lr()
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
 <20251027151045.2863176-24-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251027151045.2863176-24-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
> There are 2 sets of functions since the introduction of multi-channel
> Volume structure: AUD_set_volume_{in,out} and audio_set_volume_{in,out}.
> 
> Use the AUD_ prefix for consistency with other audio.c functions. Rename
> the stereo function with "_lr" suffix.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   audio/audio.h         | 21 ++++++++++++++++-----
>   audio/audio.c         | 16 ++--------------
>   hw/audio/ac97.c       |  4 ++--
>   hw/audio/asc.c        |  2 +-
>   hw/audio/hda-codec.c  |  4 ++--
>   hw/audio/lm4549.c     |  2 +-
>   hw/audio/via-ac97.c   |  2 +-
>   hw/audio/virtio-snd.c |  4 ++--
>   hw/audio/wm8750.c     | 12 ++++++------
>   hw/display/xlnx_dp.c  |  2 +-
>   hw/usb/dev-audio.c    |  4 ++--
>   11 files changed, 36 insertions(+), 37 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


