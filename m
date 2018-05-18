Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp174330wme;
        Fri, 18 May 2018 03:40:04 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZpX20B97yEOm0gjG4orVLi9efSaHmJ74pd91fha7rk0iDNqISslSUI61j0rNqwcmqBRrw6b
X-Received: by 2002:a37:1f07:: with SMTP id f7-v6mr8156684qkf.433.1526640004202;
        Fri, 18 May 2018 03:40:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526640004; cv=none;
        d=google.com; s=arc-20160816;
        b=DJheKFAm3WjLirksXMUqDXnIqlZgdri5ej5oMLhC5qfHYMS7GD4vMz7+AzcWlZanbg
         lmSg0q5xUDegFnnd8YXPgGQhqSsl0Nz5UZKXNCbt3L8eFLTaisRnbv8uCS1SGfVdSbtZ
         Aj+1fUsMcpx+vXQuQZdO8eITw0HxdT1+K+Zm3NNpVB99DXcqaLwpHJmQ+ozdMl/mbgz2
         i6TCUmU1+qyC2tVnXorzgeDFbUhc/DIvNs10XgxRaX7sqm0Rm9hcl0uz5R38c7ediLPP
         aSQtUE2iiAJC9Ca4zS8bpaajzjbErhHpISlnlacHFzsb3k3UpUawZJZ1sT9D8qC65Qmd
         bwFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=wOXsig4LSNKognjZMic6o5C08hy+yS9Hw13vtz+cAWs=;
        b=ob6Z43By1FjCbLqQnujdGsjfJD07weBX8PSRr415ApeLzavO1GZKRgjuIoIQfaEI+d
         Oagz4AkqOPFg4EWPYGmH65lier970ba/cQKfLHHjY9BxnBdcoJinTPOIWEg2+1rUBENb
         qGd+W3uSNYQPIGyZdCmBk7sZB4pqudGLiXSGfBy/MF6G8mgZo9M+EpIasz7/sHHZABUX
         KdzUq/gQ7lnjo4ui1VbRXq5Sknd6AHHbDosTs/YFQcyXpfr0UENuMoGGAqb44GbUpWth
         IDtKrG8gy25vRdglpKhhgeP5uFbQAj+VfS8NLrxGhYsd/X2pty3rRQ1wLXS+ll0YtvbZ
         EARA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Jccs0J2q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r34-v6si7203622qtd.204.2018.05.18.03.40.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 18 May 2018 03:40:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Jccs0J2q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37952 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fJcnr-0005lW-PW
	for alex.bennee@linaro.org; Fri, 18 May 2018 06:40:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55096)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fJcng-0005k5-AM
	for qemu-arm@nongnu.org; Fri, 18 May 2018 06:39:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fJcnf-00088M-HM
	for qemu-arm@nongnu.org; Fri, 18 May 2018 06:39:52 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:36763)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fJcnf-00087E-Ct
	for qemu-arm@nongnu.org; Fri, 18 May 2018 06:39:51 -0400
Received: by mail-oi0-x243.google.com with SMTP id v2-v6so6693505oif.3
	for <qemu-arm@nongnu.org>; Fri, 18 May 2018 03:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wOXsig4LSNKognjZMic6o5C08hy+yS9Hw13vtz+cAWs=;
	b=Jccs0J2qQWpjEekQw344J+kRFAVjCzhUQmYt7VRv4OKLttUbc58Ui38QnV6CR6XShd
	iNnpfMJ0qfKqDWveukbHIncQv2mU6lE8epzetbj7P9m6kZCuh1URCVi7l+OxYpc6zD2F
	FS9rq0nOjD0FQu4nBg9zWHdvPlSiCQofU7JJ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wOXsig4LSNKognjZMic6o5C08hy+yS9Hw13vtz+cAWs=;
	b=ZqDNLcq9ouGZbAljTM/lfNWFbOLCC7XNVeQ5EaIr4r2b9qKK74ecXSfhYn2YlLhIjW
	hUsLE9dh462UWRas6MioK3Cwhx7J+81x/iYItkJqW6Y0563oTPtyZoK99tdLFf6p4Mjb
	vbN8MOjftxOmnz4JqWM0J1o74YYwrnRQFGEky5RfSyodZ7ronQ0ZNeL51LvCIoTBIxUJ
	EZJtClQmA0RraAp2J7LAwH1DNIra2wfnl9vIysxJYZfD5TYC60mX61kGbz8Os+EuTxoX
	uCxceaQvRiUMX52ZBxyxJEg/i1FysQRj11XT3GxbdZO/eFxQprJPll10N4lNKXgtxRjF
	rUeQ==
X-Gm-Message-State: ALKqPwdl0IYqO44oHVUg5zswWfEtj28O82iF78w+AHYYhtuB3lm7XQFW
	Te1hYgfGji1jQQLVzo5Y7VYFVLgERZ8X/zEzZWNSeg==
X-Received: by 2002:aca:cd0b:: with SMTP id
	d11-v6mr4988717oig.337.1526639990705; 
	Fri, 18 May 2018 03:39:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP; Fri, 18 May 2018 03:39:30
	-0700 (PDT)
In-Reply-To: <20180517224953.11642-1-richard.henderson@linaro.org>
References: <20180517224953.11642-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 May 2018 11:39:30 +0100
Message-ID: <CAFEAcA_ofttPqmKOpm1XJJzV_XEEs0SU97bbaFQLYUNwrE8rMw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-arm] [PULL v2 00/28] softfloat patch roundup
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
X-TUID: lPU5GqbuSdHB

On 17 May 2018 at 23:49, Richard Henderson <richard.henderson@linaro.org> wrote:
> V2 fixing the two erroneous uses of get_fpstatus_ptr
> within the aa32 translator in patch 9.
>
> Only reposting 9/28 here.
>
>
> r~
>
>
>
> The following changes since commit a4207e3b00e89f934adb231057dcf9a75ac2ae45:
>
>   Merge remote-tracking branch 'remotes/cody/tags/block-pull-request' into staging (2018-05-17 11:59:50 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/rth7680/qemu.git pull-fpu-20180517

Something in your pullreq generation flow is a bit off, this
should have read "tags/pull-fpu-20180517" I think.

> for you to fetch changes up to 377ed92679a2a5f838bc0a095112ea5020720fff:
>
>   fpu/softfloat: Define floatN_silence_nan in terms of parts_silence_nan (2018-05-17 15:27:15 -0700)
>
> ----------------------------------------------------------------
> Roundup of softfloat patches

Applied, thanks.

-- PMM
