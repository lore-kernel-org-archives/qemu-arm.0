Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BBCDC83F17
	for <qemu-arm@archiver.kernel.org>; Mon, 14 Jul 2025 22:33:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ubRj0-0007a9-Ez; Mon, 14 Jul 2025 18:32:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ubQoR-00034x-Gq
 for qemu-arm@nongnu.org; Mon, 14 Jul 2025 17:34:15 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ubQoO-0001l6-HK
 for qemu-arm@nongnu.org; Mon, 14 Jul 2025 17:34:15 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a4fb9c2436so2887848f8f.1
 for <qemu-arm@nongnu.org>; Mon, 14 Jul 2025 14:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752528851; x=1753133651; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=od9WYTsloOatPqWwjiS3jmqklVQjCvEdJgRfr+o+36A=;
 b=uhsgEGKE4aX2xfGPMuMWezeob7otK8ohhnVoxCA2s5IR/JvuzUXZSB6x13n+Oh9WlU
 nX492H57JShrhFePC5LJ9ZCP+FtWhtfi1DpKQY/82tBJx7jyItjQyzeE0glHVzgYlZDY
 XuID2ZEiR+12lOG/W8utfU9bEF1G1j8pf99/Byg9yYV2gtFHZ0XMeSiV77voS7TMn+Qc
 DTWQhzpneCqOBCIWh5RLbdwGf/LNnoj/ZHoa2gzpJa2fSCwX1YwSL+OO6eeVSjwmMG13
 cOJ2qk0mxwNVXrFLL9N51+MK/kRPhSf1c3YTjqxGwX/i2IdnXmXNYCiBwAGeqBQab0pH
 ZChQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752528851; x=1753133651;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=od9WYTsloOatPqWwjiS3jmqklVQjCvEdJgRfr+o+36A=;
 b=tZKET7h+9UqNjNjtrL6aZTaj8YPfpnCi5Bou+vJpbvto1Hc9hwRoZEESn3S5aCyUY1
 PCAaJlOoD4KhcJEJ38X0ry7og7DoTyTSgafgjZ+l0fvUqqJEUSrjMpjaRjjxgIV8D1fd
 x3Qh+NZlcgVHQZeXdTuYZmDG3jlIT3ntqNrwXFk5B4LU9weiQ3deRVxJfp4CdBZUrEAi
 wsnZViZTlSWKcHcYxAt1vbhFxNP9v5J0usDwUrt9Y2B0+HX89njCas8fFZrSLdd+j8+s
 RmfrjbDfjcFeC5t2r1AsQ9Y1nvVj8b8sgYp4XrT4327jK4cSEWeOFboX56aXrjU70dH1
 gNrQ==
X-Gm-Message-State: AOJu0Yz9hUxl8Mcvcf+7rt+iF9WEAXl04Ppqdwej2nMrZlIDRoSCZIal
 IRMKSBHV8Jjv9UVlKiBcm1fmbY/+I8B6JbNewTYdLAeoc+dH7Q6hvNCU4yj5YS03LFo=
X-Gm-Gg: ASbGnctluIvy7jVn7Rsxv+FWhdZ70p5ifTnDjYOpK/yNrykeInu2cNC2HB8JKOPIHgg
 ouvEoRRFyfsQQRNnQ+CY9dunFSkmpG68il0c9SFq1uZr4YO67swwZEe1bGHpUKxEgHpstZ/EKdE
 PlSFaSG02LgLKfqs36T2EqDY+W9HU5jhiGuxNjNk2i9JPnOReEeg+0Rxodbf/8BeYvRbisSz+s/
 2f3WWz+DEHb1LdNnjAZ3evQF1u/pcT6cF5dVFn5YM2qNIO4QoVAzhA2XVKtq3Px5+5HoygG075/
 J8ISYf3rLAmGvvGvA9kEtwtGfOSO43dJuD/adhdQwxVzghym1Sq2YOIYsaU99qY6jCQMGQtUris
 BOMq4ithiJEhHokOcvhI8leh2D2EY8hhTUUBTJqfIgm414KfznCoTpObx9DVt08f9aL22NJE=
X-Google-Smtp-Source: AGHT+IHNDbrd0j3raV/rZCWS3Vy22wPpDmdb5x/iYv3fDO53ymA5/ibW5yqlcpBUclHuw1uWCAdbjQ==
X-Received: by 2002:a05:6000:471d:b0:3a4:dc42:a0c3 with SMTP id
 ffacd0b85a97d-3b5f18e813amr13800774f8f.56.1752528850660; 
 Mon, 14 Jul 2025 14:34:10 -0700 (PDT)
Received: from [192.168.69.239] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8dc1e4fsm13254124f8f.21.2025.07.14.14.34.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jul 2025 14:34:09 -0700 (PDT)
Message-ID: <1ef61fdf-c151-4d6d-bd90-240b3462c2e6@linaro.org>
Date: Mon, 14 Jul 2025 23:34:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] hw/microblaze: Add missing FDT dependency
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?=
 <marcandre.lureau@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
References: <20250708204806.1898-1-shentey@gmail.com>
 <20250708204806.1898-2-shentey@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250708204806.1898-2-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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

On 8/7/25 22:48, Bernhard Beschow wrote:
> These boards ship with a bundled DTB, and dtc will be required for generating
> these from device tree sources. Prepare for that by adding an FDT dependency.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/microblaze/Kconfig | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


