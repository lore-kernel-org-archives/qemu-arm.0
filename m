Received: by 10.25.208.194 with SMTP id h185csp1613164lfg;
        Tue, 26 Apr 2016 09:36:01 -0700 (PDT)
X-Received: by 10.140.219.200 with SMTP id p191mr3366920qhb.90.1461688561338;
        Tue, 26 Apr 2016 09:36:01 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y70si14041731qka.77.2016.04.26.09.36.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Apr 2016 09:36:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38766 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1av5xw-0004OB-Po
	for alex.bennee@linaro.org; Tue, 26 Apr 2016 12:36:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41683)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thomas.hanson@linaro.org>) id 1av5xu-0004Jg-0O
	for qemu-arm@nongnu.org; Tue, 26 Apr 2016 12:35:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thomas.hanson@linaro.org>) id 1av5xp-0001zq-QM
	for qemu-arm@nongnu.org; Tue, 26 Apr 2016 12:35:57 -0400
Received: from mail-ig0-x236.google.com ([2607:f8b0:4001:c05::236]:35412)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thomas.hanson@linaro.org>) id 1av5xp-0001zf-MX
	for qemu-arm@nongnu.org; Tue, 26 Apr 2016 12:35:53 -0400
Received: by mail-ig0-x236.google.com with SMTP id bi2so102325884igb.0
	for <qemu-arm@nongnu.org>; Tue, 26 Apr 2016 09:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=NATzKiacNGdGGYK233beKtI4LoMgG3S42taExHIY7/o=;
	b=BlKi7Xl9MTYWN6DT07rIiVrXye7aJjqQ/ilnQTjNDrhqqRw7yqNlygzV71i6exFfJd
	UzAZBbr0khhI2CRQB166gIuXlgpDBez3Haf43Axhxm090WWlhszOxCistLhFqBKf2Ora
	Q9U80pjIzS9yp2AjvmREyCpyfpzcY6frTdqTc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=NATzKiacNGdGGYK233beKtI4LoMgG3S42taExHIY7/o=;
	b=lXnk0A4KnjDG1qTy0dBxYbRoAHWn0xg0KOUVinwwSfN0BCW1ktyj1883uzWxompgys
	tmMA2rrS+j6FPC/oIS+ABqKdjp8Rs8eHl7/d4T4SEAxq8+5wlVw41ypCIlmOzYX5BuRa
	aWBUHPh/H6W8Gz4HpprTqj04LSkr6YyfrL/4g6NBdPs5OhE/TDr/3ZIz6/8MgxjF6AZP
	05QW38k60d4QAmjNM0M0wEhJLajUspH6IK7TqKoobAzNyrj1TeagYey13LMs0BzWc11o
	KWM+sfXy+WH/4CpUrcDg455BSyp8m/OB/cirZadg53IMSJEDrgOk2mGLaaT6us75QTG7
	Zocw==
X-Gm-Message-State: AOPr4FWFCtMtJuJ+K+cuyDB6OhF/WfOdjBVpTdn0zVMMJAm4SgjzqdPhRe5pH3DoNaCtbCUp
X-Received: by 10.50.116.169 with SMTP id jx9mr12326293igb.21.1461688551869;
	Tue, 26 Apr 2016 09:35:51 -0700 (PDT)
Received: from [10.0.0.5] ([64.37.16.184])
	by smtp.gmail.com with ESMTPSA id o6sm1430738igy.11.2016.04.26.09.35.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 26 Apr 2016 09:35:51 -0700 (PDT)
To: Sergey Sorokin <afarallax@yandex.ru>,
	Peter Maydell <peter.maydell@linaro.org>
References: <1457107473-26292-1-git-send-email-afarallax@yandex.ru>
	<CAFEAcA8F9AdePC4h8ZqPftbBatnhbge=1jpoe1gdrYstpdiwzA@mail.gmail.com>
	<1022901457739899@web28h.yandex.ru>
	<CAFEAcA_+MD=Cf26wZ_C9AH_NbRm_Lim492ugWUx3WqEzNrN8eQ@mail.gmail.com>
	<4542001457893724@web22h.yandex.ru>
	<CAFEAcA_s+YmPJSwmWYc4coMXzdRHhB3bsHew_AfRunD1pWhB_Q@mail.gmail.com>
	<628941458228094@web26j.yandex.ru>
	<CAFEAcA_+znhWyJFWC3eMi8JiZw-nb2MyK_+uD6Fww76reinoeQ@mail.gmail.com>
	<1362381458575779@web6j.yandex.ru>
From: Tom Hanson <thomas.hanson@linaro.org>
Message-ID: <571F98E6.1010109@linaro.org>
Date: Tue, 26 Apr 2016 10:35:50 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1362381458575779@web6j.yandex.ru>
Content-Type: text/plain; charset=koi8-r; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4001:c05::236
Subject: Re: [Qemu-arm] [PATCH] target-arm: Fix descriptor address masking
 in ARM address translation
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
X-TUID: e7nCDgg3LNX8

On 03/21/2016 09:56 AM, Sergey Sorokin wrote:
> 17.03.2016, 18:24, "Peter Maydell" <peter.maydell@linaro.org>:
>>   On 17 March 2016 at 15:21, Sergey Sorokin <afarallax@yandex.ru> wrote:
>>>    17.03.2016, 14:40, "Peter Maydell" <peter.maydell@linaro.org>:
>>>>    On 13 March 2016 at 18:28, Sergey Sorokin <afarallax@yandex.ru> wrote:
>>>>>>    If you want to implement the AddressSize checks that's fine,
>>>>>>    but otherwise please leave this bit of the code alone.
>>>>>
>>>>>     You said me that my code is not correct, I have proved that it conforms
>>>>>     to the documentation.
>>>>>     It's a bit obfuscating when the doc explicitly says to take bits up to 39
>>>>>     from the descriptor, but in QEMU we take bits up to 47 relying on the check in
>>>>>     another part of the code, even if both ways are correct.
>>>>
>>>>    The way the code in QEMU is structured is that we extract the
>>>>    descriptor field in one go and then will operate on it
>>>>    (checking for need to AddressSize fault, etc) as a second
>>>>    action. The field descriptors themselves are the sizes I said.
>>>
>>>    Well, may be it's enough just to change this comment as you intend:
>>>
>>>>>    - /* The address field in the descriptor goes up to bit 39 for ARMv7
>>>>>    - * but up to bit 47 for ARMv8.
>>>>>    + /* The address field in the descriptor goes up to bit 39 for AArch32
>>>>>    + * but up to bit 47 for AArch64.
>>>>>          */
>>
>>   The comment is correct as it stands.
>>
>>   thanks
>>   -- PMM
>
> I mean in the patch.
> We need to fix lower bits in descaddrmask anyway.
> So:
>
> I could describe in the comment, that the descriptor field is up to bit 47 for ARMv8 (as long as you want it),
> but we use the descaddrmask up to bit 39 for AArch32,
> because we don't need other bits in that case to construct next descriptor address.
> It is clearly described in the ARM pseudo-code.
> Why should we keep in the mask bits from 40 up to 47 if we don't need them? Even if they are all zeroes.
> It is a bit obfuscating, as I said.
>
  I agree with Peter.  The original comment is correct.

Looking at the TLBRecord AArch32.TranslationTableWalkLD pseudocode, it is treating the AArch32 address as 48 bits long.  For example:
     if !IsZero(baseregister<47:40>) then
         level = 0;
         result.addrdesc.fault = AArch32.AddressSizeFault(ipaddress, domain, level, acctype, iswrite,
                                                          secondstage, s2fs1walk);
     return result;

This requires that an AArch32 address have specific values up through bit 47.
