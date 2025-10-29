Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65F98CCF9EB
	for <qemu-arm@archiver.kernel.org>; Wed, 29 Oct 2025 21:45:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vEDyO-0007hf-N7; Wed, 29 Oct 2025 17:44:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vEDyN-0007e4-3h
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 17:44:51 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vEDyE-00061u-TK
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 17:44:50 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-4298a028de6so1020580f8f.0
 for <qemu-arm@nongnu.org>; Wed, 29 Oct 2025 14:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761774274; x=1762379074; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UDdG9vRzLSWqPzQtLxCE0sbsDd3SWye7KKaKxVt/EIY=;
 b=GI/Ie3MLm+q5Ls5dzP2GpmsWnQgVAZ/NF8uAcs6xDnGwuzFgCWytMq5D29z+GGHkAe
 it8Oe5yG0mnBLvNSeY6rVjDepOzK/hT2iHm7A+U0t7DCaU+0jKyuqEJtMBKeBjhEQUP6
 A5KuSYhKCHDzL33F+8pJk2xjKdjV7LC9ybRAYbH7bkldqvhQFmFCM0L1EaVmm0ey4t4R
 OiyvzflgbwI1sB8ltSsQhXCQ7Yzj5w7mRvUoeAoo7lf+rKfyQESUeeo5zVEjhsRlOoNS
 PTujxUPuUEVrjLcSpejJg01uxkw4fSZlQN2O6u6og1VK9ZGHYlZpII1wUdw9IWrmUoph
 2Iiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761774274; x=1762379074;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UDdG9vRzLSWqPzQtLxCE0sbsDd3SWye7KKaKxVt/EIY=;
 b=tGNKfRo+z+dDanaBj04ADKhn/RixiEYLO1BBdskAJwHHC6engGq3LJqU5PccLtV+8q
 0x/2V13XzPAVD7lQhQ34sSbzF+K9kS2LQFEUtfRRbGnsKnoebAXZARkq8UxOIaVt3vmp
 GkVl0WuTmz/Hqk0eFYrGohG2mCiG1a+U1lFsAYbluibQqgYnJjqOEn9pdcXeBqrMePMM
 I5BorMUyuV622S3ZeK1mf65msMcSD8tQH3QHk0I1TAjvgbjxveZEbfEzJWAK0QRLMnDd
 r97ZEp34tpze0ZxgGtNcU4fKF4rWy29O09HFaNztUb1ePJ+RvWqwhg7yzsqGZfmH1UID
 dRAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjnZvTBIsrZzg+BrCnpw2IgdlKIMlz2g9jZ749Q7M5MaIQyd4aYlH05HB79B563Fyd8qnA3TRdJA==@nongnu.org
X-Gm-Message-State: AOJu0YzRPQmypLVa6CYrij1XtoPBBcmY8VqCT8BGVPPUs/aej81Soz1u
 CV/3VWe34a1N/nXz9w9G15of9io1DE7De5S2b/vcq8p8GG2lJjkxGAQBOSkj6ZW4G18=
X-Gm-Gg: ASbGnctUal9YUxcPFcmTaHsJwJTksyi1e85AXEMDXV0/FA+PcFfMYxZHvidZNETw8xp
 DBR9EzrZ1/OQpEmxyD4dHilRYZVZKmS5OkV78kekxjXUxeLg33lRCp2m5EZTBhsWMmMCHUNejrx
 l6tUFxhZCwhBz6APTcvJ1yySUo7pAEh303uPh3iEH/5+6Ar4og/5pg/uqHKSq7oEZCd8uA7UTpi
 OqesNchrN0l7ranoMnwLr2K6nW1cinD6eImcHhFqJjGEKQ7dadmBM3/GjqxBGrWxRSj/nyrAlQb
 55CKz7sAydPn1Tt+W7yRuNcb0Zm/9lcy1Ocjjlcw7BsOP19wVbuECmnOT8e7767STQMOOuACcRz
 VVBGIZSsXp9b5XNl3/uo6mWAmq6vCFnyhdGhaZkuYXEf09Ug92Bbw4odfPTrQ+hbm8dUqPgAJ48
 yKe00D44SOL/onZZ3GRRoAZKS247SkYUNEW41297CaABg=
X-Google-Smtp-Source: AGHT+IHCMOL5lEG7uVAhkjuhUltsY7VIM/l4EQgPJmPm+DxoYytMBjptZof5/wUmnR0MYpjGe6K8rA==
X-Received: by 2002:a05:6000:430c:b0:425:86da:325f with SMTP id
 ffacd0b85a97d-429b4c5303emr1081859f8f.27.1761774273691; 
 Wed, 29 Oct 2025 14:44:33 -0700 (PDT)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952db99asm28493969f8f.32.2025.10.29.14.44.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Oct 2025 14:44:33 -0700 (PDT)
Message-ID: <6ba24ce8-239a-452f-b051-cffb86f1a1b6@linaro.org>
Date: Wed, 29 Oct 2025 22:44:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/35] hw/audio/virtio-snd-pci: remove custom model
 callback
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
 <20251027151045.2863176-6-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251027151045.2863176-6-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
> virtio-snd can rely on the default code to instantiate the device and
> set the audiodev.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   hw/audio/virtio-snd-pci.c | 16 +---------------
>   1 file changed, 1 insertion(+), 15 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


