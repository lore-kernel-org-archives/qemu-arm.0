Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1231ACCF9EB
	for <qemu-arm@archiver.kernel.org>; Wed, 29 Oct 2025 13:41:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vE6Pv-0003Kh-9d; Wed, 29 Oct 2025 09:40:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vE6Pt-0003Iu-LV
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 09:40:45 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vE6Pe-00029z-Ku
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 09:40:45 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-4283be7df63so3565141f8f.1
 for <qemu-arm@nongnu.org>; Wed, 29 Oct 2025 06:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761745224; x=1762350024; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2rIOv0MNcMBqR3sa6je2kdt9WMKqEsPnfpCTJTNjr2c=;
 b=C/lhhQ3noKkcvjvd/mmofIACf/tLqE4xVPGftWWFIDKA86zyRMBA0WdUyMDHqnDPJP
 AIoy6RAG9zIXZRvJoZxOeqEWq0wJnD3Lor9IcDVAnk66z4n8PwsK506GLxKVh0JpinnM
 LcGKLmh6t+lnyoR6Q2SlF6Q4dd8yAIrpB8o06bdDOQRoaRCkhlnPv846PjOw+Dw52EDf
 rA7cmwOYF3yY9k8RDmZoMV6YSBkWAXy0SzVbT4JPV1pnjnSjhLnUAU/a7LocDAept+Yp
 YJl6+flY5NnH4TFQg3CuPFDLaN9dSLEEt6Z0Q2ZAPKIzmw/biYMVtrh5REyjbU0CArpm
 XcRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761745224; x=1762350024;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2rIOv0MNcMBqR3sa6je2kdt9WMKqEsPnfpCTJTNjr2c=;
 b=OvFmRIaKSppDIjFhkG45IDO8CHpuvEzAOeofhr4Q2fwQndNgKcxLhhLstG1UJBtHei
 A7vxDx+Dy6QOzj3OupjO+5EGCYC0OIwzRMkLcCVXMJMn8ciIFzQhkj6Q5XQ3uKZ4PxwS
 bEWsIj4mR5opvyUjCgbxLbIPLbW7iDF698O0oY5S0RnQtqs2vAxp92STgM1m/d/7ggFH
 xui7F9V/kKHFVrMIzM01de6ka+txoNhX0ADEDY/W3h5UxR5q/w2O/IbMuBvEp0Zz6cEW
 l9IdIiJQxKVoB31Wz1MG08ztmCXbD2MWiUwNsd08UyXdb9ldKqShwQZGlJ8R6mHjoKLC
 U29g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFrtXhQUUmKfXLSXRvjqTeTDiq7cao29UnAEWkLmuS5veflBoQoGQ/tR/oX6q6IM3M8Xk6Sfsogw==@nongnu.org
X-Gm-Message-State: AOJu0YwT+QSC96WEIIg6Dvv/XLtx5BTWAPz91UVKNZ+8y5AFKX9OqeiO
 JT6TGxtLx2Nrw12Tpk8bFhNHJ/SC2Wg75K5coJOxf2swNJFCzZezNSWeyFDBVsftMf8=
X-Gm-Gg: ASbGncsm4I7ossGYCX0lXu9RhTJ6prbz6DpX6MDyn7n8AnLrHWWuDHOT0VhfREC+KDA
 vpFEiOaxHlzWzJ7yS07Wy/hBTjEbb5NN4jKFfYvxYzBmzaiObSK9pSjJVA93cAwZhJtu5ZrBEPz
 KlHB/MNaCBRxaGPryiHdpyiZ92js5SytMq3n0VxqvEEeV/kQUaHvGG6jGTyhTpGS4Ve4Rr4wAKl
 BRUOg0YMJujA9hAjNDFKOyniQxILI3tLSr4aQFbVHR7MM6VpTM0jIN014nZnJLBDjnF2Vrt13qg
 n++vCDSFsrr+AFrTx6/N1VH7Gu28GVR7v07y956gpGmimKc24/cl3DpvDF2+Pa3XCRJdvp+OvGb
 dkZcUUIBO6ZwRGCrmlJHo9FWotzau4nUWE4sS46PwtIGid45uQWxGk55v5DZ7ORJvaurrTkLoLz
 utap7VnlD82VLZj2+KNVBoZTeQPB6BZWPIbd+bhRAD9Vs=
X-Google-Smtp-Source: AGHT+IHbZD4bhigiZ9keP/jpzmnyR1hTwly0W76qSUHYeI2NgIp7PlAHHfnEWfNvx9X3hfl2HA+LJA==
X-Received: by 2002:a05:6000:2281:b0:3eb:8395:e2e0 with SMTP id
 ffacd0b85a97d-429aefca8a9mr2467911f8f.51.1761745223886; 
 Wed, 29 Oct 2025 06:40:23 -0700 (PDT)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4771e3b7cb9sm58683485e9.15.2025.10.29.06.40.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Oct 2025 06:40:22 -0700 (PDT)
Message-ID: <1006abaa-39c5-4254-9b16-994208740bbd@linaro.org>
Date: Wed, 29 Oct 2025 14:40:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 17/35] audio: drop needless error message
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
 <20251027151045.2863176-18-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251027151045.2863176-18-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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

On 27/10/25 16:10, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> The only reason it would fail to add the handler is if it's calling a
> stub. But this cannot happen as audio is only supported with system qemu.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   audio/audio.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


