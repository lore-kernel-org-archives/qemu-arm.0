Received: by 10.223.134.117 with SMTP id 50csp12692112wrw;
        Wed, 3 Jan 2018 20:22:38 -0800 (PST)
X-Google-Smtp-Source: ACJfBotWii1Dfc+QwW7oaPaNVfAX9/o0vvkDc51uM/Kjum8OhSbSLsz5DmTJbMed/v1zQ5pa9jmm
X-Received: by 10.37.172.71 with SMTP id r7mr3367162ybd.157.1515039758148;
        Wed, 03 Jan 2018 20:22:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515039758; cv=none;
        d=google.com; s=arc-20160816;
        b=PTuIxT8kkONRgCV/HgYXRbVBaGARjo2BKP95/esQuSnllnagr9y9uCKLR3Ke8xxT8p
         EIgs5HojwA3O/0nsgl3EoReTYd4L1a2TE4aISgdmPzWor9qwMvBUNgoaaXAsKgPpNISx
         S+hx2yi9RvZBTlqo/ps0Mzylwwxz5csl3EQW/GdFjAQ236KvHA7pUrd5dcWp8tTuTOiq
         c8EhkVeMPhhHN8czLHjLX8VhqWeRjMp0cgNBYDSR4r33RMN742zoYWKKzWpkV8w/PJxp
         CWUZN3/apcTIzeN9UqZ+2Cpho6p9PsZIcLeE9I7uXzEt0Lo2GwNlIi2jzCVtL++2uvuX
         Qvew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=eijjj3HIrvOq+bBPsW3+71bB5ZNCjtqdmMUUgmP3m70=;
        b=tkV4brwayfD7rR9XbLPxQqcOuxmaUV36gV+mcH7vQqE63UJ5Ycfub+6I6iP03ZA0Ns
         e2HjLlnW+JA/KfeoA4LwlXcNSZOJFEkvqMZluYF/SvhsZRb/wWZeBedjMHK4mQzlv1nr
         8Tc7nyjmZWoWYtNat1phVBXJcbNu6dghI8ZAryW5mFqrApVW9NOGO7F9QCkZrq/8OQh3
         HE7sn7rzF+CPonliB3l2s49hg/MNwt0D6nGAYN3NYiSRxE9QalWXItIVd26iNEAU45Bf
         1OBrIhck4bS1hV/sDiFrqrey6bpetRN+tiVklgbBf/mUU45rK2tpJsmbmpNgIbJbBeRM
         Otxw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i17si534716ybk.330.2018.01.03.20.22.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Jan 2018 20:22:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47226 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eWx37-0002jF-Iy
	for alex.bennee@linaro.org; Wed, 03 Jan 2018 23:22:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60200)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1eWx2z-0002ii-QU
	for qemu-arm@nongnu.org; Wed, 03 Jan 2018 23:22:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1eWx2v-0004M5-87
	for qemu-arm@nongnu.org; Wed, 03 Jan 2018 23:22:29 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2140 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <gengdongjiu@huawei.com>)
	id 1eWx2u-0004Ed-QV; Wed, 03 Jan 2018 23:22:25 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 5E532964B59FD;
	Thu,  4 Jan 2018 12:22:05 +0800 (CST)
Received: from [127.0.0.1] (10.142.68.147) by DGGEMS411-HUB.china.huawei.com
	(10.3.19.211) with Microsoft SMTP Server id 14.3.361.1; Thu, 4 Jan 2018
	12:22:00 +0800
To: Igor Mammedov <imammedo@redhat.com>, James Morse <james.morse@arm.com>
References: <1514440458-10515-1-git-send-email-gengdongjiu@huawei.com>
	<1514440458-10515-3-git-send-email-gengdongjiu@huawei.com>
	<20171228151809.10495a90@igors-macbook-pro.local>
	<10087bbd-28b0-b5ad-101a-e6d5ac648548@huawei.com>
	<20180103143104.2b814aa0@redhat.com>
From: gengdongjiu <gengdongjiu@huawei.com>
Message-ID: <ceefdb58-f41c-5a4b-08c4-27f24efb121e@huawei.com>
Date: Thu, 4 Jan 2018 12:21:55 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20180103143104.2b814aa0@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
X-Originating-IP: [10.142.68.147]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 45.249.212.190
Subject: Re: [Qemu-arm] [PATCH v14 2/9] ACPI: Add APEI GHES table generation
 and CPER record support
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, kvm@vger.kernel.org,
	mst@redhat.com, marc.zyngier@arm.com, mtosatti@redhat.com,
	qemu-devel@nongnu.org, xuwei5@hisilicon.com, qemu-arm@nongnu.org,
	huangshaoyu@huawei.com, zhaoshenglong@huawei.com,
	pbonzini@redhat.com, zhengqiang10@huawei.com,
	christoffer.dall@linaro.org, rth@twiddle.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MjjThOaAh39w

On 2018/1/3 21:31, Igor Mammedov wrote:
> On Wed, 3 Jan 2018 10:21:06 +0800
> gengdongjiu <gengdongjiu@huawei.com> wrote:
>=20
> [...]  =20
>>>  =20
>>>> In order to simulation, we hard code the error
>>>> type to Multi-bit ECC. =20
>>> Not sure what this is about, care to elaborate? =20
>>
>> please see Memory Error Record in [1], in which the "Memory Error Type=
" field is used to describe the
>> error type, such as  Multi-bit ECC or Parity Error etc. Because KVM or=
 host does not pass the memory
>> error type to Qemu, so Qemu does not know what is the error type for t=
he memory section. Hence we let QEMU simulate
>> the error type to Multi-bit ECC.
> Agreed that in case of TCG qemu won't likely have any way to get hw err=
or from kernel
> so it could be useful only for testing purposes (i.e. 'make check' and/=
or testing
> how guest OS handles errors)
>=20
> But with KVM in kernel it should be possible to fish error out from hos=
t kernel
> and forward it to guest. If this are intended for handling HW errors,
> I'm not sure that 'Multi-bit ECC' could replace all real errors reporte=
d by host
> firmware.
Thanks for the mail.
I understand your meaning, I explain it more.

(1). In fact the Memory Error type is not important to guest OS, when the=
 OS(such as guest OS) do memory recovery,
it does not uses the memory error type, OS(such as guest OS) mainly uses =
the memory_failure() function[1] to do recovery ,
In this function, it does not care what is the memory error type, It even=
 does not know what is the memory error type.
(2). If KVM forward the error type to guest, it needs more efforts, may b=
e not worth to do. The real memory error type exists in host
APEI table, only host APEI driver can get it, KVM can not directly get it=
. If forward it to guest, KVM needs to firstly get the error
type from APEI driver and forward it to guest, which may be opposed by Ja=
mes(james.morse@arm.com), I ever export more error information
to guest, but James does not agree that. In the ARM64 platform, we do not=
 have implementation to get the error information from the
APEI driver to KVM or to other kernel modules.


[1]:
int memory_failure(unsigned long pfn, int trapno, int flags)
{
  ......
 }

>=20
>=20
>> [1]:
>> UEFI Spec 2.6 Errata A:
>>
>> "N.2.5 Memory Error Section"
>> -----------------+---------------+--------------+---------------------=
----------------------+
>>         Mnemonic |   Byte Offset |  Byte Length |        Description  =
                      |
>> -----------------+---------------+--------------+---------------------=
----------------------+
>>         ........ |  ............ |  .........   |        ...........  =
                      |
>> -----------------+---------------+--------------+---------------------=
----------------------+
>> Memory Error Type|     72        |       1      |Identifies the type o=
f error that occurred:|
>> 		 |		 |		| 0 =E2=80=93 Unknown                              |
>> 		 |		 |		| 1 =E2=80=93 No error                             |
>> 		 |		 |		| 2 =E2=80=93 Single-bit ECC                       |
>> 		 |		 |		| 3 =E2=80=93 Multi-bit ECC                        |
>> 		 |		 |		| 4 =E2=80=93 Single-symbol ChipKill ECC           |
>> 		 |		 |		| 5 =E2=80=93 Multi-symbol ChipKill ECC            |
>> 		 |		 |		| 6 =E2=80=93 Master abort			    |
>> 		 |		 |		| 7 =E2=80=93 Target abort			    |
>> 		 |		 |		| 8 =E2=80=93 Parity Error			    |
>> 		 |		 |		| 9 =E2=80=93 Watchdog timeout			    |
>> 		 |		 |		| 10 =E2=80=93 Invalid address			    |
>> 		 |		 |		| 11 =E2=80=93 Mirror Broken			    |
>> 		 |		 |		| 12 =E2=80=93 Memory Sparing			    |
>> 		 |		 |		| 13 - Scrub corrected error		    |
>> 		 |		 |		| 14 - Scrub uncorrected error		    |
>> 		 |		 |		| 15 - Physical Memory Map-out event	    |
>> 		 |		 |		| All other values reserved.		    |
>> -----------------+---------------+--------------+---------------------=
----------------------+
>>         ........ |  ............ |  .........   |        ...........  =
                      |
>> -----------------+---------------+--------------+---------------------=
----------------------+
> [...]
>=20
> .
>=20

