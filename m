Received: by 10.223.197.9 with SMTP id q9csp1533425wrf;
        Thu, 12 Oct 2017 03:37:25 -0700 (PDT)
X-Received: by 10.200.52.235 with SMTP id x40mr2734219qtb.135.1507804645120;
        Thu, 12 Oct 2017 03:37:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507804645; cv=none;
        d=google.com; s=arc-20160816;
        b=YFlPnKAoY8jLGNnZM69g2YDUHKMxUW35+lgYlg9twYD5Y1Q6Be3uR5wZTPhBpGwO/1
         5QLK1KpdXFfq8BvqAgQ4XAhq1nUxzsFuvqDrLVQcXvS4q7SvOVBP4rvYFoytnKDn4rw8
         atRo5l3Uug5KAVL4Mkx6dznul9Ze2RH87bQ3fO8w/y1iMBtfHYUtD9NyIYrVdXWRHsMx
         wuwOxOKvWupLIJne9pfNjdNDgsFy61E8WPbHKPE4B2srXt2g6Afx/LnLnI5fMW+X3NeK
         GeGxMKPkl2lACexM7nHyRrLJhza7/ky/2Lbj7URIB8RuIXNjPRUorP+FnwOuHFQDAAT+
         pm+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=g9fukNC5suo+HUzH2QCCHMvOnWhgruNf2oQ+Bp1FtoY=;
        b=Irr0E0pedybUC0hH/20IYM7dyrqq8PV6bk4B/THrkRUM/akfhj1adws2giX5MYCfY1
         Tiqqu+U/FtaFI871w6fKr0iX8e71jD9ARZbSCTjN8sfLfV0wTA1RBgS8Iuui5/DswnE8
         ALrbEpS+JHi5UAy93z8sF38GDt/Er5TdulHX6jid0Re69KRmCtepQqSc8+I0Xkx0UoV2
         UuWZgW2eUFfDTDy+2sQzAgkglvDsKi2pLhJnOWE7c0b7AUuNsULwQ90O+NqLHaeka1WT
         HTCzF8U4doP86bahPeYNHR+3E1nkS/qQV9H948BaP0FkgR/Dj1VoiAqPtkVfm4jo0GJF
         Jtpg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cU08Vuc/;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r77si313702qka.111.2017.10.12.03.37.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Oct 2017 03:37:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cU08Vuc/;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44714 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e2ari-0006Q9-Pu
	for alex.bennee@linaro.org; Thu, 12 Oct 2017 06:37:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54399)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e2arX-0006Of-0W
	for qemu-arm@nongnu.org; Thu, 12 Oct 2017 06:37:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e2arV-0007h0-Ka
	for qemu-arm@nongnu.org; Thu, 12 Oct 2017 06:37:11 -0400
Received: from mail-wm0-x234.google.com ([2a00:1450:400c:c09::234]:50114)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e2arV-0007ge-EE
	for qemu-arm@nongnu.org; Thu, 12 Oct 2017 06:37:09 -0400
Received: by mail-wm0-x234.google.com with SMTP id b189so11828564wmd.4
	for <qemu-arm@nongnu.org>; Thu, 12 Oct 2017 03:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=g9fukNC5suo+HUzH2QCCHMvOnWhgruNf2oQ+Bp1FtoY=;
	b=cU08Vuc/vxpfcO2WVnZm+lrqLek1oqZpeMHnhiWOO3VFBNvhiS5mu7YXAFUnX+Vl5V
	+9TEETejQMZal/r7CUB9GPmSQZk3TIkw1YnPLEaADZCcAhM1fmgCDDo+c7uzwncsJtNQ
	QUKVx/pepdX52uoYKR8sj/+bC2FejrvMptFaY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=g9fukNC5suo+HUzH2QCCHMvOnWhgruNf2oQ+Bp1FtoY=;
	b=Hmgy765D991dX1poBflTmt1Kfrqh01G6nIQyPYNBFB5Zo5s3R3JQMTnENeKn8aGmev
	aNVXw3J1JgkB4QIiWD0HgUVYA4JYnA26Ahu0BFymHZaO5HD/ZxZMJBfgHvT7PRz02gER
	3i3adsalZocmFaM86bexZXJkG+rAXtMllO5Q5HZTVDLL87lxJY4L4x+044Q6jFYLrtfk
	L0jI8QAHHNAJZWgEXSrs0cc3iW1e+BdqHhF0O/8Wl5kK52Ttc33E7VuJBnehDMXX+hv6
	dizDZPWwwR7uf0+NdWqB11gZg3DR6JnKEZwjgpAHZHUgLugOVYQvawSoD7pScmgZADMF
	X2wg==
X-Gm-Message-State: AMCzsaV8odnO6IrxP4QE+d1Fl4wbO8/Yk1iPcBFZBTjXPpYPi9YF/sYv
	pa9e2Irn7n2PAAfgQWfwxGu08qQFBwavn7KNLDcWDg==
X-Google-Smtp-Source: AOwi7QAW/QsOZzV0en5pqrJ5KbxMHDzv4Nxo6VWo6d8iFJO61qRINn01ZoKEfkofVy+kdfHfXywLKCII2nQOGrGVT6g=
X-Received: by 10.28.236.203 with SMTP id h72mr1638672wmi.147.1507804628205;
	Thu, 12 Oct 2017 03:37:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.139.195 with HTTP; Thu, 12 Oct 2017 03:36:47 -0700 (PDT)
In-Reply-To: <73b7916a-4bb3-3913-ed6f-23e5c3e4fa23@redhat.com>
References: <1506524205-20763-1-git-send-email-eric.auger@redhat.com>
	<CAFEAcA_UfXaO-KEgXb+GSUT=XhQar_gxshUV_GWO_axcZ0R4sA@mail.gmail.com>
	<73b7916a-4bb3-3913-ed6f-23e5c3e4fa23@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Oct 2017 11:36:47 +0100
Message-ID: <CAFEAcA8OcaNJ3ZU=LFeCP0A_Kd__OTb-svZL7_dqjaBH=uRtog@mail.gmail.com>
To: Auger Eric <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::234
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC 0/3] vITS Reset
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
Cc: Andrew Jones <drjones@redhat.com>, Vijay Kilari <vijay.kilari@gmail.com>,
	Juan Quintela <quintela@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>,
	wanghaibin.wang@huawei.com, wu.wubin@huawei.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8DpmHxG8T/fU

On 11 October 2017 at 17:06, Auger Eric <eric.auger@redhat.com> wrote:
> On 09/10/2017 20:17, Peter Maydell wrote:
>> It's not clear to me why we need a new KVM device attribute
>> for doing ITS reset. The usual approach for this is:
>>  * system reset causes QEMU's device model reset code
>>    to reset state structure values to whatever their
>>    reset value is
>>  * we write those values up into the kernel, which is
>>    sufficient to reset it
>>
>> What goes wrong with that in the case of the ITS?
>> In particular, if GITS_CTLR.Enabled is 0 then I think the
>> kernel should not be trying to read guest memory tables.
>
> We discussed that on the kernel thread and Christoffer seemed to prefer
> an IOTCL instead of individual register writes
> (https://www.spinics.net/lists/kvm-arm/msg27211.html)
>
> The IOCTL empties the ITS cached data (list of collection, list of
> devices and list of LPIs) while it is not obvious the reset of BASER<n>
> would mandate that. Eventually in my kernel series I also voided the
> list on BASER<n>.valid toggling from 1 to 0.

OK, I guess that makes sense -- in hardware, the device
has extra internal state (the cached stuff) which isn't
visible in its register interface. So we want to provide
an API which is morally equivalent to the hardware reset line
to tell the ITS to drop that internal state.

> Spec also says:
> If a write to GITS.CTLR changes the Enabled field from 1 to 0, the
> Interrupt Translation Space must ensure
> that both:
> =E2=80=A2 Any caches containing mapping data are made consistent with ext=
ernal
> memory.
> =E2=80=A2 GITS_CTLR.Quiescent =3D=3D 0 until all caches are consistent wi=
th external
> memory.
>
> I aknowledge I don't really get at which moment we are supposed to void
> the caches.

This is the interface for a software controlled clean powerdown:
 * OS writes 0 to Enabled
 * ITS finishes anything it is currently in the middle of
 * ITS updates any info that it currently has only in its internal
   cache so that it is also reflected in the external memory
   data structures
 * ITS sets Quiescent to 1 to tell the OS it has finished this process
   (and may no longer access guest RAM after this point)
 * OS can now unmap the RAM that the ITS tables are in,
   tell the h/w to power off the GIC/ITS, etc

It's a multistep process where the ITS gets the opportunity to
write memory in the middle. I think in theory there's no obligation
to actually drop the cached data when you set Quiescent to 1,
provided that you validate that when the OS sets Enabled back to
1 all your cached data is still valid, because that's
indistinguishable from dropping the cache and then repopulating it.

For the unclean powerdown (yanking the cord out of the back of the
machine), which is what qemu's reset is, we don't give the ITS
the option to write memory, it just has to effectively drop
any internal data structures it was using. So it needs a KVM
API that's different from the register-access API.

thanks
-- PMM
