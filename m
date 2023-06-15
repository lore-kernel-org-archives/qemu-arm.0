Received: by 2002:a17:906:494e:b0:982:8c08:340e with SMTP id f14csp599613ejt;
        Thu, 15 Jun 2023 02:28:05 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6sYUelu/I1rVC14S2rZTuV1VHs7UaI7rLXGNuZjh0tanW82nXn+Vt8jp+hSb3NoZ6F3+0/
X-Received: by 2002:a05:6214:c67:b0:61b:5afc:d4be with SMTP id t7-20020a0562140c6700b0061b5afcd4bemr18844606qvj.7.1686821285565;
        Thu, 15 Jun 2023 02:28:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686821285; cv=none;
        d=google.com; s=arc-20160816;
        b=BDauDQQwV5SDFOKx9lGxYEMJ31mUAYg7GiAJqycEb1meQgiUsjffrKN3ngQ3+y+c8X
         b8r/nLP9EM9wkEIA6fUF8uwvHVLyy72b0XXoNwoCF8DrRZZadGwa+J9vzt6KSSe3OSIZ
         dcUYUxD0V/DWXV9UcIhquwbADN/ygNv+CHonJQY+4hufLxxRZu2Y8dqBHllmf0zVg3b2
         KVtUdL0/f/9LeUBcUyKgSe10tbQHCnRnD9MT3MSQozPB00JL42SQEyFt4twm5CeKAbfv
         qZPR8f1YFtJ66V4CdZXPlYGdfQ00jjqgzE7zo/OZrI6wa6G0yKExmUu3/W+Wyh02yvWB
         S1Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date;
        bh=U4Dy/KckuLCvtnLXkUQ5hyliL5Dr6MYiUhd9glTA0CM=;
        b=xOoARtemvTfY8gwnHwjPfnsMVAsXtiUDssKUmRADMiXR2ZgtgT1j+/EWhil1gMvZCe
         IgHK9Qv8cYytYBNW8XexrUvT4EIWhDZKxQHdga6XDK0aOXg6YYJIDWbK0NNTZU7k9D/d
         3kboWB9ehr8jmfhOxP6HzCBzlOIR0v0PWZZ5XOyn55/Skc+cIQKFLpH/ObtSnh0V/P5w
         89SEpxLFE02cov+6STXpefjeFeJJZrfJd5026PAtLLR975bEdX5jGmW8hge5jjrK5z1x
         o93rlvVE1tiLQkavpH8l84WG9A86qvt3vcw1+lAVgFMpH7mnMNsFbbw8tx5Aa/4xvyRy
         U44A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jp13-20020ad45f8d000000b006261c927904si9661374qvb.73.2023.06.15.02.28.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Jun 2023 02:28:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q9jGd-000585-Th; Thu, 15 Jun 2023 05:27:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <postmaster@kaiser.cx>)
 id 1q9jGc-00057I-J9; Thu, 15 Jun 2023 05:27:46 -0400
Received: from viti.kaiser.cx ([2a01:238:43fe:e600:cd0c:bd4a:7a3:8e9f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <postmaster@kaiser.cx>)
 id 1q9jGb-0003Xe-3x; Thu, 15 Jun 2023 05:27:46 -0400
Received: from martin by viti.kaiser.cx with local (Exim 4.89)
 (envelope-from <martin@viti.kaiser.cx>)
 id 1q9jGS-0008PF-KZ; Thu, 15 Jun 2023 11:27:36 +0200
Date: Thu, 15 Jun 2023 11:27:36 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH] imx_serial: set wake bit when we receive a data byte
Message-ID: <20230615092736.jsdurv6dvv4mxofk@viti.kaiser.cx>
References: <20230608154129.133169-1-martin@kaiser.cx>
 <239a543f-6d97-eb14-ba4f-284093fccfba@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <239a543f-6d97-eb14-ba4f-284093fccfba@linaro.org>
User-Agent: NeoMutt/20170113 (1.7.2)
Received-SPF: none client-ip=2a01:238:43fe:e600:cd0c:bd4a:7a3:8e9f;
 envelope-from=postmaster@kaiser.cx; helo=viti.kaiser.cx
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: c57oyreP1jhc

Hi Philippe,

thanks for reviewing my patch.

Philippe Mathieu-Daudé (philmd@linaro.org) wrote:

> Shouldn't we mask this bit for interruptions now?

yes, we should support interrupts from the wake bit. I'll add your
snippet and send a v2.

Thanks,
Martin

> -- >8 --
> diff --git a/include/hw/char/imx_serial.h b/include/hw/char/imx_serial.h
> index 91c9894ad5..b823f94519 100644
> --- a/include/hw/char/imx_serial.h
> +++ b/include/hw/char/imx_serial.h
> @@ -71,6 +71,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(IMXSerialState, IMX_SERIAL)

>  #define UCR4_DREN       BIT(0)    /* Receive Data Ready interrupt enable */
>  #define UCR4_TCEN       BIT(3)    /* TX complete interrupt enable */
> +#define UCR4_WKEN       BIT(7)    /* WAKE interrupt enable */

>  #define UTS1_TXEMPTY    (1<<6)
>  #define UTS1_RXEMPTY    (1<<5)
> diff --git a/hw/char/imx_serial.c b/hw/char/imx_serial.c
> index ee1375e26d..c8ec247350 100644
> --- a/hw/char/imx_serial.c
> +++ b/hw/char/imx_serial.c
> @@ -80,7 +80,7 @@ static void imx_update(IMXSerialState *s)
>       * TCEN and TXDC are both bit 3
>       * RDR and DREN are both bit 0
>       */
> -    mask |= s->ucr4 & (UCR4_TCEN | UCR4_DREN);
> +    mask |= s->ucr4 & (UCR4_WKEN | UCR4_TCEN | UCR4_DREN);

>      usr2 = s->usr2 & mask;
> ---
