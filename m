Received: by 10.182.158.201 with SMTP id ww9csp1024919obb;
        Fri, 18 Dec 2015 04:11:19 -0800 (PST)
X-Received: by 10.55.76.76 with SMTP id z73mr4443810qka.90.1450440679418;
        Fri, 18 Dec 2015 04:11:19 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r83si3947264qhc.38.2015.12.18.04.11.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 18 Dec 2015 04:11:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:59883 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a9tsV-0007hU-10
	for alex.bennee@linaro.org; Fri, 18 Dec 2015 07:11:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42306)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a9tsS-0007h7-OU
	for qemu-arm@nongnu.org; Fri, 18 Dec 2015 07:11:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a9tsR-00031H-WA
	for qemu-arm@nongnu.org; Fri, 18 Dec 2015 07:11:16 -0500
Received: from mail-vk0-x22c.google.com ([2607:f8b0:400c:c05::22c]:33482)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a9tsQ-00030x-Q6
	for qemu-arm@nongnu.org; Fri, 18 Dec 2015 07:11:15 -0500
Received: by mail-vk0-x22c.google.com with SMTP id a188so64861353vkc.0
	for <qemu-arm@nongnu.org>; Fri, 18 Dec 2015 04:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=rs6sQLGgBKeFpRijUtUnzk6wiltJck2VD2FfYiuh6MY=;
	b=dcYeQDOg7rWGOFtbPvLNeGr+O2ea8ocw66GxPkPNMpWKfIhD7+tYb7jB+1oCsoNC80
	242WC58Q6JF9kelbGGWGlV7K68/8RHzdlWHtPzsEE9q5ubUIsf0QloYXV+0fGe3RfKYK
	c/d/j5Wy30EIuewfSd0drIbPeyexxnAfBRlSg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=rs6sQLGgBKeFpRijUtUnzk6wiltJck2VD2FfYiuh6MY=;
	b=H3SWDvch5WwNBExy+I1WdBSHiU+tSAEMREoqO10Z3a4nIuTpiO757etEjG42NwM7yv
	fQ2cVPqfKxj2+J5+b791w20JNOWD6isrIiLeMN2J3dn+II6OqMU6DzW4ZOu/8rjskGnP
	J0zPjnlhnYagi1+Qm/BY7yZsstqIu7B4c7gRm96bFv+Q9NX4irhPRGk/OStI70a5HpxF
	aR+DKRHSHXG3S97iDtZaQhep6XmVNk5oemC+8V4cx0XVd6UE71KKPfAYqRFS46H+0ICm
	V8+0xT8j6yH1IkWqn/ojphAw9BCYQ7wyZ4eAk/k4S+Tj8K2YE+aapq0OGDTD9ERS3/rV
	TV4w==
X-Gm-Message-State: ALoCoQn5D2izCfsEULFnnmUwmoxHd8w38Nt/Y1NT9ic654lPzEv4uVXDPECuiikuczF17hYt3/jGX1lZ6f50F8YV850ZL437mg/PzVSLQnvWuKfHJWmTgno=
X-Received: by 10.31.131.203 with SMTP id f194mr2044266vkd.90.1450440674483;
	Fri, 18 Dec 2015 04:11:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Fri, 18 Dec 2015 04:10:55 -0800 (PST)
In-Reply-To: <1450219878-5293-4-git-send-email-drjones@redhat.com>
References: <1450219878-5293-1-git-send-email-drjones@redhat.com>
	<1450219878-5293-4-git-send-email-drjones@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Dec 2015 12:10:55 +0000
Message-ID: <CAFEAcA-h4sLVCqOssgnTzaFuxJD4FOdMeDVWwFrRz-hZyu_LAA@mail.gmail.com>
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22c
Cc: Markus Armbruster <armbru@redhat.com>, Alexander Graf <agraf@suse.de>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	Eric Blake <eblake@redhat.com>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-arm] [PATCH v3 3/9] dump: allow target to set the page
	size
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
X-TUID: B+KyzSY0dP1o

On 15 December 2015 at 22:51, Andrew Jones <drjones@redhat.com> wrote:
> This is necessary for targets that don't have TARGET_PAGE_SIZE ==
> real-target-page-size. The target should set the page size to the
> correct one, if known, or, if not known, to the maximum page size
> it supports.
>
> (No functional change.)
>
> Signed-off-by: Andrew Jones <drjones@redhat.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
