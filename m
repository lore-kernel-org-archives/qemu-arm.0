Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp3443047wrq;
        Sun, 24 Jun 2018 23:12:19 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcrW215TjyGGdFXGpZq/NIJpL05UhoCAXJ7tFyPfWX9Y6NAkBqzcZ8Alw0x84+AwZuU4sTj
X-Received: by 2002:ac8:1e87:: with SMTP id c7-v6mr9181353qtm.322.1529907139535;
        Sun, 24 Jun 2018 23:12:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529907139; cv=none;
        d=google.com; s=arc-20160816;
        b=zgwgZYtr79aMyBppN/Wv534RkFINJeQLOwcpXBRiOxFeVTFOGxF1LgTk4+pNDtddEP
         jXpgjWEncjVIBSf5uEWyVT74BCMFSEamzmNig5XPGZH8izaguijl1dtELRjg4OVaBwQG
         /U7d1mPku6oedVg84/MmJKTQGoqVF5p4B8XSpEvTpxkGvXf0aaI5GwVUMGcBwbpVXCI6
         /jezWFgGiFBBqVmEtv79oeb2qRzJ6nfKiFh2Qr8Uj/JnW+nTCyYhvi6w6jSCXpfEOdyI
         cSRnMz18H75OBxm0vWu7XzPAWNcnaKE0rIi/z93vCF3Ld6lTptHe74rdQj/CzLZZ+VGM
         cQKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to:date
         :references:content-transfer-encoding:mime-version:to:from
         :message-id:dkim-signature:dkim-signature:arc-authentication-results;
        bh=f6akxEBRTHDQhUDQIrns6wYK4PzZmgaw5LdMiwOlh+0=;
        b=oe7TNodMwScxBeZcZTh2qOQXkXhkucJcW3NO09D/1hrOBr6NjN4af2UxxUwFU/6D7G
         pUCxINh/2I6PBEB9C6biyGmJ2f0g8FCMgGjDMbXUDZ5aWJpomAvArZZ28m8CYf9/ZxAC
         rPFsHiQnuFFtbAZKepC1VoqLtkYuSBRy5H30ejEi8SVh7wyfJQCqkq5kG0Jin5sRuv5i
         T/PaFFmNSHXzNlMpcMg+7rTflV51Or/BSFViiCGj66we2+YBR7SXzQ6EwJpRInWxEOgS
         V8aahsZ7qdgP/21bi/kJIYt/UfmiOwgIeetr6+is2H1XAWtqztDXHTvUa0FHexAGT8gV
         P7+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm3 header.b=SE6VNRPK;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=vb6hB1jh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g134-v6si7181262qkg.33.2018.06.24.23.12.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 24 Jun 2018 23:12:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm3 header.b=SE6VNRPK;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=vb6hB1jh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44428 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fXKjb-0001pW-2q
	for alex.bennee@linaro.org; Mon, 25 Jun 2018 02:12:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56525)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1fXKjR-0001p6-FJ
	for qemu-arm@nongnu.org; Mon, 25 Jun 2018 02:12:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1fXKjN-0007uJ-5Z
	for qemu-arm@nongnu.org; Mon, 25 Jun 2018 02:12:09 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:41691)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <andrew@aj.id.au>)
	id 1fXKjN-0007u0-0L; Mon, 25 Jun 2018 02:12:05 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id B39E5212A5;
	Mon, 25 Jun 2018 02:12:04 -0400 (EDT)
Received: from web4 ([10.202.2.214])
	by compute4.internal (MEProxy); Mon, 25 Jun 2018 02:12:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; bh=f6akxEBRTHDQhUDQIrns6wYK4PzZm
	gaw5LdMiwOlh+0=; b=SE6VNRPKXTxInBlIhXuozE3qpvE/Rlcg/DJk+rTTVF87z
	mSznfNshM98ugOCWbPp3U6GK71oFNXqX2aD7RaLZ7PLW+CeA7E+thUb6xm1uqv9N
	3VLbZymP8T/xO1PKnzoQR4FE1R6jdZAwPW0umnU+8+5rmleDomnZldPey8mjHZsT
	//arsTrgDje6oSHXPBYCTd19vFlvvIgr9PnvLxQsZE4SRg4+Tuzgh9X6RivhOK7r
	Sli46bXDzS0ERvjZGND9U5fI5giQ8TTmE2fPcV2WItH6QkQOm6UEws3O1f0La0dq
	vsZ1Xj38O0BzVAJCNxtVmwAnCcml44an426C3cX7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=f6akxE
	BRTHDQhUDQIrns6wYK4PzZmgaw5LdMiwOlh+0=; b=vb6hB1jhmIYgMnSIjWW8jE
	0YfLe6UdBA8XH3LGgp/rmzJZsCTBWBdwnxT4j/aUAis+GoJL4SzRpaoiwfDYi09p
	LDbaJUpWDEfA8qn5/XbzKX5VBRCfMy1oDULfFYOPcxSNh+DTpHUD21JWrwJPGzUn
	TB/MFGwgj88JwCScUQifPqR+ysJvTTPrMKaCQpCIFh4LL2uVRvyOz9f0WAek8ZyZ
	mdCviR1aasUVR08pXZg7Vf+9/1yix5vfwHuZvUwRN37iVI2XPpTYjh1VovANJ7Vw
	8pBTTyXCzUIBJcR0Ft2LCMnrmFfvpSL8fTL1vOtGkFG6gSozBtbpuMl5/rqQ/dfg
	==
X-ME-Proxy: <xmx:tIcwWy3tiwJawvJ09BovUkX-Zy0LIyx8xLGqjdqNMkxYDKgGH3sTEA>
	<xmx:tIcwW5ZVvhVvJF6IaYvcwaq1RqJHp7o_ljOltKjz73AgJqMvCInPtA>
	<xmx:tIcwW6DnyxiuA3tapZTddZ3tpLBkljWtw-NtGWrHOjAO9gjyxDY10w>
	<xmx:tIcwW79WPbo5WLLryR8NcJhCFNz5o4t3dby_xvaC-1r8tZFu4PfWLw>
	<xmx:tIcwW6-Rnza2dIZagfC9KE9tYf4-uKz27hvDdNIFNBqM844V7q2iIA>
	<xmx:tIcwWwdHSq31V4MwyLb3AHVsKfs6XYtHJnOnyxsy8BaDG4rKQbJhvg>
X-ME-Sender: <xms:tIcwW7ARNP3bQJtcv1GAt8JqA4Ep-3AXOoG3q910dlyE_-6kYhZQ1A>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
	id 787DCBA43D; Mon, 25 Jun 2018 02:12:04 -0400 (EDT)
Message-Id: <1529907124.2296063.1419123552.7105E44C@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: =?utf-8?Q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-0d8ea36c
References: <20180612065716.10587-1-clg@kaod.org>
	<20180612065716.10587-3-clg@kaod.org>
Date: Mon, 25 Jun 2018 15:42:04 +0930
In-Reply-To: <20180612065716.10587-3-clg@kaod.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.111.4.26
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 2/3] aspeed/smc: fix HW strapping
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kHlX+R+bZrcL

On Tue, 12 Jun 2018, at 16:27, C=C3=A9dric Le Goater wrote:
> Only the flash type is strapped by HW. The 4BYTE mode is set by
> firmware when the flash device is detected.
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
>  hw/ssi/aspeed_smc.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
>=20
> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
> index fce126e6ee92..b15370893583 100644
> --- a/hw/ssi/aspeed_smc.c
> +++ b/hw/ssi/aspeed_smc.c
> @@ -639,23 +639,17 @@ static void aspeed_smc_reset(DeviceState *d)
>              aspeed_smc_segment_to_reg(&s->ctrl->segments[i]);
>      }
>=20=20
> -    /* HW strapping for AST2500 FMC controllers  */
> +    /* HW strapping flash type for FMC controllers  */
>      if (s->ctrl->segments =3D=3D aspeed_segments_ast2500_fmc) {
>          /* flash type is fixed to SPI for CE0 and CE1 */
>          s->regs[s->r_conf] |=3D (CONF_FLASH_TYPE_SPI << CONF_FLASH_TYPE0=
);
>          s->regs[s->r_conf] |=3D (CONF_FLASH_TYPE_SPI << CONF_FLASH_TYPE1=
);
> -
> -        /* 4BYTE mode is autodetected for CE0. Let's force it to 1 for
> -         * now */
> -        s->regs[s->r_ce_ctrl] |=3D (1 << (CTRL_EXTENDED0));
>      }
>=20=20
>      /* HW strapping for AST2400 FMC controllers (SCU70). Let's use the
>       * configuration of the palmetto-bmc machine */
>      if (s->ctrl->segments =3D=3D aspeed_segments_fmc) {
>          s->regs[s->r_conf] |=3D (CONF_FLASH_TYPE_SPI << CONF_FLASH_TYPE0=
);
> -
> -        s->regs[s->r_ce_ctrl] |=3D (1 << (CTRL_EXTENDED0));
>      }
>  }
>=20=20
> --=20
> 2.13.6
>=20
>=20
