Received: by 10.25.221.202 with SMTP id w71csp1236317lfi;
        Thu, 3 Aug 2017 15:23:37 -0700 (PDT)
X-Received: by 10.200.55.237 with SMTP id e42mr575002qtc.92.1501799017608;
        Thu, 03 Aug 2017 15:23:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501799017; cv=none;
        d=google.com; s=arc-20160816;
        b=wtE0kWia10bwdhti3F08gxaIOuNm/Qav/PYJgiuB1lB+55+2ph7bg/3VGrbMeqBrTH
         yqr1MqsDCNNwxZ4/9/odyz9kfOxrNtyVxlIV4jMmaJRoIAeCVUYeuXTak/17CRl8kloi
         d5tkLutAMim2MaCv96vVf/T+FKAY+2WuaNxTg2QlN5lWo8Df+ggLw0q1s7VvOOqaQa21
         ETgFaGWDg3RXsPRfYRThXizEM67MpRkuZ1WzAkoTgsdIEzjbesR8JV2j5M3Yy9Ypja5m
         fDwA1T66vEJq8o2x/1kyiW2T2VItetr6S/njA4kzBu40PwjgIoVDfLMj/7xiyL+5m+nC
         2NAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=enTBqbNyKcW7OdA4JXMST5945WlM1ngbB153j3OJkrs=;
        b=nBY1m5A6nBDMYgiwNq1+C2XJh7RaAd9fSCLqvfK21xQXgCLjwKh4D7hwgvm4QHEO8y
         l508BCfkeqN31d5wTD5T4/vqQx/WYd1xaABwFHJzlpwYLtVEY4oHiO6x61zO5sqYSUDw
         e5RBLbvxhzd4hGJG3WYiNJbnNJNKXo+8LhEZ9cemdKbK546ZkUZkkCaNCqeN9AuhZQ9r
         CGVIqOFyePlAM6y60z/70soaV+uhn/YWGv74KeGKFYBcUy4oaWMkEsl28E5SaoGTZp5g
         /8uCQPbe5Nro1/iEh8Y4kOl1X2CqEC2E7pJArd/PfhWgrx1Qzen+IfOcK4pzkf8WGs1h
         ThYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=YwWD9Nig;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q77si27905qka.463.2017.08.03.15.23.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Aug 2017 15:23:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=YwWD9Nig;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57904 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ddOWk-0003wD-Vm
	for alex.bennee@linaro.org; Thu, 03 Aug 2017 18:23:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59535)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1ddOWd-0003uw-D3
	for qemu-arm@nongnu.org; Thu, 03 Aug 2017 18:23:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1ddOWc-000055-G4
	for qemu-arm@nongnu.org; Thu, 03 Aug 2017 18:23:27 -0400
Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241]:37498)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1ddOWY-0008Qa-B0; Thu, 03 Aug 2017 18:23:22 -0400
Received: by mail-pg0-x241.google.com with SMTP id 83so17112pgb.4;
	Thu, 03 Aug 2017 15:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=enTBqbNyKcW7OdA4JXMST5945WlM1ngbB153j3OJkrs=;
	b=YwWD9NigjhSzu5+y+gaKc1raEfh/SrAfGjNs5GSwcxHF/e+k1B0Lktvy0vsMjkkT5a
	wuqKHE1RJIdvldMRegbvzNY5qx5h2uETJR7KRBN4VjTDohOMxH3aEPBXjE7lzX6hA3bu
	0UfEWfJ8E+coKizorTNiYwWPZ/tP0OVDm0sCRU3GAc7A1SRis9MVetgr/dLMsY0tHuMk
	wSm/lTwgCjCpF4m4HXnnvHmgkxGhaevKNuv0VayWq+nsNtxmSIyaqFo9IoCU1Mc0updf
	BIi0QH8LMA/KlgsRpF+ddMT8Po+PNR5jaHrVcqJyOkmAfn/xIlOIvF78Rhy1UKw93QMP
	FmZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=enTBqbNyKcW7OdA4JXMST5945WlM1ngbB153j3OJkrs=;
	b=ErVCUZpGn21TAJpHLDGEpWSYMY+ENOrfdONEIEpjIR1jzwRtwFIuLy/UhfL4oMqMCj
	93b8Wkz6mg+z82NPljzLWGVx0oP6ioahQYC3AjX35tWyGCdHy4R6Sn7Qfxgfcq6aAhdo
	F56Vq2ccrv+wPgHKTKPlZzICgx7pjdMsrH42TvauHs+1RRqdn70rQ5sVoZip35ubtEEn
	wmJr27iM1DUcfGn0/vxayou6miNih7mrxg2XcEDBCX9RJu5K1BpcvTWHE5+smrCIlKjI
	YC52Fe/7Bm/W93dlr/eMumahMcOzQpu49qSYhSm0ZhMR4FC/K/hPPsu70pLMaofplq3G
	Kpiw==
X-Gm-Message-State: AIVw1104kwB1uJNdGSff8zh8TVrtciMXbTiAKsdWEtWoC1YqW31Jga6I
	7DX5Ecbh1SzPDQ==
X-Received: by 10.84.213.137 with SMTP id g9mr320636pli.325.1501799001434;
	Thu, 03 Aug 2017 15:23:21 -0700 (PDT)
Received: from bigtime.twiddle.net (97-126-108-236.tukw.qwest.net.
	[97.126.108.236]) by smtp.googlemail.com with ESMTPSA id
	u37sm19844pgn.74.2017.08.03.15.23.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Aug 2017 15:23:20 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1501692241-23310-1-git-send-email-peter.maydell@linaro.org>
	<1501692241-23310-16-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <ead02a80-5ab5-9626-951f-efb6b85e59ea@twiddle.net>
Date: Thu, 3 Aug 2017 15:23:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1501692241-23310-16-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 15/15] nvic: Implement "user
 accesses BusFault" SCS region behaviour
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
X-TUID: s9816W+ZDBcL

On 08/02/2017 09:44 AM, Peter Maydell wrote:
> The ARMv7M architecture specifies that most of the addresses in the
> PPB region (which includes the NVIC, systick and system registers)
> are not accessible to unprivileged accesses, which should
> BusFault with a few exceptions:
>  * the STIR is configurably user-accessible
>  * the ITM (which we don't implement at all) is always
>    user-accessible
> 
> Implement this by switching the register access functions
> to the _with_attrs scheme that lets us distinguish user
> mode accesses.
> 
> This allows us to pull the handling of the CCR.USERSETMPEND
> flag up to the level where we can make it generate a BusFault
> as it should for non-permitted accesses.
> 
> Note that until the core ARM CPU code implements turning
> MEMTX_ERROR into a BusFault the registers will continue to
> act as RAZ/WI to user accesses.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/armv7m_nvic.c | 58 ++++++++++++++++++++++++++++++++++++---------------
>  1 file changed, 41 insertions(+), 17 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

