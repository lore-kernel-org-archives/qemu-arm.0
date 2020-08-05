Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp800160lfy;
        Wed, 5 Aug 2020 10:02:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyG35Pn8VtRvNRTaAUr4tMTuKjeacTjbZFA+wbscxeuUKErkfHxhi+LIQGUOuZJeySUOJmW
X-Received: by 2002:a5b:c52:: with SMTP id d18mr6015430ybr.88.1596646931659;
        Wed, 05 Aug 2020 10:02:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596646931; cv=none;
        d=google.com; s=arc-20160816;
        b=09tJlZhszihwUevWS2jmszfh1dRloAYMQ4IVpHjgAxvNx681A9c4d8V0uvxJIdDDi+
         s3snJLNWVwb9iFlUbzQno+oI6FuYS/ifrPidJ/Eu+UqKE6cvY0rRZDaBsqs4/CZGr8MA
         1QqXF02kqV6qRlambFo4rhsfFV4ozEKQEg1f2RGjoJb5Tb9cSstEiy9N/gAp+xbZqIoo
         mI34wPmqiJ8OxTZtMw3rCyY0EtWRg27dmFH/REqv0YG24vxTyJcYskgXLCKTk2anh4R8
         zBlDLNtv5XDS/UbeWdXomH6HknYCCbRNVH3U4hGBCURHADa+dvNabLYj/cHccJz6kNgK
         U/HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:in-reply-to:subject:to:from:user-agent
         :references;
        bh=KOC6BVOm2qrNIJAzjDU+lM/R6RqIgsVriloaCPH53ng=;
        b=TNdGwgp9KgZZaevSi3s0z2HEDxkCbrccovGCBEUy4e+QuntcOOWYu+y8/qHJ2lKjIB
         oTawD8uebYKGL2UkmVjaIhatEtd9glyjSzVQhLolBMiEjTN8M1bRn9NSCBluPzxzPhYO
         U0+f/ZiHpWXn+MX+Iy7I3AWDsdgOFpOyh1zI2jCdmbKQw+wOC1vaOkcGEfJRF5vqf2MQ
         tUBcfBvD9UVP/D+LeDr4ZTZYbQ4JMBRAqwZF+ndgyxRfSG8uxoF+IYBMTlKMoIU19YXQ
         SO3ZENxA32wwdLoK3M4dLin9+EeScMofrGGXQjVWQYrN+iWo70AtdltWGNoleCSsKVXq
         NArg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t107si2658107ybi.84.2020.08.05.10.02.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Aug 2020 10:02:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1]:59002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k3Mnr-0005Fc-0d
	for alex.bennee@linaro.org; Wed, 05 Aug 2020 13:02:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bauerman@linux.ibm.com>)
 id 1k3Mnh-0005E3-UV; Wed, 05 Aug 2020 13:02:01 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:17878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bauerman@linux.ibm.com>)
 id 1k3Mnf-0005u0-VP; Wed, 05 Aug 2020 13:02:01 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 075GXD6c119174; Wed, 5 Aug 2020 13:01:26 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32qye7tm4a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Aug 2020 13:01:25 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 075GXG3c119761;
 Wed, 5 Aug 2020 13:01:25 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32qye7tm34-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Aug 2020 13:01:25 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 075Gu4NV028717;
 Wed, 5 Aug 2020 17:01:23 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma04wdc.us.ibm.com with ESMTP id 32n019abup-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Aug 2020 17:01:23 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 075H1Mda57672136
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 5 Aug 2020 17:01:22 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A5230C6055;
 Wed,  5 Aug 2020 17:01:22 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 38E9DC605F;
 Wed,  5 Aug 2020 17:01:18 +0000 (GMT)
Received: from morokweng.localdomain (unknown [9.163.53.138])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Wed,  5 Aug 2020 17:01:17 +0000 (GMT)
References: <20200723025657.644724-1-bauerman@linux.ibm.com>
 <878sf3uojf.fsf@morokweng.localdomain>
 <20200730005947.GO84173@umbus.fritz.box>
 <CAAdtpL5Mtaf7Xwu74U33eGTCAiFZNNXeCST8COwQeW8S9j8ZVQ@mail.gmail.com>
 <87a6zh3uyv.fsf@morokweng.localdomain>
User-agent: mu4e 1.2.0; emacs 26.3
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v3 0/8] Generalize start-powered-off property from ARM
In-reply-to: <87a6zh3uyv.fsf@morokweng.localdomain>
Date: Wed, 05 Aug 2020 14:01:14 -0300
Message-ID: <874kph58o5.fsf@morokweng.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-05_13:2020-08-03,
 2020-08-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 mlxlogscore=808 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 phishscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008050132
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=bauerman@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/05 13:01:53
X-ACL-Warn: Detected OS   = Linux 3.x [generic] [fuzzy]
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo
 Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Artyom Tarasenko <atar4qemu@gmail.com>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Greg Kurz <groug@kaod.org>, Richard Henderson <rth@twiddle.net>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2BRZBmQ/uS/1


Thiago Jung Bauermann <bauerman@linux.ibm.com> writes:

> Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:
>
>> Le jeu. 30 juil. 2020 03:00, David Gibson <david@gibson.dropbear.id.au> a
>> =C3=A9crit :
>>
>>> On Tue, Jul 28, 2020 at 09:56:36PM -0300, Thiago Jung Bauermann wrote:
>>> >
>>> > Thiago Jung Bauermann <bauerman@linux.ibm.com> writes:
>>> >
>>> > > The ARM code has a start-powered-off property in ARMCPU, which is a
>>> > > subclass of CPUState. This property causes arm_cpu_reset() to set
>>> > > CPUState::halted to 1, signalling that the CPU should start in a ha=
lted
>>> > > state. Other architectures also have code which aim to achieve the =
same
>>> > > effect, but without using a property.
>>> > >
>>> > > The ppc/spapr version has a bug where QEMU does a KVM_RUN on the vc=
pu
>>> > > before cs->halted is set to 1, causing the vcpu to run while it's
>>> still in
>>> > > an unitialized state (more details in patch 3).
>>> >
>>> > Since this series fixes a bug is it eligible for 5.1, at least the
>>> > patches that were already approved by the appropriate maintainers?
>>>
>>> Ok by me.
>>>
>>
>> Maybe just the arm generalization and ppc fix for 5.1, delaying all not
>> bugfix to 5.2?
>
> That would be great.

Any news on this? Is there something I should be doing? I saw -rc3 today
but not these patches.

--=20
Thiago Jung Bauermann
IBM Linux Technology Center
