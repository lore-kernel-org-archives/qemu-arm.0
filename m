Received: by 10.28.71.27 with SMTP id u27csp1400814wma;
        Fri, 9 Feb 2018 13:12:29 -0800 (PST)
X-Google-Smtp-Source: AH8x225Y/iK9PSIIxKiKUNi5vbsF/DbmmyQHroE8swadfrYH1Oh4LHWFdGf5HskMpJ0LMp28IH8v
X-Received: by 10.37.191.140 with SMTP id l12mr2770177ybk.261.1518210749386;
        Fri, 09 Feb 2018 13:12:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518210749; cv=none;
        d=google.com; s=arc-20160816;
        b=MjCHrKqqz07zxAYAKwPJ09hpZAZpvihU6S5IeLHM86vuXFoG8EmFgv1ws82Tq0jlPD
         PvyRMLf5VkFPaDrtbaH/APIrqeSVRXX2+sU+BzuaGyE6OqLC6PWHI+fckRwQvJgNaxYa
         U9nXeDjphH1U+KICKy8H8av7kVXcpSX9x0tTBCFfw9xcPYAPcu0HyLpspo8t0PmXnR+A
         kcwop7Giqmx9WczKdSDujdQNabxp0eLd9vCjoRDAFI5n2gwOy9UQ/hf+SXjDRMYyj+ZZ
         fzEmNmRjUIHQtoOGMN0ppIE8nC5pYtbm6Ta2uj6+jdE9koXtIdIVcWIjeVL/YEKbwddv
         t0BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=DQlkHYgG+VUSbct7br6+/edxzvWsgJYBCLOReoyRRQo=;
        b=qVc1XiDVwUymKTA7zJVWN7VFdTKx214L8S3d+LTKeT/2Mi9DDxS2NsEPhJn2mixQTp
         V0nkr2xPSsizv5XHHoc2hHoJdkGb2/6ig9viGxLQGL2AavGVDKvajmv7LYYDkoQkVjqR
         rmzovncquHVQSZENbTNXLBKrJS3t5igcsAaMpViVZ9ADmmbdozYxX1rxfDj7QChQdgVO
         CdYIIEz87stxzAbd4+ETFv1P2pt65ny3RbDsQDFEmAUQEtqEd5Q4nDvXm6Qeme23VnRK
         h/2NaBF4AudVn5YEGSaEBzu00aswKe+lXadsv1TdzWD5PUEkA5jFNWImJhuwmLUYoCbZ
         VcdA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LDvFlkho;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g9si278698ybo.783.2018.02.09.13.12.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Feb 2018 13:12:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LDvFlkho;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42600 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ekFy8-0005jZ-RH
	for alex.bennee@linaro.org; Fri, 09 Feb 2018 16:12:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45875)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ekFy1-0005jB-DL
	for qemu-arm@nongnu.org; Fri, 09 Feb 2018 16:12:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ekFxy-0007wL-9q
	for qemu-arm@nongnu.org; Fri, 09 Feb 2018 16:12:21 -0500
Received: from mail-io0-x241.google.com ([2607:f8b0:4001:c06::241]:45531)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1ekFxy-0007vm-4u
	for qemu-arm@nongnu.org; Fri, 09 Feb 2018 16:12:18 -0500
Received: by mail-io0-x241.google.com with SMTP id p188so11098865ioe.12
	for <qemu-arm@nongnu.org>; Fri, 09 Feb 2018 13:12:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=DQlkHYgG+VUSbct7br6+/edxzvWsgJYBCLOReoyRRQo=;
	b=LDvFlkhoYpRlscFtWgkvzBXepTCXqvXFmkA64YzLh2BGjf/BvzixyrBm60ydiHWX7q
	ph6Me3Ar21Dl5iUB7BkaG0r+2yUy4e0NegGJQsta2k93RuwxvAw908ykPlsuQoqEDozr
	eqyRMB/7+1PFgd0uyu36tUvPrWdZuP2Nn9qwI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=DQlkHYgG+VUSbct7br6+/edxzvWsgJYBCLOReoyRRQo=;
	b=gtuTEd/09OAA1GnxtlijP+ABHmlR0vKhqT+yweS84MSBFpqB5Yul10IfG6t9KXNK3X
	pJVFC7Y89w9BTeFWGCLHYoGDtj1/tcXXM+5N7XYtKSXtRSMJNHu+0//Pr1/Y1Uad5dzw
	mXW1fSbfBmzLD3ArEiaXiIrLrLRF2L7BxlXZi+xsfKQ757UNqPSit8PAQVoWWUVjhKwW
	L9/arueIPnPqof9+t0Ha7ur2WgPDazv85A2Vsljq1yUl5LX7tAERxC/c63Szt8DL5JJo
	mC0PV/qtWxCZSj0Im9juA0BRbP22SbqZVoSnXAt3QbVAzKV4jeYwvmhanP7qIbLzcYkh
	0uCA==
X-Gm-Message-State: APf1xPDeQJkTqJmg0Er/zqHBa2y76NW3j1sHlTSd51HWMadz44AOhE9w
	kiEcIv+HAcHH2Ge3N0tcXxIRcQ==
X-Received: by 10.107.136.201 with SMTP id s70mr4625109ioi.177.1518210737468; 
	Fri, 09 Feb 2018 13:12:17 -0800 (PST)
Received: from cloudburst.twiddle.net (174-21-6-47.tukw.qwest.net.
	[174.21.6.47]) by smtp.gmail.com with ESMTPSA id
	p144sm3947186itc.11.2018.02.09.13.12.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 Feb 2018 13:12:16 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180209165810.6668-1-peter.maydell@linaro.org>
	<20180209165810.6668-10-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f4c92c93-286d-567d-8a4e-b247bb634f31@linaro.org>
Date: Fri, 9 Feb 2018 13:12:14 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180209165810.6668-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c06::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 09/11] target/arm: Add AIRCR
 to vmstate struct
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
X-TUID: zVE1Kp52nHEF

On 02/09/2018 08:58 AM, Peter Maydell wrote:
> In commit commit 3b2e934463121 we added support for the AIRCR
> register holding state, but forgot to add it to the vmstate
> structs. Since it only holds r/w state if the security extension
> is implemented, we can just add it to vmstate_m_security.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/machine.c | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

