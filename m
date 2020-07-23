Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1294748lfm;
        Wed, 22 Jul 2020 20:18:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxVtgqg4eeM8ebJmKcLmd6d9pVsGgpLE9U08z95XDTpfZ1oRGLx11UYmbzR8WM+20HebTgc
X-Received: by 2002:a25:8390:: with SMTP id t16mr1273912ybk.147.1595474314150;
        Wed, 22 Jul 2020 20:18:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595474314; cv=none;
        d=google.com; s=arc-20160816;
        b=tqwiMDG/HCTknb+zUqH2jfitjwPr9j93iwtRkzmEpvplHaK+oxqsj9aEXSLvWo5xwa
         zQJ5vCal/TZ2teO0GMPqe4N6RcCPCwMcTg3n8LNPmJHw8VYfmTGgeknDV977727utsKq
         wizHr4nSrEW+lv2VzKr4fV+6FOuyUV2sFmtGB6skymjKRD4hXAPCKnqwegXlilNwxbtx
         ehhfnJ/nZJg99pHy1C3lpd+T6MPOQS3uf2sKzj8Xi1A4Mf+IEqXvgrgOUESjK4/hf+CS
         7leryl1Fz8oJPTaJmnrC8FgcWGCB5yyd2axKXgOJOrZHwWW0jXzcQg8u0OT0fugXZezC
         rFFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :in-reply-to:subject:to:from:user-agent:references;
        bh=NDvu2DM5xx8v7t0uC3OAWZ9Nb92y5hL5usnBOkg96CE=;
        b=MEKZ0dyBfRGqx9DYsnoiDVvA90iDc92mLW+MUalKR3OBcAkIUVjJKzdf61+UsgZFhd
         JFXF7uIUQGe17NXgmnnUT97WBUmFlkt+WJRfDoC6yvRpyDOftkezriEsUYff37upCbFQ
         60i4dVbgjj1uiFTo4UBjmYogMRrSZDYy08sgUeFfIzX6K08S+gLuStIv+gsOH50npPFq
         tEaQ1NvEvFYmJNCx+FhI8wuqm8Kr7wxSZtcXl50Zmx8TnbCZFovVEU/ufP+F6GVZnR6q
         v4PzaYisWPnsOBbqdgNNFdGfKX9h2KxnpJrql5K4tu6wej7IDVsYGc1Bc0Tu/uhbFSe3
         U5TQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g4si1409474ybq.92.2020.07.22.20.18.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Jul 2020 20:18:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1]:43914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jyRkf-0006PG-Hh
	for alex.bennee@linaro.org; Wed, 22 Jul 2020 23:18:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bauerman@linux.ibm.com>)
 id 1jyRkV-0006OZ-Sf; Wed, 22 Jul 2020 23:18:23 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:15634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bauerman@linux.ibm.com>)
 id 1jyRkU-00086I-34; Wed, 22 Jul 2020 23:18:23 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06N3FlrR003826; Wed, 22 Jul 2020 23:18:02 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32f1pmrx2q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jul 2020 23:18:02 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06N3I1TD008213;
 Wed, 22 Jul 2020 23:18:02 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32f1pmrx2j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jul 2020 23:18:01 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06N3A7i6007391;
 Thu, 23 Jul 2020 03:18:01 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma04dal.us.ibm.com with ESMTP id 32d5dqh6ek-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Jul 2020 03:18:01 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06N3I0kZ9503500
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Jul 2020 03:18:00 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6692BAE062;
 Thu, 23 Jul 2020 03:18:00 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9468AAE05F;
 Thu, 23 Jul 2020 03:17:54 +0000 (GMT)
Received: from morokweng.localdomain (unknown [9.211.93.190])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
 Thu, 23 Jul 2020 03:17:54 +0000 (GMT)
References: <20200722035016.469075-1-bauerman@linux.ibm.com>
 <20200722035016.469075-2-bauerman@linux.ibm.com>
 <20200723005530.GG5513@umbus.fritz.box>
User-agent: mu4e 1.2.0; emacs 26.3
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v2 1/9] target/arm: Move start-powered-off property to
 generic CPUState
In-reply-to: <20200723005530.GG5513@umbus.fritz.box>
Date: Thu, 23 Jul 2020 00:17:50 -0300
Message-ID: <87k0yusyw1.fsf@morokweng.localdomain>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-22_17:2020-07-22,
 2020-07-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 spamscore=0 priorityscore=1501
 adultscore=0 bulkscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007230019
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=bauerman@linux.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/22 22:57:54
X-ACL-Warn: Detected OS   = Linux 3.x [generic]
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
 Eduardo Habkost <ehabkost@redhat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9me0jKLX2p6g


Hello David,

David Gibson <david@gibson.dropbear.id.au> writes:

> On Wed, Jul 22, 2020 at 12:50:08AM -0300, Thiago Jung Bauermann wrote:
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
> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

Thank you very much for your review!

Unfortunately I apparently had a minor email mishap and only got your
reviews after I sent the v3 patches, so I wasn't able to put your
Reviewed-by's in them. Sorry about that.

-- 
Thiago Jung Bauermann
IBM Linux Technology Center
