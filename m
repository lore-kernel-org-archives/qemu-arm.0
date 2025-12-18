Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8517D6E2D8
	for <qemu-arm@archiver.kernel.org>; Thu, 18 Dec 2025 18:26:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vWIhL-0002EI-AW; Thu, 18 Dec 2025 13:26:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1vWIh8-0002DO-LN
 for qemu-arm@nongnu.org; Thu, 18 Dec 2025 13:25:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1vWIh7-0005Ak-3m
 for qemu-arm@nongnu.org; Thu, 18 Dec 2025 13:25:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1766082344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=wZCRGkkGpnqicapnsPhNJndrvcKWL//kBJvuY5TfLyw=;
 b=Na38CvJerG5JqbfRrNeJ8FsZk5sC/7MTBGjFxhWfHGaUGP7jjqYtNDj9YW0JJ76iJFIHf0
 w39BosOGoEg3Kil1GrICJPxe0pHPsbMYPSR4XIrjZwcV0mbLlLK6IvqP0Z4nIRMeAsFQSc
 pgxQi3D4BoT+cNPh90+Jj8zQEfraB4c=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-564-2ZZ7EMcXNfujT67fmA0zJA-1; Thu, 18 Dec 2025 13:25:42 -0500
X-MC-Unique: 2ZZ7EMcXNfujT67fmA0zJA-1
X-Mimecast-MFC-AGG-ID: 2ZZ7EMcXNfujT67fmA0zJA_1766082341
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-477964c22e0so7482565e9.0
 for <qemu-arm@nongnu.org>; Thu, 18 Dec 2025 10:25:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766082341; x=1766687141;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wZCRGkkGpnqicapnsPhNJndrvcKWL//kBJvuY5TfLyw=;
 b=VEFXdoFsKXTQWfvSvWGmHp77O8R4qpedBXOoG01ywI4IXWy6JiGW4rs3PAYOjShqyX
 aaIaLFW26RnumCIZukXEh2OPYQpOhXYecETr8028O+Jn9zZsHKzyW+YmPG6WkmKqktBv
 9DblMMeLL23shKnYxt6TWKJ1dIFXFnG2upSaCVj8Q+6/P9ZcZOYGEGTmzkwds+fIPMmW
 J8lqQonT8xbN2/L9ZUc57LYEB0gWy160BG8aliSjZdqp+9DdZ93kRoYdgOYca08JWHJ3
 pPBYaq8OYQQXqF0DM8DDJ0XtcqKJHumLcIy5aMaNrb8gjf3zPnxeokTp+9cYGiHaQjS9
 zCPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmuI/oA2YoZZZ+5Er0XqhmpZhE1T2QTXf7/1LXy9cjQ1hNJDYkJivTr0iesBhdFG/BeC1HsoyvoQ==@nongnu.org
X-Gm-Message-State: AOJu0YxEdCItXiDNTxaDWMAx99pVekfv6fn1NV0Nk2s3hMiBOmaXfKnl
 QvXApW3ze6NRtDp2VcikMg3cu/E9HaklZ6rdPx8YIdAwwmUDKFTH08nxZ3xUUDvWCE98/fd268I
 or7lD+I7EFDkZToPDm+/4c5P14u1ubKNTVY1IdgeCrsC6DVwJwL1vmw==
X-Gm-Gg: AY/fxX6B+MYyzlwfxotZ0ZrHr6Ps88isZlptPiffs9TAnrs7sLk2z4kuc417LQfs/Ck
 ei8ZEtDPsRDAiHbu/f7VqZYEBHiDB6doiWfg0cNkaYyqEEO+YWiE/kKGr3/GgAKcAY+oI5aGXAW
 kadPF6T9PWK13fq5L3k4SmI+PWiRbbuMGaYB/BgCPWAVc/rITZ57ilAn3CQ434KVZVu6N9Bhj8Y
 1LmoEL8pO8IJta53iuIYb3NkKErAz8iGtkGRZfKHVBoFLQnSslnLY+3fCKGr0lI4xYcqGEusIGm
 E3xZ857RKOqmNvKyWvGDET4SJ00FYFoGIk3STPZsHIkZiltttVJwu3VV8xwDxI5Uv7g17a1abmJ
 y4qK6SFw=
X-Received: by 2002:a05:600c:4f93:b0:479:3a8e:e490 with SMTP id
 5b1f17b1804b1-47d18be8f2emr6112085e9.18.1766082341082; 
 Thu, 18 Dec 2025 10:25:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFgGF77W9h43xc7G2QOnnxCU05Dl+ZkX0ByCzqoHDu34u/7qQtA1+lVPpt1+Vk1Ik3X6UDPFg==
X-Received: by 2002:a05:600c:4f93:b0:479:3a8e:e490 with SMTP id
 5b1f17b1804b1-47d18be8f2emr6111875e9.18.1766082340731; 
 Thu, 18 Dec 2025 10:25:40 -0800 (PST)
Received: from [192.168.0.5] ([47.64.112.241])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47be3a0fb9asm19629565e9.2.2025.12.18.10.25.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Dec 2025 10:25:40 -0800 (PST)
Message-ID: <274845c2-ffad-45a2-939b-7fefa3159bba@redhat.com>
Date: Thu, 18 Dec 2025 19:25:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/arm/Kconfig: Have FSL_IMX6UL SoC select IMX_USBPHY
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Guenter Roeck <linux@roeck-us.net>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org
References: <20251218174455.57451-1-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20251218174455.57451-1-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3yLPf3Jzh2Qupc9ypxOTHfiyHe-d8IlEuJe8e4bKlAU_1766082341
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 18/12/2025 18.44, Philippe Mathieu-Daudé wrote:
> Since commit 17372bd812d, the SoC used by the mcimx6ul-evk
> machine requires the IMX USB PHY component.
> As this component is only used by 2 machines, do not select
> it by default (it will be automatically  selected when
> necessary).
> 
> Fixes: 17372bd812d ("hw/arm/fsl-imx6ul: Wire up USB controllers")
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/arm/Kconfig | 1 +
>   hw/usb/Kconfig | 1 -
>   2 files changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


