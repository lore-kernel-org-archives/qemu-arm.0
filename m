Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp3813469ejf;
        Wed, 10 Aug 2022 07:39:23 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7xB8qpvcDUOm0qS/hGibOfa2AIfTaMU6adj0IoGZwEa78Sp/DVNm3b3t/xXswEuilKOkHr
X-Received: by 2002:a37:903:0:b0:6b9:402a:e395 with SMTP id 3-20020a370903000000b006b9402ae395mr13074717qkj.4.1660142362763;
        Wed, 10 Aug 2022 07:39:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660142362; cv=none;
        d=google.com; s=arc-20160816;
        b=zaSNxhviMpfyx3E3CUux09mraF+2eXjpus07OaAmVqgXy3GE2GBNQiMYTWN46+fOam
         RKrzEiyq+CdTxOoWIEDaXVEuyOrC2yExK+Lifj9033TvWKjAtwX/ytlwK325Zvj/Cmlu
         hkSjTKF+FwwKWpImd7MEFGvRS2MP2VaFfpEJcPLHh9K8KNnH/k0CTXZeEBSTOpi5VwKu
         GJzyVirqQIyD1Lp8puq5u/VIsem+qJmub3yz4PkUwPC4R3D88pLkYflbpJU1JnBbPyT6
         /Run2MjCM5vrcuXZOXsgVcPysjGq9x8+BUbKaXOlwJjxXlN6LWywFmbbu8/boMMcWx8y
         MqUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=A8h4g01n62DRhvQzYbW3g3Wl7zcqdfeiFcBmaZRXSiE=;
        b=fZHtPL36vJJcvKcIIUiQFOLUPyWai16lccTpMcSlSnCs1b3Pqi8MmLdplwfkl4ZUPQ
         SHz9qBY2GBVSq8CUiIa91bFycQkIHZMuUWyn1PMmGockHTgG67ff7aVft+Vt41/s2CY1
         2sgMwq56DwB4pzkEixvoysDKTFpawXcNjYRNz6tz7gACcHNca1NOtSRDhAHRPGoSV4DS
         Csrv+wDkMzkrhBsmKhUm1Oi19YUXwMnI4okSjX7hYFfK9uR4uyYLcpTCxOUP5aJ/cTjI
         xapd+RG33ZlKbAEJLzo49TJ4UqshdAhSj7Qjzgmk2TdegS359vN6HNlCGDCa8PMeqEkb
         K8rw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=FW5pxaqZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 10-20020a0562140d0a00b004748cf3c9ecsi9482240qvh.504.2022.08.10.07.39.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Aug 2022 07:39:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=FW5pxaqZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1]:56482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oLmri-0004oa-8S
	for alex.bennee@linaro.org; Wed, 10 Aug 2022 10:39:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1oLmrP-0004kd-Ou; Wed, 10 Aug 2022 10:39:04 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:23158)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1oLmrM-0002Ef-Md; Wed, 10 Aug 2022 10:39:03 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27AEViAK020688;
 Wed, 10 Aug 2022 14:38:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=A8h4g01n62DRhvQzYbW3g3Wl7zcqdfeiFcBmaZRXSiE=;
 b=FW5pxaqZlR1F+4u40RIF0BbHyIj2j2tlvXNgHDPJj815qxWgVD/BNQ20gtrIzjhB6JB0
 Kt6R1gjCSB4sgf4y0VZyQJOnXttPCpbbWwJztBcTMpqH+OFzd93T5gr4PLBnbrfijxMd
 N9UeNacq2KLwTxjrP566h0u6CNxNVQ9BhBVK02Zb+IcIP20T3ZB+27JVCu9CXnUvG+6u
 tn17MCEHMERuz6NFHAml+HYHQiPThlPqzhrQ+BYtgO4yFvhqPxiupkPjT9XgE315+/Zo
 UgfWMgJz4CrVimrxMG7fA2kzg8jMC9m1k6+roav8Hl/aBhHmvIeQDaprOGGfIS+LgxbU 7A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hv3fg5pgq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Aug 2022 14:38:50 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27AEI0A6028027;
 Wed, 10 Aug 2022 14:38:46 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hv3fg5p12-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Aug 2022 14:38:46 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27AEVQSK005349;
 Wed, 10 Aug 2022 14:38:16 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma03dal.us.ibm.com with ESMTP id 3huwvke8rq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Aug 2022 14:38:16 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 27AEcFm218612622
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Aug 2022 14:38:15 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7CA5D6E04E;
 Wed, 10 Aug 2022 14:38:15 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 70CDA6E050;
 Wed, 10 Aug 2022 14:38:14 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 10 Aug 2022 14:38:14 +0000 (GMT)
Message-ID: <b09c7104-d329-2185-9ab8-042b12309668@linux.ibm.com>
Date: Wed, 10 Aug 2022 10:38:13 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [RFC 1/1] hw: tpmtisspi: add SPI support to QEMU TPM
 implementation
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Iris Chen <irischenlj@gmail.com>
Cc: irischenlj@fb.com, peter@pjd.dev, pdel@fb.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, patrick@stwcx.xyz, alistair@alistair23.me,
 kwolf@redhat.com, hreitz@redhat.com, peter.maydell@linaro.org,
 andrew@aj.id.au, joel@jms.id.au, thuth@redhat.com, lvivier@redhat.com,
 pbonzini@redhat.com, qemu-block@nongnu.org, dz4list@gmail.com
References: <20220803023241.63739-1-irischenlj@gmail.com>
 <20220803023241.63739-2-irischenlj@gmail.com>
 <36a20515-461d-0f27-3be8-a4edd099165a@kaod.org>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <36a20515-461d-0f27-3be8-a4edd099165a@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 4YM5H_xk6FfdASQgZUOF1hgm_wrx3nDO
X-Proofpoint-GUID: nklUcGatdC3pimg8aKk4zjT7xmc65pSS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-10_08,2022-08-10_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0
 impostorscore=0 phishscore=0 mlxlogscore=999 bulkscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208100046
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cOzG5/k2eKkY



On 8/3/22 04:52, Cédric Le Goater wrote:
> On 8/3/22 04:32, Iris Chen wrote:
>> From: Iris Chen <irischenlj@fb.com>
> 

>> +++ b/hw/tpm/tpm_tis_spi.c
>> @@ -0,0 +1,311 @@
>> +#include "qemu/osdep.h"
>> +#include "hw/qdev-properties.h"
>> +#include "migration/vmstate.h"
>> +#include "hw/acpi/tpm.h"
>> +#include "tpm_prop.h"
>> +#include "tpm_tis.h"
>> +#include "qom/object.h"
>> +#include "hw/ssi/ssi.h"
>> +#include "hw/ssi/spi_gpio.h"
>> +
>> +#define TPM_TIS_SPI_ADDR_BYTES 3
>> +#define SPI_WRITE 0
>> +
>> +typedef enum {
>> +    TIS_SPI_PKT_STATE_DEACTIVATED = 0,
>> +    TIS_SPI_PKT_STATE_START,
>> +    TIS_SPI_PKT_STATE_ADDRESS,
>> +    TIS_SPI_PKT_STATE_DATA_WR,
>> +    TIS_SPI_PKT_STATE_DATA_RD,
>> +    TIS_SPI_PKT_STATE_DONE,
>> +} TpmTisSpiPktState;
>> +
>> +union TpmTisRWSizeByte {
>> +    uint8_t byte;
>> +    struct {
>> +        uint8_t data_expected_size:6;
>> +        uint8_t resv:1;
>> +        uint8_t rwflag:1;
>> +    };

I think it would be better to define a mask for the number of bytes and 
a flag for read/write rather than using bitfields. It should better for 
portability.

    Stefan
