Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp1017446lfy;
        Tue, 28 Jul 2020 16:04:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxdgR9oPWAXn3AoAvkwBv41itcNzNJWMiseBkP7xrwMYPQqHvTErEeNtyocsRdnn9vB8cbq
X-Received: by 2002:a62:b409:: with SMTP id h9mr26136623pfn.305.1595977451627;
        Tue, 28 Jul 2020 16:04:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595977451; cv=none;
        d=google.com; s=arc-20160816;
        b=fZYWwiCxPoVZ6JGOKZ3FmGfbeZ7ZM7qAeTTk8ar/dO6lKzlxwbdhzDPl/5d8Bzmkl8
         HrPt3N3FhRezgiYI5QBGc+Xqjk3vChuN8yR4AxaJ9hzAGj8VoZi1cJBDTeNqlzMrimyb
         Rh7G2l8apzcT0J2yWnU1xmIeaGtyCE74dt13skTvZNNxJ0g1vX1QZk1PTGybNpnyioa1
         PaOgLIYr0HAlSdU6ivKmGlCtnWYVqpxyZdzz2ARHhjPVOm8SjmTCaWehZEjRvYueboFL
         RvEnVKhUzQtx4SS9VQBgfYySH0qzOrg6FZcHT5N7rKVwRR68If8ygA0NLoeRiukhHW6/
         x2TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:in-reply-to:subject:cc:to:from
         :user-agent:references;
        bh=/5Y02m8PM33K8rRSpWKQ6HIGIWqx1KW2TEtgxAO1XqQ=;
        b=Cat6XmvWHoR5sKh4h5rCXhMbrGsjdnKoPiR6viYMuZSLuRxqQd0QUWVe4p1p7+XQgE
         qkBLTYDmYFRKbKjrtoPToQ5VzdU8pTYA41ARK8qdExD9xJD/XrszRC23k3WoYZ03vjPV
         OrrEvgvobuHU/R8vMwHepa8uh0qInWeAaCh9qBmRlAa9lJnrzj6ykyiJCJcpWvjZJezq
         PlXhUVrXmkoq9jcLq+qRkV2ttqOU+XCgcaKkJ4qKNLF0FpfVgGd6Uy0ozE0+2GLdlf9x
         Rf0pfqSSHcS1AfDqhFE0J2BsH89DZCzZXnLdQy5YehpsyCYDE4BI6ooT1NwYzg2A2lBl
         +auQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <bauerman@linux.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com. [148.163.156.1])
        by mx.google.com with ESMTPS id p67si190417pjp.77.2020.07.28.16.04.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Jul 2020 16:04:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.156.1 as permitted sender) client-ip=148.163.156.1;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 06SN2wfO055069;
	Tue, 28 Jul 2020 19:03:38 -0400
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com with ESMTP id 32hs1dfnam-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Jul 2020 19:03:38 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06SN2whd055056;
	Tue, 28 Jul 2020 19:03:38 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
	by mx0a-001b2d01.pphosted.com with ESMTP id 32hs1dfna5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Jul 2020 19:03:38 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
	by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06SMsU3V015338;
	Tue, 28 Jul 2020 23:03:36 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com [9.57.198.28])
	by ppma03dal.us.ibm.com with ESMTP id 32gcy74e4h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Jul 2020 23:03:36 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com [9.57.199.111])
	by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 06SN3abQ30474616
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 28 Jul 2020 23:03:36 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0B533AC062;
	Tue, 28 Jul 2020 23:03:36 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 403C3AC060;
	Tue, 28 Jul 2020 23:03:29 +0000 (GMT)
Received: from morokweng.localdomain (unknown [9.163.54.39])
	by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
	Tue, 28 Jul 2020 23:03:28 +0000 (GMT)
References: <20200723025657.644724-1-bauerman@linux.ibm.com> <20200723025657.644724-4-bauerman@linux.ibm.com> <20200727152828.133ee76a@bahia.lan>
User-agent: mu4e 1.2.0; emacs 26.3
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: Greg Kurz <groug@kaod.org>
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
        Artyom Tarasenko <atar4qemu@gmail.com>,
        Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
        "David
 Hildenbrand" <david@redhat.com>,
        Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@redhat.com>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH v3 3/8] ppc/spapr: Use start-powered-off CPUState property
In-reply-to: <20200727152828.133ee76a@bahia.lan>
Date: Tue, 28 Jul 2020 20:03:24 -0300
Message-ID: <87bljzuts3.fsf@morokweng.localdomain>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-07-28_17:2020-07-28,2020-07-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 phishscore=0 spamscore=0
 clxscore=1015 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007280164
X-TUID: 17oSPCxXwXqA


Greg Kurz <groug@kaod.org> writes:

> On Wed, 22 Jul 2020 23:56:52 -0300
> Thiago Jung Bauermann <bauerman@linux.ibm.com> wrote:
>
>> PowerPC sPAPR CPUs start in the halted state, and spapr_reset_vcpu()
>> attempts to implement this by setting CPUState::halted to 1. But that's too
>> late for the case of hotplugged CPUs in a machine configure with 2 or more
>> threads per core.
>> 
>> By then, other parts of QEMU have already caused the vCPU to run in an
>> unitialized state a couple of times. For example, ppc_cpu_reset() calls
>> ppc_tlb_invalidate_all(), which ends up calling async_run_on_cpu(). This
>> kicks the new vCPU while it has CPUState::halted = 0, causing QEMU to issue
>> a KVM_RUN ioctl on the new vCPU before the guest is able to make the
>> start-cpu RTAS call to initialize its register state.
>> 
>> This problem doesn't seem to cause visible issues for regular guests, but
>> on a secure guest running under the Ultravisor it does. The Ultravisor
>> relies on being able to snoop on the start-cpu RTAS call to map vCPUs to
>> guests, and this issue causes it to see a stray vCPU that doesn't belong to
>> any guest.
>> 
>> Fix by setting the start-powered-off CPUState property in
>> spapr_create_vcpu(), which makes cpu_common_reset() initialize
>> CPUState::halted to 1 at an earlier moment.
>> 
>> Suggested-by: Eduardo Habkost <ehabkost@redhat.com>
>> Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
>> ---
>
> Thanks for doing this ! I remember seeing partly initialized CPUs being
> kicked in the past, which is clearly wrong but I never got time to find
> a proper fix (especially since it didn't seem to break anything).
>
> Reviewed-by: Greg Kurz <groug@kaod.org>

Thanks for confirming the issue, and for reviewing the code.

-- 
Thiago Jung Bauermann
IBM Linux Technology Center
