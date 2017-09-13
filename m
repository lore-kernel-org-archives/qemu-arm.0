Received: by 10.223.172.38 with SMTP id v35csp1260890wrc;
        Wed, 13 Sep 2017 09:43:43 -0700 (PDT)
X-Received: by 10.55.15.227 with SMTP id 96mr26876473qkp.279.1505321023822;
        Wed, 13 Sep 2017 09:43:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505321023; cv=none;
        d=google.com; s=arc-20160816;
        b=NNIpTisKhHWhRBPXOuU0yXhxhxNzUCWPicafR0yn4+OGGIMph0pkRvJ9Dq+bqFaDfn
         B8gfMJ2aVEkl5/PbrS1efZzjNumDVgfH2RTi5cIA8uhrhC92HHdZIjJmyjDJUDapTg6f
         QZ+pJVkhHkCAoHE4aYni9rwbf30PW65AvVkgEt8QWZJ7O6m8MG0GUJHHE3wjZ4tcjYW1
         wIwuoNCNEpO2oFfFt0kYGNlyGF5WPW2kxXaOj1LWHAX63WzginrGRdFJnU438OHKjsEN
         Xt0cwMiVqeG0vy+NGng0zUKcEYuxYD9D1XTgbKrmz8F1vv82yFNbIjq93CFRY5OTUlBa
         Pomw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=CYc1sJ7dbnH30ocvrflXFkV2ad2o3X3pEDDX7Qb8sD0=;
        b=c65X+ytpymgn0CQC6E4Gl8cqIMJCMTgWycuYSyQR2tPT+lCGmeqlflSOsacVcHI2V/
         PmVkbv2JxY6150h7p8o8JvyxuU0R9XJRlB5TlaKTpioj1pdBLilGTwi8qTGReVTIGZf6
         rUjHtkVjbu7lDbzWJg5iG+gjJBAuDvjp1NlHyCO6CdJFp3xoRLklRUtE8DR/keINfmHx
         VfBadtxL4yFS58fsfl0zmpPYefeh71udvd7gk1G/SQAH9S/gKVsMvejagZOWIeSbxunS
         izhN9RrDvmwHJK3VJZ8KymYT6fdN/TGPked/wZ6c7H6JtWm6E2GAKvQMsdrDFU/KKqm6
         mKZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PDCngi/N;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u46si15610887qtk.309.2017.09.13.09.43.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Sep 2017 09:43:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PDCngi/N;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43600 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dsAlJ-0006Yg-F5
	for alex.bennee@linaro.org; Wed, 13 Sep 2017 12:43:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39715)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dsAjk-0005NZ-RD
	for qemu-devel@nongnu.org; Wed, 13 Sep 2017 12:42:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dsAjh-0000W2-LX
	for qemu-devel@nongnu.org; Wed, 13 Sep 2017 12:42:04 -0400
Received: from mail-pg0-x230.google.com ([2607:f8b0:400e:c05::230]:47533)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1dsAjh-0000Uo-E6
	for qemu-devel@nongnu.org; Wed, 13 Sep 2017 12:42:01 -0400
Received: by mail-pg0-x230.google.com with SMTP id d8so1371886pgt.4
	for <qemu-devel@nongnu.org>; Wed, 13 Sep 2017 09:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=CYc1sJ7dbnH30ocvrflXFkV2ad2o3X3pEDDX7Qb8sD0=;
	b=PDCngi/NAXTTpwjY3aMpnzm/HmmE4XyJuOC895wlk7ef0aetWmJ/YsHvFSDAvHsPsk
	2P78pt7hTZ2/vd0D9HuTTxZxEeHj8aFT79Fo+uD82CkjZ4GnpzRWG3+CQNCaQIX/Tq4o
	eTT89OYXbcoiHrMWP0+mIVv9ErIY6rM3ohsiw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=CYc1sJ7dbnH30ocvrflXFkV2ad2o3X3pEDDX7Qb8sD0=;
	b=d0RkBmfSIdRMwmwb6ybfwZ6h0nIx+MBSRM+WAo/D52VB3DDKbjqo2NEgS4KMFJODav
	DTb9OQkOA9CITttO/qAi+H6TMywnJcxiFrdBn4JEyS7KKomozFBWUyDAsBjwQOqeQgxX
	8j+0dRxZLdYy6l/7iNkw7qbsioulrSoLBS6QSX7MS8G8WTHoWUVDRLWl32Q3wpN/ALMX
	HTuVRyaV3ryV6IHbufZjNr1aBnhPqBfouX3GBfCdVYYQGppV43CZybOB2ZQ04yCZYYEC
	NkupVWI7h6oZjHkz6OPoewhK3ceF60z3LhIJGCWfnCuc4bOzWVXDxgXBX0U+jUR0Io2T
	NE+A==
X-Gm-Message-State: AHPjjUi7EgmAGqwd/hRvLVKMOTJe7LF165DUYNTB7jz0BaLaAVsrd13P
	cJXso3BvZFz3PRFe
X-Google-Smtp-Source: ADKCNb4vyL29Qc13W0lyyXwz5gxuoE6rjJVLfoDassIGbEj3gXHi8L1aKRhQiTISlyvXjKd4BdDtVQ==
X-Received: by 10.98.60.220 with SMTP id b89mr18226733pfk.82.1505320920374;
	Wed, 13 Sep 2017 09:42:00 -0700 (PDT)
Received: from bigtime.twiddle.net (97-126-103-167.tukw.qwest.net.
	[97.126.103.167]) by smtp.gmail.com with ESMTPSA id
	o17sm10847153pfa.22.2017.09.13.09.41.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Sep 2017 09:41:59 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1505137930-13255-1-git-send-email-peter.maydell@linaro.org>
	<1505137930-13255-8-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d3c3c1e9-8dba-14a7-7d1a-2234473ac85e@linaro.org>
Date: Wed, 13 Sep 2017 09:41:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1505137930-13255-8-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::230
Subject: Re: [Qemu-devel] [PATCH 7/7] target/arm: Rename 'type' to 'excret'
 in do_v7m_exception_exit()
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
X-TUID: uv5BuJTBSDgN

On 09/11/2017 06:52 AM, Peter Maydell wrote:
> In the v7M and v8M ARM ARM, the magic exception return values are
> referred to as EXC_RETURN values, and in QEMU we use V7M_EXCRET_*
> constants to define bits within them. Rename the 'type' variable
> which holds the exception return value in do_v7m_exception_exit()
> to excret, making it clearer that it does hold an EXC_RETURN value.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c | 23 ++++++++++++-----------
>  1 file changed, 12 insertions(+), 11 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

