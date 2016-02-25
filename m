Received: by 10.25.208.211 with SMTP id h202csp2737091lfg;
        Thu, 25 Feb 2016 02:54:15 -0800 (PST)
X-Received: by 10.140.138.71 with SMTP id 68mr59304721qhk.8.1456397655322;
        Thu, 25 Feb 2016 02:54:15 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j9si7526705qhj.65.2016.02.25.02.54.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 25 Feb 2016 02:54:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:42091 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aYtYk-00075R-UY
	for alex.bennee@linaro.org; Thu, 25 Feb 2016 05:54:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47797)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aYtYE-0006TY-M1
	for qemu-devel@nongnu.org; Thu, 25 Feb 2016 05:53:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aYtYD-0006zy-SV
	for qemu-devel@nongnu.org; Thu, 25 Feb 2016 05:53:42 -0500
Received: from mail-vk0-x231.google.com ([2607:f8b0:400c:c05::231]:36564)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aYtYD-0006zn-Ok
	for qemu-devel@nongnu.org; Thu, 25 Feb 2016 05:53:41 -0500
Received: by mail-vk0-x231.google.com with SMTP id c3so43732816vkb.3
	for <qemu-devel@nongnu.org>; Thu, 25 Feb 2016 02:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=SwLst/454xzvtvAUR034CyeIQRwnKaORpvI1/JmsX2A=;
	b=JlQBL2KEEPBNHusluzIlNtXPcUPs0eHjcd30A2oDp65TyVJHzQYlpWocnFHaISsnay
	LqnQpAeykSGlgDwRWT1GFzjlyUNTSo6DPcvp9JCdyNYXXBiBs0svs8HyEJBpHtXmBrLH
	czEyjDUYSc9yeV9VW2NHPfLw1926038irZoZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=SwLst/454xzvtvAUR034CyeIQRwnKaORpvI1/JmsX2A=;
	b=hdp6zYafGfHSvrgeaTbgbFp9LJbNYFdvrhB0n7H7EJuw0CvpMASLVr2VDUC8hhD+9O
	l/MMjTdPHApIfJ9pqfH+26jSSPW/hErQihVHE/yzGjS+BQykc39nxijxU0gJSvjkLaAI
	yK0rZcPktPssyjqMkCXwHM+KuKWYaTcy2pcjUk7imcVJZHXHQGeLJm4baiZ4N9DtwnvB
	Xhi9j4SGQokxeoY6zFQgj168YJPOPRBXAuKTvzL8EixMmlW+Lvpb4aJK0VrmnMtXU6SA
	TElkZ1hcm6oJESulB1NOBqpcjm4Q0M6fLzFe6oFWDwfZmNIoOtri5th0F26idngXahN7
	RavQ==
X-Gm-Message-State: AG10YOSxloUOMRfQmNeNsKlIbmWPDF8cbg8LRpL665imm9Jmlhmnms6x7Pub3lPvPSUJ806qwz7Qsd7wrAbNhu5A
X-Received: by 10.31.131.199 with SMTP id f190mr36834570vkd.90.1456397621333; 
	Thu, 25 Feb 2016 02:53:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Thu, 25 Feb 2016 02:53:21 -0800 (PST)
In-Reply-To: <1456396236-2759-1-git-send-email-zxq_yx_007@163.com>
References: <1456396236-2759-1-git-send-email-zxq_yx_007@163.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Feb 2016 10:53:21 +0000
Message-ID: <CAFEAcA_-+gK88n0UvcZi4nQPyNhjS26CSY-Xd5nv=L6jUovTkg@mail.gmail.com>
To: xiaoqiang zhao <zxq_yx_007@163.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::231
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Michael Walle <michael@walle.cc>, qemu-arm <qemu-arm@nongnu.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Subject: Re: [Qemu-devel] [PATCH v5 0/8] QOM'ify hw/timer/*
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ZqAUGCvQButt

On 25 February 2016 at 10:30, xiaoqiang zhao <zxq_yx_007@163.com> wrote:
> This patch series QOM'ify timer code under hw/timer directory.
> Main idea is to split the initfn's work, some to TypeInfo.instance_init
> and some is placed in DeviceClass::realize.
> Drop the use of SysBusDeviceClass::init if possible.
>
> Patch 3,4 (m48t59) has been tested in a sparc vm with debian linux guest
> and savevm/loadvm looks fine.

...ah, I see you answered my question about testing here. Thanks.

-- PMM
