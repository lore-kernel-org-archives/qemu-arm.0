Received: by 10.182.158.201 with SMTP id ww9csp587012obb;
        Thu, 17 Dec 2015 11:08:53 -0800 (PST)
X-Received: by 10.140.105.36 with SMTP id b33mr70894244qgf.94.1450379333889;
        Thu, 17 Dec 2015 11:08:53 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 139si12552394qhe.1.2015.12.17.11.08.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 Dec 2015 11:08:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:56419 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a9dv3-0000qJ-HY
	for alex.bennee@linaro.org; Thu, 17 Dec 2015 14:08:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50701)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a9dv1-0000oE-Nz
	for qemu-arm@nongnu.org; Thu, 17 Dec 2015 14:08:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a9dv1-00041t-4k
	for qemu-arm@nongnu.org; Thu, 17 Dec 2015 14:08:51 -0500
Received: from mail-vk0-x233.google.com ([2607:f8b0:400c:c05::233]:35990)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a9dv1-00041m-1d
	for qemu-arm@nongnu.org; Thu, 17 Dec 2015 14:08:51 -0500
Received: by mail-vk0-x233.google.com with SMTP id f2so13593015vkb.3
	for <qemu-arm@nongnu.org>; Thu, 17 Dec 2015 11:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=yGv6chvWOoQOCVXwOTdTFu4V4DLPRZj3ovjPtZ2WWf4=;
	b=EDkeEmOQ6pnG3iMcrcy9pVv48LFGdKlu+Aoy3zvz6eWYaSEKDJnUFOnxyoA5QHtee9
	E9c8cZEaiMvAa6AqZzoe19e8y8zxwpAtmpONVR0pjXtH4RJV3Ucgmg5vmjVulR34YQ1Z
	te9uBqi6POeso1NGAol32bGhIJMBNy39kqHTs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=yGv6chvWOoQOCVXwOTdTFu4V4DLPRZj3ovjPtZ2WWf4=;
	b=JN96PZQgHo7cRpIDgBUxBmtW1AmtuvA8TROMbP6FvudV30WBBeOHR4l9mp1XrchELp
	/CW2dbdHTsi6m8eQ9q3pfTUsiHgrEhP/V/ENi+66mlIt0bkp1wldlD8lF3UMNf9sm1zD
	ySvYtNSIp5HhaSSvUt8LZfuF3eB2tzm9EeEZNVBHJsz4+UpGy3hqJgRULWp4hg/fNRfq
	VgvgUdJ18B/M/Iuq00PF7wP5lPBPvfIBG1N2A/aSPHoz2/U5lJ7dc1z0+/xu3Ri7E8eQ
	tjsM4WCZw5klHN+QTgYQw+MPEkCRjwg+vivIrUMx2JBmfvIb1wkanJdRj1zhAkgSgL87
	XOIw==
X-Gm-Message-State: ALoCoQkHnlkFOvy64PjYUtgqR4jbwZ1Pp+/GY9rOJY4ZwuNOQynG7lbI3oPj05YWwE2qX3esOE4uG5raq0MWEOlBQ5IPTMVCDywhRH+MMwjj2Y5nxU9187w=
X-Received: by 10.31.47.197 with SMTP id v188mr39593107vkv.6.1450379330863;
	Thu, 17 Dec 2015 11:08:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Thu, 17 Dec 2015 11:08:31 -0800 (PST)
In-Reply-To: <1449101933-24928-12-git-send-email-mdavidsaver@gmail.com>
References: <1449101933-24928-1-git-send-email-mdavidsaver@gmail.com>
	<1449101933-24928-12-git-send-email-mdavidsaver@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Dec 2015 19:08:31 +0000
Message-ID: <CAFEAcA_Ustm-2+o+U+eCDcHL9XAXZxfcEaVXxWfuNZ-Gr_JnZg@mail.gmail.com>
To: Michael Davidsaver <mdavidsaver@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::233
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH v2 11/26] arm: gic: Remove references to NVIC
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
X-TUID: uaHTv44QM4dO

On 3 December 2015 at 00:18, Michael Davidsaver <mdavidsaver@gmail.com> wrote:
> armv7m_nvic.c no longer relies on the GIC.
> Remove REV_NVIC and conditionals which use it.
> ---
>  hw/intc/arm_gic.c        | 14 +++++++-------
>  hw/intc/arm_gic_common.c | 23 ++++++++---------------
>  hw/intc/gic_internal.h   |  7 ++-----
>  3 files changed, 17 insertions(+), 27 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
