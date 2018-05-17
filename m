Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp158554wme;
        Thu, 17 May 2018 09:03:33 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZoSJTMHMJQ/osvs35L160CFSjDxAXFwUmBReyau2WZyTQJgklF+3A0CdNz4VHnH8+HH8WwM
X-Received: by 2002:a37:6541:: with SMTP id z62-v6mr5266176qkb.430.1526573013814;
        Thu, 17 May 2018 09:03:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526573013; cv=none;
        d=google.com; s=arc-20160816;
        b=jsbMR2w2JLE+sBLPfBOzeYB5s3qvHrM0gAngeuLin6Qo6cT/EwgAYggDxKqdS4RJSZ
         G0Q/tDLOOQeJRfEtTE4Dmgdu1VzeV3rfo3keBd6OZlCwpHBhcc2+HG3PutR5rqFF6vNN
         A/nZCVRhLeMx6ZmhuVZvtiDAMH/ysIwhjtknulXFxwl+M/MH6JIu72PZBDqXR+lgwo1W
         MmnwypJg1K/Wm3UEMkz64Imaa9SDUrOBDvFrWgdprbfXttc5/Q7e/ARqKzt+ASKQ9V19
         CurZgE/Nwg+PGd18Jl6rtlaJG4hGOSdTjkzToCp2SizxQsK8WPQ59Mw+vebq07IdR+NB
         H+LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=0zKobgXuVgJnXVSv3Uh17+PJl+VQMhiNT6RLK6gjiNo=;
        b=f/FZ2GjgbEF4eB/DFcjc8zohv2jeSokr6fmJuB5TKoamdjyapKDu49abY2cPXuvVIN
         r8J8B6YqoBoi3o3YUX6FdE0Jnp5VplNoPEACZFaRJCqc0Q2olMDEA6VzMEsXnW2ewntv
         LPpocZ8LpSqzBS9a+3D9sH+cbTQVTslCSiipNA9v/DYJZg0VSg6dod9CunquDtvPfInr
         9E3og2DdMQBwrOvtSfpkNHf8/m6q0HCUTqu6xdMOQT9tgFlVrX1t9D4TEGKpI+OISV0z
         S1RhMz+J36zx+RmmS1/wdXmDZdoMNP+gYggvcjrNZtILye8kmgvLobD/rgfKA39ldZQX
         9KXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WGV9/CPY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u186-v6si4874757qkd.319.2018.05.17.09.03.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 May 2018 09:03:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WGV9/CPY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34289 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fJLNN-00031Z-3y
	for alex.bennee@linaro.org; Thu, 17 May 2018 12:03:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57419)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fJLMP-0002jk-Ug
	for qemu-devel@nongnu.org; Thu, 17 May 2018 12:02:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fJLMK-0002eo-5r
	for qemu-devel@nongnu.org; Thu, 17 May 2018 12:02:34 -0400
Received: from mail-ot0-x233.google.com ([2607:f8b0:4003:c0f::233]:46694)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fJLMK-0002eT-1Y
	for qemu-devel@nongnu.org; Thu, 17 May 2018 12:02:28 -0400
Received: by mail-ot0-x233.google.com with SMTP id t1-v6so5601593ott.13
	for <qemu-devel@nongnu.org>; Thu, 17 May 2018 09:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=0zKobgXuVgJnXVSv3Uh17+PJl+VQMhiNT6RLK6gjiNo=;
	b=WGV9/CPYKGb4hZ8kfaTwIp/2SnSGguuPn2rRk+/AesQ9ZsZJt2ooqmBAi0MgsL9rzV
	QUD+u/3aczf+sbQAeIuqwkV/ZOcqzjUQ4wsjNyIHm208StpaVUr/Vd4lUSXysCWRmkdo
	Er8/4VcQBZnMoAScwM0dRMNjShfTmFDhVE9mc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=0zKobgXuVgJnXVSv3Uh17+PJl+VQMhiNT6RLK6gjiNo=;
	b=uDrAGCOV4Z/wa9Afp+bKE3quKNS1Wfs64BCJSde9fOTzT8JiYjr1iIXofANHX39wol
	o/XuBSVKTlx2nPkZ3gU5U9QIq33Q0ffzB00k+VcnrbqFC99de8kPvF1uIK5lt2xMYCWH
	+vwMoO1ZmHwBc99yBCvwJ/po81civ1SzIlb5f4u/p5hRkHMUylPfHqLt+t9QAAKMpcaE
	jZYue6tLgGFTvLQGmlgpWTwu0v3o+wYM/wy3I1j27pG9HTFB1MkbGM4Q9wpKXQOBDUPx
	I/N2gU+NiqcKels2NnzGZFp/JU7wAwRmqpYJy7welAed4cBq4f8LsG5I9bIo17ltN5GP
	iW0g==
X-Gm-Message-State: ALKqPwcFoV5H1uxHtpT+nL+cRGuNyVVwHPHH0adal7XERv1ZwP+Qlnmr
	VvWQVi4JkGxV664A3W+4mcTLhnBaoXmf3ijeWFcNXA==
X-Received: by 2002:a9d:2625:: with SMTP id
	a34-v6mr4130351otb.308.1526572947105; 
	Thu, 17 May 2018 09:02:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP; Thu, 17 May 2018 09:02:06
	-0700 (PDT)
In-Reply-To: <20180516223007.10256-5-richard.henderson@linaro.org>
References: <20180516223007.10256-1-richard.henderson@linaro.org>
	<20180516223007.10256-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 May 2018 17:02:06 +0100
Message-ID: <CAFEAcA9QyVB4BBrtygCpNO_jroydUBM1oS8D7J7ahx0X5qmtkA@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::233
Subject: Re: [Qemu-devel] [PATCH v3-a 04/27] target/arm: Implement SVE load
 vector/predicate
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 53xbV9/6xFUz

On 16 May 2018 at 23:29, Richard Henderson <richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-sve.c | 127 +++++++++++++++++++++++++++++++++++++
>  target/arm/sve.decode      |  20 ++++++
>  2 files changed, 147 insertions(+)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
