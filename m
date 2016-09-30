Received: by 10.80.163.71 with SMTP id 65csp602217edn;
        Thu, 29 Sep 2016 17:32:02 -0700 (PDT)
X-Received: by 10.55.149.135 with SMTP id x129mr4325214qkd.16.1475195522736;
        Thu, 29 Sep 2016 17:32:02 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i18si10427863qtc.24.2016.09.29.17.32.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 29 Sep 2016 17:32:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40994 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bplkA-0006M7-6l
	for alex.bennee@linaro.org; Thu, 29 Sep 2016 20:32:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42866)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bplgP-0003gn-MA
	for qemu-devel@nongnu.org; Thu, 29 Sep 2016 20:28:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bplgN-0004cb-Sn
	for qemu-devel@nongnu.org; Thu, 29 Sep 2016 20:28:08 -0400
Received: from mail-ua0-x234.google.com ([2607:f8b0:400c:c08::234]:36244)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bplgN-0004cQ-OX
	for qemu-devel@nongnu.org; Thu, 29 Sep 2016 20:28:07 -0400
Received: by mail-ua0-x234.google.com with SMTP id n13so80859933uaa.3
	for <qemu-devel@nongnu.org>; Thu, 29 Sep 2016 17:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=KlwYdhqjAx+EtHYQPERQqVCXHgksqn/9lnGq9xUTNhc=;
	b=Uo0SICCtdu532a94UFJKFZVKo8AkBHe1u9kPGdfB6W/VkC++lSxJKcmxDhRHheze7Z
	MQijQbrLCH4hwQ0RqEbz+pkLm/kgWe6TPYkJxYJkUiMPZ/EZWTmcMbeZNuGP/iXVyelh
	vFFC1ISptkg4jrJSEfpcfaX0llVuQ2Kcm+4tM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=KlwYdhqjAx+EtHYQPERQqVCXHgksqn/9lnGq9xUTNhc=;
	b=QGVJViIdRiKX+SkhvQEr/YeiDbqVJ6HyCd/iP7l+97cTrUsjq33KRU7weQjBrC7wzr
	ZMJYSHkKecw7wvrBxVFLjQd3D+T1BFrl6ex9Lj8FACPowC+2/yCG7cHToOwYcA4eWI/r
	AjDWq4blOt8mw/KGWJxI+WhBLNPz2CKCoxJ6x2dRbrkCcuq13d6XsmO8mWhrD2++PPhv
	takjGXG8z7SF3ivo+sBwZ4dbNrYu8t5WRw1R5u6j0S4VJ+hMkG1qrWunXNap7DyaXf6B
	czd42uBIOSsJtDr54QsMqAWyWal3uT+KxV6LtFcakxBQRvsR1VjlmFFgWKLvlbOWYcRO
	GJZw==
X-Gm-Message-State: AA6/9RknfbrGwP5qSn4rBFHvO8e5VkKsvudgLwGdlN/M4PHqf+MMe7QqGH9FvN4rKNRaop66hOdCUYerf8oHFx2R
X-Received: by 10.176.84.149 with SMTP id p21mr3489457uaa.42.1475195287415;
	Thu, 29 Sep 2016 17:28:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.16.98 with HTTP; Thu, 29 Sep 2016 17:27:46 -0700 (PDT)
In-Reply-To: <1474641676-25017-1-git-send-email-drjones@redhat.com>
References: <1474641676-25017-1-git-send-email-drjones@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 29 Sep 2016 17:27:46 -0700
Message-ID: <CAFEAcA9+SJb6=FHMEVro0dforgUO58iPzL629D7SufBrP4Bnaw@mail.gmail.com>
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::234
Subject: Re: [Qemu-devel] [PATCH] hw/arm/virt: add 2.8 machine type
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
Cc: Wei Huang <wei@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VZihODcbhcLL

On 23 September 2016 at 07:41, Andrew Jones <drjones@redhat.com> wrote:
> Signed-off-by: Andrew Jones <drjones@redhat.com>
>
> ---
>
> This will conflict with Wei's PMU property series (which is why I
> asked him to add it to that series...), but anyway, it'll be a minor
> resolution to make.
> ---



Applied to target-arm.next, thanks.

-- PMM
