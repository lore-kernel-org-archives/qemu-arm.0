Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp932594ejb;
        Thu, 6 Apr 2023 01:04:26 -0700 (PDT)
X-Google-Smtp-Source: AKy350aPdpnoShVkrHwuValDqeVUqteREYj5ucuuWq2U++AFRDagXSZqGwOzRa3/LLKHmwCp5GHl
X-Received: by 2002:a0d:d6c4:0:b0:545:68a1:2cd1 with SMTP id y187-20020a0dd6c4000000b0054568a12cd1mr7860667ywd.7.1680768266744;
        Thu, 06 Apr 2023 01:04:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680768266; cv=none;
        d=google.com; s=arc-20160816;
        b=gQs5DjHJm2bFk41nflu4zGPzi5cz1u+rH/WDYQtztRHlC8tWcUb3ZgClKiIBNkVD2Z
         I6E3Exc15qQiPPhAz0p6R9YUHymtnoIAyVKf3xW9iZsleuMTlpDqJ3krtWsmqqa295RG
         UH1V6r2k3ez7lft+CX5kh67cBP1HBdUoO1atBBlG4vEpLkrfWFel5rSsR0jn5wOUBlBo
         3tsXQJ/8taUQK5Ds/+fEPOoDCbOoocHjlvD9bU7lWtZMtugLjNiju/HhmHSkVfNcCZj8
         86RC+a2Ok9t7MTw3j54hGdF+j7rXdpJQ0iV1yzhYSljPWRuX4kcH1fzHU08J6yvXwfY2
         /EJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=MrE4uEormCPNF2aheHPYCeZ1g12Sic721BFSzIfL51M=;
        b=qaChENgtfDcKZiuZ8uhP6OtTzdRs+KdhdklDdVZi0/rAxS3dDLXJGUVFM7j+Qv3KWu
         fkfvV9AniIg+nkq/fMB5dEaL8pawdVf8qRshmxSYFsNIxAGa3/VgeRN2Yee0vZ5O6IP6
         QP9kRAhPocgaLemcNak5J+IT5Jl1V7M5aPi4tIQdDDrNLr8vhXlbbcka/EQheP9vxl+j
         XyeAQZpM/SmOIPdmZdxjnckHRKwS1gA6bv8A3STIWBMRESjeN+2NAZJvZdvcSZM8yCvm
         0F8eJsflZVtgeRO8LSfryusd+PJZP8KeYTHVs3B4rESz08zVnBBjE3+StrIGrP1eDOeH
         TJvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=IXhAMZMk;
       spf=pass (google.com: domain of frankja@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=frankja@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <frankja@linux.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com. [148.163.158.5])
        by mx.google.com with ESMTPS id t205-20020a8183d6000000b0054c193c7827si183516ywf.368.2023.04.06.01.04.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Apr 2023 01:04:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of frankja@linux.ibm.com designates 148.163.158.5 as permitted sender) client-ip=148.163.158.5;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=IXhAMZMk;
       spf=pass (google.com: domain of frankja@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=frankja@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3366VoEv029569;
	Thu, 6 Apr 2023 08:04:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=MrE4uEormCPNF2aheHPYCeZ1g12Sic721BFSzIfL51M=;
 b=IXhAMZMkTbmTyLCBtQem1Ln6b2O6w4wtWsLMojP95fdXbrTLI6xRcJVJjvcqTBSqLyp6
 suMaLi/C+pszkQDl71lAgRZtw2l+8k7b69fowZkhj018cVf4twnoRmKmV7Kac3pA9WXP
 iMvTws4o1SL/Q54VqvxSSeW55SRIsWLnKtxkhT8PlH3huDHv4gvlzD9PrBms3tfxy6Zp
 0Yztfhc9vLCOByfVXuAF4qkK65sNkk5WjwW/PpcMyjWnYBQiWVsUYMjcCcjXiopRt39r
 p/1KCF925Q7i0qi9P7cjURglsQk+4qJCK2jWyVNBmAntKXezoOKuizKUO7IVd3PyIfHg pA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3ps9un6byg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Apr 2023 08:04:26 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3367ElYM019708;
	Thu, 6 Apr 2023 08:04:25 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3ps9un6bxg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Apr 2023 08:04:25 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 335Nxs3v004693;
	Thu, 6 Apr 2023 08:04:23 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3ppbvg439y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Apr 2023 08:04:23 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 33684HLD44696018
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 6 Apr 2023 08:04:17 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CA3E720043;
	Thu,  6 Apr 2023 08:04:17 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E14C120040;
	Thu,  6 Apr 2023 08:04:16 +0000 (GMT)
Received: from [9.179.16.135] (unknown [9.179.16.135])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  6 Apr 2023 08:04:16 +0000 (GMT)
Message-ID: <3fe240da-9a75-0e39-7762-cd91af9ed3f0@linux.ibm.com>
Date: Thu, 6 Apr 2023 10:04:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 10/10] hw/s390x: Rename pv.c -> pv-kvm.c
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>,
        =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>,
        qemu-devel@nongnu.org, Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
        =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
        qemu-arm@nongnu.org, kvm@vger.kernel.org, qemu-ppc@nongnu.org,
        Halil Pasic <pasic@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Eric Farman <farman@linux.ibm.com>,
        Richard Henderson <richard.henderson@linaro.org>,
        David Hildenbrand <david@redhat.com>,
        Ilya Leoshkevich <iii@linux.ibm.com>
References: <20230405160454.97436-1-philmd@linaro.org>
 <20230405160454.97436-11-philmd@linaro.org>
 <3cccc7e6-3a39-b3b4-feaf-85a3faa58570@redhat.com>
From: Janosch Frank <frankja@linux.ibm.com>
In-Reply-To: <3cccc7e6-3a39-b3b4-feaf-85a3faa58570@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: dGFDklUxK1mPdfJzLpXjzFcSYk_ZmlDd
X-Proofpoint-GUID: Np6po_7yXNh0DAMOXfeAhoM8cvVtN9zQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-06_02,2023-04-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 malwarescore=0
 spamscore=0 bulkscore=0 mlxlogscore=925 mlxscore=0 adultscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304060066
X-TUID: +RxePrcyp+iw

T24gNC82LzIzIDA5OjUwLCBUaG9tYXMgSHV0aCB3cm90ZToNCj4gT24gMDUvMDQvMjAyMyAx
OC4wNCwgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgd3JvdGU6DQo+PiBQcm90ZWN0ZWQgVmly
dHVhbGl6YXRpb24gaXMgc3BlY2lmaWMgdG8gS1ZNLg0KPj4gUmVuYW1lIHRoZSBmaWxlIGFz
ICdwdi1rdm0uYycgdG8gbWFrZSB0aGlzIGNsZWFyZXIuDQo+Pg0KPj4gU2lnbmVkLW9mZi1i
eTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEBsaW5hcm8ub3JnPg0KPj4gLS0t
DQo+PiAgICBody9zMzkweC97cHYuYyA9PiBwdi1rdm0uY30gfCAwDQo+PiAgICBody9zMzkw
eC9tZXNvbi5idWlsZCAgICAgICAgfCAyICstDQo+PiAgICAyIGZpbGVzIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+PiAgICByZW5hbWUgaHcvczM5MHgve3B2
LmMgPT4gcHYta3ZtLmN9ICgxMDAlKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9ody9zMzkweC9w
di5jIGIvaHcvczM5MHgvcHYta3ZtLmMNCj4+IHNpbWlsYXJpdHkgaW5kZXggMTAwJQ0KPj4g
cmVuYW1lIGZyb20gaHcvczM5MHgvcHYuYw0KPj4gcmVuYW1lIHRvIGh3L3MzOTB4L3B2LWt2
bS5jDQo+PiBkaWZmIC0tZ2l0IGEvaHcvczM5MHgvbWVzb24uYnVpbGQgYi9ody9zMzkweC9t
ZXNvbi5idWlsZA0KPj4gaW5kZXggZjI5MTAxNmZlZS4uMmY0M2I2YzQ3MyAxMDA2NDQNCj4+
IC0tLSBhL2h3L3MzOTB4L21lc29uLmJ1aWxkDQo+PiArKysgYi9ody9zMzkweC9tZXNvbi5i
dWlsZA0KPj4gQEAgLTIyLDcgKzIyLDcgQEAgczM5MHhfc3MuYWRkKHdoZW46ICdDT05GSUdf
S1ZNJywgaWZfdHJ1ZTogZmlsZXMoDQo+PiAgICAgICd0b2Qta3ZtLmMnLA0KPj4gICAgICAn
czM5MC1za2V5cy1rdm0uYycsDQo+PiAgICAgICdzMzkwLXN0YXR0cmliLWt2bS5jJywNCj4+
IC0gICdwdi5jJywNCj4+ICsgICdwdi1rdm0uYycsDQo+PiAgICAgICdzMzkwLXBjaS1rdm0u
YycsDQo+PiAgICApKQ0KPj4gICAgczM5MHhfc3MuYWRkKHdoZW46ICdDT05GSUdfVENHJywg
aWZfdHJ1ZTogZmlsZXMoDQo+IA0KPiBIbW1tLCBtYXliZSB3ZSBzaG91bGQgcmF0aGVyIG1v
dmUgaXQgdG8gdGFyZ2V0L3MzOTB4L2t2bS8gaW5zdGVhZD8NCj4gDQo+IEphbm9zY2gsIHdo
YXQncyB5b3VyIG9waW5pb24/DQo+IA0KPiAgICBUaG9tYXMNCj4gDQo+IA0KDQpEb24ndCBj
YXJlIGFzIGxvbmcgYXMgdGhlIGZpbGUgaXMgbm90IGRlbGV0ZWQgOikNCg==
