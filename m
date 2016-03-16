Received: by 10.25.208.211 with SMTP id h202csp1127367lfg;
        Wed, 16 Mar 2016 04:48:34 -0700 (PDT)
X-Received: by 10.55.75.14 with SMTP id y14mr2169309qka.33.1458128914438;
        Wed, 16 Mar 2016 04:48:34 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v39si2562261qge.105.2016.03.16.04.48.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 16 Mar 2016 04:48:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:55452 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ag9wI-0006Ok-1j
	for alex.bennee@linaro.org; Wed, 16 Mar 2016 07:48:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60924)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ag9vb-0005W2-A3
	for qemu-devel@nongnu.org; Wed, 16 Mar 2016 07:47:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ag9vX-0006va-Go
	for qemu-devel@nongnu.org; Wed, 16 Mar 2016 07:47:51 -0400
Received: from mail-vk0-x229.google.com ([2607:f8b0:400c:c05::229]:36836)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ag9vX-0006vJ-DG
	for qemu-devel@nongnu.org; Wed, 16 Mar 2016 07:47:47 -0400
Received: by mail-vk0-x229.google.com with SMTP id c3so57924814vkb.3
	for <qemu-devel@nongnu.org>; Wed, 16 Mar 2016 04:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zlXvovPKeFkYdoD1Ms9cKc9ISJM1vHFJckMBhx7eyg4=;
	b=idyYBGhiGU/HwgV77/2h0la6jH1JwHigisDmWowNX6aAsJq8oUXCeqBncHBbVxaeyv
	omCMnByn1vCb/cfAkgopoX1p9IRcGGPAaF1JHS54GaS5qRCDEkzRV9fcuFFmCznEgO1a
	JoQBwRLxkr14TpG3eYXz1d+zYDy4zc1tzf1o4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zlXvovPKeFkYdoD1Ms9cKc9ISJM1vHFJckMBhx7eyg4=;
	b=Y7cnPu0gihAkpl6Np9W3ZlujAGcUCD85R7p2iPb/vQc/7WoR8UUcoPN5yZMP1i36S0
	xoH6SNfIwmr/VXh+MBjhi2v1hPI5ka1vkTLs2v6PVAVN455sMhZbHcldBpWzJkp238CK
	QKBIupi3VeNaLXVPGM4PQTJKgZjIoj6ViJ1g2NrzWCFhOvDQebgvwsOH3/VRqvVcKu6H
	RQUoqblOiFKk1vi/UTmSfeqPPDCE36qWTEC0hPtAg/AmRiDDcnq4seB6q8rhKGImDMwp
	obBRW3MvljTnWqjdo+jNQmum12Bdas7EifxeA4jSY1Wp4f+xKoia2L9xOu8WPqQZcJpO
	yvOQ==
X-Gm-Message-State: AD7BkJJMf1AChZE7SWBwWlzXHDpyU+xHN8S24DUIanaRYVXOE+cNdd+CdaP6wMVmrvvQA8UBVIvahpXP25mrKyCY
X-Received: by 10.31.141.2 with SMTP id p2mr3762029vkd.37.1458128866797; Wed,
	16 Mar 2016 04:47:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Wed, 16 Mar 2016 04:47:27 -0700 (PDT)
In-Reply-To: <1457334350-5675-4-git-send-email-zxq_yx_007@163.com>
References: <1457334350-5675-1-git-send-email-zxq_yx_007@163.com>
	<1457334350-5675-4-git-send-email-zxq_yx_007@163.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 16 Mar 2016 11:47:27 +0000
Message-ID: <CAFEAcA_3WUvTKG1LUg+cBUvYVQUw2aWy10fi2qmbGTXC5AXeXA@mail.gmail.com>
To: xiaoqiang zhao <zxq_yx_007@163.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::229
Cc: Rob Herring <robh@kernel.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-devel] [PATCH 3/9] hw/arm: QOM'ify integratorcp.c
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
X-TUID: Lpls8IQTU+Su

On 7 March 2016 at 07:05, xiaoqiang zhao <zxq_yx_007@163.com> wrote:
> * Drop the use of old SysBus init function and use instance_init
> * Remove the empty 'icp_pic_class_init' from Typeinfo
>
> Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Possible follow-up cleanups:
 * move the integrator_pic code into hw/intc/integrator_pic.c
 * move the icp-ctrl-regs code into hw/misc/integrator_control.c
 * move the integrator_core code into hw/misc/integrator_core.c
 * implement reset methods for these devices
 * implement migration state via a VMState struct for these devices

thanks
-- PMM
