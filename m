Received: by 10.28.71.155 with SMTP id m27csp463029wmi;
        Thu, 22 Mar 2018 08:09:23 -0700 (PDT)
X-Google-Smtp-Source: AG47ELtS5lSlhZi6A3HSBTqehWoTYfK4PW5wfHYo6BQRzsFpzc4X5AT/w8FGohJmyTfqbqjj1bPa
X-Received: by 10.55.108.68 with SMTP id h65mr30101143qkc.235.1521731362799;
        Thu, 22 Mar 2018 08:09:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521731362; cv=none;
        d=google.com; s=arc-20160816;
        b=BPvTjPPMiOrXXQ0Wq17dQLYt/gMiA1HvGW7y1FCflMHleuoKe8ZLHTOXt5bWGwMH5c
         +YaHiF11z+hM9SnCsaiSGRO9w+YWpXXq78Fn/f54o+lMQNJsnu0sNpSUWp1fgiIX9tnN
         ABKsffc5ywBYoidIwv/7vnwrSq4i2qdD5A7JBnPbFvMLPqBsYLjEs4NPMKAHgdJKAnUL
         j+QLsMQHBGZkh6emzBZGKyq/0mG0dgUgAwSTNBBrypWsVU5KM9hqyE7FjOCJKTPdte8X
         4jVrZOhxVJeHVlTGMFxosQBUbul+quAfcQedjjOTuYsk4Ifp/rSqMozvog5PmDvCW8gD
         OgOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=uBJ6O7A9WiQPBjS/TQWKtOPe69wCRvdwN4UUVSrpdUY=;
        b=SFFZ5Qs1CSIbRTJZ0HzJPUqioeBvCCVxZ+4fFdKLe3dqOmwGoqwWkmf+Ct3dUFl/qg
         ShgjxPGHcY8XEEaP3Llhjb5En6YA5ulGM0DDQBW4nc2naxeBKi1vYph2y784dlpLbVze
         AI8W4JRE3/Gw2eR0wE52iybTPHuKO+IMnrd/nmfE4sJe9Auv9/H0WWNu6Bvov+vT1plX
         5S0RqSWnCD/lPFBnBundOdFLZsRPHIsFC27jpyPj5nFBu5uuYJb4y+BQ4Jc+MiJvxj9t
         UM8bSGEEePJPxoWPNaxpZFufrr7fdV9byLMrOPqRHiN6fuDsmHqoKtOJSSLmhnWwNsqG
         L88g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g127si6999948qkf.38.2018.03.22.08.09.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Mar 2018 08:09:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33063 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ez1qE-000761-8H
	for alex.bennee@linaro.org; Thu, 22 Mar 2018 11:09:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51322)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <abdallah.bouassida@lauterbach.com>)
	id 1ez1q1-000744-PD
	for qemu-arm@nongnu.org; Thu, 22 Mar 2018 11:09:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <abdallah.bouassida@lauterbach.com>)
	id 1ez1pw-0007gN-Cs
	for qemu-arm@nongnu.org; Thu, 22 Mar 2018 11:09:09 -0400
Received: from smtp1.lauterbach.com ([62.154.241.196]:38733)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <abdallah.bouassida@lauterbach.com>)
	id 1ez1pw-0007Wn-19
	for qemu-arm@nongnu.org; Thu, 22 Mar 2018 11:09:04 -0400
Received: (qmail 19973 invoked by uid 484); 22 Mar 2018 15:08:46 -0000
X-Qmail-Scanner-Diagnostics: from 41.224.44.126 by smtp1.lauterbach.com
	(envelope-from <abdallah.bouassida@lauterbach.com>,
	uid 484) with qmail-scanner-2.11 
	(mhr: 1.0. clamdscan: 0.99/21437. spamassassin: 3.4.0.  
	Clear:RC:1(41.224.44.126):. 
	Processed in 0.178714 secs); 22 Mar 2018 15:08:46 -0000
Received: from unknown (HELO [192.168.187.23])
	(Authenticated_SSL:abouassida@[41.224.44.126])
	(envelope-sender <abdallah.bouassida@lauterbach.com>)
	by smtp1.lauterbach.com (qmail-ldap-1.03) with
	ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
	for <khaled.jmal@lauterbach.com>; 22 Mar 2018 15:08:45 -0000
To: qemu-devel@nongnu.org, peter.maydell@linaro.org
References: <1521034084-17344-1-git-send-email-abdallah.bouassida@lauterbach.com>
From: Abdallah Bouassida <abdallah.bouassida@lauterbach.com>
Message-ID: <e5fc76bd-d087-fe60-1327-8dc476bc9fbb@lauterbach.com>
Date: Thu, 22 Mar 2018 16:08:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1521034084-17344-1-git-send-email-abdallah.bouassida@lauterbach.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 62.154.241.196
Subject: [Qemu-arm] ping Re: [PATCH v5 0/3] target/arm: Add a dynamic
 XML-description of the cp-registers to GDB
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
Cc: khaled.jmal@lauterbach.com, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3l/K7Zdu/LCL

ping
http://patchwork.ozlabs.org/project/qemu-devel/list/?series=33714
