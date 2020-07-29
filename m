Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp1086290lfy;
        Tue, 28 Jul 2020 17:57:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyI4e39FTBiCEr6SdrqdHmG8O5kcL7k82f3q0HrKPhJhcWluT4dBQP9qhhV/bsfBzSWIGdm
X-Received: by 2002:a5b:4ca:: with SMTP id u10mr47794426ybp.128.1595984224227;
        Tue, 28 Jul 2020 17:57:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595984224; cv=none;
        d=google.com; s=arc-20160816;
        b=C5y8HSA4EcO3cF0A6xGUH3sWJUWNvJFRk9/rZhRX+8Yq849UWW1sS7B4VjuoWLNrkI
         2TPHbPWUT6UjebAGLjCQQOVCHFiz7g7nUXoPk8qZuh+gnpmSgewoPvw+QYfeHM/eKCFy
         TcsNehtly0Pf2u3R8aKH67Y3EpkdbRhsrOA3grAoCoIzplyfIBrAASpHTnp1Z19uS4zL
         d9o0I9vdFCoS/eoVNWHRMfTMpchoeygn/TqUDE2S+n2OT/+UekVDqxyIYWvClYNnDXcb
         yHVDkkMQWt0f/KV5D/HK90efIXod5Ne2mmmyY1bIIxOX1o5PWolVXuOS7jH6mHv8bCci
         2JjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:in-reply-to:subject:cc:to:from
         :user-agent:references;
        bh=0kletye4CLMMa6gmlP/sYB7AbqWcWuGQsMAVfc+yy50=;
        b=1K+bEh1/QmmMkU6DAHsTOIkACczuuaTVRV1jupzw/pq0TuKxVgQYqVAN7RqQAB+hzm
         tKnxGlE7AOSj+sWIEAAkQ54fNw0pMjeehFkjq/Q8udlCWqycIV1A4AX9shxp+lV5Bjrd
         UYE4JJ6gWqyqM5jCHGZVw1B0WEzAAqYzihrNEHhIyY3zCJgSkALNgRDv6Gr1lNM0S/8C
         UnZJrMdW986UwH6BYy3yaCuRLfAxx8C9bl/BRzVsuJgexbBiU6SSZ1TxyO7oPOJe/mrx
         jGl7bblDrx7rRKBgsj+UyEVqUsZghXQJ/Wtr0pmqoAbQ6Rjglv88kw4cG4fr9UowF8a9
         bJ4g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <bauerman@linux.ibm.com>
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com. [148.163.158.5])
        by mx.google.com with ESMTPS id e2si487624ybp.416.2020.07.28.17.57.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Jul 2020 17:57:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.158.5 as permitted sender) client-ip=148.163.158.5;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 06T0Uowh097067;
	Tue, 28 Jul 2020 20:56:48 -0400
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com with ESMTP id 32jqrsbv2r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Jul 2020 20:56:47 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06T0VY5q098886;
	Tue, 28 Jul 2020 20:56:47 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com [169.47.144.27])
	by mx0a-001b2d01.pphosted.com with ESMTP id 32jqrsbv2f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Jul 2020 20:56:47 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
	by ppma05wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06T0tkXk030327;
	Wed, 29 Jul 2020 00:56:46 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com [9.57.198.25])
	by ppma05wdc.us.ibm.com with ESMTP id 32gcy9nryh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Jul 2020 00:56:46 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com [9.57.199.110])
	by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 06T0ukmf26673480
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 29 Jul 2020 00:56:46 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 43413AE05F;
	Wed, 29 Jul 2020 00:56:46 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E7F12AE05C;
	Wed, 29 Jul 2020 00:56:39 +0000 (GMT)
Received: from morokweng.localdomain (unknown [9.163.54.39])
	by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
	Wed, 29 Jul 2020 00:56:39 +0000 (GMT)
References: <20200723025657.644724-1-bauerman@linux.ibm.com>
User-agent: mu4e 1.2.0; emacs 26.3
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: qemu-ppc@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
        David Hildenbrand
 <david@redhat.com>, qemu-devel@nongnu.org,
        Jiaxun Yang
 <jiaxun.yang@flygoat.com>,
        Aleksandar Markovic
 <aleksandar.qemu.devel@gmail.com>,
        Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>,
        Thomas Huth <thuth@redhat.com>,
        David Gibson
 <david@gibson.dropbear.id.au>,
        Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@redhat.com>,
        Artyom Tarasenko <atar4qemu@gmail.com>,
        Aleksandar
 Rikalo <aleksandar.rikalo@syrmia.com>,
        Eduardo Habkost
 <ehabkost@redhat.com>, Greg Kurz <groug@kaod.org>,
        qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Richard Henderson <rth@twiddle.net>, Cornelia Huck <cohuck@redhat.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v3 0/8] Generalize start-powered-off property from ARM
In-reply-to: <20200723025657.644724-1-bauerman@linux.ibm.com>
Date: Tue, 28 Jul 2020 21:56:36 -0300
Message-ID: <878sf3uojf.fsf@morokweng.localdomain>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-07-28_17:2020-07-28,2020-07-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 lowpriorityscore=0 clxscore=1015 mlxlogscore=683 bulkscore=0
 spamscore=0 adultscore=0 impostorscore=0 suspectscore=1 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007280173
X-TUID: t4Rm/gjtpsdV


Thiago Jung Bauermann <bauerman@linux.ibm.com> writes:

> The ARM code has a start-powered-off property in ARMCPU, which is a
> subclass of CPUState. This property causes arm_cpu_reset() to set
> CPUState::halted to 1, signalling that the CPU should start in a halted
> state. Other architectures also have code which aim to achieve the same
> effect, but without using a property.
>
> The ppc/spapr version has a bug where QEMU does a KVM_RUN on the vcpu
> before cs->halted is set to 1, causing the vcpu to run while it's still in
> an unitialized state (more details in patch 3).

Since this series fixes a bug is it eligible for 5.1, at least the
patches that were already approved by the appropriate maintainers?

-- 
Thiago Jung Bauermann
IBM Linux Technology Center
