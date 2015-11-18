Received: by 10.182.158.201 with SMTP id ww9csp1565943obb;
        Wed, 18 Nov 2015 12:44:00 -0800 (PST)
X-Received: by 10.31.146.130 with SMTP id u124mr801541vkd.12.1447879440751;
        Wed, 18 Nov 2015 12:44:00 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l200si862926vkd.74.2015.11.18.12.44.00
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Wed, 18 Nov 2015 12:44:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro-org.20150623.gappssmtp.com
Received: from localhost ([::1]:38287 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1Zz9aC-0000hM-9h
	for alex.bennee@linaro.org; Wed, 18 Nov 2015 15:44:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37771)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Zz9YL-0005rn-4Y
	for qemu-devel@nongnu.org; Wed, 18 Nov 2015 15:42:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Zz9YJ-0005so-UJ
	for qemu-devel@nongnu.org; Wed, 18 Nov 2015 15:42:05 -0500
Received: from mail-vk0-x231.google.com ([2607:f8b0:400c:c05::231]:34873)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Zz9YJ-0005sh-Ny
	for qemu-devel@nongnu.org; Wed, 18 Nov 2015 15:42:03 -0500
Received: by vkha189 with SMTP id a189so3511510vkh.2
	for <qemu-devel@nongnu.org>; Wed, 18 Nov 2015 12:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro-org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=/ZuStZ+zVyLD4kKjVi4NtEWP9AAqEM0wiaCAanO+jCo=;
	b=cM7VwIEPdZH1PVohoN+4aMkSeSk/LMjYWtPlZC/TeFz+gJgEKyJExorhqPyd30EJjx
	nVyucIAiJAvFh/612MIVS1Jig6nRNH9HzWsdfESsTx9p3NpbsYYEyymRoee0bl+ULmCT
	lkNMiTIYh8sbFi4tEOGbgB1ibVGck1MnlHmR23n+L78Bu9fBZhZ8TVRPafBDZW2Qc1xd
	kaWEIJxk0C1Pdm+cgV/c2DwOz2JE0UQJA6aj/BiclPReUyYETUe7FSSDGax1lV+kZ3MK
	6GVIyYLKSCfAJiB1ASnNkD7QGkjVrEUXR1M6BJe/Bu55Q3/vUwCaEkB2trHRFJoqqM/I
	Q2ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=/ZuStZ+zVyLD4kKjVi4NtEWP9AAqEM0wiaCAanO+jCo=;
	b=TFSM6ihKeJPP58Bi0wD+2oDq1Bus9f1kACesNx0MED0FNAVuPRMP+d8lu23313A1HK
	YYjHh26Jofz+3VhtQO6XE8pf1fOEulNyNZlIKtuUP1gMOf8TwwEhF16jy0Ix8dXF3SVX
	su1UjfvpV0iJEpEZBLWM70KZCPiYuYR3X4EKTQiW6j8FhL3Vc8nHyrUPWtQ1Bj+BxYGE
	UVjZuU5ZWbhhTiYsUV7fpQyl5J6KUwKZwjIYtidjk32henVo4rBjgrSQLzU/n3iHvOjN
	aDHW2ayWrd62+amsW1rHNu2UbCHE3Rf0AUx0B1y40+pqCtZ7avhkk4Km3RGxPIruXuZs
	u22g==
X-Gm-Message-State: ALoCoQn7d8nO2xgvIY5elRg9+3Recw4pwMPHqaH9B3qTPrQCA5RSMRsGbIXDIVSfcBLskxcf3Xlb
X-Received: by 10.31.50.195 with SMTP id y186mr797805vky.82.1447879323340;
	Wed, 18 Nov 2015 12:42:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Wed, 18 Nov 2015 12:41:43 -0800 (PST)
In-Reply-To: <CAHpaMEZPBp1xniXKQcJxqxA9STL0-5GQ+Y+ok1+=AUxEmJXu+Q@mail.gmail.com>
References: <1447796430-90226-1-git-send-email-francois@getpebble.com>
	<CAFEAcA-oUjbRbOPdReNTEmW5bSXX6j9X+tdNyqr-fpKk8TqK2w@mail.gmail.com>
	<CAHpaMEZVHNbjGx9sRqevBn8XGoyB=3tqWfMAqM-LXFMSBXwdvw@mail.gmail.com>
	<CAPokK=pn93wX9ePin_BQAtzYc43jJ0dYnNVVCRAYaifXst0cPw@mail.gmail.com>
	<CAHpaMEZPBp1xniXKQcJxqxA9STL0-5GQ+Y+ok1+=AUxEmJXu+Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 18 Nov 2015 20:41:43 +0000
Message-ID: <CAFEAcA--Ja0gfodVPgM_Ld+KVpWLijF6w7CBBD11VXd6QEHJVw@mail.gmail.com>
To: Francois Baldassari <francois@pebble.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400c:c05::231
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>, qemu-arm@nongnu.org,
	Michael Davidsaver <mdavidsaver@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH] target-arm: Priority masking
	with basepri on v7m
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
X-TUID: oRks3TX7TOMX

On 18 November 2015 at 20:30, Francois Baldassari <francois@pebble.com> wrote:
[regarding Michael's M profile NVIC patchset]
> I must be missing something obvious, but I do not have the original
> email thread (I was not subscribed at the time) and thus am finding it
> exceedingly difficult to apply the patches using git-am.
>
> I would happily test the patches otherwise.

For a big patchset like this the easiest thing is to just ask
Michael if he has a public git repo with the patches in (I've
cc'd him).

Otherwise there are a couple of tools: you can use patchwork:
http://patchwork.ozlabs.org/project/qemu-devel/list/
(you need to search for the relevant patches and download the
'mbox' files for them to 'git am' one at a time; unfortunately
patchwork doesn't yet know about patch series to let you download
a series all at once). Or you can use the 'patches' tool:
https://github.com/aliguori/patches
That needs to be installed locally, but it does know about
patch series and it can directly apply a whole series to your
local git tree.

For a one-off use the patchwork website is easier, since
there's no need to install anything locally. (It's also
more forgiving of misformatted patch emails.) If you're going
to make a habit of applying patches from the mailing list,
the patches tool is easier to use and will repay the up-front
effort of downloading it and figuring out its UI.

thanks
-- PMM
