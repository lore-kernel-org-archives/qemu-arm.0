Received: by 10.25.208.211 with SMTP id h202csp318289lfg;
        Thu, 10 Mar 2016 01:04:04 -0800 (PST)
X-Received: by 10.55.72.130 with SMTP id v124mr2579936qka.13.1457600644216;
        Thu, 10 Mar 2016 01:04:04 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d189si2711129qhd.94.2016.03.10.01.04.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 10 Mar 2016 01:04:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:47072 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1adwVn-00069h-OO
	for alex.bennee@linaro.org; Thu, 10 Mar 2016 04:04:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47577)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1adwVl-00067x-HS
	for qemu-arm@nongnu.org; Thu, 10 Mar 2016 04:04:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1adwVk-0001Zp-70
	for qemu-arm@nongnu.org; Thu, 10 Mar 2016 04:04:01 -0500
Received: from mail-vk0-x232.google.com ([2607:f8b0:400c:c05::232]:34243)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1adwVj-0001Zj-V0
	for qemu-arm@nongnu.org; Thu, 10 Mar 2016 04:04:00 -0500
Received: by mail-vk0-x232.google.com with SMTP id e185so87829570vkb.1
	for <qemu-arm@nongnu.org>; Thu, 10 Mar 2016 01:03:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=cLPEq++Oiuc+ryMFWfetoMCayy9W+bdCAITaMqBt44Q=;
	b=CUwnh7PgLxp0cXedO+vtj9bsSDCVC2nwYAfAPcDopxUpRYHAxiJ6vsg5o7HzE7zNPm
	FcFLktCgy0S21mUFrHTNanHCr2wW77SE16lKChWCWIo9LeIjwzPDx9yvr23fOmj73B5N
	jhRtrNKgw/WNwfNnA93LmMKBVIrgtv5Fb6KEk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=cLPEq++Oiuc+ryMFWfetoMCayy9W+bdCAITaMqBt44Q=;
	b=Hg3D3qyq/5FhqCLltEyURp+/k+g6QIhYMVAy+Lf3gGe3dzSq65PcIourz1SuO1+T6N
	ngOargJO9Y7rDDvgRojJG+umvx/Gt9c+BELnugM9HXC4tlE6BEEKwwkKwNydX7npWhUI
	O2VpXFDXZhBCtebOvayp2UdR246Zz7lNwJqBLLnR0jla30vpWXpS6OVv23o3ycFxC33M
	Ncy0U2UHaLj8LfWezNfmxy/M12vzejusMVoVKxAd3H3FFAS7gL66jwQWXNbTpQTmPWz9
	Lg9L3eK2BOHfgQ/AL4680lTUHyoHmEPzyRquGMr+M0C9M+IuQxaMETaLrcTuoBeCAdac
	gyHQ==
X-Gm-Message-State: AD7BkJJnwIkg9G2uPlisg3Tfzr34OP1NknyM9yml4gbqT22bmZgBP2gQPXK0cOSSg/8zQvoL7JNLrpgQyDDRkCNn
X-Received: by 10.31.52.147 with SMTP id b141mr2511123vka.82.1457600639413;
	Thu, 10 Mar 2016 01:03:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Thu, 10 Mar 2016 01:03:39 -0800 (PST)
In-Reply-To: <20160223190905.65sroj2tysb22hbz@hawk.localdomain>
References: <1456175198-25210-1-git-send-email-wei@redhat.com>
	<CAFEAcA8vyVL6jyMTGCap9Bu=eyqR2OUN5LzH5Sjo965Fn4PmHA@mail.gmail.com>
	<56CCA649.8090906@redhat.com>
	<CAFEAcA-gXuVJjJS8T87ru9YE+5VrJ25eXoqkwxsd21OK6__Upw@mail.gmail.com>
	<20160223190905.65sroj2tysb22hbz@hawk.localdomain>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Mar 2016 16:03:39 +0700
Message-ID: <CAFEAcA-qAakhVCxH4=i9nMs=XFHLgP4usUF4JdzVFNGYm_iNew@mail.gmail.com>
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::232
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Andrea Bolognani <abologna@redhat.com>
Subject: Re: [Qemu-arm] [PATCH RFC 0/2] Versioning ARM virt machine types
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
X-TUID: mYsNew9CpYom

On 24 February 2016 at 02:09, Andrew Jones <drjones@redhat.com> wrote:
> I believe our downstream versioning has driven some changes to libvirt
> already, so I think it's a good time to bring the how to best version
> mach-virt discussions to all the respective upstreams, despite it
> currently, at least for us, being used only on pre-releases though.

So, to sum up from a conversation today:

 * We should add versioning to 'virt' now
 * We should do it by having the QEMU 2.6 release have a "virt-2.6"
   which is the same as "virt" for this upstream release
 * Then from 2.6 forward we start creating "virt-2.7", etc machines
   and making sure we have properties etc so that "virt-2.6" remains
   the same config as the 2.6 release's virt board.
 * RedHat are doing this for downstream anyway so will take on the
   task of monitoring changes to the virt board and submitting the
   relevant patches to property-ify things. (Better still, if you
   make comments during code review you can get patch submitters to
   do the work for you ;-). I will attempt to spot this kind of thing
   when I review patches to the virt board but I will probably miss
   things especially at first.)

Practically:
 * Wei, you need to respin this patchset, because as it stands it
   creates a "virt-2.5", and it should be "virt-2.6". If you do that
   then I think it's generally OK to go in.
 * My only other review comment is that patch 1 sets mc->is_default
   which gives qemu-system-aarch64 a default board. We deliberately
   don't have a default machine type for ARM, so please don't do that.
   (We can have that discussion if you like but it's a separate issue
   so best not tangled up with this patchset.)

thanks
-- PMM
