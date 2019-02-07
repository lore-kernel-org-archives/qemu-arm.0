Received: by 2002:a5d:4506:0:0:0:0:0 with SMTP id s6csp47320wrq;
        Thu, 7 Feb 2019 08:50:08 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYJYv94CPCucREuUmctmKuY2fbJqwsE3PTy/H3Fwltu3Lc1wtpIzKzzRVHrcDFani9C0cSr
X-Received: by 2002:a81:b147:: with SMTP id p68mr14435633ywh.352.1549558208107;
        Thu, 07 Feb 2019 08:50:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549558208; cv=none;
        d=google.com; s=arc-20160816;
        b=B84+PBNC6C5LmPBjTxEOyKwwR9fnUS9DIXuT7+KE3ydnEVBeH9/V8BSsqEmh94h70/
         4BFAxZWPKsFNT5NZWGEB1n+aDpR0WhABli846ugMTDsR5qqyhNIsetAyiJp2ffblJ5DL
         qqSjmmQdOGQkYuVix9P6ey4qZ41WxCqjQwKyQDPdRI64zIaSyfVdGC2VdPavHzirM71G
         nye+D1LYLx9IeT67+xu5V6cQBTr8hTzsnCJrjEzlS+DzljWy3ATCwKqcPGPbJkkig1NF
         MWAo6xvKPM6hdBBPt5RxBTwPvEtYSasPuqJG0dp6JhXdX9680kCRcUUx0FxZVFKB+U7l
         /khQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8tdurLVJgzQy4ZfwP6PUFCcWaYFLJDK7RlRdRcsu55g=;
        b=l5+WonV7xuSoMFDpAeXL7ZA3otjhbDqHjzHC+G2DJpgQMuXekTTr6qyljrNlZEvN+U
         NIGkwc0r92m+Czc9S0cvjTxXxjjOSazCrKMDyYORFmlYUfwC34GhbG1//wu8rj2Qnenh
         r9d2e7ytI6wsoHdhzj6dtmMqRuuXdLbtkyPfJT4Jor+8WBVV8uZsdEiJJhiNG3mBmbaD
         WLDUSs0Lc+93OVVqkPYDxYTnGcJRQEsYAkUkGWOjSI6nliI/Acwd/42/hHB0I6viH88d
         wgQUOC1SyWL17o1WmeEgiUjaKUfKtAc19FoKwmpwFW9GZm4NJ6C+e+rsXdPQYjZlzeea
         Ep1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Yql/nwNv";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j189si4224644ywe.125.2019.02.07.08.50.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Feb 2019 08:50:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Yql/nwNv";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:43202 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1grmsJ-0000ic-Hb
	for alex.bennee@linaro.org; Thu, 07 Feb 2019 11:50:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42161)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1grmrr-0000hU-6L
	for qemu-devel@nongnu.org; Thu, 07 Feb 2019 11:49:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1grmrm-0007S3-B7
	for qemu-devel@nongnu.org; Thu, 07 Feb 2019 11:49:36 -0500
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333]:40618)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1grmre-0007Ky-Nq
	for qemu-devel@nongnu.org; Thu, 07 Feb 2019 11:49:27 -0500
Received: by mail-ot1-x333.google.com with SMTP id s5so878562oth.7
	for <qemu-devel@nongnu.org>; Thu, 07 Feb 2019 08:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=8tdurLVJgzQy4ZfwP6PUFCcWaYFLJDK7RlRdRcsu55g=;
	b=Yql/nwNvnbpoyXHiZSvT7XO62QUBsLjhyceBsA02XNe+RSwFnF7hQX5zB7RojdGZei
	oE8HFDVblRnUbhG85xHeMpqgydi5XWijfY82qaOEOidL9787WWuspdmZ5yYBOoKXY5dO
	PAvtqjsggc/FOxSLgLPI9xpY5CN88THwdANsWSJD6nqhLPt01vJnPRUf3jzYbYKfv38D
	JD42cMG2Z9549KqW73k5bPrwBAX3MbBx/R2qMNj2EtRXrhoRIYfCYkDNRjM6CzkEU4Wb
	uVJ5IWi/pkEmHlWGHGQjOOR82Z9BXC8gm8Gp1osgDJuZKzoV/BAXl0GuCAi6S1qkVfju
	ruKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8tdurLVJgzQy4ZfwP6PUFCcWaYFLJDK7RlRdRcsu55g=;
	b=EldskxokjR5gnxW6ZIgoYo3nlAHigeihh0kfQoakNHmKWosk0zlYQwIkVmhK8GE3VM
	VqeFrpiSkST7LuHVX9GbR7ZkBwjCTJ7x3HB94NSYxxjbt7ngHK2AZ753CiNCx2Lf9DWq
	Vb6rYfgH2ph998uNEw1d1C4ICG9ZTuQ4FEUGH93Erh0pbzoKBOy/SmUkuEgTPMWJWahz
	/GEkLS+U9jaibBxwjsspiyHwJoDpTmaOq3edQo13IegwwI4A056cDLs8vyE9ioWqkZq4
	T8WdUSj/wg0Fq7Zrk0d38dnzbhhK+C8ORT9DZJ4Juw7D3DydlI0vLgeNPifj6AP5yAN9
	cFVQ==
X-Gm-Message-State: AHQUAua7RDU6tihcJVfn+bjJM5ZU0cD72Dx7Sjyqcd7Id5Ba+kGS7Agx
	CsEDuPqXZla5lnzJSjCoXZTYUIYeZfj9/Y7A0TsCrQ==
X-Received: by 2002:aca:bf82:: with SMTP id p124mr783886oif.48.1549558161797; 
	Thu, 07 Feb 2019 08:49:21 -0800 (PST)
MIME-Version: 1.0
References: <20190206152807.31896-1-laurent@vivier.eu>
In-Reply-To: <20190206152807.31896-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Feb 2019 16:49:10 +0000
Message-ID: <CAFEAcA_-peVcup1ARQmKyxyxPQwSYWswO6tDhGcvNENW3ceRhA@mail.gmail.com>
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::333
Subject: Re: [Qemu-devel] [PULL 0/7] Trivial patches patches
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Anthony Green <green@moxielogic.com>, Michael Tokarev <mjt@tls.msk.ru>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>, Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rXKB9hkJdNeD

On Wed, 6 Feb 2019 at 15:28, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit 47994e16b1d66411953623e7c0bf0cdcd50bd507:
>
>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20190205' into staging (2019-02-05 18:25:07 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu.git tags/trivial-patches-pull-request
>
> for you to fetch changes up to e67e91b4b55331973f783ca89790ee9f7861ced1:
>
>   hw/input/tsc210x: Fix building with no verbosity (2019-02-06 15:57:06 +0100)
>
> ----------------------------------------------------------------
> Trivial patches:
> * Update copyright
> * Fix LGPL in target/moxie
> * configure portability fix
> * Drop useless inclusion of "hw/i386/pc.h"
> * Mark the cpu-cluster device with user_creatable = false
> * tsc210x: Fix building with no verbosity
>
Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/4.0
for any user-visible changes.

-- PMM
