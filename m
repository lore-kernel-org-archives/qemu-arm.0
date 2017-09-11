Received: by 10.223.172.38 with SMTP id v35csp5627470wrc;
        Mon, 11 Sep 2017 07:40:51 -0700 (PDT)
X-Received: by 10.55.12.133 with SMTP id 127mr14812833qkm.251.1505140850857;
        Mon, 11 Sep 2017 07:40:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505140850; cv=none;
        d=google.com; s=arc-20160816;
        b=wqBaep3uPmP8itwgV70HLRzXeFVMxK11UXT+PXIFjgKFbOEEAxvPleHq1FfQoB93RA
         LMQbFrUDhrlz1TkDtiBGubIEvvCnQ4My5iqFsD7QPWtwb3sN4IJDb9vCoFdTu+MdPUQs
         fEYIFaehBII7MDuRo6kmzYhrs09+sOnU2hlMXAZp6Rtr3QMSUqobFNfqhIwtOtBm81dJ
         UmAu+JBJqID+UewJ2UtKQDFofZMM/aUUdNiTck7NJ8llvfCTTbbzcUDPTQkeXywpzzpi
         B52bFi4xDuMxvmxBUhf+kgbunJLvYDU2UIMIdO6Hv94kogwKawAkKTfmAhJUcvv1PCkY
         ac7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=MuMo85r3apztMDgni/MRHqbhbTvHnGiBWEk4ElK3hTU=;
        b=BZb7GAAMH9IdaKym0pyY4ymYmE2T1UR9qf76Bfp8g7be9GCyw+fu6CZyx/pmpTQZD9
         30w8zo1+q6KEbaDd0U3wzQShhVbrJcYwewSS85apUqqdaRe/UQiR8ClsacdX1KUVztLa
         kgfNZJKD3HCsRTNNTd5uO/eeObMxIlcWyZw7KOVOoNOo7ETtKOETcABXdokRcHrT3tKv
         Fx0rF81DwWnp/F2DF0Dkznvgrw53vT3J2qWHjSp9ugU84F5dPRk/+iJ94Mdnx6cg15Pd
         LEioUGXNHNhncHHJ/1kUIfuJIczt2Gm1mc3iznNsK2/v6tLkIyDC4nXbYvNszhcZgPUj
         8qpw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WdopzJD+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n63si7290795qtd.474.2017.09.11.07.40.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Sep 2017 07:40:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WdopzJD+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58159 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1drPtI-0002J5-LK
	for alex.bennee@linaro.org; Mon, 11 Sep 2017 10:40:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56987)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1drPrw-0001Uy-Ij
	for qemu-devel@nongnu.org; Mon, 11 Sep 2017 10:39:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1drPrv-0007Ww-Mb
	for qemu-devel@nongnu.org; Mon, 11 Sep 2017 10:39:24 -0400
Received: from mail-wm0-x22f.google.com ([2a00:1450:400c:c09::22f]:45634)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1drPrv-0007WA-Fm
	for qemu-devel@nongnu.org; Mon, 11 Sep 2017 10:39:23 -0400
Received: by mail-wm0-x22f.google.com with SMTP id f199so41494434wme.0
	for <qemu-devel@nongnu.org>; Mon, 11 Sep 2017 07:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MuMo85r3apztMDgni/MRHqbhbTvHnGiBWEk4ElK3hTU=;
	b=WdopzJD+uxNH1f/SES70MCec0UOAKVSAqD1jEBwwFliPaZ0ksm+XJzpn0bJjtS7j6H
	iTRGpB9g8V/5EX3nhj03d3OhpniWCWWe40L/kfL9tpIlE5qDQnPB6P3pGzVEv+2FbCE3
	AvVlPC2aamFN9FKuBlkdBUNgNtoi/5Sw/SFpg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MuMo85r3apztMDgni/MRHqbhbTvHnGiBWEk4ElK3hTU=;
	b=HbV6ocWi+X5zl5WEnSAY14PHmN1BvbsMSG0xU+lJ2hqHaRyqF1tf36r/H92FZu6PdE
	clKB2WVTz1WqRJHl7E4esI4IR3xa6Suz24EPFGcD+wLkgDYN98PFuneR2/H5R3vYwduf
	tBIt1s9LfsKIRseAUzzi5qhO9E3sCaFkqB7/YZQ+06ioJSiYiBxKI8RctyMu2bhLlntN
	/G2RnQfYXiZJrLFwBizGhBQwAQsY8WN7Fl3Y9PrjlELASqKoTPydPK2MWtdHuxk6b4UM
	xPY+u7ikKu+YQfwhpJzHz9txsaWTekh9w/KMXGlnkVEPl05qbg5gEKrBhTCnBQwwoBH2
	FJCA==
X-Gm-Message-State: AHPjjUjoGiRACwPoCKk8ogeC5V3yKvg/mXPjZ8Bnx6q+i88Qu2Oag0lb
	dCuBJfLmysqy+8NlOngrZC8L+7aa3m9t
X-Google-Smtp-Source: AOwi7QDUU26/F8WNKgFhxUEpXXW/9JnQZIylG6VhsUlNzC3iMM2P+0+b3SXDdp4v0dOhQRELB7jMCxOiLJfxUwwN8v0=
X-Received: by 10.28.52.81 with SMTP id b78mr7037885wma.11.1505140762224; Mon,
	11 Sep 2017 07:39:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.139.215 with HTTP; Mon, 11 Sep 2017 07:39:01 -0700 (PDT)
In-Reply-To: <20170911142056.15643-3-lvivier@redhat.com>
References: <20170911142056.15643-1-lvivier@redhat.com>
	<20170911142056.15643-3-lvivier@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Sep 2017 15:39:01 +0100
Message-ID: <CAFEAcA_G8mEzB0Mox0TTz578LQKXgvhNHeZ8Bk7OwC4NbqiXPg@mail.gmail.com>
To: Laurent Vivier <lvivier@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22f
Subject: Re: [Qemu-devel] [PATCH v2 2/3] hmp: fix "dump-quest-memory"
 segfault (arm)
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
Cc: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	Greg Kurz <groug@kaod.org>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1/hu46xhgPII

On 11 September 2017 at 15:20, Laurent Vivier <lvivier@redhat.com> wrote:
> Commit fd5d23babf (hmp: fix "dump-quest-memory" segfault)
> fixes the problem for i386, do the same for arm.
>
> Running QEMU with
>     qemu-system-aarch64 -M none -nographic -m 256
> and executing
>     dump-guest-memory /dev/null 0 8192
> results in segfault
>
> Fix by checking if we have CPU.
>
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>

It seems a little arbitrary to assume that if there's no
CPU what you wanted was a 32-bit little-endian dump.

Why do we have a machine without a CPU anyway ?

thanks
-- PMM
