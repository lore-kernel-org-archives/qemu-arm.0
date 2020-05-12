Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1292283lfb;
        Tue, 12 May 2020 09:08:01 -0700 (PDT)
X-Google-Smtp-Source: APiQypL66+tdBoWzaUKTtNrSCh6nu/m6J2iKYdxDEgtiwTr1mx9dvNJwGhT/vehkLx+3kcCVIlp1
X-Received: by 2002:ac8:6c24:: with SMTP id k4mr22418218qtu.257.1589299680882;
        Tue, 12 May 2020 09:08:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589299680; cv=none;
        d=google.com; s=arc-20160816;
        b=Sf0J18uT3xvjYmVfD69+QCNO/4ajbViZmq2buzDZNAk99gQigSDUNzOfhObYloZYQL
         FGkS6LjzQTN38Exo9SaL5CtikwICJ/ya2Ww82/0DcSfXZVQNybiO7Fcd9gemxDRtdeDx
         gc3MgiOcISQePqhZuogOkhULakoLuU8yEjrrnSLDT9/K7P6UPSBYWVK9YCvr+HzBt/9e
         S1TUXLcM+JzUlA4LmSY2jafAFY/XhOQ6OSoLTuHWwGMnmRVqvoM7MsjX8m2sPDofFNgK
         9aKc341w38npx9qEsuZNIwFCA/n+djJqRCn+j9K8F9ANqAGb97zEkeR5dtGLENZQ9oPH
         F8Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=UpYSVuyK37jJDs7hfdSmo4Ay0sFMeeX3TPz10R8/6qs=;
        b=atK+yR5SXXldLrMMzc8xGDCeP5pkANjdWte29q3g/ERSAuEAbnA93oD8oT0HtU/zIS
         BVG5vuCOJxMdPcVwE9Baq70feKFhcSBt/Va15DEeH1t40UiRzHrYeJOshulQcYjqTaz8
         5yjv/2WcD5wAgUG03DPhZX/37ezA4NL3GOmOEFL6ZKDlKYbh/vcpvjnLZLyUKwVRJl7Z
         7+Ao9fvY5dkQhbQXS5X+Tolegdooo7WvGTZLxUNZRTv6LtJaI0OaVWtDUoAeQvz3k9Ci
         GRPTmi0YJbt/AJyqew27+TgWecZ35ZTaKwHDEwrcVOezTOMHpz1j4klWRN8las1cGRi2
         Ir3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=IdjKyA8u;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o60si2800041qtd.365.2020.05.12.09.08.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 May 2020 09:08:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=IdjKyA8u;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jYXRo-0001g6-5h
	for alex.bennee@linaro.org; Tue, 12 May 2020 12:08:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jYXQd-0008Hz-7j
 for qemu-devel@nongnu.org; Tue, 12 May 2020 12:06:47 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:59518
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jYXQb-0004kI-A5
 for qemu-devel@nongnu.org; Tue, 12 May 2020 12:06:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589299602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UpYSVuyK37jJDs7hfdSmo4Ay0sFMeeX3TPz10R8/6qs=;
 b=IdjKyA8ukXc6Ge1xTXT9atXjudy9ku7lPJQE8BXqCEMLMG1ougIQU0oX6lsy2biO2NXsOv
 QKSp6a1zldYAXRWT00eINMrL9NllllWZPHXhqHR5P0r0BqwJ7egS81XAflQh1pu5PORKU5
 ogwNYdn2V0dxMSDhyK5jgYdJub57bu0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-305-rAxhbb0PPWWeCoeLewNDfQ-1; Tue, 12 May 2020 12:06:41 -0400
X-MC-Unique: rAxhbb0PPWWeCoeLewNDfQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 943661052508;
 Tue, 12 May 2020 16:06:38 +0000 (UTC)
Received: from [10.36.112.22] (ovpn-112-22.ams2.redhat.com [10.36.112.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C05AB7D8EE;
 Tue, 12 May 2020 16:06:28 +0000 (UTC)
Subject: Re: [PATCH v2 2/3] arm/acpi: TPM2 ACPI table support
To: Igor Mammedov <imammedo@redhat.com>
References: <20200505144419.29174-1-eric.auger@redhat.com>
 <20200505144419.29174-3-eric.auger@redhat.com>
 <20200512162716.7a4204dd@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <330da1c1-9fc0-8dee-fd2b-2bd5d26cbfd4@redhat.com>
Date: Tue, 12 May 2020 18:06:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20200512162716.7a4204dd@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.120;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/12 02:20:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, drjones@redhat.com, gshan@redhat.com,
 mst@redhat.com, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, marcandre.lureau@redhat.com, eric.auger.pro@gmail.com,
 lersek@redhat.com, ardb@kernel.org, stefanb@linux.ibm.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZHr15xPGHba2

Hi Igor,

On 5/12/20 4:27 PM, Igor Mammedov wrote:
> On Tue,  5 May 2020 16:44:18 +0200
> Eric Auger <eric.auger@redhat.com> wrote:
> 
>> Add a TPM2 ACPI table if a TPM2.0 sysbus device has been
>> dynamically instantiated.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
> on x86 we also do:
> 
>   fw_cfg_add_file(x86ms->fw_cfg, ACPI_BUILD_TPMLOG_FILE,                       
>                   tables.tcpalog->data, acpi_data_len(tables.tcpalog)); 
> 
> question is why it's not necessary in case of ARM?
you have it in virt_acpi_setup():
fw_cfg_add_file(vms->fw_cfg, ACPI_BUILD_TPMLOG_FILE,
tables.tcpalog->data, acpi_data_len(tables.tcpalog));

Thanks

Eric
> 
>>
>> ---
>>
>> v1 -> v2:
>> - reuse generic build_tpm2() and alloc log area externally
>> - call tpm_find() once in build_tpm2()
>> ---
>>  include/sysemu/tpm.h     |  2 ++
>>  hw/acpi/aml-build.c      |  5 +++--
>>  hw/arm/virt-acpi-build.c | 11 +++++++++++
>>  3 files changed, 16 insertions(+), 2 deletions(-)
>>
>> diff --git a/include/sysemu/tpm.h b/include/sysemu/tpm.h
>> index f37851b1aa..03fb25941c 100644
>> --- a/include/sysemu/tpm.h
>> +++ b/include/sysemu/tpm.h
>> @@ -50,6 +50,8 @@ typedef struct TPMIfClass {
>>  
>>  #define TPM_IS_TIS_ISA(chr)                         \
>>      object_dynamic_cast(OBJECT(chr), TYPE_TPM_TIS_ISA)
>> +#define TPM_IS_TIS_SYSBUS(chr)                      \
>> +    object_dynamic_cast(OBJECT(chr), TYPE_TPM_TIS_SYSBUS)
>>  #define TPM_IS_CRB(chr)                             \
>>      object_dynamic_cast(OBJECT(chr), TYPE_TPM_CRB)
>>  #define TPM_IS_SPAPR(chr)                           \
>> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
>> index 1f7fd09112..4224675cb2 100644
>> --- a/hw/acpi/aml-build.c
>> +++ b/hw/acpi/aml-build.c
>> @@ -1882,12 +1882,13 @@ void build_tpm2(GArray *table_data, BIOSLinker *linker, GArray *tcpalog)
>>      unsigned log_addr_size = sizeof(tpm2_ptr->log_area_start_address);
>>      unsigned log_addr_offset =
>>          (char *)&tpm2_ptr->log_area_start_address - table_data->data;
>> +    TPMIf *tpmif = tpm_find();
>>  
>>      tpm2_ptr->platform_class = cpu_to_le16(TPM2_ACPI_CLASS_CLIENT);
>> -    if (TPM_IS_TIS_ISA(tpm_find())) {
>> +    if (TPM_IS_TIS_ISA(tpmif) || TPM_IS_TIS_SYSBUS(tpmif)) {
>>          tpm2_ptr->control_area_address = cpu_to_le64(0);
>>          tpm2_ptr->start_method = cpu_to_le32(TPM2_START_METHOD_MMIO);
>> -    } else if (TPM_IS_CRB(tpm_find())) {
>> +    } else if (TPM_IS_CRB(tpmif)) {
>>          tpm2_ptr->control_area_address = cpu_to_le64(TPM_CRB_ADDR_CTRL);
>>          tpm2_ptr->start_method = cpu_to_le32(TPM2_START_METHOD_CRB);
>>      } else {
>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>> index 81d41a3990..1a2ec10c8f 100644
>> --- a/hw/arm/virt-acpi-build.c
>> +++ b/hw/arm/virt-acpi-build.c
>> @@ -41,11 +41,13 @@
>>  #include "hw/acpi/pci.h"
>>  #include "hw/acpi/memory_hotplug.h"
>>  #include "hw/acpi/generic_event_device.h"
>> +#include "hw/acpi/tpm.h"
>>  #include "hw/pci/pcie_host.h"
>>  #include "hw/pci/pci.h"
>>  #include "hw/arm/virt.h"
>>  #include "sysemu/numa.h"
>>  #include "sysemu/reset.h"
>> +#include "sysemu/tpm.h"
>>  #include "kvm_arm.h"
>>  #include "migration/vmstate.h"
>>  
>> @@ -831,6 +833,15 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>>          build_iort(tables_blob, tables->linker, vms);
>>      }
>>  
>> +    if (tpm_get_version(tpm_find()) == TPM_VERSION_2_0) {
>> +        acpi_data_push(tables->tcpalog, TPM_LOG_AREA_MINIMUM_SIZE);
>> +        bios_linker_loader_alloc(tables->linker, ACPI_BUILD_TPMLOG_FILE,
>> +                                 tables->tcpalog, 1, false);
>> +
>> +        acpi_add_table(table_offsets, tables_blob);
>> +        build_tpm2(tables_blob, tables->linker, tables->tcpalog);
>> +    }
>> +
>>      /* XSDT is pointed to by RSDP */
>>      xsdt = tables_blob->len;
>>      build_xsdt(tables_blob, tables->linker, table_offsets, NULL, NULL);
> 

