Received: by 10.223.161.27 with SMTP id o27csp722389wro;
        Thu, 26 Oct 2017 06:39:17 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+RNPBMYWC/NmgDyHeau+8oX9bPC4iQuwa1JpfcwyrxPkgTx6u9J037/jEKeOlUX14CABNXV
X-Received: by 10.37.191.136 with SMTP id l8mr3554629ybk.474.1509025157588;
        Thu, 26 Oct 2017 06:39:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1509025157; cv=none;
        d=google.com; s=arc-20160816;
        b=er0xqjkrHPzA3hsOjDbszZ+E5TgayGpqh08HDBTGUhdlDEAmRsEuoIPGTuxyyNir0U
         1Veitf4OYqInqNlACtySfrFbfLKRJ9f0nDkrZ0cuzhxGCv3ks2LI11J/F3FqmlKoEBUe
         n1k34eNrCmIhdlEmqbJbbXsSTHFOU+xoXJ11/ie9dWl7Mt/56cWbcNM8qI/LxSzsMCfO
         9dD6JQnqCGWFf4Nk4CbVnoDMDTSclJsRj8RN66z0gKxgb+CpfifkAeo0stC/8d/CBwTx
         AomxhsBXe/lC1W37r6GR/2J11N74CSjZVp7zpht0AX7dQoR92fFPsI1EbijQBVAiCK4U
         PDpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dmarc-filter:arc-authentication-results;
        bh=uR4ZCCYGBPCE6sQb5pKB0fjjyFIaV9gGa/EhXTh/kG4=;
        b=Ilba2UtwB+/HWpS8IQFgRPVlAb9iJiPFXByITu8jgd1eKBl/W9nJfUx+QxMgt+w8tf
         B9XVWRQacUusBYR+uOQzS8Qr2T2XSBdeEoukjz4lZX0hxNRfFCOrzikNJ3wPrdtCVfeB
         CzXk3obbokH8oZj2zFFMe9DA/dZccktK6rvqgH5QEKi977D8GZ7wrWLTd3TVHw1FEkmk
         iA/okg0ixoz1s1KEWyK63ugty8CFXajkUf0cWov7WsHMifZVrpNW+CPk52kfd1By2vE7
         DX46CQ1Eop4C0wxnx3SSYuacOSUxhpKQT2mAZl76U/8U+bhVqO1Co7ZLBRbVf56Kl1oZ
         /2Xw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e127si822633ywb.645.2017.10.26.06.39.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 26 Oct 2017 06:39:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52971 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e7iNR-00016w-0P
	for alex.bennee@linaro.org; Thu, 26 Oct 2017 09:39:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35278)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1e7iJH-00061t-CD
	for qemu-arm@nongnu.org; Thu, 26 Oct 2017 09:35:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1e7iJE-0006SH-OJ
	for qemu-arm@nongnu.org; Thu, 26 Oct 2017 09:34:59 -0400
Received: from mx1.redhat.com ([209.132.183.28]:62594)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1e7iJE-0006QD-Gj; Thu, 26 Oct 2017 09:34:56 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CABFA2CE97B;
	Thu, 26 Oct 2017 13:34:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com CABFA2CE97B
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=drjones@redhat.com
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B90B7F76F;
	Thu, 26 Oct 2017 13:34:48 +0000 (UTC)
Date: Thu, 26 Oct 2017 15:34:45 +0200
From: Andrew Jones <drjones@redhat.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Message-ID: <20171026133445.kemzfgvpbmtcogsl@kamzik.brq.redhat.com>
References: <20171023122719.17199-1-Jason@zx2c4.com>
	<CAFEAcA_PM5Fjx2Pk58h75p9vaZwFcusQdXuwy9tbDtc=EaoOJg@mail.gmail.com>
	<10e16ca3-175b-9f34-65e7-031b883b7201@amsat.org>
	<CAHmME9qtBiuAEnkCeuMd7EdeZveTVa4UOf+AQhMCFye0SYJY=Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHmME9qtBiuAEnkCeuMd7EdeZveTVa4UOf+AQhMCFye0SYJY=Q@mail.gmail.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Thu, 26 Oct 2017 13:34:54 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw/arm/virt: support 4 serial
 ports
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hltI8E5815Q8

On Tue, Oct 24, 2017 at 07:57:37PM +0200, Jason A. Donenfeld wrote:
> Hey folks,
> 
> In case you're curious, this is the kind of hideous workaround
> required until this is fixed:
> 
> https://git.zx2c4.com/WireGuard/commit/?id=2456a56729f7247bf88476317fed0ac822a31e92
> 
> Please let me know if you intend to fix this or if you will accept
> working patches from me for it, or if you simply don't care.
>

You could make the PL011 user instantiate-able and make the necessary
changes to use the dynamic FDT node generation framework (sysbus-fdt),
and then you'd be able to add as many additional UARTs as you like to
mach-virt's platform bus. I played around with that idea once, and have
some patches rotting somewhere that could maybe be dug back up.

drew
