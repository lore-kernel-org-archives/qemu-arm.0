Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1197317lfm;
        Wed, 22 Jul 2020 17:39:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxtIo2cZ1nOQ7VYnkz98bqaodZbhyg5HPDEFWclYtW0C7pbQfhFI2SAjycU2Vr3iXnmSh26
X-Received: by 2002:a25:68c8:: with SMTP id d191mr715681ybc.283.1595464766413;
        Wed, 22 Jul 2020 17:39:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595464766; cv=none;
        d=google.com; s=arc-20160816;
        b=JvOIct9NiQcTTpprqRKSFrhMNBKFfOCuh7w5Pa31k07lbcxfl7n2jmWDHwE9F/qw3e
         Avs3P/DW5OcWpKwnk0P/OFVUqYr8BslUo/R7dpJ/7fuu0rqBy/CGb3JzbmQp9qfsFvBk
         Dpa905MSBmo8Lde43E2dgYMoazmxjpFwgZzv2lzcCT8DZcGMiRMbs8CDsRlMRVuo7pHv
         2tc2u40TZs4bay90Avik+ri2rrvCrM5U3XIqXXv79q3HXAsbA1BYA/M0LbKuPPoMrcNf
         y9M3Wmj/ak0/QMDCaRepmr+lhAaOdCjOq682itpbRPSSBhafyC7wyxrr2G3nQv8E7NK6
         dUsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:in-reply-to:subject:to:from:user-agent
         :references;
        bh=zEPS3bFh+zqMyqFMY+NHvGTB1eMze5hU1gQCgy1609E=;
        b=xGSHb93yE9EG3OHa/g3Wo2ITO0/BxzVr6KSNfrowv+3guadnjD3LOELrx5G49252xp
         9tIH28mn6xelUfvjLV/PDsA2u1EQR5sg7x9z8vtCZS2d/auVr1nzZVZOlaBOy0ypMRs9
         CvfYV8v9OTywO1bN1FNpDABd8yKWcnonIvPcd6UUoRsJtrLAxPhvmltX6AVhhRyJPAZI
         jAQjrMQh7jc9Xs1EpGMqasKmrl/zQ/Goae+Zbs1iky9bTinlhG4D0vNwaBSG5P7En7xl
         5kRaN7mmjghckXzYbjRILgW0mpNMpdiS4RLwsbqc0r4GfoZjwS+mJklQ1zebMh8glO70
         M0lg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u18si1252774ybd.357.2020.07.22.17.39.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Jul 2020 17:39:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1]:56266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jyPGf-0005rF-Pq
	for alex.bennee@linaro.org; Wed, 22 Jul 2020 20:39:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bauerman@linux.ibm.com>)
 id 1jyPGX-0005qv-Dv; Wed, 22 Jul 2020 20:39:17 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:36178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bauerman@linux.ibm.com>)
 id 1jyPGV-0004Xl-Gp; Wed, 22 Jul 2020 20:39:17 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06N0WT4L027759; Wed, 22 Jul 2020 20:38:48 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32e1vucrs4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jul 2020 20:38:48 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06N0WfPe028527;
 Wed, 22 Jul 2020 20:38:48 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32e1vucrrv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jul 2020 20:38:47 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06N0Z5GA018098;
 Thu, 23 Jul 2020 00:38:46 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma03wdc.us.ibm.com with ESMTP id 32brq9g704-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Jul 2020 00:38:46 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06N0cgFb983598
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Jul 2020 00:38:42 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AB6FBBE054;
 Thu, 23 Jul 2020 00:38:45 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7972EBE053;
 Thu, 23 Jul 2020 00:38:41 +0000 (GMT)
Received: from morokweng.localdomain (unknown [9.211.93.190])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Thu, 23 Jul 2020 00:38:41 +0000 (GMT)
References: <20200722035016.469075-1-bauerman@linux.ibm.com>
 <20200722035016.469075-2-bauerman@linux.ibm.com>
 <6ca8915c-094e-1880-0e66-618eb354444d@redhat.com>
User-agent: mu4e 1.2.0; emacs 26.3
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 1/9] target/arm: Move start-powered-off property to
 generic CPUState
In-reply-to: <6ca8915c-094e-1880-0e66-618eb354444d@redhat.com>
Date: Wed, 22 Jul 2020 21:38:36 -0300
Message-ID: <87tuxzrroz.fsf@morokweng.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-22_16:2020-07-22,
 2020-07-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 impostorscore=0 mlxscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 adultscore=0 bulkscore=0 suspectscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007220151
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=bauerman@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/22 20:39:13
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yP8BVvJ8gEka


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Hi Thiago,
>
> On 7/22/20 5:50 AM, Thiago Jung Bauermann wrote:
>> There are other platforms which also have CPUs that start powered off, so
>> generalize the start-powered-off property so that it can be used by them.
>>
>> Note that ARMv7MState also has a property of the same name but this patch
>> doesn't change it because that class isn't a subclass of CPUState so it
>> wouldn't be a trivial change.
>>
>> This change should not cause any change in behavior.
>>
>> Suggested-by: Eduardo Habkost <ehabkost@redhat.com>
>> Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
>
> As I participated in reviewing your v1, I'd have appreciated
> being Cc'ed for v2.

I'm sorry about this. I fixed the Cc list for the next version.

> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Thank you very much for your prompt review, and suggestions.

I will post a new version addressing your comments shortly.

>> ---
>>  exec.c                | 1 +
>>  include/hw/core/cpu.h | 4 ++++
>>  target/arm/cpu.c      | 5 ++---
>>  target/arm/cpu.h      | 3 ---
>>  target/arm/kvm32.c    | 2 +-
>>  target/arm/kvm64.c    | 2 +-
>>  6 files changed, 9 insertions(+), 8 deletions(-)


--
Thiago Jung Bauermann
IBM Linux Technology Center
