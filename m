Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp4567190lfm;
        Mon, 27 Apr 2020 13:21:17 -0700 (PDT)
X-Google-Smtp-Source: APiQypLAi7STi2/sYvwKgNce6c40Ovg1YX2M8gxgRLIhy0eufIiTNI05pSgRRLFHDuq1Wg4QT3ZK
X-Received: by 2002:a05:620a:307:: with SMTP id s7mr21038672qkm.407.1588018877245;
        Mon, 27 Apr 2020 13:21:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588018877; cv=none;
        d=google.com; s=arc-20160816;
        b=CdxKztGA8o09ktvGd6d0MGb6lffD1xWE0TTO+WaNLCWmy9ECikHA8VRGl3C5t5UT3y
         lwn8E6D9TwBITt1cuOXhscYsupc5gFfNDbYV4Yyg3+RcoWB3pXZOhfvXxAooaxtStVyH
         9YMILnyNuSxIM3mHibTIz2aruRP+5wgKt/vZiws9eK8e+JOMyADBorOz5fYQIaJHE8pc
         ATRH4t5w70jG+Qy3ELk7C7Baay9F+lJGUuNLrkgRTDX36A8BdARRifyqkDwJSIOJ8hh5
         AdoAupq2ZvhvLEzGSsb3JWYlQyWZvoMlKiRr8I9yeQNiGUstUJVli3msJGFaIjvCaJaq
         4kmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=ZKMA4DUrK7c5Bm2UntKIlVe26pwp9cmtSO1VkC8/B38=;
        b=CHD7NIuVLKVnqTOXAXm1Srg7zvuGioxPAzSNOjCpHQDnI/3xwcqIm3QozTZdUoiomg
         uL6jbr5MBHJpZc7IT74ufag5yv6eJlTcsOQedlAoVdma85A0JasvfL4RTtkjVfKkar1z
         bctVDKe+78Geuh9CEEOtlNh1i16tUKGVxOiA6m7c8yfc9molUIi44lx7kt347zgmj0HB
         Ab7dqNCg/OViQx+OVGif8J93JJDUmBxLAoIWCbRAWxbttWDriuRSR7Hp93qoAzk5Y5xR
         3K0MNsf5cXD0rGEcbw6mPrRy9bZ2uWWrAwHlNXa/4siMR3RZAt4+au3BJ62/vC7b3SmN
         2Psg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i3si6810015qka.366.2020.04.27.13.21.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Apr 2020 13:21:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1]:60778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jTAFg-0005Ap-Hy
	for alex.bennee@linaro.org; Mon, 27 Apr 2020 16:21:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50750)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanb@linux.ibm.com>) id 1jTAFZ-0005AS-Jn
 for qemu-arm@nongnu.org; Mon, 27 Apr 2020 16:21:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <stefanb@linux.ibm.com>) id 1jTAFZ-0004D4-2u
 for qemu-arm@nongnu.org; Mon, 27 Apr 2020 16:21:09 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:20684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1jTAFY-0004Ar-Ik; Mon, 27 Apr 2020 16:21:08 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03RK3asR052845; Mon, 27 Apr 2020 16:21:05 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30mfhdbs9h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Apr 2020 16:21:05 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 03RKI7o4092526;
 Mon, 27 Apr 2020 16:21:04 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30mfhdbs96-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Apr 2020 16:21:04 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03RKKBlC006270;
 Mon, 27 Apr 2020 20:21:03 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma04dal.us.ibm.com with ESMTP id 30mcu6bhcb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Apr 2020 20:21:03 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03RKL34354329676
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Apr 2020 20:21:03 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 082AAAE063;
 Mon, 27 Apr 2020 20:21:03 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E949DAE05F;
 Mon, 27 Apr 2020 20:21:02 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 27 Apr 2020 20:21:02 +0000 (GMT)
Subject: Re: [PATCH 0/2] virt: Set tpm-tis-device ppi property to off by
 default
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 cohuck@redhat.com
References: <20200427143145.16251-1-eric.auger@redhat.com>
From: Stefan Berger <stefanb@linux.ibm.com>
Message-ID: <a5bb0ccb-2dc4-67e2-f0df-98c349e6e94f@linux.ibm.com>
Date: Mon, 27 Apr 2020 16:21:02 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200427143145.16251-1-eric.auger@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-27_14:2020-04-27,
 2020-04-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxlogscore=999
 malwarescore=0 impostorscore=0 clxscore=1011 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004270163
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/27 16:21:06
X-ACL-Warn: Detected OS   = Linux 3.x [generic]
X-Received-From: 148.163.156.1
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
Cc: drjones@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bToid10a+8zL

On 4/27/20 10:31 AM, Eric Auger wrote:
> Instead of using a compat in the mach-virt machine to force
> PPI off for all virt machines (PPI not supported by the
> tpm-tis-device device), let's simply change the default value
> in the sysbus device.

There is no change in behavior on any arm machine due to this patch, 
right? So backporting would not be necessary?


    Stefan


