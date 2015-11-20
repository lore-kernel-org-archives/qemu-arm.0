Received: by 10.182.158.201 with SMTP id ww9csp545383obb;
        Fri, 20 Nov 2015 07:26:20 -0800 (PST)
X-Received: by 10.13.224.195 with SMTP id j186mr9630011ywe.116.1448033180907;
        Fri, 20 Nov 2015 07:26:20 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f67si20354ywa.327.2015.11.20.07.26.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 20 Nov 2015 07:26:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:48095 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZznZs-000182-F8
	for alex.bennee@linaro.org; Fri, 20 Nov 2015 10:26:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43677)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>) id 1ZznZT-0000gy-0s
	for qemu-devel@nongnu.org; Fri, 20 Nov 2015 10:25:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>) id 1ZznZS-0000wo-7T
	for qemu-devel@nongnu.org; Fri, 20 Nov 2015 10:25:54 -0500
Received: from mail-yk0-x22a.google.com ([2607:f8b0:4002:c07::22a]:33678)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>)
	id 1ZznZR-0000wJ-Vp; Fri, 20 Nov 2015 10:25:54 -0500
Received: by ykdv3 with SMTP id v3so167347370ykd.0;
	Fri, 20 Nov 2015 07:25:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=0XKnTtoZtiUuwi5tlfehQuniHJtngcf4QUVXkhZroYQ=;
	b=wfsoVsj2vwzohE7da+kwTq9U3hBchKbD8+9VFKunexSl8T2SjUnW+aTnLmWWQb0X0Z
	QIw8MMUcF0C+YCQeuuptWprOQ3HCriZbrZ9CfT36D8AUcTZuVNRKyTwnmumd5508Wua9
	pRxbOhJHVVF+lecd9INl+T7LjPWIhWk3nFUPW/G8/svy4xvYsOlssOkOBgQWbUol1sUa
	4tXHqNWhN6LP3DBDK+KCAAG/9MLbT1YlHtBXuXHrp6UjBFHEy6QLoAuiZldgRDiUhLqt
	rUDOULuzbamtlypLDX1yau/KYLOTiE1QrSP0spiKil/rdet5kq/Dqf9JTmC2fKS/PAbl
	WTbg==
MIME-Version: 1.0
X-Received: by 10.129.42.4 with SMTP id q4mr14821996ywq.35.1448033153525; Fri,
	20 Nov 2015 07:25:53 -0800 (PST)
Received: by 10.31.219.3 with HTTP; Fri, 20 Nov 2015 07:25:53 -0800 (PST)
In-Reply-To: <CAFEAcA_tbHjcOFGNSetXhRMdH9P_tSyrAji83wXyG7th_0HRaQ@mail.gmail.com>
References: <1448029971-9875-1-git-send-email-peter.maydell@linaro.org>
	<CABoDooP4ya0uG_1C7Ux65CQP3JsQQO68fPJkdihXVbxGWHei5g@mail.gmail.com>
	<CAFEAcA_tbHjcOFGNSetXhRMdH9P_tSyrAji83wXyG7th_0HRaQ@mail.gmail.com>
Date: Fri, 20 Nov 2015 16:25:53 +0100
Message-ID: <CABoDooNoXc3e6x+V6F_f+s7ZUFMANo7AKJ+JJXcfPRcbAp4d0A@mail.gmail.com>
From: Laurent Desnogues <laurent.desnogues@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4002:c07::22a
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Subject: Re: [Qemu-devel] [PATCH for-2.5] target-arm: Don't mask out bits
 [47:40] in LPAE descriptors for v8
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: wHQIak9Isbau

On Fri, Nov 20, 2015 at 4:20 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 20 November 2015 at 15:18, Laurent Desnogues
> <laurent.desnogues@gmail.com> wrote:
>> Hello,
>>
>> On Fri, Nov 20, 2015 at 3:32 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
>>> In an LPAE format descriptor in ARMv8 the address field extends
>>> up to bit 47, not just bit 39. Correct the masking so we don't
>>> give incorrect results if the output address size is greater
>>> than 40 bits, as it can be for AArch64.
>>>
>>> (Note that we don't yet support the new-in-v8 Address Size fault which
>>> should be generated if any translation table entry or TTBR contains
>>> an address with non-zero bits above the most significant bit of the
>>> maximum output address size.)
>>>
>>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>
>>> +    /* The address field in the descriptor goes up to bit 39 for ARMv7
>>> +     * but up to bit 47 for ARMv8.
>>> +     */
>>> +    if (arm_feature(env, ARM_FEATURE_V8)) {
>>> +        descaddrmask = 0xfffffffff000ULL;
>>> +    } else {
>>> +        descaddrmask = 0xfffffff000ULL;
>>> +    }
>>
>> My understanding is that 48 bits are used if you are running AArch64
>> code, and 40 bits are used for 32-bit code even on an ARMv8 CPU, so
>> checking for ARM_FEATURE_V8 is perhaps not enough.
>
> For v8 32-bit code the usable address width is only 40 bits, but
> setting a bit in [47:40] causes an AddressSize fault on v8 (but not
> v7). So the mask should be 48 bits for v8 regardless of 32-vs-64,
> and when we support AddressSize faults we'll then check the upper
> bits of the masked-out address and raise a fault if needed.

That makes sense.

So here we go:

Reviewed-by: <laurent.desnogues@gmail.com>

Thanks,

Laurent
