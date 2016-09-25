Received: by 10.80.163.71 with SMTP id 65csp1191800edn;
        Sun, 25 Sep 2016 13:13:37 -0700 (PDT)
X-Received: by 10.200.56.55 with SMTP id q52mr18848659qtb.23.1474834417555;
        Sun, 25 Sep 2016 13:13:37 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o5si12345791qtb.140.2016.09.25.13.13.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 25 Sep 2016 13:13:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40263 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1boFnt-0003EM-48
	for alex.bennee@linaro.org; Sun, 25 Sep 2016 16:13:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34431)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jakub@jermar.eu>) id 1boFnp-0003EF-DU
	for qemu-arm@nongnu.org; Sun, 25 Sep 2016 16:13:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jakub@jermar.eu>) id 1boFnl-0005WI-2n
	for qemu-arm@nongnu.org; Sun, 25 Sep 2016 16:13:32 -0400
Received: from tmave.modry.cz ([82.208.58.129]:34486)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jakub@jermar.eu>)
	id 1boFnk-0005Ta-SH; Sun, 25 Sep 2016 16:13:29 -0400
Received: from 93-153-64-87.tmcz.cz ([93.153.64.87] helo=[10.0.0.143])
	by tmave.modry.cz with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.86_2)
	(envelope-from <jakub@jermar.eu>)
	id 1boFnP-0003RN-1p; Sun, 25 Sep 2016 22:13:24 +0200
To: Peter Maydell <peter.maydell@linaro.org>
References: <1474314852-29465-1-git-send-email-jakub@jermar.eu>
	<CAFEAcA-BhgnLYVGq+qND25yfrFArk=QMXg4ubie=kKncpovFSQ@mail.gmail.com>
From: =?UTF-8?B?SmFrdWIgSmVybcOhxZk=?= <jakub@jermar.eu>
Message-ID: <1e62855c-8f1a-ceaf-3677-0db3786361a8@jermar.eu>
Date: Sun, 25 Sep 2016 22:13:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-BhgnLYVGq+qND25yfrFArk=QMXg4ubie=kKncpovFSQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 82.208.58.129
Subject: Re: [Qemu-arm] [PATCH] hw/arm: Fix Integrator/CP memsz
 initialization
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ADEE0d2/qZFY

On 09/20/2016 07:34 PM, Peter Maydell wrote:
> On 19 September 2016 at 20:54, Jakub Jermář <jakub@jermar.eu> wrote:
>>
>> * Do not assume memsz is already initialized in integratorcm_init
>> * Calculate memsz directly from MachineState
>> * Get rid of the now unused memsz property
>>
>> Signed-off-by: Jakub Jermar <jakub@jermar.eu>
> 
> Thanks for this patch; this is definitely a bug but I think
> this is not the best way to fix it.
> 
> What we should do is add a realize function to the IntegratorCM
> device, and move the code that depends on the value of memsz
> from the init function to the realize function. That way the
> device doesn't have to know anything about the machine.

Thanks, I will be sending a reworked patch shortly.

Jakub
