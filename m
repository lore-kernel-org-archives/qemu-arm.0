Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1273319wrt;
        Wed, 23 Jan 2019 15:46:28 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5VOZamkOZTizlMFjU93cMptmJftqn7uRpGdqbh4MjYxUCKIBG7BxN/bRUkW1EcZzFoKnlR
X-Received: by 2002:a1c:2787:: with SMTP id n129mr157396wmn.128.1548287188647;
        Wed, 23 Jan 2019 15:46:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548287188; cv=none;
        d=google.com; s=arc-20160816;
        b=ig8x6Ac/3/xMfvn3fxeiYJQEIq4KEhjL/jpzQtzMUrRmEzz90e4mZCo+VXL2Po3PL5
         VDVPphmzEje5rlh094iqdI3wQwHhypm21oYv/ADZv7pb3uLogECZzBUAAYjEo1luhJw7
         VNmfMYnl+7wlUF+iFcfkcJ5kjVm3/mgM7OCTN3Q+5xlLYLH0q5odAJ7oeK1PcDeBlEd9
         KcmFUe8eYLNvDJm3N62Obv0iUBrLs+PALRGsNQgbvAVSu53+lix85W/fWtK9sBYH0IWX
         44F6xE1Y2T24AqFt8CVLUYmO++5yrT7nr/nTWjYpPpN1I6EpFx30WGopZNPOIc4Vtv+O
         6hvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=fP18UAxTCq2EiPInVKneNBzzlHldqtUyJ/vwM4lZF+g=;
        b=ZWhJzcyJvTBaENWv5jKY6aaqrlwbI/BsHry524pTMQcbUrZrdEMzWC1tq1OylbAoU8
         DS9MP9RnAz88i+ZMjW47mqaGbDmBkOHqYkgU4rMlbYlzVMQLI0GpWsV1x6PgvW3uyV/P
         RYUKarO1l62iXcdhHmujefWv09CWbKPOBqiLt2B7yG37UDH2+EcMlF61B3TUag9727cH
         /GpKK/03dd4fhbJblZgZbBjUUTuEcFNgPB8mwyz7HXqtF1GF/homxqCru3q+5TlBW8qm
         a45wQKr6J+FMZ9tmxia6Uln5RqPpfXo7PM9vNCFwC4gLxr5il8+aK5e4U97zOE6WbH0o
         IadQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Fa5bBiW/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u14si77908752wrg.415.2019.01.23.15.46.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Jan 2019 15:46:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Fa5bBiW/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:43685 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gmSDz-0008GF-NR
	for alex.bennee@linaro.org; Wed, 23 Jan 2019 18:46:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51963)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gmSDD-0007mP-HA
	for qemu-arm@nongnu.org; Wed, 23 Jan 2019 18:45:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gmSDC-0002YD-RW
	for qemu-arm@nongnu.org; Wed, 23 Jan 2019 18:45:39 -0500
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:41916)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gmSDC-0002XF-IY
	for qemu-arm@nongnu.org; Wed, 23 Jan 2019 18:45:38 -0500
Received: by mail-pl1-x641.google.com with SMTP id u6so1956072plm.8
	for <qemu-arm@nongnu.org>; Wed, 23 Jan 2019 15:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=fP18UAxTCq2EiPInVKneNBzzlHldqtUyJ/vwM4lZF+g=;
	b=Fa5bBiW/FBwVtRApsQpt6UnrXWn+405Abj/RCJPk/fArxKimsTXEcR+kZzuQJBcdyZ
	1+0hSCHdsXpM6JWj3aB8xZRJV3+dakKYiS6XM5laaRRUbBk1V0H301JxTikwPlWRHFCE
	KDKGcn+6Gy/6+HV0hh2DeUPvartnFelbfCKHo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=fP18UAxTCq2EiPInVKneNBzzlHldqtUyJ/vwM4lZF+g=;
	b=KWXnkjae1khF2jUQf+OTteqAfDxHVC4X9fqMUtXILo1cicOSoUrZ4t837rBEYSCWdc
	rfBL3bP8I+g9+chsntQGHTHogqelSqNQIaCBMTNGitPu4l/oRMRAr/pkHgNfeG796Tp9
	z7txWtn9ZGltqXSPt3byK8uLOCS7Bcrxp9oGGQvGTMLsdXczelM8Pz0KUy8gZ4dYyPhj
	XGg16RUsbD/tUxAU2k1XfgaDBHeStnmEjgrmgiryM50TY7yxRHbJGK9pi8LxgRn3fX9W
	VZW0rZXtjL9XaTgUfFIlxpmTJu94o/D4g2uOQyenCqNWd71wvz/11M9Ky0JQjZA8lmDR
	gwMg==
X-Gm-Message-State: AJcUukdheDzTfqBY8jtRz0/r5Q8XMAI8GFdv8g5eE6oNnjSrmPsc88X3
	1G7GNp4WAk6aQ2FWirceqxhOV7CMmJs=
X-Received: by 2002:a17:902:8bc6:: with SMTP id
	r6mr4257926plo.67.1548287135944; 
	Wed, 23 Jan 2019 15:45:35 -0800 (PST)
Received: from cloudburst.twiddle.net (97-126-115-157.tukw.qwest.net.
	[97.126.115.157]) by smtp.gmail.com with ESMTPSA id
	b68sm26515348pfg.160.2019.01.23.15.45.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Jan 2019 15:45:35 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190121185118.18550-1-peter.maydell@linaro.org>
	<20190121185118.18550-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <0c5f3a76-bba9-95de-9aa1-c33d8587e4d5@linaro.org>
Date: Wed, 23 Jan 2019 15:45:33 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190121185118.18550-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::641
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 03/23] armv7m: Pass through
 start-powered-off CPU property
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
X-TUID: i5VOoO7tpxuT

On 1/21/19 10:50 AM, Peter Maydell wrote:
> Expose "start-powered-off" as a property of the ARMv7M container,
> which we just pass through to the CPU object in the same way that we
> do for "init-svtor" and "idau". (We want this for the SSE-200, which
> powers up only the first CPU at reset and leaves the second powered
> down.)
> 
> As with the other CPU properties here, we can't just use alias
> properties, because the CPU QOM object is not created until armv7m
> realize time.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/arm/armv7m.h |  1 +
>  hw/arm/armv7m.c         | 10 ++++++++++
>  2 files changed, 11 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

