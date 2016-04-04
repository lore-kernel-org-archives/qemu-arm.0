Received: by 10.25.208.211 with SMTP id h202csp3984lfg;
        Mon, 4 Apr 2016 11:31:27 -0700 (PDT)
X-Received: by 10.140.22.139 with SMTP id 11mr13515460qgn.34.1459794687470;
        Mon, 04 Apr 2016 11:31:27 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e66si23168897qgf.125.2016.04.04.11.31.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Apr 2016 11:31:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60478 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1an9Hb-0006r0-12
	for alex.bennee@linaro.org; Mon, 04 Apr 2016 14:31:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50959)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1an7YC-0000y8-O8
	for qemu-arm@nongnu.org; Mon, 04 Apr 2016 12:40:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1an7YB-0001uJ-NE
	for qemu-arm@nongnu.org; Mon, 04 Apr 2016 12:40:28 -0400
Received: from mail-ob0-x22e.google.com ([2607:f8b0:4003:c01::22e]:35650)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>)
	id 1an7YB-0001uF-HB; Mon, 04 Apr 2016 12:40:27 -0400
Received: by mail-ob0-x22e.google.com with SMTP id fp4so100752891obb.2;
	Mon, 04 Apr 2016 09:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=qymnaJBNrP9GIoAIMT9tJ89N7vkrR9JVqwzBUENmqJw=;
	b=Sd4EbgV1UmtgEkB2EQ4hpJzCv6vYdKIWsEWBv++xOCBgfHxOo0SRUNCzMLOyCpUVOC
	VXenWNDenRy81MWT6iOaWi1GmjCj2B+8q6KfA548xQppvypUu1A5TmgFrVXQs/j3bBRY
	ViBPGu1SiVF+nxbdBXcuLbVGKLTbsxzbbt9jiDrFFW7QanhT0glK+nEIuarFvgfwwH/8
	JhkFighdaJ+Dyg3crkYK2qYXLuIBdjCmh42YU/8Ok7jQJCxNDE/CnyTPMQISFDK0A+5P
	iABSjphQoir8gg2zWgvMCjKaNr2WJLCey1rltI52YiNeOGkcR9TML3neYykARVZzF4fX
	bPqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=qymnaJBNrP9GIoAIMT9tJ89N7vkrR9JVqwzBUENmqJw=;
	b=Y6xlXrbffJ0zKV+V1XESqjvtHTN0+eHZcH9GHVu0NtTaT+EtIu5pf1B7bDqdBSCZiu
	lFU/PeaFE+EMhOnFqyMSWN2fn9yX3k2teByUaCuM3xvNcxiAuFuGdC+c1ju+j6KsmL4n
	G1kZ62Uwo2K1vd550dFvHhkkpF67aNlDks2JFMjJDFL/ta0RVPU+fToq6hi5FVfrKiqH
	J4x8wQCm8UPS1HkcBQyFdwIk3MKxrbZodVRShrEVLMei2bg7+U7cxAyezaSh3xnhqRGS
	yePc99aYHyDeMr9E76+ksDqvQBa1bqvJzUGfPPdivs7BsWTX2rH5bv7QNocVmCqXlrWR
	ENow==
X-Gm-Message-State: AD7BkJLanFcxIuWyEn6SQRxnWqSiDGP9T+uFZP5nbml4iPF8o2Z4rS4hIp7Tok9t05Zq8c4kovpyQ7uni4R3Yw==
MIME-Version: 1.0
X-Received: by 10.182.60.198 with SMTP id j6mr3243770obr.12.1459788026787;
	Mon, 04 Apr 2016 09:40:26 -0700 (PDT)
Received: by 10.157.29.134 with HTTP; Mon, 4 Apr 2016 09:40:26 -0700 (PDT)
In-Reply-To: <CAFEAcA_RDSe=exvgo-yF57bQDk2=sx3kLnvKiKkXHPJHCTGE+w@mail.gmail.com>
References: <1459777195-7907-1-git-send-email-vijayak@caviumnetworks.com>
	<1459777195-7907-2-git-send-email-vijayak@caviumnetworks.com>
	<CAFEAcA_RDSe=exvgo-yF57bQDk2=sx3kLnvKiKkXHPJHCTGE+w@mail.gmail.com>
Date: Mon, 4 Apr 2016 22:10:26 +0530
Message-ID: <CALicx6u3yCdFSUuLyQgt7yP08RSwXP=k0w3WKmeTRfn7jS6vRA@mail.gmail.com>
From: Vijay Kilari <vijay.kilari@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c01::22e
X-Mailman-Approved-At: Mon, 04 Apr 2016 14:31:25 -0400
Cc: Vijaya Kumar K <vijayak@caviumnetworks.com>,
	Prasun Kapoor <Prasun.Kapoor@caviumnetworks.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Vijay <vijayak@cavium.com>
Subject: Re: [Qemu-arm] [RFC PATCH v1 1/2] target-arm: Update page size for
	aarch64
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
X-TUID: 56mLjlpR1u4h

On Mon, Apr 4, 2016 at 7:14 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 4 April 2016 at 14:39,  <vijayak@caviumnetworks.com> wrote:
>> From: Vijay <vijayak@cavium.com>
>>
>> Set target page size to minimum 4K for aarch64.
>> This helps to reduce live migration downtime significantly.
>>
>> Signed-off-by: Vijaya Kumar K <vijayak@caviumnetworks.com>
>> ---
>>  target-arm/cpu.h |    7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/target-arm/cpu.h b/target-arm/cpu.h
>> index 066ff67..2e4b48f 100644
>> --- a/target-arm/cpu.h
>> +++ b/target-arm/cpu.h
>> @@ -1562,11 +1562,18 @@ bool write_cpustate_to_list(ARMCPU *cpu);
>>  #if defined(CONFIG_USER_ONLY)
>>  #define TARGET_PAGE_BITS 12
>>  #else
>> +/*
>> + * Aarch64 support minimum 4K page size
>> + */
>> +#if defined(TARGET_AARCH64)
>> +#define TARGET_PAGE_BITS 12
>
> I agree that this would definitely improve performance (both for
> migration and for emulated guests), but I'm afraid this breaks
> running 32-bit ARMv5 and ARMv7M guests with this QEMU binary,
> so we can't do this. If we want to allow the minimum page size to
> be bigger than 1K for AArch64 CPUs then we need to make it a
> runtime settable thing rather than compile-time (which is not
> an entirely trivial thing).

Do you mean to say that based on -cpu type qemu option
choose the page size at runtime?

>
>> +#else
>>  /* The ARM MMU allows 1k pages.  */
>>  /* ??? Linux doesn't actually use these, and they're deprecated in recent
>>     architecture revisions.  Maybe a configure option to disable them.  */
>>  #define TARGET_PAGE_BITS 10
>>  #endif
>> +#endif
>>
>>  #if defined(TARGET_AARCH64)
>>  #  define TARGET_PHYS_ADDR_SPACE_BITS 48
>
> thanks
> -- PMM
