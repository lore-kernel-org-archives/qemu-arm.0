Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1930773wrt;
        Fri, 14 Dec 2018 03:34:14 -0800 (PST)
X-Google-Smtp-Source: AFSGD/X6fpo2J+X6PqKSRNXkngZP31EGUSZ0FZmbxkoR1htu9uXXr/EtypDN05BhaTSA38i6hUGx
X-Received: by 2002:aed:3366:: with SMTP id u93mr2380240qtd.177.1544787254378;
        Fri, 14 Dec 2018 03:34:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544787254; cv=none;
        d=google.com; s=arc-20160816;
        b=lT2vjDoqCGoePryhGiUt6xblgBuhMEWi+KhssisF121wD67UUadCcQu7ZzhsIRoSoW
         gcTnqx5E8lSJhxdwJR/JLmA3AVckBsSpFrFrg9qiCclLqH+lWLTnyb8YIYyPdUDcnHwc
         VUTrTvehCJ4LH49GHDzcksypsKviquvo7Q45yH8zck/qMuphBTaRkKA1r97POlyvmwP0
         bF6V4ZUaxY8WqgHcXv2+NX/j8Kfa3Vg5f99Tx+dcfeWiuQcA+p4b9NxECtzFtP9SUwZw
         GClrEoWlKviuQlQAvIL9jQvYoIV3nBF0xM597vc0Ec3djIMeE97xNwSXdQysxY8bVAOi
         Q8Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=r0pWwir8tjQVWh0cdk7X3zNcYRyDlNtInvjlXKSFu0Q=;
        b=M6cGOPKBa8dvaIddQiuWciQQPD5f/JpJCl1u+i0SULesbUwIgzYtveAWS20jmoGfFB
         m9KQ3UW/qRce27f2o3gAUVspXhRyzo7bWqjaGWZgXo1DEmynf6fITIRURjMPBNbkg8Fp
         Unb+JiIvumpCKrmR+qKHlVaNQbF6dADlao65G/nx3YX4hFrNY2rFNOsqyMELRCkhhekQ
         pNKQyapbTSNlbqW6Vvi7DClUgsovn6YVs4aPtUaQAGHcw66+Igy3M0PVvMhvj6VrQUVK
         vuh6Az1WMZrX0ESPOrrFf0YN8+I+wVJJg+jG3/HjOvyPGkQ3SzG5nbOYSlHqg56DFKGz
         R5vw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=D7504w7u;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j13si2938605qti.103.2018.12.14.03.34.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 14 Dec 2018 03:34:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=D7504w7u;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:32849 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gXljR-00054w-TB
	for alex.bennee@linaro.org; Fri, 14 Dec 2018 06:34:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54574)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gXlhX-0003Yi-FV
	for qemu-devel@nongnu.org; Fri, 14 Dec 2018 06:32:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gXlhW-0006rD-QQ
	for qemu-devel@nongnu.org; Fri, 14 Dec 2018 06:32:15 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:45413)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gXlhW-0006r3-LB
	for qemu-devel@nongnu.org; Fri, 14 Dec 2018 06:32:14 -0500
Received: by mail-ot1-x342.google.com with SMTP id 32so5029518ota.12
	for <qemu-devel@nongnu.org>; Fri, 14 Dec 2018 03:32:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=r0pWwir8tjQVWh0cdk7X3zNcYRyDlNtInvjlXKSFu0Q=;
	b=D7504w7uiOei7O5HKAQTOh/th6/RjIdG1LSTlI5JFzEYohlCKqlWH//G3CwCfbOHrx
	x4G61itXAJz2Ju+npopms3MzRtVHgMmH8LSfomj1qCqxdsdxFqL0xA4x8lx3ZKoeqxWj
	dX5YlW2IsRguC3HkxtGRoVJ8gmMDW5Ww2FCPQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=r0pWwir8tjQVWh0cdk7X3zNcYRyDlNtInvjlXKSFu0Q=;
	b=oy+zk2T68c8Ulxl49M921A37Kjiff1HQZOSy3o/H5N1TaHYYA4oDHN+7SMoXeJwucL
	RThsenoA5Jz2GX7ZjG947Bp8UyRpizoUVkVA4a5OKaFzFxEVPXu7tdQzXVTg7d0BLGOq
	DWXLMi1lMvxXOgxVHDTrJxiLJPWa7Y8ThP8NAASx41/IaFHlp4ig13p5FVLcKLW2YwZl
	B5Iud8k6e9qeHvx5CtReqpytL2v8rDgZvQeXiv3UDNOu0yKQXcNaU/BEE62AYJKQOhsR
	zx+4LWOf+WAbuyIP563r+qqqfjUAF8dtq3RTYxSAXxiRuZW2jK3Nv/P+5wr5VisCdRpn
	qhbg==
X-Gm-Message-State: AA+aEWbBbN2iht/Tct/zbiY+OGhT6c9DBv2+MPkbXVCluffhBhA3cUAL
	0JupxfGvmCm+c523ZfI3liGTkuSdqay8lZgM3KU0mw==
X-Received: by 2002:a9d:12d:: with SMTP id 42mr1670494otu.352.1544787134007;
	Fri, 14 Dec 2018 03:32:14 -0800 (PST)
MIME-Version: 1.0
References: <20181122133507.30950-1-peter.maydell@linaro.org>
In-Reply-To: <20181122133507.30950-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 14 Dec 2018 11:32:02 +0000
Message-ID: <CAFEAcA-xzUS4Nrf9dq26-Pp-c5TM-gdMTBBMr-fjFBSd4AZmYg@mail.gmail.com>
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH for-4.0 0/2] Rename
 cpu_physical_memory_write_rom() to address_space_write_rom()
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
Cc: "patches@linaro.org" <patches@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Paolo Bonzini <pbonzini@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hWR6ipGGImLB

On Thu, 22 Nov 2018 at 13:35, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> The API of cpu_physical_memory_write_rom() is odd, because it
> takes an AddressSpace, unlike all the other cpu_physical_memory_*
> access functions. We note this oddity as a TODO in the
> docs/devel/loads-stores.rst documentation.
>
> Rename cpu_physical_memory_write_rom() to address_space_write_rom(),
> and give it an API that matches address_space_write().
> We also adjest the cpu_physical_memory_write_rom_internal()
> function which is local to exec.c similarly.

Unless somebody would prefer a different route, I'm going
to add this series to a 'misc' pullreq I'm putting together.

thanks
-- PMM
