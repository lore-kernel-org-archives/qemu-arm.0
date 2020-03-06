Received: by 2002:ac2:4942:0:0:0:0:0 with SMTP id o2csp3932965lfi;
        Fri, 6 Mar 2020 00:37:41 -0800 (PST)
X-Google-Smtp-Source: ADFU+vuavBo4dR1XACpJVebpY8AL7PoTuHI4x/pe2Z4YAQQPa9UQgeFhge+NMUMG5BzQH6OtmFNq
X-Received: by 2002:a37:a1d6:: with SMTP id k205mr1941251qke.352.1583483860897;
        Fri, 06 Mar 2020 00:37:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583483860; cv=none;
        d=google.com; s=arc-20160816;
        b=vZ77aT8MwEpMFxnWxMLNH554C1JiqheMKNrJIO11V9EChqdOEG0k4ly01iYSvjGaGS
         XWNLXVTfEiJmSNteiwldVwflCpz+pwUy8e9xzU8z7/vdtO6ZCc12onsze0iBeoOrYnpU
         Sb7nerWWDo6mRzKS5kD5oRccswtadX2z4cMRwvbvZD9ktB8ncKXqGNv7ujYuoMIDD/BY
         qAwI08Hzmjr3j18iEArnecNQIHHa1st/rHu06CoUJiGQCRSm6dUuDxxhclhtvOahnR6W
         OfQ+bpAgQ3HAsooS65hKqssgQptsiIqPGfF2KBpGOwIHpTraKi48AWgBRIxSqZh8yX4H
         XlfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=jIof3AkU2IkHeVGssOqdyQ3MR20tHE1wfvz1T0B4jlM=;
        b=qA7LWTd+HVSlCZMzwzIROownZkUy64uzVKtrvnDwygOWdQ48NkxJLeWqH218ChzW0c
         GSWk3jjsaXTFchQrMQv5+B19DDJrDWLE3HwDXSB7JWxkzpKGJqpCci1JYFtN6+ofdQo3
         /U2jueRmF9cTAKw2XOqoFIVlLzXMAKSpVT9wHwPigh8Cdl4rB1O4cmcyB+l5aAlQ1LRE
         sHnh7f9Qix2zx9NaNM1YwDxG3Nrqai80JoXVxoiXGDrq2gWBP4YEZAfstEDZyQlr+oVV
         gnxlq8+5VB7O6GMSnAuVxNxhZYWSAtM2OvsLQXOTVZmEUxIvWakJ1e8a4Zmu52jisS04
         EBvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=eAVz1sKl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q35si410032qtk.306.2020.03.06.00.37.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Mar 2020 00:37:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=eAVz1sKl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:32828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jA8UG-00063O-AA
	for alex.bennee@linaro.org; Fri, 06 Mar 2020 03:37:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39282)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1jA8U7-0005zt-2c
 for qemu-arm@nongnu.org; Fri, 06 Mar 2020 03:37:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1jA8U5-0001VX-1r
 for qemu-arm@nongnu.org; Fri, 06 Mar 2020 03:37:30 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:52058
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1jA8U4-0001So-TF
 for qemu-arm@nongnu.org; Fri, 06 Mar 2020 03:37:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583483848;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jIof3AkU2IkHeVGssOqdyQ3MR20tHE1wfvz1T0B4jlM=;
 b=eAVz1sKlYkI6vKF30lun4mXJ/ZHdhRcEF7lOQVmEnSYeHvy2utN/H0YcvGz9pqljCJVO8b
 qHt5ps/9GhsGgIaviznjxE3v89moWqSfPVxIWCyWghIdBsbZdgnJrH2rIIs9e8A2tyWqpY
 rnEx9wkLG+ss1Ih7abkF2228bP59UgE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-jkMf6zWGMF6DxJReWhF93g-1; Fri, 06 Mar 2020 03:37:26 -0500
X-MC-Unique: jkMf6zWGMF6DxJReWhF93g-1
Received: by mail-wm1-f71.google.com with SMTP id 7so597189wmo.7
 for <qemu-arm@nongnu.org>; Fri, 06 Mar 2020 00:37:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+JwmFIV4EQ/1jb/bmSBxX8EMZV2M3M7i3jxLfkhMM28=;
 b=E8rj00KivetWlrF5PkbB3qXKjhp2Lf5+7yeV8B/p9vyJsZnMXd5xIBqKV7GcZhgTCo
 ORYriT3USQnAgw0WexxGn5Q43pxev1jnScVq9GaRaGCwulOmIZ6z/EIs8SAEsxwUigzG
 W1efNZ44mhPg+X92GHRz2k7Hojynm7RoWYGveCD5kW6mukvBGcJS6v5O25WNuDI8Oalj
 d62elAYc16fmMlnK7J6LJ71u42A5smqS3huCoRYEvyIYKE8Nb5H0E9RK40RguxTrJerg
 xIA4pdG3TDR7//cffJNizxn6PUsJVPn61R76e1VyO8wiqe5Eh0xHHPyVPQwHgqOGNSYd
 rYKg==
X-Gm-Message-State: ANhLgQ20VjFUKR9Aozi4AeouQ2TzXGNT4/6BD1MZ1zoaeVnKR3te0SBx
 hIYRCySsXBnbuu0ME63Bc+TpXUHzmkN0BR/n+iibQUUDttfe+unpVrdMt4k9PE16rSz6PFAlUwd
 Bkl0cKX2X8Th7
X-Received: by 2002:a5d:638a:: with SMTP id p10mr2813330wru.42.1583483845347; 
 Fri, 06 Mar 2020 00:37:25 -0800 (PST)
X-Received: by 2002:a5d:638a:: with SMTP id p10mr2813302wru.42.1583483845114; 
 Fri, 06 Mar 2020 00:37:25 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:b99a:4374:773d:f32e?
 ([2001:b07:6468:f312:b99a:4374:773d:f32e])
 by smtp.gmail.com with ESMTPSA id z12sm20447811wrs.43.2020.03.06.00.37.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Mar 2020 00:37:24 -0800 (PST)
Subject: Re: [PATCH 1/6] hw/net/e1000e_core: Let e1000e_can_receive() return a
 boolean
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200305175651.4563-1-philmd@redhat.com>
 <20200305175651.4563-2-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <8dc2c940-551c-020d-bbed-98dcb194f59d@redhat.com>
Date: Fri, 6 Mar 2020 09:37:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200305175651.4563-2-philmd@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-ppc@nongnu.org, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 Jason Wang <jasowang@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 Joel Stanley <joel@jms.id.au>, Beniamino Galvani <b.galvani@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goat?= =?UTF-8?Q?er?= <clg@kaod.org>,
 Richard Henderson <rth@twiddle.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: E6owZ3QNu2uN

On 05/03/20 18:56, Philippe Mathieu-Daud=C3=A9 wrote:
> The e1000e_can_receive() function simply returns a boolean value.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/net/e1000e_core.h | 2 +-
>  hw/net/e1000e_core.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/net/e1000e_core.h b/hw/net/e1000e_core.h
> index 49abb136dd..aee32f7e48 100644
> --- a/hw/net/e1000e_core.h
> +++ b/hw/net/e1000e_core.h
> @@ -143,7 +143,7 @@ e1000e_core_set_link_status(E1000ECore *core);
>  void
>  e1000e_core_pci_uninit(E1000ECore *core);
> =20
> -int
> +bool
>  e1000e_can_receive(E1000ECore *core);
> =20
>  ssize_t
> diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
> index 94ea34dca5..e0bafe975b 100644
> --- a/hw/net/e1000e_core.c
> +++ b/hw/net/e1000e_core.c
> @@ -967,7 +967,7 @@ e1000e_start_recv(E1000ECore *core)
>      }
>  }
> =20
> -int
> +bool
>  e1000e_can_receive(E1000ECore *core)
>  {
>      int i;
>=20

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

