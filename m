Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp952866lfy;
        Wed, 19 Aug 2020 19:05:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyGZv/whlasPAcCzwcQJ4wTW1Yu3zViHgzMbWh5DMK6LknCbsBSV7aXY9a4urJzxN3Etr3i
X-Received: by 2002:a25:2fcc:: with SMTP id v195mr1730972ybv.119.1597889130290;
        Wed, 19 Aug 2020 19:05:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597889130; cv=none;
        d=google.com; s=arc-20160816;
        b=zwwbiFNUE2LeylQDOHeOgYkIkTLB/DnAtNQvgCb84tDCMvnA698QZb15Ksa9+Qpm7M
         kOE0Tzn+e0/fNFmrcXiZO+76ixK24lJMBFDMn3Rp/5fo+wHSxoYa3Gdj5YLWPsuaMdy5
         0+nGW+J6g3lfyZJKmSfl2zaLXx+S6IItCsEcqp5vhkPRZi4PxAYp+s4GNDeCcaqJfa1y
         LLAyGgrIbQSUJTyvmnQ0PHb55Nb4R4gGb2kKroO3FwZD8CLCUzojc49aFeqG2EXMPpLS
         IdXbJ8SU4a+sCtxtV41dRdipYD5gykZbeefQtSWxYjVPvkRHW8qVEw3BuI5eSje6dGdv
         tlRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:in-reply-to:subject:cc:to:from
         :user-agent:references:dkim-signature;
        bh=bHtkBZF/0DvT0qnqLDcGx2xX8saex/9U394LNAvcdZw=;
        b=MsTW/4Q1wnoNM92MtqUpoR7+Ub3zJQk6nNuy/AJ1n0qUQBdcWBQsj+kdcTR6PgcM8d
         ELnVZOXSE0ZzzsaQotL45SL80RcWj11IwkXs9w4Zp4FfH7J8EquZ9QKw9uQC+X7VXn4v
         0VMZ79xqFDHzqrIe8krLwq63+SpfgvYCUe0aWjEWIKCyF/k98j9lDF52G8LKYV4klZ+d
         EY5PrNPVyg/KLsMZWzZ6h2tHPef89dR/fI9Eh8ZG5gjiLsRfIvotVCNM32kWH8u8UlUh
         gEerTBw/bFTEnwn/Pwu+7SNkaHroRwXmhzKvMrA/9JMCBFT5ZpfRp284xUeVrst3lRwd
         VK7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=UjK32U5j;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <bauerman@linux.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com. [148.163.158.5])
        by mx.google.com with ESMTPS id f8si631354ybm.367.2020.08.19.19.05.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 19 Aug 2020 19:05:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.158.5 as permitted sender) client-ip=148.163.158.5;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=UjK32U5j;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 07K21ndt179919;
	Wed, 19 Aug 2020 22:04:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=references : from : to :
 cc : subject : in-reply-to : date : message-id : mime-version :
 content-type; s=pp1; bh=bHtkBZF/0DvT0qnqLDcGx2xX8saex/9U394LNAvcdZw=;
 b=UjK32U5jQ8+PbcllzKSSlFPeV+WjCTEAsL5ClelNFmAhZ8Xi1NpEcBzqQhdsEdbeyvoP
 jPWpg+QOmO/rRkSRmseLg8lZbhdd9x9Qp4L/I94HTDqCk8sUl3CX2ztScNizS5caXMhE
 V8c+WF348LXLNGqmcso3SnEPxDSetM6JmlcVVHBIK034NGAo5bseix1jEcuIgZ9yFfln
 mhNtQBB4mIDR/F+Nf8qx0ltSgsUWSdD2pOST7fvq0vhzS/orBR0hm2TwQcV3fmA1MOwS
 IxMYpHuzF51CKIeRmbkA+a7plTJVOLPw9seskK9gjbCNxxxIvRw+CTM4CELYjIlpeKXw oQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com with ESMTP id 330ww9rqfa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Aug 2020 22:04:56 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07K226BR181652;
	Wed, 19 Aug 2020 22:04:56 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
	by mx0b-001b2d01.pphosted.com with ESMTP id 330ww9rqes-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Aug 2020 22:04:56 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
	by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07K1xZDA006323;
	Thu, 20 Aug 2020 02:04:55 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com [9.57.198.29])
	by ppma02dal.us.ibm.com with ESMTP id 3304ccvuq5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Aug 2020 02:04:55 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com [9.57.199.111])
	by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 07K24sr744237092
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 20 Aug 2020 02:04:54 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 478A4AC05E;
	Thu, 20 Aug 2020 02:04:54 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 56523AC05F;
	Thu, 20 Aug 2020 02:04:47 +0000 (GMT)
Received: from morokweng.localdomain (unknown [9.211.41.171])
	by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
	Thu, 20 Aug 2020 02:04:46 +0000 (GMT)
References: <20200819164306.625357-1-bauerman@linux.ibm.com> <20200820014238.GI271315@yekko.fritz.box>
User-agent: mu4e 1.2.0; emacs 26.3
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
        qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
        Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>,
        Eduardo Habkost
 <ehabkost@redhat.com>,
        Richard Henderson <rth@twiddle.net>,
        Peter Maydell
 <peter.maydell@linaro.org>,
        Aleksandar Markovic
 <aleksandar.qemu.devel@gmail.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Aleksandar Rikalo
 <aleksandar.rikalo@syrmia.com>,
        Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>,
        Artyom Tarasenko <atar4qemu@gmail.com>,
        Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
        David
 Hildenbrand <david@redhat.com>,
        Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@redhat.com>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Greg Kurz <groug@kaod.org>, Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v6 0/8] Generalize start-powered-off property from ARM
In-reply-to: <20200820014238.GI271315@yekko.fritz.box>
Date: Wed, 19 Aug 2020 23:04:43 -0300
Message-ID: <87h7sydqdg.fsf@morokweng.localdomain>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-08-19_13:2020-08-19,2020-08-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 mlxscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2008200010
X-TUID: AZ4E3m3SoIuC


David Gibson <david@gibson.dropbear.id.au> writes:

> On Wed, Aug 19, 2020 at 01:42:58PM -0300, Thiago Jung Bauermann wrote:
>> This version has one small fix in patch 7, and adds Philippe's Reviewed-bys.
>> 
>> Applies cleanly on dgibson/ppc-for-5.2.
>> 
>> Original cover letter below, followed by changelog:
>> 
>> 
>> The ARM code has a start-powered-off property in ARMCPU, which is a
>> subclass of CPUState. This property causes arm_cpu_reset() to set
>> CPUState::halted to 1, signalling that the CPU should start in a halted
>> state. Other architectures also have code which aim to achieve the same
>> effect, but without using a property.
>> 
>> The ppc/spapr version has a bug where QEMU does a KVM_RUN on the vcpu
>> before cs->halted is set to 1, causing the vcpu to run while it's still in
>> an unitialized state (more details in patch 3).
>> 
>> Peter Maydell mentioned the ARM start-powered-off property and
>> Eduardo Habkost suggested making it generic, so this patch series does
>> that, for all cases which I was able to find via grep in the code.
>> 
>> The only problem is that I was only able to test these changes on a ppc64le
>> pseries KVM guest, so except for patches 2 and 3, all others are only
>> build-tested. Also, my grasp of QOM lifecycle is basically non-existant so
>> please be aware of that when reviewing this series.
>> 
>> The last patch may be wrong, as pointed out by Eduardo, so I marked it as
>> RFC. It may make sense to drop it.
>
> Applied to ppc-for-5.2.

Great news. Thanks!

-- 
Thiago Jung Bauermann
IBM Linux Technology Center
