Received: by 10.25.208.211 with SMTP id h202csp1915685lfg;
        Tue, 22 Mar 2016 07:50:05 -0700 (PDT)
X-Received: by 10.140.104.19 with SMTP id z19mr47447412qge.68.1458658205147;
        Tue, 22 Mar 2016 07:50:05 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n107si22747728qge.41.2016.03.22.07.50.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 Mar 2016 07:50:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:37569 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aiNdE-0002MU-OZ
	for alex.bennee@linaro.org; Tue, 22 Mar 2016 10:50:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42320)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aiNcp-000243-RH
	for qemu-devel@nongnu.org; Tue, 22 Mar 2016 10:49:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aiNcp-0007hz-0G
	for qemu-devel@nongnu.org; Tue, 22 Mar 2016 10:49:39 -0400
Received: from mail-vk0-x22d.google.com ([2607:f8b0:400c:c05::22d]:33498)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aiNco-0007hm-Rf
	for qemu-devel@nongnu.org; Tue, 22 Mar 2016 10:49:38 -0400
Received: by mail-vk0-x22d.google.com with SMTP id k1so257462021vkb.0
	for <qemu-devel@nongnu.org>; Tue, 22 Mar 2016 07:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=sUJNyunvXB4tx2U+LRrj7mj84Cix0WrNqQHClur1FVE=;
	b=gq8SQaTYYZC2tNcOJ1CY0v2a8BxbDYUn7vN5hdcrgphAcTrWR9pYJQhV3HzUUsR4Ll
	lZlZ6RICosO7uACdYgXRQn3dyHSnSMPy+vyRozudNoV2qlcb1uEb2QrI6p3DleRw7E4K
	DErNg9VG2wHs56UivCg7Lr0M6jzkIoyHDE5bk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=sUJNyunvXB4tx2U+LRrj7mj84Cix0WrNqQHClur1FVE=;
	b=lNGO6OcvezC4kRlmUdSNSy0oyAutpv1RuklvVCQ3fN4cJclg5i8qYQ0+M1iv/2+lgx
	gGNmGy7JdMqduAvAkQ152N2nh4kADA/YaROI/AF5daRJk8HXxIoql/BNAWelqK1yTPh9
	atFV7IKzMhZ/FmhFOGAVedvLtyZSV6yOpYTK84eMnnRlcpKU35RaGF1PsoixEnaZPfkF
	mGrEVQtMdjkIsxDSvm6g90FzxgO+oBzQebo6AUVc3fDT6a+VQIla1PL5aqfeIQrHaTpO
	mZ5r72roXMmrtSceWlZ76JO9Wo/nYnd9uOIjgR9H1LE5vCul4dt8Y8WcDW209exd6/L6
	hLFQ==
X-Gm-Message-State: AD7BkJK4p109yHwnrA2O+1rwSXnJFUst8doBUA/j7VZxGTbk+SpSY/O9sUMnNXBZuKivNpy9DpaN4rUZ1SGZ050f
X-Received: by 10.159.40.232 with SMTP id d95mr1365465uad.38.1458658178418;
	Tue, 22 Mar 2016 07:49:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Tue, 22 Mar 2016 07:49:19 -0700 (PDT)
In-Reply-To: <1458271654-23706-1-git-send-email-peterx@redhat.com>
References: <1458271654-23706-1-git-send-email-peterx@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Mar 2016 14:49:19 +0000
Message-ID: <CAFEAcA-nPdPrxXS5BdjGnd2PUao9JXvzW43Mo4MT7p15fOAPYA@mail.gmail.com>
To: Peter Xu <peterx@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22d
Cc: Wei Huang <wei@redhat.com>, Andrew Jones <drjones@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Michael Roth <mdroth@linux.vnet.ibm.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Andrea Bolognani <abologna@redhat.com>
Subject: Re: [Qemu-devel] [PATCH v5 0/5] ARM: add query-gic-capabilities SMP
	command
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
X-TUID: zsLDVcAnbGt+

On 18 March 2016 at 03:27, Peter Xu <peterx@redhat.com> wrote:
> This patch is to add ARM-specific command "query-gic-capability".
>
> The new command can report which kind of GIC device the host/QEMU
> support. The returned result is in the form of array.
>
> Sample command and output:
>
> {"execute": "query-gic-capability"}
> {"return": [{"emulated": false, "version": 3, "kernel": false},
>             {"emulated": true, "version": 2, "kernel": true}]}

Reminder: I still need confirmation from the libvirt folks
that this API meets their needs, and review from somebody
on the QEMU QMP protocol design side. This should go into
2.6 but we are getting closer to hardfreeze...

thanks
-- PMM
