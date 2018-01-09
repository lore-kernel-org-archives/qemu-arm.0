Received: by 10.28.173.206 with SMTP id w197csp4186911wme;
        Tue, 9 Jan 2018 14:01:15 -0800 (PST)
X-Google-Smtp-Source: ACJfBou+EFnMt7jFKZO1F91JNR8R3u/rWlk3iywmRYPir5KbqtaQEOkfIHi80Eua2P5IDqZkJPCv
X-Received: by 10.13.215.19 with SMTP id z19mr8041411ywd.295.1515535275611;
        Tue, 09 Jan 2018 14:01:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515535275; cv=none;
        d=google.com; s=arc-20160816;
        b=u8Y8dXLEPDPWoFdOsh4Z5xY2PlpBsdjRJ4KDWoCgl3+/0jWs4f7PVW+Huu/kQd2EIy
         0bnf2OVBj0sr9VqFplUe5bEftzyyCdeZMwd7HBywBEeOiWZ2kCfJ7hpx5gAeEH0Z6utB
         u4F2IEGjk4a7hGWn0BxJj4iLSjpdgio1xK5j5sBqCqqpcuWn8tTP3X60SgXIeiCH0Xvu
         Cah0QCTzhzHHPirriZG85FeZiR5m/hYqd4MGnToTkvdVioFuDBXPWtLbqmD1PRo5Eyca
         N0rpgOtHRdDNjOIsc/x75Tf471VBxBt3loTJCAtpZH/BTW4wsNnGVpFJIrtEO3XgoNAH
         Xfbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=Uul69sjmsL6ILMzy2O18cRlGD9Zz5f94MxoHFKa7e+U=;
        b=kQFXxdqoxmQoE8U4IcC/ZZbHcrkAb1KzFj21Xov0Nyv4jwqOQ6snr4bLIuNGPrSxbl
         /YVV+AqMcIIb3+TcU6iGjM9z/7zbbaIk6oVq/iQaX7hNiQXk5ViANVrl7VeT1TVo8IFR
         Y3hdmZs0fJ9KSF3hu8RShHhr6bLUpA+u6bscimua2+b4H2o/i5N0sbtp2we84Ws34qna
         nyFjZjgH+7UQ2xEkSi9ea+83A0QUQ4S4SdW+0LjEkwXlGgqT6X0r3tLc/wwVIcIlSCiF
         sr7r9wpXV0gDKzCPsGYwn1/VmA4cYxbwZTPXO1bs5x0GPHOXFK+sn26fxnvjyz5dkjgR
         mNNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=TW4Rs+AP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s5si1733671yws.159.2018.01.09.14.01.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 09 Jan 2018 14:01:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=TW4Rs+AP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50933 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eZ1xL-0007cy-4U
	for alex.bennee@linaro.org; Tue, 09 Jan 2018 17:01:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58932)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eZ1wv-0007bd-Ly
	for qemu-devel@nongnu.org; Tue, 09 Jan 2018 17:00:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eZ1wr-0007oo-Of
	for qemu-devel@nongnu.org; Tue, 09 Jan 2018 17:00:49 -0500
Received: from mail-it0-x244.google.com ([2607:f8b0:4001:c0b::244]:33508)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1eZ1wr-0007nt-JJ; Tue, 09 Jan 2018 17:00:45 -0500
Received: by mail-it0-x244.google.com with SMTP id c102so8632668itd.0;
	Tue, 09 Jan 2018 14:00:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=Uul69sjmsL6ILMzy2O18cRlGD9Zz5f94MxoHFKa7e+U=;
	b=TW4Rs+APnDLZDodnnJjxLOfydJCtppuGZwOf7RhOeoOZ6yRgE+TNVAgLV7kTgLW7JU
	/NlVmDpHEey6Nal4EHBD6JBGyRFydwMd0Rn7hIlP4Gt+DdSMtXdZmMf9m4nvHwQeRhbl
	lvGM1zzWIfXoa/DQu1nS23iPR2vzH5v2GwqLJvPgFJkJeYqdsPwGVAv4Z+lCAIz0HJfb
	9aBlJiTxKdh7cPGfTmPnUnFoFJMp5RxULvsubHA7UO3do2LGGi0grIjjB0VYiED47mtk
	UT+19cm/EHx0GAWudj3ePLcetFvojowg1c6fS0nySqNPEzYHd/TsXP8fq+iwbinTPSBJ
	Dm8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=Uul69sjmsL6ILMzy2O18cRlGD9Zz5f94MxoHFKa7e+U=;
	b=XGNA/MZ7AcbFpL5L6oqyKiTYpRILIm0RkWPLN7p/8eONDFcjV5x/l5w1whzj8Qv2wW
	LjsH2z6nevXcgFL+vac1Io0dQ1nf3ivci/IvVAI2banyVyDO8PpK/uEBW+sJpIcQzG8W
	4MsYBM3RMkcKQuaAMY3evjWHhBPLIQsApUykEgdbZn/xa0HBLfCl+f9bf7pb2Ou0jppx
	KEbXFptaKKa8ABIILv1FmpQO+iqKa2GQzlrvbDt4nSKIDkQAiHA+Dq81Bt4vovnRzwBc
	xL5zmhG+H/zXOPRlA3smeXtf5SuiD/ZywW3x/3oZospuqIsN0T4kw3hd70SJBV3psxtU
	j6GQ==
X-Gm-Message-State: AKGB3mKcCggMSF5pDHHLyInII0pROEdCYvn84ovHKwZmEr8rwIzQCDQJ
	6MsH4S8dadoJbYEvaSwUUVSFHNSeRjJQL7zeOzM=
X-Received: by 10.36.67.77 with SMTP id s74mr16813521itb.149.1515535244844;
	Tue, 09 Jan 2018 14:00:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.79.228.132 with HTTP; Tue, 9 Jan 2018 14:00:14 -0800 (PST)
In-Reply-To: <20180108154303.6522-27-f4bug@amsat.org>
References: <20180108154303.6522-1-f4bug@amsat.org>
	<20180108154303.6522-27-f4bug@amsat.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Tue, 9 Jan 2018 14:00:14 -0800
X-Google-Sender-Auth: XAnCDYfQPLU0y2G-brgdLCDkuHc
Message-ID: <CAKmqyKOUogkrdonCZmVEg_i70Vf=xrs+5BWTaRH+4KJTsuVsmg@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c0b::244
Subject: Re: [Qemu-devel] [PATCH v5 26/31] sdhci: remove the deprecated
 'capareg' property
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	=?UTF-8?Q?Gr=C3=A9gory_Estrade?= <gregory.estrade@gmail.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Sai Pavan Boddu <saipava@xilinx.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	Clement Deschamps <clement.deschamps@antfield.fr>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HI0eW8TVjkMt

On Mon, Jan 8, 2018 at 7:42 AM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
> All SDHCI consumers have been upgraded to set correct properties.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Alistair

> ---
>  hw/sd/sdhci.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
> index 34bda73b66..ae914a6ef9 100644
> --- a/hw/sd/sdhci.c
> +++ b/hw/sd/sdhci.c
> @@ -1194,9 +1194,7 @@ static void sdhci_init_readonly_registers(SDHCIStat=
e *s, Error **errp)
>      }
>      s->version =3D (SDHC_HCVER_VENDOR << 8) | (s->spec_version - 1);
>
> -    if (s->capareg =3D=3D UINT64_MAX) {
> -        sdhci_init_capareg(s, errp);
> -    }
> +    sdhci_init_capareg(s, errp);
>  }
>
>  static void sdhci_initfn(SDHCIState *s)
> @@ -1345,9 +1343,6 @@ static Property sdhci_properties[] =3D {
>      DEFINE_PROP_UINT8("bus-speed", SDHCIState, cap.sdr, 0),
>      DEFINE_PROP_UINT8("driver-strength", SDHCIState, cap.strength, 0),
>
> -    /* capareg: deprecated */
> -    DEFINE_PROP_UINT64("capareg", SDHCIState, capareg, UINT64_MAX),
> -
>      DEFINE_PROP_UINT64("maxcurr", SDHCIState, maxcurr, 0),
>      DEFINE_PROP_BOOL("pending-insert-quirk", SDHCIState, pending_insert_=
quirk,
>                       false),
> --
> 2.15.1
>
>
