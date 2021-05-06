Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp1338569lfg;
        Thu, 6 May 2021 07:46:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw17fl7Ha275Z7gO3lEgeb8qxmwyTG6H9pSOMMn/d6VdCUTe9FcusO4l6DCpOWoJ/Zm29LW
X-Received: by 2002:a65:464b:: with SMTP id k11mr4728588pgr.407.1620312394742;
        Thu, 06 May 2021 07:46:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620312394; cv=none;
        d=google.com; s=arc-20160816;
        b=t8JXVQwWfNhD1SCORqXqSplJW2DK6RuqbFEQZTeOsi0b6aEDEhOpixIyGJgGKG4ibJ
         ojk5xpFd7yNU6cND/RwZtCQ+59uU30Z6TuRL9jaObZ1QiMpNgsR5IQjibDBIRLw7FYLG
         uIcGsK9YB+TA0ZNTuchlmP+HG5QOV7JjHulSHpJOTZz1RTrkJHbG2m0D9hwri9ND/+eh
         j8YMzkfU+rg//n/FSg9X8eetFx+5GJKy20UNvdEmdUD7buW82qKrQinONjJdCWXE7UhO
         8+OH+X9jN8qemC4bqAzHwUyLKbUYTkwrOhYfPM2QXoO/boNZE29uEkwJz9/P1ks7+x1V
         Nc0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:content-transfer-encoding:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=yljGLGtiffJJQke13w1q16HWd+n5bySJfls+MBqKLLo=;
        b=MKJMie362oE1idJAu1QsNaNn+Y93kG/e30jG+SnSiVQp5hpwzezy+1NU246WBlQC+j
         5CyAmPW4U/Uo/Ab3DDntIIXO9DOx7CUMM2uwPezTJPOiGzn2hVJ6uGY3izQwlr7xN1Dp
         /LyqkWrC3QvOXjTsI7bCyPsXgzcsvK+E/uu1XRWenoG3LBNfRepkvP8sGlPaLQbJMuLk
         /cMLfdiQ20Y3U/HB/Uf7my7yieKXRC75EmHkl8I4JjB9jqupHclQixYvxz51oeSVbtec
         Tg9GOCaGCLnvjqP4nrxNMDgUqBZ8uYkOwqeLs43pveJe+Vo4y4DZUQrffFes3TEkfZt4
         7kNw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=ZhN6FA4G;
       spf=pass (google.com: domain of stefanb@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=stefanb@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <stefanb@linux.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com. [148.163.156.1])
        by mx.google.com with ESMTPS id g4si3336641pfj.284.2021.05.06.07.46.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 May 2021 07:46:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of stefanb@linux.ibm.com designates 148.163.156.1 as permitted sender) client-ip=148.163.156.1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=ZhN6FA4G;
       spf=pass (google.com: domain of stefanb@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=stefanb@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 146EY1QZ069670;
	Thu, 6 May 2021 10:46:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=yljGLGtiffJJQke13w1q16HWd+n5bySJfls+MBqKLLo=;
 b=ZhN6FA4GXmkMrOpC9MEhK2A0iPvQjttneGtIOr7Q9ffuZr889QkYgUKN8mw5tmzwr38g
 eNAYAkgSzrlZKgdPAltczH3rSujJEQIup97SFoq4aQDwv7iT7hd3mK48/NL8FVhr+WLK
 qRna3wuGpN29cCuimXGZ4rnepJt762ubIVWiJQiEvfzcYGo6/YJ2f/F3VnyIgfqaEcpf
 QT/QqQ32sbOleQrD12qr7I7HhDsfOx1b8kJvO2iJSwJEnc5ezhYU714jsF9NfZm4BToA
 2X65FeD5xxZAksBhBn9la2E7ivCh9tjn99y+BaaF3k0o0qwvZ9hJQICyMOa4ZytW2lBh Ig== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com with ESMTP id 38cgqcbvrw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 May 2021 10:46:33 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 146EaKbP076373;
	Thu, 6 May 2021 10:46:33 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
	by mx0a-001b2d01.pphosted.com with ESMTP id 38cgqcbvra-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 May 2021 10:46:33 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
	by ppma02dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 146Eg5lk026886;
	Thu, 6 May 2021 14:46:32 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
	by ppma02dal.us.ibm.com with ESMTP id 38c1mxy7kn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 May 2021 14:46:32 +0000
Received: from b03ledav005.gho.boulder.ibm.com (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
	by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 146EkU3R49152526
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 6 May 2021 14:46:30 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C77E7BE04F;
	Thu,  6 May 2021 14:46:30 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 27817BE051;
	Thu,  6 May 2021 14:46:30 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
	by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
	Thu,  6 May 2021 14:46:29 +0000 (GMT)
Subject: Re: [PATCH v2 2/9] backends/tpm: Replace qemu_mutex_lock calls with
 QEMU_LOCK_GUARD
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
        qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, Stefan Berger <stefanb@linux.vnet.ibm.com>,
        qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
        Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
        =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20210506133758.1749233-1-philmd@redhat.com>
 <20210506133758.1749233-3-philmd@redhat.com>
From: Stefan Berger <stefanb@linux.ibm.com>
Message-ID: <97c595ba-e443-498f-b63c-e6a9bacdad1f@linux.ibm.com>
Date: Thu, 6 May 2021 10:46:29 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210506133758.1749233-3-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: -9KXdwTaADLoswSLGm8hzyCO-30xSrTM
X-Proofpoint-GUID: cxk0VPEHheFVeVCU9C_bhD6vPt5xjw8_
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-05-06_10:2021-05-06,2021-05-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 adultscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 mlxscore=0 clxscore=1011
 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2105060106
X-TUID: vE2L/i+Zlro+


On 5/6/21 9:37 AM, Philippe Mathieu-Daudé wrote:
> Simplify the tpm_emulator_ctrlcmd() handler by replacing a pair of
> qemu_mutex_lock/qemu_mutex_unlock calls by the WITH_QEMU_LOCK_GUARD
> macro.
>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
