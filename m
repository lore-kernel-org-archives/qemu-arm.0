Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp414265njc;
        Mon, 24 Jun 2024 05:19:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUegevLT2tCos3FcGQZsz7pxlorPZwfcmLJGgHhzivyZ1dTkdrdyIfQ7SkHrBZ2Em+76N5as2PCEY2NqeLt7q8oDyaMv2yi
X-Google-Smtp-Source: AGHT+IFk9R0T5jtemWBKtGVPKzxBItqnJCV+dyC1yHk7KC8TcUaDGcHCxLTWWbc5tq6LtnZO/nND
X-Received: by 2002:a05:622a:15c1:b0:440:5ac6:af6c with SMTP id d75a77b69052e-444d9371ff2mr57438521cf.63.1719231548840;
        Mon, 24 Jun 2024 05:19:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719231548; cv=none;
        d=google.com; s=arc-20160816;
        b=e1h4lV9WYg89qGXeSSg98iPLBGI6bmTmNk3t9AHsLFkRyEd9CGZ76h6Ds8ArW65L+b
         oKf2xBraJ6KEfpzHH9P8gxmK9MCr6mX5Nelw90fclFR7HGyrnJHF4fVCF3MDGcW/a4pY
         8zUENRsXTkCetsP5dZ4O/NhJz+4GJjJavnkjWQgjXFQ9bfLYQ8yUDMV+VWakOru82Oem
         K7tVGJki6itqjASOfL2kyvEckxlcxUmV8yoVfvEInx2hQi2XCeEPAILnxxXmhTTPvczG
         lbI30MWIMgYC7bSGoTdRhpN5DHJvnbWJHLkjc+z8S6WCFHzW0ljh5MZUGfLp6Oa0yRlY
         vZ5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=BB9DMwRqGzAcRENqpw1dCqUIDzOYjuf8OXy4togdbos=;
        fh=t/tB3GaTbmXtHvVU1epLgLJX3jD+kYlwVSMY8V+qjH8=;
        b=jAZ0dRKzfV2e5MEaSdbZ7YgMbgwRSdAeMu0xeWIJAZP2oJuMm8ZTLPAxqhDn3PhYus
         6vKl9UTnXV95wcyW84fIbxDhN5kRentRBuONsgSJIKoNhuWfQcbL47Png0lIw2r9qAvH
         STx7uJedZ+XMqqtFP48dbwsesY073VYNW6efbe+uMN+XOLPTu48HOsI8H1GbMWoMWkNb
         EnCY0Y+TXbYEQnDmKHMBLgG/C2QTD1TZ8GO9OfBCt/G6re1x64KmJHs8rgKz3xNUvsxe
         XrTPiaHCHw+dlxJSPNljCUYZMCbEf6U5Sck44jdIPQXVyRtDHY4URRvYX+gT3/tZLzqJ
         vC1Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=W0rjN5lJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-444c2b49d1fsi78947081cf.22.2024.06.24.05.19.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Jun 2024 05:19:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=W0rjN5lJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sLiex-0007OR-PA; Mon, 24 Jun 2024 08:18:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sLiev-0007O1-Id
 for qemu-arm@nongnu.org; Mon, 24 Jun 2024 08:18:57 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sLier-00013E-Fl
 for qemu-arm@nongnu.org; Mon, 24 Jun 2024 08:18:55 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-57d251b5fccso3659527a12.0
 for <qemu-arm@nongnu.org>; Mon, 24 Jun 2024 05:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719231531; x=1719836331; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=BB9DMwRqGzAcRENqpw1dCqUIDzOYjuf8OXy4togdbos=;
 b=W0rjN5lJt1VrYQH5Lx/2Fm0Qjg2lGZ4henmeMjQLyf1SoLGoGEc8w/8RfPiX7QLc0m
 Gk7sFPm0rETuOnHpIQ2GScQCoH5snlgmk80DH2j9tXczqdssgh7ImTCV+Gk/KdC6HpGV
 Gu535qcvcq7embBvif9KKCKtMjxxRDnWmSt/OHDa5O+Ak21HVbW0WB4Itxnw/TzcIBNh
 8NRYzhQ0dkFPWconGTJZq5Y6bkJiemcFXGVZ5+MDWFqEAEdiiLSlRJI7mPyyVU4oehYz
 P9VOAeiBPxJISbGclnCeUyzhSOt6L79KbwTMfleBrmpkEYrxS6RpkcfXRcqjdsaTjmRG
 g+MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719231531; x=1719836331;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BB9DMwRqGzAcRENqpw1dCqUIDzOYjuf8OXy4togdbos=;
 b=pwNxItj5I2m+KE4WBVSEpgWYwOnF/3yUhqgYkf4jJJXtt3o97XWbTcR+Pte6MhoZZA
 qbYX8nQKGxzuXL8P0gTp5NkzxkM/73aPpkBoLPOFzaRcnJfa4N+IlVtCMvs2wCfuVLy1
 yMZD5Qw3WEtts5GehIPU9yuEjSOsRrKnn8z6v3R4IyUnM3IOY7mawrhlQCxxz0+45b99
 DfoUQjy5eZzyt+zntCd5tu5uD12hX0/3c4OqbTr+f4EosEO1iOj+Ydnw+p7C7cf+HVw0
 fj/Y5/yECd5hyOWomdfumRhcbnzvy6GbOaBv0PmM6ENF3R8kbhMF4vAUZR1ZW9UBcz3Y
 WdQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvfkxuqm1RAfIsHbsF/ou0YM70yamwdx6I5dL70Ju/js+Ymb/skYupXMb3lvoy+ex4lFSuTeoIOIWABADTEnanhy1j
X-Gm-Message-State: AOJu0YwBzZgSwW8+D3dVddzEM5U3ExcYKXBKiPXYfcJu6Dg7eWk6LIXB
 vwR5fzFJnt30L0YLtXlaGg13FXMUbJaqKLuoDDw+WXC2q05IKnTXkno0Ug71Awx0r16DF7PKMy7
 nNsWQToJCouzvWoqSheHEpC8AZdPpAj+Qv1KtdA==
X-Received: by 2002:a50:cdd5:0:b0:57d:788:aaa2 with SMTP id
 4fb4d7f45d1cf-57d4bd53410mr2795875a12.8.1719231530730; Mon, 24 Jun 2024
 05:18:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240619093508.2528537-1-jamin_lin@aspeedtech.com>
 <20240619093508.2528537-2-jamin_lin@aspeedtech.com>
In-Reply-To: <20240619093508.2528537-2-jamin_lin@aspeedtech.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Jun 2024 13:18:39 +0100
Message-ID: <CAFEAcA8tTHusKOR7JhyU+wwA3JJWq1o5wVaNXugw2S9SjAsESw@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] aspeed/soc: fix coverity issue
To: Jamin Lin <jamin_lin@aspeedtech.com>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 troy_lee@aspeedtech.com, yunlin.tang@aspeedtech.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: M52gbzc1y6zE

On Wed, 19 Jun 2024 at 10:35, Jamin Lin <jamin_lin@aspeedtech.com> wrote:
>
> Fix coverity defect: DIVIDE_BY_ZERO.
>
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>  hw/arm/aspeed_ast27x0.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
> index b6876b4862..d14a46df6f 100644
> --- a/hw/arm/aspeed_ast27x0.c
> +++ b/hw/arm/aspeed_ast27x0.c
> @@ -211,6 +211,12 @@ static void aspeed_ram_capacity_write(void *opaque, hwaddr addr, uint64_t data,
>      ram_size = object_property_get_uint(OBJECT(&s->sdmc), "ram-size",
>                                          &error_abort);
>
> +    if (!ram_size) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: ram_size is zero",  __func__);
> +        return;
> +    }
> +

Isn't this a QEMU bug rather than a guest error? The
RAM size presumably should never be zero unless the board
set the ram-size property on the SDMC incorrectly. So the
SDMC device should check (and return an error from its realize
method) that the ram-size property is valid, and then here
we can just assert(ram_size != 0).

thanks
-- PMM
