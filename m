Received: by 10.28.71.27 with SMTP id u27csp50350wma;
        Mon, 19 Feb 2018 07:26:24 -0800 (PST)
X-Google-Smtp-Source: AH8x2252u90JnK5a27eToWz27W6IBAVVGrwm7W4XZ83GpzC+0MZtHqc+G5MQZLx4sz76OkhJIMIt
X-Received: by 10.129.155.66 with SMTP id s63mr1120861ywg.285.1519053983980;
        Mon, 19 Feb 2018 07:26:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519053983; cv=none;
        d=google.com; s=arc-20160816;
        b=Y6oDmRxQjS9B79EGfpUXTjUXlmAWbgYX9eUPq+OxiylRYRprQ6Psv4yPwqhYpCT9KQ
         QJw+JI8VIjakSimNFDBbAAxPMUDmzBQ/pPm8T/NNRlEwnc9SxbytqXwdcitxRYNVjh7/
         XgRnsAEXueDyyZhlKoxREL1I1YDjN0r8bwIz5PxdTJoLxXlPkVJKgl7msE8LoB8ndwV/
         y77h+FU1NWAx9RvMBqM4gMQo9HvpcaZlD2x9ngLlIHH9cy31UoaowmlPgt+uXICtJ46n
         Kw+PmZR51PXjOOu3RqJQpKkn89UGZQryigWsBdyzmyYpbodwl0Uo7CMaZVrpZ81WKtbL
         TCYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=nWVqOnyeW4Qh3kSNBNsY6Amw0LmachCfqiilQtKYqoY=;
        b=tbJV1M0bwH4IsmY1ImMFEEuNWPHEkO6Jq4kWLL0v06cu6l/4XgTv1HLVKNCdZZe73f
         ms2cQ125dUf0YANf81S7RObm8jz1z1Lg3HKT5n9G3gnZG6w21R6YlBGTmOCT1yiwhph6
         yF0pIMcOwpvKW0mubNO89naDBRtmkPp0rnTC+hZwdkJTlSN1O+hPDZQXssDeeE2tpBv2
         g420GKZCib9hD2kc9agxkcIbIJTs/KEYlOkgJqE52xwQMIetTK123uksxlReu0TYuQxL
         Pk901nwHvH5oX/jziaKNOM63XJYOCOlG500Qlr9csQSqJkvHNUBKww5ktSdf2GmHh1Z0
         sJnw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YxGaD8RV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d184si3185421ybh.829.2018.02.19.07.26.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 19 Feb 2018 07:26:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YxGaD8RV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50829 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ennKh-00071w-Bu
	for alex.bennee@linaro.org; Mon, 19 Feb 2018 10:26:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53547)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ennIs-0005xZ-Lo
	for qemu-devel@nongnu.org; Mon, 19 Feb 2018 10:24:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ennIr-0002Eo-Ug
	for qemu-devel@nongnu.org; Mon, 19 Feb 2018 10:24:30 -0500
Received: from mail-oi0-x230.google.com ([2607:f8b0:4003:c06::230]:36666)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ennIr-0002DZ-Oe
	for qemu-devel@nongnu.org; Mon, 19 Feb 2018 10:24:29 -0500
Received: by mail-oi0-x230.google.com with SMTP id 24so7320468oij.3
	for <qemu-devel@nongnu.org>; Mon, 19 Feb 2018 07:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nWVqOnyeW4Qh3kSNBNsY6Amw0LmachCfqiilQtKYqoY=;
	b=YxGaD8RVTB/azwDANiYVzMbgXV2J+vuaVgFi/gGSgUgPUwwmvaHE7UDbkHi+/IXz3U
	RZxYqkLncv25NGVSqoO6Q4YW3uf/8FCBtym5Nxbt7Kkfw4E/jWqDfU/WJDHoDZ2uzmvP
	PDGTEhI5i6PgWpsND/2IwKB7ECVWB7+j+Ejq4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nWVqOnyeW4Qh3kSNBNsY6Amw0LmachCfqiilQtKYqoY=;
	b=HDIClNnrdBZLO8z/mtmRlDrBQmNLotOx9WEbV3Yg5ttIaY9l6UU4XR+2wYICG/UGr1
	2sUwPvrBXsyCt3XgR9qabO43p6FZl8wEdjzvOPebo48XykgFXlEjh9/LQXuBnVFItDJQ
	siPJ5apsigVCEPDF09skaDHyfD1djmXbTESoxiFbhIrVe1NjOjrzXLlOsjA7cv9d+Msg
	dy74I9hNNw/TR0x0dYYI9M1Z1/qBgRxhKe0uRKUFo6Tb0W81i50OXQVM8+roOPbXHedr
	LaxvdnjDqtD2GRhtMwKgASRm7J49CZPV+yby2ROTLr/pdTlaBMaw9gAMpPOQiHeRc4wr
	VIPw==
X-Gm-Message-State: APf1xPC5Ary3JVx+A91MdvZWntvOfdYHEJ1dV9/EXLNuGFbVIeGCVd2+
	6k3fxsojDgpfgPSHlmm6Fbfsvko2+lE8CxUCJPqQAQ==
X-Received: by 10.202.95.68 with SMTP id t65mr2433338oib.102.1519053869130;
	Mon, 19 Feb 2018 07:24:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Mon, 19 Feb 2018 07:24:08 -0800 (PST)
In-Reply-To: <1519053606-9817-2-git-send-email-minyard@acm.org>
References: <CACRpkda9B=frmS0QF429p-q+KoCKG=5NON-kQ0Rt-nba2powRA@mail.gmail.com>
	<1519053606-9817-1-git-send-email-minyard@acm.org>
	<1519053606-9817-2-git-send-email-minyard@acm.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Feb 2018 15:24:08 +0000
Message-ID: <CAFEAcA8viPEkdJru0Yfr9B0SNhNpwPtM14Ctx=8HqHmtOEjutQ@mail.gmail.com>
To: Corey Minyard <minyard@acm.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::230
Subject: Re: [Qemu-devel] [PATCH 1/2] i2c: Fix some brace style issues
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
Cc: Corey Minyard <cminyard@mvista.com>,
	Linus Walleij <linus.walleij@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XBaq1ZtZCKjo

On 19 February 2018 at 15:20,  <minyard@acm.org> wrote:
> From: Corey Minyard <cminyard@mvista.com>
>
> Signed-off-by: Corey Minyard <cminyard@mvista.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
