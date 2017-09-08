Received: by 10.223.172.38 with SMTP id v35csp1871017wrc;
        Fri, 8 Sep 2017 09:58:58 -0700 (PDT)
X-Received: by 10.233.244.72 with SMTP id z8mr4814276qkl.186.1504889937987;
        Fri, 08 Sep 2017 09:58:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504889937; cv=none;
        d=google.com; s=arc-20160816;
        b=Hs1Y3Y9E/ow8DQ2Qf232k35sNH81INM5awU0Dw7/dbiLRJgZZR8NXPlw5NI5P6/mpy
         /lznsK8xLSDnqdj1uzslhDDFozefcN313QVFC7r9uaIhTkY2z/M/MvDYMsfWFVbfx5tN
         sPKvrqfdAFKzZOTfZWmN2BPtaN7ZGyMGPXqZDpE+ESROiTJ14OFMG6apGU7PRwWApOxd
         Kxao6ifDNsBZt7n1TTZtVKdTWA/zaYE+ZDP8ivAtdbZvRSLfab58eWzm8Qqaj22Xd1hM
         yh3V0LacmeMuahPu8/MK0OuqCNGfdJCM8Y4Pme1NjLYBEoBz5dNDtduF+bc+QgEwTq4C
         3cUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=JuRrKduGsTrQ9nvEQO7m5T/MVsADGK7MYb5Gx1XVwjQ=;
        b=uNWIX4gZDmLWYBW0z4DV7vVKuSaCKfx3AAp302vmDY/elt9zcs/6hlqX0s/JOUwGRY
         kyQ98E9rdKmlAM4om2cLi+wk/ky48RqN/KqCyhSqZh6+4bXos2wJDxz5BNPFYw0kgqOP
         wpsu8A0DI0yJdb4MTi6rAeIr8a7Oq4SMO00ImwSY6Ip8NMwNiNkWhVa8whyz0AT8iQ2h
         xdqWvciFJXjvjctwzRERlyIwNMxWBBHH9K6rqlkejG16qvMrGgZaJNf5f2X1W20Dh9/N
         9PRXscO7PHuel2z8caJNaxmQ6kJFWB5KMcIb0nAOcb+Fhb5YmuNJJjEq0QMYQKH/wOC0
         tUBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=G6uRquyg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u17si2427572qtf.108.2017.09.08.09.58.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Sep 2017 09:58:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=G6uRquyg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46500 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dqMcJ-0007il-OD
	for alex.bennee@linaro.org; Fri, 08 Sep 2017 12:58:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52342)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dqMcE-0007i5-Nu
	for qemu-arm@nongnu.org; Fri, 08 Sep 2017 12:58:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dqMcB-0006px-PP
	for qemu-arm@nongnu.org; Fri, 08 Sep 2017 12:58:50 -0400
Received: from mail-pg0-x229.google.com ([2607:f8b0:400e:c05::229]:37329)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1dqMcB-0006pf-IR
	for qemu-arm@nongnu.org; Fri, 08 Sep 2017 12:58:47 -0400
Received: by mail-pg0-x229.google.com with SMTP id d8so5759172pgt.4
	for <qemu-arm@nongnu.org>; Fri, 08 Sep 2017 09:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=JuRrKduGsTrQ9nvEQO7m5T/MVsADGK7MYb5Gx1XVwjQ=;
	b=G6uRquygYbIWdABWUwjVkAgxvW4nOoMuToE2tKnMhDwxxra8wms+QBNF3Wj9eAm3/A
	rQAcaO71dcuW3rJPJf31pIvqLmaklV+3I4mVBDps3BbsUXGsCkWlerMsYjr1KNvhHeIU
	WCfbZ+olBY97c2LgXNHYQuPDaaNJ3kesRpznk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=JuRrKduGsTrQ9nvEQO7m5T/MVsADGK7MYb5Gx1XVwjQ=;
	b=XKHCmqT2LLvkUHN628tmoWdj4cU8nVJUIf2kt/S8SLznxkbHZIasvg9lUvY6MY/oXW
	aIAmegwSzkbLmzQ45wnck2/yd5QaF/YNO/06Rb9emnwshzv4toakBLxgCyDLVrFapt/i
	BlH/WVZ5u0BGSkT0QvK0lEJ93gN3yIwUBZKacYaIccsvP1xtJ2L2OhJZbEL0AShzr/oj
	IhU+KavFscB+vBFAIfqUTfIynbaJDQX1PTG5EQOJTCxmTr7yHzttYi9X6avibuwACBPZ
	B1LB5jYV/292ZpxXporlDVDSDRwRXKqHGF1mj1LkfptqZrWVuh1x+BhoHhvh/Hge32ny
	jvvg==
X-Gm-Message-State: AHPjjUjzT3a8YxWGG4+x2Pbv7jTfr11mlNSXlcrAbsQxXIAb7o/SrvD0
	hmmCOd0a7kvhVGI26l1FWg==
X-Google-Smtp-Source: ADKCNb5SHiaqc+TQPA0gI4ZimdigY9fQsG+dOl378ZDYDwydgg5qeMLfEHaW6v2k4VauHJ4GJes2nA==
X-Received: by 10.99.5.204 with SMTP id 195mr3724982pgf.231.1504889926223;
	Fri, 08 Sep 2017 09:58:46 -0700 (PDT)
Received: from bigtime.twiddle.net (97-126-108-236.tukw.qwest.net.
	[97.126.108.236])
	by smtp.gmail.com with ESMTPSA id v8sm3719461pgs.9.2017.09.08.09.58.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Sep 2017 09:58:45 -0700 (PDT)
To: Jaroslaw Pelczar <j.pelczar@samsung.com>, qemu-devel@nongnu.org,
	"open list:ARM" <qemu-arm@nongnu.org>
References: <CGME20170908110212eucas1p27c5eecf44c5501d23b322d3679a4f12d@eucas1p2.samsung.com>
	<001801d32891$ec40b930$c4c22b90$@samsung.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <633f5a2d-a333-5c78-1e0c-3af2a4c896f9@linaro.org>
Date: Fri, 8 Sep 2017 09:58:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <001801d32891$ec40b930$c4c22b90$@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::229
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/1] AArch64: Fix single
 stepping of ERET instruction
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lPj+TlSBotX7

On 09/08/2017 04:02 AM, Jaroslaw Pelczar wrote:
> Previously when single stepping through ERET instruction via GDB
> would result in debugger entering the "next" PC after ERET instruction.
> When debugging in kernel mode, this will also cause unintended behavior,
> because debugger will try to access memory from EL0 point of view.
> 
> Signed-off-by: Jaroslaw Pelczar <j.pelczar@samsung.com>
> ---
>  target/arm/translate-a64.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
