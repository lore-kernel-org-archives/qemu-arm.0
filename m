Received: by 10.25.208.137 with SMTP id h131csp711581lfg;
        Thu, 5 May 2016 05:47:36 -0700 (PDT)
X-Received: by 10.194.205.134 with SMTP id lg6mr13009837wjc.153.1462452456775;
        Thu, 05 May 2016 05:47:36 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u64si3596705wmd.74.2016.05.05.05.47.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 05 May 2016 05:47:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53372 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ayIgZ-0007L9-MY
	for alex.bennee@linaro.org; Thu, 05 May 2016 08:47:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36216)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ayIgR-00073J-7m
	for qemu-arm@nongnu.org; Thu, 05 May 2016 08:47:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ayIgF-0000sy-Ja
	for qemu-arm@nongnu.org; Thu, 05 May 2016 08:47:05 -0400
Received: from mail-vk0-x230.google.com ([2607:f8b0:400c:c05::230]:34422)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ayIgE-0000lR-Cj
	for qemu-arm@nongnu.org; Thu, 05 May 2016 08:46:59 -0400
Received: by mail-vk0-x230.google.com with SMTP id m188so23685340vka.1
	for <qemu-arm@nongnu.org>; Thu, 05 May 2016 05:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ssnB3gC5MpOE8xYTAtY7j/I2Un7lfkyg2BTySdMbeCs=;
	b=QmVIjJrE/yQ1frpvPGFUfVuoZOPS28HZo1PNvlbADdnDmetNjx6+zMYaD9sgGZb6Cs
	A1KVZ7HK2E+j5eQPSvzxPyWflD47xT2Gxrc3q32r+/oiTzW4DN0hWVNqk7XAB0nXusee
	invxt4oAMHu7p7ZYFlMoCKOmuZr+4Mmcnpblc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ssnB3gC5MpOE8xYTAtY7j/I2Un7lfkyg2BTySdMbeCs=;
	b=S8RBDQ8lnZCytEnDGLUm8r0vmwTYRmHtbFwoYJewGUf9rBy0Z8ecMK0kLWqW+CPXAz
	C+lXgGuxWOHoN6aUfmgDZej20eu/aV3sDYqrIupv+/vpC6kJVAyW3YnkMnQFP9rvBZbg
	H9k6u+Dde2LVGKF2Sr63j6dq9OQVyV4gZ7bL5myRzZV6SsrDyzv6/eKGyu+X53LhKUcS
	jvbmcQ6R+GdvwujdoOJP24TEgmVU1AySMwXlxQCXptbunnQuoCUcHsEzvScs7/vI01ql
	prfGMut4GBIdUZilEaEFnE/d0pdH92+fycceM9kiBsdSPYnv1lPfBSqRwGixFxwgQOL8
	1W2Q==
X-Gm-Message-State: AOPr4FWfMQJ33r0qQk5XH2gJX340baILadjMWJSn16mqoEkVaNrVfOspVA6fKqPSiyXXrPSukMa9MN7/7QmVLe4H
X-Received: by 10.31.68.67 with SMTP id r64mr2241822vka.82.1462452393106; Thu,
	05 May 2016 05:46:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Thu, 5 May 2016 05:46:13 -0700 (PDT)
In-Reply-To: <1462417489-28603-3-git-send-email-zxq_yx_007@163.com>
References: <1462417489-28603-1-git-send-email-zxq_yx_007@163.com>
	<1462417489-28603-3-git-send-email-zxq_yx_007@163.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 May 2016 13:46:13 +0100
Message-ID: <CAFEAcA_gkX=xokbLwOGQeNHUvn-a7+oLF1=yaW6AptDTmBYWQA@mail.gmail.com>
To: xiaoqiang zhao <zxq_yx_007@163.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::230
Subject: Re: [Qemu-arm] [PATCH RESEND 2/5] hw/display: QOM'ify jazz_led.c
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Michael Walle <michael@walle.cc>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
	hirofumi@mail.parknet.co.jp, Leon Alrae <leon.alrae@imgtec.com>,
	Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fj8KsfM89KMD

On 5 May 2016 at 04:04, xiaoqiang zhao <zxq_yx_007@163.com> wrote:
> * Drop the old SysBus init function and use instance_init
> * Move graphic_console_init into realize stage
>
> Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
> ---
>  hw/display/jazz_led.c | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

CCing the MIPS maintainers and the listed maintainer for this
board so they can pick this patch up.

thanks
-- PMM
