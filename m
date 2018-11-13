Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp4614884wrw;
        Tue, 13 Nov 2018 09:07:40 -0800 (PST)
X-Google-Smtp-Source: AJdET5cLJeKZ4/Lo8eg+I5BM95z+qqkEqlA5CnFl35dihtSQ3qbbD+4h/UUKqoV+siSg6zn4XQZY
X-Received: by 2002:a0c:e394:: with SMTP id a20mr5960754qvl.42.1542128860818;
        Tue, 13 Nov 2018 09:07:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542128860; cv=none;
        d=google.com; s=arc-20160816;
        b=t7Z+paSMimba8e9pQzeV6sRS926FZhpVdVMPtel22UavaH9y1rdEnGwbaxjHO7ysxs
         rTdot8fI256AlhzXjrhRyzmNIifER8T6e8QFNHHlXXc031ejp4wCkdczuCUnqLi1piKU
         c/lhYvxLRX4AsYR1XwXi+yzWXUjdlH4hoFTfasGadI7i1YPJJMGtLX3t4n4iI88HrVTz
         jf5gF0mU2ZcraV/Sqh+nLUus4NQSMhuO34LoiZT38hkFdfaqsg1E5ZlBXj+SM+kljM9+
         DnD10mY8Es8aVAIabC/4vYRAaxLG/Z+IqHAwR3xmfRrUL4wz/PFGcnbbL9J+XlpqeufH
         8mUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=ZBzUEDlkO0Uw0RbXwjsqtVqtdg94SEeLz0xMvy/7II8=;
        b=qTVbqiPHuvZTwmh1gI6veuMizPaOAA50128wb2wmLv3AyDqOrgyLlyq1xhi7cO7+Wy
         MeJOt4YUcjSgODpa7CWZD6k0lF8ID1itPBzxel+tkuXjd1Xma97Mtv9267KU50LNUfzA
         WhlWM3KixzfUt53XSQ/khAFx2y9HBsVrTiw/LQeqsPB+Rb/0saxhbbFfdGaniwdw7z+L
         SRGCNCY6XKshChZWAvYl6feAe8EneRSYm/OE29gPzSOcHsUYywXK0TQKNWB360XsdeLg
         vCfXodeGBxip+GZDGhLUtvcsgUC3qmnmm+Y2jiKfbh6Sam3EUS7bWfSWaB9i8vSEy3tZ
         37gw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d19si1070631qtm.138.2018.11.13.09.07.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Nov 2018 09:07:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55149 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gMcA8-0007bI-5v
	for alex.bennee@linaro.org; Tue, 13 Nov 2018 12:07:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35218)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gMc9f-0006SB-Nt
	for qemu-devel@nongnu.org; Tue, 13 Nov 2018 12:07:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gMc3b-0002dB-3w
	for qemu-devel@nongnu.org; Tue, 13 Nov 2018 12:00:59 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:50658)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gMc3a-000208-Sg
	for qemu-devel@nongnu.org; Tue, 13 Nov 2018 12:00:55 -0500
Received: by mail-wm1-f66.google.com with SMTP id 124-v6so12779089wmw.0
	for <qemu-devel@nongnu.org>; Tue, 13 Nov 2018 09:00:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ZBzUEDlkO0Uw0RbXwjsqtVqtdg94SEeLz0xMvy/7II8=;
	b=qMCEtEh2JEvHchq12lekcivKEAwxjWqCc8Jt0oqHKyXKd7+TAUgkedcY3UlR78MsRv
	6SoimouZqOnXrxsRLYAXeqN5cf1iwOtjWB3CR4Y5ArEDFLH8iK9k7OUvvHSvpE85yqg9
	HmOpJbSgV9n2tJEH4YKSi0VIYhYsvYRzUgfgRhOBh/4VG6/CCn5xHUwMM62YML43W/+Q
	KmCs1/0Sfl8WnTM4nWmNzenyTfL2ge9V0652RkXIcYQlmBTVg+GaFNlTU8wRNBvev/7a
	JqlsXO2YtuRYo7vGpaFZGqmwl9Ca8qln1XSfz12/2vMeZf9zgmgJDldmhKvlpUuGMBhw
	C29Q==
X-Gm-Message-State: AGRZ1gIIAGPw4m9g4zFZ0SvGxXebd+FuVERe0C6wyuBM7swNH6k7trtz
	Re40kIYC9/KvDrmxgb/r82cxhw==
X-Received: by 2002:a1c:4683:: with SMTP id
	t125-v6mr4175376wma.112.1542128423939; 
	Tue, 13 Nov 2018 09:00:23 -0800 (PST)
Received: from [192.168.1.36] (2.red-83-59-163.dynamicip.rima-tde.net.
	[83.59.163.2]) by smtp.gmail.com with ESMTPSA id
	y83-v6sm9950729wmg.13.2018.11.13.09.00.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Nov 2018 09:00:23 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>,
	Samuel Ortiz <sameo@linux.intel.com>
References: <20181113165247.4806-1-sameo@linux.intel.com>
	<20181113165247.4806-2-sameo@linux.intel.com>
	<CAFEAcA-npVS1Q0=or=p-kjP0Nf4h1n+qUL7y8+yYCdtuHa7Fxg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <60aa686a-89b3-4b98-604a-0168fa8419c0@redhat.com>
Date: Tue, 13 Nov 2018 18:00:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-npVS1Q0=or=p-kjP0Nf4h1n+qUL7y8+yYCdtuHa7Fxg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.66
Subject: Re: [Qemu-devel] [PATCH 01/13] target: arm: Add copyright
 boilerplate
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1Nc8mg1CmUjd

On 13/11/18 17:58, Peter Maydell wrote:
> On 13 November 2018 at 16:52, Samuel Ortiz <sameo@linux.intel.com> wrote:
>> From: Philippe Mathieu-Daudé <philmd@redhat.com>
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> Reviewed-by: Robert Bradford <robert.bradford@intel.com>
>> Reviewed-by: Samuel Ortiz <sameo@linux.intel.com>
>> ---
>>   target/arm/helper.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/target/arm/helper.c b/target/arm/helper.c
>> index 0da1424f72..3d4e9c5c8a 100644
>> --- a/target/arm/helper.c
>> +++ b/target/arm/helper.c
>> @@ -1,3 +1,10 @@
>> +/*
>> + * ARM generic helpers.
>> + *
>> + * This code is licensed under the GNU GPL v2.
>> + *
>> + * SPDX-License-Identifier: GPL-2.0-or-later
>> + */
> 
> The human readable text says "v2", but the SPDX tag says
> "v2 or later". Which is right? (The top level LICENSE file says
> source files with no specific license are 2-or-later).

Sorry, the human failed, the machine is right.
