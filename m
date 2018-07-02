Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp3590243wrq;
        Mon, 2 Jul 2018 05:25:34 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdKTutYF8vbxGHrrD0TzBRQin+UWqjrgB6+G3NzGk7M9NbCCmGGxhsX5hobsyUcaA5Va0Xy
X-Received: by 2002:a37:2fc6:: with SMTP id v189-v6mr21773791qkh.433.1530534334632;
        Mon, 02 Jul 2018 05:25:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530534334; cv=none;
        d=google.com; s=arc-20160816;
        b=UWLF2rCbN7Utp7RIbsGFwnorUUF24WsK0HeJcG+AKCg360ZpsT0YlptuiAeO23DiIq
         SBeA2qVV9/0yLyuwkntB4cPtoEEAPTaYfePDTeK9C5SLme+8d6cytKIi3cemCUhWNtfX
         2MUakSfkh+foVgDD7SATbAO+tfcbRrsUS9F/wpE/Xxud8Ql9yugjGHw3Bfc2DJfDT5PQ
         MNYSWf8a7NnnXXF1oMIncfaiL8os7LOd8aBDlNrOsMWrjNnQKlLsHBNi+UVjwHy4g65b
         SCYJZ/Fq4ju7fOxkrO1uFCCjzVSxMg2ANX4RNxdeAW4P9iIqlqWUDdozM1pAmPvZvF4S
         9ZSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=c4Y5YTkJT5RnC/4rtI5ft9um4yv9eeuH+5zBSf78iW0=;
        b=024mQe1lYm6Wmy14YPn30IbZhNQxdirLIkm5M4IiVlPfquDmcIPI2x1QIN3JwHcG4V
         5j9D7w1tz+Qs9DA2pZaU6Z//77ensijWAnZ+QnfJY5XP0mR0Ed7kK5tEUT6nIZNwNg7B
         B3sBLGi2Qx7o9u1wvA6AGQ7uByhF7c+yiEVNHxdxZCI/M2sm7BfGkFQ3SRiq+AIxUfLO
         gBuwvlP1v92yC0WuEP7uSO6lleuB8Vjgs6pDw2Cwq2CypioUHPnUZPUYOrghspwrSEnx
         dNrVGhi8C9XSnqaYzBQqXg4uWR1hb3IDpMKalCSUp2ClemkoEWK6qPMWn12yhjZZ21to
         UP2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=pd2qxw5f;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e2-v6si998557qvb.179.2018.07.02.05.25.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 02 Jul 2018 05:25:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=pd2qxw5f;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60730 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fZxte-0003lj-1l
	for alex.bennee@linaro.org; Mon, 02 Jul 2018 08:25:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57290)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1fZxtO-0003la-RX
	for qemu-devel@nongnu.org; Mon, 02 Jul 2018 08:25:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1fZxtJ-0002yQ-TG
	for qemu-devel@nongnu.org; Mon, 02 Jul 2018 08:25:18 -0400
Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243]:54473)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1fZxtJ-0002xe-LM; Mon, 02 Jul 2018 08:25:13 -0400
Received: by mail-wm0-x243.google.com with SMTP id i139-v6so8814937wmf.4;
	Mon, 02 Jul 2018 05:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=c4Y5YTkJT5RnC/4rtI5ft9um4yv9eeuH+5zBSf78iW0=;
	b=pd2qxw5fHf8qPX41xLzSC/64pTS9oGWcDDkmCYeWt2muuh+nJ1QNRSkkyGpdf1ahDL
	jPIrbfhWmobzcDVRVI29SzqVan2Uw8aFFZLCUaFuFFZuvTzTXt5LCEmEh7S2xuDucOBc
	rWb8uGiarYdr65P5G47nulCap1AHoHSHFTy5sMBU8c9bDkgR+8H+BJEH9bImw8HptqXh
	vzCNpKAtJ7b2CUra3JAYtWIFKlqBWh/0ybK+lCtIjpbetMYCe/sMZ50XmHPHQVnTcOdL
	k7am9td4WJjaojxMT5prkEJEqe21QGnHpits4nMRFnPot3Z155AidhUIcl5f0TPPMFA5
	WLIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=c4Y5YTkJT5RnC/4rtI5ft9um4yv9eeuH+5zBSf78iW0=;
	b=Ga2izk5jw/1O8M8vv7tGVvOHHrDq3z4Fvw/T2TigKr2V69aETcMtGMYFGCtj+gieae
	3V9KbcAmtlxlDyUIfYR3IagHW5klVKx8JZVcTPcYEc8YgD7cr/QdOYHVk/Qf+tCy3w4n
	tnFbQK0LjHemg/5bqhG3XH3UTk4ER/AGN/U9oY4+pxn9AqIjzH8E+Jn4UXl+pBrPxZhU
	9fi6966htmzkoC47anio52HNaRn4UVeShTgTAEpxWprrd0jWtSfuFgxo6FXkye4qaKW8
	ZGDe+ryxvGOd9YqJIHy4KrF78bmXNPfyNy440XVteI8Ki19dxbkg8DbnC3KcJzF0Ft7c
	ndhQ==
X-Gm-Message-State: APt69E3+fcFWH5njUtxmaBScRmJV9Gw0STanQGRU9oKUzbip2PIznHqS
	w5aOxVe+iJA672Oxrraox7k=
X-Received: by 2002:a1c:3e41:: with SMTP id
	l62-v6mr7929113wma.55.1530534312631; 
	Mon, 02 Jul 2018 05:25:12 -0700 (PDT)
Received: from localhost ([51.15.41.238]) by smtp.gmail.com with ESMTPSA id
	q14-v6sm14443294wmd.20.2018.07.02.05.25.11
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 02 Jul 2018 05:25:11 -0700 (PDT)
Date: Mon, 2 Jul 2018 13:25:10 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Joel Stanley <joel@jms.id.au>
Message-ID: <20180702122510.GB2155@stefanha-x1.localdomain>
References: <20180627143815.1829-1-joel@jms.id.au>
	<20180627143815.1829-2-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="neYutvxvOLaeuPCA"
Content-Disposition: inline
In-Reply-To: <20180627143815.1829-2-joel@jms.id.au>
User-Agent: Mutt/1.10.0 (2018-05-17)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::243
Subject: Re: [Qemu-devel] [PATCH v2 1/3] arm: Add Nordic Semiconductor nRF51
 SoC
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Steffen =?iso-8859-1?Q?G=F6rtz?= <contrib@steffen-goertz.de>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	Jim Mussared <jim.mussared@gmail.com>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FRckSSe/+B8e


--neYutvxvOLaeuPCA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 28, 2018 at 12:08:13AM +0930, Joel Stanley wrote:
> +/* TODO: Flash size should be defined by the board. Microbit uses 256KB */
> +#define FLASH_BASE      0x00000000
> +#define FLASH_SIZE      (256 * 1024)
> +
> +/* TODO: Flash size should be defined by the board. Microbit uses 16KB */
> +#define SRAM_BASE       0x20000000
> +#define SRAM_SIZE       (16 * 1024)

Making FLASH_SIZE and SRAM_SIZE properties of the NRF51State object.
Then microbit.c can set them.

> +static void nrf51_soc_init(Object *obj)
> +{
> +    NRF51State *s = NRF51_SOC(obj);
> +
> +    memory_region_init(&s->container, obj, "nrf51-container", UINT64_MAX);
> +
> +    /* TODO: implement a cortex m0 and update this */

Please see "[PATCH v2 0/3] arm: add skeleton Cortex M0 CPU model".  It
should work with TYPE_ARMV7M -> TYPE_ARMV6M and "cortex-m3" ->
"cortex-m0".

Julia is currently completing the Cortex M0 emulation but at this point
guest software may already run successfully.  If not, then the patches
she sends over the next week or two ought to do the trick.

> +typedef struct NRF51State {
> +    /*< private >*/
> +    SysBusDevice parent_obj;
> +
> +    /*< public >*/
> +    char *kernel_filename;

Is this used by anything?

--neYutvxvOLaeuPCA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJbOhmmAAoJEJykq7OBq3PIYsoIAMk7THEXPxeSMgk+Bry8E1/c
V919F6xt1URYGA0crVnZvOpI1qqLCxbCLY42mwnYzp1WWDeOclYuDhI1WpQso42e
IoSAOTb+GmeRW+nPYzoqPw6ERzFtWkVlIymSUnq2zIvdTyA+rSv5FurES4wHL5LZ
jIoDb6v5OBarT9eFumwfR4LDn/QfRfkOaPOU6b4Ah7uHnkKVhuEuPwKsC0tldyqy
manmB5l5Qh457RCVwl7r/RU19JIC2hF+n074IYGPI38Ugtry/HsL54cxzv3XWAfo
jLwTVPJDO/pp9sEfXoZWPXjHDS8og3hzvkMK3KY2C8Yc7hGONapj5QlzzhXI9GY=
=4Jmd
-----END PGP SIGNATURE-----

--neYutvxvOLaeuPCA--
