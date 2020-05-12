Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1197070lfb;
        Tue, 12 May 2020 07:11:43 -0700 (PDT)
X-Google-Smtp-Source: APiQypKeULmpa9OdKc5mEn204z6O5tT021jZUtvKjF4r0OdwdTsHe6+j/JHrnskTI+SACp8Pj5wK
X-Received: by 2002:a0c:a8e5:: with SMTP id h37mr21171447qvc.69.1589292703074;
        Tue, 12 May 2020 07:11:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589292703; cv=none;
        d=google.com; s=arc-20160816;
        b=kC9cBHXjCsibnJG3owzjrGxvBbY7hMCBDbSb2fJs926mXlT1UPHHI3+J/k+X6VvpQv
         ZmDtLpVXCt7wlYp8E+6e6k7uhMo8yy40O8JTOW/XYn9QRS97G9F5QGcj3HIy636pFqAU
         KsjRHPUGcLAsxDeYLQrv1yLh+cBkhNsJH7dZuiHry3iQ9YuyhVhDSUIF7pO3lGzroC02
         0bMoDxZYluWEqmVwD+TstfRjdz0fBSHDvONiF+KAcjjRkdnmrYskfcsyZaiSv8V0lv4Y
         dM/14n2Z+pm3qO40aaOPJRf63KsWF9rff8CvJvvPSmsWxM4WnRpDFF8Ab4R4qdXTSwoH
         /qmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=9FmnWCLISYh3uqio3qyRlBxr41kap8GNAr1IL+E7wc0=;
        b=xKmnlhKwAl6BEn27KSv9QO0dQJyUsG2zY17JfrjKUFshD39ZXk4HoSmMbY+vnIDFzf
         kb38zFimnjffD8Ydx203Brefuv3wzgml0OP3PhFd3JEaE/iuKtI7585jH31QFe86FU+S
         c5nMyBBI1JLIrqzZWHQyBdvuPxG0Cfe8R9LMcj44u4R4srK7SUxBxGRWD5i9JaUbUGL3
         Hmq2gUv++9t8KzFVEnk1o4KkyMHG82+D4dwZqChfBUG6nC3S7HuPY3idkaDZ7Ok1j+ri
         ncg4TbZjGRXmYdGJ1IhwAwj+wzXCCel9bI5ZWlshZdLBV85Nbg+0qZqbhf851lJPp44K
         UCqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YvdcToF6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o54si3466181qtj.258.2020.05.12.07.11.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 May 2020 07:11:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YvdcToF6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jYVdG-0006uN-Gv
	for alex.bennee@linaro.org; Tue, 12 May 2020 10:11:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jYVcb-0006Fw-7h
 for qemu-arm@nongnu.org; Tue, 12 May 2020 10:11:01 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:48250
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jYVcZ-0000wO-Lc
 for qemu-arm@nongnu.org; Tue, 12 May 2020 10:11:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589292657;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9FmnWCLISYh3uqio3qyRlBxr41kap8GNAr1IL+E7wc0=;
 b=YvdcToF6/BRk2JAxXBxqqJ+hU5GHztZ7BowxySuK/QhNjBitkKGymS//y8aFcxa6Cqw6bc
 iY5Gj2is2ak5ElZAG2GkUacL+wPbbBv8VUVEEJC7Plf8W8/SeArF2wozlk7QEYNQ9N26Mb
 Zrk3s/z7zr5KtzWcVrk7Yb5uInACy3k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-Gk0qdbNaNk29SWuS0fdAkw-1; Tue, 12 May 2020 10:10:56 -0400
X-MC-Unique: Gk0qdbNaNk29SWuS0fdAkw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6DE92805725;
 Tue, 12 May 2020 14:10:54 +0000 (UTC)
Received: from localhost (unknown [10.40.208.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1DF1E5C662;
 Tue, 12 May 2020 14:10:31 +0000 (UTC)
Date: Tue, 12 May 2020 16:10:29 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Auger Eric <eric.auger@redhat.com>
Subject: Re: [PATCH v2 1/3] acpi: Move build_tpm2() in the generic part
Message-ID: <20200512161029.35c77730@redhat.com>
In-Reply-To: <b8b64cf5-d730-20f0-c9e5-d290b8639e5a@redhat.com>
References: <20200505144419.29174-1-eric.auger@redhat.com>
 <20200505144419.29174-2-eric.auger@redhat.com>
 <20200506063314.4qvnyfonjixcknuj@kamzik.brq.redhat.com>
 <b8b64cf5-d730-20f0-c9e5-d290b8639e5a@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/12 01:41:59
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
Cc: peter.maydell@linaro.org, Andrew Jones <drjones@redhat.com>,
 gshan@redhat.com, mst@redhat.com, qemu-devel@nongnu.org,
 shannon.zhaosl@gmail.com, qemu-arm@nongnu.org, marcandre.lureau@redhat.com,
 stefanb@linux.ibm.com, lersek@redhat.com, ardb@kernel.org,
 eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1Bc8AU0yKBwa

On Wed, 6 May 2020 11:50:09 +0200
Auger Eric <eric.auger@redhat.com> wrote:

> Hi,
> 
> On 5/6/20 8:33 AM, Andrew Jones wrote:
> > On Tue, May 05, 2020 at 04:44:17PM +0200, Eric Auger wrote:  
> >> We plan to build the tpm2 table on ARM too. In order to reuse the
> >> generation code, let's move build_tpm2() to aml-build.c.
> >>
> >> No change in the implementation.
> >>
> >> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> >> ---
> >>  include/hw/acpi/aml-build.h |  2 ++
> >>  hw/acpi/aml-build.c         | 30 ++++++++++++++++++++++++++++++
> >>  hw/i386/acpi-build.c        | 30 ------------------------------
> >>  3 files changed, 32 insertions(+), 30 deletions(-)
> >>
> >> diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
> >> index 0f4ed53d7f..a67ab4618a 100644
> >> --- a/include/hw/acpi/aml-build.h
> >> +++ b/include/hw/acpi/aml-build.h
> >> @@ -437,4 +437,6 @@ void build_slit(GArray *table_data, BIOSLinker *linker, MachineState *ms);
> >>  
> >>  void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
> >>                  const char *oem_id, const char *oem_table_id);
> >> +
> >> +void build_tpm2(GArray *table_data, BIOSLinker *linker, GArray *tcpalog);
> >>  #endif
> >> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> >> index 2c3702b882..1f7fd09112 100644
> >> --- a/hw/acpi/aml-build.c
> >> +++ b/hw/acpi/aml-build.c
> >> @@ -26,6 +26,7 @@
> >>  #include "qemu/bitops.h"
> >>  #include "sysemu/numa.h"
> >>  #include "hw/boards.h"
> >> +#include "hw/acpi/tpm.h"
> >>  
> >>  static GArray *build_alloc_array(void)
> >>  {
> >> @@ -1875,6 +1876,35 @@ build_hdr:
> >>                   "FACP", tbl->len - fadt_start, f->rev, oem_id, oem_table_id);
> >>  }
> >>  
> >> +void build_tpm2(GArray *table_data, BIOSLinker *linker, GArray *tcpalog)
> >> +{
> >> +    Acpi20TPM2 *tpm2_ptr = acpi_data_push(table_data, sizeof *tpm2_ptr);
> >> +    unsigned log_addr_size = sizeof(tpm2_ptr->log_area_start_address);
> >> +    unsigned log_addr_offset =
> >> +        (char *)&tpm2_ptr->log_area_start_address - table_data->data;
> >> +
> >> +    tpm2_ptr->platform_class = cpu_to_le16(TPM2_ACPI_CLASS_CLIENT);
> >> +    if (TPM_IS_TIS_ISA(tpm_find())) {
> >> +        tpm2_ptr->control_area_address = cpu_to_le64(0);
> >> +        tpm2_ptr->start_method = cpu_to_le32(TPM2_START_METHOD_MMIO);
> >> +    } else if (TPM_IS_CRB(tpm_find())) {
> >> +        tpm2_ptr->control_area_address = cpu_to_le64(TPM_CRB_ADDR_CTRL);
> >> +        tpm2_ptr->start_method = cpu_to_le32(TPM2_START_METHOD_CRB);
> >> +    } else {
> >> +        g_warn_if_reached();
> >> +    }
> >> +
> >> +    tpm2_ptr->log_area_minimum_length =
> >> +        cpu_to_le32(TPM_LOG_AREA_MINIMUM_SIZE);
> >> +
> >> +    /* log area start address to be filled by Guest linker */
> >> +    bios_linker_loader_add_pointer(linker, ACPI_BUILD_TABLE_FILE,
> >> +                                   log_addr_offset, log_addr_size,
> >> +                                   ACPI_BUILD_TPMLOG_FILE, 0);
> >> +    build_header(linker, table_data,
> >> +                 (void *)tpm2_ptr, "TPM2", sizeof(*tpm2_ptr), 4, NULL, NULL);
> >> +}
> >> +  
> > 
> > I'll let Igor and mst confirm/deny this, but my understanding was that the
> > build_append* API was the preferred way to create the table. Indeed, I
> > don't see too many table.field = cpu_to_le(...) lines in aml-build.c
> > 
> > I realize this function is just getting moved, but maybe it should get
> > converted to the build_append* API while being moved?  
> 
> The reason I did not convert is that the struct is as follows
> 
> struct Acpi20TPM2 {
>     ACPI_TABLE_HEADER_DEF
>     uint16_t platform_class;
>     uint16_t reserved;
>     uint64_t control_area_address;
>     uint32_t start_method;
>     uint8_t start_method_params[12];
>     uint32_t log_area_minimum_length;
>     uint64_t log_area_start_address;
> } QEMU_PACKED;
> 
> 
> If I understand correctly the build_append* adds the fields
> contiguously. It was not straightforward to me how to skip the
> start_method_params array.

you can use g_array_append_vals() for adding byte array (even is it's all zeros)

> While we are at it the tcpalog arg is not used. Shall I remove it?
> 
> Thanks
> 
> Eric
> 
> > 
> > Thanks,
> > drew
> > 
> >   

