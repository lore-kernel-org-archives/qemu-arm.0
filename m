Received: by 10.25.27.66 with SMTP id b63csp394393lfb;
        Fri, 3 Jun 2016 11:34:36 -0700 (PDT)
X-Received: by 10.140.103.241 with SMTP id y104mr4531899qge.54.1464978876522;
        Fri, 03 Jun 2016 11:34:36 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w191si3142602qka.185.2016.06.03.11.34.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 03 Jun 2016 11:34:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57139 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b8tvY-0005rL-1T
	for alex.bennee@linaro.org; Fri, 03 Jun 2016 14:34:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37930)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b8tvU-0005qD-Nl
	for qemu-arm@nongnu.org; Fri, 03 Jun 2016 14:34:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b8tvT-0003ck-Nd
	for qemu-arm@nongnu.org; Fri, 03 Jun 2016 14:34:32 -0400
Received: from mail-vk0-x229.google.com ([2607:f8b0:400c:c05::229]:33674)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b8tvT-0003cV-Ir
	for qemu-arm@nongnu.org; Fri, 03 Jun 2016 14:34:31 -0400
Received: by mail-vk0-x229.google.com with SMTP id d64so2341931vkb.0
	for <qemu-arm@nongnu.org>; Fri, 03 Jun 2016 11:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=S/CVaosa5fOmIdEcP9Vk0zhw2ChuHS9DNNFjcgg0hIY=;
	b=ZoFFY3ffgVh55jvYd3iP7/7cQP+8vQWYuB+Q7zxjoTzM++PPqgxtaUNamiy6E9kBvC
	9Xq5vcjMZvkAL+BxCdXM91mS8e4c57iZbxoJM+aJEE2hh1x1S4WsNHjRQtHrvEvN3a01
	Fxz7mWDY5cuQ1Rym8+l4uuzQBeofbG1w2bu6k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=S/CVaosa5fOmIdEcP9Vk0zhw2ChuHS9DNNFjcgg0hIY=;
	b=CZUTSUwJWqKcr8/v6juFw5TaY/m/rAfsVJJgrN2zswc3FOV5BaPLSmJMgwtTt1FFxx
	inSUzga6J4SnRlc3TRLry0QfNd0tpbMN8/STy4otHF57c9ccVwToHk9xQweR8LCjFaMM
	g5p5dALQd/xgMuMb5YXEOYSvldk0bstzaVUdWtRfYwCK6gG4H05OoG6Mlk41vvSkSPAM
	8INSuDfH/Etb17dvnQPVgM5Chgq5BTk3xkt3zfO9mCouVh1C6Gu1IMg/vdAI+GD1mLXI
	kt2RPZ/4Z9D+kQ7F95+2aDEvzS+D3BLFxyb+FeyUUwuVAa3YFtYz166Lc/dq6bGKdJql
	eMcw==
X-Gm-Message-State: ALyK8tJFKgW2OqsDSE6mzXq74kJEZ2kf2b3QbS1XM1VzWKe/abUoMYtj5q2VuVbtuCwMiXmo7dlii+nMCbAox7ir
X-Received: by 10.159.37.170 with SMTP id 39mr1930734uaf.119.1464978871169;
	Fri, 03 Jun 2016 11:34:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.69.66 with HTTP; Fri, 3 Jun 2016 11:34:11 -0700 (PDT)
In-Reply-To: <b1b3b0dd143b7995a7f4062966b80a2cf3e3c71e.1464273085.git.crobinso@redhat.com>
References: <b1b3b0dd143b7995a7f4062966b80a2cf3e3c71e.1464273085.git.crobinso@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Jun 2016 19:34:11 +0100
Message-ID: <CAFEAcA_zfPzcKq1T+2UNZMtFuibt-QDrF+y4-3LRf0Egu+sBcA@mail.gmail.com>
To: Cole Robinson <crobinso@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::229
Subject: Re: [Qemu-arm] [PATCH] hw/arm/virt: Reject gic-version=host for
 non-KVM
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fTzwpTNfbJN7

On 26 May 2016 at 15:31, Cole Robinson <crobinso@redhat.com> wrote:
> If you try to gic-version=host with TCG on a KVM aarch64 host,
> qemu segfaults, since host requires KVM APIs.
>
> Explicitly reject gic-version=host if KVM is not enabled
>
> https://bugzilla.redhat.com/show_bug.cgi?id=1339977
> Signed-off-by: Cole Robinson <crobinso@redhat.com>
> ---
>  hw/arm/virt.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>



Applied to target-arm.next, thanks.

-- PMM
