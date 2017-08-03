Received: by 10.25.221.202 with SMTP id w71csp784476lfi;
        Thu, 3 Aug 2017 08:25:54 -0700 (PDT)
X-Received: by 10.237.38.132 with SMTP id q4mr2576084qtd.321.1501773954126;
        Thu, 03 Aug 2017 08:25:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501773954; cv=none;
        d=google.com; s=arc-20160816;
        b=YYzRB8PG2l90PfxSzq5mvVnTe4pTMtrOJFMBjgO+FL5/jZ6cRDuid8UJSz/lQjh6Rc
         gdB1ajwmZzc2eHloywZWvE+ygi7RmOLHYnQMmqs1++OjnU2D6QO36OzSAbz9jwxZLtBQ
         9FBWn3kY0G+oEwkEsoGbpVJKDEeGcBzmGjUXn5zQacTagbt5pNHbSCS3l09Fyq9L8HkV
         o0uPBHfbBFFfEj6JNZHsug8ZV1ztlTOkN19IWSHtxXU0DqeZaj7IFoIv9SU1r4s2hWT6
         A1EdXLgXXw+X+T6q3DejnxFg+kqf2hRY88aE1ODOBd7nIlah/1LxWJ76kpfrRJ/0ffxu
         Mdig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=ZMJDGhoar9DEU2DW/Ja26KkpDX6FHKusfAMYgt8JnP0=;
        b=pF+HHY4yTmR56R+VhmeBcpZMU8E20vyl7aaMiRX32bqkuwvaxoyI7E86Mu1RAHrUhq
         yKUSBf+1Pk6aLeplXUOLIL3PnDulRNkCIYNeWO6ZTFzXV57bDEScFFHZc23WwCzEQVyW
         MsVCR4jX+U9tJNXVVgqDapBTaGTwtwuCRqgoVGL3xwfOaHX9YYxJKP7MTRRdeRsc5O28
         36KB4uFfR0WC/a5IqEZihFqKm+13EsTObBXj5UUzm39XUOABT/g+W1ybY8EmGcReU3zV
         nYVYvsZ3e28TfoefrQcn7fhHHy9GW+qsUSf82oDTC2hLsRdQEx5sgiEA13xHICKp1gOD
         ndtw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=FSOtsNtN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x131si31363025qkb.217.2017.08.03.08.25.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Aug 2017 08:25:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=FSOtsNtN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:53218 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ddI0V-0001YE-C1
	for alex.bennee@linaro.org; Thu, 03 Aug 2017 11:25:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36949)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1ddI0S-0001Xs-8r
	for qemu-arm@nongnu.org; Thu, 03 Aug 2017 11:25:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1ddI0N-0001vW-EI
	for qemu-arm@nongnu.org; Thu, 03 Aug 2017 11:25:48 -0400
Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242]:36418)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1ddI0N-0001uw-6G; Thu, 03 Aug 2017 11:25:43 -0400
Received: by mail-lf0-x242.google.com with SMTP id t128so1169441lff.3;
	Thu, 03 Aug 2017 08:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=ZMJDGhoar9DEU2DW/Ja26KkpDX6FHKusfAMYgt8JnP0=;
	b=FSOtsNtNGW4hgi2wQF19krpIlMiLFRPNyLUgfod2dFAS6njPq/RruWwOAsnZBAvmeP
	gqzlBLCNKFDveEnmeT3+okvjyInBfOia3uYbNJUEsqmyORCNFX+Jax8UffxzZphUVL7J
	WwcZ97bC8ScOKRLwHl2kNU4xIySjMT5pltG2WHhOIPB8JmKzaAUFVVq0UJzl1pZJO3HZ
	TN3r2azokakuubF/qChBw4raEBWXviaffHg1usIVgN+6PsRl9n/oPC5lKmVUrTQkCDgF
	KGCVdsxeXTsGJw9HzeNQ1/faTugT06IkS/GnE92oDWOq6YqttAsXAVu1ivwvVom5dUh3
	/W4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=ZMJDGhoar9DEU2DW/Ja26KkpDX6FHKusfAMYgt8JnP0=;
	b=anx/TiChXdR0aqR0vprSwwda8XBfDVSsT8rgjcWNijrvaT1hn29QH4Io+TLws9Um2T
	uoJYZlK3nixgSKlzAjJzY0tJ3ma2QYWN5shpP7mGGE8qOOMSMIfT5IZiL+t4KKpEFwyF
	Z1DVA53yt+UK2VycK/C1SktSMwn2UX1qlsPPn+yPdG+IDFzA7EBGMpIUMXWCfdJsgM23
	8Wjm2TawCzJ+fSovl9plZmVQVS4aduEomlB+6fXWp0APKuoKv3U5m75SBJXE5W9NgXiy
	oNd2UTtSAT6Lx7nLSBJkBzUqA/NIJj3Pq1qsCtUW38EjUcljXf2tsj5hrJAXmjIa+Msl
	cWvQ==
X-Gm-Message-State: AHYfb5joQS0COXG99p8oMwNCzHaGj5bohJJZ5M9UxluoqoeOK7nJOItK
	6ED4yXb4xUs5kNgs
X-Received: by 10.25.77.213 with SMTP id a204mr790413lfb.215.1501773941953;
	Thu, 03 Aug 2017 08:25:41 -0700 (PDT)
Received: from gmail.com (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
	by smtp.gmail.com with ESMTPSA id t23sm447097ljd.40.2017.08.03.08.25.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Aug 2017 08:25:41 -0700 (PDT)
Date: Thu, 3 Aug 2017 17:25:40 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20170803152540.GP4859@toto>
References: <1501692241-23310-1-git-send-email-peter.maydell@linaro.org>
	<1501692241-23310-8-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1501692241-23310-8-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 07/15] target/arm: Fix outdated
 comment about exception exit
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IkezCHkC5Mqu

On Wed, Aug 02, 2017 at 05:43:53PM +0100, Peter Maydell wrote:
> When we switched our handling of exception exit to detect
> the magic addresses at translate time rather than via
> a do_unassigned_access hook, we forgot to update a
> comment; correct the omission.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> ---
>  target/arm/helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index fd83a21..cb88c66 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -6143,7 +6143,7 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
>      bool rettobase = false;
>  
>      /* We can only get here from an EXCP_EXCEPTION_EXIT, and
> -     * arm_v7m_do_unassigned_access() enforces the architectural rule
> +     * gen_bx_excret() enforces the architectural rule
>       * that jumps to magic addresses don't have magic behaviour unless
>       * we're in Handler mode (compare pseudocode BXWritePC()).
>       */
> -- 
> 2.7.4
> 
> 
