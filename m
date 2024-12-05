Received: by 2002:a17:504:d692:b0:1be9:327d:8ee3 with SMTP id na18csp684520njb;
        Wed, 4 Dec 2024 19:37:10 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU7LaIQRNlkNjqTdJ95ghshZONMuOEeKASPyL8y97tS9+g8v/Fad761V2mapsB2QK5ZP63eDobkjDv+Gw==@linaro.org
X-Google-Smtp-Source: AGHT+IEngoIK7ayRDUwIJrbS5hZv/fwI+4mCmZvgG9CbFhsPkyXFeI1p36eCO0Y3ULx7Kuiwd9f2
X-Received: by 2002:a05:6300:6302:b0:1e1:7536:87d6 with SMTP id adf61e73a8af0-1e1753694d6mr4597664637.43.1733369829826;
        Wed, 04 Dec 2024 19:37:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733369829; cv=none;
        d=google.com; s=arc-20240605;
        b=I1jaK4zFBj+z9X8MlFrLRNybZVnB8bgVIiQbVzfOkA0Os54Y3r9BkFpYD9dfKZnwtJ
         MOsqOwhrAlZ8Ae/Jz50izZqdNuUYyT+e8znN4kGrdb6CCf8kWCtTvWFpyeBP4YsQkgwp
         e+xOS7bdIyOqIwHBrASUNu6cuaedIg/I38gNLlGw/v++BQSrnBrdrhwvUDvCZesjEr+d
         DN6fnJUIp6rd4U2gqOBNYGn2lcSigtAWHHZrk6KKU/0PB2U0iVJTjbGiHiRHatoL9Lub
         hyDxJz7KITP0Fh4DFJQEd2DG/P+MJHQRmNmncQdCJPf7w54QnNiTPY+QW3k/5dTE34m8
         HK2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:dkim-signature;
        bh=HediFTr7Z+9MqQ8uMKyKuZUwMAhiOqlZgcbfm86n3Eg=;
        fh=gFvCeE/CvzViEZvcVdw69GpUYff0E7QyOzCD3jsrJXM=;
        b=IjfRVdyokSmjfCt48ui2j6hUqXlAh8PS1xD8b/wyCe+HY92eCqbd6eAzuFNJDh3tY0
         mDmwjYhUFIPBqBIu/pnZwiP3GZ371CQzy+D0JGVM6zNEJOUhq6nBMlpaUd2VjpSk31v7
         oltw1UWmu9cYYk021ZqiLa0YK+VmOpV9olkp7a9U1nS5322yzIxwZuqrknGMuGufG2ct
         wFc1M5kjo+8hni6MniVLrF4xY3OW0N4ZeZcl+XxnDX8fOgTjaWBlzAkCPbmjhjx/wZzm
         UGWHj8ZcxE9aYsBe2lI31e3CtoChYl/bOrN8d/1kIA4Jdc08ne3mxfoge0XJ868th3yk
         TTBQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b=M9MqZvyc;
       spf=pass (google.com: domain of andrew@codeconstruct.com.au designates 203.29.241.158 as permitted sender) smtp.mailfrom=andrew@codeconstruct.com.au;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=codeconstruct.com.au
Return-Path: <andrew@codeconstruct.com.au>
Received: from codeconstruct.com.au (pi.codeconstruct.com.au. [203.29.241.158])
        by mx.google.com with ESMTPS id 41be03b00d2f7-7fd15688b6fsi673286a12.149.2024.12.04.19.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 19:37:09 -0800 (PST)
Received-SPF: pass (google.com: domain of andrew@codeconstruct.com.au designates 203.29.241.158 as permitted sender) client-ip=203.29.241.158;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b=M9MqZvyc;
       spf=pass (google.com: domain of andrew@codeconstruct.com.au designates 203.29.241.158 as permitted sender) smtp.mailfrom=andrew@codeconstruct.com.au;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1733369827;
	bh=HediFTr7Z+9MqQ8uMKyKuZUwMAhiOqlZgcbfm86n3Eg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=M9MqZvycSmpAl4Vs1Kv40dt342Asup7bWfU28WubIT2wRCOtt/2yrmN7S8pAx+t+c
	 aEliOXRNlrKwhTUWu4Cnd/mga6sKJNj1mN9jCFrzTFx4ColwGxcgCCuI9OA9qAyaIz
	 qjWibALW7t7VAzvqJwV5KIB1WeEuyPz4r51xLUWflLV3C/BONzFQIWvKmVUQTLJVj+
	 cfloI2Z8SEcRkK7t7ESTI/WhLBXCxWLZhLVPELznc2weYuhlBaW1W07+PSTWhsNHiN
	 LWM5bCgnl6PKDjocqlQrIKgO8/NDDgfbEGZSYjC62diOeMarW7XvSiqdNY9iruyyp3
	 gPrRCb5yUiVMA==
Received: from [192.168.68.112] (ppp118-210-165-44.adl-adc-lon-bras34.tpg.internode.on.net [118.210.165.44])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 0CD1A64A5E;
	Thu,  5 Dec 2024 11:37:03 +0800 (AWST)
Message-ID: <0121beea0cbf51268ce6c9e20e7c16660ec6b9fb.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2 2/4] docs/system/arm/fby35: document execute-in-place
 property
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Troy Lee <leetroy@gmail.com>, Peter Maydell
 <peter.maydell@linaro.org>, Niek Linnenbank <nieklinnenbank@gmail.com>, 
 Steven Lee <steven_lee@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
 =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, alex.bennee@linaro.org,
 Alistair Francis <alistair@alistair23.me>,  Jamin Lin
 <jamin_lin@aspeedtech.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Thu, 05 Dec 2024 14:07:03 +1030
In-Reply-To: <20241204203912.3037515-3-pierrick.bouvier@linaro.org>
References: <20241204203912.3037515-1-pierrick.bouvier@linaro.org>
	 <20241204203912.3037515-3-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-TUID: RcDTnlQJ9uGw

On Wed, 2024-12-04 at 12:39 -0800, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
> =C2=A0docs/system/arm/fby35.rst | 3 +++
> =C2=A01 file changed, 3 insertions(+)
>=20
> diff --git a/docs/system/arm/fby35.rst b/docs/system/arm/fby35.rst
> index bf6da6baa2a..ed9faef363c 100644
> --- a/docs/system/arm/fby35.rst
> +++ b/docs/system/arm/fby35.rst
> @@ -45,3 +45,6 @@ process starts.
> =C2=A0=C2=A0=C2=A0=C2=A0 $ screen /dev/tty0 # In a separate TMUX pane, te=
rminal window,
> etc.
> =C2=A0=C2=A0=C2=A0=C2=A0 $ screen /dev/tty1
> =C2=A0=C2=A0=C2=A0=C2=A0 $ (qemu) c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Start the boot process once screen is
> setup.
> +
> +This machine model supports emulation of the boot from the CEO flash

Bit of a nit, but: s/CEO/CE0/ :)

Andrew
