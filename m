Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp4841825lfc;
        Tue, 1 Sep 2020 11:40:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxOTEMexpbgnc+/1GtkzNn1qQhXqRyZbuP4e2NKtEwlWKphJbR4gDBZCSOILHU31tDEyJBP
X-Received: by 2002:a1f:2444:: with SMTP id k65mr2800874vkk.33.1598985616926;
        Tue, 01 Sep 2020 11:40:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598985616; cv=none;
        d=google.com; s=arc-20160816;
        b=KtDSETzwE1IF0rKhpSHlOKnAxQ5pk5vCQYyomWyI5wPdnPQ5JBdEGP8nG399MV2n3N
         vrJ+PVE5Dlj9QnzH+pC+l1iOMyHahDnwAJ+TM9A0jqHOC6ILc0n8zoHvgBWAc3FvCDGI
         fZZ9dlNfA8kStX+lJuhLJAmaaNiZJNywcWI4GkZ5UlzM+3ca8OzL/svnatbaQHXXixqn
         LTbu990wU8vSnW7RJBwWDbQf3YkR67vAIHG1/eQBJIwDizBLahPwnTcL2zy6tuHs52XA
         DQxYwcBGCGSV8vffPc8XfyPrScAviqCfVvcaR7kBRkvpSn7A+fsL5hIk29t0rM6o5KxZ
         OfXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:in-reply-to
         :subject:cc:to:from:user-agent:references:dkim-signature;
        bh=9h14+PISC/Rm6tO8J7o4jKPpgd7cER5eghf/Qz7HSyg=;
        b=EXMh++rSa/97j52K/XM6UJK0UEoaBUwyjTssRM2XqsEqitb4S8uS3ApDQWRjHX5Cyh
         gewbVFNjJOtD+hZjZFQiY6HeMOyEuDqkBOwdjNqwsLhFp4j6iyEr1c2o9a8wIEwISq8e
         XsOq1Ic0184Qv4Fd6MBgbPcRztINuqxBU02os76ATK8heNypC5Rucoh4f4/5UnPz1Kln
         adtZl9NSC9o7j5yLOSbhk1xtaGkgJxXlOgAZage3k0gr0SoqDdw7WK58n9u4Vci+tPRn
         8aJKrzCPDYuuHqFfVUMjlhKB9OsKSGIAFq9xjlYc4TwNYGdItQfnY5s1+K2gwtdzH4gP
         uxUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=roatwilL;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <bauerman@linux.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com. [148.163.158.5])
        by mx.google.com with ESMTPS id a19si721300uan.41.2020.09.01.11.40.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Sep 2020 11:40:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.158.5 as permitted sender) client-ip=148.163.158.5;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=roatwilL;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 081IWmm1181308;
	Tue, 1 Sep 2020 14:39:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=references : from : to :
 cc : subject : in-reply-to : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=9h14+PISC/Rm6tO8J7o4jKPpgd7cER5eghf/Qz7HSyg=;
 b=roatwilL1S/ngtcG6EYlaBy9BVeW8KI1ivG1t+bIJtRVZqG1K2s9aksPKlciUJpY3YLH
 c4kTOA1zQKyI/fkiZjSP8udtA+BYX8zLmCZQspF64kSWf/Os42H7fu46aUykSF1rISgx
 HZ2lo+FarefJOLnnD3Q5bjFBFD3whwh5c1TJDUEhGmmoZizmsVY0aaTU475QU/Qv4bDu
 jqHgsKNBK33yIloQNzoFBARMcVE/r5EmCycm8ayOxRlaTlH4wMaoGlTuneb2bk2s9y9f
 THZuGYzSVtbbI687gER0ON50pZPJLsUPnXOz8UscArBNCPf/PHJzH3RviovQ/yqkTcER Lw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com with ESMTP id 339smm4776-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Sep 2020 14:39:54 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 081IWwVo181986;
	Tue, 1 Sep 2020 14:39:53 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
	by mx0b-001b2d01.pphosted.com with ESMTP id 339smm476u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Sep 2020 14:39:53 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 081IXOXi007904;
	Tue, 1 Sep 2020 18:39:52 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
	by ppma01dal.us.ibm.com with ESMTP id 337en9gpng-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Sep 2020 18:39:52 +0000
Received: from b03ledav005.gho.boulder.ibm.com (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
	by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 081IdpG064291230
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 1 Sep 2020 18:39:51 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 72A0ABE051;
	Tue,  1 Sep 2020 18:39:51 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E2CA4BE04F;
	Tue,  1 Sep 2020 18:39:45 +0000 (GMT)
Received: from morokweng.localdomain (unknown [9.211.88.129])
	by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTPS;
	Tue,  1 Sep 2020 18:39:45 +0000 (GMT)
References: <20200826055535.951207-1-bauerman@linux.ibm.com>
 <20200826055535.951207-5-bauerman@linux.ibm.com>
 <eed4a3dd-2431-8f58-f716-067e86ddcdef@redhat.com>
User-agent: mu4e 1.4.10; emacs 27.1
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
        qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
        Paolo
 Bonzini <pbonzini@redhat.com>,
        Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>,
        Eduardo Habkost <ehabkost@redhat.com>,
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
        Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>,
        Greg
 Kurz <groug@kaod.org>, Igor Mammedov <imammedo@redhat.com>,
        =?utf-8?Q?C?=
 =?utf-8?Q?=C3=A9dric?= Le
 Goater <clg@kaod.org>
Subject: Re: [PATCH v7 4/8] ppc/e500: Use start-powered-off CPUState property
In-reply-to: <eed4a3dd-2431-8f58-f716-067e86ddcdef@redhat.com>
Date: Tue, 01 Sep 2020 15:39:43 -0300
Message-ID: <873641mjdc.fsf@morokweng.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-09-01_10:2020-09-01,2020-09-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 adultscore=0 bulkscore=0 phishscore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009010157
X-TUID: R7jAr+8OsLcW


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> On 8/26/20 7:55 AM, Thiago Jung Bauermann wrote:
>> Instead of setting CPUState::halted to 1 in ppce500_cpu_reset_sec(), use
>> the start-powered-off property which makes cpu_common_reset() initialize=
 it
>> to 1 in common code.
>>=20
>> Also change creation of CPU object from cpu_create() to object_new() and
>> qdev_realize_and_unref() because cpu_create() realizes the CPU and it's =
not
>> possible to set a property after the object is realized.
>>=20
>> Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
>> ---
>>  hw/ppc/e500.c | 13 +++++++++----
>>  1 file changed, 9 insertions(+), 4 deletions(-)
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Thanks!

--=20
Thiago Jung Bauermann
IBM Linux Technology Center
