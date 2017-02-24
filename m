Received: by 10.25.0.147 with SMTP id 141csp800721lfa;
        Fri, 24 Feb 2017 10:06:01 -0800 (PST)
X-Received: by 10.200.44.236 with SMTP id 41mr3788384qtx.267.1487959561830;
        Fri, 24 Feb 2017 10:06:01 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q15si6142526qtb.214.2017.02.24.10.06.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 24 Feb 2017 10:06:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39030 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1chKFj-0001Oy-5G
	for alex.bennee@linaro.org; Fri, 24 Feb 2017 13:05:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39461)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1chK4H-0007Ft-SG
	for qemu-devel@nongnu.org; Fri, 24 Feb 2017 12:54:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1chK4H-0007Ss-2x
	for qemu-devel@nongnu.org; Fri, 24 Feb 2017 12:54:09 -0500
Received: from mx1.redhat.com ([209.132.183.28]:40344)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1chK4C-0007Ro-DN; Fri, 24 Feb 2017 12:54:04 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 61EA27FB60;
	Fri, 24 Feb 2017 17:54:04 +0000 (UTC)
Received: from localhost.localdomain (ovpn-118-6.ams2.redhat.com [10.36.118.6]
	(may be forged))
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v1OHs1Wl011193
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 24 Feb 2017 12:54:02 -0500
To: Peter Maydell <peter.maydell@linaro.org>,
	Vijay Kilari <vijay.kilari@gmail.com>
References: <1487850673-26455-1-git-send-email-vijay.kilari@gmail.com>
	<1487850673-26455-2-git-send-email-vijay.kilari@gmail.com>
	<CAFEAcA_rYx2+zGB16O4w=BjOP9e-jn5kSGT8rCosHsgubo-w_Q@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <c78577ef-f660-ccda-f15e-60186bdfa6e5@redhat.com>
Date: Fri, 24 Feb 2017 18:53:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_rYx2+zGB16O4w=BjOP9e-jn5kSGT8rCosHsgubo-w_Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Fri, 24 Feb 2017 17:54:04 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v9 1/5] kernel: Add definitions for GICv3
 attributes
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
Cc: Marc Zyngier <marc.zyngier@arm.com>, Pavel Fedin <p.fedin@samsung.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Vijaya Kumar K <Vijaya.Kumar@cavium.com>, qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZG06uirU+akR

Hi Peter,

On 23/02/2017 19:35, Peter Maydell wrote:
> On 23 February 2017 at 11:51,  <vijay.kilari@gmail.com> wrote:
>> From: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
>>
>> This temporary patch adds kernel API definitions.
>> Use proper header update procedure after these features
>> are released.
> 
> I can't put this patchset into QEMU with this temporary patch;
> you need to do a proper kernel headers update with
> the update-linux-headers.sh script.

With [Qemu-devel] [PATCH 0/2] update Linux headers to 4.11,
Paolo fixed the update-linux-headers.sh

(scripts/Makefile.headersinst:62: *** Missing generated UAPI file
./arch/arm/include/generated/uapi/asm/unistd-common.h.

and also updated the ARM headers so this patch is not needed anymore I
think. This is not pulled yet though.

I tested it on Cavium ThunderX without this first patch.

Tested-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric



> 
> thanks
> -- PMM
> 

