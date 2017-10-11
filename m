Received: by 10.223.197.9 with SMTP id q9csp760490wrf;
        Wed, 11 Oct 2017 09:06:41 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QBOh53C2xRe6/ct6VRFN1m3bZrKSrl3q/32dbK3SXkyjqpbw0FkcOYWfZbFD2fJVi15PI/N
X-Received: by 10.200.44.46 with SMTP id d43mr171928qta.283.1507738001265;
        Wed, 11 Oct 2017 09:06:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507738001; cv=none;
        d=google.com; s=arc-20160816;
        b=WZjIHZt7oWt92Ou64T91KYN90Q7Etn9o9SfSpbNMF58yqJU5iWmSZahWMcBh6Nd+M5
         m4OHuC9p0AzDNecAtuvjTHWIQ5E9OQBltFfIfpy8gzyjM9P/yVl39KDigRmGvM/xo02e
         w1cooUex8/ZN6m6dARyVrxeyXJGuxs9hkf9EMLmkf+5RzEpwuTaGccs5cC2v8XLifXiu
         ZNwYhJbWrJ7nkIlBJVE8BGuRQTYb10ykFs4FUt7jeMpycmqkcv0biZS83D+/lKqksg8D
         FbbSG9IUq76qSAGxbbMtENsZcMEWxLJW9pi1JmeIuAZYgL5Lv2Nf5cqiVGEzISsegbyl
         f/Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dmarc-filter
         :arc-authentication-results;
        bh=quYraPKWph6XqH4xBRVD9cCzmsFJLDj7IJ1gdQCwST4=;
        b=tMZz+0RSdOIp733Q/ly5f3SIle/5+o/pfTDiM5pQj4gURdFFQF2Nso45utD6/CIDNv
         fqs0qyNEI4x1hl+nbC8637BCalHNB+dr9QPxo19Z58VRJfLOgYj47V0NfQOQbr/VIODU
         qluQqBVv4JrShiNR+EB4+lt9pOIjW9qYQ7NHlj5iUfWQhW1azA7pBS/6x3g2NAwmXwCD
         AeY8HYWTlLVuAtevGu6KZ6rLhsAnLNRN/mCnCsIm5JK2KueVF4EdKtW08oYh8/0uKhU+
         lK13aDM6pV+z/DyyREvROIcj91vcsOAqewrGMdHJJNP5N4citSjGrGc7dIxSJ95nqOh4
         4pJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i22si206199qkh.6.2017.10.11.09.06.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 11 Oct 2017 09:06:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41703 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e2JWo-0005wU-UA
	for alex.bennee@linaro.org; Wed, 11 Oct 2017 12:06:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46912)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1e2JWf-0005v8-0E
	for qemu-arm@nongnu.org; Wed, 11 Oct 2017 12:06:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1e2JWb-0003JL-Qw
	for qemu-arm@nongnu.org; Wed, 11 Oct 2017 12:06:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37196)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1e2JWb-0003IZ-I0; Wed, 11 Oct 2017 12:06:25 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7B5B33E2A5;
	Wed, 11 Oct 2017 16:06:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 7B5B33E2A5
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain (ovpn-117-172.ams2.redhat.com
	[10.36.117.172])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C77C360A9B;
	Wed, 11 Oct 2017 16:06:19 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1506524205-20763-1-git-send-email-eric.auger@redhat.com>
	<CAFEAcA_UfXaO-KEgXb+GSUT=XhQar_gxshUV_GWO_axcZ0R4sA@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <73b7916a-4bb3-3913-ed6f-23e5c3e4fa23@redhat.com>
Date: Wed, 11 Oct 2017 18:06:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_UfXaO-KEgXb+GSUT=XhQar_gxshUV_GWO_axcZ0R4sA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Wed, 11 Oct 2017 16:06:24 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
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
X-TUID: Yzt4/6qCsf3s

Hi Peter,

On 09/10/2017 20:17, Peter Maydell wrote:
> On 27 September 2017 at 15:56, Eric Auger <eric.auger@redhat.com> wrote=
:
>> At the moment the ITS is not properly reset. On System reset or
>> reboot, previous ITS register values and caches are left
>> unchanged. Some of the registers might point to some guest RAM
>> tables which are not provisionned. This leads to state
>> inconsistencies that are detected by the kernel save/restore
>> code. And eventually this may cause qemu abort on source or
>> destination.
>>
>> The 1st patch, suggested to be cc'ed stable proposes to remove
>> the abort in case of table save/restore failure. This is
>> definitively not ideal but looks the most reasonable until we
>> get a proper way to reset the ITS. Still a message is emitted
>> to report the save/restore did not happen correctly.
>>
>> Subsequent patches add the support of explicit reset using
>> a new kvm device group/attribute combo. The associated kernel
>> series is not upstream [1], hence the RFC.
>>
>> ITS specification is not very clear about reset. There is no
>> reset wire. Some register fields are documented to have
>> architecturally defined reset values and we use those here:
>> Most importantly the Valid bit of GITS_CBASER and GITS_BASER
>> are cleared and the GITS_CTLR.Enabled bit is cleared as well.
>=20
> The ITS is a device, not part of the CPU, so its reset is
> implementation-defined but typically via some signal that's
> controlled by the SoC (this is no different to the other
> parts of the GICv3 which aren't denoted as being in the
> reset domain of the CPU). For instance if you look at the TRM
> for the GIC-500 it has a single 'resetn' reset signal which
> resets all of the GIC/ITS apart from the CPU interface parts:
> http://infocenter.arm.com/help/index.jsp?topic=3D/com.arm.doc.100336_00=
02_01_en/index.html
>=20
> The GICv3 spec 6.6 indicates what is supposed to happen to
> the ITS on powerup. For QEMU's purposes reset is generally
> considered to be a cold reset and we should always reset our
> state to the same thing it was when QEMU first started.
>=20
> It's not clear to me why we need a new KVM device attribute
> for doing ITS reset. The usual approach for this is:
>  * system reset causes QEMU's device model reset code
>    to reset state structure values to whatever their
>    reset value is
>  * we write those values up into the kernel, which is
>    sufficient to reset it
>=20
> What goes wrong with that in the case of the ITS?
> In particular, if GITS_CTLR.Enabled is 0 then I think the
> kernel should not be trying to read guest memory tables.

We discussed that on the kernel thread and Christoffer seemed to prefer
an IOTCL instead of individual register writes
(https://www.spinics.net/lists/kvm-arm/msg27211.html)

The IOCTL empties the ITS cached data (list of collection, list of
devices and list of LPIs) while it is not obvious the reset of BASER<n>
would mandate that. Eventually in my kernel series I also voided the
list on BASER<n>.valid toggling from 1 to 0.

Spec also says:
If a write to GITS.CTLR changes the Enabled field from 1 to 0, the
Interrupt Translation Space must ensure
that both:
=E2=80=A2 Any caches containing mapping data are made consistent with ext=
ernal
memory.
=E2=80=A2 GITS_CTLR.Quiescent =3D=3D 0 until all caches are consistent wi=
th external
memory.

I aknowledge I don't really get at which moment we are supposed to void
the caches.

Nevertheless, personnally I think we can achieve the same reset
functionality with individual register writes.

Thanks

Eric






>=20
> thanks
> -- PMM
>=20
