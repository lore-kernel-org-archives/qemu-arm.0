Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp209529wme;
        Thu, 17 May 2018 09:51:29 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZoLiWaCdMKvJ/EQZfIKF6Qk0zlRjKHeQUvD6guXNuEJ5AQhY8o5odzptMZgbv0GQj8bSyON
X-Received: by 2002:ac8:1a2d:: with SMTP id v42-v6mr6282793qtj.121.1526575889059;
        Thu, 17 May 2018 09:51:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526575889; cv=none;
        d=google.com; s=arc-20160816;
        b=zqO4tCnmeXbgg5I/ND9EeelmlvyecjtfCqRoJkkpU5xceJbK5TtQ2Vzj+QBRkaW29N
         wqLaTIKABf4YmkeAOc0OOfvfEZXv615aYBGW6IyOrGuebmK+f4dF3WnfKkhIRK4yR9oJ
         inBlqvitQ/ZSRiK/p90FRzDYDdJeQAkkhCBSi9LB/WkYaFhTJ8/X0InymOELB77qSYRb
         kUzV6nr4nIhogFJL0Qk8pchfSMMVEcbTQtCCBZjE/YsmO3tTRyqYjhEWQHPAH4HzJwbE
         vdU1Qzzs2+FughMmLxo2/B5R1tp3CHEuyV35fnLv/M7KT9tX28HFkVO8Oatlisrz1tLC
         QVPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=IB88chrK4y6TLsMJCYG21GNc1By+Tw9tFO/Y4cYZCrc=;
        b=bx1wT+b9cGCCDH5O9v18E2x5uh3pqLIZrbDmzYYj5dwuV4Qg0KYJOwe7PWf2Gs63M+
         LxKZmN8ugwXzV9S0IaAxRD5XQN8kqeQr8L+C2JALR2nP5VfuYeoKrc4EfTIkFLHmAaA5
         kseM/szy0gWAbtC+aWE6nBA3CG1HQ91+d/D4fICuNIhHZrH+tNAzPr8qg8qiIWzySNM3
         tLcxJi7bMgwCdBKAAJCeZXycDgIFcOr/5yp+zPHjv6Mu6G7j6wssQXbCmN8rHW7G0m9O
         bAOM4f0tJ+vvrZWZTz2tuheGiBiSpbSdZ3BhZhhM/ybejPL1lihrYp4MUKJ/EHt+hP3c
         yzIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DAIvhEFA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q71-v6si5615932qke.57.2018.05.17.09.51.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 May 2018 09:51:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DAIvhEFA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36526 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fJM7k-0005ui-Jg
	for alex.bennee@linaro.org; Thu, 17 May 2018 12:51:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39990)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fJM7a-0005tT-GG
	for qemu-arm@nongnu.org; Thu, 17 May 2018 12:51:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fJM7X-0006EK-JS
	for qemu-arm@nongnu.org; Thu, 17 May 2018 12:51:18 -0400
Received: from mail-pl0-x244.google.com ([2607:f8b0:400e:c01::244]:43435)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fJM7X-0006Dq-Dw
	for qemu-arm@nongnu.org; Thu, 17 May 2018 12:51:15 -0400
Received: by mail-pl0-x244.google.com with SMTP id c41-v6so2878019plj.10
	for <qemu-arm@nongnu.org>; Thu, 17 May 2018 09:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=IB88chrK4y6TLsMJCYG21GNc1By+Tw9tFO/Y4cYZCrc=;
	b=DAIvhEFAahzwVK5Qi5jJRaptAFNwPb5ZK7QKEsBxQS0eRUNYfSg5BCZfhskHF5+Md9
	g4ZW4exsD3qw27eqKCbfRJKgIYbwcmkegPCYktwGyqJr++JSWcCF7tdsmspuX7NogxsE
	Qqg/WdFXk7cMnDxluXTDyfqroj+xKRoCihpCQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=IB88chrK4y6TLsMJCYG21GNc1By+Tw9tFO/Y4cYZCrc=;
	b=R+0v/y62S58zCCgsIvw4TRDRv0PsxOd1kCgCUAuYhhw9u+N0jguAVwJhEYiG2m8wJX
	Geia1ISVSHofd1xn3ChLEgUitjv87jNyaNZUiIBQS/c0NDcJ10hd60alt4XyJrAhiOPP
	WfGV1sI/ZtZD+0tnXOpP8cauRuDqI6ECWcQqqI3Binuy2r9aH4GWVPAVTTk+fDzeqnvX
	OYeV9Yr28WUksp5ieXhyEKUB9K/iOHXn6O/Asu3f4i8/jwVHr6aI17+CbEshON83WYHg
	MgA738+7V/6hEgpL9xJictFKcaJl76medZV9lVpboEIFwf8tSqWtflrBREKa3L2f828K
	0gsg==
X-Gm-Message-State: ALKqPwfkzqgRDqb+uHJFZ92rmBcIwsQv0ItJwrAj0fJz7czqdE+9vcS0
	SjzDZFSuHtUv0H+T/k56AdKjaxjctPA=
X-Received: by 2002:a17:902:7109:: with SMTP id
	a9-v6mr5979357pll.271.1526575874011; 
	Thu, 17 May 2018 09:51:14 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net.
	[97.113.2.170]) by smtp.gmail.com with ESMTPSA id
	h21-v6sm7021735pgv.43.2018.05.17.09.51.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 May 2018 09:51:13 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180516223007.10256-1-richard.henderson@linaro.org>
	<20180516223007.10256-27-richard.henderson@linaro.org>
	<CAFEAcA-Erv++skS73s6_ZCWbo=G6xLaE69wukUKyX3-KyuV=oA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <f423b535-f3f7-a8ce-8821-8e16f0cbfd38@linaro.org>
Date: Thu, 17 May 2018 09:51:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-Erv++skS73s6_ZCWbo=G6xLaE69wukUKyX3-KyuV=oA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::244
Subject: Re: [Qemu-arm] [PATCH v3-a 26/27] target/arm: Extend vec_reg_offset
 to larger sizes
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
X-TUID: MY4Hqonrtz6M

On 05/17/2018 08:57 AM, Peter Maydell wrote:
> This looks right for element sizes up to 8, but I don't understand
> how it handles 16 byte elements as the commit message says -- the
> d[0] and d[1] are the wrong way round and don't form a single
> 16-byte big-endian value, so they must need special casing somewhere
> else ?

You're right that it's not a proper int128 for host arithmetic.  Fortunately,
the only operation we have on 128-bit values, at present, is move.

How better might you word the commit message?


r~
