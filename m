Received: by 10.25.208.137 with SMTP id h131csp712121lfg;
        Thu, 5 May 2016 05:48:52 -0700 (PDT)
X-Received: by 10.194.51.8 with SMTP id g8mr13835766wjo.15.1462452532050;
        Thu, 05 May 2016 05:48:52 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r9si3617959wme.19.2016.05.05.05.48.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 05 May 2016 05:48:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53378 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ayIhm-0000nY-UG
	for alex.bennee@linaro.org; Thu, 05 May 2016 08:48:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36545)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ayIhe-0000ZH-T0
	for qemu-arm@nongnu.org; Thu, 05 May 2016 08:48:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ayIhT-0001Dw-Af
	for qemu-arm@nongnu.org; Thu, 05 May 2016 08:48:21 -0400
Received: from mail-vk0-x22d.google.com ([2607:f8b0:400c:c05::22d]:34024)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ayIhS-00016X-4S
	for qemu-arm@nongnu.org; Thu, 05 May 2016 08:48:15 -0400
Received: by mail-vk0-x22d.google.com with SMTP id m188so23727449vka.1
	for <qemu-arm@nongnu.org>; Thu, 05 May 2016 05:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4kQoWXJLQhgBb6L7ajbaXaoW7Up5VA+QIMDlQSbKhms=;
	b=jfabGYsIto+xMaY4fqnim4PAE6NtXwvOxFGIenu70xesvXbByyyV/K1HooZxyTgYIY
	AJadXTxraSm3kkDWn7JwlDN4P6NCKGch1F6xEY95GfNgG80LLGcUkrAfawGLP3tLuYk6
	hMfIdULeKYmKO19AOrZfd/9lo9++nzXiCuHGY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4kQoWXJLQhgBb6L7ajbaXaoW7Up5VA+QIMDlQSbKhms=;
	b=LWF65RYR1E3dv4xblLx9m8KfPfHWNBrIx49PDrOaJJIFqULaiEHC7ttxQMUOEn2IzQ
	FDrYXLvzcLbxE6sHTE7IVRdby7nFzFmSwUcwjzw0uzj59nsLtgGoNxL83bBQXqvH1FKG
	dRhZ6NIOSy3PWzDjEVEXkAw0Jnj9481U5WzE7ksA4eFZyKs3+gxM6Ys60rMwjhWx1ltC
	CnTJFA+5KEb95AaXhxBCk7LXzfsml+ACd0yq//NJ7Q71Ga4nIpJBqRK44czTjfIB4Gnf
	uVW9+A8+IRnO0YForqzAtkW/EG/IRaD6in22yp7XzeAbMBCVt8svyOG98gIhXG6wVTOt
	GhoA==
X-Gm-Message-State: AOPr4FWnym+2JxXZjparcsAkobCCzX5/xeWRCJdSgzDobX7tesWcg4rDTD1t8CG9IaHxPeLIV+DEZ9qDj2wu+XkD
X-Received: by 10.31.55.142 with SMTP id e136mr2220125vka.92.1462452472207;
	Thu, 05 May 2016 05:47:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Thu, 5 May 2016 05:47:32 -0700 (PDT)
In-Reply-To: <1462417489-28603-5-git-send-email-zxq_yx_007@163.com>
References: <1462417489-28603-1-git-send-email-zxq_yx_007@163.com>
	<1462417489-28603-5-git-send-email-zxq_yx_007@163.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 May 2016 13:47:32 +0100
Message-ID: <CAFEAcA_QNCGUnc_h5rYmU3XUU_+p4T_7Y5fM7_JO0x6Dk6SPCw@mail.gmail.com>
To: xiaoqiang zhao <zxq_yx_007@163.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22d
Subject: Re: [Qemu-arm] [PATCH RESEND 4/5] hw/display: QOM'ify
 milkymist-vgafb.c
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, Michael Walle <michael@walle.cc>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	hirofumi@mail.parknet.co.jp
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KfnfWSRm6nYO

On 5 May 2016 at 04:04, xiaoqiang zhao <zxq_yx_007@163.com> wrote:
> * Drop the old SysBus init function and use instance_init
> * Move graphic_console_init into realize stage
>
> Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
