Received: by 10.25.221.202 with SMTP id w71csp1137808lfi;
        Thu, 3 Aug 2017 13:47:58 -0700 (PDT)
X-Received: by 10.55.165.9 with SMTP id o9mr137541qke.346.1501793278021;
        Thu, 03 Aug 2017 13:47:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501793278; cv=none;
        d=google.com; s=arc-20160816;
        b=KThH6NmU6F+gSxSxmaNZMiAUe3pFE3QPe4ZZfJ1djcYdsGhr07cLFk6j+iADe0nYuO
         OhCfgs0i5FHmGjhDJc62cIT/s51INY1PBkjHnksb5Ng67ZxCvnhWkbHKt4NukLZFwahK
         Wo2qrw4xYaXj7LQprsQ6W5oQ2xCYSVhnA1Eq9ZU2oOMZ6F9bzx5LVIH7NsEIs///rHJF
         hxml14vkbJVpFrBKCZ8/LKAKdw7aO7NY1kFkcvGUvT71ChFsHVASkUK+Z8N5OMTDKXq4
         8kzXYCWi7r/a3Kjsb6TGB3hho9QrKkemrP/csLrtrZ40zW/IbwYKOAisSBDpZUZHpauZ
         Mfbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=lWSSFDsfrT+iQh3R9JMNL0vaAj1GAJ7iSR1czVMRKI4=;
        b=YznDo0/pyep6QCBUgPeBVLQrWO6GvNQKp7vCJVXNJlUev12foYh7FVyQffIC31XsvN
         Fkv/sSaDIWE87KHW6G7yDM8VXwYwcHiYPyMfeYqD4KIifJiaTDTPbqdIGLElHWDPmBj0
         D7XCLjGqUQM/xpGF4dfINyKq48OEXhG1TL0Yyl5oyGZ5ExIBONGDuyjYTZVkhYujah+S
         Kp8sovsTvwAeCSzNJa8UTQM8vWPJ+JM1w1/HoG6yOSPVKneQ8i19idxN8T4A1Hk1dj0H
         Xn8HEXvd0232iO94uFcNFVs9846xNJ7BcZHv0QYJxVcd4jeX0WJ9IUjIQ70M8rpE7x3s
         pLHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.b=TkthdcEq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l3si12938441qkd.456.2017.08.03.13.47.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Aug 2017 13:47:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.b=TkthdcEq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50617 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ddN2B-00008s-5o
	for alex.bennee@linaro.org; Thu, 03 Aug 2017 16:47:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39062)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ddMVP-0004K9-Cs
	for qemu-arm@nongnu.org; Thu, 03 Aug 2017 16:14:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ddMVK-0000bK-Tp
	for qemu-arm@nongnu.org; Thu, 03 Aug 2017 16:14:03 -0400
Received: from mail-pg0-x234.google.com ([2607:f8b0:400e:c05::234]:37642)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1ddMVK-0000Z7-Mb
	for qemu-arm@nongnu.org; Thu, 03 Aug 2017 16:13:58 -0400
Received: by mail-pg0-x234.google.com with SMTP id y129so10300972pgy.4
	for <qemu-arm@nongnu.org>; Thu, 03 Aug 2017 13:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=lWSSFDsfrT+iQh3R9JMNL0vaAj1GAJ7iSR1czVMRKI4=;
	b=TkthdcEqzhr8nVW5EW5O+znmFZY6dtsOox6Chcms/AG7PnTjGNz6URLhqOwmiAjbtS
	Sdm0PSnYq+0x5p9DKxjCIYef5ujuo42OUq3CEuMFrAHlY+83WsLwYEbjPkGNSTgvq543
	P8eV/t6pV+QTuaodDX0o3cIsPmOLCB+2SoLnc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=lWSSFDsfrT+iQh3R9JMNL0vaAj1GAJ7iSR1czVMRKI4=;
	b=KHK/NnH1lxI+nVueJxldRIorSHSTkaq0CZYPCHxPgWCnBW1IysRbHqv7yn6JQ1Fj/m
	6re7WHVIVb3BprTwH60q/ZvVPmYyU0UFO9XuNaNT6Dl2HAb6BTDXrwq5ElAjjruuDpYL
	TodEdA0p+xNCW3GuIw8CtXIGtOsVpR0I7L4T2WyZpgSGxEoA1FfyTO7NvFE9MFdmoQTM
	WR7pCxzr5ZNvwEN/wORwEd1LA24QhG2f6kmZdCpm9P0gVmGHn332pWPFwoGYfnTLfbJo
	FYg++JUHkS8Y98cAA2k+pEJOyi0J1cVIDWcTohTmR3IwuyjP1q5gbvW2CbrCCxRf8VZr
	jnog==
X-Gm-Message-State: AIVw1137tmRHt+zpVl83jJCF8jQtIsT/BCrLRmxjozJ1P5dVJdDkDbSH
	qZrIEdG5Q8tkWKKL
X-Received: by 10.84.225.4 with SMTP id t4mr15424plj.428.1501791236294;
	Thu, 03 Aug 2017 13:13:56 -0700 (PDT)
Received: from bigtime.twiddle.net (97-126-108-236.tukw.qwest.net.
	[97.126.108.236]) by smtp.gmail.com with ESMTPSA id
	d81sm27150318pfb.7.2017.08.03.13.13.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Aug 2017 13:13:55 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1501692241-23310-1-git-send-email-peter.maydell@linaro.org>
	<1501692241-23310-2-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <14c11400-2b2e-57b1-075e-09869dbb2801@linaro.org>
Date: Thu, 3 Aug 2017 13:13:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1501692241-23310-2-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::234
X-Mailman-Approved-At: Thu, 03 Aug 2017 16:47:20 -0400
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 01/15] target/arm: Use
 MMUAccessType enum rather than int
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
X-TUID: 70bdx3eH5HPQ

On 08/02/2017 09:43 AM, Peter Maydell wrote:
> In the ARM get_phys_addr() code, switch to using the MMUAccessType
> enum and its MMU_* values rather than int and literal 0/1/2.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c    | 30 +++++++++++++++---------------
>  target/arm/internals.h |  3 ++-
>  2 files changed, 17 insertions(+), 16 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
