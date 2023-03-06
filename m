Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4707458ejc;
        Mon, 6 Mar 2023 06:27:19 -0800 (PST)
X-Google-Smtp-Source: AK7set9CS+5+Nf5bKckUudFbgXeKLIqG3L8l32HZ6u/qRwptj3UiTfJ+UCmSkbYXY9gmP5dkGKwa
X-Received: by 2002:ac8:7d05:0:b0:3b8:4951:57b7 with SMTP id g5-20020ac87d05000000b003b8495157b7mr19204011qtb.20.1678112838938;
        Mon, 06 Mar 2023 06:27:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678112838; cv=none;
        d=google.com; s=arc-20160816;
        b=AD7OE/Oz/dk0E/tGaKA0IpyAHF2Ix/VSGltKZRCjY7UaeXN+sd+3Jog0FLdH7Yph4N
         vROaEtJuxGNYlqX6ZJ+XjioJfwH+22AcUoFy5Nrr8UrgBygDYHF9iikuG288a7E5JXBu
         dzepBSfunIvCc/g/QI8S4b5cJ85o22ibTT51SP7DdbpNRjJdTuroDBH1yWA/5fwYBr0R
         bNijbf7do2KxyHZQb3oPKTVHlVbiGICQlItZunV68vFwwg0VjTm5SmJs8C8IHd5RhYUX
         Fb/s5V57Ll7KVA4kkNnqaA8M6u/EI/b7jOc45Q8LWfpU4eENUlxXRSRRqWd9Z6hpV3AW
         wmiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=0i/ESyA/tTNx4BFWJPXvcoiWycFJre3Qg9mwczQQ2WU=;
        b=W2bCJJh7YpPqL1woEre1U4CuQArTzOMV6GAp3DdoTHBahl+VPHP2ACvaSIfNud5LyA
         F67WgwIeyqicBDWh+49AM8f/wkUuRJ1m/aRnHZLWg660kSfAIQR2JYYxRCycM1K4CXH5
         x0ztkl2xvA+T7UfU1atXylKc7SLRiQhteW5o7SNyf6PoeiWMYxyYatye0R5VtyQSMN5A
         HV9kMtA7tE9MGppv+2UgkM31UX49EbJ1OozQBeDJ3v+X4fEN/hXhmW9Mf9HClkqZXlOw
         mV8lIszkwEeFaIXy4Y4NcvJdF88+GQHAPcTBEW0AQb4d6FtVCcs3IcRmdyLgdCUUkepQ
         Y2Tg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=NYg7gAVq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n13-20020a05622a040d00b003b85f98c10fsi7535937qtx.456.2023.03.06.06.27.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Mar 2023 06:27:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=NYg7gAVq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pZBnb-0007T7-Nm; Mon, 06 Mar 2023 09:26:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pZBnX-0007NI-Fa; Mon, 06 Mar 2023 09:26:45 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pZBnV-0003jV-6T; Mon, 06 Mar 2023 09:26:43 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 326DWdJO032400; Mon, 6 Mar 2023 14:26:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=0i/ESyA/tTNx4BFWJPXvcoiWycFJre3Qg9mwczQQ2WU=;
 b=NYg7gAVqxP0hqYqXIZBIn5Givq0jH9VGwdJxVyWh278wvz+1PeS18B1K2HMDDtM+6/tU
 7P8sarCVzwsKiI4JWeL8NC2045t+6W2LCvjN4NKh/qW7os5z2c+DzlWE1gh7M+NvM1ko
 kjBan+TO2ZIzrlT2PJihizSgEH7QEO1Df9ZaU8mncr9A9iqm+ng68O3dsLP/80/tz3Ff
 UuL/A4UkGsI6drkC7kf90f09hQFheeCRorPbIl+GL2OMNrrvY4MbqSL4i0/yL2cCeCom
 eDR3UPVdbN2yHlP27IWfkx/+L3iiT8plc+tC99uZbE4hl7odwk+N1SE++5TWiyR9O61V BA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3p4x1hqu38-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Mar 2023 14:26:28 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 326CBPCS001624;
 Mon, 6 Mar 2023 14:26:27 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3p4x1hqu2u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Mar 2023 14:26:27 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 326DB6ox010337;
 Mon, 6 Mar 2023 14:26:26 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([9.208.129.118])
 by ppma04wdc.us.ibm.com (PPS) with ESMTPS id 3p419e5k7c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Mar 2023 14:26:26 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com
 [10.241.53.101])
 by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 326EQPQD1901308
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 6 Mar 2023 14:26:25 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4BEF25805A;
 Mon,  6 Mar 2023 14:26:25 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0A6B558051;
 Mon,  6 Mar 2023 14:26:24 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Mon,  6 Mar 2023 14:26:23 +0000 (GMT)
Message-ID: <8ab52e8b-5cba-0ab7-e8f3-c11ca3d93b9a@linux.ibm.com>
Date: Mon, 6 Mar 2023 09:26:23 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 14/16] win32: avoid mixing SOCKET and file descriptor
 space
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Michael Roth <michael.roth@amd.com>, qemu-arm@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 armbru@redhat.com, Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Fam Zheng <fam@euphon.net>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Joel Stanley <joel@jms.id.au>, Hanna Reitz <hreitz@redhat.com>
References: <20230221124802.4103554-1-marcandre.lureau@redhat.com>
 <20230221124802.4103554-15-marcandre.lureau@redhat.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <20230221124802.4103554-15-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: SkjeHbyBfRtxFImLpNb8cSRBMu41Ho9B
X-Proofpoint-ORIG-GUID: fe8BRu4vqjLeSlzmlrt0mFUZ9oRyt_Aq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_07,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 adultscore=0 phishscore=0 mlxscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2303060124
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: T8ocT4CAIiwO



On 2/21/23 07:47, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Until now, a win32 SOCKET handle is often cast to an int file
> descriptor, as this is what other OS use for sockets. When necessary,
> QEMU eventually queries whether it's a socket with the help of
> fd_is_socket(). However, there is no guarantee of conflict between the
> fd and SOCKET space. Such conflict would have surprising consequences,
> we shouldn't mix them.
> 
> Also, it is often forgotten that SOCKET must be closed with
> closesocket(), and not close().
> 
> Instead, let's make the win32 socket wrapper functions return and take a
> file descriptor, and let util/ wrappers do the fd/SOCKET conversion as
> necessary. A bit of adaptation is necessary in io/ as well.
> 
> Unfortunately, we can't drop closesocket() usage, despite
> _open_osfhandle() documentation claiming transfer of ownership, testing
> shows bad behaviour if you forget to call closesocket().
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>

Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
