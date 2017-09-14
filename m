Received: by 10.223.172.38 with SMTP id v35csp805316wrc;
        Thu, 14 Sep 2017 05:31:16 -0700 (PDT)
X-Received: by 10.237.34.118 with SMTP id o51mr24336352qtc.36.1505392276750;
        Thu, 14 Sep 2017 05:31:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505392276; cv=none;
        d=google.com; s=arc-20160816;
        b=l86N7ockkRFFzjY6wxXId8R4EVuS88PPAHzq2VEehG7CNKs3e2/45c8BhGhwKG8nOZ
         /6qNM1fwSJRHwwv2POaFWrTcvY/71S0TgykHFYWzWQBVFm1BnTfOiCLg4hezXdH1PdLv
         GEXvj1eqOOWe5VFqOR/Po1w5N2HDwXU+YP7CElN+Z1GWAJk814kqy7sk2RLXq/sXaTRB
         6wtKKyKnYq9ufr1qYPOtsHA3mumf5VyBEHjQVYcnK/3gWEBBZeVhDv/W3PbZCb9mCqrO
         gkUOFvl/CetESXy0M9C5e8P/z4Jvz2iSIxSdbP47WetJSIo+H4BjgnsfVHvDzzrONY/4
         RTWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=QLMDlujBK14fYTXGe3MeagIzmGN+MV2jKtnvI6Qi2gU=;
        b=qCQT1awlmvztfJx0qZX8qcceCQBl3kuHCbWlVWyWeVFvlvFIIp1O2EinbYM8NbF6da
         WE9Eqb/dt31dWD1eaX3I1w+N32B2DCbFtKceBaVzERja/woLQYsDRMhqnyoMScnSioRz
         YxaDAsic7Jre4T8A8SDvcDfpiBRuzyRP5xADgi/wK0Sm3Y+nqNkKK6uc3tQFxlyZ9g2k
         teNuQlkZ0t0bJTxb2ZgVpDmZv1lxBGk6eDlBX2tmvwJ32+Ox2m/AaZAzH89L36a0iNfT
         CK4zs/Ik5HSFY6qg7EZquB798oIV7xhLDebXtG+AycI/a+MsIK6QKa85HOd4yNuTATQF
         tYHA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OZq2fbYO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r50si17861134qtc.76.2017.09.14.05.31.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Sep 2017 05:31:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OZq2fbYO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47586 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dsTIY-0004qK-GV
	for alex.bennee@linaro.org; Thu, 14 Sep 2017 08:31:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57046)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dsTIK-0004pR-Sn
	for qemu-arm@nongnu.org; Thu, 14 Sep 2017 08:31:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dsTIJ-0003Pc-Sq
	for qemu-arm@nongnu.org; Thu, 14 Sep 2017 08:31:00 -0400
Received: from mail-wm0-x22f.google.com ([2a00:1450:400c:c09::22f]:46621)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dsTIJ-0003OW-Lc
	for qemu-arm@nongnu.org; Thu, 14 Sep 2017 08:30:59 -0400
Received: by mail-wm0-x22f.google.com with SMTP id i189so582424wmf.1
	for <qemu-arm@nongnu.org>; Thu, 14 Sep 2017 05:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=QLMDlujBK14fYTXGe3MeagIzmGN+MV2jKtnvI6Qi2gU=;
	b=OZq2fbYOxgknF4ohEBvD8p30Rz9trUZrfbORkv0T5JzvRHT6uYNB5yel0AqqVrezz8
	U1WQyxnvN52xMkXjoIzBeJQdov50nWvRcR/P9Mkw1Kd/cRzy/dlwhrREzVCIt/dywjDa
	+gFP75fhjVmT2CgxavunAYn7Sr+Fcis56IqYo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=QLMDlujBK14fYTXGe3MeagIzmGN+MV2jKtnvI6Qi2gU=;
	b=hp7f56f43gjsgH53CeCRCYAgxMWAYfIk/58eSZ6XYKmzGcRunE6ZwC5KAIBlg/z0TC
	7YzNJOFGbhy+CClWYtcKgF3tfm/7h5wGQozpqVVGV+DZ7ziGpURPsT6miOr5Mhgc8PoB
	7fAYEAfHKBQQgnu2/qJGLfz5DQY2VeTNU+KyhbhvLqOPMSwR1RRxK7X1rgRU2m8sOwEc
	BWGBwY0ANpCjq8YSuhZetJxj3ORgdvjOEQwq4yfOnW9kO2lRuAo9kB4cH+csKGiWUqB5
	DM3cBNlmdKnjRZpIwBqyPrDBBhU5yHhkwQBtdot6hXFri+yC2q/HIbyi4rlUdThDlxNU
	Tzbg==
X-Gm-Message-State: AHPjjUjEIIv+MlExNTL529Ro9ZaF8ISNF4I/Ja4RLQTl1b5kwv4fZhNu
	TtoxC+hOO3Z8Eu2UlnMPc6LWYau06Qvv5RJHpuwAGg==
X-Google-Smtp-Source: AOwi7QAVpVB2lcOuxfIXe923rOsvbPKQQpoJ3VMe5oDWbC52ry6vCV3NjYeLdwQKLnM/cDQGhfOjQ35jjE5HAzFV7Hs=
X-Received: by 10.28.102.213 with SMTP id a204mr1683073wmc.151.1505392258582; 
	Thu, 14 Sep 2017 05:30:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.139.215 with HTTP; Thu, 14 Sep 2017 05:30:37 -0700 (PDT)
In-Reply-To: <CAKmqyKNrbdGJ2n=HHeUfJOq-EUmwbY_330DGL+BD++BtrSwnxA@mail.gmail.com>
References: <cover.1504222314.git.alistair.francis@xilinx.com>
	<20170907213525.GJ5763@toto>
	<CAKmqyKNrbdGJ2n=HHeUfJOq-EUmwbY_330DGL+BD++BtrSwnxA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Sep 2017 13:30:37 +0100
Message-ID: <CAFEAcA_SG5sPt9xnFJPSbM0L_Zzg0P0XvPA08ERXQoDq59dsKQ@mail.gmail.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22f
Subject: Re: [Qemu-arm] [PATCH Resend v2 0/5] Expose the secure and virt
 properties to the
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fv1Ff8tuB/NG

On 7 September 2017 at 22:44, Alistair Francis
<alistair.francis@xilinx.com> wrote:
> On Thu, Sep 7, 2017 at 2:35 PM, Edgar E. Iglesias
> <edgar.iglesias@xilinx.com> wrote:
>> On Thu, Sep 07, 2017 at 08:56:55AM -0700, Alistair Francis wrote:
>>>
>>> The EL2 and EL3 work is working well now and interanlly we now have
>>> tests that expect to start in EL3 and transition through EL2 to EL1. To
>>> make this easy to run let's expose the secure property to the machine
>>> and also add a virt property that can enable EL2.
>>>
>>> This series also does some machine/name tidying up and makes the first
>>> move to deprecating the EP108 machine, which was just an early access
>>> development board.
>>>
>>> V2:
>>>  - Add a virt option for setting EL2
>>
>>
>> Thanks Alistair!
>> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
>
> Thanks Edgar.
>
> @Peter I updated the patches on the git branch I pasted earlier to
> include Edgar's review.

Thanks. I've applied the patches to target-arm.next.

-- PMM
