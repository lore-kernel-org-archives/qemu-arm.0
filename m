Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp1531532wrq;
        Thu, 12 Jul 2018 08:59:07 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeKaYt8p4nrOaddfzcwhg9klVqt0L/xxi8Wy+DvWPE6uFGcMJd2FS7ZHPB6+jEGVfDvYrNA
X-Received: by 2002:a0c:9547:: with SMTP id m7-v6mr3002785qvm.138.1531411147352;
        Thu, 12 Jul 2018 08:59:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531411147; cv=none;
        d=google.com; s=arc-20160816;
        b=Wg8Z3CLkn+1aXPBb9ohN/KNylaljLoiWu8cI5WFpRbjOFNTWREJg/FZeWf9Y0j7gPq
         KyDn51Y5Xjl0PtSYwPY5KlkP95kHotydInyYZ8Pczm8f2L+NpdVUDE0IarygCKPw7403
         1hFEfUJsbfKgC5gC6cLr+i1wvbo/NNGBsCKnGINeWHERE3ti+bmFeqFJBwInuf38cctA
         FK593m8QMz/kbxPrxIjp4Ks3POAQS35REwpVuF9Xpp44zCwyP6PGClzWBH0ZcYbn38wj
         OVQ7JekpNbtp0Weie3miMQhg9MewIJKxt81PSKvgXaq0XpzroltkzlYjZwqXUQ62j/Uo
         TQNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=zTKyd57y3rqhRDnuEaxIzs4Bl+6HpWZoEzcyiaQKnZ4=;
        b=Ekz+IEQzq1M/8SIj03Qx8MPnLurF3GBEjMTZEnX7Q0ARLnl8fB+ke5HHJqCC39L3FD
         j2sPD0XccQrqRxSMT4PW7NQCovJTQMmIrDQ66Sf3IPZ9Jltac65v48x9KrdFYKBipwZG
         D83st2CeWE/Ysb3teblPn3Bxqd24ZqOdP6LxN+91iXQztnRy7B9EP6jtGCiA6bnEhQJu
         NUPPDSOnel0lSzVtAemtpbtUdS9i0UED2x8ujJveQn2tK+VYxu/e9VeCpHCs4L5ZxnBs
         Jm9UFmXxnOUfwqDr5GStTV/f2JSfDdgYnWgxmup0OTiCXT7PRmTNG7f3XM96xWrXDlyO
         uITQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MS25cc6L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x17-v6si555712qka.105.2018.07.12.08.59.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Jul 2018 08:59:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MS25cc6L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60945 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fddzm-0005Lz-UC
	for alex.bennee@linaro.org; Thu, 12 Jul 2018 11:59:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47227)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fddzf-0005L4-7B
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 11:59:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fddze-0005S8-Df
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 11:58:59 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:44306)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fddze-0005RO-9C
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 11:58:58 -0400
Received: by mail-oi0-x244.google.com with SMTP id s198-v6so56715168oih.11
	for <qemu-arm@nongnu.org>; Thu, 12 Jul 2018 08:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zTKyd57y3rqhRDnuEaxIzs4Bl+6HpWZoEzcyiaQKnZ4=;
	b=MS25cc6LqfXmSfuKAw3KV7XKK4qZOyrDZsgd4fa4E4A6u7V/ob8T32b63UTRrfISqf
	hwD9DJ2KvL7+xs8n02YPn8spZ+8KwKMlDMCUloqVFSRazPvTS9JYPSo1rkRS3hYMqFZc
	9hpcDSiZ/Fk/yUtIT9w0VW0di3NJDlOi4EOIc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zTKyd57y3rqhRDnuEaxIzs4Bl+6HpWZoEzcyiaQKnZ4=;
	b=Uv3+TEfANzYTAx7TQqQDMdblHxaXqCEORCO82dFrsPHoM1F5MQS7i7LF+IOiYaD/vr
	CadR7F3lDIlH6JrBPlCcTai8TV8HV3pearUYVtcX+NpNegnNNA6AnJ4m2SpoyiPt/bcw
	vUTFIvUfGUVinmk9DkzkFzm3tLt1qpegR3e8PEf/w/nPLROm2EEd3TS8uuH2R8Oeytlr
	4oAkQLiLMSpZmLh9aM8+odam3rPWj18u+/HQPTaZPnxi1L4kvQAno6PTL3vEFI5WUPDr
	2a2Ti0czfi/skdUxj/cckfWuDOZfYm0CoDuBTwrZf3KhXUNlImlCZToBlEVTnClG0siu
	aWVA==
X-Gm-Message-State: AOUpUlEn8k1C39T+aZneiP2O6YYUnAMeW842EF1gSaKJhnYJHaYMMXnd
	295uhBdkkBPc92itEZYiY0LK9Qu+LlKffvqAl26u8Q==
X-Received: by 2002:aca:a982:: with SMTP id
	s124-v6mr3110845oie.80.1531411137544; 
	Thu, 12 Jul 2018 08:58:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Thu, 12 Jul 2018 08:58:37
	-0700 (PDT)
In-Reply-To: <20180709143524.17480-1-andrew@aj.id.au>
References: <20180709143524.17480-1-andrew@aj.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Jul 2018 16:58:37 +0100
Message-ID: <CAFEAcA9GHFwscBzRGRbqAN+nWWYYbSZB-M0Kt+r=fFFG3xfm8w@mail.gmail.com>
To: Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-arm] [PATCH] aspeed: Implement write-1-{set,
 clear} for AST2500 strapping
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 24BoO2pGPIYZ

On 9 July 2018 at 15:35, Andrew Jeffery <andrew@aj.id.au> wrote:
> The AST2500 SoC family changes the runtime behaviour of the hardware
> strapping register (SCU70) to write-1-set/write-1-clear, with
> write-1-clear implemented on the "read-only" SoC revision register
> (SCU7C). For the the AST2400, the hardware strapping is
> runtime-configured with read-modify-write semantics.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---

Hi -- is this a bugfix suitable for 3.0, or something you'd
like to wait until 3.1 ? The commit message sounds like a bugfix...

thanks
-- PMM
