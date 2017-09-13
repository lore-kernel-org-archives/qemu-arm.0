Received: by 10.223.172.38 with SMTP id v35csp1207167wrc;
        Wed, 13 Sep 2017 08:55:50 -0700 (PDT)
X-Received: by 10.200.4.158 with SMTP id s30mr27759073qtg.311.1505318150656;
        Wed, 13 Sep 2017 08:55:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505318150; cv=none;
        d=google.com; s=arc-20160816;
        b=lx8d8bMD6gdIn9AqbiLbEGDzGUCVOSp2Bto6iByW9K410tEup33IplC89zQeIrRVmp
         j826h/FUKQxASHh9pBomfoklZz6VQgMx+KxS6agDa6w5NhfiNxA+DYEYyE0h/veQLeVx
         aaYS8R9qxCQJ5SQhfcKUFjY2kf8illSD73LEsUKytpqXGZVbBBgQUs6LwNwY3Ilg+MKJ
         osLAs3ipfu6cI9G28JEtdbDb19EeMuWyZSZQIwo6F22uYv8zRCYLRDY8tHPZaiztoptj
         2u2630g683jyz/gmPBTXFcLBkn5M3JZ1Rca0wj9hmBj5rZFMNKs7VtxCkGBoFOcCA45Y
         UfEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=sqP/23y6glbamxO/IyM9ql16op49juKe71/SfarlEGo=;
        b=Hlv/0q6YFt9PLQ4UVFx9XottsObE0nqqVWaFBibWptDbLviNTcaApxRGYaCI4idgvm
         k/ZRlSlqtofZ2urH8Qq2OhL7nuoFuDHFIXClq51//cXxVidE4OjZjDLTPk2Qa6xG+ZiU
         GplAt0tKhpW6lRwCLxEQdBIqPcIr7EBMkn+wk2d88PEFoyOCtYrx4s86C+ZA65fH7Cjj
         UC4NNoJbrtkY/7nHpHGu/GH/FGB4Vmmhsn9b7aMMpDXggXVP+ryhMwBFC7fwxhWMZ1T8
         JJEpYg1eZvpw978Y4Tjs+uYO6v73b1IfqnLUi9xNmZB6daZz2B7cWieVRV7zm2sBacUs
         yaSw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=d1BQU+hD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f43si14761474qtf.311.2017.09.13.08.55.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Sep 2017 08:55:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=d1BQU+hD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43178 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dsA0y-0002tJ-EF
	for alex.bennee@linaro.org; Wed, 13 Sep 2017 11:55:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42494)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dsA0p-0002ry-NE
	for qemu-arm@nongnu.org; Wed, 13 Sep 2017 11:55:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dsA0l-0000Ro-KJ
	for qemu-arm@nongnu.org; Wed, 13 Sep 2017 11:55:39 -0400
Received: from mail-pf0-x22c.google.com ([2607:f8b0:400e:c00::22c]:43983)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1dsA0l-0000QO-DO
	for qemu-arm@nongnu.org; Wed, 13 Sep 2017 11:55:35 -0400
Received: by mail-pf0-x22c.google.com with SMTP id y29so921213pff.0
	for <qemu-arm@nongnu.org>; Wed, 13 Sep 2017 08:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=sqP/23y6glbamxO/IyM9ql16op49juKe71/SfarlEGo=;
	b=d1BQU+hD0eqrh/XW3miTR0rqvL1F2j/r2fQK9A6rF9wFUVHOC4DWm5cTwKmUKKefwU
	/6NgAPmQ/MdtTRagVmPA+gdv+z5tX0XOkGrLsPXeV8vqQoXn/8UuMVlpBYcyewncqbIg
	d3L+WDajS7UvMynDbl8hWpASZjkNzH1zTX1XM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=sqP/23y6glbamxO/IyM9ql16op49juKe71/SfarlEGo=;
	b=jyOaFe5NPAi0SLI4h+A4YF47YGyzHBlzBxbIx2xeyR5+ebZ5hg637d74Pg4/xpIaox
	R9xWM4mfcp8rurwoKu0VceQEd6RYdj9reB45S6Iryyabts44Awe6e4gXSru7jHvLbzoG
	kytTwCY01i9TVkw6O2eHsA5DBBVfn7t01B3/oIk1z0IcNCMApnjQkFyUGsvhhH+7QBAW
	iimo+ZkfrkJsUGGpN/Jnp0xkAD+PpwN7gwAnCkvlZIEO7Br6aI4+HWFZdArOCtJpKBpS
	Fg1+5PetT1PmprCmSM+Tfaa7RpAqIl5p9h0D+CMP/1mwICEso8f4jK09+ZGzfMuKfrdp
	ySnA==
X-Gm-Message-State: AHPjjUgPC7yj6NqtkbvnvImeaPUyqzQEVNTMVOzFZyPWgsLxfOjAWgyQ
	yquhiEsfqgA209ap
X-Google-Smtp-Source: ADKCNb70jss/1KRo0aEPr8xHm2Cz8y18qMhpYfI2nRo7/CIAlMwYvR3RxrblRycay4sEZnDlRgurXw==
X-Received: by 10.98.149.208 with SMTP id c77mr18253919pfk.330.1505318134369; 
	Wed, 13 Sep 2017 08:55:34 -0700 (PDT)
Received: from bigtime.twiddle.net (97-126-103-167.tukw.qwest.net.
	[97.126.103.167]) by smtp.gmail.com with ESMTPSA id
	k27sm21186915pfk.20.2017.09.13.08.55.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Sep 2017 08:55:33 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1505137930-13255-1-git-send-email-peter.maydell@linaro.org>
	<1505137930-13255-3-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <608a9eba-8a22-aa87-aa2d-b67669bad17f@linaro.org>
Date: Wed, 13 Sep 2017 08:55:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1505137930-13255-3-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::22c
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 2/7] target/arm: Clear exclusive
 monitor on v7M reset, exception entry/exit
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
X-TUID: riBNhT3/CRzH

On 09/11/2017 06:52 AM, Peter Maydell wrote:
> For M profile we must clear the exclusive monitor on reset, exception
> entry and exception exit.  We weren't doing any of these things; fix
> this bug.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/internals.h | 10 ++++++++++
>  target/arm/cpu.c       |  6 ++++++
>  target/arm/helper.c    |  2 ++
>  target/arm/op_helper.c |  2 +-
>  4 files changed, 19 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
