Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58B1ECD5BAC
	for <qemu-arm@archiver.kernel.org>; Sat, 23 May 2026 12:09:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQlAc-0008J8-OE; Sat, 23 May 2026 08:09:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wQlAb-0008IV-69
 for qemu-arm@nongnu.org; Sat, 23 May 2026 08:09:33 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wQlAZ-0003k7-Od
 for qemu-arm@nongnu.org; Sat, 23 May 2026 08:09:32 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-49042aeeb75so24303545e9.1
 for <qemu-arm@nongnu.org>; Sat, 23 May 2026 05:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779538170; x=1780142970; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xCFbyHd8StAqTTLnbz2vbET7OBZBXi8j/h2Tb9Ddcrg=;
 b=U9dgz52hnc7SjcA6xp+ViL8fyx8jzRF4NuNzvClgCH4/kcjKCyroyuchbLhc09Fvgi
 LQ6YuF0vqU2yk0O/SgEWZYUafPGpTgJ4X0M1QU0TMfaOOD8xNWQA3G8ASHshTnBEYH/H
 NwH5u57nVEN9bws3WsCOGDwC+TtpVRVowqTOc3+u/sD6Xm6iRa7pwCBdWMBbSu0HJVl8
 m5xHYzE9rs+wogSiZQ3NP1KmP/vysYreLtRuAcax+IemKWU7HCL/UBv0jstC704ebGm2
 dVueyAy9WeC32FjCq7G+Wqr/dXeTrpHOBOUs7UuxAb+QkQKxRQEicTa13uehrJfMSbsg
 joWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779538170; x=1780142970;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xCFbyHd8StAqTTLnbz2vbET7OBZBXi8j/h2Tb9Ddcrg=;
 b=LdbSVFpN++MA4TVBw+nGrPLmCSDDurbw/lSRw0nnNlRJ5YbgipKZYrfi5YUG/8gPh5
 9YH05pO0mQl4PpaBu6BkGbea4Tv+/60gWl3ybxkwK0tIFyX8TJkE/TA4WyCBQWzENUee
 0maUeMaDyDkBGW4PBO5safcxm1a495zI7Z/3MDTMdgwsiXzNyxmCba1Wa07b1eOTinaI
 xZumchIi5ZjIP8PFHr3bAh/v060oUNN5qQe1uc52tsvQxLOpCyMKGmF794lK08YkkSs1
 4A8NArdp/XJv1+s5XXd2s+m3OdsMt27VoO2p76oqsWrTgtSB7zHxB4MXnt5bco9UqSSQ
 ddpg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+rjkOzmbtVBAkI/qtixOuFEwuuRWN8P16dhbOVQ4BsHsXOE69fI4E6TOyEOXnobYWEhpVzQmtPAw==@nongnu.org
X-Gm-Message-State: AOJu0Yynx8c7cdulmV5VNG1wxKeOu0ncIW421J9Lexe1Qb6HbyariyfV
 R98cf69cuwEkamcs/kPDbkK/NSa9/HR2GlYBpzvRMbwULdlD9jvGRf2T6YxTp+whrKc=
X-Gm-Gg: Acq92OFMXhXOO6p4lKDQo1YYhm16J485+Gx7CpmN4bYIg7JftcL6QoKNRAGCHa1V4RU
 /6cLjqCGCir/uOXJ3aCmYBNCXiUgQFVbE/zznFsVnEIjI2rx8oTnWrfaalXHndGyP3MfBMTJemv
 6gw7Wv6ZtnE2PIVniuJqJtBnZfXH5tGi+516JTnQjum1LBOBRfb1PxbjLZ96Zyp1aiRVnmrhAZY
 x1/JexW0wJx7AQNqD0AmyMd9MLO1j2Eq4cp/viBPdOfRUsjkmUQnVEVxXJ50IgkIr686wHyWgUN
 0sQKYRQU/CYOfdEdkFPxPZUWAj8t2xtZ16/WHbCycqul1VQwH04P3/LiqB+SHhv0B1gn/EPu0I0
 vuQrPs2MVorGzTqE3NLtyoL5PgGbNCqA4bD9yEvPZHFXvrIDkvtecBHGwNk+oYxcYTJKqVr+U41
 FPYGJJ1sZ6Xa7wWAwSsX0YUVaII5gjGrFMesoofNUEsUYsb1X+wNq2Q6q6TNYOJNqZQh2kSktJX
 sY=
X-Received: by 2002:a05:600c:4589:b0:490:548e:b854 with SMTP id
 5b1f17b1804b1-490548eb9d5mr13261275e9.26.1779538169478; 
 Sat, 23 May 2026 05:09:29 -0700 (PDT)
Received: from [192.168.1.117] (88-180-58-130.subs.proxad.net. [88.180.58.130])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4904527f7f7sm170507965e9.7.2026.05.23.05.09.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 May 2026 05:09:28 -0700 (PDT)
Message-ID: <f3ff3d37-31b5-457f-942f-ff6efc5ffe23@linaro.org>
Date: Sat, 23 May 2026 14:09:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/39] MAINTAINERS: Fix F: in "Raspberry Pi"
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: pierrick.bouvier@oss.qualcomm.com,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20260521080511.999266-1-armbru@redhat.com>
 <20260521080511.999266-14-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260521080511.999266-14-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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

On 21/5/26 10:04, Markus Armbruster wrote:
> Cover hw/arm/raspi4b.c.  Drop hw/arm/raspi_platform.h, it's in
> include/hw/arm/, and covered there.
> 
> Fixes: 95a5db3ae5 (MAINTAINERS: Add entries for missing ARM boards, 2018-11-19)
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Philippe Mathieu-Daudé <philmd@linaro.org>
> Cc: qemu-arm@nongnu.org
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   MAINTAINERS | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

