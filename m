Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp64813lfy;
        Wed, 12 Aug 2020 18:26:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTLiIUGrAYtC1njVqjfDf5anJy7Dv9+0/xU8r6THW9M3C4hfyss0PGqYYS3oMESV3oyE8/
X-Received: by 2002:a17:902:eb14:: with SMTP id l20mr1950938plb.6.1597282003340;
        Wed, 12 Aug 2020 18:26:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597282003; cv=none;
        d=google.com; s=arc-20160816;
        b=a1gwg4eJe+fVA6AWmct1D90iGCBfd5ZyZgPRM/WGB20NhIuCf/LE1fWf08a7CSLmEV
         MbWwbDxw+Ib6djEpiebiI0FzjK+t0gWCzucxIIZnCf5mysXVfoCoGxOQmsC05spIcBa+
         6tI5Q+A1Coh4lo7QdKJiIawd4yYAdvfcjVfcjJG526j0aFVXQaGYMsDmt3y44/Rt8Wax
         y8gFcvqHxdCO08u5gIyUKDltp97dhRXz+jLg2KELKiSdF9cOEWlhQL0YLZ2DvP13Usm1
         2VXbPCsWe/KL9GKDCmz8S8fYWko/2KIQMi/ZfvVpeqnzTgdw3zQ/DdlcG5CagmLFKU4f
         sIOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:in-reply-to:subject:cc:to:from
         :user-agent:references:dkim-signature;
        bh=XbBvcv/BXI/xo+sLNGOGnqDhDL7UZmcnZDoZ0JOdoY4=;
        b=bCPf/40EKBYyhiy9vFBq9fpWmatmA8jYAJR9YkjGBUz9Xe8IgkRQtT0tAkgBrV9mCa
         M+F3IrjpadmiHPKyL6ZXRPys+infVIpj4FhT+SQ7cEftYPcHe4hUx7b3MDzcnzX2Hzhp
         c2jKVDSkBcRC6lFQ1mlYxpIt8In4Ob17J5w3KBtBjyysYgliOMPHADSDXsxvAVPDqtG2
         UwiBKrov8F+E+ZtfVYu03dCK19HsSsSFxelHpX3voPoht0W6VIvv/7dMN6a62PF8aM20
         zJSLDYs1LsVVb9ywQYO85A5NjFr1rI6XXN2p8PQBU0VOh8h/asTMELMuzaK1up5S/fPV
         O0fg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=B5gCS0sa;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <bauerman@linux.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com. [148.163.156.1])
        by mx.google.com with ESMTPS id mu18si2827514pjb.110.2020.08.12.18.26.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Aug 2020 18:26:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.156.1 as permitted sender) client-ip=148.163.156.1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=B5gCS0sa;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 07D13Jd3107345;
	Wed, 12 Aug 2020 21:26:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=references : from : to :
 cc : subject : in-reply-to : date : message-id : mime-version :
 content-type; s=pp1; bh=XbBvcv/BXI/xo+sLNGOGnqDhDL7UZmcnZDoZ0JOdoY4=;
 b=B5gCS0sa17EFpNsm8SeOBauANEUe/H+LF0mCRsBEU2wzpH9g6nEHI0+P/kb17xZGv3kQ
 0y7nJ6FDUyNGg1Ko/9PpsDmXoerMg0+N20D/r9/jJzVVTM6XC45PoitwH5IKCxg1z33O
 zh0R35LKkwgPNxtsM6GquN1SdNgSE6bfmczQx9dUN+FxNfckWz6Ouvx8+xE9EG9olkS5
 VxgpXByAfltpUANGNx6s3EamMiEZ6M0IQtVhyIDn5WxS6Ws9MbPCMTPKmQvGNlCRZOfv
 bF4W2pkgg4hj/zqkSrtGxE41GHV3/R1gfnYNpcdMLU0/nlZda4Kn9pgabp4CWLqqnRbs fQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com with ESMTP id 32sratccjw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Aug 2020 21:26:06 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07D13OCG107604;
	Wed, 12 Aug 2020 21:26:04 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
	by mx0a-001b2d01.pphosted.com with ESMTP id 32sratccj3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Aug 2020 21:26:04 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
	by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07D1BIqt027671;
	Thu, 13 Aug 2020 01:26:03 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
	by ppma02dal.us.ibm.com with ESMTP id 32skp9qpvf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Aug 2020 01:26:03 +0000
Received: from b03ledav006.gho.boulder.ibm.com (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
	by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 07D1PwVT21299708
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 13 Aug 2020 01:25:58 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 089BDC6061;
	Thu, 13 Aug 2020 01:26:02 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1A3ABC6055;
	Thu, 13 Aug 2020 01:25:57 +0000 (GMT)
Received: from morokweng.localdomain (unknown [9.211.41.173])
	by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS;
	Thu, 13 Aug 2020 01:25:56 +0000 (GMT)
References: <20200723025657.644724-1-bauerman@linux.ibm.com> <20200723025657.644724-9-bauerman@linux.ibm.com> <20200727144350.47abd7e7.cohuck@redhat.com> <87a6zjuoru.fsf@morokweng.localdomain> <20200730114541.4dbdd15e.cohuck@redhat.com> <20200811130434.7388cfa2.cohuck@redhat.com>
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
In-reply-to: <20200811130434.7388cfa2.cohuck@redhat.com>
Date: Wed, 12 Aug 2020 22:25:54 -0300
Message-ID: <87a6yzxrod.fsf@morokweng.localdomain>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-08-12_19:2020-08-11,2020-08-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 adultscore=0
 malwarescore=0 spamscore=0 mlxscore=0 lowpriorityscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008130006
X-TUID: u0Wfj+LaRVrB


Cornelia Huck <cohuck@redhat.com> writes:

> On Thu, 30 Jul 2020 11:45:41 +0200
> Cornelia Huck <cohuck@redhat.com> wrote:
>
>> On Tue, 28 Jul 2020 21:51:33 -0300
>> Thiago Jung Bauermann <bauerman@linux.ibm.com> wrote:
>> 
>> > Hi,
>> > 
>> > Cornelia Huck <cohuck@redhat.com> writes:
>> >   
>> > > On Wed, 22 Jul 2020 23:56:57 -0300
>> > > Thiago Jung Bauermann <bauerman@linux.ibm.com> wrote:
>> > >    
>> > >> Instead of setting CPUState::halted to 1 in s390_cpu_initfn(), use the
>> > >> start-powered-off property which makes cpu_common_reset() initialize it
>> > >> to 1 in common code.
>> > >> 
>> > >> Note that this changes behavior by setting cs->halted to 1 on reset, which
>> > >> didn't happen before.    
>> > >
>> > > I think that should be fine, as we change the cpu state to STOPPED in
>> > > the reset function, which sets halted to 1.    
>> > 
>> > Nice, thanks for checking.
>> >   
>> > >> 
>> > >> Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
>> > >> ---
>> > >>  target/s390x/cpu.c | 2 +-
>> > >>  1 file changed, 1 insertion(+), 1 deletion(-)
>> > >> 
>> > >> NB: I was only able to test that this patch builds. I wasn't able to
>> > >> run it.    
>> > >
>> > > No noticeable difference under kvm, but running under tcg seems a bit
>> > > more sluggish than usual, and I saw some pausing on reboot (after the
>> > > bios handover to the kernel). Not sure if it were just flukes on my
>> > > laptop, would appreciate if someone else could give it a go.    
>> 
>> Experimented a bit with it again. There's a pause when switching from
>> the bios to the kernel (after the load reset normal has been done, I
>> guess), which is always there, but seems to get more noticeable with
>> this patch (varying wildly, but seems longer on average.) Hard to pin
>> down, and I don't really see a reason why that should happen, as we
>> should end up with halted == 1 in any case. Might still be a fluke,
>> even though I see it both on my laptop and on an LPAR (when running
>> under tcg; not seen under kvm, which is much faster anyway.)
>
> Tried again, the pause now seems comparable to the pause prior to this
> series. Might depend on the phase of the moon.
>
> I ran kvm unit tests on it, and it looks good. So, I'm reasonable
> confident that this is fine, really just seems to be a fluke.
>
> Acked-by: Cornelia Huck <cohuck@redhat.com>

Ah, that's a relief. Thank you very much for looking into this!

-- 
Thiago Jung Bauermann
IBM Linux Technology Center
