Received: by 10.28.71.27 with SMTP id u27csp2217467wma;
        Thu, 22 Feb 2018 09:31:08 -0800 (PST)
X-Google-Smtp-Source: AH8x226jhHc3n3u25A7v4jmZVhlBNXlipZfG9cJHN9fQvoeE4n31V8Flv2VgCm+x+piCBMsY5AhB
X-Received: by 2002:a25:6e56:: with SMTP id j83-v6mr5325286ybc.107.1519320668712;
        Thu, 22 Feb 2018 09:31:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519320668; cv=none;
        d=google.com; s=arc-20160816;
        b=Iw77oH7RoIgh5+ICAhK7Qe1HkwwqOmh9BtroDcfMINIYJsxDHJOQLIpqUYamgEhwR1
         RhxDGNJ+3QfJLv573jWjpHp5x+U2pFSKpYoj3B/Ir2peqoLwgWrZ4iFaHdNFy+zwP1Yf
         fcf/fR8kdfAUi/XI7aOIhn0K3bOjKFZ1mcQiHU+lsg1TP+On3+DOYyj9Qqif5AFoJCAz
         k8yYEzomgur83SQAffYMnmp+4f7NwYmXbY0R/e5W6NCvDOCLU2NzReMMOMMZMO6ZZWa5
         6gDwDH6LTRNUac4MUkMBGPzo7YC8jh9BRU8nY5Gy/A1RXPSPeJ5LvNWS2DPAOIaojeaC
         cf+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=Lqm+pV1faQsegBIP1vFif1MH84HnvlNuiXGYyhpAR0g=;
        b=BWLWerIrOJPvMr0E/vFUZKUT+pBOMVOlX2aFeP1GmpQ9QvjXJjZxBFcatbSV4rkDNK
         XGu0/uxmwxPxDb0LuoNEV1J7Ze/6VkE5setjeyLjQ41bZYcSDcg9sr1X3N3NlXDptlij
         Pjbth2Xpmrv3CkUZXqafc0rQpKnPOWSi8UEIb/nPn/q6fxjbAoDgun6b7WNe4I3EqK7M
         dXilPR+asQ1vwRRn5EVWrjNO3utd0Z77E54FVHd/EY2oYC1QkemhSphbmVJNNhE5NAyj
         rTCzoHvh9IVt/KwzdR7aillaGW2xhN5eWKPes7PI7yKAzxJEOhMI//Mm2JOJ/McPz1XP
         OUWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=h7CUpan2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c15-v6si84734ybn.178.2018.02.22.09.31.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Feb 2018 09:31:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=h7CUpan2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40151 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eoui4-00070R-26
	for alex.bennee@linaro.org; Thu, 22 Feb 2018 12:31:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60970)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eouhp-0006yE-NR
	for qemu-arm@nongnu.org; Thu, 22 Feb 2018 12:30:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eouho-0001oK-UC
	for qemu-arm@nongnu.org; Thu, 22 Feb 2018 12:30:53 -0500
Received: from mail-oi0-x232.google.com ([2607:f8b0:4003:c06::232]:39269)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eouho-0001nM-PJ
	for qemu-arm@nongnu.org; Thu, 22 Feb 2018 12:30:52 -0500
Received: by mail-oi0-x232.google.com with SMTP id t185so4259548oif.6
	for <qemu-arm@nongnu.org>; Thu, 22 Feb 2018 09:30:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Lqm+pV1faQsegBIP1vFif1MH84HnvlNuiXGYyhpAR0g=;
	b=h7CUpan27j5kAA9Dvvrxj6AawVRh9bMBb2R2ogQKUU8qvRdEfUDGGe0eEleR3Pg4Eq
	Z9JGoBtJRsJtvVCmMTJIRtS3qefCoKzNmnowqJOwquFJa+cJsixsUpdpO7Wf7pSwalmz
	lgCCqp3EIDZaKR1hRyWjXj8Yp7GL1QzvoKA6g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Lqm+pV1faQsegBIP1vFif1MH84HnvlNuiXGYyhpAR0g=;
	b=iQQJDaCOkvZxMbFqpRmSvZP9diPJLYlPNnisV6mvW3BBtliIzXED8wHI9sxnsBhxVX
	xIvwDfSbM8flCmo5HDZQ8XFgbL8jyQbuR99Mm0xtEXV1QPfjFWQ38ZITTZE0SHSGObrJ
	AgcE9sJgvSu46mcTgPipRWY+UX43htwDmHsUpTHl3pCTnnHQei41VT1Y3IAPiFWhTgx8
	us/32BrtUATrGavXYm16KrCEUqSn/HzIbdo34NKVENetCANCs1ex5picjPxZLvI7CNmH
	dh3Tqr8shvJW82LCdz1eAryRc64gNQjwDrniFR1IGCbj7SCauy0/a4jsUUrn4Uqb/+xC
	ttUA==
X-Gm-Message-State: APf1xPA4/YFdiHYHyInROXTAb7JbPUjOOvPUGhk7wxBnxgP070+GZkw5
	nQuy2QvEvAJf6mrabBqJIdNRixmA4RqjT0zeqFmlqw==
X-Received: by 10.202.17.13 with SMTP id 13mr4863737oir.164.1519320652054;
	Thu, 22 Feb 2018 09:30:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Thu, 22 Feb 2018 09:30:31 -0800 (PST)
In-Reply-To: <20180217182323.25885-3-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
	<20180217182323.25885-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Feb 2018 17:30:31 +0000
Message-ID: <CAFEAcA-PMKZX2D_T4RJ+htkPaTg9=MY2qrCMVmW5=kMAW9tLKg@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::232
Subject: Re: [Qemu-arm] [PATCH v2 02/67] target/arm: Introduce
 translate-a64.h
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
X-TUID: YsmHPngMYsFq

On 17 February 2018 at 18:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Move some stuff that will be common to both translate-a64.c
> and translate-sve.c.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
