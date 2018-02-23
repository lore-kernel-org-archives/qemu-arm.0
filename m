Received: by 10.28.71.27 with SMTP id u27csp484496wma;
        Fri, 23 Feb 2018 03:40:59 -0800 (PST)
X-Google-Smtp-Source: AG47ELthQZKDGxeAgXvhfu6O4ML8GY021mHx3XdDIUcKtaWKlqhF/MgZxYLtkaV7z0JyGexoRqhI
X-Received: by 10.129.212.76 with SMTP id g12mr702852ywl.142.1519386059461;
        Fri, 23 Feb 2018 03:40:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519386059; cv=none;
        d=google.com; s=arc-20160816;
        b=Uf9Ek63R9x4lA86YpnUADH0IjFLw+Dfbkr54P8NzFFdsXsM95DY+XCZHeehrlJGri6
         LKiIHAJ9xrNnLK2vrtkALVrn/2MS8MmB+t5io/yOYf3rBWONcPNWlEb/RBHRS10DsuPK
         e1rj3T2zBIlNqe0WB9hooQbv9LmvY7AQ/i3t+IYmG936MreDKEFlzUTSm9F/l8HuCjYC
         VNW1eycslbCshtTzAqVfg2qmxl8mKR+krWWPtA1uy9bmriOpJfemX1QfuCIt1WA3l0wl
         Rb8O4POxKk/O/iBDpr/07OUsba2bHvd6JYw8QFuPmqStFkL+1bFtVLLEd6LzJOL27diS
         4xNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=zwzhoOPpllavuW4lyToxS9OQLnWgiJGvqrg6pRDDzVE=;
        b=kM7cPAcssfprw8XbS7kX5mDV3Iluh75zbE1BhPYbQ/pA3IDLv4Vb+XmEh6YyCYL0L0
         GsKF74NqC7B5rLwnFVlkKK/AGd4RJbBMP3ncgH0pyDSihk+B6oI/hwoZxXzPVFvDN27v
         gGH89kDN5zpanSCRcEWvJ/aHufOQh38nSdMshpC0KIaBrft9ebU7xz/p73qjnV4fKGyt
         mUGj1okcSo7F8T8e6oxfvHipXO/z0ySLdRAGrkKS+mGqk80jUDQ6Y0yLz4sPgtOhwACy
         ehxonRCDmLBedFpysU5/wNTeqpZosOtGh5eJpo482V4kb/K/C/SCSDTSFi8t8WEqkQFD
         fW4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ihSpZGLA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u80si364624ywg.466.2018.02.23.03.40.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Feb 2018 03:40:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ihSpZGLA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43840 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1epBik-0006eb-RZ
	for alex.bennee@linaro.org; Fri, 23 Feb 2018 06:40:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37282)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1epBid-0006eK-UN
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 06:40:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1epBid-0005Km-1G
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 06:40:51 -0500
Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241]:39796)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1epBic-0005I2-QU
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 06:40:50 -0500
Received: by mail-pf0-x241.google.com with SMTP id c143so3406818pfb.6
	for <qemu-arm@nongnu.org>; Fri, 23 Feb 2018 03:40:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zwzhoOPpllavuW4lyToxS9OQLnWgiJGvqrg6pRDDzVE=;
	b=ihSpZGLAzLHOx2iBAFBNVyAsJ9DtcwlepmPAPimmJuKdEeBjZv1Wc2skNR0ZkJ9SXW
	TmsV3skqb+p5DBv+uA2v2zlfwuNDuJG43FFuBH3/Mg/jHVpkuNLstPNQVrnCeZSB3Ig3
	JJ0n7ymOCK5BLslmb+NiG0H7srywTeekKAGYI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zwzhoOPpllavuW4lyToxS9OQLnWgiJGvqrg6pRDDzVE=;
	b=ifgD6GORDVetKNQTNVdssEOXUlfcCybuic0iS9CQ71SIQADmImDsSwEpzGqoL8yBC8
	hhDE/YXg7xoTQ9YcQv6hOMxDqU1ndh0ctoRu7iJ+zZfl5dK+ecK80dWB1HXueDEApv3L
	1SDO7f3oYLgpM4FlI4BV7mSb1LU/A6pvMJo50aqYSZ0E88jqKAliEVPGnEXGwVhJ158M
	jjAV9TiAZYAPYLqdJxsfi+OzMUvZR7aXC61oomuDKFoajAlWrwq6w9FH+8hkLsRQX6+q
	Ukde/Efs2er+YILt4hnclAuFzXUj53JRoqvSN32rIEJKZda2WCyi/tjEKNZ32d6g8gZF
	RluQ==
X-Gm-Message-State: APf1xPAykmGLxOMGE+eY57A4wCLrDeUhiRcBFumGR8tGPN/2PEhi+JCP
	itO/fsXoMjAEfqkTZEL6vd2Ulbn901B8JW6cI0EGyg==
X-Received: by 10.99.149.2 with SMTP id p2mr1239166pgd.122.1519386049639; Fri,
	23 Feb 2018 03:40:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.241.10 with HTTP; Fri, 23 Feb 2018 03:40:29 -0800 (PST)
In-Reply-To: <20180217182323.25885-4-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
	<20180217182323.25885-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Feb 2018 11:40:29 +0000
Message-ID: <CAFEAcA8h-Y8_zDL1mQuZTarMqWo9LwDgvgwEmpPbmYLfBvtRyw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::241
Subject: Re: [Qemu-arm] [PATCH v2 03/67] target/arm: Add SVE decode skeleton
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EwvxzC04ZjSr

On 17 February 2018 at 18:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Including only 4, as-yet unimplemented, instruction patterns
> so that the whole thing compiles.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 11 +++++++-
>  target/arm/translate-sve.c | 63 ++++++++++++++++++++++++++++++++++++++++++++++
>  .gitignore                 |  1 +
>  target/arm/Makefile.objs   | 10 ++++++++
>  target/arm/sve.decode      | 45 +++++++++++++++++++++++++++++++++
>  5 files changed, 129 insertions(+), 1 deletion(-)
>  create mode 100644 target/arm/translate-sve.c
>  create mode 100644 target/arm/sve.decode
>
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index e0e7ebf68c..a50fef98af 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -12772,9 +12772,18 @@ static void disas_a64_insn(CPUARMState *env, DisasContext *s)
>      s->fp_access_checked = false;
>
>      switch (extract32(insn, 25, 4)) {
> -    case 0x0: case 0x1: case 0x2: case 0x3: /* UNALLOCATED */
> +    case 0x0: case 0x1: case 0x3: /* UNALLOCATED */
>          unallocated_encoding(s);
>          break;
> +    case 0x2:
> +        if (!arm_dc_feature(s, ARM_FEATURE_SVE)) {
> +            unallocated_encoding(s);
> +        } else if (!sve_access_check(s) || !fp_access_check(s)) {
> +            /* exception raised */
> +        } else if (!disas_sve(s, insn)) {
> +            unallocated_encoding(s);
> +        }
> +        break;

I realized while working through the rest of the series that this is
too early to do the sve_access_check() and fp_access_check(). Those
only apply to instructions which actually exist, so we mustn't
do the checks until after we've dealt with all the unallocated_encoding()
cases. I think you need to push them down inside disas_sve() somehow.
See also my comments on patch 8.

(We get this wrong for current AArch32 VFP and Neon, but correct
for all of AArch64.)

thanks
-- PMM
