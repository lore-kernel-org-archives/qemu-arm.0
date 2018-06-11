Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp4060422wrq;
        Mon, 11 Jun 2018 06:40:51 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKI3/7HwbZPgiyX6OqWjo2R2s1gffxVsaeEY5RaNwxrdtrR7a1ScBVtWK0sBA2KKsteyDiGF
X-Received: by 2002:a37:660f:: with SMTP id a15-v6mr14700690qkc.440.1528724451465;
        Mon, 11 Jun 2018 06:40:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528724451; cv=none;
        d=google.com; s=arc-20160816;
        b=YC844qtCNo+ApEIt5XP19hFWN6H12dhAignEEnGfWwPwrd0vWHgXEbLT/veIVnPma/
         2QpSicvede2W+B0+ZW1yGiEADi3JZyFi/zLM05spXvHRPEfCj8ouPfM52gtTM3uA4ZVi
         +7ensOZf8snHGh2k+uMDmlNCDv0xnIyDnNpYyBCIPLIeLBBMAImLExKkoxaBuSjcCLGJ
         8J3zmjOq6rkz1NeBnZgF1aN6ZRHEL9ZB8uzC/03F0mRddaa/1AwuyMsUFC3PumYWvCsx
         nr+P+EhRlaF3vwM0FcZIdx9ccSk0aqdwX4Et6YOQTpg+4k60gLmyxUWGXG4VFv4BZ4v3
         UE1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=BVO4X0bDIY9sP4ZiO/mKXwipQqGKNAPq5PcZVqE+JWc=;
        b=FIIFXH6qeVtKu436scChMsK8Xiy6DkWhl9B0HNkh3ySsmlGDbUY6v4stAuC2cMXrJr
         4iATuzoywN4FIJz5j6gDmYOZ0shpfDoiA9MluoTdsDruTQI6pGjwFL8ygbKI4/PYqXza
         bs+P7ccs7DuK61MAGOf2vD7DGXGlK4+K6K96MPTB8AsJpEtUptBrYPW298lk32JqDJVd
         A/TDMtnWChmh3tOrpTghLT74RMeI8FpQYyNGxePsRTuab8ZX3/T2tlXBekyM9k8BwOdT
         pdY73J/+ITrxAJT+oKDMqAXfY6+cMEZI6uXfMFEjK5J1HJ8WdIe91eVMWm77GoiBqb50
         FCHA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iyahGB2P;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 37-v6si891641qtp.243.2018.06.11.06.40.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Jun 2018 06:40:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iyahGB2P;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48907 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fSN3z-0007g4-0X
	for alex.bennee@linaro.org; Mon, 11 Jun 2018 09:40:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41330)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fSN32-0007Dt-IJ
	for qemu-devel@nongnu.org; Mon, 11 Jun 2018 09:39:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fSN31-0005w8-QB
	for qemu-devel@nongnu.org; Mon, 11 Jun 2018 09:39:52 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:35275)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fSN31-0005vi-LI
	for qemu-devel@nongnu.org; Mon, 11 Jun 2018 09:39:51 -0400
Received: by mail-oi0-x243.google.com with SMTP id e8-v6so17901729oii.2
	for <qemu-devel@nongnu.org>; Mon, 11 Jun 2018 06:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BVO4X0bDIY9sP4ZiO/mKXwipQqGKNAPq5PcZVqE+JWc=;
	b=iyahGB2PGb3t9U7D5XHRTKmbFj3Z/fBwHqdwjHh4RW2rRhGNtmOSLP6AI3aCneFVtj
	HF+QUKE9prKMpWXhOTryqpY3N6ABTzT8Ck1FrKlqGAggl7ooCanfEkwlz1TKVrzV3BKp
	Wn6Zsr5gA2Do6eplYqUaZsZ0PVLpObjl+NTHA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BVO4X0bDIY9sP4ZiO/mKXwipQqGKNAPq5PcZVqE+JWc=;
	b=D27ew/I86qI89MDdbjIzSM2IqsCcGlPJBGK+vf7pFV+HDTBytIAibpZtqpULXjQohF
	tK0+1/df6QEs7OsEvxXrYRkcHd6xwJySTnfajjO37GGELses1UOJut16QTYfZ5a+Cbw1
	fzQ4Tmz3XkazN3YzRp/V1Y7hfHCQQamQxrjPpLSNi5zVdDFB3/sCJPM5EZRpXbBv5Pbi
	XYz9bZK/9s6f+n8MJuNN2FfZQ09ranGplZeGhz3BwOPbqcoOf5Yk3ti5QfCn2TzrkI6v
	fSJsGGoH5x+KfBC49rc56+euZb9a68FOP80eYa4pgmiwj8i4/+iZhQ0DecS7LWaarxF5
	REDw==
X-Gm-Message-State: APt69E0i7HcaMh8xexS3gflO5Sh+Dkjz5Y33ebSa8IzHgFHoWN608zeI
	4lAbfvG8JqqTZIlzSv/SAUn9J3xuqFEdEc7WsHdhsUYJ
X-Received: by 2002:aca:f10b:: with SMTP id
	p11-v6mr2669949oih.80.1528724390771; 
	Mon, 11 Jun 2018 06:39:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Mon, 11 Jun 2018 06:39:30
	-0700 (PDT)
In-Reply-To: <20180606093101.30518-3-luc.michel@greensocs.com>
References: <20180606093101.30518-1-luc.michel@greensocs.com>
	<20180606093101.30518-3-luc.michel@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Jun 2018 14:39:30 +0100
Message-ID: <CAFEAcA_77paTb9e-H-OqVS_3JTFgufxhTj6dn3Gr82xk6ZygaQ@mail.gmail.com>
To: luc.michel@greensocs.com
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-devel] [PATCH 2/6] intc/arm_gic: Remove some dead code
 and put some functions static
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
Cc: Mark Burton <mark.burton@greensocs.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Sai Pavan Boddu <saipava@xilinx.com>, Edgar Iglesias <edgari@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Jan Kiszka <jan.kiszka@web.de>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MBcabOPvxyuT

On 6 June 2018 at 10:30,  <luc.michel@greensocs.com> wrote:
> From: Luc MICHEL <luc.michel@greensocs.com>
>
> Some functions are now only used in arm_gic.c, put them static. Some of
> them where only used by the NVIC implementation and are not used
> anymore, so remove them.
>
> Signed-off-by: Luc MICHEL <luc.michel@greensocs.com>
> ---
>  hw/intc/arm_gic.c      | 23 ++---------------------
>  hw/intc/gic_internal.h |  4 ----
>  2 files changed, 2 insertions(+), 25 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
