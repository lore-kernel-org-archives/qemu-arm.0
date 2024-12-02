Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2957863njk;
        Mon, 2 Dec 2024 07:58:06 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX5p/129hOI/RkqKvdZX7667blJojOhDuPbONFPHHTJhD2d/HKAWtP7CX2RZH1nBnR1W90lhIl/m3vmBg==@linaro.org
X-Google-Smtp-Source: AGHT+IHXUtIUQrs4Vsq9r0CbjG+ZzVvHwFYXi+4V3Q6BuFDRpnIU3Uh/lsgDL2/LBTZDHjrzxrtW
X-Received: by 2002:a92:c26b:0:b0:3a7:99a5:a207 with SMTP id e9e14a558f8ab-3a7c5525310mr202187225ab.5.1733155085834;
        Mon, 02 Dec 2024 07:58:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733155085; cv=none;
        d=google.com; s=arc-20240605;
        b=Tnl75KGAwBtDdRrSDPOEs7U75yAIhxGZVemXx0cxveBKsfL9GTcQrEBCyaBwtER0df
         /Ym2/bPaEaUQts88KDkEKS7w9rJnMKDWcrHAQsI26aU5XMsc7Rtd4tXWpblgGdFG9kES
         kunomsarhytjD313xTzIEe5Vy1K+YvmJlTouw86JXIZqgNOgo0zvr8BWp/1TtuzaeQOF
         YsNjQjSenZPyf2h8MZD6LWxQlm+QjL/a2ySTtzZl+w6ye7W7Me87w7WxYzwLHjh8sLQK
         1BgZ4ni31KgG89PDwhc5Wf5FPkxlFkWFT6tlSpGEKDDz9XsEp7kMoZ9s04bTce2hJd/y
         Ocig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=xZQ69xaoMi3/lep/8B0Spc4dK/U0wslRbBIr2NlAxPQ=;
        fh=0mMrDapNFRIZvbzTuq+shsOta3WUjLCte8vKaHcfbPM=;
        b=RD6nR9fmlWdvxZ0IygIb3Eq6o8c0H/tDGlVfo5EvPcI74nj8pDC4JHCBO8jKw8cyD2
         HkarV5IaJJPw59umNBndMRAHyu2TesS1VG5yvAdMYX11AHUz8zfhUVOhEVTCmw8eBjA8
         JnE6waeW1UWa1wYFTsvDZluwuN+0+ZBP6dewkhn1lBOWM/rEVvntXtTnZHUcj8GPztyN
         aUUQb7ZOY0mJ+Yp7hNNTXPsYLCiLtAfMk15EnlM9mJ58MKyCiou11qhm5A5XcEKt7mLo
         w+xPAhC5rTBA0d+Kuf+a8axnEAWkzqAHGcMQaPahB8z4w84xfiA/u5vXSDajgw5oKd+X
         Lpsw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b="QQVrv/Fs";
       spf=pass (google.com: domain of stefanb@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=stefanb@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <stefanb@linux.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com. [148.163.156.1])
        by mx.google.com with ESMTPS id e9e14a558f8ab-3a7ccbd3e37si63077585ab.13.2024.12.02.07.58.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Dec 2024 07:58:05 -0800 (PST)
Received-SPF: pass (google.com: domain of stefanb@linux.ibm.com designates 148.163.156.1 as permitted sender) client-ip=148.163.156.1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b="QQVrv/Fs";
       spf=pass (google.com: domain of stefanb@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=stefanb@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B2AcqmQ019533;
	Mon, 2 Dec 2024 15:58:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=xZQ69x
	aoMi3/lep/8B0Spc4dK/U0wslRbBIr2NlAxPQ=; b=QQVrv/FspMRWy2N6+o0I1e
	itt0mkuSPgPAQgj3XScTl/9F84F9kpJ8KfJ0oX42OdM+I1TjpYgxyqyeNuqXmEWN
	7mHtUqWdFf18DJqh3BW4cFOUF4nMPq15SFW8/3on+A64ls4Wwb08BfNb2NtcdXSF
	jJQ3WY5SYx3ELiC41VX7calvQLXJGxccjaGr/lWd79+tXetWaZr916EBz6Y9VYLA
	NStljwRZO1BiN23o47YSR+B7E2PzjpA/ZPOAGPkH46wshskpQTWEnLZFjr/E7u6v
	HlM7PzVrJl5Ol5/civw7NHtuFroXbj5fj9JEA4rOuJT+/ZDVvvufc+0kCXSzox1w
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 438kfge5kf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Dec 2024 15:58:04 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4B26gxai023634;
	Mon, 2 Dec 2024 15:58:03 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 438e1mtkvh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Dec 2024 15:58:03 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4B2Fw29i51053028
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 2 Dec 2024 15:58:03 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DFC1758059;
	Mon,  2 Dec 2024 15:58:02 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 25BC75805C;
	Mon,  2 Dec 2024 15:58:02 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  2 Dec 2024 15:58:02 +0000 (GMT)
Message-ID: <d3d73795-3f59-490c-9e54-c6c358af62d0@linux.ibm.com>
Date: Mon, 2 Dec 2024 10:58:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 25/26] target/arm/kvm-rme: Add measurement log
To: Jean-Philippe Brucker <jean-philippe@linaro.org>,
        =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org, philmd@linaro.org,
        qemu-arm@nongnu.org, qemu-devel@nongnu.org, alex.bennee@linaro.org,
        Stefan Berger <stefanb@linux.vnet.ibm.com>
References: <20241125195626.856992-2-jean-philippe@linaro.org>
 <20241125195626.856992-27-jean-philippe@linaro.org>
 <02b90518-2996-4231-bee9-43ce313669b0@linux.ibm.com>
 <Z0XREyMovNyB4s6t@redhat.com> <20241126162149.GC956991@myrica>
Content-Language: en-US
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <20241126162149.GC956991@myrica>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: e_Dqq_xwypzIbdYGytPkyHoRdqonJ3CH
X-Proofpoint-GUID: e_Dqq_xwypzIbdYGytPkyHoRdqonJ3CH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 clxscore=1011 malwarescore=0 bulkscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=999 impostorscore=0 phishscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412020133
X-TUID: Z2sqn76m22vc



On 11/26/24 11:21 AM, Jean-Philippe Brucker wrote:
> On Tue, Nov 26, 2024 at 01:45:55PM +0000, Daniel P. Berrangé wrote:
>> On Mon, Nov 25, 2024 at 05:23:44PM -0500, Stefan Berger wrote:
>>>
>>>
>>> On 11/25/24 2:56 PM, Jean-Philippe Brucker wrote:
>>>> Create an event log, in the format defined by Trusted Computing Group
>>>> for TPM2. It contains information about the VMM, the Realm parameters,
>>>> any data loaded into guest memory before boot and the initial vCPU
>>>> state.
>>>>
>>>> The guest can access this log from RAM and send it to a verifier, to
>>>> help the verifier independently compute the Realm Initial Measurement,
>>>> and check that the data we load into guest RAM is known-good images.
>>>> Without this log, the verifier has to guess where everything is loaded>
>>> and in what order.
>>>
>>> Typically these logs are backed by extensions of TPM PCRs and when you send
>>> a log to a verifier you send a TPM quote along with it for the verifer to
>>> replay the log and check the TPM quote. Also, early code in the firmware is
>>> typically serving as a root of trust that starts the chain of measurements
>>> of code and data, first measuring itself and then other parts of the
>>> firmware before it jumps into the other parts. Now here you seem to just
>>> have a log and no PCR extensions and therefore no quote over PCRs can be
>>> used.
> 
> Indeed, in our case it's the trusted hypervisor (RMM) that provides the
> equivalent to TPM quote and PCRs. In more details:
> 
> 1. QEMU loads images into guest RAM by calling KVM, which calls RMM.
> 2. RMM calculates a hash of the image content, adds it to a rolling hash
>     the "Realm Initial Measurement" (RIM), which I believe is equivalent to
>     a PCR.

I am not familiar with RIM. A link to read more about it would be helpful.

> 3. During remote attestation, the guest sends evidence containing this RIM
>     signed by the root of trust, along with a signed token identifying the
>     platform (hardware, firmware, RMM).

Is this a well known manufacturer key that one would expect for 
signature verification or is it locally created?

> 4. The verifier checks the signature and the platform token, so it trusts
>     the RMM and the RIM.
> 
>>> Then what prevents anyone from faking this log and presenting a
>>> completely fake log to the verifier?
> 
> Absolutely, the verifier does not trust the content of the log, it only
> uses the log as helper to try to reconstruct the RIM. For example a log
> event says "I loaded image XYZ at address A", then the verifier searches
> image XYZ in its database of known-good images, calculates the hash that
> would result from loading that image at address A. Any malformed event in

Hopefully just calculating a hash over the image will do and the 
location an image was loaded to, like address A (relocation?), doesn't 
matter...
