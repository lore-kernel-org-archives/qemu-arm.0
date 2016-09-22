Received: by 10.80.163.71 with SMTP id 65csp71320edn;
        Thu, 22 Sep 2016 09:31:51 -0700 (PDT)
X-Received: by 10.200.36.200 with SMTP id t8mr3148078qtt.0.1474561911500;
        Thu, 22 Sep 2016 09:31:51 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id o129si1668565qka.188.2016.09.22.09.31.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Sep 2016 09:31:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52716 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bn6uc-0007Po-RS
	for alex.bennee@linaro.org; Thu, 22 Sep 2016 12:31:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35144)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1bn6JD-0006ul-Sw
	for qemu-devel@nongnu.org; Thu, 22 Sep 2016 11:53:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1bn6JD-00062l-0R
	for qemu-devel@nongnu.org; Thu, 22 Sep 2016 11:53:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47494)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>)
	id 1bn6JA-00060b-OT; Thu, 22 Sep 2016 11:53:08 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 571844DAF7;
	Thu, 22 Sep 2016 15:53:07 +0000 (UTC)
Received: from localhost.localdomain (vpn1-7-69.ams2.redhat.com [10.36.7.69])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u8MFr3aA030148
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 22 Sep 2016 11:53:05 -0400
To: Peter Maydell <peter.maydell@linaro.org>
References: <1473442237-3746-1-git-send-email-eric.auger@redhat.com>
	<CAFEAcA9qgGw99w9HtZWLyKUwECQnK4b2U8kckmjAtA9+UF7e0A@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <fdf21190-62cd-dd76-e31e-d32010c9418b@redhat.com>
Date: Thu, 22 Sep 2016 17:53:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9qgGw99w9HtZWLyKUwECQnK4b2U8kckmjAtA9+UF7e0A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Thu, 22 Sep 2016 15:53:07 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v6 0/8] vITS support
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jones <drjones@redhat.com>, Tomasz Nowicki <tn@semihalf.com>,
	Shlomo Pongratz <shlomopongratz@gmail.com>,
	Pavel Fedin <p.fedin@samsung.com>, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Shannon Zhao <shannon.zhao@linaro.org>,
	Diana Craciun <diana.craciun@freescale.com>,
	Christoffer Dall <christoffer.dall@linaro.org>, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sbTtdY4FFRBg

Hi Peter,

On 22/09/2016 16:08, Peter Maydell wrote:
> On 9 September 2016 at 18:30, Eric Auger <eric.auger@redhat.com> wrote:
>> This series introduces support for in-kernel GICv3 ITS emulation.
>>
>> On dt guest the functionality is complete and was tested on Cavium ThunderX
>> with virtio-net-pci and vhost-net.
>>
>> On ACPI guest the series was tested with virtio-net-pci only. For vhost-net,
>> using MSIX we currently miss the ACPI IORT table generation linking the
>> PCIe host controller with the ITS. The work is ongoing and will be submitted
>> separately. Anyway the kernel ACPI IORT ITS node support is not upstreamed
>> yet.
>>
>> The first patch is not really related to virtual ITS but advertises the KVM
>> GSI routing support which goes along with MSI injection.
> 
> Patches 7 and 8 are missing your signed-off-by line...

Sure I will add them on top of Shannon's ones. Most credit must be given
to him though.

Thanks

Eric
> 
> thanks
> -- PMM
> 
