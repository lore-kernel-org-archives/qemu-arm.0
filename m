Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp3091217lfg;
        Wed, 26 Feb 2020 05:40:09 -0800 (PST)
X-Google-Smtp-Source: APXvYqzf/yJKoXRYUB3a/6NEBmjScgq3B5caa2EQ8kokCENJ8s4ZoGzPWe32RRfReQlDGecf6m8A
X-Received: by 2002:ac8:f67:: with SMTP id l36mr5001856qtk.373.1582724409356;
        Wed, 26 Feb 2020 05:40:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582724409; cv=none;
        d=google.com; s=arc-20160816;
        b=ocdQUeLb6KivDd6KRJkoXrGgxDwp617UCnbcvO74LHKtMzwK5waEunosaU0aVlSOqa
         mGIbXHFxWBT5KCqeeowQKTz5nWV9cxVyWT41FuiTx56jN7OFdsWKW5YOaalobpZ35zrP
         OCg5FNNy4T+BCiWSwA2Sd3wIGmZRJFswbRd7kMtFu2A+JCD34TRAJ6dgkXbMD3NQ6gyB
         MO7SW3kepmwSky1JGMpLJbeQPqvO8oPd2vqw0zlzNMSb1hw8X3k29ylWMcUs4BChQqRZ
         ykCyorrglP+pewap5pt84LbG7M+/ANF2Ku8dwvROYIDNPIqe1wRyzB3N5X2r24HZvFHb
         lYng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=JI40NIhrfEYr+hjW+76mtTaWR5ZnVrEJ7mKKgRBOpvY=;
        b=JD+ayHy3As24FgYm4+g4ZekmVHiriUAyq0XfNyUbS4+zXGFsgtCwDfxP4f1WEec2VL
         FcKbjtfdTGwYiQR9lRrHwryBgggLMGNInJOL4fQGnmTPCJY4SNzSO0TOfTSRhzgl1ATO
         MkkrLvOb6yydT4igFTrMWQR41CSkmEeXTHAtoj3husAR06nIBBxcduflyJO3/v7MiUcE
         IEk8kB/HmTixucNTqquJ/RakklbTLjH59aRF6WLTDDx0IHHcPgALW/xYi7T8/79UZhJX
         kahjc8l60V4IhkmahQ0fFXAqqgdd4SIVHewUXclRoZY5XUa6H0z6En86fkMLOAMG34cJ
         ZR+g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j22si1034720qtp.152.2020.02.26.05.40.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Feb 2020 05:40:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1]:44504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6wv2-000422-QI
	for alex.bennee@linaro.org; Wed, 26 Feb 2020 08:40:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42362)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanb@linux.ibm.com>) id 1j6wuf-0003Xb-E5
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 08:39:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanb@linux.ibm.com>) id 1j6wue-00053w-6X
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 08:39:45 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:4228
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanb@linux.ibm.com>)
 id 1j6wue-000535-1J; Wed, 26 Feb 2020 08:39:44 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01QDdg5H130507; Wed, 26 Feb 2020 08:39:42 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ydqkavyhu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Feb 2020 08:39:26 -0500
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 01QDTwdd089447;
 Wed, 26 Feb 2020 08:39:26 -0500
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ydqkavyh8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Feb 2020 08:39:26 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 01QDZKOD024903;
 Wed, 26 Feb 2020 13:39:25 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma03wdc.us.ibm.com with ESMTP id 2ydcmknh1f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Feb 2020 13:39:25 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01QDdPoV50921910
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Feb 2020 13:39:25 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7722B2805A;
 Wed, 26 Feb 2020 13:39:25 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 63E3D2805C;
 Wed, 26 Feb 2020 13:39:25 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 26 Feb 2020 13:39:25 +0000 (GMT)
Subject: Re: [PATCH v3 09/10] test: tpm-tis: Get prepared to share tests
 between ISA and sysbus devices
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <20200226102549.12158-1-eric.auger@redhat.com>
 <20200226102549.12158-10-eric.auger@redhat.com>
From: Stefan Berger <stefanb@linux.ibm.com>
Message-ID: <bea97d7f-cae2-20ad-b3f0-b1822f5857a9@linux.ibm.com>
Date: Wed, 26 Feb 2020 08:39:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200226102549.12158-10-eric.auger@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-26_04:2020-02-26,
 2020-02-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 mlxscore=0 spamscore=0 adultscore=0 mlxlogscore=999 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002260101
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.158.5
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
Cc: marcandre.lureau@redhat.com, lersek@redhat.com, ardb@kernel.org,
 philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6Kw/dRTC76h1

On 2/26/20 5:25 AM, Eric Auger wrote:
> ISA and sysbus TPM-TIS devices will share their tests. Only
> the main() will change (instantiation option is different).
> Also the base address of the TPM-TIS device is going to be
> different. on x86 it is located at 0xFED40000 while on ARM
> it can be located at any location, discovered through the
> device tree description.
>
> So we put shared test functions in a new object module.
> Each test needs to set tpm_tis_base_addr global variable.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>   tests/qtest/Makefile.include     |   2 +-
>   tests/qtest/tpm-crb-swtpm-test.c |   3 +
>   tests/qtest/tpm-crb-test.c       |   2 +
>   tests/qtest/tpm-tis-swtpm-test.c |   3 +
>   tests/qtest/tpm-tis-test.c       | 414 +----------------------------
>   tests/qtest/tpm-tis-util.c       | 433 +++++++++++++++++++++++++++++++
>   tests/qtest/tpm-tis-util.h       |  23 ++
>   tests/qtest/tpm-util.c           |   3 -
>   tests/qtest/tpm-util.h           |   5 +
>   9 files changed, 473 insertions(+), 415 deletions(-)
>   create mode 100644 tests/qtest/tpm-tis-util.c
>   create mode 100644 tests/qtest/tpm-tis-util.h
>
> diff --git a/tests/qtest/Makefile.include b/tests/qtest/Makefile.include
> index 028af5b782..44aac68b25 100644
> --- a/tests/qtest/Makefile.include
> +++ b/tests/qtest/Makefile.include
> @@ -302,7 +302,7 @@ tests/qtest/tpm-crb-swtpm-test$(EXESUF): tests/qtest/tpm-crb-swtpm-test.o tests/
>   tests/qtest/tpm-crb-test$(EXESUF): tests/qtest/tpm-crb-test.o tests/qtest/tpm-emu.o $(test-io-obj-y)
>   tests/qtest/tpm-tis-swtpm-test$(EXESUF): tests/qtest/tpm-tis-swtpm-test.o tests/qtest/tpm-emu.o \
>   	tests/qtest/tpm-util.o tests/qtest/tpm-tests.o $(test-io-obj-y)
> -tests/qtest/tpm-tis-test$(EXESUF): tests/qtest/tpm-tis-test.o tests/qtest/tpm-emu.o $(test-io-obj-y)
> +tests/qtest/tpm-tis-test$(EXESUF): tests/qtest/tpm-tis-test.o tests/qtest/tpm-tis-util.o tests/qtest/tpm-emu.o $(test-io-obj-y)
>   
>   # QTest rules
>   
> diff --git a/tests/qtest/tpm-crb-swtpm-test.c b/tests/qtest/tpm-crb-swtpm-test.c
> index 5228cb7af4..ac92f08bee 100644
> --- a/tests/qtest/tpm-crb-swtpm-test.c
> +++ b/tests/qtest/tpm-crb-swtpm-test.c
> @@ -18,6 +18,9 @@
>   #include "libqtest.h"
>   #include "qemu/module.h"
>   #include "tpm-tests.h"
> +#include "hw/acpi/tpm.h"
> +
> +uint64_t tpm_tis_base_addr = TPM_TIS_ADDR_BASE;
>   
>   typedef struct TestState {
>       char *src_tpm_path;
> diff --git a/tests/qtest/tpm-crb-test.c b/tests/qtest/tpm-crb-test.c
> index 632fb7fbd8..cdd09e5396 100644
> --- a/tests/qtest/tpm-crb-test.c
> +++ b/tests/qtest/tpm-crb-test.c
> @@ -19,6 +19,8 @@
>   #include "qemu/module.h"
>   #include "tpm-emu.h"
>   
> +uint64_t tpm_tis_base_addr = TPM_TIS_ADDR_BASE;
> +

Since crb shouldn't need it, can you add a comment 'Not used but needed 
for linking'? Same in tpm-crb-swtpm-test.c.

Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>


