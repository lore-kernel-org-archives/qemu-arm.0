Received: by 10.28.71.27 with SMTP id u27csp1362693wma;
        Fri, 9 Feb 2018 12:28:49 -0800 (PST)
X-Google-Smtp-Source: AH8x227nx6EiTvrk4c/AkNEVT3F3TgalvoqwwQSWSZSDS9yG7p0+VpmsqbPFDqV5wEZtxjpyjLde
X-Received: by 10.37.30.69 with SMTP id e66mr2767711ybe.469.1518208129557;
        Fri, 09 Feb 2018 12:28:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518208129; cv=none;
        d=google.com; s=arc-20160816;
        b=T8ea2CsvT+maB12Da98/apMRgiP1NSd+T8u3lkK/C95jjnx3ZybW0h1WI9eziQMZ4+
         n2Xe3y0gEtMQU2ZK4s2mqH82ijUl7D2lxeJ8zGZpmD/ur8jeirNs5zx1RbmoQ2ZdzfTQ
         T69LY1SQQsrLIk8huwwfgqhAgxyn6yvLx9uP23gNZNmuO2iyvlRBeiT2Lwk+cKrZFPRk
         7IAhWxlIJ6ppmA0J2/XH7ZI4zswIrIs0ugBDkj5brK7+nWskJzV5I7ZIpQGc/by5MEoh
         HmFUlAjIMeYKn5z+l02YIeRKMXzluF/z5D8KpvP2tOw3t2rYblk5ZtNQnOia1dmeXV5D
         Azgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=BqipqLxEY8cWNC7YZ4D9bHWohZGmgZ60iUdc0WFdMZo=;
        b=p1ZoQPpFqjFBQkDLNFMx89QCH7egaz9tQI403ZEDswc/XD2xtWDtYL5VzO0j1XZX3H
         fGIihUNySpXDRkkVM4bIk2O6a2YNl7fWj/c0/XF7OTTXMUJPCc6MCHeJdOmnLDUnk2dl
         2SnZf66AyVt5yoIFsbVfTilbKz+Jhlul/RdrQ5m7jVRhKWmO5wisFqusSxrozgnpWd1Z
         DxN7axwfDT8dokDksBDim49v3u+ZJroLcxwcxoUAub2snkT9Wk1uukwpjTzbvNrytl4z
         i8DVQ4uyL4Gx3vynG3j3Twuk7To0TIi+bExD30MuTeTt+Jt3F+ivOfuDnJO32qf840Vt
         OGzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kTQrKJ8F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z139si60448ywz.443.2018.02.09.12.28.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Feb 2018 12:28:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kTQrKJ8F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38273 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ekFHs-0001je-Uq
	for alex.bennee@linaro.org; Fri, 09 Feb 2018 15:28:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35518)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ekFHg-0001hq-Gd
	for qemu-arm@nongnu.org; Fri, 09 Feb 2018 15:28:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ekFHd-0002M9-AW
	for qemu-arm@nongnu.org; Fri, 09 Feb 2018 15:28:36 -0500
Received: from mail-pl0-x242.google.com ([2607:f8b0:400e:c01::242]:36570)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1ekFHd-0002Ls-45
	for qemu-arm@nongnu.org; Fri, 09 Feb 2018 15:28:33 -0500
Received: by mail-pl0-x242.google.com with SMTP id v3so1970628plg.3
	for <qemu-arm@nongnu.org>; Fri, 09 Feb 2018 12:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=BqipqLxEY8cWNC7YZ4D9bHWohZGmgZ60iUdc0WFdMZo=;
	b=kTQrKJ8FsyS/tJpsgnOzfCZP/IVSq8JLXsPKynh/edXTypbYpimij66q42lur3o2bg
	KsH3pTfkTdM+LLrjg68r2NxsT65fdEZTrqlzMAkamwHL4d6jRmiFU9mniOGyhOdiJV1Z
	BqQ1JIjgh9ZFxxp6XRiT75+VEVhHkpVwmbCXY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=BqipqLxEY8cWNC7YZ4D9bHWohZGmgZ60iUdc0WFdMZo=;
	b=Xfcahk9GTe7VDCgNj68m4hRh4r39j+wLy31+ckjyTCefxXGIc4B5KlTb57kww/zov9
	Y6lrB3AVgOztqSHbQ766o5Sgo0RY/ifxjpEtMEpDXO68qJEDyfnj/NgLVjQIgB2zzs8M
	tIrS684nGoZOX6UnV1/9R+BjBZBJOjHeWnDBsprVY4cK0Yq4rkeoN990lUEKcbKaeiH3
	IgaXk0iIEzhGQycgfZYmssxFGuGoYB98Yhl5X8Y5ZCIB82EDe4EMj1YQn5YlhE+AJ7av
	ifZpA1UHKn9iN0lHlEz7jcehd/UooxSrjcRdaf01wZ0LjjyrAoud6CXXPdZJQsVRHkAX
	efWA==
X-Gm-Message-State: APf1xPDkiVFwaurg/fmNCv49z2Jmsa/wWh3k6oQivpb1FP+7TO0bzD22
	wVbt71QQsIg91nDvQx617xR66bYVCqY=
X-Received: by 2002:a17:902:7d96:: with SMTP id
	a22-v6mr3666467plm.296.1518208112115; 
	Fri, 09 Feb 2018 12:28:32 -0800 (PST)
Received: from cloudburst.twiddle.net (174-21-6-47.tukw.qwest.net.
	[174.21.6.47])
	by smtp.gmail.com with ESMTPSA id a13sm7696131pgd.1.2018.02.09.12.28.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 Feb 2018 12:28:31 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180209165810.6668-1-peter.maydell@linaro.org>
	<20180209165810.6668-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <aaa56b0f-ef7e-a617-8ffe-52bf55169491@linaro.org>
Date: Fri, 9 Feb 2018 12:28:29 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180209165810.6668-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 01/11] hw/intc/armv7m_nvic:
 Don't hardcode M profile ID registers in NVIC
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
X-TUID: Ol1wfEHMoRJk

On 02/09/2018 08:58 AM, Peter Maydell wrote:
> Instead of hardcoding the values of M profile ID registers in the
> NVIC, use the fields in the CPU struct. This will allow us to
> give different M profile CPU types different ID register values.
> 
> This commit includes the addition of the missing ID_ISAR5,
> which exists as RES0 in both v7M and v8M.
> 
> (The values of the ID registers might be wrong for the M4 --
> this commit leaves the behaviour there unchanged.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/intc/armv7m_nvic.c | 30 ++++++++++++++++--------------
>  target/arm/cpu.c      | 28 ++++++++++++++++++++++++++++
>  2 files changed, 44 insertions(+), 14 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

