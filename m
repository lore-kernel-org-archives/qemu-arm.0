Received: by 10.25.0.147 with SMTP id 141csp368292lfa;
        Thu, 2 Mar 2017 08:49:07 -0800 (PST)
X-Received: by 10.55.212.199 with SMTP id s68mr17826221qks.245.1488473346914;
        Thu, 02 Mar 2017 08:49:06 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h190si7328069qkf.96.2017.03.02.08.49.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 02 Mar 2017 08:49:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53301 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cjTua-0006hq-9e
	for alex.bennee@linaro.org; Thu, 02 Mar 2017 11:49:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60979)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1cjTuS-0006h8-PQ
	for qemu-arm@nongnu.org; Thu, 02 Mar 2017 11:48:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1cjTuP-0003w6-Go
	for qemu-arm@nongnu.org; Thu, 02 Mar 2017 11:48:56 -0500
Received: from mail.kernel.org ([198.145.29.136]:53148)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <krzk@kernel.org>)
	id 1cjTuP-0003vq-Bh; Thu, 02 Mar 2017 11:48:53 -0500
Received: from mail.kernel.org (localhost [127.0.0.1])
	by mail.kernel.org (Postfix) with ESMTP id F024220383;
	Thu,  2 Mar 2017 16:48:50 +0000 (UTC)
Received: from mail-it0-f46.google.com (mail-it0-f46.google.com
	[209.85.214.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 35BA420379;
	Thu,  2 Mar 2017 16:48:49 +0000 (UTC)
Received: by mail-it0-f46.google.com with SMTP id 203so55263766ith.0;
	Thu, 02 Mar 2017 08:48:49 -0800 (PST)
X-Gm-Message-State: AMke39nwmAg4ElN3pL/Lv5rBkkv/HIDnHNzmjwdbXs27DdpBXkX8KBNgeMF4p/qPHAbELQ5s/w2F02h0IlvOoQ==
X-Received: by 10.36.211.215 with SMTP id n206mr11047446itg.111.1488473328699; 
	Thu, 02 Mar 2017 08:48:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.59.133 with HTTP; Thu, 2 Mar 2017 08:48:48 -0800 (PST)
In-Reply-To: <CAFEAcA-mc6JXzq=s7C5tkH-rokibOPtpcuLee10k1b1PYqxz1A@mail.gmail.com>
References: <20170301182618.22395-1-krzk@kernel.org>
	<20170301182618.22395-5-krzk@kernel.org>
	<CAFEAcA-mc6JXzq=s7C5tkH-rokibOPtpcuLee10k1b1PYqxz1A@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Thu, 2 Mar 2017 18:48:48 +0200
X-Gmail-Original-Message-ID: <CAJKOXPf0zEF0UTTmLwuNem0w35mwy8fSgf+kcWbXxy1ociXwQA@mail.gmail.com>
Message-ID: <CAJKOXPf0zEF0UTTmLwuNem0w35mwy8fSgf+kcWbXxy1ociXwQA@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-Virus-Scanned: ClamAV using ClamSMTP
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 198.145.29.136
Subject: Re: [Qemu-arm] [PATCH 4/5] hw/timer/exynos4210_mct: Fix checkpatch
 style errors
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Shannon Zhao <shannon.zhao@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JoWjqozOxmP+

On Thu, Mar 2, 2017 at 6:44 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 1 March 2017 at 18:26, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>> Fix checkpatch errors:
>> 1. ERROR: spaces required around that '+' (ctx:VxV)
>> 2. ERROR: spaces required around that '&' (ctx:VxV)
>>
>> No functional changes.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>> ---
>>  hw/timer/exynos4210_mct.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/timer/exynos4210_mct.c b/hw/timer/exynos4210_mct.c
>> index 76634fb1b4fd..4dd3e441e2e6 100644
>> --- a/hw/timer/exynos4210_mct.c
>> +++ b/hw/timer/exynos4210_mct.c
>> @@ -936,7 +936,7 @@ static void exynos4210_mct_update_freq(Exynos4210MCTState *s)
>>  {
>>      uint32_t freq = s->freq;
>>      s->freq = 24000000 /
>> -            ((MCT_CFG_GET_PRESCALER(s->reg_mct_cfg)+1) *
>> +            ((MCT_CFG_GET_PRESCALER(s->reg_mct_cfg) + 1) *
>>                      MCT_CFG_GET_DIVIDER(s->reg_mct_cfg));
>>
>>      if (freq != s->freq) {
>> @@ -1160,7 +1160,7 @@ static void exynos4210_mct_write(void *opaque, hwaddr offset,
>>
>>          DPRINTF("comparator %d write 0x%llx val << %d\n", index, value, shift);
>>
>> -        if (offset&0x4) {
>> +        if (offset & 0x4) {
>>              s->g_timer.reg.wstat |= G_WSTAT_COMP_U(index);
>>          } else {
>>              s->g_timer.reg.wstat |= G_WSTAT_COMP_L(index);
>
> PS: you can shut the patchew robot up if you want by squashing this
> patch into patch 3, since one line is being changed in that patch
> anyway and an extra line in what's a "fix whitespace" patch
> anyway is no big deal. Or you can leave it the way you have
> it now; I don't mind.

Yes, I saw the warning. I could also sent them in reversed order. As
of squashing commits I think it is useful to have them separate
because change of indentation creates a difficult to read diff. Such
diff can sneak by other changes and it would not be spotted.

Best regards,
Krzysztof
