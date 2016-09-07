Received: by 10.25.87.130 with SMTP id l124csp523233lfb;
        Wed, 7 Sep 2016 15:32:48 -0700 (PDT)
X-Received: by 10.55.125.199 with SMTP id y190mr51814003qkc.135.1473287568597;
        Wed, 07 Sep 2016 15:32:48 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l95si26608394qte.110.2016.09.07.15.32.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 07 Sep 2016 15:32:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:43513 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bhlOh-0001Z6-JH
	for alex.bennee@linaro.org; Wed, 07 Sep 2016 18:32:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40128)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bhlOe-0001Yl-D8
	for qemu-arm@nongnu.org; Wed, 07 Sep 2016 18:32:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bhlOa-0001Z8-7U
	for qemu-arm@nongnu.org; Wed, 07 Sep 2016 18:32:43 -0400
Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243]:35543)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1bhlOa-0001Ym-00; Wed, 07 Sep 2016 18:32:40 -0400
Received: by mail-lf0-x243.google.com with SMTP id s64so456494lfs.2;
	Wed, 07 Sep 2016 15:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=I5vV5v7k7AE2MKBWfCw2wrIzY0tRSZxW7kSa9CSeVWs=;
	b=z24w04XpOCuSfAI5eEp7YPQYQ23Y809+cPDhAOTq/m0hyKOUYfpHFr8QfdLsIoaV15
	Stzob/0fDIczx2G6VmtnW1pUamkTE31yywSUU2bJGYHCqNmqdGAgSCak9T+F2F56YDAM
	adWNrhfRBDWJV7hYnGIWDRpPo5YjwsJWPvcF/2KozkFqznRIJUuOyN9w29aLiWXUzhmp
	mof0mVk6kRVCVmPWi3Fr3qzrNkWQNmvZ8C9gysNleRTFyBoR06bXiPhcr9ZlveUz4sVT
	XEv6ffZ3UgIO1tp6ixHK5JiMF3VtydiCHd00/BtW2OQkmlVAxmzJirwMz3VgpmXXd48X
	4bVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=I5vV5v7k7AE2MKBWfCw2wrIzY0tRSZxW7kSa9CSeVWs=;
	b=jnGVq+tnJVG1r9RLgxcA8XO8wunrqgIyoyJjgGRskwiA0GlpHgigFXqeDUW20unPrp
	okXIU4cOcuvqPvPh6/UsCsXCk/9080alvPKIKEHnuuiwWVtjcBODToUaxUzcSqb4dv95
	dS/McXkDBTTyweuCBQ7SKaffJS8gEifWuhS0Wlp0BEAfsWCzWVSJ27cnDxsHD3GagotE
	AYcM5xUpLlPFWJJ84c5B3PWXpKoKPnXjJcrocfyqwUsjqlKq2WVs0J6g423yi7btAyHv
	HQdb/TFeOBqnA+w8RGnhbbSq1xWmALK319/EflN0HEmTPMCF5PkPikOuo4n1P4FIWeqW
	fbvg==
X-Gm-Message-State: AE9vXwMWp4GvxF4R9sw+FcPQN/bmroXq+Uh4xvfCPStC+kfU6xxPb9a9KBJ1wBZfRIEznA==
X-Received: by 10.25.208.131 with SMTP id h125mr638513lfg.214.1473287558955;
	Wed, 07 Sep 2016 15:32:38 -0700 (PDT)
Received: from [192.168.1.145] (ppp109-252-52-17.pppoe.spdop.ru.
	[109.252.52.17]) by smtp.googlemail.com with ESMTPSA id
	g68sm1485044ljg.22.2016.09.07.15.32.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 Sep 2016 15:32:38 -0700 (PDT)
To: Eric Blake <eblake@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org
References: <cover.1473252818.git.digetx@gmail.com>
	<1de89fe6e1ccaf6c8071ee3469e1a844df948359.1473252818.git.digetx@gmail.com>
	<c5767f15-d7cc-932e-a272-4f7d990d656a@redhat.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <555610a3-d643-1376-037d-4a3bb5090232@gmail.com>
Date: Thu, 8 Sep 2016 01:32:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <c5767f15-d7cc-932e-a272-4f7d990d656a@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v16 03/16] tests: Add ptimer
 tests
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Rlm5jUrvaxBG

On 08.09.2016 00:32, Eric Blake wrote:
> On 09/07/2016 08:22 AM, Dmitry Osipenko wrote:
>> Ptimer is a generic countdown timer helper that is used by many timer
>> device models as well as by the QEMU core. Add QTests for the ptimer.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
> 
>> --- /dev/null
>> +++ b/tests/ptimer-test-stubs.c
>> @@ -0,0 +1,107 @@
>> +/*
>> + * Stubs for the ptimer-test
>> + *
>> + * Author: Dmitry Osipenko <digetx@gmail.com>
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
>> + * See the COPYING file in the top-level directory.
>> + *
> 
> I'm not a lawyer, but my reading of the GPL says that for it to be
> enforceable, someone has to claim copyright (in other words, it works
> BECAUSE of copyright law).  Yeah, you may already have implicit rights
> based on country of origin, but it's always safer to add an explicit
> Copyright line; if for no other reason than to be consistent with what
> most other files do.
> 

Thank you for the suggestion, I'll s/Author:/Copyright (C) 2016,/. The
consistency with other files is arguable, because that variant I choose by
looking in several files and picking the most popular.

> Also, are these new files covered by an addition to MAINTAINERS?
> 

No, they are not. Not every file in tests/ covered by MAINTAINERS,
get_maintainer script returns sane suggestion for them based on the recent
contributors.

-- 
Dmitry
