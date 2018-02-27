Received: by 10.28.71.27 with SMTP id u27csp5248552wma;
        Tue, 27 Feb 2018 12:47:56 -0800 (PST)
X-Google-Smtp-Source: AG47ELsb0C+onuI+HboBF0vo3XTGG1QbqLJa0Ve0hP8v3AODhDxkijXQpxPA1iqWGmJGUiWVN9IT
X-Received: by 10.129.209.9 with SMTP id w9mr10560048ywi.58.1519764476123;
        Tue, 27 Feb 2018 12:47:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519764476; cv=none;
        d=google.com; s=arc-20160816;
        b=lhcnBkI7k8s9l7qDFcR7RqCvxFZfdKlrA9MFrhhSWcOo8eh7JmnOCdvp/WaOObYGns
         k8IW2WrMiDqOJdL81RCFf3Wa+MUVIP7/+1atNxeoYeDdhrPT3+NL8+ySSF7p7ykFU0Hm
         qhnldD+WnaPk4zKBwVzHi4D4TUJpySwgCElAOlMZvuyQ97nQKI0inORW4Vo7+5Xkau0e
         jGUNzB5zc/WV2ASZufuVMp48OdkM2QZdJDQ4q/O6Jh9oUeHydwMzMo4vaBdJnlbC1AzM
         6U/KbQtgdZRBfZM21PNLbg1HOrw18FCS3Ulc4GKeVf0ggbo2DpbVONDVOfDZuiDHSOCu
         VCEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=07zyZm3wqsDLkYpv+de0wUVYNHkJ2MJkZA1YiysnRDY=;
        b=JxaKnezXleIPplbOEFvaTORa377ym3T1ngRa49ciQDFMnxM8e+SoAyDgYJszij2nfP
         OxsWhmSxZBCdFdj+V/TiUpHE9aq2wxGXKgarZOdHzoaPh3GnYwla5CE6JzvToP3qSpWV
         2S8uAfuqktolig2EyxOWJV/BeBvknSfTvuw9Mlm0ymHM0v8ogA3O9sX5bvKGK6j3DMY7
         MPZUqN7+FjmoRUd5kDBDNDiQUxt82GDhH0KzmTxhD8kQDFJPS4Ycf0I+OI1NsgGO/Glw
         BWuhsl1xCYRHT/VRhbK26/LsQfOjzdZLR4R6ziklcV0ItAh6HI8p91memNMn0291gVwz
         f0fQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jMf7LRw4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t17-v6si3608ybg.506.2018.02.27.12.47.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Feb 2018 12:47:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jMf7LRw4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40026 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eqmAF-0006ws-Ib
	for alex.bennee@linaro.org; Tue, 27 Feb 2018 15:47:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54218)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eqm9l-0006vF-5m
	for qemu-devel@nongnu.org; Tue, 27 Feb 2018 15:47:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eqm9g-0005PA-88
	for qemu-devel@nongnu.org; Tue, 27 Feb 2018 15:47:25 -0500
Received: from mail-pf0-x22b.google.com ([2607:f8b0:400e:c00::22b]:42165)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1eqm9g-0005P3-1o
	for qemu-devel@nongnu.org; Tue, 27 Feb 2018 15:47:20 -0500
Received: by mail-pf0-x22b.google.com with SMTP id a16so63826pfn.9
	for <qemu-devel@nongnu.org>; Tue, 27 Feb 2018 12:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=07zyZm3wqsDLkYpv+de0wUVYNHkJ2MJkZA1YiysnRDY=;
	b=jMf7LRw4K5wONKUsDyD+RUQyJssvAzaKwqBQQoi+uMZ1euG3JbqBlLdB12uwxgfEbV
	Oz8gI9Lct1yxLWjNK0xSll+qepSSlLrGdMG5nrw1MSqgcuBM+ek5ikxsy5hgKkbPHdyL
	FkVoxzScaz01zD+ZNY+Hp2HtX6uJx0i6ko004=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=07zyZm3wqsDLkYpv+de0wUVYNHkJ2MJkZA1YiysnRDY=;
	b=C1v1AFOTJ6A0v9iz6qSJnQgszb9ZweA602xuWfOVyJOoIzvbzqyAU7Lkroz8eBoHfb
	VaF3NPR4N3Gvg4HgohjemWTg/UILOWQMi5nFcYpGuOEYQz+oPyOMFV21LDQaHmInEjwM
	1riAQUnQR2WCt5G4N6fDJZ5AfJb5RGctDD1cCWoUz89dJrImWE6xr9O/LpubL4moa2U9
	Z3OIN9CM3ST5WIZAl9UtnX/jlQFn9421SQPEZwkXfAucbJV1OhbpOAA41vRPRkCZ6LHF
	7R0ih9qwRfLqMHI3v672mZTSBrsOHZqAct/4POJSe9uJgvtRyhUOCVAAVj/8nOO1TfX/
	H+JA==
X-Gm-Message-State: APf1xPBOuhXDuNPhJRwMxRzOBSIFKw1Vf5TiUyDwfhNrN3GSlETp9Esy
	EEejY2jGdQ/8Fq8sy0yUrnlCLw==
X-Received: by 10.98.98.194 with SMTP id w185mr15377608pfb.9.1519764439003;
	Tue, 27 Feb 2018 12:47:19 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-169-147.tukw.qwest.net.
	[97.113.169.147])
	by smtp.gmail.com with ESMTPSA id m24sm51597pfj.16.2018.02.27.12.47.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Feb 2018 12:47:18 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180220180325.29818-1-peter.maydell@linaro.org>
	<20180220180325.29818-9-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f0430656-7384-2177-9d0c-37bcb7af771a@linaro.org>
Date: Tue, 27 Feb 2018 12:47:16 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180220180325.29818-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::22b
Subject: Re: [Qemu-devel] [PATCH 08/19] target/arm: Add Cortex-M33
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: r9FvnV8aVzmo

On 02/20/2018 10:03 AM, Peter Maydell wrote:
> Add a Cortex-M33 definition. The M33 is an M profile CPU
> which implements the ARM v8M architecture, including the
> M profile Security Extension.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.c | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

