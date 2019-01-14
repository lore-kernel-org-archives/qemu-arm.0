Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2612945wrt;
        Sun, 13 Jan 2019 19:30:09 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5TuRIUcxVmU1C7zlUDsSbwf8i9mo4xSHd+T2yevTGdKDCxSq1s5AbA4CkBmPvhh9GUCm0I
X-Received: by 2002:a7b:cf30:: with SMTP id m16mr10590109wmg.22.1547436609842;
        Sun, 13 Jan 2019 19:30:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547436609; cv=none;
        d=google.com; s=arc-20160816;
        b=cfsP4deHUCc/UqByV1Qt+oPH+3VgSLsbzzZcDpI06wbMua2kL90gG+vdi2Qn8mv388
         z0wBX87PGPmtvQVQ24mdwbi3f3rXhhimoL434NFuzo3WtmQ1Pl1AAJLYwlSvclSsVQjS
         Jb6gneJdxbocXgPWI8n9oTB/cHYtl6JAip3UKrMVRrm40W6a0nzNji+TMlVWQMUQHceS
         t1PNQjTf94ctAM8YbbhrB9bQvNx6vOrJ4WE/au6jTe/HX6BWLBw/D1CBf/hZw5yJgFSD
         32Dqv8hC+y2SWA66lgp24q9OmLTvP7AzcUar2htJtU84P+wOHnXf+P2DGR50JTjAjZoy
         dkDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=fKnVW4WjE+2/Rdnf26z+9hWuFj4rtvn8BKEumzNcUNI=;
        b=k9KWo1HbiiW0OKiprZGwgoi6vBcAzlKjNRyeZX4cR+x7SvTS7Cw31EfOuiVLW5ikE3
         YfcZ0UauFZFKV5CkMVdDDU0Lul8+JjqT9dBcYNnznf5e/NzTZdHULfADQkzzAqv2J9eW
         /YfKPKBLskXIQOfXdhnLHzEjuX7twgtj14zZ+Pk/yYvGvtIzjeO9UoQapmDnRo8P8/Mr
         2+ffb35oqSujx3+Pfu9QNPhOFKQkp3rC6BfLEFxy6UBmOcgFj8aXuIEn8xFxFtYK+tOK
         uVaSrE55Zb+T7ydpRnoB4sR5Ui3S+b8IxAl6iA9nco6NCYzq7WyBOhXSoQXPIvWNyTY4
         2r4g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=VwnjEuJY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h25si17566836wmb.160.2019.01.13.19.30.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 13 Jan 2019 19:30:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=VwnjEuJY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:36920 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1giswy-0006hN-Vv
	for alex.bennee@linaro.org; Sun, 13 Jan 2019 22:30:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57569)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1giswY-0006hE-CI
	for qemu-devel@nongnu.org; Sun, 13 Jan 2019 22:29:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1giswW-0004v6-Ss
	for qemu-devel@nongnu.org; Sun, 13 Jan 2019 22:29:42 -0500
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842]:39861)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <joel.stan@gmail.com>)
	id 1giswW-0004tx-Iu; Sun, 13 Jan 2019 22:29:40 -0500
Received: by mail-qt1-x842.google.com with SMTP id u47so25133074qtj.6;
	Sun, 13 Jan 2019 19:29:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=fKnVW4WjE+2/Rdnf26z+9hWuFj4rtvn8BKEumzNcUNI=;
	b=VwnjEuJYa1sP4Nm/lHZiFTrYLSYJQuXPUXsQYtIOswDUeVtb2cDT0ns86tWrLjMA91
	uKZV5kK08hkC4y8EnpMW8dRKu3cOTcvf36iAJqeyKTfS6fvM6ZMLnbOcp+olTnQys0Ws
	HqweJvysChpozm67qg/BusbMWzZb95Su0on7c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=fKnVW4WjE+2/Rdnf26z+9hWuFj4rtvn8BKEumzNcUNI=;
	b=bG1E2lscBhb2/F2rgegJYArg/iMRm1hHATWNlrMHp3Ye7cgXkQzLDBSJrKBMoul/xc
	NpVBNXPnC4y9UCMuRF6F5Ne+Q+XPByQagcH/xWYZhmoVxDkcBfj3uIn1GUhbZ9bDwXiP
	ErDIFstEF5rbIQZet/+T+FR5eFhUfIacHE7CFQd8lr/rsEHaIa3K8s3BcJ7rZRrc2Lfz
	Ysalk5D9MTBokGvVWEoBNVbRMeH19VL1FY0YOKlJeuo9itDK+xOypusMxSIfNatXtd2m
	03CmoCkpl/0FQNqDN6Sao/+fuK2so0UWRcFR5gsjJDSgszJY09dwCfkr3WWHICZeHc8Z
	fNpQ==
X-Gm-Message-State: AJcUukdNOEWfWHVxCFv3dhIFbE1ULB540xikIZeCkzzuAcuEfock2n6A
	wpKSYSOAoaHLzesiLI9dNZRTQHknTBHZZaz6cQg=
X-Received: by 2002:aed:2764:: with SMTP id n91mr22614628qtd.37.1547436579063; 
	Sun, 13 Jan 2019 19:29:39 -0800 (PST)
MIME-Version: 1.0
References: <20190111125759.31577-1-clg@kaod.org>
In-Reply-To: <20190111125759.31577-1-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 14 Jan 2019 14:29:27 +1100
Message-ID: <CACPK8Xdp8hCYCqWrVQeRuK819-EmNCuWJwF1jGSJfy5RzMUsXg@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::842
Subject: Re: [Qemu-devel] [PATCH] ftgmac100: implement the new MDIO
 interface on Aspeed SoC
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
	Jason Wang <jasowang@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Qv3SbA1CWWct

On Fri, 11 Jan 2019 at 23:58, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The PHY behind the MAC of an Aspeed SoC can be controlled using two
> different MDC/MDIO interfaces. The same registers PHYCR (MAC60) and
> PHYDATA (MAC64) are involved but they have a different layout.
>
> BIT31 of the Feature Register (MAC40) controls which MDC/MDIO
> interface is active.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  hw/net/ftgmac100.c | 80 +++++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 68 insertions(+), 12 deletions(-)

> @@ -269,9 +281,9 @@ static void phy_reset(FTGMAC100State *s)
>      s->phy_int =3D 0;
>  }
>
> -static uint32_t do_phy_read(FTGMAC100State *s, int reg)
> +static uint16_t do_phy_read(FTGMAC100State *s, uint8_t reg)
>  {
> -    uint32_t val;
> +    uint16_t val;

Unrelated?

> @@ -336,7 +348,7 @@ static uint32_t do_phy_read(FTGMAC100State *s, int re=
g)
>                         MII_BMCR_FD | MII_BMCR_CTST)
>  #define MII_ANAR_MASK 0x2d7f
>
> -static void do_phy_write(FTGMAC100State *s, int reg, uint32_t val)
> +static void do_phy_write(FTGMAC100State *s, uint8_t reg, uint16_t val)

Also unrelated?

> @@ -711,14 +771,11 @@ static void ftgmac100_write(void *opaque, hwaddr ad=
dr,
>          break;
>
>      case FTGMAC100_PHYCR:  /* PHY Device control */
> -        reg =3D FTGMAC100_PHYCR_REG(value);
>          s->phycr =3D value;
> -        if (value & FTGMAC100_PHYCR_MIIWR) {
> -            do_phy_write(s, reg, s->phydata & 0xffff);
> -            s->phycr &=3D ~FTGMAC100_PHYCR_MIIWR;
> +        if (s->revr & FTGMAC100_REVR_NEW_MDIO_INTERFACE) {
> +            do_phy_new_ctl(s);
>          } else {
> -            s->phydata =3D do_phy_read(s, reg) << 16;
> -            s->phycr &=3D ~FTGMAC100_PHYCR_MIIRD;
> +            do_phy_ctl(s);

I assume the guest code programs the correct phy mode so this will
work fine. This change appears to keep the existing default of the old
mode.

Did you give this a go with both -kernel and a u-boot mtd image?

Looks good to me. If you feel like splitting out the unrelated changes
do that, but I'm not fussed either way.

Reviewed-by: Joel Stanley <joel@jms.id.au>

Cheers,

Joel
