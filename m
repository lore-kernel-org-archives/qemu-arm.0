Received: by 10.25.21.96 with SMTP id l93csp484460lfi;
        Thu, 23 Jun 2016 05:04:36 -0700 (PDT)
X-Received: by 10.37.195.133 with SMTP id t127mr18115011ybf.149.1466683476369;
        Thu, 23 Jun 2016 05:04:36 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q66si3037890ywf.52.2016.06.23.05.04.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Jun 2016 05:04:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36370 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bG3N5-0003e4-Rv
	for alex.bennee@linaro.org; Thu, 23 Jun 2016 08:04:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46607)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bG3MC-0003LP-Bs
	for qemu-devel@nongnu.org; Thu, 23 Jun 2016 08:03:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bG3M4-0003Fx-Qe
	for qemu-devel@nongnu.org; Thu, 23 Jun 2016 08:03:39 -0400
Received: from mail-vk0-x235.google.com ([2607:f8b0:400c:c05::235]:36388)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bG3M4-0003Fr-Ll
	for qemu-devel@nongnu.org; Thu, 23 Jun 2016 08:03:32 -0400
Received: by mail-vk0-x235.google.com with SMTP id u64so102396608vkf.3
	for <qemu-devel@nongnu.org>; Thu, 23 Jun 2016 05:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=0+CaokE9ZM8fhoNi7Cqve39iLOJVdCNWVd+RO7JCZWU=;
	b=fr04Nw/Aff+723RQ6jC43R/+hGA3mszLLk6ZpQqPmkoFG4VFCvDH680QutkNPPMRJD
	WcSBmCynFKeSDMlSkhcvt581Z9HOyj9KGQBpOgKyj7HXD/itrWJ5oFmejC/nQCualyTZ
	HBquIXFwn/09CgwgLx4EZBJdRIqXmTc/Aqq3Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=0+CaokE9ZM8fhoNi7Cqve39iLOJVdCNWVd+RO7JCZWU=;
	b=jP3TbZhjifvhT7TshdgtTOMgKdpZpE9g8CsQBYHyf8Nxy/n+Ggi6h8R52SuYNypaVT
	OoUM4UX4nfaJQd3dl/d5UV1b6DndzWglWkv9Br3gt7cCBt3tuy6sNHzIQQud5dkUMTzn
	ltEhM5lvMhEWuoLvCk0V/ztZfnjcwGMOpcSElPJs4INBNRp7wG880c/tUfk3GPi1NWlM
	Zt+O7KM6YkXyPG8GwTldWksaRPiJJyu/eJRzG1VhfiWWmad/+Dse2BK1p9ABhJpoxyiI
	iotTbpr3oMVfC4t40e+dfC4B6u5ouCiO91Rbtyo10p1e9/U9DSks22FD7m+hVkbDxvb7
	/GRQ==
X-Gm-Message-State: ALyK8tJ2cNJu/rDixki2Bh86TCPnOGGfQyTecSt5OTmv2Wsk477jPLvs3eQXNqofieZuvPbVrDA5MaQMRiBrL39W
X-Received: by 10.31.188.80 with SMTP id m77mr15243383vkf.30.1466683412147;
	Thu, 23 Jun 2016 05:03:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.157.141 with HTTP; Thu, 23 Jun 2016 05:03:12 -0700 (PDT)
In-Reply-To: <cover.1466539342.git.alistair.francis@xilinx.com>
References: <cover.1466539342.git.alistair.francis@xilinx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Jun 2016 13:03:12 +0100
Message-ID: <CAFEAcA8qOE6PMrLkUqrbtz+=FwcSCFke9Jfcj0tZ4EUxKhi3Gg@mail.gmail.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::235
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH v1 0/2] Cadence GEM bug fixes
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
Cc: qemu-arm <qemu-arm@nongnu.org>, =?UTF-8?B?5p2O5by6?= <liqiang6-s@360.cn>,
	QEMU Developers <qemu-devel@nongnu.org>, P J P <ppandit@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cjKdcUZg1uat

On 21 June 2016 at 21:03, Alistair Francis <alistair.francis@xilinx.com> wrote:
>
>
> Alistair Francis (2):
>   cadence_gem: Avoid infinite loops with a misconfigured buffer
>   cadence_gem: Set the last bit when wrap is set
>
>  hw/net/cadence_gem.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)



Applied to target-arm.next, thanks.

-- PMM
