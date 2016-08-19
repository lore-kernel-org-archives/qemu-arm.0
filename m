Received: by 10.25.21.156 with SMTP id 28csp282291lfv;
        Fri, 19 Aug 2016 04:43:58 -0700 (PDT)
X-Received: by 10.55.212.220 with SMTP id s89mr8429329qks.203.1471607038573;
        Fri, 19 Aug 2016 04:43:58 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d14si2418395qtb.111.2016.08.19.04.43.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Aug 2016 04:43:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56733 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1baiDO-0003Jt-1a
	for alex.bennee@linaro.org; Fri, 19 Aug 2016 07:43:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37041)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1baiDK-0003Jo-VK
	for qemu-arm@nongnu.org; Fri, 19 Aug 2016 07:43:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1baiDI-0008Cf-98
	for qemu-arm@nongnu.org; Fri, 19 Aug 2016 07:43:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49522)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>)
	id 1baiDI-0008CZ-1D; Fri, 19 Aug 2016 07:43:52 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B94AA4E4C5;
	Fri, 19 Aug 2016 11:43:49 +0000 (UTC)
Received: from localhost.localdomain (vpn1-5-218.ams2.redhat.com [10.36.5.218])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u7JBhkI1007330
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 19 Aug 2016 07:43:47 -0400
To: Alexander Graf <agraf@suse.de>
References: <1471189341-21103-1-git-send-email-shankerd@codeaurora.org>
	<f928f18f-22c5-4d8f-33c9-2701a66ab2bd@redhat.com>
	<68663F72-90AF-4F78-AD29-E182E3670D03@suse.de>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <0e6787de-e1f8-5c58-5e4e-9a93a98893f1@redhat.com>
Date: Fri, 19 Aug 2016 13:43:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <68663F72-90AF-4F78-AD29-E182E3670D03@suse.de>
Content-Type: text/plain; charset=windows-1252
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Fri, 19 Aug 2016 11:43:50 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2] hw/vfio/platform: Add
 Qualcomm Technologies, Inc HIDMA device support
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Philip Elcan <pelcan@codeaurora.org>,
	Vikram Sethi <vikrams@codeaurora.org>, Eric Auger <eric.auger@linaro.org>,
	qemu-devel <qemu-devel@nongnu.org>, Kaya Sinan <okaya@codeaurora.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Shanker Donthineni <shankerd@codeaurora.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: naZbGBh2N43V

Hi Alex,

On 19/08/2016 00:35, Alexander Graf wrote:
>=20
>> On 18 Aug 2016, at 05:37, Auger Eric <eric.auger@redhat.com> wrote:
>>
>> Hi Shanker,
>>
>> Adding Alex in CC for (*)
>>
>> On 14/08/2016 17:42, Shanker Donthineni wrote:
>>> This patch introduces the Qualcomm Technologies, Inc HIDMA device and
>>> allows passthrough the host HIDMA device to a guest machine using the
>>> vfio-platform framework.
>>>
>>> A platform device tree node is created for the guest machine which
>>> contains the compat string 'qcom,hidma-1.0', mmio regions, active hig=
h
>>> SPIs, and an optional property dma-coherent.
>>>
>>> Signed-off-by: Vikram Sethi <vikrams@codeaurora.org>
>>> Signed-off-by: Shanker Donthineni <shankerd@codeaurora.org>
>>> ---
>>> Changes sicnce v1:
>>>  combined patches [v1 1/2] and [v1 2/2].
>> Some general comments:
>> - I preferred the previous series organization where we had the creati=
on
>> of the VFIO device first and its sysbus-fdt dynamic instantiation in a
>> separate patch.
>>
>> Peter requested sysbus-fdt stops growing and advised to split the fine
>> into generic helpers and specific dt creation functions in separate
>> files. This sounds the right moment to do it with looming new VFIO dev=
ices.
>>
>> (*) Also I am now reconsidering the relevance of creating specific VFI=
O
>> devices per compat string. At the begining of VFIO QEMU integration
>> history we made that choice, advised by Alex (Graf), considering the
>> QEMU VFIO device could not be generic. With a little more experience n=
ow
>> we could see the specialization is currently done in the dt creation
>> function (sysbus-fdt) and in the kernel reset module. So I would now
>> advocate using a non abstract base VFIO device that could be
>> instantiated passing its compat string as property. Creating
>> hw/vfio/qcom-hidma.c and include/hw/vfio/vfio-qcom-hidma.h then would
>> become useless. Alex, what is your feeling now?
>=20
> Back when we set up the rule we were concerned with a few things that a=
 generic sysbus devices can=92t implement properly:
>=20
>   * generic reset
>   * power control
>   * clock control
>=20
> I guess the first two are mostly a matter of the in-kernel driver, not =
the user space one. Clock control hopefully isn=92t much of a thing with =
real hardware ;).
>=20
> So yes, if you can make a generic driver work, I=92m not opposed.

Thank you for the confirmation!

Best Regards

Eric
>=20
>=20
> Alex
>=20
