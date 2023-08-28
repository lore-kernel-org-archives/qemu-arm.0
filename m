Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp3259011ejc;
        Mon, 28 Aug 2023 14:13:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEb5BoWP1wTqtKyz55AeQ/nRsgE2Cyz0NWKnk+gyMXAYBCXzXTDH762We3kFg4HftM7jJh+
X-Received: by 2002:a05:620a:4147:b0:762:3567:a64c with SMTP id k7-20020a05620a414700b007623567a64cmr1079585qko.11.1693257236254;
        Mon, 28 Aug 2023 14:13:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693257236; cv=none;
        d=google.com; s=arc-20160816;
        b=A2e4mkwq2JpSmw/kkCtcoLaNFUI7CFcJg1CB/VtXSIz2ic2DlzGQFJh8HxOWt0OC00
         J6eb65C35cF7MxZzJHOr3Zt8XVMEhPGe8W30xcV1gRnJ0Y5KM7WWQzTYpr8rM1BpleXE
         iGK1OevC+PmMeML1Qn8jovc24LoNyGBbKqEWnXtwdf7Wc2idNe51e4Iot4U+RqZXGQCa
         ANiqioexkq3XMQpzEIEOUvk/wcSB4BKj2M/mH/NkKOqvLLppSIGclMjCgwGHn0eNic9F
         WkBaGsMgq3RSqppik5PLSAf9nRb1FgI2bEd818Qi00xbXsgupjaezmeqdfnuI7ZRGNrb
         sY/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=4uDvgMJ/N99UKaSPnjFAAAGk+jQ2jq5R3+otKSouK+4=;
        fh=qQF6XPxx2e1AjuTslutjFfzFHzBhsLrAiDdr9XQ+sOw=;
        b=GIqiBTKrxQvdgoG3Be0RW0WPPrTysTGKb8Edp1jzOUeKRflvwnB9ftRlGMSrMuYp+6
         LEPg63Jx/u4mh9UE6Zpttdpl1wKuByfVm+gkbcNL7DdkwsV4VeLo49oghuBqx7wZ1q2P
         YEe6kFC0fElNdFfEfv8hYzhoTY2493B6W1k8OMjKncro/65YkLHvgTcgQVj1GrUXEwFq
         VfLMUxgKjQohjh0EXBktTA4rlV9avtBCl/LvnYJ7u1vxpjs/hhrkMjRtAzJ/A4mj7wQa
         q9U8MPD297LKwLmK0KnLpso2AW+GKrl4rExfqr3YblS2Oiyp+SOfkI/dPXq1d+oyLstH
         VsAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=AfL8RMpR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id sn20-20020a05620a949400b00768b6bc7aa0si4799965qkn.713.2023.08.28.14.13.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Aug 2023 14:13:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=AfL8RMpR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qajYS-0000qC-53; Mon, 28 Aug 2023 17:13:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1qajYO-0000pT-F5; Mon, 28 Aug 2023 17:13:44 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1qajYL-000231-5d; Mon, 28 Aug 2023 17:13:43 -0400
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37SKf6oN002944; Mon, 28 Aug 2023 21:13:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=4uDvgMJ/N99UKaSPnjFAAAGk+jQ2jq5R3+otKSouK+4=;
 b=AfL8RMpRDY2tC4poddsdgDmkvxpzcy7PdqJ3jzor0sJiEjv6YbyZZDyxX9UZgb1ZQ2XI
 TCCS7cOxv4f6TTQj2/qzxBnVHfPO7L/sHtUjTS54oN3AGCMfmPLg++FzCwotEd1cD4Ks
 RZ/5lZYVc6LrMMaXtF0sGtxBeafS7sED4vIvuAeBz7mECBqzP/QJHt5vqzg7WOW69/JD
 5SHweXJ3kYqTgN8g39dBJ+W8hGSdDOtnngxd+zggkg5t/5nIyEQLtaRh3TgX+/MiGWeA
 GbtvgixtDKCKqiWCqsolqIf7GRFTz7aO2PrEnPd0IRPcyNAZI7jrP4NP9lZcivecMU4F EA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sr8q7gq8s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Aug 2023 21:13:24 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 37SLBHAL007427;
 Mon, 28 Aug 2023 21:13:23 GMT
Received: from ppma13.dal12v.mail.ibm.com
 (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sr8q7gq76-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Aug 2023 21:13:23 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
 by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 37SJAPFL014100; Mon, 28 Aug 2023 21:13:19 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
 by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3sqwxjnwc4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Aug 2023 21:13:19 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com
 [10.241.53.101])
 by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 37SLDIRB42402202
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Aug 2023 21:13:18 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E871E58051;
 Mon, 28 Aug 2023 21:13:17 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7456F5805C;
 Mon, 28 Aug 2023 21:13:17 +0000 (GMT)
Received: from [9.61.30.201] (unknown [9.61.30.201])
 by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 28 Aug 2023 21:13:17 +0000 (GMT)
Message-ID: <b1de4d8b-a8c1-488e-9d7b-62417dd40d59@linux.ibm.com>
Date: Mon, 28 Aug 2023 16:13:17 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/7] Introduce model for IBM's FSP
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>
Cc: qemu-devel@nongnu.org, clg@kaod.org, peter.maydell@linaro.org,
 andrew@aj.id.au, pbonzini@redhat.com, marcandre.lureau@redhat.com,
 berrange@redhat.com, thuth@redhat.com, philmd@linaro.org,
 qemu-arm@nongnu.org
References: <20230825203046.3692467-1-ninad@linux.ibm.com>
 <CACPK8XeDo7USEw6_fMYHhcdpRJsKGzj1-N+cdMBMu1a2ub_PZQ@mail.gmail.com>
From: Ninad Palsule <ninad@linux.ibm.com>
In-Reply-To: <CACPK8XeDo7USEw6_fMYHhcdpRJsKGzj1-N+cdMBMu1a2ub_PZQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 1jQ0oIZ6OBVei_N87-AThDJ1dxMay9YC
X-Proofpoint-ORIG-GUID: lTqYR89WUSHY4su1TzefUhNGyRDI8xNt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-28_18,2023-08-28_04,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 mlxlogscore=410 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 mlxscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308280181
Received-SPF: pass client-ip=148.163.158.5; envelope-from=ninad@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: qPej81L3F0LG

Hi Joel,

On 8/28/23 23:25, Joel Stanley wrote:
> Hi Ninad,
>
> On Fri, 25 Aug 2023 at 20:51, Ninad Palsule <ninad@linux.ibm.com> wrote:
>> Hello,
>>
>> Please review the patch-set.
>>
>> This is a first step towards introducing model for IBM's Flexible
>> Service Interface. The full functionality will be implemented over the
>> time.
> You have a typo in the subject, I think you meant to write FSI instead of FSP.

Good catch. Fixed the typo.

Thank you for the review.

Ninad

