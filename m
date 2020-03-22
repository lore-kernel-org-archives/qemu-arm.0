Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp69645lfi;
        Sun, 22 Mar 2020 01:03:40 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuUl2qzUJnu3gTmVUKx3s7X9htSOtq/92mwjJ+2RfsEPck9IdigblEYDzaQp08mHQ6DTq9c
X-Received: by 2002:ad4:556e:: with SMTP id w14mr16227279qvy.144.1584864220628;
        Sun, 22 Mar 2020 01:03:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584864220; cv=none;
        d=google.com; s=arc-20160816;
        b=A/QThmF83XHiEh98pPZhly6byIjKEaf3cbjJWuIzuIQuPwu8uyWmOxbrMED/Zqowha
         Y+Hr+Oe5tguvE/rtIWptADzMrlfR3YgQ1tLEUoGsFmKVelJZd3v5ZDhw9ORUOGhFlQIB
         v5iD5s+Rz5908Evw006rnzSL8DqbgK0KgLFEdzskAOpAuj+QkGMYJhQq1sVbx7GeM32Q
         2yMlRRWiGxrWiR+fWwr6ZBBjIXMsMM5QVLzoXnBnhtubxxiJ78mNqYgjJCCpdxjB6x7Q
         GZUTNlpXDxIFp2dA/Wo8kngxJ7UK+Nm89FvXXxN1XTZjy65PghJiIIkCJrExHUINCmZr
         Oedg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=4uKBdKfDtOALMctPsEXXuyH4dB23sB7WSrCveJTFj8E=;
        b=EFLOSXydWf+WnnjxDKzU+Nk7gAyq6wh+VSJYdCVvuKncyORccIR7Q0aKvSrz3lecHM
         Zdpj2ktZjvxrIRQabCSigw43WiwisSkTDcBPBIA6T59Kbtj/cf8D2D3qhBNMPHIPN8On
         9gG1o65C8UZftuEp5Dlp5nnwcgwuMegoDGm7EkfpP+FJZvooHOi22G7l2/r80l11TGkv
         AAKNBPCzkdT0k8iFnQF4DVrmOAAr1Gb4x6LxxQjtHsXwHeKpQTTQC894x1Sk6uN7Uxh6
         2ULfNTlEmIqYjgzG10kRkDQXv0bYKvrhj/KhzVjoBwqxGDdWs2Jlf0iv6NzaMgHQ7r/n
         moTA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y31si6687491qtb.94.2020.03.22.01.03.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 22 Mar 2020 01:03:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jFva8-00021W-3R
	for alex.bennee@linaro.org; Sun, 22 Mar 2020 04:03:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47299)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1jFvZj-0001om-Eg
 for qemu-devel@nongnu.org; Sun, 22 Mar 2020 04:03:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1jFvZi-0003Lt-GL
 for qemu-devel@nongnu.org; Sun, 22 Mar 2020 04:03:15 -0400
Received: from 6.mo7.mail-out.ovh.net ([188.165.39.218]:49671)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1jFvZi-0003GP-A4
 for qemu-devel@nongnu.org; Sun, 22 Mar 2020 04:03:14 -0400
Received: from player157.ha.ovh.net (unknown [10.110.115.182])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id EC32615A292
 for <qemu-devel@nongnu.org>; Sun, 22 Mar 2020 09:03:04 +0100 (CET)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player157.ha.ovh.net (Postfix) with ESMTPSA id 9034D10AC7C42;
 Sun, 22 Mar 2020 08:02:22 +0000 (UTC)
Subject: Re: [PATCH-for-5.0 v2 07/11] hw/gpio/aspeed_gpio: Remove dead
 assignment
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200321144110.5010-1-philmd@redhat.com>
 <20200321144110.5010-8-philmd@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <6ae25fc2-5eca-8980-2072-f784bbeaaed3@kaod.org>
Date: Sun, 22 Mar 2020 09:02:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200321144110.5010-8-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 1997346435897789419
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrudeghedgvddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpkedvrdeigedrvdehtddrudejtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhduheejrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrgh
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 188.165.39.218
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, Michael Tokarev <mjt@tls.msk.ru>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rlMnHhvYcRNV

On 3/21/20 3:41 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> Fix warning reported by Clang static code analyzer:
>=20
>   hw/gpio/aspeed_gpio.c:717:18: warning: Value stored to 'g_idx' during=
 its initialization is never read
>       int set_idx, g_idx =3D *group_idx;
>                    ^~~~~   ~~~~~~~~~~
>=20
> Reported-by: Clang Static Analyzer
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>

> ---
> v2: Do not declare g_idx in for() (Zoltan)
> ---
>  hw/gpio/aspeed_gpio.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
> index 41e11ea9b0..bd19db31f4 100644
> --- a/hw/gpio/aspeed_gpio.c
> +++ b/hw/gpio/aspeed_gpio.c
> @@ -714,7 +714,7 @@ static void aspeed_gpio_write(void *opaque, hwaddr =
offset, uint64_t data,
>  static int get_set_idx(AspeedGPIOState *s, const char *group, int *gro=
up_idx)
>  {
>      AspeedGPIOClass *agc =3D ASPEED_GPIO_GET_CLASS(s);
> -    int set_idx, g_idx =3D *group_idx;
> +    int set_idx, g_idx;
> =20
>      for (set_idx =3D 0; set_idx < agc->nr_gpio_sets; set_idx++) {
>          const GPIOSetProperties *set_props =3D &agc->props[set_idx];
>=20

