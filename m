Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp4123273lfc;
        Tue, 2 Jun 2020 07:24:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwGxoyjXp4/snvGoS1Zz1TbpDIgcAuBEIKaUbHdwkaTmKgLHSZJzonNCT957oo3xJ1vKao2
X-Received: by 2002:a25:7d42:: with SMTP id y63mr10560707ybc.392.1591107859415;
        Tue, 02 Jun 2020 07:24:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591107859; cv=none;
        d=google.com; s=arc-20160816;
        b=SnS3ctbvETxDXWY5rJhoRmz5qvgwannWPy+FyaGzVCzItA5yLuqxg1/9k56jy9YeCs
         +MHPOJ60JkbyZk/Bze4QNbpdKcpi9RHHM6tqwrTaZlmUNLYSDjZvFGD0PZzWnXo752w6
         dpUawVcz0XaZTeE7WKkmrl6MG8MpTNIcekz3JVEh8lOEgG2tA6fXz2LfxTuIsSNBZOTK
         jvUEA/MM7LwqS5aDftr6LSs9jyzR4EuMvDPrFh840AS443znIEmJzuR6LPr+RVvuorXN
         glNa8hE4IVVWoSB9FV9SdhkRYjhNLaRyR1X/juHhZDZTVcOcPd7Uc3QiPoJtqhXKbgon
         rVXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=Dj3EXNezPUMrIL1WC1M5gUojLPDZ8AtCEMOJsXhnHsc=;
        b=Y8VY77nGIlLDEEq9hdiLByT/dCLigzC5k1Fnxgmpn33NT3ngi0LflyPfzxRpfyozQ0
         5tZgRqX88Z1NIM2BvvVdIk+zVeafP+lRNstXfoLyVzUcUHkwqhKPsxSG8E6LXb7XYJ3B
         JXhGx2QoZEQ9mwGHVpcNfGLtN1yoxl9nI4PF6y3hOj/tWf03NVUqDwqXKfqt41PUpCVP
         SDqqRiC7gAhhwwthca+n2Fc6hJ6v7SHjIoTDu58yCtxc+xZUbEDq0fcp/SLcSl1DpWv7
         IHuACn504pmNj2X85SKGessyiEHIPOnGtt/Rm8vSz/4biOw3d5b5Wrui0t4LvaEoG4L4
         iIQg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m191si1991749ybm.346.2020.06.02.07.24.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jun 2020 07:24:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1]:50780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jg7py-0004xI-Oi
	for alex.bennee@linaro.org; Tue, 02 Jun 2020 10:24:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1jg7pq-0004x8-QY; Tue, 02 Jun 2020 10:24:10 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:24194)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1jg7pp-0001Vg-II; Tue, 02 Jun 2020 10:24:10 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 052E4cd4117335; Tue, 2 Jun 2020 10:24:06 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31dr0h9979-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Jun 2020 10:24:05 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 052E4f36117594;
 Tue, 2 Jun 2020 10:24:05 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31dr0h996k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Jun 2020 10:24:05 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 052EA5Aw012293;
 Tue, 2 Jun 2020 14:24:04 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma04wdc.us.ibm.com with ESMTP id 31bf48tf4v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Jun 2020 14:24:04 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 052EO33E52101522
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 2 Jun 2020 14:24:03 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BFE60112067;
 Tue,  2 Jun 2020 14:24:03 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AC198112064;
 Tue,  2 Jun 2020 14:24:03 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  2 Jun 2020 14:24:03 +0000 (GMT)
Subject: Re: [PATCH v3 1/4] acpi: Convert build_tpm2() to build_append* API
To: Auger Eric <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <20200601095737.32671-1-eric.auger@redhat.com>
 <20200601095737.32671-2-eric.auger@redhat.com>
 <46c71777-b588-ce1f-eb8d-de1c5b3e2186@linux.ibm.com>
 <6bd7f3a0-5a40-823e-bf67-309c9995e18e@redhat.com>
From: Stefan Berger <stefanb@linux.ibm.com>
Message-ID: <a85cc67e-2d8a-2034-3b85-6e8c8d7dcad6@linux.ibm.com>
Date: Tue, 2 Jun 2020 10:24:03 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <6bd7f3a0-5a40-823e-bf67-309c9995e18e@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-02_13:2020-06-02,
 2020-06-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0
 bulkscore=0 adultscore=0 impostorscore=0 cotscore=-2147483648 phishscore=0
 mlxlogscore=999 spamscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006020097
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/02 10:08:28
X-ACL-Warn: Detected OS   = Linux 3.x [generic] [fuzzy]
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, KHOP_DYNAMIC=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: marcandre.lureau@redhat.com, drjones@redhat.com, lersek@redhat.com,
 ardb@kernel.org, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: T2oBfqJo4vk3

On 6/2/20 9:55 AM, Auger Eric wrote:
> Hi Stefan,
> On 6/2/20 3:30 PM, Stefan Berger wrote:
>> On 6/1/20 5:57 AM, Eric Auger wrote:
>>> In preparation of its move to the generic acpi code,
>>> let's convert build_tpm2() to use build_append API. This
>>> latter now is prefered in place of direct ACPI struct field
>>> settings with manual endianness conversion.
>>>
>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>> ---
>>>    hw/i386/acpi-build.c | 28 +++++++++++++++++++---------
>>>    1 file changed, 19 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
>>> index b5669d6c65..f0d35d7b17 100644
>>> --- a/hw/i386/acpi-build.c
>>> +++ b/hw/i386/acpi-build.c
>>> @@ -2298,30 +2298,40 @@ build_tpm_tcpa(GArray *table_data, BIOSLinker
>>> *linker, GArray *tcpalog)
>>>    static void
>>>    build_tpm2(GArray *table_data, BIOSLinker *linker, GArray *tcpalog)
>>>    {
>>> -    Acpi20TPM2 *tpm2_ptr = acpi_data_push(table_data, sizeof *tpm2_ptr);
>>> +    Acpi20TPM2 *tpm2_ptr = acpi_data_push(table_data,
>>> sizeof(AcpiTableHeader));
>> And now you want to build the data structure by pushing fields? I would
>> definitely NOT do this.
> If I didn't misinterpret things, this was recommended by Drew and Igor
> as buid_append* API avoids to take care of endianness and this is the
> API now used in the generic ACPI code. Besides I also think that in that
> case it does not simplify things but maybe I did that the wrong way? Or
> maybe I didn't understand your remark?


If that's what they are saying... I would prefer filling out data 
structures with functions like cpu_to_acpi16() because that seems to be 
less error prone.


>>
>>>        unsigned log_addr_size = sizeof(tpm2_ptr->log_area_start_address);
>>>        unsigned log_addr_offset =
>>>            (char *)&tpm2_ptr->log_area_start_address - table_data->data;
>>> +    uint8_t start_method_params[12] = {};
>>>    -    tpm2_ptr->platform_class = cpu_to_le16(TPM2_ACPI_CLASS_CLIENT);
>>> +    /* platform class */
>>> +    build_append_int_noprefix(table_data, TPM2_ACPI_CLASS_CLIENT, 2);
>>> +    /* reserved */
>>> +    build_append_int_noprefix(table_data, 0, 2);
>>>        if (TPM_IS_TIS_ISA(tpm_find())) {
>>> -        tpm2_ptr->control_area_address = cpu_to_le64(0);
>>> -        tpm2_ptr->start_method = cpu_to_le32(TPM2_START_METHOD_MMIO);
>>> +        /* address of control area */
>>> +        build_append_int_noprefix(table_data, 0, 8);
>>> +        /* start method */
>>> +        build_append_int_noprefix(table_data, TPM2_START_METHOD_MMIO,
>>> 4);
>>>        } else if (TPM_IS_CRB(tpm_find())) {
>>> -        tpm2_ptr->control_area_address = cpu_to_le64(TPM_CRB_ADDR_CTRL);
>>> -        tpm2_ptr->start_method = cpu_to_le32(TPM2_START_METHOD_CRB);
>>> +        build_append_int_noprefix(table_data, TPM_CRB_ADDR_CTRL, 8);
>>> +        build_append_int_noprefix(table_data, TPM2_START_METHOD_CRB, 4);
>>>        } else {
>>>            g_warn_if_reached();
>>>        }
>>>    -    tpm2_ptr->log_area_minimum_length =
>>> -        cpu_to_le32(TPM_LOG_AREA_MINIMUM_SIZE);
>>> +    /* platform specific parameters */
>>> +    g_array_append_vals(table_data, &start_method_params, 12);

Maybe this should be wrapped in an inline function like 
build_append_array() or so.


>>>    -    acpi_data_push(tcpalog,
>>> le32_to_cpu(tpm2_ptr->log_area_minimum_length));
>>> +    /* log area minimum length */
>>> +    build_append_int_noprefix(table_data, TPM_LOG_AREA_MINIMUM_SIZE, 4);
>>> +
>>> +    acpi_data_push(tcpalog, TPM_LOG_AREA_MINIMUM_SIZE);


At this point we have a double-allocation of log memory on x86_64. You'd 
need the patch I posted to create the TCPA table only for TPM 1.2.



>>>        bios_linker_loader_alloc(linker, ACPI_BUILD_TPMLOG_FILE,
>>> tcpalog, 1,
>>>                                 false);
>>>          /* log area start address to be filled by Guest linker */
>>> +    build_append_int_noprefix(table_data, 0, 8);
>>>        bios_linker_loader_add_pointer(linker, ACPI_BUILD_TABLE_FILE,
>>>                                       log_addr_offset, log_addr_size,
>>>                                       ACPI_BUILD_TPMLOG_FILE, 0);
>>


