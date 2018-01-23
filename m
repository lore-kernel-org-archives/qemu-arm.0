Received: by 10.28.71.27 with SMTP id u27csp10134wma;
        Tue, 23 Jan 2018 14:48:29 -0800 (PST)
X-Google-Smtp-Source: AH8x224d0Nu8vsI4vd/+CVPDiDMin7NyiM0Y6bHV1I88i1mGJHwOAQmBofor/Pg8eDHA5/vaxawK
X-Received: by 10.13.220.3 with SMTP id f3mr3936524ywe.288.1516747709173;
        Tue, 23 Jan 2018 14:48:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516747709; cv=none;
        d=google.com; s=arc-20160816;
        b=KvynJSt+cLcEbN47mJMu7EOK/1R4PnUoY87C1mviaCThUrqTYo+YKYPECDO/E4MLer
         dnnoWQ3cMZGBy9V6g55wEYD3ztSjTq9QzA8mIPP/9aLdSksas0a41lipJ2dL2Tbq0RBv
         N8Rzxjf1Mvs++RCuwoIQ2vpagdnOwp4A1v302HwbDzrJELCCUV+tOEEtx16ZsTHI4Wuh
         Q2iNfkGlm/6WdtH0KtlvkTFGoGBcTfXf+t1L0WXICguGQm06UwyPaWu9xm5yIksrXx6o
         BtydMehCWfo7yTVRUJ2u95Jfp82WdSWOr+qEEEDp0HD0yq6Mq2JoYDTZDEzAxtG3isNT
         istA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=bHxcgPojW9EkJ6BH7yHTm5fYZw+AFhByKeMaJFghdX4=;
        b=CYGzve/0eIk2A20MXBDlKTrlXUXGm7lSkGq8aPoFZc3WrVL3EqJiheVWxAA01ST8PN
         WFPm1zwyhGlWEMpOCOeNzB4f0CE3gFnO89iBd9xfYYyRQG50e+h+e/NJ7JjqL51jAuMm
         nytwSeqQ8nOfbp+rA82u+1fYAOMejsZR2/reV3JMA6EIcy989YHRpHEOzV4HnMy9nvV2
         o1aTj5caCVAZflUeAnR5fhF772K4U1QKwO7JgkxtmNU0Dam/20Ye9cIMd2mnlvfDFT+K
         33Tgze0V8w1NvNqtW8rNpOlIfFK3sct80W+3nkd/8E+zK26N1eBxaUdBNRHnkUhidKWK
         Q/Cw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ukTcBNrz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l128si2512257ybc.761.2018.01.23.14.48.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Jan 2018 14:48:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ukTcBNrz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58731 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ee7Mi-0005MX-H8
	for alex.bennee@linaro.org; Tue, 23 Jan 2018 17:48:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43079)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ee7M1-0005KR-Ht
	for qemu-devel@nongnu.org; Tue, 23 Jan 2018 17:47:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ee7M0-0005Gz-Dw
	for qemu-devel@nongnu.org; Tue, 23 Jan 2018 17:47:45 -0500
Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241]:35020)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1ee7M0-0005Fm-40; Tue, 23 Jan 2018 17:47:44 -0500
Received: by mail-lf0-x241.google.com with SMTP id a204so2696657lfa.2;
	Tue, 23 Jan 2018 14:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=bHxcgPojW9EkJ6BH7yHTm5fYZw+AFhByKeMaJFghdX4=;
	b=ukTcBNrzAkBIRUk4ZbJW75kUhtU/K6c6TpqPOi6bUfvdCTe2Ei6NAmekrHvmLb1XcR
	6Jg+KArXFjAbZhgixGxzwX70sZoG3QJMTH3gYKG0jyHpzjvMYwlNmUYozvolkEBYcNNK
	fO7by0APHvIVv7bP6khrLX+7PuXfP4Bug+UF0TxgHX4G7pX3eNaPOWrO5cwZYD86AKfC
	/OuyWHhK9Z0vhi8AtfNtTbBQE1ItJS7HjKYbCLXqGd9tza0c2d/BDKQkJNuk4r8Jvo2/
	pZXczaafg44Zrqja5PuLJcB1wsS9L9uZJxuIQBN+yly0m39yEPSYJlfWluZxlDYa1Lli
	FreQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=bHxcgPojW9EkJ6BH7yHTm5fYZw+AFhByKeMaJFghdX4=;
	b=p8jUVwah+g+ysOgF7d5FUqy/mv9mAu1PKOcMNzYdK79pbFoos7br7uAbWke6l8xLxL
	Ng3UdbXsTA1PqE2883darscvm7oufhyF1pffL+JiGqX7Ba9xhdRkXOgAi1fZ1ewwLea7
	cIJSol/cM07TIq1fIFVwOhKolhTcmoGGzJcoEBaluvOsrF4fM6G0KUqMnHf60ipK4HfI
	zgmp2+23uKxNqYnl1jp4FJK2CLjFO7UBKBmzIpv6H+W6IRzfXYWGlH3SCJdChmlDB/ah
	Z8C/c8SWex3SHm3U/4W5hC0M25WIiF/HmsD2+Fi2kt6In9/XWfKboce+VMUbsD5BFkyr
	90bg==
X-Gm-Message-State: AKwxytdYq0Ui60QkywwuKLlAUbFbxmNuUKrZSFmTL+9q3K12cNSGjsQ4
	bXaSlVL8e+HgueTWx2I8hXwFBRbwBUZ7y4OTeWY=
X-Received: by 10.46.77.193 with SMTP id c62mr2324346ljd.148.1516747662845;
	Tue, 23 Jan 2018 14:47:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.46.45.10 with HTTP; Tue, 23 Jan 2018 14:47:12 -0800 (PST)
In-Reply-To: <20180123030630.26613-12-f4bug@amsat.org>
References: <20180123030630.26613-1-f4bug@amsat.org>
	<20180123030630.26613-12-f4bug@amsat.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Tue, 23 Jan 2018 14:47:12 -0800
X-Google-Sender-Auth: RQ9v3zfCAik6ueJmahAFxTvt9vs
Message-ID: <CAKmqyKMOEK-KzTc3V1-Og6WB2zMLPQT8M5XhrW-Y1Ht_BnLgPA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::241
Subject: Re: [Qemu-devel] [PATCH v8 11/14] hw/arm/xilinx_zynqmp: enable the
 UHS-I mode
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
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Sai Pavan Boddu <saipava@xilinx.com>,
	"open list:Xilinx ZynqMP" <qemu-arm@nongnu.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1Ou8MZ+hECkZ

On Mon, Jan 22, 2018 at 7:06 PM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
> see the Xilinx datasheet "UG1085" (v1.7)
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Alistair

> ---
>  hw/arm/xlnx-zynqmp.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> index 33d5fe53d8..bb4265a4ce 100644
> --- a/hw/arm/xlnx-zynqmp.c
> +++ b/hw/arm/xlnx-zynqmp.c
> @@ -394,6 +394,7 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Err=
or **errp)
>           */
>          object_property_set_uint(sdhci, 3, "sd-spec-version", &err);
>          object_property_set_uint(sdhci, SDHCI_CAPABILITIES, "capareg", &=
err);
> +        object_property_set_uint(sdhci, UHS_I, "uhs", &err);
>          object_property_set_bool(sdhci, true, "realized", &err);
>          if (err) {
>              error_propagate(errp, err);
> --
> 2.15.1
>
>
