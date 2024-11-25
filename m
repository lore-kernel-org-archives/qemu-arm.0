Received: by 2002:a17:505:4c56:b0:1be9:327d:8ee3 with SMTP id do22csp1644647njc;
        Mon, 25 Nov 2024 14:23:48 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWE7l2SgjiZ3hoIVEvbQKBDE7w8BV9VuR/tRqEYjRKg0eMzze1201yFtkQ1q8ysTok/6l8VqcNO5KC6kQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEW7aO5OQCvEwJoj4cLntAwWpulR32BQ8kVv2ZZVZ78Vo0Z+lZy+GUBDsM1Cp9CS6VQMgoE
X-Received: by 2002:a05:6902:2747:b0:e30:d89f:1342 with SMTP id 3f1490d57ef6-e38f8b5b364mr14436624276.24.1732573428132;
        Mon, 25 Nov 2024 14:23:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732573428; cv=none;
        d=google.com; s=arc-20240605;
        b=NkYb54+5OkYrL6e+md6LaQc8TUNj69Vj/JKtMorL9aL71Tabiz0mTXnWoX7CWXCEoc
         4c65Kb2gD+yjJxeIpq61tzCzOgc2SXm0ExkVZpxI2CvU03B9dihcpH8hSU7ReMe+vFaR
         cmLMbUWWro6x88AYUzJ1f6cnLdaJNzt7/HhHDyXqpAkA+phMWoS3TgK54he2KYETEU7P
         RH920MxSMdlFo5cvWttjqa8ZJG0QJNSf/lalbgoScv/Zvrm/2sgCCuWGowXn5wy1YkJb
         d9bYModrH5EsC79yNq8/2uZ6wLFSfkgxWjHHH/5LkLLL5VUNIv0W1CKoaThf+s2Hv9Pd
         Vz4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=hl0W97p6w9FgWuDPAhRVlfOd/xrJ2KPqIH65Bh1c3pM=;
        fh=Dx1sjjFp9BB26a1D0a1CdYq+PQ7jSGG6ce+e13SfTYM=;
        b=BUVA7jMzuSj7rImTgadfPzhatRbrxQy77XJBZ7ik2b2Nq6+VItoOuGvzJyFKwL8BrO
         y/b680ZOXxGrOZWNIA460FzBxfFFY9oLcYpXW124zBsfp+5dhs1BAXpGXjPbbdZJ4KnS
         62EL/VaUHpnvrtpoNYWu+RiLvMkH3mkD5DAT+fXLND9CgRLHJNRuqQjXlOi4cXB7/iWm
         D6kKrpeJkCWzb/AMi43eE3CYdshsMaKswpcDi1DMYG2wLBJvk1USMS8vflwuTzzD7y/6
         EHq+uP3mM5PBiCK/YPnz4/9XgbJiUcJw5mgBMkZW2wMrfJCMao0egNVYAdYvV5IYN806
         ksqA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=FgkwZSzk;
       spf=pass (google.com: domain of stefanb@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=stefanb@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <stefanb@linux.ibm.com>
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com. [148.163.158.5])
        by mx.google.com with ESMTPS id 3f1490d57ef6-e38f64d3c11si6448150276.643.2024.11.25.14.23.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 25 Nov 2024 14:23:48 -0800 (PST)
Received-SPF: pass (google.com: domain of stefanb@linux.ibm.com designates 148.163.158.5 as permitted sender) client-ip=148.163.158.5;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=FgkwZSzk;
       spf=pass (google.com: domain of stefanb@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=stefanb@linux.ibm.com;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4APCZFD4021731;
	Mon, 25 Nov 2024 22:23:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=hl0W97
	p6w9FgWuDPAhRVlfOd/xrJ2KPqIH65Bh1c3pM=; b=FgkwZSzkwHkOIFtKkNx+Ta
	b5saTIR4TQ/avYgyAajk+nj/suiJ0Qi3P9IXXT9/9jrO7h1DJQ6dPsVKuajFoxZ/
	88TH6ljcgiJu08kD8s5Q+CuZ879i3O9epd8YVpxyMPURol9x7rC595Rn5KIFMmRn
	nX8oMbjf+QPshoCDjkNKv+bDy7lSquCCjQYEzhHzKp9o7WDx6/IRRsl9nsfCwkp5
	AubHyEP0/8uH+MOC75IlOf+LNuY0CKBUXjqCfo5OBd888H2M8rIz8F8RtXg/wM+P
	IEYuQLdvXJ0FRG857zQm7P8OXRPk/gehvgbbJMSJ0J4o2b5AD1fbDQwxMA5tc/ww
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43386jthr4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 22:23:47 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4APIkeeq023983;
	Mon, 25 Nov 2024 22:23:46 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 433scrub7n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 22:23:46 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4APMNjDd25232032
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 25 Nov 2024 22:23:45 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 823285805A;
	Mon, 25 Nov 2024 22:23:45 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0548A58052;
	Mon, 25 Nov 2024 22:23:45 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 25 Nov 2024 22:23:44 +0000 (GMT)
Message-ID: <02b90518-2996-4231-bee9-43ce313669b0@linux.ibm.com>
Date: Mon, 25 Nov 2024 17:23:44 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 25/26] target/arm/kvm-rme: Add measurement log
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, peter.maydell@linaro.org
Cc: richard.henderson@linaro.org, philmd@linaro.org, qemu-arm@nongnu.org,
        qemu-devel@nongnu.org, alex.bennee@linaro.org,
        Stefan Berger <stefanb@linux.vnet.ibm.com>
References: <20241125195626.856992-2-jean-philippe@linaro.org>
 <20241125195626.856992-27-jean-philippe@linaro.org>
Content-Language: en-US
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <20241125195626.856992-27-jean-philippe@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: wP5AzLSAVRPk9PJbLWf9gHULLnygDy-2
X-Proofpoint-GUID: wP5AzLSAVRPk9PJbLWf9gHULLnygDy-2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 mlxlogscore=707 spamscore=0 suspectscore=0 phishscore=0 clxscore=1011
 mlxscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411250183
X-TUID: gwwFWjb3j0u6



On 11/25/24 2:56 PM, Jean-Philippe Brucker wrote:
> Create an event log, in the format defined by Trusted Computing Group
> for TPM2. It contains information about the VMM, the Realm parameters,
> any data loaded into guest memory before boot and the initial vCPU
> state.
> 
> The guest can access this log from RAM and send it to a verifier, to
> help the verifier independently compute the Realm Initial Measurement,
> and check that the data we load into guest RAM is known-good images.
 > Without this log, the verifier has to guess where everything is 
loaded> and in what order.

Typically these logs are backed by extensions of TPM PCRs and when you 
send a log to a verifier you send a TPM quote along with it for the 
verifer to replay the log and check the TPM quote. Also, early code in 
the firmware is typically serving as a root of trust that starts the 
chain of measurements of code and data, first measuring itself and then 
other parts of the firmware before it jumps into the other parts. Now 
here you seem to just have a log and no PCR extensions and therefore no 
quote over PCRs can be used. Then what prevents anyone from faking this 
log and presenting a completely fake log to the verifier?

