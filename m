Received: by 10.223.197.9 with SMTP id q9csp6952740wrf;
        Thu, 19 Oct 2017 08:47:47 -0700 (PDT)
X-Received: by 10.200.50.230 with SMTP id a35mr2694506qtb.226.1508428067438;
        Thu, 19 Oct 2017 08:47:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508428067; cv=none;
        d=google.com; s=arc-20160816;
        b=At0wsrdbncyhBdzWXmHxc15vrzCGPg8DVIRlaER5iu6eheSQC/seQovcqvVtTLqGBs
         jgr3CI3dod1N4S3t3OdCVu8Ebv+oq0elBdmdjwr35GhWluy0qn1BzDG8iG2izAgvlme2
         4USZ7v5tPq7qJM/RbCitifUpJW7lWSaWf0U+7sKauYZXPQvhLds8yUwDW++YHGfBR8bk
         5gvN5Dy/9vR2D9DwS69bsTeVCnoszqdqB8ZxMRLjN594PGJx4T+DAd3reWY16oXjB7e5
         T3rG9Oy8b7O/f9gG23OrE12XCRJH8nmUsQfFEpvxfoShL1XcC6mVBChZ4Q/VCIVAnaWM
         5+CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=tpWKK/o4/0hNwgk5y9i34WYn25LWKfB4u3gYq9PDtjA=;
        b=bhHOV/0zFan5mVE0heE/vb/uoW4KA5j2QjE0vFfIWPGpbvx51YI5aoTjzvgHCxBAth
         8NYfAorg3m8uxA2ZOejgVBUZtWVVDFDAgpF0XzlSI5ZYbG12CByDPkATPm1pYKOoznzI
         gEB2/s3geBi3mxu2yh/fKTcCa7M1oOS/gsCmcLnDxbVdeSyFxkGDwcsaQ/4JAUaLfODJ
         sSm+TEgEqpr92cc80svfWjvxtrrYdH1FJN7gOy5k4zt25CxDAnRd/Z2nUEkQ2SnmqBal
         FQGNZcTYqNt6cBPhWj0LaNMx9DHHwIHamn2uqNB9xQI5A0QJ58lc6vAiwh8jf5BMuXOQ
         cW5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Xt5xoq2l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y185si1725541qkd.374.2017.10.19.08.47.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 19 Oct 2017 08:47:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Xt5xoq2l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49808 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e5D2v-0004d4-7n
	for alex.bennee@linaro.org; Thu, 19 Oct 2017 11:47:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46446)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e5D2h-0004am-VM
	for qemu-arm@nongnu.org; Thu, 19 Oct 2017 11:47:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e5D2h-0005sZ-7W
	for qemu-arm@nongnu.org; Thu, 19 Oct 2017 11:47:32 -0400
Received: from mail-wm0-x233.google.com ([2a00:1450:400c:c09::233]:52836)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e5D2h-0005s5-11
	for qemu-arm@nongnu.org; Thu, 19 Oct 2017 11:47:31 -0400
Received: by mail-wm0-x233.google.com with SMTP id k4so17288421wmc.1
	for <qemu-arm@nongnu.org>; Thu, 19 Oct 2017 08:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=tpWKK/o4/0hNwgk5y9i34WYn25LWKfB4u3gYq9PDtjA=;
	b=Xt5xoq2lDxQflJu7zSHIS8V0IbcmoLdfzQTU7sH1Y4p0a9OWU/TrkCRla3Xu5OW2rv
	EquC5NEDj6qjWcVmfQ8st/jHSgn7PPL1PUxNdUIYIgSuWsz5UdK/9ED5lt/BXhCGVKzn
	lm4UrVZvqSA5DOGXRC2PZNVcEnrOlg8DJcn5w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=tpWKK/o4/0hNwgk5y9i34WYn25LWKfB4u3gYq9PDtjA=;
	b=K5FsKVFC5AsTLwi+DYYLRDa4LOx80129B9ytd+lLR27yTG8vq2lwHE5GI00ffS3oF4
	oDpO+CqX6QnO8Q75EDYvXbTPaahwqlFUTDniiiAxYjrpS3d5mAETjRjFKvCsyeKfwowm
	1j2I92cWcPkQCxHqXfaeosD/3eX1ik1MgvCdL3/CoPxb7BPvtBGQMjT1Hb6gIVd4PPz+
	tBSS/rYZ2C8C1pfJZygQbAHOkybpEdArwh/cGIVQSj5+nJl3LUEU20j7dP9ESoOrIxbL
	ZxyNygHhvQT8mk002cNi4IpiQA1gbpfG/Y79kCGgt6Qowza5cJx9i+pCj5zpdEYRfyyX
	0FSQ==
X-Gm-Message-State: AMCzsaXvTWiLKi9/XP+BLHa9hcp76rmJEjB1XMyvnBC0WaKLFrqnAX3O
	BKNSh0To00zyv/kIroGSU7+AuzKDhNy+KSdjQuLxcQhE
X-Google-Smtp-Source: ABhQp+Rx8xsvEnNf3xV4i8pb36AD/ISrN2TzfXqvSGGRf9u8nUepvlHQmTU2u8sfDyHE7k2RqZunRIL9Pvu9BNfOCv0=
X-Received: by 10.28.36.212 with SMTP id k203mr1879501wmk.127.1508428049975;
	Thu, 19 Oct 2017 08:47:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.161.5 with HTTP; Thu, 19 Oct 2017 08:47:09 -0700 (PDT)
In-Reply-To: <20171019151249.13663-8-clg@kaod.org>
References: <20171019151249.13663-1-clg@kaod.org>
	<20171019151249.13663-8-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Oct 2017 16:47:09 +0100
Message-ID: <CAFEAcA_rmP=Ou50kJrWSF-ZgJZERoJ0gkt2+iV_xNO_hLFq7fg@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::233
Subject: Re: [Qemu-arm] [PATCH v5 7/8] misc: add pca9552 LED blinker model
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wmepmL78QqDp

On 19 October 2017 at 16:12, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> Specs are available here :
>
>     https://www.nxp.com/docs/en/application-note/AN264.pdf
>
> This is a simple model supporting the basic registers for led and GPIO
> mode. The device also supports two blinking rates but not the model
> yet.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>
>  Changes since v3:
>
>  - introduced auto-increment support
>  - removed the buffer collecting bytes on the bus
>  - improved reset
>  - used extract32
>  - added a unit test
>
>  Changes since v2:
>
>  - removed comments on the I2C buffer size, but kept the array. I did
>    not want to rewrite the buffer handling
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
