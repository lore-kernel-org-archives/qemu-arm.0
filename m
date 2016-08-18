Received: by 10.25.21.156 with SMTP id 28csp7104lfv;
        Thu, 18 Aug 2016 15:36:27 -0700 (PDT)
X-Received: by 10.55.195.14 with SMTP id a14mr5728211qkj.216.1471559786955;
        Thu, 18 Aug 2016 15:36:26 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id t18si851605qte.74.2016.08.18.15.36.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Aug 2016 15:36:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54574 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1baVuv-0005Wr-F2
	for alex.bennee@linaro.org; Thu, 18 Aug 2016 18:36:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54256)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1baVur-0005Vh-Pq
	for qemu-arm@nongnu.org; Thu, 18 Aug 2016 18:36:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1baVun-00013j-Lf
	for qemu-arm@nongnu.org; Thu, 18 Aug 2016 18:36:00 -0400
Received: from mx2.suse.de ([195.135.220.15]:51373)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>)
	id 1baVun-00013C-Ee; Thu, 18 Aug 2016 18:35:57 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay1.suse.de (charybdis-ext.suse.de [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 6309AAD2D;
	Thu, 18 Aug 2016 22:35:54 +0000 (UTC)
Content-Type: text/plain; charset=windows-1252
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
From: Alexander Graf <agraf@suse.de>
In-Reply-To: <f928f18f-22c5-4d8f-33c9-2701a66ab2bd@redhat.com>
Date: Thu, 18 Aug 2016 18:35:50 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <68663F72-90AF-4F78-AD29-E182E3670D03@suse.de>
References: <1471189341-21103-1-git-send-email-shankerd@codeaurora.org>
	<f928f18f-22c5-4d8f-33c9-2701a66ab2bd@redhat.com>
To: Auger Eric <eric.auger@redhat.com>
X-Mailer: Apple Mail (2.3124)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 195.135.220.15
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
X-TUID: LNxqp+KBou2N


> On 18 Aug 2016, at 05:37, Auger Eric <eric.auger@redhat.com> wrote:
>=20
> Hi Shanker,
>=20
> Adding Alex in CC for (*)
>=20
> On 14/08/2016 17:42, Shanker Donthineni wrote:
>> This patch introduces the Qualcomm Technologies, Inc HIDMA device and
>> allows passthrough the host HIDMA device to a guest machine using the
>> vfio-platform framework.
>>=20
>> A platform device tree node is created for the guest machine which
>> contains the compat string 'qcom,hidma-1.0', mmio regions, active =
high
>> SPIs, and an optional property dma-coherent.
>>=20
>> Signed-off-by: Vikram Sethi <vikrams@codeaurora.org>
>> Signed-off-by: Shanker Donthineni <shankerd@codeaurora.org>
>> ---
>> Changes sicnce v1:
>>  combined patches [v1 1/2] and [v1 2/2].
> Some general comments:
> - I preferred the previous series organization where we had the =
creation
> of the VFIO device first and its sysbus-fdt dynamic instantiation in a
> separate patch.
>=20
> Peter requested sysbus-fdt stops growing and advised to split the fine
> into generic helpers and specific dt creation functions in separate
> files. This sounds the right moment to do it with looming new VFIO =
devices.
>=20
> (*) Also I am now reconsidering the relevance of creating specific =
VFIO
> devices per compat string. At the begining of VFIO QEMU integration
> history we made that choice, advised by Alex (Graf), considering the
> QEMU VFIO device could not be generic. With a little more experience =
now
> we could see the specialization is currently done in the dt creation
> function (sysbus-fdt) and in the kernel reset module. So I would now
> advocate using a non abstract base VFIO device that could be
> instantiated passing its compat string as property. Creating
> hw/vfio/qcom-hidma.c and include/hw/vfio/vfio-qcom-hidma.h then would
> become useless. Alex, what is your feeling now?

Back when we set up the rule we were concerned with a few things that a =
generic sysbus devices can=92t implement properly:

  * generic reset
  * power control
  * clock control

I guess the first two are mostly a matter of the in-kernel driver, not =
the user space one. Clock control hopefully isn=92t much of a thing with =
real hardware ;).

So yes, if you can make a generic driver work, I=92m not opposed.


Alex

