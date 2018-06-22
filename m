Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp1278972wrq;
        Fri, 22 Jun 2018 14:13:02 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKL4efEs2ac8PgascC9VDdtZOYwkXbg+Vu1oCIVy6rR3fepLo+4ZhdIbZdB9mQ+qx5m9waVN
X-Received: by 2002:aed:22c4:: with SMTP id q4-v6mr2999777qtc.145.1529701982409;
        Fri, 22 Jun 2018 14:13:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529701982; cv=none;
        d=google.com; s=arc-20160816;
        b=O4CVSBCVID/ZkIqU4QejYini9yXkdFfqr5ViUS4ktV94YJZq8rXxCVofeWfFkLphxw
         Ar1a4iHTqNrrs2voyrvPWujYit4vACoFSBDbu6ps8TQjb8WQpa9hgVPaDXDFBBCnB4I+
         gcTNQDWSO1uKaCJk19YUJX9oYmNrI6sEjquUi8FRXOUc//62+WyHIuO9pKVMfHXEiSui
         f8aaECYVz8SSZ2QpKTVzgcPkIOudOP+Eya+8Ewq3w3h0szxc1xs3OhUAcutGtNPrhi1D
         3KQMyodXXx5vbJxSHAG5NWmxTVoPoHTR5YkHIGuFIcpYptbDef4oemo7LwnMpjHdbk/9
         jLeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:dkim-signature:arc-authentication-results;
        bh=/2QAdcbV2nEBZpHuTpQxrrRIVSaJaBF2khwYcyO1qqI=;
        b=DceAvToHRrjkKWKI4AhwBrf6GwXuRgpNx0wtdv6r0WU+bdQM8qEe9USLEZd7N3Y8ZZ
         md9stnixGhD2SouyKNU6A0+mxnuuXkm0g86CESP7jzvinimaxIdMTJTcAyphnX0G6j/b
         ydf1URlqZGsuCHOQCEugCZaE0KHUS6hLllAOboA7/gJKlBXHwghGXyRFkpWf63mposIu
         3/GbWUsutq+w5qvZFz45pVpA8dQKJ82y2M1p923R0C2LRAi9ogQ9RTZ9E+TAHsLLWFjN
         PGXcwJxXaTiu+H/QVMLeYPKw9/O3MZSAzgOsUnEMOXk+EJLma9X4Nvpgysluvz9AG7pG
         Cufw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@braap.org header.s=mesmtp header.b=sNoRIgfN;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=udEoqT6+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l1-v6si1898342qvm.219.2018.06.22.14.13.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Jun 2018 14:13:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@braap.org header.s=mesmtp header.b=sNoRIgfN;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=udEoqT6+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36228 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fWTMb-0004aK-Tp
	for alex.bennee@linaro.org; Fri, 22 Jun 2018 17:13:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33006)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1fWTMQ-0004Yq-Va
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 17:12:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1fWTMM-0001G7-1N
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 17:12:50 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:35555)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cota@braap.org>)
	id 1fWTML-0001Ft-Ng; Fri, 22 Jun 2018 17:12:45 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 4434421AFB;
	Fri, 22 Jun 2018 17:12:45 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
	by compute4.internal (MEProxy); Fri, 22 Jun 2018 17:12:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
	mesmtp; bh=/2QAdcbV2nEBZpHuTpQxrrRIVSaJaBF2khwYcyO1qqI=; b=sNoRI
	gfNgvXv2IXvw9lnEEJDnoSXwIyFvoCFhyGy+ZEGGkT8LsyoTADS/naehnK4CpF7R
	ytgAO0l9ZtBP40vt9dc+ETZBJHjfsxMa6bniIPti1iihYzBtoWFCb00BnVwNOjPt
	0hsgjGh7DM60UyRkTP3q+jfUDTnnocIcrxbeyI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; bh=/2QAdcbV2nEBZpHuTpQxrrRIVSaJa
	BF2khwYcyO1qqI=; b=udEoqT6+lQrOiiVTEKTDPh8Vrlw8ETTdV8wxmcAVAX86K
	IGPJrA0S7Txell5qu/THDSLD/R3BIzcyLkTF9HthvIN9FfWgPm2X3q/gR8i+Q2NR
	x02Z980togwB3YSOZBtzmixo/G17TE+sTxcTakB1xVKa8WQJno5BERhZwUrB+zX4
	t7XJgoExv6zPB/5zR1MM3MK+1yfSL+zKqQszqPV/bhYQu5evoAYHItDX8gOyIR1n
	DX/yiQkn5PgalkU56kOnTpFeUn55yo9Kkdtsh6Dl+S1zD1SMxFvE1WRdP41/XlJN
	z5VdW441dleSSvRqOvgQTYMcuNAHM5NKS76QNwJ8A==
X-ME-Proxy: <xmx:TGYtW6RNPR_4GAHy5DXxcFobKKzcvzFhmWsvDLQjmWzZuE5FtHrEcw>
	<xmx:TGYtW1lDLrAhCN5WUc7xtTZF3kotpcbg1NW3v5zuPQigRf1rMYdWVA>
	<xmx:TGYtW861Vdoy4a3TtZbsbXu9XRBF-ZxSoRGuPltHokseZhJFAx6uwA>
	<xmx:TGYtW1CDWmNFLMRFbKKHdEc6FFiXrwpF7rntuI43kQanbmOuQVQ1Uw>
	<xmx:TGYtW9yf29CCqQXgplDnH4dTfqUEM8gXe3VcIwsLZ51pMXofksvEag>
	<xmx:TWYtWzXlKPfMQdog-qfCj_Z2ecASNr32mAmVn8sxpFVQWgKohW-udQ>
X-ME-Sender: <xms:TGYtWxo5m6KzUA3Fhj_IdmXYFETYUVCOEBwHzYwOX-BsW7OYbEgiFQ>
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 9F60710252;
	Fri, 22 Jun 2018 17:12:44 -0400 (EDT)
Date: Fri, 22 Jun 2018 17:12:44 -0400
From: "Emilio G. Cota" <cota@braap.org>
To: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <20180622211244.GA11346@flamenco>
References: <20180621173635.21537-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180621173635.21537-1-richard.henderson@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.111.4.26
Subject: Re: [Qemu-arm] [PATCH 0/2] linux-user: Change mmap_lock to rwlock
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, laurent@vivier.eu
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1tjqLDBuioYP

On Thu, Jun 21, 2018 at 07:36:33 -1000, Richard Henderson wrote:
> The objective here is to avoid serializing the first-fault
> and no-fault aarch64 sve loads.
> 
> When I first thought of this, we still had tb_lock protecting
> code generation and merely needed mmap_lock to prevent mapping
> changes while doing so.  Now (or very soon), tb_lock is gone
> and user-only code generation dual-purposes the mmap_lock for
> the code generation lock.
> 
> There are two other legacy users of mmap_lock within linux-user,
> for ppc and mips.  I believe these are dead code from before these
> ports were converted to use tcg atomics.
> 
> Thoughts?

I'm curious to see how much perf could be gained. It seems that the hold
times in SVE code for readers might not be very large, which
then wouldn't let us amortize the atomic inc of the read lock
(IOW, we might not see much of a difference compared to a regular
mutex).

Are you using any benchmark that shows any perf difference?

Thanks,

		E.

