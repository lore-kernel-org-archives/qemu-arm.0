Received: by 10.25.208.211 with SMTP id h202csp1108259lfg;
        Wed, 16 Mar 2016 04:10:01 -0700 (PDT)
X-Received: by 10.140.102.232 with SMTP id w95mr4127267qge.21.1458126601859;
        Wed, 16 Mar 2016 04:10:01 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a12si2820199qha.52.2016.03.16.04.10.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 16 Mar 2016 04:10:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:55129 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ag9Kz-0001TA-8y
	for alex.bennee@linaro.org; Wed, 16 Mar 2016 07:10:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38432)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ag93U-0002vw-Pd
	for qemu-devel@nongnu.org; Wed, 16 Mar 2016 06:51:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ag93T-0004Rf-UE
	for qemu-devel@nongnu.org; Wed, 16 Mar 2016 06:51:56 -0400
Received: from mail-vk0-x233.google.com ([2607:f8b0:400c:c05::233]:36598)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ag93T-0004RY-HZ
	for qemu-devel@nongnu.org; Wed, 16 Mar 2016 06:51:55 -0400
Received: by mail-vk0-x233.google.com with SMTP id c3so56349169vkb.3
	for <qemu-devel@nongnu.org>; Wed, 16 Mar 2016 03:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=x6DgwU6eRskWnlgBt7QnjMziRLSrXAi2qOgM2MD7wFw=;
	b=BvinxoHEtQEt5j9k2TuhiM4Il13JJqfMn6Lp8tK1lcaSRP8T9ipGUe2dIkOMCtr9FV
	QFA1051/B6kQMNYzI2ggoVOSpV9c6ez8m6LWWqtzHSze3khDIUmbTcR0fY5L+7wQfp2D
	4L2AW3pYTTnqS44vlNOEG9buiIYJneidpEkgQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=x6DgwU6eRskWnlgBt7QnjMziRLSrXAi2qOgM2MD7wFw=;
	b=KKeVhbIy1k5u+ftxJksF3e33cf9WI2oV/AgN6xEWTFSXnQfvatKE4jR64rVcLdC4HB
	3ihmR4U1HZHRwIBJMyLCQFjX+22LLTDu4re/puhFG+NDHf7FdGYpJtIglOjdKXgzdYU7
	HeGocv0WROXbdOxwqgk1Q2ARzP5NVzxxqrirjk/pr00luwEjEtuf23I3Cl4PWxH6m/is
	FfI7N98hoM7loBLpC4VyUY0p2LgCAhfF1uWZM4Z7KbPsJ4IsV7rsHoheC91IIDVLiVNV
	o+ghL4RC2fjA5pV7jFSyom5EGMDIGvkHxuA90zq1BgL2wUdvnCIfdhM1am1x3eLpUgeV
	JXtg==
X-Gm-Message-State: AD7BkJLR54yr+XFwe7JjAfynhD5S11P0yZ83RgHWS7FkC/msF/2KCl/4+qYqUPdA0FAN/P6NUadFMLYEBuY4vUXF
X-Received: by 10.31.52.147 with SMTP id b141mr3474192vka.82.1458125515086;
	Wed, 16 Mar 2016 03:51:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Wed, 16 Mar 2016 03:51:35 -0700 (PDT)
In-Reply-To: <1457717778-17727-1-git-send-email-wei@redhat.com>
References: <1457717778-17727-1-git-send-email-wei@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 16 Mar 2016 10:51:35 +0000
Message-ID: <CAFEAcA_pxSkKOHKZACf6E7mSRXzoWuCV2h7NYM-x7L9hDWC4vA@mail.gmail.com>
To: Wei Huang <wei@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::233
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>, wei@redaht.com,
	Andrea Bolognani <abologna@redhat.com>
Subject: Re: [Qemu-devel] [PATCH V1 0/2] Versioning ARM virt machine types
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
X-TUID: uDFXL9kvRCat

On 11 March 2016 at 17:36, Wei Huang <wei@redhat.com> wrote:
> We start to see more features been added to ARM virtual machine models.
> For the purpose of backward compatibility (e.g. migration), it is time
> to consider versioning machine types for ARM VMs. As a beginning step, this
> patchset defines an abstract machine type for ARM VMs. The current
> "virt" machine is re-written based on this new abstract type accordingly.
> These patches have been verified by booting existing VMs.
>
> RFC->V1:
>  * Rename the machine type to "virt-2.6", matching the imminent QEMU version
>  * Remove mc->is_default (Peter's comment)



Applied to target-arm.next, thanks.

-- PMM
