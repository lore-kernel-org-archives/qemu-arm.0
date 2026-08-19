Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC89FC5DF81
	for <qemu-arm@archiver.kernel.org>; Wed, 19 Aug 2026 19:36:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wwm4u-0001gp-Pp; Wed, 19 Aug 2026 15:36:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wwm4u-0001gR-5u
 for qemu-arm@nongnu.org; Wed, 19 Aug 2026 15:36:00 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wwm4s-00072W-NM
 for qemu-arm@nongnu.org; Wed, 19 Aug 2026 15:35:59 -0400
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-ca766c1c9ccso927224a12.0
 for <qemu-arm@nongnu.org>; Wed, 19 Aug 2026 12:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787168157; x=1787772957; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=ju9OtINuyKhVVoSExlRZKWeBEouYo6XGLhMHp2hhEIw=;
 b=Miy+2y48CiCnw48gEFzQkuIHjNn4lpHZ0w82wXM0C+ri0BU8LjX0oqiYnYxFQ0fV/J
 AE2Kk/vAxlvOe3yr+HR0VbgldKYK55/RbAN3P6JomNQyX7sE8kQ4qYHb8amTc3AbzHvj
 p/IdB+c34vVHK0hbdlh+iSNMdx7ESGgqHWNnPhXf4yRyM8KN+rbQ6J19Wyaq8jkgUVx4
 eGtjijKRq6LOM8rl7UT5eQKH286uZCebaUbtwY2cLE5u83KYSK/u/OsQoX3H8HB5netV
 rZO5+JxMy2ywA5aNnWYdjd0IypBjFl9+z2bMAgyBpRXMxh1VhyzxZco5Hx++QRbFPbMt
 qEZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787168157; x=1787772957;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ju9OtINuyKhVVoSExlRZKWeBEouYo6XGLhMHp2hhEIw=;
 b=k00SeZBUXjwwb3Sk38pjX7vWnmqNAnQt5HGnIGMth/bHPoHTwoFPumW28cUu5aRzYI
 82J0lHWOjJPB47Kj8dsivKfRreDsg+1MvMaJPexh7y5Efh4hw442YhNpL+uwNa8Xus4n
 mSgkBh0jV2F1USKiM9uVbSYonEE1VCbSOHehJVRhd1IPiGysyyuWyQHMQhV/4J9hUUP1
 L3HmstpaZqGjOMSNQ8Qh/82QcJVD9+AFHfqATCrWJbfTgkk8bLL5elSC3lvCdW7OSRSq
 fkAw3+5fwbDkH4ZCvAcoh4vNKec5BvptaOXzVdHY6O7O+fQ/zp63U4Zfh3KvzJfeqGVD
 xlKg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rpqn3h4treocWKlq92C3vhw03tVVFwJ248wF/fG9LxXIw+knXoL7J3t4tfCKU91y1w8JBuwjx8oeA==@nongnu.org
X-Gm-Message-State: AOJu0YyuSiTJEBKFMasx8uhjp/8QuzHO2SqWcIweGY26J3kEZ9TIUsNU
 CMjvQpsPMMFKyPSpkQKhAGrn4WnAEX6LubSu7rWS3b1+g27oV96Dwm4Pbo467kpGzNw=
X-Gm-Gg: AR+sD13jk3jofbg1J6NcWtoe0VJII7ulfHRMv6kSaUNoRSvvCQaWIDEqO/usulOmcU0
 frIl0b8sC8BWFhfXMeyoE+VvV1B1eWQBfogSITFhjZOfLruAN1F9wgBsBZw+3m5Ll+GA90gPacG
 plcXNn+7tbbIJ/vT+vaz7DnxDCugwMeDcHYeAJVqk5wNKSxyNdIfAFCEF+b10SLLoVXGsHTTVZ/
 AzrLZKohRcSRCDBHxBOocIp7nPJtNyG21whiYVmAfdY9VO/QFq7G+c2H2seXTbj7Q2xVywbAAUf
 TwP813xO/R3fJdvI6VTmO55avN3Ll/lQidyPLB4l1KvWlWMROz3y63Svqm8ICKi/cuU51e8ZHXg
 a6ktMElKZyDjEHHef6SR4nXYBMfvIVij0+N+jZbydG1CkJr+EUuDrfySsyApZOAvqL9PT0M286s
 BPjKh335F/0JN95NefpMM4Kktt0yXW2XH4tI1mnbscfDe8zO6qr1NNe+PYFaz/KVXt7ah0cCBF0
 nDjsllZ
X-Received: by 2002:a05:6a00:14d0:b0:842:2419:6bfe with SMTP id
 d2e1a72fcca58-851d384706dmr12205176b3a.7.1787168157170; 
 Wed, 19 Aug 2026 12:35:57 -0700 (PDT)
Received: from [192.168.122.51] ([173.164.107.233])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-851d36185c8sm998036b3a.38.2026.08.19.12.35.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Aug 2026 12:35:56 -0700 (PDT)
Message-ID: <b184e75c-3950-449d-9e0f-6c4171dc89a2@linaro.org>
Date: Wed, 19 Aug 2026 12:35:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] hw: Remove Marvell 88W8618 devices
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Jan Kiszka <jan.kiszka@web.de>
References: <20260819185430.3467629-1-peter.maydell@linaro.org>
 <20260819185430.3467629-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260819185430.3467629-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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

On 8/19/26 11:54, Peter Maydell wrote:
> The mv88w8618 ethernet and audio devices were used only by the
> now-removed musicpal machine, so can also be deleted.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/arm/Kconfig                 |   3 -
>   hw/audio/marvell_88w8618.c     | 315 --------------------------
>   hw/audio/meson.build           |   1 -
>   hw/net/meson.build             |   1 -
>   hw/net/mv88w8618_eth.c         | 403 ---------------------------------
>   include/hw/net/mv88w8618_eth.h |  13 --
>   6 files changed, 736 deletions(-)
>   delete mode 100644 hw/audio/marvell_88w8618.c
>   delete mode 100644 hw/net/mv88w8618_eth.c
>   delete mode 100644 include/hw/net/mv88w8618_eth.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

