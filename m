Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp1509380ejb;
        Mon, 23 Oct 2023 10:09:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUmwhbNctk7geplfd88yIPOZK4IiBDWZnsAhG0QejFDcPK6NOYG16jI6wBTOi5N/bCy5zV
X-Received: by 2002:a05:6808:3c2:b0:3b2:e649:a830 with SMTP id o2-20020a05680803c200b003b2e649a830mr10554649oie.23.1698080979289;
        Mon, 23 Oct 2023 10:09:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698080979; cv=none;
        d=google.com; s=arc-20160816;
        b=FuBi1dNPueOzb24z9c7/mu3hrVsMQIShuZQXilnvrWqvFZ7C8hKNYehLcvEW8AMCdr
         Fx16oZDf+E4GXmELcPbBOQh4hsS0KfigdrDuRgSuRkZPlPzRCq5/y2DN6Nb879a/lLhu
         Yk8duI6SpNq1u7uuO6EmPIneRx6EbxSlNrDeI9/imsofBGq6kYOVaX4iFObZGXY+nA0g
         pWT6N0l84mvaWAjFsNdV+kWPRia82qdDw6gMEJ12s3tgtF4kJ0KtYhCDKGXEc+KOui3B
         LunPHD0CTu0NryexktaC4Xes4DGYbYQqLSROVrlr1jp3z13QloCPiCllrK9bna8Bc1lx
         NyBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=56TAYe4jMsA2K9CSB96fKcnyNqTUMT7iqIFk15jeCHM=;
        fh=ocxrNli2/ARJYmnmna17Dir4bT/pGRu/zmEBoN1+sVg=;
        b=Rtw/E7wky3Z+bsIG8KXJiUlshjwK0cFUfRZVWlWBNWtwyoJ+iDlq5D4oPo0J4Q490m
         55ukTNPbXa6o4X8+GjxsDEJZxsXCOEtuN+72OXTXHJvCa5i2LQKsjXkOmADdGdx0gGi7
         UQOOUlxjI5/5RWPNLi3hI2gFua3quRoxbdJsPFfdl2fNbexT9vVT2gQojiinfFVrSNIc
         s3Gu/y594erzsgodnLCE8vj4hPJsRkNxT9hnM0trpImgbhMY/ASbVpCMDeOPB4T/FJ3v
         iLFfJ0vvgevFWv8kRQh76+Emm3Gkysb+2l0/jqMaSfpMgufiCTIzo7Ey4VDVZKY37gdy
         tEuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=QkkcnwFf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e13-20020ad4418d000000b0064711f7b6cesi5577793qvp.603.2023.10.23.10.09.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Oct 2023 10:09:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=QkkcnwFf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1quyQV-0004S8-RW; Mon, 23 Oct 2023 13:09:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1quyQS-0004RA-Us; Mon, 23 Oct 2023 13:09:13 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1quyQR-0004Ju-7A; Mon, 23 Oct 2023 13:09:12 -0400
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39NGjXu1020498; Mon, 23 Oct 2023 17:08:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=56TAYe4jMsA2K9CSB96fKcnyNqTUMT7iqIFk15jeCHM=;
 b=QkkcnwFf/Fd9L/ifad7PSszBPopRHkgX4wAs16bCtepkjir7Ed1DtpyiCuwnLzrvgLHo
 Wl6TDA/G7S0YQahyizBSSsLqUVOspDnw80YhJQGxMK7IaF+1QkanOU4gz9Ua+zb/Er/n
 bZfWX9oOIKcO6uMvuZjlldZubO9e3NgAwLWlgoWoSoTQg6LHw9kuC/npNHMPoqweD5C9
 gZVOFkZ1t67JFRnmJgFH1PXtZhKdzQCrifK8Sm7fFqFASkfXWp6B1mcjT9dBsv/dXdLP
 jIbrRFW/t9vNC360hYVtZ3jrf+J+gAA9IYOh0FmKTEQNQEfSAa+rGe6S2KBF1CVWJQWy gQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3twvmsrvnt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Oct 2023 17:08:51 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39NGjgSE021558;
 Mon, 23 Oct 2023 17:08:51 GMT
Received: from ppma13.dal12v.mail.ibm.com
 (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3twvmsrvnc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Oct 2023 17:08:51 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
 by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 39NEUCCs024392; Mon, 23 Oct 2023 17:08:50 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
 by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tvu6jsksk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Oct 2023 17:08:50 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com
 [10.241.53.104])
 by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 39NH8oHq45220166
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 23 Oct 2023 17:08:50 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 145DE58065;
 Mon, 23 Oct 2023 17:08:50 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7BB3358056;
 Mon, 23 Oct 2023 17:08:48 +0000 (GMT)
Received: from [9.67.93.191] (unknown [9.67.93.191])
 by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 23 Oct 2023 17:08:48 +0000 (GMT)
Message-ID: <f2a50afd-3fa1-47d2-960e-0aaaf57c7cd2@linux.ibm.com>
Date: Mon, 23 Oct 2023 12:08:47 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 02/10] hw/fsi: Introduce IBM's scratchpad
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, clg@kaod.org, peter.maydell@linaro.org,
 andrew@codeconstruct.com.au, joel@jms.id.au, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, thuth@redhat.com,
 lvivier@redhat.com
Cc: qemu-arm@nongnu.org, Andrew Jeffery <andrew@aj.id.au>
References: <20231021211720.3571082-1-ninad@linux.ibm.com>
 <20231021211720.3571082-3-ninad@linux.ibm.com>
 <957bc5db-53aa-6946-edf3-3b728a52b660@linaro.org>
From: Ninad Palsule <ninad@linux.ibm.com>
In-Reply-To: <957bc5db-53aa-6946-edf3-3b728a52b660@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: kkUTwDcct006zzG7tzwcrBnQ0dcxA0nI
X-Proofpoint-GUID: sCuTPTX_VXjUOZp9ZTXFASWJrD2ZylzE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-23_15,2023-10-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 mlxlogscore=794 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 bulkscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2310170001
 definitions=main-2310230148
Received-SPF: pass client-ip=148.163.158.5; envelope-from=ninad@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
X-TUID: Tf1qTLFMGhyj

Hello Philippe,

On 10/23/23 10:00, Philippe Mathieu-Daudé wrote:
> On 21/10/23 23:17, Ninad Palsule wrote:
>> This is a part of patchset where scratchpad is introduced.
>>
>> The scratchpad provides a set of non-functional registers. The firmware
>> is free to use them, hardware does not support any special management
>> support. The scratchpad registers can be read or written from LBUS
>> slave.
>>
>> In this model, The LBUS device is parent for the scratchpad.
>>
>> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
>> ---
>> v2:
>> - Incorporated Joel's review comments.
>> v5:
>> - Incorporated review comments by Cedric.
>> v6:
>> - Incorporated review comments by Daniel.
>> ---
>>   meson.build                        |  1 +
>>   hw/fsi/trace.h                     |  1 +
>>   include/hw/fsi/engine-scratchpad.h | 32 ++++++++++
>>   include/hw/fsi/fsi.h               | 16 +++++
>>   hw/fsi/engine-scratchpad.c         | 93 ++++++++++++++++++++++++++++++
>>   hw/fsi/Kconfig                     |  4 ++
>>   hw/fsi/meson.build                 |  1 +
>>   hw/fsi/trace-events                |  2 +
>>   8 files changed, 150 insertions(+)
>>   create mode 100644 hw/fsi/trace.h
>>   create mode 100644 include/hw/fsi/engine-scratchpad.h
>>   create mode 100644 include/hw/fsi/fsi.h
>>   create mode 100644 hw/fsi/engine-scratchpad.c
>>   create mode 100644 hw/fsi/trace-events
>
>
>> diff --git a/include/hw/fsi/fsi.h b/include/hw/fsi/fsi.h
>> new file mode 100644
>> index 0000000000..e65f26f17b
>> --- /dev/null
>> +++ b/include/hw/fsi/fsi.h
>> @@ -0,0 +1,16 @@
>> +/*
>> + * SPDX-License-Identifier: GPL-2.0-or-later
>> + * Copyright (C) 2023 IBM Corp.
>> + *
>> + * IBM Flexible Service Interface
>> + */
>> +#ifndef FSI_FSI_H
>> +#define FSI_FSI_H
>> +
>> +/* Bitwise operations at the word level. */
>> +#define BE_BIT(x)                          BIT(31 - (x))
>> +#define GENMASK(t, b) \
>> +    (((1ULL << ((t) + 1)) - 1) & ~((1ULL << (b)) - 1))
>
> Please use MAKE_64BIT_MASK() from "qemu/bitops.h".

The GENMASK and MAKE_64BIT_MASK macros are invoke differently.

GENMASK is invoked with bit t and bit b (t:b) and it provides the mask and

MAKE_64BIT_MASK uses shift and length.

Thanks for the review.

Regards,

Ninad


>> +#define BE_GENMASK(t, b)                   GENMASK(BE_BIT(t), 
>> BE_BIT(b))
>> +
>> +#endif
>
