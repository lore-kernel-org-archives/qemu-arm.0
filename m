Received: by 10.80.166.35 with SMTP id d32csp291503edc;
        Fri, 14 Oct 2016 06:51:45 -0700 (PDT)
X-Received: by 10.55.10.12 with SMTP id 12mr11070568qkk.209.1476453105272;
        Fri, 14 Oct 2016 06:51:45 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k125si9744437qkc.53.2016.10.14.06.51.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 14 Oct 2016 06:51:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47459 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bv2tk-0004Nj-NF
	for alex.bennee@linaro.org; Fri, 14 Oct 2016 09:51:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59810)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1bv2tP-00049W-MX
	for qemu-arm@nongnu.org; Fri, 14 Oct 2016 09:51:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1bv2tJ-0003VZ-Nb
	for qemu-arm@nongnu.org; Fri, 14 Oct 2016 09:51:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43132)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>)
	id 1bv2tJ-0003VJ-Do; Fri, 14 Oct 2016 09:51:17 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BDBB780F63;
	Fri, 14 Oct 2016 13:51:16 +0000 (UTC)
Received: from localhost.localdomain (vpn1-4-131.ams2.redhat.com [10.36.4.131])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9EDpDvu017171
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 14 Oct 2016 09:51:14 -0400
To: Igor Mammedov <imammedo@redhat.com>
References: <1476435295-21885-1-git-send-email-eric.auger@redhat.com>
	<1476435295-21885-3-git-send-email-eric.auger@redhat.com>
	<20161014144129.7826bfc8@nial.brq.redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <ef27e7f9-6e4c-88d9-0c8e-650c490609f9@redhat.com>
Date: Fri, 14 Oct 2016 15:51:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <20161014144129.7826bfc8@nial.brq.redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Fri, 14 Oct 2016 13:51:16 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 2/2] ARM: Virt: ACPI: Build
 an IORT table with RC and ITS nodes
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, drjones@redhat.com, tn@semihalf.com,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	shannon.zhao@linaro.org, prem.mallappa@broadcom.com,
	christoffer.dall@linaro.org, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: p7JbYSxYXfw0

Hi Igor, Shannon

On 14/10/2016 14:41, Igor Mammedov wrote:
> On Fri, 14 Oct 2016 10:54:55 +0200
> Eric Auger <eric.auger@redhat.com> wrote:
> 
>> From: Prem Mallappa <prem.mallappa@broadcom.com>
>>
>> This patch builds an IORT table that features a root complex node and
>> an ITS node. This complements the ITS description in the ACPI MADT
>> table and allows vhost-net on ACPI guest.
>>
>> Signed-off-by: Prem Mallappa <prem.mallappa@broadcom.com>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>
>> ---
>>
>> v1 -> v2:
>> - its_class_name() || !guest_info->no_its now wraps acpi_add_table
>>   and build_iort
>> - add cpu_to_le*
>> - CCA = CPM = DACS = 1
>> - cleanup according to Drew's comments
>> - remove comments listing tables and spec revisions
>> ---
>>  hw/arm/virt-acpi-build.c | 73 ++++++++++++++++++++++++++++++++++++++++--------
>>  1 file changed, 62 insertions(+), 11 deletions(-)
>>
>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>> index fa0655a..5fc0fd7 100644
>> --- a/hw/arm/virt-acpi-build.c
>> +++ b/hw/arm/virt-acpi-build.c
> [...]
> 
>> +static void
>>  build_spcr(GArray *table_data, BIOSLinker *linker, VirtGuestInfo *guest_info)
>>  {
>>      AcpiSerialPortConsoleRedirection *spcr;
>> @@ -667,17 +724,6 @@ void virt_acpi_build(VirtGuestInfo *guest_info, AcpiBuildTables *tables)
>>                               ACPI_BUILD_TABLE_FILE, tables_blob,
>>                               64, false /* high memory */);
>>  
>> -    /*
>> -     * The ACPI v5.1 tables for Hardware-reduced ACPI platform are:
>> -     * RSDP
>> -     * RSDT
>> -     * FADT
>> -     * GTDT
>> -     * MADT
>> -     * MCFG
>> -     * DSDT
>> -     */
> deleting unrelated hunk?
This follows one Drew's comment stating this was not really useful to
continue maintaining it. If Shannon agrees I can submit a separate patch
then to remove it. Waiting for Shannon's answer ...

Thanks

Eric 	
> 
>> -
>>      /* DSDT is pointed to by FADT */
>>      dsdt = tables_blob->len;
>>      build_dsdt(tables_blob, tables->linker, guest_info);
>> @@ -703,6 +749,11 @@ void virt_acpi_build(VirtGuestInfo *guest_info, AcpiBuildTables *tables)
>>          build_srat(tables_blob, tables->linker, guest_info);
>>      }
>>  
>> +    if (its_class_name() && !guest_info->no_its) {
>> +        acpi_add_table(table_offsets, tables_blob);
>> +        build_iort(tables_blob, tables->linker, guest_info);
>> +    }
>> +
>>      /* RSDT is pointed to by RSDP */
>>      rsdt = tables_blob->len;
>>      build_rsdt(tables_blob, tables->linker, table_offsets, NULL, NULL);
> 
> 
