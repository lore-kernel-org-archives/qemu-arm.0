Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp890366wrq;
        Fri, 13 Jul 2018 09:44:42 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpe5SztV0R0kXbBMEbqzvCIpg3sAbGePoWMXUBBdGR22Iif/oAcZ9+FO+/H8i9j1JOwttnVk
X-Received: by 2002:aed:3ddb:: with SMTP id j27-v6mr6655716qtf.258.1531500282029;
        Fri, 13 Jul 2018 09:44:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531500282; cv=none;
        d=google.com; s=arc-20160816;
        b=RhK1DeeOl01iJqXU4VdYdjHmEVUVudpo8aa9wUDDBWMVvb7NUYx38pS9iAh0BjXZwk
         dznmhHZnUsQykCRKbWo4cW65Y+RuMAxcu0jgJgKrsEUoyeDIihzL4fxFFeB/fJywI3Lx
         BnzOCZfqxZYpPv16FhZzCNjGSuXh1e3WDwopc5tsFec671OKbuAAemj7rSoKTJ3mhA6o
         Yi3/GL2tgBLdz93UFQNM0h/Sz29sEJTo/JljZ0bqtDbygsbi9hYfZoTtF/aZ0fwcFkCV
         OWFtnLNrlUVqxdUkV9RGNXpn9TpYEwmOQRgjDvQXUE8ayuwavRC5kG53Lfw0GALAcmPF
         0cmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:dkim-signature:arc-authentication-results;
        bh=R+16ImfUGWKK+jYnQ1p/XKzrCEf/p1J3Zfg8Q6nc2xc=;
        b=SHrxz8Q8tSa2Kht8b3k4uGUIM1QgYXAs9hon/op7g3SwKObIHEaHnxtntlUezcMlei
         8C2StVesblq6sFAj9WjdYXJyuGTjHtRv/GcPxQtMK8TgvyZVTEHb8l++dSmSKDc3UVBk
         Kq0VaWamePS7NEEsuPhBqUW/rG2LiXpY1YMuyGPh1fxMzKZbVlIBGVtdZs2koxI/WhOp
         csa5ySdnATPQIqpQNv762VWfG0B8bZlEQZnQ3j5z9mx8+VJz8vm3pFC/Ic6iO9kbs2QS
         EzG8xEa86VucE2blyU2nbj4TBB/DRYOBJla342Fxtm4H1JJVGC0IYIsUNGCOSqoLjcGP
         RWfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@braap.org header.s=mesmtp header.b=xVdVoRK5;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=eMMdvSH7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p79-v6si83664qkl.154.2018.07.13.09.44.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 13 Jul 2018 09:44:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@braap.org header.s=mesmtp header.b=xVdVoRK5;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=eMMdvSH7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38368 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fe1BR-0001C1-IW
	for alex.bennee@linaro.org; Fri, 13 Jul 2018 12:44:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45194)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1fe1BG-0001Bq-MB
	for qemu-arm@nongnu.org; Fri, 13 Jul 2018 12:44:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1fe1BC-0005O5-NP
	for qemu-arm@nongnu.org; Fri, 13 Jul 2018 12:44:30 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:33493)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cota@braap.org>)
	id 1fe1BC-0005Nd-Hq; Fri, 13 Jul 2018 12:44:26 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 29CF521CCA;
	Fri, 13 Jul 2018 12:44:26 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
	by compute4.internal (MEProxy); Fri, 13 Jul 2018 12:44:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
	mesmtp; bh=R+16ImfUGWKK+jYnQ1p/XKzrCEf/p1J3Zfg8Q6nc2xc=; b=xVdVo
	RK5XQwW23AjQQutp1W9wbnqMzwo6xi3GEuAetm4y9IweEKu2z00ge1sMnspK3C2a
	n02kL9ZF+6Eq00cEo+BOBcHKRVq81hfXApBQTdmMVMgr6sen0uXZvd+msTBlX8Yb
	mJ+wCtIH806f2BSUgAxE5ZNblaAGB0RCvKveg8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; bh=R+16ImfUGWKK+jYnQ1p/XKzrCEf/p
	1J3Zfg8Q6nc2xc=; b=eMMdvSH7WhlQZGfJw438HgtlunlDLtvxefozfdEKOWZ5Z
	iO4dWoHD4nsRDZdjbTKRclbLHYeP+91FV0ewRKhBZJrj3aJwpoqQC/KTT2i0Pn/a
	DCxKd8o3fPTcRLzpvv8FkUmx7w0AVgRlWgirZoJQurCk8Itt7W9XNRSI5kWNONF/
	3b0lnj/k9uSo4S1j5KHAAWfvPeoZhuYEJGAS1WHfJjFESRFcZ0mK7wXl6PrqVc3Z
	1nIjbBEW78hYEX3992eUifJ0O0ODwbrfsgcuxrj5JmDIxdFWrIfCunNA7+N01cqZ
	aX/Bnk9Wh6DpujWxzyg5sV0/SaQrPFTb7LOjyuBrQ==
X-ME-Proxy: <xmx:6dZIW9PF7PArK4mIE4MVUiB6aTHcFjpy6edl-W_sqbfbCawzXdHQcw>
	<xmx:6dZIW8pHAxTICcBi6Qfo3xGiljDS41auOVWxIETuNQJ2vS1E3JDTKA>
	<xmx:6dZIW8t_d9G_9KWFdMcma2Sp3lJSbbjPmYpe3oG4FsGgEsaog1aMCQ>
	<xmx:6dZIWwTnEcpf7bfqK-_pNngBftpdwjJnUT9jSac666afrhHpMkfBFw>
	<xmx:6dZIW8BnSERLUKzzrj9Y_INyswJEqLWnVQCIxVGH67CWGBG29_uS7w>
	<xmx:6tZIW7IAIfWJNAEOw3KGqPega2KdgKq_vgXeLIsFkyGuRccscYTOHA>
X-ME-Sender: <xms:6dZIW8sTWmyESc0Md5gqklnyB4jMCY_OlP1ljYdyPelZHdiQp2QrNw>
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 3E792E4B34;
	Fri, 13 Jul 2018 12:44:25 -0400 (EDT)
Date: Fri, 13 Jul 2018 12:44:25 -0400
From: "Emilio G. Cota" <cota@braap.org>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180713164425.GB22074@flamenco>
References: <20180710160013.26559-1-peter.maydell@linaro.org>
	<20180710160013.26559-3-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180710160013.26559-3-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.111.4.26
Subject: Re: [Qemu-arm] [PATCH 2/6] accel/tcg: Handle get_page_addr_code()
 returning -1 in hashtable lookups
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
Cc: patches@linaro.org, qemu-devel@nongnu.org,
	KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm@nongnu.org,
	=?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 02+ilRCtCJge

On Tue, Jul 10, 2018 at 17:00:09 +0100, Peter Maydell wrote:
> When we support execution from non-RAM MMIO regions, get_page_addr_code()
> will return -1 to indicate that there is no RAM at the requested address.
> Handle this in the cpu-exec TB hashtable lookup code, treating it as
> "no match found".
> 
> Note that the call to get_page_addr_code() in tb_lookup_cmp() needs
> no changes -- a return of -1 will already correctly result in the
> function returning false.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Emilio G. Cota <cota@braap.org>

		E.
