Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3732644wrt;
        Fri, 30 Nov 2018 07:56:34 -0800 (PST)
X-Google-Smtp-Source: AFSGD/Udp5nLiroRx1sPmeGo0eLSqUumHWnXA2zzbPaEefCV2ktgq40CspF5n4+QETgNNcabnB3K
X-Received: by 2002:a81:af58:: with SMTP id x24mr6334229ywj.362.1543593394427;
        Fri, 30 Nov 2018 07:56:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543593394; cv=none;
        d=google.com; s=arc-20160816;
        b=etMB7XsDAOMFbZpBlAHVl/kqexDm/f9ELAzACakbMEiJZEZxz4DVmqI/jUEi/SWMMx
         nmPzvE/kTBBZqmZVLiSDx6UBB5zqu0ncZ6TfJQv4flHmb1o8Nhd0cEk9o+/4V7qqht5U
         /AMZ2L4ngpt8xgm2Gm3BSzL2h/bze6FxMiNWAagtGg80CEiNMwNRYPMHJvjUp9rzcp+g
         RbXWpjWYKYT+MmPt714HQW7Say06HmZoB+lp2JLLQIxRM3h+oyhKqlLTDN0u/bwYh72s
         p+aooz/rLNvERpTllVCDkbKuoYFGG0ZAGXDRiDfWcLDC8/i3SDg30Sg8TQNOTknJ6rcG
         Lk6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6Flt5e4y7rWLhGiVRH9VCmmZ7/N94rN5WH18R40jjdI=;
        b=tEQPurzGzvcTuSghsIy+8svTA77OXWk477lkzC6+dbpf8M52AjltU7I8B/qaw2yPwY
         dcHTDpu+vhZsuBLmoM0+3NNBD6xK/8vFK6xEJ3rwONFNplnclhwZ4aW3U5RxvsAjlJMh
         h5RbsvTxK+b0H5NZUmXbr3QJ/kniDwSZWdEpX612yfxSz0TaXVDpznX1Bt4Mm6ZFCJIF
         Fe0e94G2/WdjKEWmyhzmV9I6oM3UFcBHIe3tuxxjM8qwFODqrmKhdxuSCPxPTQU5I24I
         pEeQ/AGU+swERti0pDo05Pgp/bvHV0GTbIqIkoFUtsMcott/jBH4XLmdnnrZn6e+YtzU
         SVMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kjec98Dh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i65-v6si3328928ywd.240.2018.11.30.07.56.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 30 Nov 2018 07:56:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kjec98Dh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33498 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gSl9d-0001N8-Tl
	for alex.bennee@linaro.org; Fri, 30 Nov 2018 10:56:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37362)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gSl9U-0001Mv-Q0
	for qemu-arm@nongnu.org; Fri, 30 Nov 2018 10:56:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gSl9T-00009i-0O
	for qemu-arm@nongnu.org; Fri, 30 Nov 2018 10:56:24 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:33331)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gSl9S-000090-Pg
	for qemu-arm@nongnu.org; Fri, 30 Nov 2018 10:56:22 -0500
Received: by mail-ot1-x341.google.com with SMTP id i20so5535413otl.0
	for <qemu-arm@nongnu.org>; Fri, 30 Nov 2018 07:56:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=6Flt5e4y7rWLhGiVRH9VCmmZ7/N94rN5WH18R40jjdI=;
	b=kjec98DhnV2VSaRRiQrG5KTZ3ANatToFuKWz786nu4DyEPYX7HmbHlR24mUvr36ATg
	doZa4MY5FJ55c9oT8vcVQElK/H55Rr7q/WqkdRBcUOT6FW2JXZL7oDUUkGsNzAAi1vL2
	WWLFW0zQwhf1SRf8Rhy3/+L3I8MMg07aQCklE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=6Flt5e4y7rWLhGiVRH9VCmmZ7/N94rN5WH18R40jjdI=;
	b=fxkbr9eEBW/DIi95Gkpl0PovxTXobe7M8vmiyP1SobbrswkjNDxVBtBdKb6Y8HuQNd
	toj9LdYkVKZqu40L1i72BP7cFObwDMoYHeFWl/77Z58WrnefFsfQqfIJX6YefjaROwHR
	JQf3Yad+NF2kpBJgGNsKxYvXaPb25HYI99CV1QO3gdeYej75LSqgHrUuXehYN5djiAMV
	jqAxhCUJbUzoqAnmi1kwKt5wopNY3OitxJGQ1FdC5LFuXkxTEPgEYqjlU95xRSQij5LI
	WJV165ogVMfLBATtU80Sx0XsfPvmhUee5xVEEwybod1PbIAsKZExCgR5iftETIuTwUnA
	+rLQ==
X-Gm-Message-State: AA+aEWYQftzPOhuzVUeF08d90PtE297T3BT2XfOSX8DmqCcH2WjHnc6U
	wO5UUfcHhxwuWPZ9Vsb2nJj5QW+yowNElCqI8gm8pw==
X-Received: by 2002:a9d:3d44:: with SMTP id a62mr3555325otc.363.1543593381508; 
	Fri, 30 Nov 2018 07:56:21 -0800 (PST)
MIME-Version: 1.0
References: <1543407172-16175-1-git-send-email-peng.hao2@zte.com.cn>
	<1543407172-16175-8-git-send-email-peng.hao2@zte.com.cn>
In-Reply-To: <1543407172-16175-8-git-send-email-peng.hao2@zte.com.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 Nov 2018 15:56:10 +0000
Message-ID: <CAFEAcA83C_Eic3K4yY5bGeEKJpY2uf26diFtDJ5r+W71jcX2DQ@mail.gmail.com>
To: Peng Hao <peng.hao2@zte.com.cn>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-arm] [PATCH V10 7/9] hw/misc/pvpanic: preparing for
 adding configure interface
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
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: x+ZbG+vxJSJe

On Wed, 28 Nov 2018 at 03:50, Peng Hao <peng.hao2@zte.com.cn> wrote:
>
> Prepare for pvpanic-mmio configure interface.
>
> Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
> ---
>  hw/arm/sysbus-fdt.c |  2 ++
>  hw/arm/virt.c       |  2 ++
>  hw/misc/pvpanic.c   | 11 +++++++++--
>  3 files changed, 13 insertions(+), 2 deletions(-)

This looks rather odd. The sysbus-fdt.c code is for
handling devices that we must pass through from the
host system (including pulling in device tree fragments
from the host). The pvpanic device isn't a host pass
through device so I don't think it should be touching
that code at all. It's just a simple MMIO device.

I suspect the reason you've done this is that you're
trying to get "-device pvpanic" to work on the command
line. I recommend not trying to get that to work.
MMIO devices are not pluggable devices, and -device
is not expected to work with them.

thanks
-- PMM
