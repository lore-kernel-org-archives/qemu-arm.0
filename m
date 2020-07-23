Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1199635lfm;
        Wed, 22 Jul 2020 17:43:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyhIVuFG8QkEqDMfDoXtz3TAE5s+ezdonAnFMsTJsS494dbYtkV8I5Dd5mjgUaCYSeZkjHy
X-Received: by 2002:a25:ac66:: with SMTP id r38mr3283822ybd.105.1595465005403;
        Wed, 22 Jul 2020 17:43:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595465005; cv=none;
        d=google.com; s=arc-20160816;
        b=jBhqDL1k5Y5viXCIqcylA5P+aXSbp3jMl4w+UNHm881XBvFGqJWX3UfWuRZp4uLTRh
         qo1kmhBa05ZZljEDNwpe1qXIxv1fbA+0Qeyqds9g48psKs44+n3BNxuIi5BkL3RMp4FF
         Gz+Y770X609d0Yi28lqKdSPAuR11s7ZkE7f1gf4/BuzAQFgxY5QHdVo5DlNP6T3cmPCi
         tAW0MnquavalUXzrgvAUH2yiAcCafqLiVUjyuL8GlMQQaAiipPmm+E0lwOv7wbXZMrAJ
         L+Mxodyy+d35pA9IZELAc+NeN6/2w1HU5wZgeqaWns8ANS0iQt+QD5p48f7Ye71Y67rU
         kUKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:in-reply-to:subject:to:from:user-agent
         :references;
        bh=CEugBP+xirMy2K86oGw0GCx4deTVfwGxvd1nnSUJpbY=;
        b=SB8Wsx57mOk6VHrK0+3Ike4CBaUUwSOJzclkE/RWfWi0kd0k/xoSdMUdEyGEGWeZoE
         jAdWmL4/9iOG3d8DChoI7vp+6+6GUINIq1Kta2iVvfb2C4Ta06MPGT5p5ZqWSglB41b0
         gXSMbj6VoghuJxE/dvasfiipy0E1/cC0w4lNl5OQGIgVOrNBHY+nhmMmfXX+6+Egg80Y
         xCVzMRuTnOSseTHbvwa6lPEsP1XkiovoJkhtegv2HXbC54Q5NfbcowsHUsUTYggnRGZ0
         hOgHgOZfi3ztIcwio1KxQwko58oTkMiuQHOj9qGizknwGDCBYw2HERoPbGvbJzZ0Y56p
         LVRA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e123si204613yba.5.2020.07.22.17.43.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Jul 2020 17:43:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1]:34618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jyPKW-0000HO-R5
	for alex.bennee@linaro.org; Wed, 22 Jul 2020 20:43:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bauerman@linux.ibm.com>)
 id 1jyPJn-00087q-GA; Wed, 22 Jul 2020 20:42:39 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:11310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bauerman@linux.ibm.com>)
 id 1jyPJl-000557-Tn; Wed, 22 Jul 2020 20:42:39 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06N0VYd8013149; Wed, 22 Jul 2020 20:42:25 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32e1x8mqsy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jul 2020 20:42:25 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06N0gPKH041902;
 Wed, 22 Jul 2020 20:42:25 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32e1x8mqsr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jul 2020 20:42:25 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06N0aF9V001250;
 Thu, 23 Jul 2020 00:42:24 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma03dal.us.ibm.com with ESMTP id 32brq9t7u8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Jul 2020 00:42:24 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06N0gN4346268818
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Jul 2020 00:42:23 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 84218112063;
 Thu, 23 Jul 2020 00:42:23 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 53BFC112061;
 Thu, 23 Jul 2020 00:42:18 +0000 (GMT)
Received: from morokweng.localdomain (unknown [9.211.93.190])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTPS;
 Thu, 23 Jul 2020 00:42:18 +0000 (GMT)
References: <20200722035016.469075-1-bauerman@linux.ibm.com>
 <20200722035016.469075-6-bauerman@linux.ibm.com>
 <250a3a6b-6006-4432-71a6-9b479137cc59@redhat.com>
User-agent: mu4e 1.2.0; emacs 26.3
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: qemu-ppc@nongnu.org
Subject: Re: [PATCH v2 5/9] mips/cps: Use start-powered-off CPUState property
In-reply-to: <250a3a6b-6006-4432-71a6-9b479137cc59@redhat.com>
Date: Wed, 22 Jul 2020 21:42:14 -0300
Message-ID: <87r1t3rrix.fsf@morokweng.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-22_16:2020-07-22,
 2020-07-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0
 impostorscore=0 spamscore=0 adultscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 suspectscore=1 priorityscore=1501
 mlxlogscore=968 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007220151
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=bauerman@linux.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/22 18:08:00
X-ACL-Warn: Detected OS   = Linux 3.x [generic]
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Artyom Tarasenko <atar4qemu@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Aurelien Jarno <aurelien@aurel32.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dkabj4S14evy


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> On 7/22/20 5:50 AM, Thiago Jung Bauermann wrote:
>> Instead of setting CPUState::halted to 1 in main_cpu_reset(), use the
>> start-powered-off property which makes cpu_common_reset() initialize it
>> to 1 in common code.
>>=20
>> Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
>> ---
>>  hw/mips/cps.c | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>=20
>> NB: I was only able to test that this patch builds. I wasn't able to
>> run it.
>>=20
>> diff --git a/hw/mips/cps.c b/hw/mips/cps.c
>> index 615e1a1ad2..d5b6c78019 100644
>> --- a/hw/mips/cps.c
>> +++ b/hw/mips/cps.c
>> @@ -52,9 +52,6 @@ static void main_cpu_reset(void *opaque)
>>      CPUState *cs =3D CPU(cpu);
>>=20=20
>>      cpu_reset(cs);
>> -
>> -    /* All VPs are halted on reset. Leave powering up to CPC. */
>> -    cs->halted =3D 1;
>>  }
>>=20=20
>>  static bool cpu_mips_itu_supported(CPUMIPSState *env)
>> @@ -89,6 +86,9 @@ static void mips_cps_realize(DeviceState *dev, Error *=
*errp)
>>              env->itc_tag =3D mips_itu_get_tag_region(&s->itu);
>>              env->itu =3D &s->itu;
>>          }
>> +        /* All VPs are halted on reset. Leave powering up to CPC. */
>> +        object_property_set_bool(OBJECT(cpu), "start-powered-off", true,
>> +                                 &error_abort);
>
> This is indeed better as now the property is set once, *after* realize
> but *before* reset.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Thanks for confirming!

>>          qemu_register_reset(main_cpu_reset, cpu);
>>      }
>>=20=20
>>=20


--=20
Thiago Jung Bauermann
IBM Linux Technology Center
