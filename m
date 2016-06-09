Received: by 10.25.27.66 with SMTP id b63csp463457lfb;
        Thu, 9 Jun 2016 11:38:37 -0700 (PDT)
X-Received: by 10.140.253.2 with SMTP id y2mr4419135qhc.68.1465497517552;
        Thu, 09 Jun 2016 11:38:37 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y18si3845010qha.107.2016.06.09.11.38.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 09 Jun 2016 11:38:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36419 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bB4qi-0007BG-PV
	for alex.bennee@linaro.org; Thu, 09 Jun 2016 14:38:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49759)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bB4iP-0001KN-P8
	for qemu-devel@nongnu.org; Thu, 09 Jun 2016 14:30:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bB4iN-0002bW-JM
	for qemu-devel@nongnu.org; Thu, 09 Jun 2016 14:30:00 -0400
Received: from mail-vk0-x229.google.com ([2607:f8b0:400c:c05::229]:34133)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bB4iN-0002bO-F4
	for qemu-devel@nongnu.org; Thu, 09 Jun 2016 14:29:59 -0400
Received: by mail-vk0-x229.google.com with SMTP id e4so66965720vkb.1
	for <qemu-devel@nongnu.org>; Thu, 09 Jun 2016 11:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jbndDCSJP/sNXWjiyzvZpbZ4I6l1rCvQjCGIMVzg9Vw=;
	b=gySpimuYreoaEe3fBNPhYbqyVM4MD5IPtZ7oXa5Ani6gD4WM6bUUEfIT4wdGv+yMn8
	/ZlAAhfpIUtMRX5xqLS9tNhA1qZ06b+FvlsZhCdgGEVeZl4ti0C+IL40n40DhrN8/ON5
	m0kYUPxAxUPosOpdJm9hlkpX8WqYxMGhrAD9U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jbndDCSJP/sNXWjiyzvZpbZ4I6l1rCvQjCGIMVzg9Vw=;
	b=ZLyGE/F7Fx4DYIqYb2+pCc5soUMl5qMjTe/zvY8OTL4nWV41iwc6cjtPx1v3fJ3ViE
	SmpvxPwodUZn1bpIgyxAjVRE3smAkdfUMT0xH3P63VmS73PVrCGzgm1FVvdShKyk2QXc
	JwiC1tJYXhSqPdW1dKlPwh1glvCBzqb8SyFpsI4xGVmjkHPgscg/ex7aoq79fh1GCFZT
	g7H05LHXQ9PYI0UDJKpuYwpiu5jd3xSawP1ARcRBW15qtVMNZARplWbQW3NZU/o1QWAU
	tO1Xw/J5+2MK8YtNd9KEkW2/xEQU/NX06Uf495oSMkXVSLj5avRJt+BaUqVohNYL9CuM
	osBw==
X-Gm-Message-State: ALyK8tKeVZcsszTZ/B9DWfmvqmjaM+cLexqmZGkvbTbL2vUAdXRh00ijTJDTJhFaq3eDlmCdBegDNS3+w38MPf4Q
X-Received: by 10.176.0.146 with SMTP id 18mr5185800uaj.17.1465496999074; Thu,
	09 Jun 2016 11:29:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.97.68 with HTTP; Thu, 9 Jun 2016 11:29:39 -0700 (PDT)
In-Reply-To: <1465410291-2971-4-git-send-email-drjones@redhat.com>
References: <1465410291-2971-1-git-send-email-drjones@redhat.com>
	<1465410291-2971-4-git-send-email-drjones@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2016 19:29:39 +0100
Message-ID: <CAFEAcA9b4cJp66H+eNjrtXToXyL2oqrp9dXZLVEvrKL6P+Q_sg@mail.gmail.com>
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::229
Subject: Re: [Qemu-devel] [PATCH 3/5] hw/arm/virt: introduce
 DEFINE_VIRT_MACHINE
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
Cc: Wei Huang <wei@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eHAna+5pWZgm

On 8 June 2016 at 19:24, Andrew Jones <drjones@redhat.com> wrote:
> Use DEFINE_VIRT_MACHINE to generate versioned machine type info.
>
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  hw/arm/virt.c | 40 +++++++++++++++++++++++-----------------
>  1 file changed, 23 insertions(+), 17 deletions(-)

Checkpatch complains about a long line; otherwise

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
