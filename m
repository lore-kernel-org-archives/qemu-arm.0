Received: by 10.25.208.211 with SMTP id h202csp2762062lfg;
        Thu, 3 Mar 2016 07:40:43 -0800 (PST)
X-Received: by 10.140.37.6 with SMTP id q6mr3824592qgq.98.1457019643311;
        Thu, 03 Mar 2016 07:40:43 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b107si41468823qge.55.2016.03.03.07.40.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Mar 2016 07:40:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35843 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1abVMo-0004BX-PQ
	for alex.bennee@linaro.org; Thu, 03 Mar 2016 10:40:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56206)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1abVMh-0004AR-7R
	for qemu-arm@nongnu.org; Thu, 03 Mar 2016 10:40:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1abVMc-0002Pn-Ts
	for qemu-arm@nongnu.org; Thu, 03 Mar 2016 10:40:34 -0500
Received: from mx1.redhat.com ([209.132.183.28]:60843)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1abVMc-0002PU-OA; Thu, 03 Mar 2016 10:40:30 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id 5C1B864D29;
	Thu,  3 Mar 2016 15:40:29 +0000 (UTC)
Received: from [10.36.112.61] (ovpn-112-61.ams2.redhat.com [10.36.112.61])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u23FeNlk005415
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 3 Mar 2016 10:40:26 -0500
To: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>
References: <cover.1456901522.git.crosthwaite.peter@gmail.com>
	<CAFEAcA_YGFn41uV6pykizk=28513yv1+=speOxK6u4H1PmbiEg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <56D85AE7.4060806@redhat.com>
Date: Thu, 3 Mar 2016 16:40:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_YGFn41uV6pykizk=28513yv1+=speOxK6u4H1PmbiEg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Thu, 03 Mar 2016 15:40:29 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Cc: Stefan Weil <sw@weilnetz.de>, QEMU Developers <qemu-devel@nongnu.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	sridhar kulkarni <sridhar_kulk@yahoo.com>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Piotr_Kr=c3=b3l?= <piotr.krol@3mdeb.com>
Subject: Re: [Qemu-arm] [PATCH v2 00/18] ARM big-endian and setend support
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
X-TUID: q0fSAsML5y8Z



On 03/03/2016 16:25, Peter Maydell wrote:
> On 2 March 2016 at 06:56, Peter Crosthwaite <crosthwaitepeter@gmail.com> wrote:
>> Hi All,
>>
>> This patch series adds system-mode big-endian support for ARM. It also
>> implements the setend instruction, and loading of BE binaries even in
>> LE emulation mode.
>>
>> Based on Paolo's original work.
>>
>> I have tested all of LE, BE8 and BE32 in both linux-user mode (for
>> regressions) and system mode (BE8 and BE32 are new here).
>> My test application is here, the README gives some example command
>> lines you can run:
>>
>> https://github.com/pcrost/arm-be-test
>>
>> Regards,
>> Peter
>>
>> Changed since v1:
>> Addressed PMM review
>> Added doc comments to new/changed loader.h APIs
> 
> Thanks for the respin. For the remaining patches:
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> Since there were only a couple of comment typos I'm planning to
> apply this series to target-arm.next (and send a pullreq tomorrow
> I expect).

Yay, thanks Peter (both of you)!

Paolo
