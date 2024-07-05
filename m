Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp972400njb;
        Thu, 4 Jul 2024 20:41:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWf7fCYCPjr/rHZ/2C0L0rNvv8Kr5Uulxe5rqmKxzrIdGMrO8N3Mmt24bu34qnAEMRyHD+NhzOVJ+gu5JXd8eNZOA775c7M
X-Google-Smtp-Source: AGHT+IGsR0gdqsRz9Vqb0OgwtZ6jM8xvfrBlOUqPl2V0XseK2/fUwKA2tKHzZj3S6Jzkrw7yB29K
X-Received: by 2002:a05:620a:4005:b0:79d:5563:ea77 with SMTP id af79cd13be357-79eee1ddc42mr425503185a.33.1720150897771;
        Thu, 04 Jul 2024 20:41:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720150897; cv=none;
        d=google.com; s=arc-20160816;
        b=iQIkR2YcvL0mOha1eNMca7UUN9onFT3164hMUJ9I4ZaQVF+MmesKMz/aSjqGDsD/K0
         0U0oyRhdXq4nWghtd6T7HtRagdBmpylL6vbFJEEq4XCEReYcSPrPuphpxq0O3kznlN/M
         5xDuD56GiQS6ypfYrcpvKcyM8H8LRwg6NLWV5CVpklLdgluB5pccNtzjAzb5oRv9j3vn
         CM2qX+jLfIQ/i3Lfj6Zi1B/oMoI7r/w9k2QsimCtKs2QccCkOElKIK+iFzoegf4T+7sS
         JB5BlOPY/6X3AS19yjH1WahulRtxKUvb2PugXn7uIWi0rHLejJfZK7eX8snCgUUKnpTM
         nOUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :content-transfer-encoding:references:in-reply-to:date:cc:to:from
         :subject:message-id:dkim-signature;
        bh=qz/mGvu3wG8HLxNI7YHtOWWbBV1t1vAFTBeS+dIApW4=;
        fh=XYd3nlz1imZB8xXeQHM+01qZJ8iudtgMnw6k7asy4OQ=;
        b=h6Ck/G0dWtrkGUMfMg6lNV0RFP+qtrQMSR8/vr7U/580a1qQf1jDjhv9Gu3Rmr1mjq
         PWL4KMRgqiOXQsGP71HAVykcUcve7kUJZnysXuV0KXnjldvuwGCrVhmpp+u6REGo74ky
         6WWvP4zufo4xvWASVUQK6xQVnO9/c6wrA2TGQNB4LmkyUTiI45JHAMTXfBNdotUsSlmr
         9xl6Z2M3wUU3YgMpaOo5/4IgOoNYeS2u8Aitj1nUqAmob1JKCT7RMjqtHNI33POGUhMJ
         SY7T6z4a1n4d7w7NpdPyc4yzciVpWegfC1VKNm3HMnlXxq9gCKbBmgQdAZQ1MEBmdQDF
         NWKQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b="XhL1U/9+";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=codeconstruct.com.au
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79d69339abfsi1597563885a.572.2024.07.04.20.41.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jul 2024 20:41:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b="XhL1U/9+";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=codeconstruct.com.au
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sPZou-0008LD-HE; Thu, 04 Jul 2024 23:41:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@codeconstruct.com.au>)
 id 1sPZot-0008KR-EX; Thu, 04 Jul 2024 23:41:11 -0400
Received: from pi.codeconstruct.com.au ([203.29.241.158]
 helo=codeconstruct.com.au)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@codeconstruct.com.au>)
 id 1sPZor-0003Nr-Nk; Thu, 04 Jul 2024 23:41:11 -0400
Received: from [192.168.68.112]
 (ppp118-210-145-155.adl-adc-lon-bras33.tpg.internode.on.net
 [118.210.145.155])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 49C5D20127;
 Fri,  5 Jul 2024 11:41:06 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=codeconstruct.com.au; s=2022a; t=1720150866;
 bh=qz/mGvu3wG8HLxNI7YHtOWWbBV1t1vAFTBeS+dIApW4=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References;
 b=XhL1U/9+qEhope8vYOD3/36x5NyUC3zUme9SohnJJQ7z5jWgvcAukfHWvHul3SoGe
 +ReKddQwGQzOutbuny9e0JU+VwgaTe6VT+S7FN3TJtDgVP2CohqpP7XUinWCnwjRMN
 tLOIOcAK9phh6FLL7O+9iMHY5b85uBi6llAb2uuAH+/QEssBcqWoDPOi/jk3RnpayY
 qxEwgo9h4+ayRqZfVb5ZvAiiwXGuQWI7XNnyDwWWVZOnYvcz9RZsKO71tW1DF3KwXN
 fnbNnfJDvdYMpKLY+TE5IIUkzAKZHOmBacw8IPSJse4Y+8sqHwx9Fn7Rjfc1U66fYh
 BDC5P/SUKEcRw==
Message-ID: <f50579b99ef8883dac5fcfc1606a45abfb8bf85f.camel@codeconstruct.com.au>
Subject: Re: [PATCH 5/8] aspeed: Set eMMC 'boot-config' property to reflect
 HW strapping
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@redhat.com>,
 qemu-arm@nongnu.org,  qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>, Steven Lee <steven_lee@aspeedtech.com>, 
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>, Peter
 Maydell <peter.maydell@linaro.org>, Philippe
 =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Date: Fri, 05 Jul 2024 13:11:05 +0930
In-Reply-To: <20240704053651.1100732-6-clg@redhat.com>
References: <20240704053651.1100732-1-clg@redhat.com>
 <20240704053651.1100732-6-clg@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
Received-SPF: pass client-ip=203.29.241.158;
 envelope-from=andrew@codeconstruct.com.au; helo=codeconstruct.com.au
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
X-TUID: WNwGQqZTHACT

On Thu, 2024-07-04 at 07:36 +0200, C=C3=A9dric Le Goater wrote:
> From: C=C3=A9dric Le Goater <clg@kaod.org>
>=20
> When the boot-from-eMMC HW strapping bit is set, use the 'boot-config'
> property to set the boot config register to boot from the first boot
> area partition of the eMMC device.
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  hw/arm/aspeed.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
>=20
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 756deb91efd1..135f4eb72215 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -327,7 +327,8 @@ void aspeed_board_init_flashes(AspeedSMCState *s, con=
st char *flashtype,
>      }
>  }
> =20
> -static void sdhci_attach_drive(SDHCIState *sdhci, DriveInfo *dinfo, bool=
 emmc)
> +static void sdhci_attach_drive(SDHCIState *sdhci, DriveInfo *dinfo, bool=
 emmc,
> +                               bool boot_emmc)
>  {
>          DeviceState *card;
> =20
> @@ -335,6 +336,9 @@ static void sdhci_attach_drive(SDHCIState *sdhci, Dri=
veInfo *dinfo, bool emmc)
>              return;
>          }
>          card =3D qdev_new(emmc ? TYPE_EMMC : TYPE_SD_CARD);
> +        if (emmc) {
> +            qdev_prop_set_uint8(card, "boot-config", boot_emmc ? 0x48 : =
0x0);

0x48 feels a little bit magic. I poked around a bit and there are some
boot-config macros, but not the ones you need and they're all in an
"internal" header anyway. I guess this is fine for now?

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
