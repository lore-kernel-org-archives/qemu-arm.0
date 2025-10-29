Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6FD0CCF9EE
	for <qemu-arm@archiver.kernel.org>; Wed, 29 Oct 2025 13:44:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vE6TB-0004t7-Vh; Wed, 29 Oct 2025 09:44:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vE6T9-0004sy-TT
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 09:44:08 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vE6T5-0002cu-Rd
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 09:44:07 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-475d9de970eso39562665e9.1
 for <qemu-arm@nongnu.org>; Wed, 29 Oct 2025 06:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761745439; x=1762350239; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NRsBYX/oBXvjLSY1VvIVbRjPQWhxL4pD655V5k10NYk=;
 b=YgPSn8TMh2v++1niEoeXBeTxQVNh+aM3lfkvOPEfElUN+AWdgLlwCoVICYLc+TJGd5
 ttHlNvLMZXmqpzJRzlBVbf7EyUJn+MOrGc+dr1FWqC/gxV0M0Xy4jpwt1XCn0aLL4f+g
 nUOp9xLn+UC4NMk5NXuUK2S4E8LrxW7nE8lIq3nuHjVieRnevSqzCSL4fJx7wdcJXGCi
 nhyKs6qxofVLXaCkQYzt/BP0uvgghBkialz65A93o3pQFJsS3IVEZa+mH5Exg/5wGfjN
 0IZkJTR9Ws32CHIZfc8kX9u2Sbn9LzWGQSJ7lYSHv6RuvVvYncWu2G+Iw9ZBHLapr8k/
 r4yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761745439; x=1762350239;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NRsBYX/oBXvjLSY1VvIVbRjPQWhxL4pD655V5k10NYk=;
 b=XZmS3MIcIkTdTBE8257DnWwXjAk/niNbp4Ou4hNSI/qoB4KCGa/F5osg+4cX2Ayq6T
 plUDqzIRKyivzCkxMklKCBQocntAU749xlQNMN0e7pgczxJCsti07Zch4iRD/bR2OVxC
 IbjpmuzTB2RzmQgrxRMZ2mq3cY/iQYD54kHJ932vmD6hlUZUEjUBhQpx87Y+KjqHcGmy
 wHHiFIeE7QHmZS8Yit/v92M0bbKIdMFMZVkHISftDlI4YddKYIVDJ4jESuziGBOqqoih
 2eciuXqJfgbe96aDyFy+q4JzRi6XKpRpah1HpOl7TG9WXwD1t5gX1mmob7sXOU7xmKzv
 MLPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0+IXgvMI19p0s4xbcMWrrgFC9oDFkFQhq8uh3gkPmsndwqjNiC7z+s5C2esMp7Rsp9bhqZNbDEQ==@nongnu.org
X-Gm-Message-State: AOJu0YxA7OxPzbwy4dPKQIoLNzn7+VLxTlAqV9b4q/m5ZN1vMuOnn1BL
 Mx/soXCbO2zmK6I9jmpbTZyyFNsTWiMRsJD8XNxVRI8rB2VJ5Ksaco7y2QJSNSMdq5s=
X-Gm-Gg: ASbGncuh/uDQXau9dw6D1M8B0EsEROEGk/ufGcz8Q8FGxneCSbsG44EfKZm7EF5XY+e
 Y0iU99HDQvyDKJEUhaxCVYqzB6QG4uLAJYoYNyjhp+HwXQKJktEiJ64tiPeN0ndT9NcyELPt9Hg
 l+QrU4wDGnq/e7ovXs7s+s5ioKTHwamUPPdUhDByZSLn+SdEmOwDoL6IOGKuY71kKoVnKqodfnK
 8sYvc7ufDfsyWJM+d/UAEIr/av+oHn2pCEP/n79VWEzTI+zR7yl5f+NXeIVouJnKZN6Z73BtLnB
 hLFCdagSywoH8sKUcfx4XRCyuz8XJHa7MeU4j2dCjGP7CnLS+FFt1viHO4Le/fOQe+tg8GsZw3F
 pZgGLKMl+97OGCVv4wntchQE1PiL8PujO9LVGz183mGVor43Wih/lO8FStXADCHvQnufY9QrYEu
 6CKei2m15YHo2MMrLAdSHJ50tGFqnDyz2WJQQYO1ZUF9M=
X-Google-Smtp-Source: AGHT+IGOKoA5My+C4OxMpueyTXWYVLkbKoWaifxcGMwvkEqS8t1wbxSmLmY0LIGL7f6bwcXyDQFs7A==
X-Received: by 2002:a05:600c:1e28:b0:475:db8f:ae0e with SMTP id
 5b1f17b1804b1-4771e17412fmr32288965e9.2.1761745438761; 
 Wed, 29 Oct 2025 06:43:58 -0700 (PDT)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4771e222ca5sm52365755e9.15.2025.10.29.06.43.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Oct 2025 06:43:58 -0700 (PDT)
Message-ID: <d7e77944-06a9-4b7c-8475-0e943a251690@linaro.org>
Date: Wed, 29 Oct 2025 14:43:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/35] audio/dsound: report init error via **errp
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
 <20251027151045.2863176-15-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251027151045.2863176-15-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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
> Whenever NULL is returned, errp should be set.
> 
> Inline SetCooperativeLevel call to simplify code.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   audio/dsoundaudio.c | 182 +++++++++++++++++++-------------------------
>   1 file changed, 79 insertions(+), 103 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


