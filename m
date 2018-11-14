Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp5963831wrw;
        Wed, 14 Nov 2018 09:02:50 -0800 (PST)
X-Google-Smtp-Source: AJdET5dn1IoxVb2qcfD64Jg888RUOs5/5ukt2K5yVdLhHaXWS8yOEHDvvvCh0lAUkUU7QMFS357C
X-Received: by 2002:ac8:285c:: with SMTP id 28mr2480753qtr.54.1542214970259;
        Wed, 14 Nov 2018 09:02:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542214970; cv=none;
        d=google.com; s=arc-20160816;
        b=m00n6LjNLegk5UQduiSGmsXw4yLFLzFlWG12IW1ygRJBXR29HqsMJ5bLYGSffiyxas
         qqFLN96h4YUXhYxULEnASNnlBipIb682CL33dqxNr2S3vnu4cvCzRVCgI8cDDKzEVAyL
         wp1fHLm4e6HUcyE+/X+g6TYCu+Z95FOtSpOhyBVkTYQnaAhoI5xVXqxlgqpm0FnwF6+u
         rrVckvA+HqSRSqAfT6U/UPAPSW1mZpKZGzpM5fN6NOShFVoU//wNDrtIlWRV8x8LgEZ0
         AK1EZHwAgplAmr51JoGVi3vqsdFsoh0sZ7eMP1vPTSGdWs8iUu8F9Ksqg0iqDhP8OEwD
         5Etg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:message-id:content-language:in-reply-to
         :user-agent:date:autocrypt:openpgp:from:references:to;
        bh=0awvkORIVfvaan0rCgdWpaUxDzpCtUfOhmVGP77pnzw=;
        b=Z+7YJELEzf36n0wX1hSyYjAmAXJQuyOAHQ6qM29F2HveDDTpdZdzuQunxnp1nx6Ald
         7MbyD58Y2nP+ImIPIsurFJgkYJGH4OarKdEk0JUr5VchAHrzkWrAhe8GKa5dIr+PJaeX
         s9/bf7wgHffz9EIe5db1cJiAia2s/kavttgJUnyNqWuuNEaMnT1yUdoDAOwu9EST4RGp
         1JoMIREuzIofsiMZ3vLCn34/sv+ccGa4pWNNC+cef23ltgYcGIMPeZW0h/wkQmYvDF9T
         lQ7by+zAFBxEZ94trq3WqxjtAZluzzD1m2oK4lsa0NBDJ8Of50R8/5kfrYi8/HUoUwYP
         8myg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b8si492425qvl.144.2018.11.14.09.02.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 14 Nov 2018 09:02:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1]:33340 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gMyYz-0001gI-9b
	for alex.bennee@linaro.org; Wed, 14 Nov 2018 12:02:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55370)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <borntraeger@de.ibm.com>) id 1gMyXF-0000cF-2W
	for qemu-arm@nongnu.org; Wed, 14 Nov 2018 12:01:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <borntraeger@de.ibm.com>) id 1gMyXB-0001UD-7a
	for qemu-arm@nongnu.org; Wed, 14 Nov 2018 12:01:00 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:15371)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <borntraeger@de.ibm.com>)
	id 1gMyXA-0001Sf-UP
	for qemu-arm@nongnu.org; Wed, 14 Nov 2018 12:00:57 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	wAEGwY4X054466
	for <qemu-arm@nongnu.org>; Wed, 14 Nov 2018 12:00:56 -0500
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
	by mx0a-001b2d01.pphosted.com with ESMTP id 2nrqm98cm0-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <qemu-arm@nongnu.org>; Wed, 14 Nov 2018 12:00:55 -0500
Received: from localhost
	by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-arm@nongnu.org> from <borntraeger@de.ibm.com>;
	Wed, 14 Nov 2018 17:00:51 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
	by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Wed, 14 Nov 2018 17:00:46 -0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
	[9.149.105.61])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id wAEH0jJl58392764
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Wed, 14 Nov 2018 17:00:45 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4D84111C05C;
	Wed, 14 Nov 2018 17:00:45 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 17FDF11C04C;
	Wed, 14 Nov 2018 17:00:43 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.145.182.212])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Wed, 14 Nov 2018 17:00:42 +0000 (GMT)
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20181114132931.22624-1-marcandre.lureau@redhat.com>
	<16b78816-f2cc-a1e5-0d21-906fc2dbaa3d@redhat.com>
	<a2d9a2fd-2c1a-66e3-86ba-17da9f564e79@redhat.com>
	<c0601dcb-142f-3033-b11f-1b951aaf0e3f@redhat.com>
	<CAFEAcA85vaAoo9wJLC25kF00MyPrAoTu_TSZ8NXxym8q7EhArQ@mail.gmail.com>
	<3784d1ce-045a-59aa-bde2-7590f51196f0@redhat.com>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Openpgp: preference=signencrypt
Autocrypt: addr=borntraeger@de.ibm.com; prefer-encrypt=mutual; keydata=
	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
	syiRa+UVlsKmx1hsEg==
Date: Wed, 14 Nov 2018 18:00:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
In-Reply-To: <3784d1ce-045a-59aa-bde2-7590f51196f0@redhat.com>
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18111417-0020-0000-0000-000002E804C8
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18111417-0021-0000-0000-000021371AC0
Message-Id: <810a54c6-62ae-8e06-59a9-91a638addbcc@de.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: Quoted-printable
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2018-11-14_13:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1810050000 definitions=main-1811140153
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.156.1
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] vmstate: constify VMStateField
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
Cc: Fam Zheng <famz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	"open list:S390" <qemu-s390x@nongnu.org>,
	"open list:ARM" <qemu-arm@nongnu.org>,
	"open list:PowerPC" <qemu-ppc@nongnu.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	Stafford Horne <shorne@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rSrmVQPdU5uO



On 11/14/2018 05:56 PM, Thomas Huth wrote:
> On 2018-11-14 17:49, Peter Maydell wrote:
>> On 14 November 2018 at 16:39, Philippe Mathieu-Daud=C3=A9 <philmd@redhat=
.com> wrote:
>>> Hi Thomas,
>>>
>>> On 14/11/18 17:29, Thomas Huth wrote:
>>>> Please don't. For rationale, see:
>>>> https://www.kernel.org/doc/html/v4.19/process/coding-style.html#typede=
fs
>>>
>>>
>>> Thanks for the pointer, I am interested in understanding why not do tha=
t.
>>> However in the link you pasted I don't see a rational about enforcing
>>> constness, I understand that since this case doesn't match the 5 rules,=
 we
>>> should use 'struct VMStateField' directly and remove the typedef.
>>
>> QEMU's coding style is not the kernel's. In the kernel, yes,
>> they prefer "struct foo". In QEMU we generally prefer to use
>> a typedef for most structs.
>=20
> Yes - my point was simply: Let's do not start to hide more things beside
> "struct" in a typedef. If I look at QEMU source code containing just a
> "VMStateField", I expect it to be a shortcut for "struct VMStateField".
> I'd never expect that it also contains the "const" attribute. I'm pretty
> sure that this would cause some confusion in the future otherwise.

I agree. typedefing a struct is one thing, typedefing qualifiers in (like c=
onst)
is getting really unexpected.=20

