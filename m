Received: by 10.80.166.35 with SMTP id d32csp153432edc;
        Mon, 31 Oct 2016 06:56:21 -0700 (PDT)
X-Received: by 10.55.50.213 with SMTP id y204mr26859440qky.146.1477922181375;
        Mon, 31 Oct 2016 06:56:21 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n127si17637033qkc.273.2016.10.31.06.56.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 31 Oct 2016 06:56:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35800 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1c1D4W-0008Hi-Ta
	for alex.bennee@linaro.org; Mon, 31 Oct 2016 09:56:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58308)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1c1D4S-0008H6-IF
	for qemu-arm@nongnu.org; Mon, 31 Oct 2016 09:56:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1c1D4R-0005BF-Ts
	for qemu-arm@nongnu.org; Mon, 31 Oct 2016 09:56:16 -0400
Received: from mail-vk0-x232.google.com ([2607:f8b0:400c:c05::232]:34359)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1c1D4R-0005AY-O9
	for qemu-arm@nongnu.org; Mon, 31 Oct 2016 09:56:15 -0400
Received: by mail-vk0-x232.google.com with SMTP id x186so46140030vkd.1
	for <qemu-arm@nongnu.org>; Mon, 31 Oct 2016 06:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BTjXStqDHkpXNSOjibj8xSCCSdjyr+W+99PxXyPJOD4=;
	b=WoKkjsqqUcLxnCtXKqxlCOtDbEFGJijBenPgCp1/mAxJ9Ywm/ZztpoMdTJ1XR3bIkV
	lw7HUc7CGpZJQsvUHrfVWTaZ/mjGOnZ95/q/9h3aYU4hSs0zaJdDAGmuxQO2GI3VIUXr
	V0yaFzYCL3fOPicUuC9YBJ5w/wO5L45SxBhnA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BTjXStqDHkpXNSOjibj8xSCCSdjyr+W+99PxXyPJOD4=;
	b=crcOOPG8V5fssF61YrnZIp21b0F19eAp69ZIP+GLxMlrt40nPDqvFqZiJ8lExzo+FR
	Qgfccg8OwV5iqj0YxQmVV5qAIYlAmKX+N5ciUTWZvQcXp+DJHQSi32sIfbFlyA+KdGEV
	30WxgPrrQO0Sbgo1rfSnvttFCZlz6ZUENrRnRfuncNh6Lc1+iks8oMqr6N1rwYrPlpNe
	C02sZdfo6GZYYrcHr+Rl3BtONlmaZ57Zgugqxis9fJRkmLfmNjKC10KCk2Z9iYRklwq3
	qLKEtMXskoMlAPXPn34PVGWmDu7mHzO9ElBbAAx/KY1ELara9GteTV4K5os/ggmUxZR+
	DtEg==
X-Gm-Message-State: ABUngvcQENeVaApRdlLUnqo3y3D5Qc8Bk9NHRpq64C3otR+ti5VXxdYmgYbhUut7OzNCEIAa9mJ/h09132BriQZY
X-Received: by 10.31.65.3 with SMTP id o3mr3323954vka.3.1477922174946; Mon, 31
	Oct 2016 06:56:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Mon, 31 Oct 2016 06:55:54 -0700 (PDT)
In-Reply-To: <1477906553-5374-1-git-send-email-marcin.krzeminski@nokia.com>
References: <1477906553-5374-1-git-send-email-marcin.krzeminski@nokia.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 31 Oct 2016 13:55:54 +0000
Message-ID: <CAFEAcA8=-XLO5NqEp0oRY9YoaXWproHMTxJwT0KMDNfrr0Ja0w@mail.gmail.com>
To: "Krzeminski, Marcin (Nokia - PL/Wroclaw)" <marcin.krzeminski@nokia.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::232
Subject: Re: [Qemu-arm] [v3] nvic: set pending status for not active
 interrupts
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
Cc: rfsw-patches@mlist.nokia.com, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: epvRi5TY9IHv

On 31 October 2016 at 09:35,  <marcin.krzeminski@nokia.com> wrote:
> From: Marcin Krzeminski <marcin.krzeminski@nokia.com>
>
> According to ARM DUI 0552A 4.2.10. NVIC set pending status
> also for disabled interrupts. This patch adds possibility
> to emulate this in Qemu.
>
> Signed-off-by: Marcin Krzeminski <marcin.krzeminski@nokia.com>
> ---
> v3:
>     - corrected logic to reflect NVIC behaviour
> v2:
>     - add a dedicated function for nvic
>     - update complete_irq
>
>  hw/intc/arm_gic.c | 22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
>



Applied to target-arm.next, thanks.

-- PMM
