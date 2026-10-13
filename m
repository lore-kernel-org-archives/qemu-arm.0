Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D87E6CC6B03
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Oct 2026 12:10:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGbKB-0006M5-8a; Tue, 13 Oct 2026 08:09:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jaminlin1207@gmail.com>)
 id 1xGWRi-0000Rq-Iz
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 02:57:10 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jaminlin1207@gmail.com>)
 id 1xGWRg-0005qr-Uv
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 02:57:10 -0400
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-c315a445752so396257666b.3
 for <qemu-arm@nongnu.org>; Mon, 12 Oct 2026 23:57:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791874627; cv=none;
 d=google.com; s=arc-20260327;
 b=GrFz1zo+OXKHPAoH2l3wNY2kD5uFvzkBUOFK01O1rUqJMtm1SZM4AoGUVTVxIBEVjE
 /MZ8rjjFibxVsXT6VDxgp/bXL+aYPU7GEmNSnsnsZw39RmAqOupASY3z1agSNkWFScdd
 HTJLIzLhPEdndR+VPZfZ2lXRtRUZI8KW1EL3HwnPOS+erjTnAc8La2iBW5ydCGfE/stW
 9O5LrbmgdraiZ+7/YQ/hYjY822rudaU7/ZR96GM7TOIC1Y/9mxBFPslrE/A6mX51rq0x
 0Guy09FcDnFNiCztZgOqJAXRCm6WoG0cWUna1++x1590b4Ice0C+kB2U0MMaFMPbXClI
 wNzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=yAF65vIl+Pcsu3zOYkkdhrkunAFE6hSr8dy/8TmbRZs=;
 fh=8jHzrfc+4ZN8QcaOJeZy21QHRDnEWPAgYAI0BKEA7b0=;
 b=IO51hP6mXnQRPsNIf1pIKiS5gS8hq5xnw1cH7lIAbE4Prhv5sgynk+vY1/8QnQhUtL
 yT+nh+5ofXtKY7/91G8mi8rdRGWrFfUOFNgB2lIsv9GfPhelep4npLZbDV7boUIHxcad
 DVGsAR8gM1ti/VXHTZpXPW0I64HHDMZYWTsZYbxEA8FbUNDQlsw2KjSA4CaLe+W1zNWm
 uckeeaAMkvambCMU4wrJd0G/tqI9e2rHWRTA3qUli3+TfM8T2Ul5+z9gt60QR+eP49oU
 aZATVaMoEvMrENltbkQjOkp97DtbvBCWRRRat7hPfkMcSW47j16cR5YXNwrUXilnhNA1
 0n0Q==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791874627; x=1792479427; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=yAF65vIl+Pcsu3zOYkkdhrkunAFE6hSr8dy/8TmbRZs=;
 b=SbUpZxRGXh34TjbnwxhaaSFhwh0IdOBvEuwRW8DkOLXo61K6CMOLZzY6ODxJEV14cG
 hckbGgRONLVd2+ibUtY30VXXfR7qY1jjGEHaMnRhju64qv83pQzJ2UIYfOTwREX2PNNA
 njT3KJsywZnjB/GgroIb8Bq94RSg//IgO9qAsA+nZL5P6raIpzKFcu+MeiiaveWAPDhu
 kqsQO1IG1OlivcdnS5tq9wGayLE/pXaXJS+S+BIN/7pMhVQ/Ygmt2KXk7gVFWTVkFuY/
 dTWGd/8z3EqWZyg2x83KwkhLvrWyISMT5XDcjoMUk4Ywg43rE3vBxdijkTYjr/ic+fBj
 tOEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791874627; x=1792479427;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=yAF65vIl+Pcsu3zOYkkdhrkunAFE6hSr8dy/8TmbRZs=;
 b=12MSflQUxCwLN0I5Bqz7XSlzGUlPfZn8hJdrNpXLH6L8bS+s9d4TQJXSPOYGLkJWpN
 dph0ZroPDn5krOINrGmu0LdYcYx3uTGe3YwncH6X1IjIih6lBcMJB/Dua7QbbbWkhlUS
 miGgfMY8Nh3p+NhwQMPbKWw28SCYdho5G4VKdCSPdefb4HSBIKyGsN2jUpxl02QCN7M3
 e2h21yIHStfYzi/48T/AFnXFeN73liaAViXwXWAabE3roNF7VXM0IzNES4g9PpXXtPf3
 1k2FXHuRJQrU3+aMSmUdxE2cWvzyaM/54GFenGNb/w2/pbXVggsggk0jwLKmj6J6D6UQ
 klgQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxnn1o+8IPb4WJ2idV350Y6TlBOX/DDWqmyEsdoL1Y40Ir3wY3DR8y/+NkELl7S0zMrblEkkylrsg==@nongnu.org
X-Gm-Message-State: AFq9FYIcRguXSp/lyVrCBF85kKu2KHX0GuGEtxddD7t1AyE/tCY/YwIF
 rjhEYRunQ/i/NgNeRaikXrhA1Z0K/xE+mBksb0cbxN3B51kxWuuz9wQdyWG82d0dw4L5Vu4K/GL
 vHhky77EDZ6c7oFo+zxzSv2/tXbG4pg4=
X-Gm-Gg: AYBFou1+Zgq2KMz1Clybt+zdCWpqQ46XxQu0hl1ex9632heHOtdRHnPufRM2Fhfk973
 npSEa7u2LXlXYsnnWXBB/WRP0j04vBiHeqIUV7BwrJlbQNTmD541VSH6/8GYy/hGqRlhTaYKwEe
 edS2OU67jmiHCI8UjeCuYUfysYCF2NLOLWmlZN7w/pLOVfv3lGGjE1/DErNAukpTe/5qvHPFE8h
 TBPZEBJHGJTryBZCwAGEtsT9fswHorNOfGRWuPaaAOoSdKTe5afp1osIvfoCskhUZdlJLzKNK0W
 7FZZaDZxixuWGVsuly8JOcJVCEHBtSJSH2t6bKqvVK9tCUgQFq9pvoMO
X-Received: by 2002:a17:906:4fc9:b0:c35:d261:636e with SMTP id
 a640c23a62f3a-c3667073d72mr183803166b.18.1791874626719; Mon, 12 Oct 2026
 23:57:06 -0700 (PDT)
MIME-Version: 1.0
References: <20261012-bmc-minerva-v2-0-4c3dff084ec9@free.fr>
 <20261012-bmc-minerva-v2-1-4c3dff084ec9@free.fr>
In-Reply-To: <20261012-bmc-minerva-v2-1-4c3dff084ec9@free.fr>
From: =?UTF-8?B?5p6X5bu65piO?= <jaminlin1207@gmail.com>
Date: Tue, 13 Oct 2026 14:56:56 +0800
X-Gm-Features: AclHuK-iO7GDPciJLqtJlVfRWCT89sEuQ5uPrEZdf-6ZUjsaLdfAwzuvIe1aHyA
Message-ID: <CA+8rw5ySLv3XbwcNwr2Rjj+6aSbAh_QX18O9ibr1iA1fUe=k1Q@mail.gmail.com>
Subject: Re: [PATCH v2 01/50] docs/system/arm/aspeed: add the catalina-bmc
 machine
To: Emmanuel Blot <emmanuel.blot@free.fr>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, 
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>, 
 Kane Chen <kane_chen@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Joel Stanley <joel@jms.id.au>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org, 
 Patrick Leis <venture@google.com>, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=jaminlin1207@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 13 Oct 2026 08:09:33 -0400
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

Emmanuel Blot via qemu development <qemu-devel@nongnu.org> =E6=96=BC
2026=E5=B9=B410=E6=9C=8812=E6=97=A5=E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=8810:=
55=E5=AF=AB=E9=81=93=EF=BC=9A
>
> The Facebook Catalina BMC machine is supported by hw/arm but has never
> been listed in the Aspeed documentation. Add it to the AST2600 machine
> table.
>
> While at it, shorten the document title. Listing every machine name in
> the title duplicates the tables right below it, and made the title (and
> its underline) grow past 350 columns. The machine list stays available
> where it is readable, in the per-SoC tables.
>
> Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
> ---
>  docs/system/arm/aspeed.rst | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
> index 2d51ceeb84..933df41f96 100644
> --- a/docs/system/arm/aspeed.rst
> +++ b/docs/system/arm/aspeed.rst
> @@ -1,5 +1,5 @@
> -Aspeed family boards (``anacapa-bmc``, ``ast2500-evb``, ``ast2600-evb``,=
 ``bletchley-bmc``, ``fuji-bmc``, ``gb200nvl-bmc``, ``fby35-bmc``, ``g220a-=
bmc``, ``palmetto-bmc``, ``quanta-q71l-bmc``, ``rainier-bmc``, ``romulus-bm=
c``, ``supermicrox11-bmc``, ``supermicrox11spi-bmc``, ``tiogapass-bmc``, ``=
witherspoon-bmc``, ``yosemitev2-bmc``)
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Aspeed family boards
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>  The QEMU Aspeed machines model BMCs of various OpenPOWER systems and
>  Aspeed evaluation boards. They are based on different releases of the
> @@ -33,6 +33,7 @@ AST2600 SoC based machines :
>  - ``fuji-bmc``             Facebook Fuji BMC
>  - ``bletchley-bmc``        Facebook Bletchley BMC
>  - ``fby35-bmc``            Facebook fby35 BMC
> +- ``catalina-bmc``         Facebook Catalina BMC
>  - ``anacapa-bmc``          Facebook Anacapa BMC
>  - ``gb200nvl-bmc``         Nvidia GB200nvl BMC
>
>
> --
> 2.50.1
>
>

Reviewed-by: Jamin Lin <jaminlin1207@gmail.com>

