Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9EC7CCF9EB
	for <qemu-arm@archiver.kernel.org>; Wed, 29 Oct 2025 21:48:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vEE0m-0001e5-KJ; Wed, 29 Oct 2025 17:47:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vEE0k-0001YK-RW
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 17:47:19 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vEE0Z-0006bH-3X
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 17:47:17 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3ece0e4c5faso307337f8f.1
 for <qemu-arm@nongnu.org>; Wed, 29 Oct 2025 14:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761774424; x=1762379224; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3wYJxEa4MZ/TU7q75zs/qLp2AT9/5lQ2YQ+0wpWl6Jk=;
 b=HR8a2QCPZME2Fix2OnsagVO/vmEJKL4DxyZf4cIE9cjucKipKdwiu9sBPCmC8mJhlp
 NyIS4ACZ8KE2FHs/a6/EYC8B+KQ7iDY+i4/k200bGuZHTHvsRFK841/btWTziB2Upaj6
 B25eaWNDBM0nDaWolX/476MlW+nkEN4Twy/6WG2gFksNVqkhVjrVjdwC178euzl8gNQW
 uPRN7492ZmqH7lhzWUANb8pXfUPa3tq3tFnyb8Z8Mba1Xet3WgWjoNQfnBmoc6W0Y9L5
 2sD7P9fITcn35u3TmUIt2QLYrOvQKbQY1hPPnQIGiY/rLJjAUX9xjocRvWohvHP/sDJD
 ZGyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761774424; x=1762379224;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3wYJxEa4MZ/TU7q75zs/qLp2AT9/5lQ2YQ+0wpWl6Jk=;
 b=iWdRSZ8kl3bdc4aM82FQDjtFHNEJYCJfJVEijjijU+MKuLKCFQoEIOT/yQvQrf2KPR
 /+njqeOaEfGMbwxx/ljDHauOR9uufibqF/cwFTmXtR1O+BLMOHwGyboBjHzcMn5gbtnu
 LBmVMY1Qj1zF7y1bOk/w0PSh01lm5RCda5yxv+DMsdD2sF087JbjwMurzUF/HSvwlD8v
 8XWPmc/iQXz6Dvl6H7zNtQcIpnQZqve4s+Gsu7POV8yDY1GDYKOgz/b+7E43XGNqHjlx
 0u1ibz3wpLLXArfhTjvXWdlsu+YJMw1a0+L532nzfR3jg7sTvTiOSCHhJIGQdn7OHSSc
 w4yg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxWPMe0RswB7ntbtEEnlu8TKdXyYIkiE/rdJlkg9IofRpJ+hP8q/xQg2LG7blLooWnEAHNn0311g==@nongnu.org
X-Gm-Message-State: AOJu0Yz4sA2dq6WuZ0S2RSAQG27Tvkoje/CnBg+EdKfTNxERIgcjeAGG
 VeUaI3CXn61cD0MgDMkSJwYYW0eJhpQ/IGowUHK9+gJ1asbpP7A+DHsEoRcggeQnDWQ=
X-Gm-Gg: ASbGnctC1bSOJPs5aalJrBt/5hFXmQptSTQulD+TsSYVSG6BaNQdR0mm7MaVYg0yZNN
 DcOEseqLCm73bZxVjf2/jI8E/d1AY+/u8QNvnEQnX4EpjdCyOAe6o5QBTDipsEn8IvC8FoWutD+
 q11HGHbFOITk+md9ezY0F1gmMZPqRVH7asUEFHbVF17K43nCa8aKLf1mXD0MymR4avicXN7dQ/5
 wkoCi/jpgJI0vuTgznm+TTZ1LUCzZe8klZlWCgjD/PR9uyVvuizvhjtXti+IVRc537RXI/4/cJa
 DbLF60I7uNV1p4JS5P05GCrUQbEyNy185C81OVN6Dl/fdiKz5Y7KOVmfF1vVFyGgqKS9d2NxwRk
 lfWcx+zGtEEmH+Qb6yMac2G4FSeYpAONXgt7xCvYjNf9fpVYueBn83F/toMX4nBHA5xxjZ6bFE1
 wW6sToDnjhqqoFlxhnSoMSTcw34qw38lp3KEC1i4DGL14=
X-Google-Smtp-Source: AGHT+IFTxecFV5eDlq1jL1LfjAaOyexzMsGWCxBfAmZ1x6ky0uIs8E+Z6Kbb0IqYUe/12zPr0cOzZg==
X-Received: by 2002:a5d:5c89:0:b0:407:7a7:1cb6 with SMTP id
 ffacd0b85a97d-429b4ca3e2emr848288f8f.55.1761774424210; 
 Wed, 29 Oct 2025 14:47:04 -0700 (PDT)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952de971sm27970334f8f.39.2025.10.29.14.47.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Oct 2025 14:47:03 -0700 (PDT)
Message-ID: <175d5cf2-372b-44e0-b3aa-f395485925bf@linaro.org>
Date: Wed, 29 Oct 2025 22:47:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/35] hw/audio: generalize audio_model.init()
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
 <20251027151045.2863176-8-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251027151045.2863176-8-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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
> It is no longer PCI bus only.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   include/hw/audio/model.h |  2 +-
>   hw/audio/intel-hda.c     |  4 +---
>   hw/audio/model.c         | 12 ++++--------
>   3 files changed, 6 insertions(+), 12 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


