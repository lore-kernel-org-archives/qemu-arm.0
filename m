Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2646464lfm;
        Tue, 16 Jun 2020 07:04:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzuXx6wtixJ0MOauRPKg5DlPChPWYi7wHDZlaq8APcQSN90USEM9eXUf55U2nkVmSN4HXZw
X-Received: by 2002:a5b:707:: with SMTP id g7mr4260942ybq.136.1592316264177;
        Tue, 16 Jun 2020 07:04:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592316264; cv=none;
        d=google.com; s=arc-20160816;
        b=sFlBeaNs56MQhh2HWmrDH3H85zKsb5xB7UPq8QrJgrQ97PydcQ8j2IJewcEqjgKSfb
         0y7Bpj6/Sii4Xk3sOIqHwpeFscmhG2sNtZ7lhRslu06kgPz9BMKPg4gTSqRFrXF73VWs
         GepF5JZHyCcCI1X6HGZ/qnMGfMClS6OksrxLmk4RayrAQk+/dyr5Se7UzmL7wdCGNwZK
         rWiZiC9Bjt/rFksE94Gzi0s/FW8vgCs/57gPLvkaILHlRj642vz6aL1nMShPCRFmDBAQ
         2CZTB6KSd4us6BXWnVgNciSg2toVdbjCySqDrrRrNDjD92s+MLcQvqVhr+7h9+2wP98Y
         LeNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=6vMqdIRadLG9Kx5Tr3tzdLBOs94mgbswzQFeFIVcxpA=;
        b=mU1gA2qoRxM3J+p0RvebE/CAagGWlWt/yAKmwmmpwNHyCXs8R5oA9GoCop+iE21DwH
         5e7hi9pkeNEDVA+GLFUx2rxHTCEocHjUsjk4TnhpBP+Zghr5dWP6JeVJ9vp4LNpOLeSq
         xgu4MktMANOcCIsMxfm8GLsaCLNwGw/oLWs+PCD67mdCsfIPsPzeiV5tSuRja2DhuLVj
         yPReIxCxl1SuX/8cNHwz5Oif9MRPb0BkbvoAN8PfgfDHIjDJsAWFHajVdlpSVFe5urUP
         C5/Vgn/ovlRTg1Nixdr/WBZeKiVZOGsm8nTfIfrv0GQvrJBTMhRUhlNwCs+oiFsRbFy5
         rTTg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=QQXF5YQu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v203si15994551ybv.150.2020.06.16.07.04.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jun 2020 07:04:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=QQXF5YQu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlCCN-000209-FZ
	for alex.bennee@linaro.org; Tue, 16 Jun 2020 10:04:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jlCBi-0001PK-MT
 for qemu-arm@nongnu.org; Tue, 16 Jun 2020 10:03:42 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:26060
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jlCBg-0004HZ-8T
 for qemu-arm@nongnu.org; Tue, 16 Jun 2020 10:03:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592316219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6vMqdIRadLG9Kx5Tr3tzdLBOs94mgbswzQFeFIVcxpA=;
 b=QQXF5YQu1TnpRfX5NyTaW5CSk70unIY5+aq0dDnOPWL0DYN4iT/47Ueg9sDhNHMutmjFfi
 RQgCtEAtQFR/Mr37ebyILniX/dZTUth196+gevwUvwbJHHXOJAmS3XDyqIXSUEoKPJkNIi
 NHeWSgVURXmO4cpQiYPkbFADwtLSk1c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-7-nAtnBYAhMYKdPV8g1S-YrA-1; Tue, 16 Jun 2020 10:03:37 -0400
X-MC-Unique: nAtnBYAhMYKdPV8g1S-YrA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8597619057A3;
 Tue, 16 Jun 2020 14:03:35 +0000 (UTC)
Received: from [10.36.114.197] (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 66331707C6;
 Tue, 16 Jun 2020 14:03:32 +0000 (UTC)
Subject: Re: [PATCH v4 1/5] acpi: Convert build_tpm2() to build_append* API
To: Igor Mammedov <imammedo@redhat.com>
References: <20200611135917.18300-1-eric.auger@redhat.com>
 <20200611135917.18300-2-eric.auger@redhat.com>
 <20200616143327.2ee38a48@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <5be07d03-8315-453a-6875-12142caf6f81@redhat.com>
Date: Tue, 16 Jun 2020 16:03:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20200616143327.2ee38a48@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.120;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/16 02:46:07
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, mst@redhat.com,
 lersek@redhat.com, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, marcandre.lureau@redhat.com, stefanb@linux.ibm.com,
 philmd@redhat.com, ardb@kernel.org, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 59UfeURYOJUa

Hi Igor,
On 6/16/20 2:33 PM, Igor Mammedov wrote:
> On Thu, 11 Jun 2020 15:59:13 +0200
> Eric Auger <eric.auger@redhat.com> wrote:
> 
>> In preparation of its move to the generic acpi code,
>> let's convert build_tpm2() to use build_append API. This
>> latter now is prefered in place of direct ACPI struct field
>> settings with manual endianness conversion.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>
>> ---
>>
>> v3 -> v4:
>> - Don't use Acpi20TPM2 *tpm2_ptr anymore
>> - Use variables for control area start address and start method
>> - Simplified arg values passed to bios_linker_loader_add_pointer
>> - use g_assert_not_reached()
>> ---
>>  hw/i386/acpi-build.c | 49 +++++++++++++++++++++++++++++---------------
>>  1 file changed, 33 insertions(+), 16 deletions(-)
>>
>> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
>> index b5669d6c65..f150d95ecc 100644
>> --- a/hw/i386/acpi-build.c
>> +++ b/hw/i386/acpi-build.c
>> @@ -2298,35 +2298,52 @@ build_tpm_tcpa(GArray *table_data, BIOSLinker *linker, GArray *tcpalog)
>>  static void
>>  build_tpm2(GArray *table_data, BIOSLinker *linker, GArray *tcpalog)
>>  {
>> -    Acpi20TPM2 *tpm2_ptr = acpi_data_push(table_data, sizeof *tpm2_ptr);
>> -    unsigned log_addr_size = sizeof(tpm2_ptr->log_area_start_address);
>> -    unsigned log_addr_offset =
>> -        (char *)&tpm2_ptr->log_area_start_address - table_data->data;
>> +    uint8_t start_method_params[12] = {};
>> +    unsigned log_addr_offset, tpm2_start;
>> +    uint64_t control_area_start_address;
>> +    uint32_t start_method;
>> +    void *tpm2_ptr;
>>  
>> -    tpm2_ptr->platform_class = cpu_to_le16(TPM2_ACPI_CLASS_CLIENT);
>> +    tpm2_start = table_data->len;
>> +    tpm2_ptr = acpi_data_push(table_data, sizeof(AcpiTableHeader));
>> +
>> +    /* Platform Class */
>> +    build_append_int_noprefix(table_data, TPM2_ACPI_CLASS_CLIENT, 2);
>> +    /* Reserved */
>> +    build_append_int_noprefix(table_data, 0, 2);
>>      if (TPM_IS_TIS_ISA(tpm_find())) {
>> -        tpm2_ptr->control_area_address = cpu_to_le64(0);
>> -        tpm2_ptr->start_method = cpu_to_le32(TPM2_START_METHOD_MMIO);
>> +        control_area_start_address = 0;
>> +        start_method = TPM2_START_METHOD_MMIO;
>>      } else if (TPM_IS_CRB(tpm_find())) {
>> -        tpm2_ptr->control_area_address = cpu_to_le64(TPM_CRB_ADDR_CTRL);
>> -        tpm2_ptr->start_method = cpu_to_le32(TPM2_START_METHOD_CRB);
>> +        control_area_start_address = TPM_CRB_ADDR_CTRL;
>> +        start_method = TPM2_START_METHOD_CRB;
>>      } else {
>> -        g_warn_if_reached();
>> +        g_assert_not_reached();
>>      }
>> +    /* Address of Control Area */
>> +    build_append_int_noprefix(table_data, control_area_start_address, 8);
>> +    /* Start Method */
>> +    build_append_int_noprefix(table_data, start_method, 4);
>>  
>> -    tpm2_ptr->log_area_minimum_length =
>> -        cpu_to_le32(TPM_LOG_AREA_MINIMUM_SIZE);
>> +    /* Platform Specific Parameters */
>> +    g_array_append_vals(table_data, &start_method_params,
>> +                        ARRAY_SIZE(start_method_params));
>>  
>> -    acpi_data_push(tcpalog, le32_to_cpu(tpm2_ptr->log_area_minimum_length));
>> +    /* Log Area Minimum Length */
>> +    build_append_int_noprefix(table_data, TPM_LOG_AREA_MINIMUM_SIZE, 4);
> 
> question not related to conversion:
> Is it a part of 'Platform Specific Parameters'?
no I don't think so.
> (as per spec table ends with it. if yes, then probably add pointer to place in spec
> wher its documented.
Actually I failed to identify the place in the documentation. I looked
at the Acpi20TPM2 struct instead :-)
> 
>> +
>> +    acpi_data_push(tcpalog, TPM_LOG_AREA_MINIMUM_SIZE);
>>      bios_linker_loader_alloc(linker, ACPI_BUILD_TPMLOG_FILE, tcpalog, 1,
>>                               false);
>>  
>> -    /* log area start address to be filled by Guest linker */
>> +    log_addr_offset = table_data->len;
>> +    build_append_int_noprefix(table_data, 0, 8);
>> +    /* Log Area Start Address to be filled by Guest linker */
> move this line to where it used to be or at least above build_append_int_noprefix()
ok
> 
>>      bios_linker_loader_add_pointer(linker, ACPI_BUILD_TABLE_FILE,
>> -                                   log_addr_offset, log_addr_size,
>> +                                   log_addr_offset, 8,
>>                                     ACPI_BUILD_TPMLOG_FILE, 0);
>>      build_header(linker, table_data,
>> -                 (void *)tpm2_ptr, "TPM2", sizeof(*tpm2_ptr), 4, NULL, NULL);
>> +                 tpm2_ptr, "TPM2", table_data->len - tpm2_start, 4, NULL, NULL);
>>  }
>>  
>>  #define HOLE_640K_START  (640 * KiB)
> 
> nevertheless looks like faithfull conversion,
> btw why you didn't drop Acpi20TPM2 structure definition?
I did not look if it were used elsewhere and also it reflects a state of
the spec. As I mentioned above, I was not able to find some info in the
spec.

Please note that the conversion was already pulled upstream but Michael
took an ancient version of this patch. So I sent "[PATCH v5 0/3]
vTPM/aarch64 ACPI support" this morning to fix the situation.

Thanks

Eric
> 
> 

