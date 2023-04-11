Received: by 2002:a17:907:2c4d:b0:94e:1233:1117 with SMTP id hf13csp558553ejc;
        Tue, 11 Apr 2023 07:51:10 -0700 (PDT)
X-Google-Smtp-Source: AKy350YYQ6yFSzOCWiEmBoazJNcMPbNhIcvPjLJ9DTn7NlpsDnmEnC+g0WawV9l4HA1FTeMmuI0D
X-Received: by 2002:a05:6214:2461:b0:5e0:5ea6:69cc with SMTP id im1-20020a056214246100b005e05ea669ccmr27370342qvb.0.1681224670008;
        Tue, 11 Apr 2023 07:51:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681224669; cv=none;
        d=google.com; s=arc-20160816;
        b=ovQSx4Q/Jqlht8bOTF/Pnjd6M1wvQKfliWKZFnbfALF84IozJAxSe0QXXTPPrpbGSJ
         N6M46sQswrTFEYcBw/6A5vCXmKFn/djsNsTKDL37a1vFZVItvbkgsZ9zcUopqtsftr0c
         dYNYJa3lRbb62LoB52BnQpQ/fFtGTJf003F04NQOu6e5luKIb+y/IFXAqcowibFFZnZl
         NNoXcLbJ49UULYZ73W5CmMtNKTsdPhmKVENbZ/5aJoZb7Yc5c5COd9/lqpOaSwZP1dAy
         cHjtH1KIzHEc7N0kcVy+CDzJsrskLWlaxyD+5mjyug4/DZuWX4B6gjXg/sLvVN5vZGh8
         DgSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=OONh1tM008WsfhKisHY4nGddPBIQCQW/ooPTbHlLuSc=;
        b=fAikq6xfaj0laIzN5sgjkEByTC0O7dXV/nHM2XmO6GkqOrRKct3RBvwa4AjKbg37Od
         nDSiIxJm4Zh9ciOPr5avOnR9e1wTemfokE/0HAykO9qPnBjkakaJ99w233rZKnE9ncpD
         ikqpxnW+WMaUHWzb5VTy4zLRGO9BrQQSoxbmqFtIXGRm+uNrg28hli4uy860SclfZtGq
         4lUE9nRHxs7EsD5uPuD3QnyOIGP6gKisPS9Hv5f42y8f3lgfsgsE2+ztX85/T+/WRLaD
         /mMBxWuOqxkyJDue5dK7i42RphM8BkxDRfszcCykJBvRqCGZHPh+sdUmjNPpvU7m1+LO
         FF7g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="EYRFJN/q";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t18-20020ac85892000000b003d79a9ebcc9si9387552qta.570.2023.04.11.07.51.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Apr 2023 07:51:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="EYRFJN/q";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pmFJh-00065t-Ic; Tue, 11 Apr 2023 10:49:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pmFJf-000656-U6
 for qemu-arm@nongnu.org; Tue, 11 Apr 2023 10:49:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pmFJe-00070G-IL
 for qemu-arm@nongnu.org; Tue, 11 Apr 2023 10:49:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681224589;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OONh1tM008WsfhKisHY4nGddPBIQCQW/ooPTbHlLuSc=;
 b=EYRFJN/q5Nlzo34Js70ikiOThledPnCVrXggRajv4bKzQ2QeQKDuN52/o4xkHkFVfjztj1
 ruWtOguobtJPslLdSiNUhqJ2mYpa2uQqGTvCjzzvsqYpcu2Y9PDAMoHzD25esFo+qq6qgX
 PIGR9dJRiNoYjn8nts0sqHS0fRJQAlk=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-330-W2568DAKPYazSLO3Ow6e2w-1; Tue, 11 Apr 2023 10:49:47 -0400
X-MC-Unique: W2568DAKPYazSLO3Ow6e2w-1
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-50480ce89a2so1637375a12.3
 for <qemu-arm@nongnu.org>; Tue, 11 Apr 2023 07:49:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681224586;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OONh1tM008WsfhKisHY4nGddPBIQCQW/ooPTbHlLuSc=;
 b=IXSt1FUI3h6K2gE7pip/gR2Poyu7iOMjsfYoqndN/q4l+jZh4O8WUWgo2kV3BSTU56
 8uOIPYkv45LslM4X79wWWvdTxIOLEEkNc5Lw3+ww1MgyD3Jxo4veYKjeH9raedzqEdTe
 /YUdriHfecytHC8hyXBCJwCYT+LlyAnquanLIvTxDOMqmPaL9T25eT+14rQ8lZgpiqZl
 RIhOWvin5gqptSYws43C6gheaWyTpkgG/ITPCuphIvGX3hrA+eNg0tx57vTzIwpUlobM
 yFqfV301NPvU+zmeidT2uztiaBjOMjmxob6Yp363UKGCz2yrfYkNfE86tzkUF/LrUCbN
 wa8w==
X-Gm-Message-State: AAQBX9eWjozycome04q8cnhDy9ETuNhGP9DtOu+lBwlpHj33TIOK8X4i
 z2KgY/er5ttuJQ00Lgvi/OMZYaIKiHcKraE3ha1y+8ag1x7cZp7aqvxB7zgg3E+QAb4UMGsKVlI
 2ulp38ohhEa/w
X-Received: by 2002:aa7:cad9:0:b0:4fd:1cf1:b7b0 with SMTP id
 l25-20020aa7cad9000000b004fd1cf1b7b0mr12575799edt.7.1681224586542; 
 Tue, 11 Apr 2023 07:49:46 -0700 (PDT)
X-Received: by 2002:aa7:cad9:0:b0:4fd:1cf1:b7b0 with SMTP id
 l25-20020aa7cad9000000b004fd1cf1b7b0mr12575777edt.7.1681224586183; 
 Tue, 11 Apr 2023 07:49:46 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 n19-20020a509353000000b005002daeb27asm6016311eda.37.2023.04.11.07.49.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 07:49:45 -0700 (PDT)
Date: Tue, 11 Apr 2023 16:49:44 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric DeVolder <eric.devolder@oracle.com>
Cc: shannon.zhaosl@gmail.com, mst@redhat.com, ani@anisinha.ca,
 peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 marcel.apfelbaum@gmail.com, pbonzini@redhat.com,
 richard.henderson@linaro.org, eduardo@habkost.net,
 boris.ostrovsky@oracle.com
Subject: Re: [PATCH 1/2] hw/acpi: arm: bump MADT to revision 5
Message-ID: <20230411164944.0549bb29@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230328155926.2277-2-eric.devolder@oracle.com>
References: <20230328155926.2277-1-eric.devolder@oracle.com>
 <20230328155926.2277-2-eric.devolder@oracle.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: MDt8tnksb1Qo

On Tue, 28 Mar 2023 11:59:25 -0400
Eric DeVolder <eric.devolder@oracle.com> wrote:

> Currently ARM QEMU generates, and reports, MADT revision 4. ACPI 6.3
> introduces MADT revision 5.
> 
> For MADT revision 5, the GICC structure adds an SPE Overflow Interrupt
> field. This new 2-byte field is created from the existing 3-byte
> Reserved field. The spec indicates if the SPE overflow interrupt is
> not supported, to zero the field.
> 
> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>


needs ACK from ARM folks

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

