Received: by 10.182.158.201 with SMTP id ww9csp603887obb;
        Thu, 17 Dec 2015 11:41:01 -0800 (PST)
X-Received: by 10.140.130.22 with SMTP id 22mr60641681qhc.99.1450381261106;
        Thu, 17 Dec 2015 11:41:01 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v20si12693736qge.51.2015.12.17.11.41.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 Dec 2015 11:41:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:56678 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a9eQ8-0003lf-S1
	for alex.bennee@linaro.org; Thu, 17 Dec 2015 14:41:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58279)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a9eOB-0001Ph-LC
	for qemu-devel@nongnu.org; Thu, 17 Dec 2015 14:39:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a9eOA-0002xB-Mn
	for qemu-devel@nongnu.org; Thu, 17 Dec 2015 14:38:59 -0500
Received: from mail-vk0-x236.google.com ([2607:f8b0:400c:c05::236]:33817)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a9eOA-0002wo-BU
	for qemu-devel@nongnu.org; Thu, 17 Dec 2015 14:38:58 -0500
Received: by mail-vk0-x236.google.com with SMTP id j66so52743981vkg.1
	for <qemu-devel@nongnu.org>; Thu, 17 Dec 2015 11:38:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=BcFR0lYewKGjsqFvVSZal3v6Lk6TYyNnQKfGZQG9PCg=;
	b=NYHragq/V1uFpkzxXyscQNkcCJCaTgNn+h0PaGsZ/JSwZVgeCKbSlJ3vWPuS31Gbg0
	d46t7FxV89EqmOh/ry66hUc/ukWttDiH/BtrGLsrV92ld7s34j6XD/dB7h7zKHX6j1z8
	QA4A7QwOOFQD2jBsV0ymLo0mR4IFK3h9QohSs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=BcFR0lYewKGjsqFvVSZal3v6Lk6TYyNnQKfGZQG9PCg=;
	b=Mk2S6n5Ow1f4k4q6uc6HRutfTj0v3ddtIJmd2k7qJF83M9gau9R3G+ASNGdaG4ePrW
	ztnkjLVNC1Hqa2WLFI82+T/pQ8c3jafXRZU05z0zzuDjhgGdBHZIJc+Mol+DDiDRZ5Nw
	DmaoZT0mIbr/sCb4DFVQ4O7LfA9RELWNs86/b8xiswbKQZOTla47qHWs3utauiYAs+IZ
	TqTeABZx32OFW8wWN7/TLvJlI0hY8b5pSVYrj5FX3+4XME7BKcjsVy4Uc46UU1/HWXqT
	uYn0OOuVTkCj0rcu8G38Jiv88ad1qh84H1dxX/s2u+UFcBd+LkhU45QX3WrzIKm+p24D
	ZLZQ==
X-Gm-Message-State: ALoCoQlqbibDQEjZHpCQXDyXsoaL3IGpAgsgLnDTiOJNRWADX2BqoFPZBEZGavn/g6hGE2/yNKXtRBWMyV2U9UDy7EyMW4E3pg48V/zvGrMMzi7IjMXJtjc=
X-Received: by 10.31.194.21 with SMTP id s21mr37596467vkf.92.1450381137960;
	Thu, 17 Dec 2015 11:38:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Thu, 17 Dec 2015 11:38:38 -0800 (PST)
In-Reply-To: <1449101933-24928-1-git-send-email-mdavidsaver@gmail.com>
References: <1449101933-24928-1-git-send-email-mdavidsaver@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Dec 2015 19:38:38 +0000
Message-ID: <CAFEAcA_Gcy67o4YRnrULU9AZ=A21CWE1kcFSKjx9+X75wXnrNQ@mail.gmail.com>
To: Michael Davidsaver <mdavidsaver@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::236
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-devel] [PATCH v2 00/26] armv7m: exception handling, MPU,
	and more
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
X-TUID: dHtDedAi7PZq

On 3 December 2015 at 00:18, Michael Davidsaver <mdavidsaver@gmail.com> wrote:
> All,
>
> Second revision of ARMv7-M exception handling patchset, which now adds
> MPU support (as well as can be done).

I just sent this as a followup to the v1 cover letter by mistake;
here it is again:

Thanks for sending out v2. I've now reviewed all the patches in the
set up to the start of the MPU related ones. I think it's probably
better if we work on getting the NVIC related patches into a mergeable
state and then come back to the MPU as a second series -- the patchset
is already quite large.

We do want MPU support for our M profile models, but I think it'll
be faster to concentrate on one thing at a time.

thanks
-- PMM
