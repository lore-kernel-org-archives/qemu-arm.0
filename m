Received: by 10.182.158.201 with SMTP id ww9csp727553obb;
        Tue, 17 Nov 2015 05:38:12 -0800 (PST)
X-Received: by 10.31.49.131 with SMTP id x125mr3711693vkx.104.1447767492888;
        Tue, 17 Nov 2015 05:38:12 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 145si2707253vkc.161.2015.11.17.05.38.12
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Tue, 17 Nov 2015 05:38:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58476 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZygSa-0007ds-Dn
	for alex.bennee@linaro.org; Tue, 17 Nov 2015 08:38:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55949)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1ZygSX-0007dM-9S
	for qemu-arm@nongnu.org; Tue, 17 Nov 2015 08:38:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1ZygST-0002kg-1h
	for qemu-arm@nongnu.org; Tue, 17 Nov 2015 08:38:09 -0500
Received: from mail-lf0-x22d.google.com ([2a00:1450:4010:c07::22d]:35357)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>)
	id 1ZygSS-0002kX-QK; Tue, 17 Nov 2015 08:38:04 -0500
Received: by lfdo63 with SMTP id o63so5521250lfd.2;
	Tue, 17 Nov 2015 05:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=M1TxARDB5XJylrCk1/kp6nc31mkCHar6ryoRVF4vHdY=;
	b=hn2J7wVxDQc59fh1ShAx9pz32jzEMepMX8Bor3HB4PEGwSfJRynjOFLxZA03SxkqEw
	5X4tnS2GDpAY0YNHdyfK/IuI6EFmLHnuQ3hZ3XILwjbIRcW3ryFu3QIDcsVbErvq6vB3
	u1fCJQGKLRmxkcw+OFu0DwM+2opV3jRKsEjzCYwH9hzvJcQhbjkkueHyxSHHvSDPWp0i
	rEqelUFIfGL1b98u6jAzHA18mp4+H8IePxrlUW8IztiLqPrUtwmhsXJr7A7DDwg7vlR0
	+UbExaB1e9eN/21ChmuPm6i3PFlNa1OVIPCt1D97wAoxYqaDBVJoUe5exFA4soquGcRY
	chGw==
X-Received: by 10.25.134.134 with SMTP id i128mr20268116lfd.103.1447767484098; 
	Tue, 17 Nov 2015 05:38:04 -0800 (PST)
Received: from [10.30.10.50] ([213.243.91.10])
	by smtp.googlemail.com with ESMTPSA id
	88sm6458193lfq.3.2015.11.17.05.38.03
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Nov 2015 05:38:03 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1447702479-6997-1-git-send-email-serge.fdrv@gmail.com>
	<1447702479-6997-2-git-send-email-serge.fdrv@gmail.com>
	<564B0874.3050902@gmail.com>
	<CAFEAcA-CLEaRWimu2R-k9kbRvXUkfqMp4si4dai1B-DSrELWuQ@mail.gmail.com>
From: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <564B2DBA.1030003@gmail.com>
Date: Tue, 17 Nov 2015 16:38:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-CLEaRWimu2R-k9kbRvXUkfqMp4si4dai1B-DSrELWuQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4010:c07::22d
Cc: qemu-arm@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH 1/2] target-arm: Update condexec before CP
 access check in AA32 translation
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
X-TUID: i4CIhiVMVWHM

On 17.11.2015 16:31, Peter Maydell wrote:
> On 17 November 2015 at 10:59, Sergey Fedorov <serge.fdrv@gmail.com> wrote:
>> On 16.11.2015 22:34, Sergey Fedorov wrote:
>>> Coprocessor access instructions are allowed inside IT block.
>>> gen_helper_access_check_cp_reg() can raise an exceptions thus condexec
>>> bits should be updated before.
>>>
>>> Signed-off-by: Sergey Fedorov <serge.fdrv@gmail.com>
>>> ---
>>>  target-arm/translate.c | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/target-arm/translate.c b/target-arm/translate.c
>>> index 4351854..f1f8129 100644
>>> --- a/target-arm/translate.c
>>> +++ b/target-arm/translate.c
>>> @@ -7210,6 +7210,7 @@ static int disas_coproc_insn(DisasContext *s, uint32_t insn)
>>>                  break;
>>>              }
>>>
>>> +            gen_set_condexec(dc);
>> Ah, there must be gen_set_condexec(s).
> Yep. Are you going to resend?

I got sort of ahead of myself with the patch. Yes, I will resend it now.

Best,
Sergey
