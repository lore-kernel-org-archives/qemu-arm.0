Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp547350wrh;
        Thu, 9 May 2019 02:33:27 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzelmVauDKILRJEAUy/S5l2eG/Ozot0kC2jZAbgsmsHvpqOyiNTqHWjXfdDqwj3U32juGcY
X-Received: by 2002:a1c:5fd4:: with SMTP id t203mr2065594wmb.56.1557394407276;
        Thu, 09 May 2019 02:33:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557394407; cv=none;
        d=google.com; s=arc-20160816;
        b=C9Hgb4WwVzfekI9704908d3z98VcCerVr6Eq0ck+51XQSk+rwgK1iD7pFCqYac9JUd
         8WdVo9apxDSLCV2M6W0sY29e92E+d54dneUMyos5x7FPpWZnrIoBqCO+8SSUDb5j77VU
         Xp9g6USV9eLsxVWnR9L2nN8CB3/t9WKWDPB1APslzBRjxvkNZkzjzYML+g7+ZmV1FXKp
         YpwvQznbSSMgrfR6X3oCfPHWjauvYym7epQsKMpGug1w/aZ1+PsNOtFEO1cOo20ztMbD
         t6klUJMs0zszYDCF+YGF/Ous906DOHHDQ6ZnjNX1+XvYEKnY+Of1QeYrHyyWoAeYr+Qw
         OcEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=QwH74LETBaF+UY2LT9XQQKL1D1uQjZEUPv8hnsq76J8=;
        b=bx2xQtYWOmuqY+Xs9KrUbaycbAM9CaK+auFHvfIJ7gMGEkgCfPe7amJGy6Cv8zGDfk
         pb6iwijAB0ybbr8e7bJRH9Ro/OeNMgmrpN5FNKuHHOhnbKbh1soZkLoJL36CJs4bw2JQ
         2zp7AzzyWHdkyaRFNQcXHWAS9uOdvtAx+tgkzzPr/Af7ArBdMDeuzLYxd4Z/9rOlR2XO
         astFKTfdxzBAer4wdwnK8hsvCa4bcpAi6gOGoeHmXupluV4VltGpn7KXZU874Xcdq60X
         Dn2G4LmROmKwCJ8hBQggdspH3Fhlwzu2ie5jPNsE+09v9MBCpbD+GQumvOJML4fG7Ta5
         XNdw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 7si1432480wrl.179.2019.05.09.02.33.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 09 May 2019 02:33:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:51333 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hOfQc-0007p3-BJ
	for alex.bennee@linaro.org; Thu, 09 May 2019 05:33:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:32865)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hOfPh-0007mu-T8
	for qemu-devel@nongnu.org; Thu, 09 May 2019 05:32:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hOfPg-0005KZ-BP
	for qemu-devel@nongnu.org; Thu, 09 May 2019 05:32:29 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:46065)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hOfPg-0005Jp-4n
	for qemu-devel@nongnu.org; Thu, 09 May 2019 05:32:28 -0400
Received: by mail-wr1-f68.google.com with SMTP id s15so1981291wra.12
	for <qemu-devel@nongnu.org>; Thu, 09 May 2019 02:32:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=QwH74LETBaF+UY2LT9XQQKL1D1uQjZEUPv8hnsq76J8=;
	b=eE9LJTSR/b910ZrvUKLgHzVc4u8kL0I1NiNcZgBDLqqrohlIFCGCew9/TcKzaOSEnP
	OCw1TEPo6ooLYwIJgQDHIT3wwsDYBZ5bPCQ4BGtevldPb/EFhMrXExTpEe/MkdRbltCx
	OgX5gJaS8gTOfrxIu/Pz7aSlFX9jrxray1rwFQCPRgLydDCU9N4TtDJ4Sw1nOXGIEzbU
	Epx1kSXBuhp23G0keuGCSR+UnOBJizUCu93FNBHqQ2WBv2ReTOsEd0RZJhCp7HqxA7Hd
	/cgjEkey9zu92x5PPIVbYEaNrjgwFkHSqwUS2g+qtjFWygTKBnkgCueYUbslTHaSHSDf
	1/EA==
X-Gm-Message-State: APjAAAU8rVZV90KFUBX7uvCUW8rrjLBUcEWn3/sH6bvXppH7ZBAPwIBS
	QCHigav3kCmnLjliIhY0naYPCHcPKiw=
X-Received: by 2002:a5d:5282:: with SMTP id c2mr2259891wrv.88.1557394346192;
	Thu, 09 May 2019 02:32:26 -0700 (PDT)
Received: from [192.168.1.37] (193.red-88-21-103.staticip.rima-tde.net.
	[88.21.103.193])
	by smtp.gmail.com with ESMTPSA id f6sm2029940wro.12.2019.05.09.02.32.25
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 May 2019 02:32:25 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20190507134521.31044-1-thuth@redhat.com>
	<CAFEAcA-j+wQXjPW+puxk=foi2T8O=MzXHtxdWJ6E5P7o89WQSg@mail.gmail.com>
	<c0cda8fc-cc68-eadd-0750-cc9eeca094a4@redhat.com>
	<b93b1eb4-d2ff-67cd-a293-5ceb4db9b957@redhat.com>
	<CAP+75-XRZ22uhxfLF6uOpjDtKOf_EDC8uGgbu=DgYw-kcBSAGQ@mail.gmail.com>
	<20a27c22-cd1a-f5a8-9e36-db171c4ae19e@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <f8186f0c-2852-956b-5a01-e42ec6c90d7f@redhat.com>
Date: Thu, 9 May 2019 11:32:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20a27c22-cd1a-f5a8-9e36-db171c4ae19e@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.68
Subject: Re: [Qemu-devel] [PULL v2 00/28] Kconfig for Arm machines
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
Cc: qemu-arm <qemu-arm@nongnu.org>, John Snow <jsnow@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +lcc7zTHlUpp

On 5/9/19 7:34 AM, Thomas Huth wrote:
> On 08/05/2019 18.45, Philippe Mathieu-Daudé wrote:
>> [clicked ctrl+enter too fast]
>>
>> On Wed, May 8, 2019 at 6:43 PM Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>> On 5/8/19 5:33 PM, Thomas Huth wrote:
>>>> On 08/05/2019 17.09, Peter Maydell wrote:
>>>>> On Tue, 7 May 2019 at 14:45, Thomas Huth <thuth@redhat.com> wrote:
>>>>>>
>>>>>>  Hi Peter,
>>>>>>
>>>>>> the following changes since commit a6ae23831b05a11880b40f7d58e332c45a6b04f7:
>>>>>>
>>>>>>   Merge remote-tracking branch 'remotes/ehabkost/tags/python-next-pull-request' into staging (2019-05-03 15:26:09 +0100)
>>>>>>
>>>>>> are available in the Git repository at:
>>>>>>
>>>>>>   https://gitlab.com/huth/qemu.git tags/pull-request-2019-05-07
>>>>>>
>>>>>> for you to fetch changes up to 69f879e9fefab9aaf24893fe4ce23e07756d703c:
>>>>>>
>>>>>>   hw/arm: Remove hard-enablement of the remaining PCI devices (2019-05-07 15:01:47 +0200)
>>>>>>
>>>>>> ----------------------------------------------------------------
>>>>>> Kconfig settings for the Arm machines
>>>>>> (v2: Fix the dependency of q35 to AHCI_ICH9 in the second patch)
>>>>>> ----------------------------------------------------------------
>>>>>
>>>>> Hi -- this is still failing in the build test where I 'make clean'
>>>>
>>>> Very weird. What is running before the "make clean"? Could you provide
>>>> me with the content of i386-softmmu/config-devices.mak please?
>>>
>>> It worked for me after running 'git fetch --tags', maybe because Thomas
>>> used the same tag?
>>
>> Maybe because Thomas used the same tag you are still trying the
>> previous version?
> 
> I did not use the same tag. v1 had pull-request-2019-05-05 while v2 has
> pull-request-2019-05-07. So this can not be the reason.

Oh, I might have mixed up because I ran "git fetch" -> no change,
because tags are not fetched by default. "pull-request-2019-05-07" is
what I tested, with/without running "make clean". I can not reproduce
the error Peter is having.
