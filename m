Received: by 10.28.71.27 with SMTP id u27csp1403842wma;
        Fri, 9 Feb 2018 13:16:10 -0800 (PST)
X-Google-Smtp-Source: AH8x225HVokXGTCJ7Y2k4ktgCab9/Y/vQTMZ6UDJD5tppurGKslYxZWO2bWoDhkiCw+1T3BkFLBP
X-Received: by 10.129.174.35 with SMTP id m35mr2991373ywh.431.1518210970485;
        Fri, 09 Feb 2018 13:16:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518210970; cv=none;
        d=google.com; s=arc-20160816;
        b=CCR5CvHQst4TE9I48oLWPeH9zK/DPnOeGKNrPNHnEt0q5KSpt5rwlo9ubvdMwxZbpQ
         LeNAKCu0lH/p1r9VnPSevirQefoY1FuJLbxmhlFuuZ80SOK3eadLcraM2MrrsYq+MLba
         rzK0Pf4b6h2gBAr2+SRzsaq4qdhb/FTTgOdHxhXTmLyj3PjqWDz5g2CTmqQ3645aPhqs
         tGcflWr6bsn8KnodhT/m+f47qXSal8sTf+y3Vv77d6UO9VMUgdox0wqwryKQ+H3o1k13
         VyELwkXAjE1RhgdSptX60uTK/k1ow3KoKcqUY2DTTa5Hg6/1W+u4lhprK1TQEDEx9qwz
         ST8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=Y8x9AmAIdbjZlVp2/QkjVC5nAplhKol6ORAFnr563XA=;
        b=Gk1zlrfGw/IoNiFwTgKfrh9EF+3NoITvySld1fH/hUyL0C+D7SRdJ/XYHzvimqHXlT
         30L8Ew4N5Ftu2tA2EPLx7VwU/GYyKRNrgBtFmZUQhXsM+rWSOacRDr4NbZqmSr6UwJPz
         zkKYcfrxhStK+5LhMKELHP6TJnQZDqP8YrjdgQHaS3A20Ctuv7L2IthtbaGsE9L8kAOm
         wuIB3zBGmIRQXPDKR4e8L7K2gyFRyo3xujEn3UvH4gVHlAVXFPB3MBc2+ujTr6iPi0DV
         1BkJcGdkF+v6REsPN4Y7eH/htDd83w4z66Epx6xKW5fUMQfY29sq/JbeyT/1PrKjVQ3E
         x42g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SjZeBTKK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g66si548727ywa.650.2018.02.09.13.16.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Feb 2018 13:16:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SjZeBTKK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42919 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ekG1h-000064-Sp
	for alex.bennee@linaro.org; Fri, 09 Feb 2018 16:16:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48089)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ekG1W-0008V4-HN
	for qemu-arm@nongnu.org; Fri, 09 Feb 2018 16:15:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ekG1T-0001mW-CZ
	for qemu-arm@nongnu.org; Fri, 09 Feb 2018 16:15:58 -0500
Received: from mail-pl0-x241.google.com ([2607:f8b0:400e:c01::241]:42777)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1ekG1T-0001mB-5j
	for qemu-arm@nongnu.org; Fri, 09 Feb 2018 16:15:55 -0500
Received: by mail-pl0-x241.google.com with SMTP id 11so2016680plc.9
	for <qemu-arm@nongnu.org>; Fri, 09 Feb 2018 13:15:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=Y8x9AmAIdbjZlVp2/QkjVC5nAplhKol6ORAFnr563XA=;
	b=SjZeBTKKZOlT1Djspumb/qNeWvaw4auOe0Pw1HxqJQGqRY5XShS1BNqxRGPz69tx6A
	nH0PzD/19epPB0epXO7w++9bQt0Pl2ZlnNudMjkNtiyMsYSZ2TC45u+1bxF1a6fqIkqs
	g/gRqZXRwXOj9XDUjoNE1gBp0AcQST0sVo9BE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Y8x9AmAIdbjZlVp2/QkjVC5nAplhKol6ORAFnr563XA=;
	b=XBT/pnsnUKf3tZ0G0bHWPkqbhMWRWiBWnWohsg9qjXVj/VTtnezUglhQxAfEZLaB67
	v2DXtJtPNmKyXJkvgoIJS5tm6tUG0rcht64WM/8dChOHD4BgZLtT8tRjBbD6a3FVjIIG
	83yWS9NY1DvPdDdRHue8BGPfkb3Ri0rPXLxD9PaVQUzBKIxavd8JHHuLrrX6ctXHW+qK
	5zyXMlmzvIBYhaMsFuiSPw7vxezmJRDV+pAfuZU2Ry5hSUI8Ok50YhKQn8gZZjBGSOIi
	bwiBGxiRCkrpd2caXzBrtfRakrHvgg2oPS2w6KVtpzJACMs3H9Kzv367JEx11Z2iT+pE
	fIhw==
X-Gm-Message-State: APf1xPCKF7OScwe83a9r+MlOw5Db2Eru1b1hCPLxTCiZgS15Twbbupdu
	rB1FtWAuU779S2B/kVj4Dq/RRQ==
X-Received: by 2002:a17:902:3225:: with SMTP id
	y34-v6mr3679921plb.399.1518210954231; 
	Fri, 09 Feb 2018 13:15:54 -0800 (PST)
Received: from cloudburst.twiddle.net (174-21-6-47.tukw.qwest.net.
	[174.21.6.47]) by smtp.gmail.com with ESMTPSA id
	m16sm9699460pgn.27.2018.02.09.13.15.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 Feb 2018 13:15:53 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180209165810.6668-1-peter.maydell@linaro.org>
	<20180209165810.6668-12-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2eb3c590-a93c-c2eb-d24a-9de5a2b19ca0@linaro.org>
Date: Fri, 9 Feb 2018 13:15:51 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180209165810.6668-12-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 11/11] target/arm: Implement
 v8M MSPLIM and PSPLIM registers
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
X-TUID: LClnSzFUo1dS

On 02/09/2018 08:58 AM, Peter Maydell wrote:
> The v8M architecture includes hardware support for enforcing
> stack pointer limits. We don't implement this behaviour yet,
> but provide the MSPLIM and PSPLIM stack pointer limit registers
> as reads-as-written, so that when we do implement the checks
> in future this won't break guest migration.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.h     |  2 ++
>  target/arm/helper.c  | 46 ++++++++++++++++++++++++++++++++++++++++++++++
>  target/arm/machine.c | 21 +++++++++++++++++++++
>  3 files changed, 69 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

