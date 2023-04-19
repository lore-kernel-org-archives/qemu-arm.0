Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp250062ejm;
        Tue, 18 Apr 2023 22:31:21 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZMyNleUHLcyKVrHLFrWDApKGWopuys3DtqRxe68BWcJqeoSSCRs1Mj6XDk77+PhwkFy26h
X-Received: by 2002:ad4:5965:0:b0:5ad:47a1:1fd8 with SMTP id eq5-20020ad45965000000b005ad47a11fd8mr26424037qvb.50.1681882281496;
        Tue, 18 Apr 2023 22:31:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681882281; cv=none;
        d=google.com; s=arc-20160816;
        b=WdHGPhgm+DYQMQOYraKjpOpFJvXkIc7GBA1T/Me4A28k6ZcMNh3oqjqfBmaVn6SfAa
         435+UFrfULLEd2MGPEVdF3KU+pNqHYe8/yzuhDdsiCM0iJPQdPsYANQngx+Dt1QOqADH
         voAi9LyJKbGPJ7gYo1X2P6tsKuUITSju8YKHWoHkluuMvWdJ1tM85w4YBCgTJSmRKJeS
         Kgw34YWoJpRFJH29bhxuek0Qw/43aME6Z3oPzacMp0FpLRbhcd9ZgddVct2KpA3RTeG4
         9JjFnfZWt6brr8lQcFJH50cNUQrfpr2iFq3NYWmrYIWI1wazYrdziPK7mKtEKu3EO70N
         aJIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=X7P20zMft03/QtI4a2h8bHRgl8d+BbRt0aljLaAsMJI=;
        b=zHTWcy7nlovXD6/qduonZt0LxJ/1lBSYFEGWmr2inXnJCzMJpIHKaATeDuUcKp9ec0
         GoG6s/NKyGxBhJ16UoHXNpj8tqDHGigTSDc/Bb4IErvF11sKGpbFcD3YvuDEeYIlAT7R
         ohVse8IBqqpwoxFpor31DX1VOfJoJC27ZgfV/NpAOAWLSNR6CX9ioBfObcDKHrf3Yu++
         HRnCLo5780nkkUmASodqZowAJV8R4a9Ax4WZFVeO6ICr/ixzm1B5i1VQTqu9CXARTAgA
         jJqZz+her8eqwZAXkMRxE1xuPvzCfD+Z7+MV4KFenfnrJYwec8XhnOCysKkAbb0uN8w4
         /Ptw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WG1cwJFd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 2-20020ad45ba2000000b005cf292cf8d1si8520272qvq.50.2023.04.18.22.31.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Apr 2023 22:31:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WG1cwJFd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pp0PQ-0001Hi-MI; Wed, 19 Apr 2023 01:31:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pp0PP-0001HM-NJ
 for qemu-arm@nongnu.org; Wed, 19 Apr 2023 01:31:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pp0PL-0000v6-0E
 for qemu-arm@nongnu.org; Wed, 19 Apr 2023 01:31:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681882265;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X7P20zMft03/QtI4a2h8bHRgl8d+BbRt0aljLaAsMJI=;
 b=WG1cwJFdQiTSeidawajj/fK+DRuLXeEf4sC0eBJA0tLlPuhASvvLeWNgORNlaTRQjYLwyX
 JzQGBkcXbjrAvIyVK57Jls1Wd1UhbEyKBYNgVgWg24QTbvHOaCyfhth7K6cWZiJ2ExMj7/
 4gjKWbapzVfjy/jp4bISWXR970HC2H4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-304-xMN35tUROBONCeyCc3Wqdw-1; Wed, 19 Apr 2023 01:31:04 -0400
X-MC-Unique: xMN35tUROBONCeyCc3Wqdw-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f08ed462c0so49299145e9.1
 for <qemu-arm@nongnu.org>; Tue, 18 Apr 2023 22:31:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681882263; x=1684474263;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X7P20zMft03/QtI4a2h8bHRgl8d+BbRt0aljLaAsMJI=;
 b=QK2gnkAY1QyB0k9p72FlU5kPbo3BtKmSOO6Yo4v1chxQgVhKnWcuMtayhK+zvWSwFh
 KmOo+w0QR89nPCEkOnLgj6Dbo5V06e8OAQFd6dNddgSTgkJQ/1nCI9D7sR3xZ6DoYg4n
 1860dGby+LnYw4i9zi5KP7otC84Xa+jVio4Uk3uNfrsTJbZ31a6Fq6KHGeM+zlpDxYpi
 qgI07uU90d+DPF4Y9bvonJsxldyI+tBCb7o6I+8g3GxqAVLWesW/Cl+xOwq9iOSTw5gp
 WmqtEH3QhudeEJciTPjtwjFW4kBITp9DFCtBsyo4T24cuwAiYgnwBFMOczR7QAgtOBkZ
 XsGg==
X-Gm-Message-State: AAQBX9eOjdT7LtvKPlpgwwCX0141SUaXVWvWXPPeFI8l5+D+lp52qbDq
 04BGU+NBIngYB/r8TZlmsw+TJNdyEIG4jcBx8ReX5y7FJsQhaeZVLj14q8xNzN3A16Z3Z+U/bih
 KtlKmiFAv+3yE
X-Received: by 2002:a05:6000:12cf:b0:2ef:b257:b46c with SMTP id
 l15-20020a05600012cf00b002efb257b46cmr843266wrx.29.1681882263313; 
 Tue, 18 Apr 2023 22:31:03 -0700 (PDT)
X-Received: by 2002:a05:6000:12cf:b0:2ef:b257:b46c with SMTP id
 l15-20020a05600012cf00b002efb257b46cmr843251wrx.29.1681882263020; 
 Tue, 18 Apr 2023 22:31:03 -0700 (PDT)
Received: from redhat.com ([2a02:14f:1fc:3571:9b25:3dfd:20fa:b195])
 by smtp.gmail.com with ESMTPSA id
 u19-20020a05600c211300b003f17a00c214sm952379wml.16.2023.04.18.22.30.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Apr 2023 22:31:02 -0700 (PDT)
Date: Wed, 19 Apr 2023 01:30:15 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eric DeVolder <eric.devolder@oracle.com>
Cc: shannon.zhaosl@gmail.com, imammedo@redhat.com, ani@anisinha.ca,
 peter.maydell@linaro.org, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, marcel.apfelbaum@gmail.com,
 pbonzini@redhat.com, richard.henderson@linaro.org,
 eduardo@habkost.net, boris.ostrovsky@oracle.com
Subject: Re: [PATCH v2 2/4] hw/acpi: arm: bump MADT to revision 5
Message-ID: <20230419012905-mutt-send-email-mst@kernel.org>
References: <20230418165219.2036-1-eric.devolder@oracle.com>
 <20230418165219.2036-3-eric.devolder@oracle.com>
MIME-Version: 1.0
In-Reply-To: <20230418165219.2036-3-eric.devolder@oracle.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: +TIwInK0eIW8

On Tue, Apr 18, 2023 at 12:52:17PM -0400, Eric DeVolder wrote:
> Currently ARM QEMU generates, and reports, MADT revision 4. ACPI 6.3
> introduces MADT revision 5.
> 
> For MADT revision 5, the GICC structure adds an SPE Overflow Interrupt
> field. This new 2-byte field is created from the existing 3-byte
> Reserved field. The spec indicates if the SPE overflow interrupt is
> not supported, to zero the field.
> 
> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>

So why do we bother changing this? I'd rather defer until
we actually intend to fill this field.

> ---
>  hw/arm/virt-acpi-build.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 4156111d49..23268dd981 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -705,7 +705,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      int i;
>      VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
>      const MemMapEntry *memmap = vms->memmap;
> -    AcpiTable table = { .sig = "APIC", .rev = 4, .oem_id = vms->oem_id,
> +    AcpiTable table = { .sig = "APIC", .rev = 5, .oem_id = vms->oem_id,
>                          .oem_table_id = vms->oem_table_id };
>  
>      acpi_table_begin(&table, table_data);
> @@ -763,7 +763,9 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>          /* Processor Power Efficiency Class */
>          build_append_int_noprefix(table_data, 0, 1);
>          /* Reserved */
> -        build_append_int_noprefix(table_data, 0, 3);
> +        build_append_int_noprefix(table_data, 0, 1);
> +        /* SPE overflow Interrupt */
> +        build_append_int_noprefix(table_data, 0, 2);
>      }
>  
>      if (vms->gic_version != VIRT_GIC_VERSION_2) {
> -- 
> 2.31.1

