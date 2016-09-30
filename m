Received: by 10.80.163.71 with SMTP id 65csp592774edn;
        Thu, 29 Sep 2016 17:03:07 -0700 (PDT)
X-Received: by 10.55.60.13 with SMTP id j13mr4241246qka.113.1475193786984;
        Thu, 29 Sep 2016 17:03:06 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s50si10340073qtb.30.2016.09.29.17.03.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 29 Sep 2016 17:03:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40872 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bplIA-0000Sg-Ge
	for alex.bennee@linaro.org; Thu, 29 Sep 2016 20:03:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38244)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bplI3-0000QD-6F
	for qemu-arm@nongnu.org; Thu, 29 Sep 2016 20:02:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bplI1-00065B-93
	for qemu-arm@nongnu.org; Thu, 29 Sep 2016 20:02:58 -0400
Received: from mail-vk0-x233.google.com ([2607:f8b0:400c:c05::233]:34977)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bplI1-00064n-51
	for qemu-arm@nongnu.org; Thu, 29 Sep 2016 20:02:57 -0400
Received: by mail-vk0-x233.google.com with SMTP id 192so89961827vkl.2
	for <qemu-arm@nongnu.org>; Thu, 29 Sep 2016 17:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=pfkyGkGdhUyw0062Aqn8+TOdiWg6cXWu2LM1fl9ee7s=;
	b=f6auYY2272cfm5FyTQI73toIF7DxZ5Ulxq4c+r4Utk9szihzxDadMoYLQhYHMhc+v/
	GDV0+Dm0wZc1ouIk22jhEsFq9LWLI1vk3g58XZSGDECXvKz77G6KSbL1AekNs9Ud4dC7
	sSC0CFYoJj4doGNfiSqoMkoqNRXDNEufUhF1c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=pfkyGkGdhUyw0062Aqn8+TOdiWg6cXWu2LM1fl9ee7s=;
	b=dp1RPKM0UdlBbMc3HoJuKIvzXTGSzdqiFipOBnVXHCyQ0G2QdGrH40ICdxgbMjXj6S
	tFk3ds7+NpzmF6nwCTS8AQYSPgNDdQiog6gfir0tfLrX2NAQn+5BTeR5jyVWHtDvsS2m
	23aX20nuzL0Gogcpl3t+8xRnt+yIBxSIeSR3dyseFEhya3Edct9KU7+rc8Xj5q9Hh/i9
	oeyewrEDuMQI74Qkva89l/nGTb1CmYwb57Bvte/2zIvzwpnTceRIJ9c9J0AtHQq5IeYu
	IazLGpljHslhAdmXm6jsUXG37A3iKcVpU3romxTBBSA7VlTsBMpoxUtYz+OENWI5Ep/d
	lHSQ==
X-Gm-Message-State: AA6/9RlNzr95tYNnITHLoFCMiLvD0Ypyuv8rnhqtlluQfTWJk5X16YXXjIbi6hx3p8O5tbDs+vif3sTmwUxv7fyd
X-Received: by 10.31.65.213 with SMTP id o204mr3289872vka.3.1475193776682;
	Thu, 29 Sep 2016 17:02:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.16.98 with HTTP; Thu, 29 Sep 2016 17:02:36 -0700 (PDT)
In-Reply-To: <1475063033-8176-1-git-send-email-vijaykumar@zilogic.com>
References: <1475063033-8176-1-git-send-email-vijaykumar@zilogic.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 29 Sep 2016 17:02:36 -0700
Message-ID: <CAFEAcA_OdaEmym+nuRXeTqY2Pz++0V1zmRQz8QOM+MS+3SKhfQ@mail.gmail.com>
To: Vijay Kumar B <vijaykumar@zilogic.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::233
Subject: Re: [Qemu-arm] [PATCH 0/2] mainstone: Fix incorrect and missed out
 keypad mappings.
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
Cc: qemu-arm <qemu-arm@nongnu.org>, Andrew Zaborowski <balrogg@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /YGnric2LeAY

On 28 September 2016 at 04:43, Vijay Kumar B <vijaykumar@zilogic.com> wrote:
> Resending, since I missed qemu-devel in the previous submission. Sorry
> about that.
>
> This patch series fixes the key mappings for the mainstone board. The
> incorrect mappings renders the console unusable when used with the
> Linux kernel's fbcon driver.
>
> Vijay Kumar B (2):
>   Fix incorrect key mapping for Enter key.
>   Add mapping for dot, slash and backspace.
>
>  hw/arm/mainstone.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Applied to target-arm.next, thanks.

-- PMM
