Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp648376wme;
        Mon, 21 May 2018 12:53:56 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZrfgc12HWbJdm335udbrFGWq0SfQIDKI8yiWJEGuUl7p9sln7CGGnLi8yS9AOedakz1SorV
X-Received: by 2002:a0c:b503:: with SMTP id d3-v6mr19099243qve.107.1526932436828;
        Mon, 21 May 2018 12:53:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526932436; cv=none;
        d=google.com; s=arc-20160816;
        b=lftsw9hM3nUWDW6gdUMtD04Wk3gdjk+9kHZJYZoSdA9X7alc4FCpl7TCa0g6QPVfI3
         DAuAxWaNvecJNBX18n67iM57Tx5RiXoADsJZ4t+meHrChJ60ZX0JQ+qFj8Sx2FkwOF5+
         xIAq6cXtJ9mC9RNvwJo6t8w1fomB0WCz1MI1PZeP6zE8v+a3KgYok9wLKL8hpMHcGA8Q
         WwHIQ+WYbik10pB8utJ6w3iETQWf9LuT+g4fGHD7DgmO3qi8F1I74XqO1sotLHKlT9Nr
         72NG8ejIfT4yrORI22Uh3OAcnG0r8eVKC7GyvhnqgHBikSlqo7kTOeVg/+s5DMHMqTE1
         XxBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=soO1726wclAEahCZrTCzmGtprBGrKpseKcwZik3UVZ0=;
        b=jGHyGNblT2gSbdj0RJI6uWmYNmObpYuk9KYElOsebE4nBqmI+xzezMI7gtNbMRAZwK
         sZHCUCcevuOycABsuhS+tXIa0y22cuNy3YN2ZOOt0whzDnMkQ9g2w8qsautbV98ATJ+w
         zfxjn8tMPAsuCkrWC/KrKM8wDgULgKlTm0ezUkLRut4YAYvlocIhq19pgfAEml7HGijx
         tRHQFxTSD7XdMICiM83b7/bzMUNe05AXNIZBd7tRRf971Tl8ohHmxsv3q0b5P1jPkshp
         r953Vg9allz5hOwuFD4yhEXRjPesDNzt0tnSfJKROllKKJMdAMGNHUdKMoxognuocWpG
         pBgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=arkeHf7F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t69-v6si14255356qka.191.2018.05.21.12.53.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 21 May 2018 12:53:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=arkeHf7F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52237 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fKqsW-00067d-Bz
	for alex.bennee@linaro.org; Mon, 21 May 2018 15:53:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45803)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fKqsL-000677-VQ
	for qemu-arm@nongnu.org; Mon, 21 May 2018 15:53:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fKqsI-0003gW-NK
	for qemu-arm@nongnu.org; Mon, 21 May 2018 15:53:46 -0400
Received: from mail-pl0-x242.google.com ([2607:f8b0:400e:c01::242]:45038)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fKqsI-0003fz-Gs
	for qemu-arm@nongnu.org; Mon, 21 May 2018 15:53:42 -0400
Received: by mail-pl0-x242.google.com with SMTP id e6-v6so9389605plt.11
	for <qemu-arm@nongnu.org>; Mon, 21 May 2018 12:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=soO1726wclAEahCZrTCzmGtprBGrKpseKcwZik3UVZ0=;
	b=arkeHf7F7UW0P9J46wXOf1FZA7QZuWyyNHyHbzTagIyvlEdHRmBJLUt/LEgUsXl7LH
	Vs24FIcVapE/ctYTo+2T3854W1EUqJncJgGq4XzytlOXAhNHv0bwkVOWRj7njTHrZaXP
	WPkAU9Ii6aRPdRTEcEY50sdqxG7H75+NszF4Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=soO1726wclAEahCZrTCzmGtprBGrKpseKcwZik3UVZ0=;
	b=fY/5C/a8peQVX+Xn1Kti3Bnlfea1MKIHS26WPuOr+lP1yrvTnOG/ouF7VEzqmxUMMZ
	rQt6iI/B9c4mNvhQYAm8IVGvQjLkHJcnAWmta4YLC3v4imUzyl6mmqz7EOTWj+ey0rsJ
	qCsBuBY1w1Mu8m4VcR7i5OOB1lqZ/OJNFap2O5Y+bU9T8dhKc/aGX4nqAq0OIPP7XDUE
	5ePm3LTzdM/RtBj7K0TU01EoI/K+YCtcPEDDAWay1VHFwhdx1PU+bqtArXnxVIgza+Xy
	MzTPJFmf2cPtTPez7IDQ/53X4hpteb3N5nTG9NI8yoAIhpXnqQ5ZYve/OwoFOyQjPfUx
	EoYg==
X-Gm-Message-State: ALKqPwfkO9JDsHCoaN1+8RhCNFkOaKYGxlnTMEtmbM7s9euAHDlIIipY
	Sog7ug14C+ztH97mP2G8UKZR2Q==
X-Received: by 2002:a17:902:bc4a:: with SMTP id
	t10-v6mr21661945plz.343.1526932420989; 
	Mon, 21 May 2018 12:53:40 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-173-254.tukw.qwest.net.
	[97.113.173.254]) by smtp.gmail.com with ESMTPSA id
	m14-v6sm23062075pgs.72.2018.05.21.12.53.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 May 2018 12:53:40 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180521172712.19930-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <7da8b572-de65-8ea5-2f80-6defe9c4b8c5@linaro.org>
Date: Mon, 21 May 2018 12:53:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180521172712.19930-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] target/arm: Honour FPCR.FZ in
 FRECPX
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3D9CkBz6R3vX

On 05/21/2018 10:27 AM, Peter Maydell wrote:
> The FRECPX instructions should (like most other floating point operations)
> honour the FPCR.FZ bit which specifies whether input denormals should
> be flushed to zero (or FZ16 for the half-precision version).
> We forgot to implement this, which doesn't affect the results (since
> the calculation doesn't actually care about the mantissa bits) but did
> mean we were failing to set the FPSR.IDC bit.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper-a64.c | 6 ++++++
>  1 file changed, 6 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

