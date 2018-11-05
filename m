Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2855590wro;
        Mon, 5 Nov 2018 09:29:14 -0800 (PST)
X-Google-Smtp-Source: AJdET5cp1OoFpz5jZzrDltjP7qviYCitQDSoaxn3BZTJ0wGNHVAVjvUsLAIT7qgny2fk/3IkzoR9
X-Received: by 2002:a37:380b:: with SMTP id f11mr20933874qka.309.1541438954298;
        Mon, 05 Nov 2018 09:29:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541438954; cv=none;
        d=google.com; s=arc-20160816;
        b=LDF6tNxS9NfSzRPYla/SQZnvCBDZp59ph94yRyyzR+IIiMBRJKtCft0DREMPUil3up
         aXq1QGnkvaU3CUqAVkoh592W/TpnTvL6LAnVpJDKUiShdQMW2YRiHg8knP7xnV+a7aJN
         2iXEjo3eLUBkQq+hml789mEawPJE/MfoBOsND7mu+T6lJsFB/DiwDe880+1I8y0A1V3l
         VU0XuinUEcYB2n+yr+6c1S4oe0zq3v3YqK0hOAkqNbxZZETYJZnK448DDLEF9cZSSRfn
         U2eBemBqRLksqQ8YjRfb9BvytBUUFgnG3z7ug9f4iC4Y6ihg/dfX4MJz8Ae38Gt0G5Xo
         txeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature;
        bh=yXHiuzGlZO1eKUM/E/EboWmntKiWwhAUvIYoin9carQ=;
        b=ba6dmWS0MQbq5aXp4+XfXp+f79p/ed5XD2Es7XoG9T6BF6MkhzEktj33j0TptvdH99
         UVYFtORRE4/NGHgv9265GnEUOtEYP6r72/O0/88wEpxFDejZsCRRwnmZcdYBEX+9U02a
         iErLDjERR8UYUaFPnexW/D8LlYpWybSJHFDxLxLxMwW2328DJIdjAbvDak2mfy5HOxMt
         Yk7bPxuvBkHug28s5rQevXKKfT8mUS9+RginF8EVbnqQMyeeDisf2z5mcrVovQA5DekE
         hA7osGc0OFi9sWXyPYlF8kU2KHLbs55oofnXidoYjWF0Lryzgl/0fsIZLhq5HATb12Ry
         4jdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jjdK+cMM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j6-v6si258510qth.245.2018.11.05.09.29.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Nov 2018 09:29:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jjdK+cMM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36575 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gJigb-0008Cv-I2
	for alex.bennee@linaro.org; Mon, 05 Nov 2018 12:29:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35058)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gJiPF-000500-4s
	for qemu-devel@nongnu.org; Mon, 05 Nov 2018 12:11:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gJiBm-0003Bk-Nv
	for qemu-devel@nongnu.org; Mon, 05 Nov 2018 11:57:29 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:44860)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gJiBh-0002wW-4L
	for qemu-devel@nongnu.org; Mon, 05 Nov 2018 11:57:18 -0500
Received: by mail-oi1-x242.google.com with SMTP id k19-v6so8053693oic.11
	for <qemu-devel@nongnu.org>; Mon, 05 Nov 2018 08:57:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=yXHiuzGlZO1eKUM/E/EboWmntKiWwhAUvIYoin9carQ=;
	b=jjdK+cMMVEQAliRNgFxeJPWNo4ddghJBwugaz+pkiZgJzq+ofYWTWblB8Z3z0S1iEz
	AgDhU4B1Jo8QHdU8ndCSgpQ/tgqwJa8d8F3LokqYLhUjV9OdnQKzAEfgNkKBxjAr5rZf
	zd/5/CvsvjJNclyFw+TuAr6AyRWqWQOvb3ffA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=yXHiuzGlZO1eKUM/E/EboWmntKiWwhAUvIYoin9carQ=;
	b=cMWFbY9MRseSCou+NsnoddqmHMtWUFXRn8lGH9UPoRVH9YNHium71ZUK9ZK1Azl9Gt
	94rPNCGjxLnvMB6chKejTwoj3PpsDOs5uz9fCN47VUVrfe9u6WrH6eAIMR3Tln2dwk9B
	BMm+lxBt/SW98oY2wprRD5qR/RxwaNbbyAs5p78W7T6ZC0MJv7kIqJ7G7a1AabDrRNqm
	xtq4uzPSd96D4mA5Ru1LED2ARQIkVGReKwKUT3vC+8/HmRcRxQsfqAgkeApxL7tv/57c
	70v3gCH2PzqHg3fUY6BLig+oBIpX8Ms1AREgH+WKDomJ6QRWxhpKziZCIRoWY1iWgjs4
	gYiw==
X-Gm-Message-State: AGRZ1gIjXTUyIRBKGK4cyZeZENQ4+73uB92pkMf5ddHtOA2CZJNRFvqw
	7VRZCad7E9d1XGGN7nLyIoSWe5g29o1dhI3OCXkjTA==
X-Received: by 2002:aca:c509:: with SMTP id
	v9-v6mr12449465oif.48.1541437034604; 
	Mon, 05 Nov 2018 08:57:14 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:4b0e:0:0:0:0:0 with HTTP;
	Mon, 5 Nov 2018 08:56:54 -0800 (PST)
In-Reply-To: <20181102170730.12432-13-contrib@steffen-goertz.de>
References: <20181102170730.12432-1-contrib@steffen-goertz.de>
	<20181102170730.12432-13-contrib@steffen-goertz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Nov 2018 16:56:54 +0000
Message-ID: <CAFEAcA8mW6PehY7NVDJ0G+B6aU2ChpmijgAfmvo6j+YiLhnj5g@mail.gmail.com>
To: =?UTF-8?Q?Steffen_G=C3=B6rtz?= <contrib@steffen-goertz.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-devel] [PATCH v4 12/13] arm: Instantiate NRF51 Timers
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
Cc: Jim Mussared <jim@groklearning.com>, Stefan Hajnoczi <stefanha@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"open list:NRF51" <qemu-arm@nongnu.org>,
	Joel Stanley <joel@jms.id.au>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1lYCx8onH8iH

On 2 November 2018 at 17:07, Steffen G=C3=B6rtz <contrib@steffen-goertz.de>=
 wrote:
> Instantiates TIMER0 - TIMER2
>
> Signed-off-by: Steffen G=C3=B6rtz <contrib@steffen-goertz.de>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  hw/arm/nrf51_soc.c         | 27 +++++++++++++++++++++++++++
>  include/hw/arm/nrf51_soc.h |  4 ++++
>  2 files changed, 31 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
