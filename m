Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp1591540lfa;
        Fri, 30 Oct 2020 07:33:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJywjU9RaJt7sd56ABErnWsWonOs73EFkVvVHNKBRDn6siHosR6k4vVsziwxTOQiVWXB2T2G
X-Received: by 2002:a0c:be05:: with SMTP id k5mr9906317qvg.31.1604068415469;
        Fri, 30 Oct 2020 07:33:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1604068415; cv=none;
        d=google.com; s=arc-20160816;
        b=TMkZ1ZC/lXQXMBbfDRHgjMfx0hWZS4lYePF+2mRDkLMlCK+79/O9w6zswYFa/n7Yg0
         C24iBVOOIMTlMvJn/oId9l5CqBog3J13UT5W37SV0CdUxmpAfKpuy3TnSM4+qDeEKJB1
         6Ikoq7cOHtRZStNUGtVUbebdXYZyuV55duNlqyQCq2EtDb+3OKqBM+z1n2Vilks8vPfG
         TnvGX3XH0TGCiDYAAtwoKUhIZBTcfswbvHHf1aII97hzsIEQRA9y0X+JGmNrWhL3j2fi
         mB/eHD3KHPikEds8GYZeYRNFejM9vZsslHMukA8rwNhfG8atMSTvRKNSkYtlkq9voq0U
         PZ7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=nWBcIljEW/ko2t1mvxBhw1CzN0d8Sg1eJ094QT7vBgA=;
        b=pH/DtLkcGY1cOcg1KiYbxA7eC5j+IZD67MSCFKt4a5DXs1BWrMJZC0iTSDmXSxqKTP
         g0QK+/ZImOoNPFTu/4mLjbPl8EZv/nw9JEGMRQMLlhNXaJJbloq0S3eifKplMRtiA/rH
         7/CBUdHciJT3+dsPlTGM2RSVfE8FnHXmJcD00AdHnr92gmYq6lZ9sfqXmJPER1zV6QNb
         1Tl53CvKnytFb0Y2IrWU2rtuprgidIUCHjRmi1OW5OljJg+/CpLKdFWyF7CsAlMWTcmY
         Tc9751NO1YDrr4FqcP34ABLHI1pNrRATqcHMuAlnyO6+BhxTHoKbIq0dO1iJI2T2MNY+
         VUgg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IYqsPYhI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z2si3790269qtu.1.2020.10.30.07.33.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Oct 2020 07:33:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IYqsPYhI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kYVTC-0002Ia-SP
	for alex.bennee@linaro.org; Fri, 30 Oct 2020 10:33:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kYVT2-0002G0-Oc
 for qemu-arm@nongnu.org; Fri, 30 Oct 2020 10:33:24 -0400
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:39110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kYVSz-0001cI-Ng
 for qemu-arm@nongnu.org; Fri, 30 Oct 2020 10:33:24 -0400
Received: by mail-ej1-x641.google.com with SMTP id bn26so8912460ejb.6
 for <qemu-arm@nongnu.org>; Fri, 30 Oct 2020 07:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=nWBcIljEW/ko2t1mvxBhw1CzN0d8Sg1eJ094QT7vBgA=;
 b=IYqsPYhICcdaJlKdW7SdyblrbWgDM5E0GnFT3BE06+BbenULPEIWjY+hw7cWNywAWS
 pOxtwUKzg6Sd/+E6isxolHVHCjumaOo3lJblF/DJ7ESCYsvYDzDMlt1GNyS+WeYu/5Hl
 CQUd/mtcTwxypzZ2L2yeB0KEnGBknQs4e5E0FMmGgsx0dDBSleNpgyoKyxnNqaP3dsju
 sk9WFPehbT1Q7khRJvxBGDPTmZg4QfPhJ/AsJXaNN2cLjGntfz3SHfC8rX+T6GIF4DKa
 l8AN0Fg81yTNzdlDULEAlbC0zCm1n9vySI+20zAn+kYJ2pjv2CZy60wYCTzZ/FmjKTCS
 m9zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nWBcIljEW/ko2t1mvxBhw1CzN0d8Sg1eJ094QT7vBgA=;
 b=Sl3Xy9GCPKB1hXDHnIurEQJAkfrEz512AX/EP9NNv/MEXkxNkfjSnq2kK2HXfNjB9o
 K2FAkWKxb/NGwC3lekdRaWqoH3sYQmfW0PsiSCL1yOZwSV0WS6m20YFHc81FIxwcsArl
 Rg6PsDQX+E9XOjo7EcDBJsTq8vcyKrvMMq6xx+C56JbFK8b1MyJIGLKzuhL7DhWVvkZ1
 /ThzwvOeGKRt5Ty55QQI6KnseydcipoHw5xCSLLgcIYiyzuneIUNDC3s/AA7P40WB6iL
 EjGpgb2WTphHF15HcC2/QIa+7c2xFIqj3WR4bvfpHaWr9HZ5VoAmQf1RVZSZntFO0A2h
 Y+Qw==
X-Gm-Message-State: AOAM5323U+rEnOy776GQrRGL0bdNzvdK0ZOKEPO7AR0AuWIQtH0pvC1o
 cU7OcBGrP7yQ9j0VtlNETRRmbR43TpjovL3PAFnV0A==
X-Received: by 2002:a17:906:7254:: with SMTP id
 n20mr2642285ejk.382.1604068400137; 
 Fri, 30 Oct 2020 07:33:20 -0700 (PDT)
MIME-Version: 1.0
References: <20201019082121.1544550-1-f4bug@amsat.org>
In-Reply-To: <20201019082121.1544550-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 Oct 2020 14:33:08 +0000
Message-ID: <CAFEAcA9tBN9mDsotycNHnh4cUVMaYtGJO8NBqgvATKw8fJ7i7g@mail.gmail.com>
Subject: Re: [PATCH] docs/system: Deprecate raspi2/raspi3 machine aliases
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x641.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: Libvirt <libvir-list@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SQOMmCoq76Jg

On Mon, 19 Oct 2020 at 09:23, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Since commit aa35ec2213b ("hw/arm/raspi: Use more
> specific machine names") the raspi2/raspi3 machines
> have been renamed as raspi2b/raspi3b.
>
> As more Raspberry Pi 2/3 models are emulated, in order
> to avoid confusion deprecate the raspi2/raspi3 machine
> aliases.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  docs/system/deprecated.rst | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
> index 905628f3a0c..f0c7aaeb2ff 100644
> --- a/docs/system/deprecated.rst
> +++ b/docs/system/deprecated.rst
> @@ -355,6 +355,11 @@ This machine has been renamed ``fuloong2e``.
>  These machine types are very old and likely can not be used for live mig=
ration
>  from old QEMU versions anymore. A newer machine type should be used inst=
ead.
>
> +Raspberry Pi ``raspi2`` and ``raspi3`` machines (since 5.2)
> +'''''''''''''''''''''''''''''''''''''
> +
> +These machines have been respectively renamed ``raspi2b`` and ``raspi3b`=
`.
> +

This isn't valid rST syntax, which requires the underlining to
be exactly the same length as the title string it underlines:

Warning, treated as error:
/home/petmay01/linaro/qemu-from-laptop/qemu/docs/system/deprecated.rst:348:=
Title
underline too short.

Raspberry Pi ``raspi2`` and ``raspi3`` machines (since 5.2)
'''''''''''''''''''''''''''''''''''''

I also think it would be helpful to have at least a sentence
saying why we've renamed the machines.

thanks
-- PMM
