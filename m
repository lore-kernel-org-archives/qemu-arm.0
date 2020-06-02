Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp4099704lfc;
        Tue, 2 Jun 2020 06:55:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyMekrw/YmUG52Xegyc+iv+GUcJOvXNCJQs6LWEu6e+69CjsjZAkKB/EqzIFLUAifb9YF5R
X-Received: by 2002:a25:845:: with SMTP id 66mr43957689ybi.7.1591106146504;
        Tue, 02 Jun 2020 06:55:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591106146; cv=none;
        d=google.com; s=arc-20160816;
        b=DYX6vFVm4xWG5DU4lILj/lBvg131pzUIknNgTThOM89PQTwEmMEGZe9u/0qdfQk1jv
         Ur8FEUETp4lmqHuoqZkL51wiAn2r86j9C58qQMeQK1OfHsra/+eYAeOslAHErS3AUHNz
         KNhTWi07JqiJXXyszDQohqVVYZHwcYATS5TRnkEAGL7D0eDWLLkPeNaj1R6A+U1khuDk
         92hGsGq1kIZt2NaYRAmzi579F3GYN+0rJpaOiImJFt5zJyF5e7f0AnhVgd+oUy/lhQXT
         3a6w8U2Y6TazndcHo0bfSXc3Lpy0NXd+S2moUMFIv7DmRLNJWbEUz9YUSWykQfHCh+W+
         7wpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=NGYOAyyD99wYiWqBcRcOA8kdzUTjUB9FXFWdJxtZas0=;
        b=VkjmRNptPGVmR8SaT25IdOR8qdWy05c8mYdPy0bhlPDPb6c+yLMInU7Zh3jqkVeYZ5
         K0w53wZZSUv5QPZE/GnlHdyV61sIlZ1GnS1BgoyZYq7yl0PZaaCDP5tm00MRpOm3CAij
         uuuXhLmRv3RZtwkZA8gFtwZvjNvkJil0Je0rG1KENzVm4p03FcqnRxaZTz1Xd5kYw3wv
         W7wOnjl0gGsRkVEeQAGPvK17vHYiz0KqbqcVsqGmLalhg5gigjtH858zs2x3w6doPFDE
         O/9+AweAmk4VGrP+pHJqQS7WcsaCDjSd2Bfbnz0Ux6jEMQmoAAVoYWGUBXAWu3wdDHQ4
         4qhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RhZtfq4H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r15si609353ybs.152.2020.06.02.06.55.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jun 2020 06:55:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RhZtfq4H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jg7OL-0006P6-Si
	for alex.bennee@linaro.org; Tue, 02 Jun 2020 09:55:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jg7OE-0006Of-CL
 for qemu-arm@nongnu.org; Tue, 02 Jun 2020 09:55:38 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:25278
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jg7OC-0000kE-Q9
 for qemu-arm@nongnu.org; Tue, 02 Jun 2020 09:55:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591106135;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NGYOAyyD99wYiWqBcRcOA8kdzUTjUB9FXFWdJxtZas0=;
 b=RhZtfq4HQHFxi30jgHrHahVBMO0e/DQkXRxC2/4zHzyR4HwLEsHSzBPoqfXTqPqAA8pTQI
 Vdo8AuNoa/E2GELXXwI2FskmvtStkyDU/W+lDWw6E54Gjz060434bOTVxCXFymQARd7b/p
 BWZnmCZZsodL2BWokYsX9Ikz+/lMx+U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-E6BKoKT5MMWR2E-3GltP7g-1; Tue, 02 Jun 2020 09:55:33 -0400
X-MC-Unique: E6BKoKT5MMWR2E-3GltP7g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6F0798015CE;
 Tue,  2 Jun 2020 13:55:32 +0000 (UTC)
Received: from [10.36.113.56] (ovpn-113-56.ams2.redhat.com [10.36.113.56])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9B4691001281;
 Tue,  2 Jun 2020 13:55:27 +0000 (UTC)
Subject: Re: [PATCH v3 1/4] acpi: Convert build_tpm2() to build_append* API
To: Stefan Berger <stefanb@linux.ibm.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <20200601095737.32671-1-eric.auger@redhat.com>
 <20200601095737.32671-2-eric.auger@redhat.com>
 <46c71777-b588-ce1f-eb8d-de1c5b3e2186@linux.ibm.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <6bd7f3a0-5a40-823e-bf67-309c9995e18e@redhat.com>
Date: Tue, 2 Jun 2020 15:55:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <46c71777-b588-ce1f-eb8d-de1c5b3e2186@linux.ibm.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/02 03:23:32
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
X-TUID: scZWr7YAlXGB

Hi Stefan,
On 6/2/20 3:30 PM, Stefan Berger wrote:
> On 6/1/20 5:57 AM, Eric Auger wrote:
>> In preparation of its move to the generic acpi code,
>> let's convert build_tpm2() to use build_append API. This
>> latter now is prefered in place of direct ACPI struct field
>> settings with manual endianness conversion.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> ---
>>   hw/i386/acpi-build.c | 28 +++++++++++++++++++---------
>>   1 file changed, 19 insertions(+), 9 deletions(-)
>>
>> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
>> index b5669d6c65..f0d35d7b17 100644
>> --- a/hw/i386/acpi-build.c
>> +++ b/hw/i386/acpi-build.c
>> @@ -2298,30 +2298,40 @@ build_tpm_tcpa(GArray *table_data, BIOSLinker
>> *linker, GArray *tcpalog)
>>   static void
>>   build_tpm2(GArray *table_data, BIOSLinker *linker, GArray *tcpalog)
>>   {
>> -    Acpi20TPM2 *tpm2_ptr = acpi_data_push(table_data, sizeof *tpm2_ptr);
>> +    Acpi20TPM2 *tpm2_ptr = acpi_data_push(table_data,
>> sizeof(AcpiTableHeader));
> 
> And now you want to build the data structure by pushing fields? I would
> definitely NOT do this.

If I didn't misinterpret things, this was recommended by Drew and Igor
as buid_append* API avoids to take care of endianness and this is the
API now used in the generic ACPI code. Besides I also think that in that
case it does not simplify things but maybe I did that the wrong way? Or
maybe I didn't understand your remark?

Thanks

Eric
> 
> 
>>       unsigned log_addr_size = sizeof(tpm2_ptr->log_area_start_address);
>>       unsigned log_addr_offset =
>>           (char *)&tpm2_ptr->log_area_start_address - table_data->data;
>> +    uint8_t start_method_params[12] = {};
>>   -    tpm2_ptr->platform_class = cpu_to_le16(TPM2_ACPI_CLASS_CLIENT);
>> +    /* platform class */
>> +    build_append_int_noprefix(table_data, TPM2_ACPI_CLASS_CLIENT, 2);
>> +    /* reserved */
>> +    build_append_int_noprefix(table_data, 0, 2);
>>       if (TPM_IS_TIS_ISA(tpm_find())) {
>> -        tpm2_ptr->control_area_address = cpu_to_le64(0);
>> -        tpm2_ptr->start_method = cpu_to_le32(TPM2_START_METHOD_MMIO);
>> +        /* address of control area */
>> +        build_append_int_noprefix(table_data, 0, 8);
>> +        /* start method */
>> +        build_append_int_noprefix(table_data, TPM2_START_METHOD_MMIO,
>> 4);
>>       } else if (TPM_IS_CRB(tpm_find())) {
>> -        tpm2_ptr->control_area_address = cpu_to_le64(TPM_CRB_ADDR_CTRL);
>> -        tpm2_ptr->start_method = cpu_to_le32(TPM2_START_METHOD_CRB);
>> +        build_append_int_noprefix(table_data, TPM_CRB_ADDR_CTRL, 8);
>> +        build_append_int_noprefix(table_data, TPM2_START_METHOD_CRB, 4);
>>       } else {
>>           g_warn_if_reached();
>>       }
>>   -    tpm2_ptr->log_area_minimum_length =
>> -        cpu_to_le32(TPM_LOG_AREA_MINIMUM_SIZE);
>> +    /* platform specific parameters */
>> +    g_array_append_vals(table_data, &start_method_params, 12);
>>   -    acpi_data_push(tcpalog,
>> le32_to_cpu(tpm2_ptr->log_area_minimum_length));
>> +    /* log area minimum length */
>> +    build_append_int_noprefix(table_data, TPM_LOG_AREA_MINIMUM_SIZE, 4);
>> +
>> +    acpi_data_push(tcpalog, TPM_LOG_AREA_MINIMUM_SIZE);
>>       bios_linker_loader_alloc(linker, ACPI_BUILD_TPMLOG_FILE,
>> tcpalog, 1,
>>                                false);
>>         /* log area start address to be filled by Guest linker */
>> +    build_append_int_noprefix(table_data, 0, 8);
>>       bios_linker_loader_add_pointer(linker, ACPI_BUILD_TABLE_FILE,
>>                                      log_addr_offset, log_addr_size,
>>                                      ACPI_BUILD_TPMLOG_FILE, 0);
> 
> 

