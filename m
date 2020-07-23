Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1304767lfm;
        Wed, 22 Jul 2020 20:34:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxjUDK2VzMCocUuMVLIzOHFotMt1HFPUTNlBWGDPalA5WnjwUZ0R7bfz/Vr/elweag7/uc4
X-Received: by 2002:a17:902:8a88:: with SMTP id p8mr2182476plo.184.1595475270540;
        Wed, 22 Jul 2020 20:34:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595475270; cv=none;
        d=google.com; s=arc-20160816;
        b=z9JMnEXMbHzEF41LoQ+nSsnsNm+7qlNJDYgVAkJ7eUh1X15TSSbgMEMMGlg+RqYt89
         pmO5FS5DvMhfquPTBPzcALECp0BQ/QXs2utyzfWURHnApn6FGRTm3shsq73Cn9Lcco+p
         t3MoRpLQLZY4DJ79Fcx5l5jQWtBdMI8O3r1pby7U5g6sUCHt+Iy+SMNlAnzN9Xf9Bgwg
         uTOcYBdfrTuWpuskdyqN83fTpYGT8A33FhFH3YCwJgo4ZciNGUdUMPt0wAXKcmccXqOT
         AEXOoKghGqutxmQuVHuyirrtdYY4mf0XCe5Q0e35b6tJ1wfoU6VEFwD1W2XwFRs5tkKt
         +R2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:in-reply-to
         :subject:cc:to:from:user-agent:references;
        bh=UBtnRHI4q5+P5eznASXTvXIMRkH/w099SI9BkaGUVOI=;
        b=OcFMqWA+LWhvMHqYwffNt7pHX9saG+raUoT2zB2M7QphaoYkuW4sWQ1zG0f5e0rxa2
         AvuRxWEJ9+qCKhqS4tQ5XKG9msTrkgzqRBBSUbNZL64dkqU66XCNfQd2+FSnpdcd9L7q
         xyfBSly2PZF8Ii0EWPuWSxBAQgjbmiccngM4xYi90sFrJ4lHmVhIjxNopWpFc6tvKsDT
         gkX8enomj32E4tvtiKKdQ82CdSW+vYyFQrpnoVca8+A1Mni05S5/gho5dXl8/7pEchVR
         6l74lWoDmOsPqw86OzEyX+pcySTYs4VzM3h1Bw2/AEiTLoTbbNir3bUNvKcRf2QyguCX
         0MzA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <bauerman@linux.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com. [148.163.156.1])
        by mx.google.com with ESMTPS id e24si946262pgt.153.2020.07.22.20.34.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 22 Jul 2020 20:34:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.156.1 as permitted sender) client-ip=148.163.156.1;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 06N3XrtV011030;
	Wed, 22 Jul 2020 23:34:07 -0400
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com with ESMTP id 32bvqx864b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jul 2020 23:34:06 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06N3Y40G011276;
	Wed, 22 Jul 2020 23:34:05 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com [169.63.121.186])
	by mx0a-001b2d01.pphosted.com with ESMTP id 32bvqx862v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jul 2020 23:34:04 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
	by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06N3L74i021535;
	Thu, 23 Jul 2020 03:33:56 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
	by ppma03wdc.us.ibm.com with ESMTP id 32brq9hajj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jul 2020 03:33:56 +0000
Received: from b03ledav006.gho.boulder.ibm.com (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
	by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 06N3XrtG7995874
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Jul 2020 03:33:53 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C2B3FC6055;
	Thu, 23 Jul 2020 03:33:55 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9A625C6057;
	Thu, 23 Jul 2020 03:33:50 +0000 (GMT)
Received: from morokweng.localdomain (unknown [9.211.93.190])
	by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS;
	Thu, 23 Jul 2020 03:33:49 +0000 (GMT)
References: <20200723025657.644724-1-bauerman@linux.ibm.com> <20200723025657.644724-2-bauerman@linux.ibm.com> <20200723030609.GL5513@umbus.fritz.box>
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
        Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH v3 1/8] target/arm: Move start-powered-off property to generic CPUState
In-reply-to: <20200723030609.GL5513@umbus.fritz.box>
Date: Thu, 23 Jul 2020 00:33:47 -0300
Message-ID: <87imeesy5g.fsf@morokweng.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-07-22_17:2020-07-22,2020-07-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 spamscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007230026
X-TUID: 6upwvHBUMHu8


David Gibson <david@gibson.dropbear.id.au> writes:

> On Wed, Jul 22, 2020 at 11:56:50PM -0300, Thiago Jung Bauermann wrote:
>> There are other platforms which also have CPUs that start powered off, so
>> generalize the start-powered-off property so that it can be used by them.
>>=20
>> Note that ARMv7MState also has a property of the same name but this patch
>> doesn't change it because that class isn't a subclass of CPUState so it
>> wouldn't be a trivial change.
>>=20
>> This change should not cause any change in behavior.
>>=20
>> Suggested-by: Eduardo Habkost <ehabkost@redhat.com>
>> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>> Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
>
> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

Thanks! Sory about the extra work.

--=20
Thiago Jung Bauermann
IBM Linux Technology Center
