Received: by 10.25.227.6 with SMTP id a6csp4302350lfh;
        Thu, 29 Jun 2017 05:32:55 -0700 (PDT)
X-Received: by 10.55.36.141 with SMTP id k13mr19312572qkk.64.1498739575086;
        Thu, 29 Jun 2017 05:32:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498739575; cv=none;
        d=google.com; s=arc-20160816;
        b=tjJR019lAjbmLlKf56dUr0QUKHNYxr9fKVO9AFN4PB4ZltAjOey2J6reKB3jh1Jsei
         s3Tkvg+c4OUowpvSO99L4sFRromF+m5Y8tOkuIoJhbUBXVxi3AFOMwnGH67/vTfMlm4y
         0x4c8cPKPl3AzxJC/1csXg6m+oWcZKx/UTYV1cRJIy3T9PEQgP9WpfnhlxdDuPUGk9Fv
         KGX9sDhIQtxQukyKa46+SDnOBI7WvOD58vrcEiyMFQz4zx7TsZz7VfYcdzOf2AJMZVaN
         2jr3EaUTpqlWlJ6AuVuqlnzNkYKPNuy8co1awbXKi9UtzLycACukuBdI+jRmk6hJd/uf
         xBKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=FX3pVPkc9rxYb76xtT4sQcrp3Zqfr1yVub6L1IYJodg=;
        b=fuoguCwlkM7aWtwePmmTgwvZJMSpW4xM12acTAUC39F+0cW0u8W+SYRWq0FRzP/8Fx
         qm/b+DGNpiRu6rIJczpbCtI+2ADpVa2u4SlNAJJu9KsY9cmpHtaEcosGvaLil7rieO7E
         VI2NSvFi3BV0Jr6Kviu/xDQChO/cyJb6CkApWYdgVWoKbSId1PRVkTF6ote3V22saTeu
         eYfZC+/vCvsxEHPPo+T9qyhOJTB9X6a0aoEEx83DE2DWf+u+sniXChibPNbpNaRpvcjo
         cr7d2gQLohfX+PSgeohbXopJbl2b8fzovabghqBj35lO0zBhrhuRAI3rpolO+BpZWcHD
         Bq6w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.b=Zr/OoElw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s6si4706688qkl.38.2017.06.29.05.32.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 29 Jun 2017 05:32:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.b=Zr/OoElw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38996 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dQYcu-0000QL-FP
	for alex.bennee@linaro.org; Thu, 29 Jun 2017 08:32:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60164)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dQYcn-0000Q7-Mw
	for qemu-arm@nongnu.org; Thu, 29 Jun 2017 08:32:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dQYcm-0001bN-RO
	for qemu-arm@nongnu.org; Thu, 29 Jun 2017 08:32:45 -0400
Received: from mail-wm0-x231.google.com ([2a00:1450:400c:c09::231]:38797)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dQYcm-0001aE-Iv
	for qemu-arm@nongnu.org; Thu, 29 Jun 2017 08:32:44 -0400
Received: by mail-wm0-x231.google.com with SMTP id b184so12925679wme.1
	for <qemu-arm@nongnu.org>; Thu, 29 Jun 2017 05:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=FX3pVPkc9rxYb76xtT4sQcrp3Zqfr1yVub6L1IYJodg=;
	b=Zr/OoElwR7uW4Bvx4+lUOOZg0DS2RKqlAXUIQszT9D4PS6iykklZhAhbdGRTaFEWch
	CC4eX7S43qZXQdCqQgdkaSoKwmWL+WZTbRVq0WXUQBNiDLcFUwL3pgrT7nFixe3fyuOU
	3f4CHgQkpGZ+jYk0NZlVQOLEnEEh0nMAQ+XUE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=FX3pVPkc9rxYb76xtT4sQcrp3Zqfr1yVub6L1IYJodg=;
	b=AZrnYbbyOBO+vlGLxZ7+6MoqM/9FPKM2sHgznh19NLkPiVUTqvMWA0SWRY39fBPf9D
	OqUuPrwiwUH0TKmAP4lAct8ZcIl6OjllwQ0Yu0GEpUReMh+j9O+Rb8rI2p6GDPCMD3zY
	JzEefXApyqTc8XtS6BnWYNfbQm1NGs2zKI+IJEsp1TRzIocourAuJMQHNGyfH6v2egrQ
	4J4VtCWTgdDs7bK/GsZwMdJ1Xv16Jy4QfCAandTxkvMb8wcPkORKGFLfo74OXXFzMM1m
	m4MU6T4d6bxCPCBXd1kbmnyiTJvJljAaGD2hyIEX8Xhi9VHDliz9ftNPN8/PUke5M+QT
	pZJA==
X-Gm-Message-State: AKS2vOx/bdPQIzxov+gKKym561bRRyiS8+wtOJXMuydkF5UpIQEEOKUV
	c/vpGgtO1AnrCRqaTjq5EETzmZJ6fLJhpmU=
X-Received: by 10.28.63.132 with SMTP id m126mr11594697wma.125.1498739563133; 
	Thu, 29 Jun 2017 05:32:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.2 with HTTP; Thu, 29 Jun 2017 05:32:22 -0700 (PDT)
In-Reply-To: <6c9540fe-9acb-c1ab-9f19-b59682b8fd4c@kaod.org>
References: <20170628114717.22349-1-joel@jms.id.au>
	<6c9540fe-9acb-c1ab-9f19-b59682b8fd4c@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 29 Jun 2017 13:32:22 +0100
Message-ID: <CAFEAcA9KJYgLL8aihcGhNxC47_h=6yAV193XgzFt7UJ7eEEdsg@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::231
Subject: Re: [Qemu-arm] [PATCH] aspeed: Register all watchdogs
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
	Joel Stanley <joel@jms.id.au>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Eu3Ynzgug8gy

On 28 June 2017 at 12:57, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> On 06/28/2017 01:47 PM, Joel Stanley wrote:
>> The ast2400 contains two and the ast2500 contains three watchdogs.
>> Add this information to the AspeedSoCInfo and realise the correct number
>> of watchdogs for that each SoC type.
>>
>> Signed-off-by: Joel Stanley <joel@jms.id.au>

Thanks, applied to target-arm.next.

> Reviewed-and-tested-by: C=C3=A9dric Le Goater <clg@kaod.org>

PS: toooling generally doesn't understand this sort of
ad-hoc tag, so it's probably better to use separate
Reviewed-by: and Tested-by: lines if you want to say both.

thanks
-- PMM
