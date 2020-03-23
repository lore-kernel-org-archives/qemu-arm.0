Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp1556579lfi;
        Mon, 23 Mar 2020 07:59:51 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvVgK4PXj3spLXM/7hllCB8JSDjMlfvml9A67IUgRz0cZM1K9WQTsHNNaHKDCJXK5RekkU8
X-Received: by 2002:a0c:f647:: with SMTP id s7mr21362424qvm.4.1584975591095;
        Mon, 23 Mar 2020 07:59:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584975591; cv=none;
        d=google.com; s=arc-20160816;
        b=FTw7fPCd/cHOZ4K/dlHhrhkdPOeihDctKQGz16uPbEfEtK23wXL4iv4xOT2ij09kJ0
         t5YjMfUhBUC2pXzlJr+SYlVuDH5GLucJP98aeOUd4vJ4XnfTv9AUkDQmSNV27FkDxX7+
         rsYqkkxcubLadz/4fjl8a/A0vl02rcmeCLDCbg6vpbpInHchG5zF7wW0PrSZgsg/Adm/
         nN0H3IpRB6cxhNsq1RjHYEHivPyIIyApzUc5mjeqNzC6CFTRiN6AqijncPU5zFIJt5vq
         kPtUg49sCyhwHh141im5S6tXvRjZkZP3TJcLKOSTAlvyS8NL90BtmwO373/KU2rr0NFj
         JSjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=u7nyB+lWQprElDIOs52J7ylHk6LCg+31QVwb10AMke8=;
        b=Uzd7mkp6VVo6tcXZgb0V5UUXfNVfBUybm0XbGbx7IKu+oxm+EaG/GAhIp7fF0ETwNg
         HhNm54nJSzo5lCziNXCO0U/ZY6yHNJVV4jj2TpuzPb5vUna8uBHa3Voih5qf6fhOiqD5
         ywAc12/ErEk5HD4BKyqDpnuYb8FSroPRX3c+15lu/NtlfRQGuDthdLTZpeFDdXD5kMmw
         FlBfH5gbEwEP3Xnsj6Bl1PDrCB8ejtmwZS31w3ExzNXvMm9Ldp6asIhftpxwnKxaFVIL
         KjnZeyisbAEnkTB/aO73wUM10i48afaIEDsciz/2H6DGKWITVndDwQHE7RiVxIV/Zl+u
         E90w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OXXZG13I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h8si8149170qvb.117.2020.03.23.07.59.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Mar 2020 07:59:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OXXZG13I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jGOYQ-0007x8-Gl
	for alex.bennee@linaro.org; Mon, 23 Mar 2020 10:59:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46157)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1jGOYH-0007wT-Bj
 for qemu-arm@nongnu.org; Mon, 23 Mar 2020 10:59:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1jGOYF-0006KV-E1
 for qemu-arm@nongnu.org; Mon, 23 Mar 2020 10:59:40 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:30817)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1jGOYF-0006K0-4A
 for qemu-arm@nongnu.org; Mon, 23 Mar 2020 10:59:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584975578;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u7nyB+lWQprElDIOs52J7ylHk6LCg+31QVwb10AMke8=;
 b=OXXZG13I+Wlf8VPi8tfBLRbBr0dTfEDl2S0UjtuqFTv6cnUNik82Lw6t73IWR/KUv/6r9d
 XAzEo1vOlNm/Y3duEkiw+dlbifuCrCb/R25c9kR7fK6IEdlPPPkDUCGk9590EQtBhKrNFB
 kBE/CVPfSVmnVnkL/AexqYOEFlwidFc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101-gcDtLcoxP42q9KgFlcU8sQ-1; Mon, 23 Mar 2020 10:59:35 -0400
X-MC-Unique: gcDtLcoxP42q9KgFlcU8sQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5D2F08024CD;
 Mon, 23 Mar 2020 14:59:34 +0000 (UTC)
Received: from localhost (unknown [10.40.208.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 386785DA85;
 Mon, 23 Mar 2020 14:59:18 +0000 (UTC)
Date: Mon, 23 Mar 2020 15:59:17 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Subject: Re: [PATCH v3 04/10] hw/acpi/nvdimm: Fix for NVDIMM incorrect DSM
 output buffer length
Message-ID: <20200323155917.60ce6c0f@redhat.com>
In-Reply-To: <20200311172014.33052-5-shameerali.kolothum.thodi@huawei.com>
References: <20200311172014.33052-1-shameerali.kolothum.thodi@huawei.com>
 <20200311172014.33052-5-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
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
Cc: peter.maydell@linaro.org, xiaoguangrong.eric@gmail.com,
 shannon.zhaosl@gmail.com, david@redhat.com, qemu-devel@nongnu.org,
 xuwei5@hisilicon.com, linuxarm@huawei.com, eric.auger@redhat.com,
 qemu-arm@nongnu.org, mst@redhat.com, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dINKVcV6der9

On Wed, 11 Mar 2020 17:20:08 +0000
Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:

> As per ACPI spec 6.3, Table 19-419 Object Conversion Rules, if
> the Buffer Field <= to the size of an Integer (in bits), it will
> be treated as an integer. Moreover, the integer size depends on
> DSDT tables revision number. If revision number is < 2, integer
> size is 32 bits, otherwise it is 64 bits. Current NVDIMM common
> DSM aml code (NCAL) uses CreateField() for creating DSM output
> buffer. This creates an issue in arm/virt platform where DSDT
> revision number is 2 and results in DSM buffer with a wrong
> size(8 bytes) gets returned when actual length is < 8 bytes.
> This causes guest kernel to report,
> 
> "nfit ACPI0012:00: found a zero length table '0' parsing nfit"
> 
> In order to fix this, aml code is now modified such that it builds
> the DSM output buffer in a byte by byte fashion when length is
> smaller than Integer size.
> 
> Suggested-by: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
> v2 -> v3
>  - Using Integer size as 8 bytes instead of SizeOf(Integer) 
> ---
>  hw/acpi/nvdimm.c                            | 40 +++++++++++++++++++--
>  tests/qtest/bios-tables-test-allowed-diff.h |  2 ++
>  2 files changed, 39 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/acpi/nvdimm.c b/hw/acpi/nvdimm.c
> index 5219dd0e2e..213556f35d 100644
> --- a/hw/acpi/nvdimm.c
> +++ b/hw/acpi/nvdimm.c
> @@ -938,6 +938,7 @@ static void nvdimm_build_common_dsm(Aml *dev)
>      Aml *method, *ifctx, *function, *handle, *uuid, *dsm_mem, *elsectx2;
>      Aml *elsectx, *unsupport, *unpatched, *expected_uuid, *uuid_invalid;
>      Aml *pckg, *pckg_index, *pckg_buf, *field, *dsm_out_buf, *dsm_out_buf_size;
> +    Aml *whilectx, *offset;
>      uint8_t byte_list[1];
>  
>      method = aml_method(NVDIMM_COMMON_DSM, 5, AML_SERIALIZED);
> @@ -1091,13 +1092,46 @@ static void nvdimm_build_common_dsm(Aml *dev)
>      /* RLEN is not included in the payload returned to guest. */
>      aml_append(method, aml_subtract(aml_name(NVDIMM_DSM_OUT_BUF_SIZE),
>                 aml_int(4), dsm_out_buf_size));
> +
> +    /*
> +     * As per ACPI spec 6.3, Table 19-419 Object Conversion Rules, if
> +     * the Buffer Field <= to the size of an Integer (in bits), it will
> +     * be treated as an integer. Moreover, the integer size depends on
> +     * DSDT tables revision number. If revision number is < 2, integer
> +     * size is 32 bits, otherwise it is 64 bits.
> +     * Because of this CreateField() canot be used if RLEN < Integer Size.
> +     *
> +     * Also please note that APCI ASL operator SizeOf() doesn't support
> +     * Integer and there isn't any other way to figure out the Integer
> +     * size. Hence we assume 8 byte as Integer size and if RLEN < 8 bytes,
> +     * build dsm_out_buf byte by byte.
> +     */
> +    ifctx = aml_if(aml_lless(dsm_out_buf_size, aml_int(8)));
> +    offset = aml_local(2);
> +    aml_append(ifctx, aml_store(aml_int(0), offset));
> +    aml_append(ifctx, aml_name_decl("TBUF", aml_buffer(1, NULL)));
> +    aml_append(ifctx, aml_store(aml_buffer(0, NULL), dsm_out_buf));
> +
> +    whilectx = aml_while(aml_lless(offset, dsm_out_buf_size));
> +    /* Copy 1 byte at offset from ODAT to temporary buffer(TBUF). */
> +    aml_append(whilectx, aml_store(aml_derefof(aml_index(
> +                                   aml_name(NVDIMM_DSM_OUT_BUF), offset)),
> +                                   aml_index(aml_name("TBUF"), aml_int(0))));
> +    aml_append(whilectx, aml_concatenate(dsm_out_buf, aml_name("TBUF"),
> +                                         dsm_out_buf));
> +    aml_append(whilectx, aml_increment(offset));
> +    aml_append(ifctx, whilectx);
> +
> +    aml_append(ifctx, aml_return(dsm_out_buf));
> +    aml_append(method, ifctx);
> +
> +    /* If RLEN >= Integer size, just use CreateField() operator */
>      aml_append(method, aml_store(aml_shiftleft(dsm_out_buf_size, aml_int(3)),
>                                   dsm_out_buf_size));
>      aml_append(method, aml_create_field(aml_name(NVDIMM_DSM_OUT_BUF),
>                 aml_int(0), dsm_out_buf_size, "OBUF"));
> -    aml_append(method, aml_concatenate(aml_buffer(0, NULL), aml_name("OBUF"),
> -                                       dsm_out_buf));
> -    aml_append(method, aml_return(dsm_out_buf));
> +    aml_append(method, aml_return(aml_name("OBUF")));
> +
>      aml_append(dev, method);
>  }
>  
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index dfb8523c8b..eb8bae1407 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1 +1,3 @@
>  /* List of comma-separated changed AML files to ignore */
> +"tests/data/acpi/pc/SSDT.dimmpxm",
> +"tests/data/acpi/q35/SSDT.dimmpxm",

