Received: by 10.223.172.38 with SMTP id v35csp193594wrc;
        Fri, 22 Sep 2017 17:34:30 -0700 (PDT)
X-Received: by 10.237.36.205 with SMTP id u13mr1440072qtc.75.1506126869927;
        Fri, 22 Sep 2017 17:34:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506126869; cv=none;
        d=google.com; s=arc-20160816;
        b=lCKj25UoZUwRTH0OoLVCS5yjEc/rPgfcUzHGJBL5ja51bLbf34ya8BY9+x2xJmg74T
         1kZ5VhhJFreI+BHorvuveCJra2Owcl9LqU8Pk9YHdvcFMp/C738m8G67HGL4E2BkRDsr
         ln/6ARo2xZQEU5l7D0EDNDAfxP14ggRxVdAsDatZW12RtSDHvNo+OCtySXqxthVNjc4t
         S6x+0hto14YdNyUEWuH9wg/w7Y/4wXg07aCgHcgTfbcMMCqSYK2oxTqwcRcBqaJG7/ms
         RLITZrYHIyihSJmJbw4v2AHmBFUT1mhRsLbs4I6r6EURLFACJxUMR/EMeLiTiFiKGhLt
         3Ngw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=Xt5nSOa96sIhvx/sbNxrIiCxPD0pgSec96Q7N5knopg=;
        b=X5KvKfYeCrDeXJhNQGtClTMTS0vvanE4BZ5pXPVXm82+cix56zqzaB0Iwp7DmUMCH7
         HBGtbONaGzK8rnB+VzVyRaop5ho4ACMWPwcuw09MPf5fXNpk9PNN9HlwDNYW+6PaeZwA
         2JFYvwSK4WjQJe7QRnDZodijYNw/0pC//vO3PwQodkJfwHrVDkm9XAZDIAaPaYiCVLxE
         /0+90wO4nV9KZUWJBSJUnIryOzRVUQzFj1yhrBUbc/9Dy7aE+H+yG1Y5yv4OMV6RkCxC
         LN0WL3voyQ9GLJVsid07KH8DQm1YXQvPiM6q8gKoGCpKR8gOw64gM1qD3QPx7Zj6oVqg
         dSjg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cL2TeIph;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x5si993666qtj.13.2017.09.22.17.34.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Sep 2017 17:34:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cL2TeIph;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33251 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dvYOp-0002CF-L4
	for alex.bennee@linaro.org; Fri, 22 Sep 2017 20:34:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55289)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dvYOb-0002C3-Dc
	for qemu-arm@nongnu.org; Fri, 22 Sep 2017 20:34:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dvYOY-0004yZ-8T
	for qemu-arm@nongnu.org; Fri, 22 Sep 2017 20:34:13 -0400
Received: from mail-oi0-x231.google.com ([2607:f8b0:4003:c06::231]:49012)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1dvYOY-0004yL-3D
	for qemu-arm@nongnu.org; Fri, 22 Sep 2017 20:34:10 -0400
Received: by mail-oi0-x231.google.com with SMTP id v188so680494oia.5
	for <qemu-arm@nongnu.org>; Fri, 22 Sep 2017 17:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=Xt5nSOa96sIhvx/sbNxrIiCxPD0pgSec96Q7N5knopg=;
	b=cL2TeIphceJ5gm+EDBuPwOq13dPskRXtG5uB1N6TJ5DnPst62qQgLaAqtE7zsTSzKu
	sGTNBZTLAoieiMkNM7QjHGNMiwKbWvm4+705OD6/imgHLhfQgbjZ+bIkCIOt4zlj6JEC
	50MXPFe4rDxRi6zys91T7xtJuqRe2Xh85XmgA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Xt5nSOa96sIhvx/sbNxrIiCxPD0pgSec96Q7N5knopg=;
	b=ZKF8sLDb7pFeJ0c8kfzaKBjdu3L3xJTA98ZjtD/LCH8dkyr6oIVelmtJfSSeixjpnx
	TYVR4ZEFUjFtoc6Btls9hDtcVjH6VGgm4DIRf/7JEwiE0v36N5eqRLjyyCsu5GvIk75y
	3IRyypLn5IfJJIQwGi4Ch2e3Skoq9rzJbxdQP+SBsb4bdz9l2wASwwjFleAlsrTuHDL1
	yftoSWtf4Oy1p7hPi920fvHqtPkWF9YEqRBxhoSiHWfVpQqpJ7xCsZCpFz1ydrkmhHoB
	a82uB0zZFQi8YXm8gFzi70irB5gtdG1dK7XcyZFrVh8cas+rWAuc25cqgi1zc4EpK5RO
	7Vtg==
X-Gm-Message-State: AHPjjUipTv+WcvenM+UqUl7GdEU8q/Mpkv/B/3YZF+ZOiZxWLQIjxNB1
	4wUN2uZCbKHMrDPYbt/PdXj98A==
X-Google-Smtp-Source: AOwi7QC2rPGqyHXDNgxFdQaWdLMTIBJX4Zk9Fub4vPeGscEhFbR0/0voJ+wGnq2D6TY9cKd+ezxnIg==
X-Received: by 10.202.243.85 with SMTP id r82mr1143500oih.215.1506126849258;
	Fri, 22 Sep 2017 17:34:09 -0700 (PDT)
Received: from bigtime.twiddle.net (162.189-204-159.bestel.com.mx.
	[189.204.159.162]) by smtp.gmail.com with ESMTPSA id
	h196sm1934912oic.51.2017.09.22.17.34.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Sep 2017 17:34:07 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1506092407-26985-1-git-send-email-peter.maydell@linaro.org>
	<1506092407-26985-2-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <eeaae730-0316-5559-be2f-76499b87ae08@linaro.org>
Date: Fri, 22 Sep 2017 19:34:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1506092407-26985-2-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::231
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 01/20] nvic: Clear the vector
 arrays and prigroup on reset
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
X-TUID: RjPO3GFMPtRU

On 09/22/2017 09:59 AM, Peter Maydell wrote:
> Reset for devices does not include an automatic clear of the
> device state (unlike CPU state, where most of the state
> structure is cleared to zero). Add some missing initialization
> of NVIC state that meant that the device was left in the wrong
> state if the guest did a warm reset.
> 
> (In particular, since we were resetting the computed state like
> s->exception_prio but not all the state it was computed
> from like s->vectors[x].active, the NVIC wound up in an
> inconsistent state that could later trigger assertion failures.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/armv7m_nvic.c | 5 +++++
>  1 file changed, 5 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
