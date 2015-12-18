Received: by 10.182.158.201 with SMTP id ww9csp1021634obb;
        Fri, 18 Dec 2015 04:05:41 -0800 (PST)
X-Received: by 10.140.92.35 with SMTP id a32mr4325894qge.92.1450440341751;
        Fri, 18 Dec 2015 04:05:41 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h65si15956502qge.46.2015.12.18.04.05.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 18 Dec 2015 04:05:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:59855 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a9tn3-0004Wr-DU
	for alex.bennee@linaro.org; Fri, 18 Dec 2015 07:05:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41183)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a9tn0-0004Uc-Ge
	for qemu-arm@nongnu.org; Fri, 18 Dec 2015 07:05:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a9tmy-0001cx-CL
	for qemu-arm@nongnu.org; Fri, 18 Dec 2015 07:05:38 -0500
Received: from mail-vk0-x22e.google.com ([2607:f8b0:400c:c05::22e]:35355)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a9tmx-0001cd-S8
	for qemu-arm@nongnu.org; Fri, 18 Dec 2015 07:05:36 -0500
Received: by mail-vk0-x22e.google.com with SMTP id a189so64061289vkh.2
	for <qemu-arm@nongnu.org>; Fri, 18 Dec 2015 04:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=nHdLH4UwLKaPz8RWrleCcsZAbqvnk8SKNdGd+lGd9VE=;
	b=IwKh1Onw7d9Vf6VTCKZBbECWtsK6cPNaiA7pnoDzjl16YKeXfOW5lvhouR2eYZXxFb
	tQLayaVIyBSMjLUfVdZdbwaqIovsk0hIs5spD9TnQm2sMFprHBq/wviZrDmMDyCH+0Ar
	Yq/5TxZPvJLyMuXqHElGiHZiSXtO4bMALrbT4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=nHdLH4UwLKaPz8RWrleCcsZAbqvnk8SKNdGd+lGd9VE=;
	b=JDWznUaxDdVVcLFW3R57OQjfXraNXul/37wx5vQj3Su+iHokc3P3eQ2ocaMD7DaxqC
	0lHcjJeYcIUUex/za77yQfo39D2iJ9uxKssXg0mVlcfcHoTcs/qjgUbUWYQa2iq6a6M2
	xGwJ4gzhAFNyIMj5082qvjPrB6r5eiINnNjHKfLrqn9FGYay3XVC7wyhSSBT4z5eWOm8
	0FHrXP53ZHvnrKPsoH2oGRsj5vnT8v56B4i3FimccIctTPV0BNzXQAa/AH4SQUYoVBuP
	Blwy5P7GzIiKDbR8hUfXePqiicEWtMXY8nVZ9teKuH1ZOvSviCghN4dqL99O9iEKH8vd
	OMyQ==
X-Gm-Message-State: ALoCoQkxClPzFEEomb4mJHxHtHQ8ddPeCPzf1RrHWkL8Qd4FehE8B4S2t/9e03NkWZX+Ycst2dvoPrQIZXXNmZTWssJnx1VwPCUsfHae9l54JApE8tdw5y0=
X-Received: by 10.31.131.203 with SMTP id f194mr2025478vkd.90.1450440335529;
	Fri, 18 Dec 2015 04:05:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Fri, 18 Dec 2015 04:05:16 -0800 (PST)
In-Reply-To: <1450219878-5293-9-git-send-email-drjones@redhat.com>
References: <1450219878-5293-1-git-send-email-drjones@redhat.com>
	<1450219878-5293-9-git-send-email-drjones@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Dec 2015 12:05:16 +0000
Message-ID: <CAFEAcA-CiA9zZKYwS9YG+B-N67C3OpgiN08N=c-f7XXbMdKtbQ@mail.gmail.com>
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22e
Cc: Markus Armbruster <armbru@redhat.com>, Alexander Graf <agraf@suse.de>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	Eric Blake <eblake@redhat.com>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-arm] [PATCH v3 8/9] elf: add arm note types
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: L1hd0mf8s/Qs

On 15 December 2015 at 22:51, Andrew Jones <drjones@redhat.com> wrote:
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  include/elf.h | 5 +++++
>  1 file changed, 5 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
