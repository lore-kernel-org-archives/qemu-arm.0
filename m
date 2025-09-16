Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF31BCAC598
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Sep 2025 11:44:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uyU63-00015A-4Q; Tue, 16 Sep 2025 07:43:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uyU61-00014z-Mx
 for qemu-arm@nongnu.org; Tue, 16 Sep 2025 07:43:41 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uyU5y-0003Tx-JS
 for qemu-arm@nongnu.org; Tue, 16 Sep 2025 07:43:41 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-71d603acc23so37251687b3.1
 for <qemu-arm@nongnu.org>; Tue, 16 Sep 2025 04:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758023013; x=1758627813; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=R2GJcsijddl+DQmsjULjtQKML3IigbwEY0yVqdqSnwM=;
 b=w/uKyN84EZglJ9PjvVxcpQxsjKciNyx/HZXTiKrkusXrmVxbJJV/jb7PRSKsZyEicJ
 o0y7eDICfJ9VuA2UtBwLa0eVOPaGNmT3mt4wdFOr2JKdGpoJxUmouUptVg/6sU39L4W2
 MbSIBoK1aM40+5u8cBf2/lwpSa0MyiF0j4q19QNLqroX8HXM/8Q0Dj1TB/dOjhT2wSt1
 TNNCV2VRAtPfvnGOz9/IUkNyGPrFrMVWVVIyiP3M5JeSEN9eomBSFn2oQ1gxD7ACbpI3
 /8hbde8qSlBB3M4Jyh3lyfeYNS/ED/ShUVL4u4jJnBEYOwWcsvDUHeoT8guopOsQXKY4
 MeBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758023013; x=1758627813;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=R2GJcsijddl+DQmsjULjtQKML3IigbwEY0yVqdqSnwM=;
 b=iFd/9RPSrvG4W/GgRYJWJqJD/yoazTiBmB8cj/XDMSMZESjEhZFgek3AbxITTPCc80
 NR+1AjrLgF9LE/nCvVaq+pRU7v4MsbaPbrm12B526L+y59+hPh1RIucaHr1lecvI/o6l
 YopfTO5+QTLMtS+hNJTkMV3imKIV3kH+UXhfim3Mbra9jSMSkPqLc0FRtRDZRvOWCxOY
 UhucZZW9MNMVK5RIMuxobVe9+OQyR96byfvCIREhwbBtHP/dzmV5JfsntQOrxLIe7Cq2
 2x+Y0KLGJORprLyvqtKVOtFl1MTbSUcvd/VZbp26UpcmgNpbRZZwdJHyn9alM1DrHrgJ
 NWgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6rl0g6UtsSCGUFzOLYoEYWz3zPdNkIh5Irm96QamVaJWjkfBP29HAT9mtu3EY807/7j0EvdLocw==@nongnu.org
X-Gm-Message-State: AOJu0YwnTJlfseaYOOryMvAjpFTHoETCfTChx+AHfkWrp1Hkg/yoFE3k
 c4Dp1UsFYvug5i84/18vfsOyStoEAYY4+C6Zf30lc93s+gMQEE8jADj02rlsgRLXrsn7tpzwmQq
 BCaAlK/Pnj1uBc0DiLMhkf5ZZizZaZnAI5He3q3syUA==
X-Gm-Gg: ASbGncuun0LoyuciCI/Lkrp28+M/rWn+l093xcT3rEHXypMf0u5eHQU0Ky78eSCnqG7
 +FAaYvLvw23CZrlZdOaLVYp0Ul8K+KiMzeUTHeZ+kcrJPJisvVVOX8rlFS27vZqe+FXn42mCoRl
 BCHJlfegjDu54tx09fafyc0UWUqUTpAqwddQq4D/bT1bLzJIa55HVxSj+BY8boltPns4IqnuLM2
 dGKMwJk
X-Google-Smtp-Source: AGHT+IEQlCy0au6n8jixIpIrWA/oiMrQZSlD2zsttYyQwWYCnBbj4d923+AvCxhKRKR4ubu/Yso2i5PedB4onU1lW6A=
X-Received: by 2002:a05:690c:a012:b0:730:c83b:e9f2 with SMTP id
 00721157ae682-730c83c14b2mr117859247b3.37.1758023013174; Tue, 16 Sep 2025
 04:43:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250304124815.591749-1-kraxel@redhat.com>
 <20250304124815.591749-21-kraxel@redhat.com>
In-Reply-To: <20250304124815.591749-21-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Sep 2025 12:43:21 +0100
X-Gm-Features: Ac12FXx9XadVkXfh56DOz_qdBwpDZ-EOHCcGJXsWKrZwlOYAmecKbo3OMlJbzyc
Message-ID: <CAFEAcA8Amg8KDX0QYKqe7RtHPMC+GFD6N+c5z4S-ts_V11_RCA@mail.gmail.com>
Subject: Re: [PULL 20/24] hw/uefi-vars-sysbus: add x64 variant
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, 
 Michael Roth <michael.roth@amd.com>, Markus Armbruster <armbru@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
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

On Tue, 4 Mar 2025 at 12:49, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> The x86 variant of the device is mapped on the fixed address 0xfef10000
> and uses etc/hardware-info instead of FDT to pass the mapping location
> to the edk2 firmware.  The latter allows to move the device to a
> different location should that turn out to be necessary in the future.
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> Message-ID: <20250225163031.1409078-21-kraxel@redhat.com>

Hi; apologies for this very late comment, but I just
noticed this reading through the code:

> +static void uefi_vars_x64_realize(DeviceState *dev, Error **errp)
> +{
> +    HARDWARE_INFO_SIMPLE_DEVICE hwinfo = {
> +        .mmio_address = cpu_to_le64(0xfef10000),
> +    };
> +    SysBusDevice *sysbus = SYS_BUS_DEVICE(dev);
> +
> +    uefi_vars_sysbus_realize(dev, errp);
> +
> +    hardware_info_register(HardwareInfoQemuUefiVars,
> +                           &hwinfo, sizeof(hwinfo));
> +    sysbus_mmio_map(sysbus, 0, hwinfo.mmio_address);
> +}

Device realize methods should generally not map things into
the system address space. Can we refactor this so
that the board/SoC/whatever devices that create the
device do the mapping ?

thanks
-- PMM

