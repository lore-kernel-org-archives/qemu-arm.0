Received: by 10.223.188.70 with SMTP id a6csp6111887wrh;
        Tue, 29 Aug 2017 08:21:42 -0700 (PDT)
X-Received: by 10.237.40.102 with SMTP id r93mr6352639qtd.207.1504020101953;
        Tue, 29 Aug 2017 08:21:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504020101; cv=none;
        d=google.com; s=arc-20160816;
        b=WBWxbv04qI5lkvzZoOl+qQdsq8XCuoJgwx+DfdTZTrm6XP70+I46ZQco7lzH9SKeq2
         YKK9XmmP6tGU4GnrJC6x6/tW7V7Lldz8pQgOnCgRJFkuRAhWyOSQysB1oW1JZYKEvVB6
         Eo+vMVvH2PwTb6ECrfZFfjlxgbTdJnFWtaO8W/RoYsI7oTShH/A7sMlV1CHyrhQYnwqq
         T8IzWk7Ikb/fv5nB01b3nRLdElTS8zU9YfYCLzaq32Zdw2+d4VxwKJIkZnyr2JbS9EL5
         HbT6h/sB3/0gXfqab0iy5TNzukJW+COc42Kx7pncPNIDmQlnFVFhN9jHfcoUIUWiCcuX
         kQOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=UtM30ibO1gUisbAZUs4Adrd9tiargeZanA7vLL7Ykgg=;
        b=XeDESFGwNJgLlv0wyHDhW4sqgAb3AJP82Y7XjdLn3DTnpQOYbqDy5W4pNZczD3uD7h
         RdSMmEWJiITaxro/b8C+1sn2dTLeawqp+G8fsoLEBXFluy8z+rnz2LBuQUyRYjfxlntx
         Avy9xLHcwAcpv9o1m+Neepu+41wrnEO9Ga0U6jL/ePWNgGGo9mGNKyh7REwX3W9WNrwL
         TdJ6qRMLgUSPquQ5MkrNG9dPioaGorAxQmp+FmhogWlitC9e2YZtCKF8oYwuaq8hH2SW
         41DqrcLZ+F20Zaw20lFoXQlFj5UW+TF+QNr0d2efd6Wy0fI9zC/uR8hBVFg00hLHJBpx
         2nXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ea13pXv8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 27si3303429qkw.199.2017.08.29.08.21.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Aug 2017 08:21:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ea13pXv8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45476 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dmiKh-0004bP-KZ
	for alex.bennee@linaro.org; Tue, 29 Aug 2017 11:21:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44061)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dmiKb-0004aF-Pq
	for qemu-arm@nongnu.org; Tue, 29 Aug 2017 11:21:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dmiKY-0007YJ-Lp
	for qemu-arm@nongnu.org; Tue, 29 Aug 2017 11:21:33 -0400
Received: from mail-pf0-x236.google.com ([2607:f8b0:400e:c00::236]:34494)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1dmiKY-0007Xi-F5
	for qemu-arm@nongnu.org; Tue, 29 Aug 2017 11:21:30 -0400
Received: by mail-pf0-x236.google.com with SMTP id l87so1317589pfj.1
	for <qemu-arm@nongnu.org>; Tue, 29 Aug 2017 08:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=UtM30ibO1gUisbAZUs4Adrd9tiargeZanA7vLL7Ykgg=;
	b=ea13pXv83zRDkctMEwulWxU4cnOk9DjDLd8PoU9KvdQiwLnbnJtEjM48Jq6t4s0WK2
	rtnXIobYmrKv/TAyDdTWzZanpSFlcI6a95hP2AjBWhnmxo0rY+axpTt75kgdCguAceI/
	O3wiyi9gopsD1bEFELu/Oj6alFZv/RGko9dKA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=UtM30ibO1gUisbAZUs4Adrd9tiargeZanA7vLL7Ykgg=;
	b=priSMN03mg+koTY1MFGP7mJR1CJgBV3q4EmwMFHcorQf4UcErU22+xfSYMqiSgWyrN
	QiRcnTqPF40+PRGLU1aGa7sTUOZZPlKusjLw32SsQMp40TVUIobmwuPJRATrnBWSJWB7
	kXXiAoOi9lGxQ+HJO5Vru2Mld5uBDFJK0Ub8bPZ2a2u71b8ikv8cREI1v/jOZCB+3LS8
	xTja+UVN0hRxWszQVf3a9x9OwF0Q9iBMUW8OyzhsPHsQ48aWQMoqp7CerkGbCe1KE6QU
	IVcJqZbkAGHj2Hx5KcyVwFTScjWaHKuNO3ISMt0AraeqnbLRcyoMdGicJi0tun913Nic
	ePbA==
X-Gm-Message-State: AHYfb5go0b+Jo2d7d+zEcg9HQJSkmU0+xdY64CxBaw5b76NXD37mU7IT
	/2yF7WnMLDDSyq2u
X-Received: by 10.84.217.71 with SMTP id e7mr895959plj.103.1504020089451;
	Tue, 29 Aug 2017 08:21:29 -0700 (PDT)
Received: from bigtime.twiddle.net (97-126-108-236.tukw.qwest.net.
	[97.126.108.236]) by smtp.gmail.com with ESMTPSA id
	m10sm5332786pgs.70.2017.08.29.08.21.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Aug 2017 08:21:28 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1503414539-28762-1-git-send-email-peter.maydell@linaro.org>
	<1503414539-28762-2-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <54b68f0d-5ef2-7d1c-3c1a-5b114dfb4921@linaro.org>
Date: Tue, 29 Aug 2017 08:21:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1503414539-28762-2-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::236
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 01/20] target/arm: Implement
 ARMv8M's PMSAv8 registers
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
X-TUID: Lsh/A7lU0hmG

On 08/22/2017 08:08 AM, Peter Maydell wrote:
> As part of ARMv8M, we need to add support for the PMSAv8 MPU
> architecture.
> 
> PMSAv8 differs from PMSAv7 both in register/data layout (for instance
> using base and limit registers rather than base and size) and also in
> behaviour (for example it does not have subregions); rather than
> trying to wedge it into the existing PMSAv7 code and data structures,
> we define separate ones.
> 
> This commit adds the data structures which hold the state for a
> PMSAv8 MPU and the register interface to it.  The implementation of
> the MPU behaviour will be added in a subsequent commit.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.h      |  13 ++++++
>  hw/intc/armv7m_nvic.c | 122 ++++++++++++++++++++++++++++++++++++++++++++++----
>  target/arm/cpu.c      |  36 ++++++++++-----
>  target/arm/machine.c  |  28 +++++++++++-
>  4 files changed, 179 insertions(+), 20 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
