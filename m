Received: by 10.80.163.71 with SMTP id 65csp603070edn;
        Thu, 29 Sep 2016 17:35:15 -0700 (PDT)
X-Received: by 10.200.53.105 with SMTP id z38mr750601qtb.82.1475195715511;
        Thu, 29 Sep 2016 17:35:15 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r7si2394472qtb.104.2016.09.29.17.35.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 29 Sep 2016 17:35:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41013 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bplnG-000185-Ud
	for alex.bennee@linaro.org; Thu, 29 Sep 2016 20:35:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43881)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bplmX-0000bM-AM
	for qemu-arm@nongnu.org; Thu, 29 Sep 2016 20:34:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bplmV-0005sM-3u
	for qemu-arm@nongnu.org; Thu, 29 Sep 2016 20:34:28 -0400
Received: from mail-vk0-x22b.google.com ([2607:f8b0:400c:c05::22b]:36589)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bplmV-0005sB-08
	for qemu-arm@nongnu.org; Thu, 29 Sep 2016 20:34:27 -0400
Received: by mail-vk0-x22b.google.com with SMTP id y190so59064650vkd.3
	for <qemu-arm@nongnu.org>; Thu, 29 Sep 2016 17:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PerdK3BYg+e8fx/Qd0POALqH0sCTokEtIINVi283C0I=;
	b=D0sQf0TGZ2J9HmVJFBzhhWppxO1R9L4ezFB+8b06N1XqXohNfus1TGNOOOJLgq8POc
	6usDUcP1f6YBd3tT/1GFWsNWnHycZudshSA4FLAGfqShCq3/UM65cHHBDrcKe0WAyz0p
	HqGy35D/uU5bEE/P+7gQl7jd052vgLEBkYX5k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PerdK3BYg+e8fx/Qd0POALqH0sCTokEtIINVi283C0I=;
	b=muFf7f3E4UvBtpcc+zFUNOFQaURN8bbhk2FQS9grUb5F/Gy1GD/On1LrqGNFNYo6e3
	t3IGDV0WU7EQJ+VOKR3gN/MeFe+EcG5EE1kU3R4QPc1s7DNqH5DtrBkaT1Tqfs0yCW+I
	4aPHDs3TcCTIOgJhkPPaOmNRXOuFUT26rth6guBpKxh13kvC98on1qFNiei+/xUIlg3G
	9cx6lq/p2CXh1nHsGKwLeVBuLM/qz+rlP8wm7dNijtBW5dF+VxTCSz/bchLJyTGxSaDF
	YGvaCiOlBGHWF+Dily+OAYuYLwZrmSp1I+/0jCGhSqtULdE0IocJTxkFkM6jtqJ9o/jM
	VlSw==
X-Gm-Message-State: AA6/9Rkrxj9OH6TFjbSQ6M8r/UevHyhBFWtzoMzVIyYsumBXEwgtAIQwLom56wBfp8edYQ1ljFYsiO6JfYyUpx04
X-Received: by 10.31.165.83 with SMTP id o80mr3698449vke.95.1475195666599;
	Thu, 29 Sep 2016 17:34:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.16.98 with HTTP; Thu, 29 Sep 2016 17:34:06 -0700 (PDT)
In-Reply-To: <1474616617-366-5-git-send-email-eric.auger@redhat.com>
References: <1474616617-366-1-git-send-email-eric.auger@redhat.com>
	<1474616617-366-5-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 29 Sep 2016 17:34:06 -0700
Message-ID: <CAFEAcA9GoEANc=t9G5v8eYWhHwdCmJB8qKQxYzp7jbaM4QSr0g@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22b
Subject: Re: [Qemu-arm] [PATCH v7 4/8] kvm-all: Pass requester ID to MSI
 routing functions
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
Cc: Andrew Jones <drjones@redhat.com>, Tomasz Nowicki <tn@semihalf.com>,
	Shlomo Pongratz <shlomopongratz@gmail.com>,
	Pavel Fedin <p.fedin@samsung.com>, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Shannon Zhao <shannon.zhao@linaro.org>,
	Diana Craciun <diana.craciun@freescale.com>,
	Christoffer Dall <christoffer.dall@linaro.org>, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zeObvJ3nILXj

On 23 September 2016 at 00:43, Eric Auger <eric.auger@redhat.com> wrote:
> From: Pavel Fedin <p.fedin@samsung.com>
>
> Introduce global kvm_msi_use_devid flag plus associated
> kvm_msi_devid_required() macro. Passes the device ID,
> if needed, while building the MSI route entry. Device IDs are
> required by the ARM GICv3 ITS (IRQ remapping function is based on
> this information).
>
> Signed-off-by: Pavel Fedin <p.fedin@samsung.com>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
