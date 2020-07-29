Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp1083294lfy;
        Tue, 28 Jul 2020 17:52:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzY+6Kq7f9m5HDLCnLIt4HOA3cSW7GEltDHE+4frWw9pPZcDjab+tjAsxw4/uUFWJfJ7PWK
X-Received: by 2002:a25:1102:: with SMTP id 2mr46882867ybr.469.1595983933132;
        Tue, 28 Jul 2020 17:52:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595983933; cv=none;
        d=google.com; s=arc-20160816;
        b=k+FhVPBcZSRUqf7Z7YwxS8xKkkZs+n36Gs32OlwYeSxAY7e2Fu6x4rC8vg5Mzg12V9
         kSQw3z/ZtFEjqirZtKMj/9GtdGzkfbN28L46kG7LoiZklpJkUYtnyDHBgdEuMPe6wVMO
         PegGfsldcGRykv8/1+R53ErWFowv5wa//JtJ6PDJ9dD9yPo7RxrrQCmcZu2IZsX8bwFP
         oHr+IrTOgShNOi08Dg5rQsKFFHMf3ArsyNWsLWCueSXQda669L4oku0RZptv0fJIVQI6
         ONz1nmuOkOiGTcoIHLr/0VZaJXfNPalNEcwZFZsgmT5XjJn+7KPdg03vmEkDT7L8zNp4
         buBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:in-reply-to:subject:cc:to:from
         :user-agent:references;
        bh=NRQ0A6fyVuMZME3IMMgWQ68ahM6TTrbd/jw081Aruc4=;
        b=AxcIxyx6AG7YQQIcXtLaTZYKHjCK1zjMQCAghp507etvW5qZtZF9gc+LgakRMwlvZn
         wgdZsa+WkcV/yNbxe3b8ty4f+Va10Rryj+Z0ljgmn743QrEm+Ar2j2LwuHMrSsbXuyz3
         dCxQNnaqK0wjk4dhakNDwRobATulEh5uVoyRGU1Rs5dQAc1bi2pO6aHF2KebVX2FRffq
         +lUliU+a3t37SCIYjSOkoycKRWX+6N0cR79bDrByj/zcbhAZguJgSCJ4DH1sfWphuwCK
         UytvI5uuQv9o2Xva9/HkoXe20m21c8Y898wUtFI/FiUiBKjA4RiGut0W3uH0LF/2qk7m
         8tYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <bauerman@linux.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com. [148.163.158.5])
        by mx.google.com with ESMTPS id d74si492496ybh.58.2020.07.28.17.52.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Jul 2020 17:52:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.158.5 as permitted sender) client-ip=148.163.158.5;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 06T0VcFM046477;
	Tue, 28 Jul 2020 20:51:45 -0400
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com with ESMTP id 32j0a6dmjb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Jul 2020 20:51:45 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06T0cQR3070180;
	Tue, 28 Jul 2020 20:51:45 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
	by mx0b-001b2d01.pphosted.com with ESMTP id 32j0a6dmj2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Jul 2020 20:51:44 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
	by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06T0idmw011188;
	Wed, 29 Jul 2020 00:51:44 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com [9.57.198.26])
	by ppma02dal.us.ibm.com with ESMTP id 32gcy4d6r5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Jul 2020 00:51:44 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com [9.57.199.111])
	by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 06T0phho38535640
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 29 Jul 2020 00:51:43 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5F184AC05B;
	Wed, 29 Jul 2020 00:51:43 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 21C98AC059;
	Wed, 29 Jul 2020 00:51:36 +0000 (GMT)
Received: from morokweng.localdomain (unknown [9.163.54.39])
	by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
	Wed, 29 Jul 2020 00:51:35 +0000 (GMT)
References: <20200723025657.644724-1-bauerman@linux.ibm.com> <20200723025657.644724-9-bauerman@linux.ibm.com> <20200727144350.47abd7e7.cohuck@redhat.com>
User-agent: mu4e 1.2.0; emacs 26.3
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
        qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
        "Paolo
 Bonzini" <pbonzini@redhat.com>,
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
        Artyom Tarasenko <atar4qemu@gmail.com>, Thomas Huth <thuth@redhat.com>,
        David Hildenbrand <david@redhat.com>,
        Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
        =?utf-8?Q?Al?=
 =?utf-8?Q?ex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Greg Kurz
 <groug@kaod.org>
Subject: Re: [RFC PATCH v3 8/8] target/s390x: Use start-powered-off CPUState property
In-reply-to: <20200727144350.47abd7e7.cohuck@redhat.com>
Date: Tue, 28 Jul 2020 21:51:33 -0300
Message-ID: <87a6zjuoru.fsf@morokweng.localdomain>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-07-28_17:2020-07-28,2020-07-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 adultscore=0
 mlxscore=0 mlxlogscore=999 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007280173
X-TUID: KFb100dQIw1i


Hi,

Cornelia Huck <cohuck@redhat.com> writes:

> On Wed, 22 Jul 2020 23:56:57 -0300
> Thiago Jung Bauermann <bauerman@linux.ibm.com> wrote:
>
>> Instead of setting CPUState::halted to 1 in s390_cpu_initfn(), use the
>> start-powered-off property which makes cpu_common_reset() initialize it
>> to 1 in common code.
>> 
>> Note that this changes behavior by setting cs->halted to 1 on reset, which
>> didn't happen before.
>
> I think that should be fine, as we change the cpu state to STOPPED in
> the reset function, which sets halted to 1.

Nice, thanks for checking.

>> 
>> Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
>> ---
>>  target/s390x/cpu.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> NB: I was only able to test that this patch builds. I wasn't able to
>> run it.
>
> No noticeable difference under kvm, but running under tcg seems a bit
> more sluggish than usual, and I saw some pausing on reboot (after the
> bios handover to the kernel). Not sure if it were just flukes on my
> laptop, would appreciate if someone else could give it a go.

I tried today setting up a TCG guest, but didn't have success yet.
Will try some more tomorrow.

-- 
Thiago Jung Bauermann
IBM Linux Technology Center
