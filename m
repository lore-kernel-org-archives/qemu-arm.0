Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp2139457lfe;
        Sat, 21 Mar 2020 06:25:59 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvKfotsp4LTnu64SbDTywEfw0lt16fJkrzfz3n7aR+Ct19QnMWDhU5AFbNueG3WfFRFffRS
X-Received: by 2002:a37:9a54:: with SMTP id c81mr12893885qke.185.1584797159338;
        Sat, 21 Mar 2020 06:25:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584797159; cv=none;
        d=google.com; s=arc-20160816;
        b=c+k3OlV6gMwK8qbpCGsw2p78JB4KXUWevStn26Ua/0EVm4MSmVM6TSnanCYMZyEu14
         /FDuxZQrQZUrRuGNxn/OVf4M4Fh3QHU8rlfsH3yPPUhMNs9rKTmgOH1cHj8FSSQab5kh
         7O3v40XfurhYH7/EMl6L2I5iUXcJI5fkqqONumVc4RXUSpJcWeozpTab8OyHhlNd2BrE
         MawN8HwheQTC5POZ8BjTeFQ9upOIp3TE7kuhnJkQZa2Lf9n8v+zbKY5p0Sz0h4VmBrMQ
         o6h+CJzcD+8ZByFyQWAt3tOdPfsELqhSgpzJeApI3T2Fe3s+kHIMdsnGf8W84Onr3ZOW
         lfLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :references:message-id:in-reply-to:subject:to:from:date;
        bh=aSCk1Z67c8uM0M7EaHg0DuXHNGs4/gJC538HvQTzOd8=;
        b=V+qvFL5lpqO5e/Ik+5RQ9wV4Qehw/KX775qMfJejjMEDa0+OlcOwqDXZDEBwo2F14I
         ztiTyNPwRXxJT++x8sYgS8u+ZPz8TljlgmuoP1QUBfQGzb4Z6ADaTXFPV+beCTNMiUMa
         v+mlCW6HHgaix+el97zgao5F1MggbCyuo/BEh8w8/HHKARPBqWUjpMdkMTrFrKvp3Y1W
         sy/dpxUWtl0kXGFrCHXnu6UaxYMSBJgid+2K2hX3Cs2QI40kk5qTrHhVTWHlcT27ocAT
         yehOufOBxZkKEX9DOoXha3Y5zCTcZs8YsWYo8xylSFyawcDlJwJg7ueHD7WPb2Tq/xgO
         bjxw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q144si5610920qke.32.2020.03.21.06.25.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 21 Mar 2020 06:25:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jFe8U-0004k6-PF
	for alex.bennee@linaro.org; Sat, 21 Mar 2020 09:25:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48881)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <balaton@eik.bme.hu>) id 1jFe8K-0004hy-SD
 for qemu-arm@nongnu.org; Sat, 21 Mar 2020 09:25:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <balaton@eik.bme.hu>) id 1jFe8J-0007iy-9B
 for qemu-arm@nongnu.org; Sat, 21 Mar 2020 09:25:48 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:33896)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
 id 1jFe8J-0007gn-2x; Sat, 21 Mar 2020 09:25:47 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 458BA747DFB;
 Sat, 21 Mar 2020 14:25:43 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id A10F274638A; Sat, 21 Mar 2020 14:25:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 9837D746381;
 Sat, 21 Mar 2020 14:25:42 +0100 (CET)
Date: Sat, 21 Mar 2020 14:22:16 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH-for-5.0 07/11] hw/gpio/aspeed_gpio: Remove dead assignment
In-Reply-To: <20200321114615.5360-8-philmd@redhat.com>
Message-ID: <alpine.BSF.2.22.395.2003211420450.82121@zero.eik.bme.hu>
References: <20200321114615.5360-1-philmd@redhat.com>
 <20200321114615.5360-8-philmd@redhat.com>
User-Agent: Alpine 2.22 (BSF 395 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-224705287-1584797142=:82121"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2001:738:2001:2001::2001
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-trivial@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 =?ISO-8859-15?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, Andrzej Zaborowski <balrogg@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Max Reitz <mreitz@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fJbVsTFKi2Qg

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-224705287-1584797142=:82121
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On Sat, 21 Mar 2020, Philippe Mathieu-Daud=C3=A9 wrote:
> Fix warning reported by Clang static code analyzer:
>
>  hw/gpio/aspeed_gpio.c:717:18: warning: Value stored to 'g_idx' during =
its initialization is never read
>      int set_idx, g_idx =3D *group_idx;
>                   ^~~~~   ~~~~~~~~~~
>
> Reported-by: Clang Static Analyzer
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> hw/gpio/aspeed_gpio.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
> index 41e11ea9b0..cc07ab9866 100644
> --- a/hw/gpio/aspeed_gpio.c
> +++ b/hw/gpio/aspeed_gpio.c
> @@ -714,11 +714,11 @@ static void aspeed_gpio_write(void *opaque, hwadd=
r offset, uint64_t data,
> static int get_set_idx(AspeedGPIOState *s, const char *group, int *grou=
p_idx)
> {
>     AspeedGPIOClass *agc =3D ASPEED_GPIO_GET_CLASS(s);
> -    int set_idx, g_idx =3D *group_idx;
> +    int set_idx;
>
>     for (set_idx =3D 0; set_idx < agc->nr_gpio_sets; set_idx++) {
>         const GPIOSetProperties *set_props =3D &agc->props[set_idx];
> -        for (g_idx =3D 0; g_idx < ASPEED_GROUPS_PER_SET; g_idx++) {
> +        for (int g_idx =3D 0; g_idx < ASPEED_GROUPS_PER_SET; g_idx++) =
{

Is declaring variables here allowed by coding style? Shouldn't you only=20
remove init value from above?

Regards,
BALATON Zoltan

>             if (!strncmp(group, set_props->group_label[g_idx], strlen(g=
roup))) {
>                 *group_idx =3D g_idx;
>                 return set_idx;
>
--3866299591-224705287-1584797142=:82121--
