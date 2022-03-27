Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp5700784lfb;
        Sun, 27 Mar 2022 07:25:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx36fCU/WmSUfQmLtjqGFtLGHZIhbrl/bmuQ2yjJqUgVc/2ZrHo4ToYwWSYkYu7NSbqU2NL
X-Received: by 2002:a05:622a:1342:b0:2e3:75a6:aa7d with SMTP id w2-20020a05622a134200b002e375a6aa7dmr10118395qtk.379.1648391140606;
        Sun, 27 Mar 2022 07:25:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648391140; cv=none;
        d=google.com; s=arc-20160816;
        b=a3cm3Pf9hN1d5/25W2kSZLjPP6IM28bIt4pbfIfcT7PiQ1obO6yEEPMZtpqIPAydlk
         brJFHbi9JBtYfV8Zj3rquP/TwecqZD/Z9MkUl/h81aOz3mHgpX1rvX8nef8qnDkLVIEd
         4Sy0tVpZ2fDc54+Pa1pQeFLgxEIo7HTVkA9J7QWLg7QlbQXfpr+5b8pi6KBMUL16heJi
         iDLNLitqvwJUr9mijBOe4DeDVHLXNX7vlYOtf2bu+FzNWZzx5nYTyUKmgR33SGnjJGqt
         6ffBylQdDAY4px8GQD5dFd7Iz2HTi01zW2kY7yOV0p0YtpHn5aU4+pRUyazcwXmZH4Lm
         9+WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:organization:message-id:date
         :subject:to:from;
        bh=uHTYebNwktQBRwab+uKkdLyfbSZmrZl+1yF2X9lGQYo=;
        b=rB+PnN4KgUv+UNBPfNboOjItxtYy/HztwGimW7xOvQwIrK+iwiYO+KCzyeyBDSZ+7Y
         5QWwSRUZ1kE4kubLPCYchurYsd+rhCHOTik7RjHFqGOlJ++25iduGHTlWXT6zL4TNOF3
         /gGtP5ttaSLnBWkJB14wnjnlZYL/vWB1OuIXNIlBd5/0OhF0oagNmpvFo4tmQG0Knhsn
         ir5xaQLa8OEnQKhLpoQsOBz7IJGbjYfyGmNsQOfzPxa6o0JAIMrAfUmGjxglXBpPp2jZ
         uBCSeFi2HSRXCE8i5xYELoO5hZ/1Bx89/Yz7KamDJVFlMY/38aKqEQcxd3vRa8z473rL
         hYMg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ay16-20020a05620a179000b0067ece763d3csi5505686qkb.103.2022.03.27.07.25.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 27 Mar 2022 07:25:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nYTpr-0003pg-QF
	for alex.bennee@linaro.org; Sun, 27 Mar 2022 10:25:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1nYTos-0003nK-JU; Sun, 27 Mar 2022 10:24:38 -0400
Received: from vps-a2bccee9.vps.ovh.net ([51.75.19.47]:48212
 helo=ursule.remlab.net) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1nYTon-0004w2-KY; Sun, 27 Mar 2022 10:24:38 -0400
Received: from ursule.remlab.net (localhost [IPv6:::1])
 by ursule.remlab.net (Postfix) with ESMTP id EFF77C0231;
 Sun, 27 Mar 2022 17:24:29 +0300 (EEST)
Received: from basile.remlab.net ([2001:14ba:a080:a501:23a6:ebae:8f2a:4d73])
 by ursule.remlab.net with ESMTPSA id PtUAOJ1zQGIZqRwAwZXkwQ
 (envelope-from <remi@remlab.net>); Sun, 27 Mar 2022 17:24:29 +0300
From: =?ISO-8859-1?Q?R=E9mi?= Denis-Courmont <remi@remlab.net>
To: qemu-arm@nongnu.org
Subject: Re: [PATCH 1/3] target/arm: Check VSTCR.SW when assigning the stage 2
 output PA space
Date: Sun, 27 Mar 2022 17:24:29 +0300
Message-ID: <5551410.DvuYhMxLoT@basile.remlab.net>
Organization: Remlab
In-Reply-To: <20220327093427.1548629-2-idan.horowitz@gmail.com>
References: <20220327093427.1548629-1-idan.horowitz@gmail.com>
 <20220327093427.1548629-2-idan.horowitz@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=51.75.19.47; envelope-from=remi@remlab.net;
 helo=ursule.remlab.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Idan Horowitz <idan.horowitz@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: S5cBT7zOOmap

Le sunnuntaina 27. maaliskuuta 2022, 12.34.26 EEST Idan Horowitz a =C3=A9cr=
it :
> As per the AArch64.SS2OutputPASpace() psuedo-code in the ARMv8 ARM when t=
he
> PA space of the IPA is non secure, the output PA space is secure if and o=
nly
> if all of the bits VTCR.<NSW, NSA>, VSTCR.<SW, SA> are not set.
>=20
> Signed-off-by: Idan Horowitz <idan.horowitz@gmail.com>
> ---
>  target/arm/helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 812ca591f4..d0265b760f 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -12697,7 +12697,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong
> address, } else {
>                      attrs->secure =3D
>                          !((env->cp15.vtcr_el2.raw_tcr & (VTCR_NSA |
> VTCR_NSW)) -                        || (env->cp15.vstcr_el2.raw_tcr &
> VSTCR_SA)); +                        || (env->cp15.vstcr_el2.raw_tcr &
> (VSTCR_SA | VSTCR_SW))); }

The VTCR_EL2 specification says that the NSA bit "behaves as 1 for all purp=
oses=20
other than reading back the value of the bit when one of the following is t=
rue=20
(...)
* The value of VTCR_EL2.NSW is 1.
* The value of VSTCR_EL2.SA is 1."

Sorry but I don't see any reason to check the SW bit here.

=2D-=20
=D0=A0=D0=B5=D0=BC=D0=B8 =D0=94=D1=91=D0=BD=D0=B8-=D0=9A=D1=83=D1=80=D0=BC=
=D0=BE=D0=BD
http://www.remlab.net/



