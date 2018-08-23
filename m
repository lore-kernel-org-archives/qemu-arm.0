Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1433465wrd;
        Thu, 23 Aug 2018 10:43:18 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdY2MLHcuSW+IDexd9SSPfJhsByVrRJWlpfriZ0LqX8E/WE3Zgk4zpWn2luQCCNRiaEsYFA+
X-Received: by 2002:ac8:5056:: with SMTP id h22-v6mr18323170qtm.71.1535046198145;
        Thu, 23 Aug 2018 10:43:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535046198; cv=none;
        d=google.com; s=arc-20160816;
        b=bnsj0bDugZRPKo5MWVDhVa5W2z5hOnYyNuANSy6/jjE0pb/qEZvTiyX/M8Z2fdAvR8
         nl3xjG5kaxMR+XISCaSRgjVx+sIxGXtxuRK+Ku7VOvf0qXYuqWsyEVHrplznkiPnM3jv
         nrutZj9SsXRvSeDOlknFWBQEZij4f1gNhFmgz7R4lOQgqp2H3t118gilGmcfONnwzFrz
         wfME/Fp28RAP2LX5cqS569ie+nRaKFF7g9UIcbwocrbp2zoX6LJ89W3kDoY+gUfZfA81
         0sDB6M/3iTHKE2p18gNSoY1RX1ufm9UwkL0W5+GtM1U35Gn2gu6swoIY1qSAgKHlykQB
         KOJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=ynatbzHljmFPy9KGzeK1gvouyTWoSRkibaGYlkOaMLk=;
        b=dFCWsNPwLZMdgvxVCcTfZlksYqyCbak8oCaz5lkQXcCr3icEpb3OUPkb9cIqdJPPJ6
         g9l0HghFYZKrwwy7TVkuz9zJ3GLpCDbWy7PAyASW5fNg0Rojz+SAVISFLsHT9RJJICD4
         P2HyBAXncybMm59EyVgCoxN6bv6THfCwf/ZxehHQhrYODJ72tkystveN3LDxI+v9OX2n
         QWUg+R9asi2AFe6CxPBckGQAep5tTWMRwxdIpkVmDk8pYfpyZUqOR5+5Esa7orlS7K8O
         NZmJbq+8gkaOAXW0kY91J2Ez1tQy3c4xlgOheQ3E2xsGOWQJ7/VMDlxMy32EWF24gNMo
         CG1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M6WJtN28;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l25-v6si4077262qtn.267.2018.08.23.10.43.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Aug 2018 10:43:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M6WJtN28;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38078 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fstdd-0002AG-JI
	for alex.bennee@linaro.org; Thu, 23 Aug 2018 13:43:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46324)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fstJ4-0002oX-F9
	for qemu-devel@nongnu.org; Thu, 23 Aug 2018 13:22:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fstJ1-0004ZE-9d
	for qemu-devel@nongnu.org; Thu, 23 Aug 2018 13:22:02 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:44381)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fstJ1-0004Yb-27
	for qemu-devel@nongnu.org; Thu, 23 Aug 2018 13:21:59 -0400
Received: by mail-pf1-x429.google.com with SMTP id k21-v6so3104050pff.11
	for <qemu-devel@nongnu.org>; Thu, 23 Aug 2018 10:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=ynatbzHljmFPy9KGzeK1gvouyTWoSRkibaGYlkOaMLk=;
	b=M6WJtN28gNZykIqHgaBLgOvDJaiNIPgFBkQNlsrbTO8HurERscwrIsWXsjm/QH3deN
	TNlMPO94Ef8RSTBCZ9BDPBl1KnwsPD4RRcjtxlT/kHFj+K2mG/QJSnNHFah/4ivTRAiP
	gLY4Y+XWEU8q8YOU/pr+qsGzmnRATXeh+HeKU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ynatbzHljmFPy9KGzeK1gvouyTWoSRkibaGYlkOaMLk=;
	b=qdV1g3JKjQiMc1YjuOjIb9IUxaMnPQkUEfMsd7nnPWMtQd2znievB5u2iaIbiqaRro
	aP5LludBwRUX4zbCGzdslcIhsj33iuUeo3n4RCjYThxkW9hFyx1rG5srWoWVqdPCXZaQ
	xvndw3L5w/l+XVi0KAkVjX4mKXZtPLO+Mi5+L7zm+2ZVcMX7vaZ6YzsdFeMJOtMM9Ygk
	EHWX8wI1CnhqV81/E7u5R1DTvhAXpXJ7aTSDOgRqYPfU0ukEw1utn5zDhgWWtaZQmJCb
	Tnl+jGMbnL6vRyGcRVVnGtHCznaO5fJLHSdlblkePfjqYxTfZt/0D8Ikpw396/scYyX4
	fmZQ==
X-Gm-Message-State: AOUpUlEfXPsuXjwrOQkn9qcO+D8lswQ4rix2LwcCS2fDPpbdxwtY1ozJ
	m5gkkD58tSa22LRuoz9r20IQPw==
X-Received: by 2002:a62:c0a:: with SMTP id
	u10-v6mr63757155pfi.43.1535044918066; 
	Thu, 23 Aug 2018 10:21:58 -0700 (PDT)
Received: from cloudburst.twiddle.net ([50.225.49.40])
	by smtp.gmail.com with ESMTPSA id
	h4-v6sm11488886pfe.49.2018.08.23.10.21.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Aug 2018 10:21:57 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180820141116.9118-1-peter.maydell@linaro.org>
	<20180820141116.9118-13-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <6a28d02d-b5b0-62c1-47b7-fd1bcb4779c4@linaro.org>
Date: Thu, 23 Aug 2018 10:21:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180820141116.9118-13-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::429
Subject: Re: [Qemu-devel] [PATCH 12/22] hw/misc/iotkit-secctl: Wire up
 registers for controlling MSCs
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ipxz9oDzL8LJ

On 08/20/2018 07:11 AM, Peter Maydell wrote:
> The IoTKit does not have any Master Security Contollers itself,
> but it does provide registers in the secure privilege control
> block which allow control of MSCs in the external system.
> Add support for these registers.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  include/hw/misc/iotkit-secctl.h | 14 +++++++
>  hw/misc/iotkit-secctl.c         | 73 +++++++++++++++++++++++++++++----
>  2 files changed, 79 insertions(+), 8 deletions(-)


Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

>  
> +static bool needed_always(void *opaque)
> +{
> +    return true;
> +}

We really should either make NULL imply just this,
or export one copy from generic code.  Soon...


r~
