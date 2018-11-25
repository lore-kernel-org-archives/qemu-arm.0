Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp4793598wrt;
        Sun, 25 Nov 2018 14:52:35 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VTFtnMDV3kMVg7g41yKqGEbyBmAubeG1AdzfyF1kG2+my4rB8BY8xOteEAFrBlWEL1ihgd
X-Received: by 2002:a25:c089:: with SMTP id c131-v6mr25877168ybf.463.1543186355833;
        Sun, 25 Nov 2018 14:52:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543186355; cv=none;
        d=google.com; s=arc-20160816;
        b=08pjGLmiUg0oMjYErKJHM8GUDyMQ2VZ3AmXDhBTLuj3RjwHoZUvGUTGKPjMnYvQMjN
         eo+k993JDlEwhhK/NgHqd+pOvmLmnc9mgoVMwhvrm07JuAXxd+uZTKy1f6sgylWeFZsX
         1maYIYTv6+DHZXJm3YdIVyycP5tV7Rm6S6wdt3QYoopfqqgCVdCnLTYfV68HwlkyjB/V
         95vYwrmVh3Gr2jvP8dYdCD41ed6gMPJ0PX1uvDOEUh0k1ZXvmfqpi9K6fAqIY2JFiU3a
         lTxRTJPHGBrfKh2DCGJP3U594ys5M5V+fu1+8UhvOX4BiQyL5IY9Fm6fTKlwZfFxb+hc
         q+Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=4VPFUvUh+SIJ+3NGyAlEbuOq1IguRY+8U6jYQsAVtDc=;
        b=fNy/RngUz5PC87JOSq2ROxXgxk7QsrdNV6Aml4tY3iemOS+WdAJiFuD+nII40X4gzA
         idAuYFL7kj21LQ+9kzkBdTiod/pGv8P+g0VQh9zVlolqyqsZMX1pGf/jajdusCmVbpwa
         m9A8b6QIAHtSypMEn1CuIf2gU66p51m7NAqDnQ0wB6g1Xp+w93m18gQu8xur7u5Wg5UA
         NAwstzy/JC/DyKsks91gPjaGu+zC8skXQYrNOMYJ7OWO9TyTo4gGR1L1KKN5xdPaQ/w4
         a1PHip97aRFQyBLvzQCjRt5fO5HdTbUpEeSVqgojECTn96E7NOr58bdc4JIfPEgsKwWT
         XP2g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FDwH15kr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z2si16723344ywe.70.2018.11.25.14.52.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 25 Nov 2018 14:52:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FDwH15kr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33357 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gR3GV-0001O4-9L
	for alex.bennee@linaro.org; Sun, 25 Nov 2018 17:52:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43550)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gR3Fh-0001NN-Bu
	for qemu-devel@nongnu.org; Sun, 25 Nov 2018 17:51:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gR3Fg-0001Z3-5N
	for qemu-devel@nongnu.org; Sun, 25 Nov 2018 17:51:45 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:38434)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gR3Ff-0001Xe-SL
	for qemu-devel@nongnu.org; Sun, 25 Nov 2018 17:51:44 -0500
Received: by mail-ot1-x342.google.com with SMTP id e12so10629819otl.5
	for <qemu-devel@nongnu.org>; Sun, 25 Nov 2018 14:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=4VPFUvUh+SIJ+3NGyAlEbuOq1IguRY+8U6jYQsAVtDc=;
	b=FDwH15krw1eoVUTttPiwXJr5Kh6RDuVBxT35ruYHQdblwqcyoY7+jPRMD1nKzieYzj
	TddtTzyK2ytIsbjET2pA3zIQGF5E617WlycUmWI1Vf3kuCF/0fSLgTafGCFit8fcUtKb
	DYc1fZY9l0M0PaUzIv/1YxxLbapK67+imZlX4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=4VPFUvUh+SIJ+3NGyAlEbuOq1IguRY+8U6jYQsAVtDc=;
	b=O5S+HkrRw45wf+y6LCFqNV5RjiKjC45v5ATKGiLC8xiLaJkdcDutISN3cPJL62q2qw
	+knNAEO0mKhHRzDQPzvMvJUdGOnbOubOBYdte3F0yY6wZhYIhUAvS88wJ0+4y9QcKncG
	O3wlJXvD5/RXMLQ0O3gydt2fXFwwD23kRMh55EvRzpJ1cPEESPfhXDaZVUb+VwwjgN/W
	pN7djha9HoJBLdeVx6TWKqdjkZtmJOteKy756M/j9R/u1eYcFP24vLrqu0+s6OpV+52L
	1p2NzEFwgxWnDq2M7qhb1HNWs7GbjbtBOtVKO1TnWgSGpA3/8Ojn7kU3ilewuMEyXEiU
	KSQA==
X-Gm-Message-State: AA+aEWb1dZr/3AQ/O3+Fc+HjdNeT/AVaXkEAx4+x+IEwEH3h9ekTTW4q
	k19zxKG+XU0doDNwwsLJDqcSpqiiPcuNtu5k/GW30Q==
X-Received: by 2002:a9d:3d44:: with SMTP id a62mr5196462otc.363.1543186302038; 
	Sun, 25 Nov 2018 14:51:42 -0800 (PST)
MIME-Version: 1.0
References: <20181125205000.10324-1-philmd@redhat.com>
	<20181125205000.10324-17-philmd@redhat.com>
In-Reply-To: <20181125205000.10324-17-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 25 Nov 2018 22:51:30 +0000
Message-ID: <CAFEAcA-9eazE0mhLA04JoUh6mwuiA3RVGVeeQrbYO9JwaEC-=A@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-devel] [PATCH for-3.1 16/25] MAINTAINERS: Add missing
 entries for the MPS2 machine
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Thomas Huth <thuth@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oIQHTfnIjBwa

On Sun, 25 Nov 2018 at 20:52, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> Missed in de343bb632a.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  MAINTAINERS | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e04f2f1a44..2795135a09 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -587,6 +587,8 @@ F: hw/misc/mps2-*.c
>  F: include/hw/misc/mps2-*.h
>  F: hw/arm/iotkit.c
>  F: include/hw/arm/iotkit.h
> +F: hw/misc/iotkit-secctl.c
> +F: include/hw/misc/iotkit-secctl.h
>  F: hw/misc/iotkit-sysctl.c
>  F: include/hw/misc/iotkit-sysctl.h
>  F: hw/misc/iotkit-sysinfo.c
> --

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
