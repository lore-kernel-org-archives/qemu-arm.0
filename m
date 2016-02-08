Received: by 10.25.159.19 with SMTP id i19csp1409303lfe;
        Mon, 8 Feb 2016 07:57:49 -0800 (PST)
X-Received: by 10.55.221.129 with SMTP id u1mr15855738qku.42.1454947069301;
        Mon, 08 Feb 2016 07:57:49 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q18si9499255qkh.45.2016.02.08.07.57.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Feb 2016 07:57:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:46007 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aSoCC-0008US-UF
	for alex.bennee@linaro.org; Mon, 08 Feb 2016 10:57:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51062)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aSoBo-00088H-SF
	for qemu-devel@nongnu.org; Mon, 08 Feb 2016 10:57:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aSoBn-0005Wn-Ts
	for qemu-devel@nongnu.org; Mon, 08 Feb 2016 10:57:24 -0500
Received: from mail-vk0-x230.google.com ([2607:f8b0:400c:c05::230]:35637)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aSoBn-0005WZ-P6
	for qemu-devel@nongnu.org; Mon, 08 Feb 2016 10:57:23 -0500
Received: by mail-vk0-x230.google.com with SMTP id e6so97767454vkh.2
	for <qemu-devel@nongnu.org>; Mon, 08 Feb 2016 07:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=IIUGten4FekyJGiLcxOXZQH4Qt2CYYMoxVwWPr2ZuCM=;
	b=SzGwfaHu1ASSxUP1AEPTjtyr8TqmWdD8Gr43jEDqPwK0Og9/XuKD8myVUnU7rBZkOn
	hqd5C++3/piOtNA0rKFRNgiDalw8MwdnQLTnbOxE6bqDhTz41SMJnQB2Bzo1cj2vfyt+
	kebgbtawFdxXM+0uYvNOSIcvgSwQLvoP+r+aw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=IIUGten4FekyJGiLcxOXZQH4Qt2CYYMoxVwWPr2ZuCM=;
	b=Q5+lWQaqYpG5lf0FJou+wX7RcdF6PO4f8evQcoChddQXVUixiU0Yjw7skDI86bQQKJ
	kfcW29UbeJ2n6wwAcmTO93VHyDECMvBBG/4KvfnD090nNHfaWWSBU9tHMr2zaRzhIOm0
	dm0fPjsyDjgofOw15BJrE8UBqZhYJMqrqDrq9/AxvNQpnegYhzYacyP8kw5/52kIQKYf
	++3x2y8toqtyusuxJAU6tO1VC2YsO4XeyiXOQ000cpzxckTzxkwGeSupu0B/QYTkTAyF
	SRHh7ZyJbiD+bF86Tuz3ZyW+gYRmIc3w7hHW/vUFUfuxiDRaaYSITrh6Sej03yxyXLb1
	Lccg==
X-Gm-Message-State: AG10YOSAbpzSjkJBJKq4BSQJCmJG/PqmIMLYVQKPJJPqbfi/KcOjDtUY092e/k+9tQwpbkDs4Zo3Wd0YjRG/vT7f
X-Received: by 10.31.180.85 with SMTP id d82mr18507055vkf.83.1454947043360;
	Mon, 08 Feb 2016 07:57:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Mon, 8 Feb 2016 07:57:03 -0800 (PST)
In-Reply-To: <1454256948-10485-1-git-send-email-serge.fdrv@gmail.com>
References: <1454256948-10485-1-git-send-email-serge.fdrv@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Feb 2016 15:57:03 +0000
Message-ID: <CAFEAcA_MWY0kt18X-wjUn_z7onTmJK9ZHv=suaC4X2KgOG3sig@mail.gmail.com>
To: Sergey Fedorov <serge.fdrv@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::230
Cc: Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-devel] [PATCH v3 0/2] Architectural watchpoint check
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
X-TUID: pe0LPacvJdsN

On 31 January 2016 at 16:15, Sergey Fedorov <serge.fdrv@gmail.com> wrote:
> This series is intended to fix ARM watchpoint emulation misbehavior.
> QEMU hangs when QEMU watchpoint fires but it does not pass additional
> architectural checks in ARM CPU debug exception handler. For details,
> please see individual patches. The most relevant parts of the original
> discussion about ARM breakpoint and watchpoint emulation misbehavior can be
> found at:
> https://lists.gnu.org/archive/html/qemu-devel/2015-08/msg02715.html
> https://lists.gnu.org/archive/html/qemu-devel/2015-09/msg00527.html
>
> Changes in v2:
>  * Check moved before setting cpu->watchpoint_hit
>  * Pointer to watchpoint being checked passed to debug_check_watchpoint()
>    callback
>  * BP_WATCHPOINT_HIT flag cleared from flags from wp->flags in no-fire case
>  * Comment for debug_check_watchpoint() callback improved

Applied to target-arm.next, thanks.

-- PMM
