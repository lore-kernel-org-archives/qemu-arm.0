Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp375515ejq;
        Tue, 16 May 2023 05:32:10 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7RB0CoWa3R2DHv4Pd5S24JD45LxY0Mj5UNskXSUovjkGP+KCAFPdv2sIhxOHgHEZHYxqF0
X-Received: by 2002:a25:2fc3:0:b0:b9d:c69f:2a57 with SMTP id v186-20020a252fc3000000b00b9dc69f2a57mr29435971ybv.53.1684240330169;
        Tue, 16 May 2023 05:32:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684240330; cv=none;
        d=google.com; s=arc-20160816;
        b=FDEZdV0kGCzHjOuTO3K+xjr96/d1/ZaBv9xXxU2FJmw7id/Kj/AZUooO6ZSxEeEfHt
         kOAh1+sJV9QOnbpSeadJyUk68pflH3hTWo27lQIJRk8ufTVITAOHtfF0Hj3uukQinev0
         Z7llMcijyNyffhyVtx8MaPppZ7cAln4v3xOufZ8ag/ophSOHd/SZcSxNPByEZwHmQ0NI
         WSpxiZlytX3NELMQRqRufqSjY8OZNILKvsxVah87kgSesi4w5ySHDj9az22TSpONwhcc
         At6GBSfmRhHon+JtYGDPncnCvmTVte8106rgHCFsFOrbtky2i48gTelV66HGO2D4x8Fb
         FaeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=/jq53EyLfJCcYDqCwl2125Uep+laYCKtBvVActLumF4=;
        b=dxaPI9sZBVZIlVBQI7sgtPrIgbIW5tlPTyJziUei/EMKN0vHtotjZ2as+oDpsZycF+
         V069BQ0cpalb9de6MQZjr/tiIDRoYsjv16jYP1bhNtGbEDzwZHwmFuvwDpVL1WU3O/ts
         Hloc1WIJ5qxhMXubSvsRtUd1bXqdCGNNGEIBIj785DKbkDK0fDEQO4p8X8Bdt4yB6kMw
         yu5hjBiFVIlW6RAOG4sWOd3YwhspaE8Nk/szHYwZXxdoK1n+l7Yyh7j+Jll2p/WmvTuY
         wfVX7YIkxyCGnvhUZeWmU/BEMknMX3iMWbKjiqRUMn46L5P/t+wQBU+UQrY+gxFF5LJL
         S/iQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ayeGegVu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z18-20020a05620a101200b0074e36f1b99dsi1061665qkj.233.2023.05.16.05.32.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 May 2023 05:32:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ayeGegVu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pytqP-00085U-Tq; Tue, 16 May 2023 08:31:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pytqO-000856-QB
 for qemu-arm@nongnu.org; Tue, 16 May 2023 08:31:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pytqM-0002pK-CO
 for qemu-arm@nongnu.org; Tue, 16 May 2023 08:31:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684240313;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/jq53EyLfJCcYDqCwl2125Uep+laYCKtBvVActLumF4=;
 b=ayeGegVueECSGIyd0WHXDME+rYCz5HvdvLhm7quMejpvDYq1lhxW6cCdeM8VectxGkRPqj
 cXp7xAVe9ophWNwvngwTDbAbEokmem7oVSHYt6NMQ7G1kDBfk88I/TJ43+rczblwPTDIRq
 nKymbOeEIj5OCr6+pA/AqHzTludd8kI=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-577-8QULp2TSOnGGjx1E-I3znQ-1; Tue, 16 May 2023 08:31:52 -0400
X-MC-Unique: 8QULp2TSOnGGjx1E-I3znQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-9662960d1e4so1168071366b.1
 for <qemu-arm@nongnu.org>; Tue, 16 May 2023 05:31:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684240311; x=1686832311;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/jq53EyLfJCcYDqCwl2125Uep+laYCKtBvVActLumF4=;
 b=GO1C0m+ohd4d8tLChBz9LIAr6eK7mB0/PZyoW0ZnEXXLR3RIz/yR93vz+MvQp2dZa+
 UdkeVND5bG07Pl+U/cOzr0SXgXgminrbTy1TkHjxzRAeUTyPJqgUwPxgOaiXtVLr/hzL
 AyqVIi85uD9AkNyVhOArs4QLhSE5PHXnVJkiZjcW78OMhsa1afsQs/pvhnmDfUB4Tfam
 fuSvCzhIjekWLAnUBEkjkNzNsrmu5z/Q0blpFLbXbJqV+2ffUlmaiwpqgHD3+I8dVWYT
 +4sE54kl6wgWJnOZRNBSeblEwnkBUQfuE0PMGtnsW2RWGQxwnc5q6chpPIyjvoyBw2x6
 c0bQ==
X-Gm-Message-State: AC+VfDzq02O3OuVbht0266675uMSJfoSKfA2ypYMuvReWAZNcIURnUH+
 cnXwjzf8KVddvfOceFuqBNfDAZ8y6USEi53tPP6dRJ/eGnF1BdeqbK+hFi7Z3+9sQCnqZOiXIuO
 qs+QLk6sUAOTo
X-Received: by 2002:a17:907:7e90:b0:96a:2dd7:2efc with SMTP id
 qb16-20020a1709077e9000b0096a2dd72efcmr20871545ejc.41.1684240310948; 
 Tue, 16 May 2023 05:31:50 -0700 (PDT)
X-Received: by 2002:a17:907:7e90:b0:96a:2dd7:2efc with SMTP id
 qb16-20020a1709077e9000b0096a2dd72efcmr20871519ejc.41.1684240310612; 
 Tue, 16 May 2023 05:31:50 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 n2-20020aa7c442000000b0050d97582ce1sm8108304edr.48.2023.05.16.05.31.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 May 2023 05:31:50 -0700 (PDT)
Date: Tue, 16 May 2023 14:31:49 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric DeVolder <eric.devolder@oracle.com>
Cc: qemu-devel@nongnu.org, shannon.zhaosl@gmail.com, mst@redhat.com,
 ani@anisinha.ca, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 marcel.apfelbaum@gmail.com, pbonzini@redhat.com,
 richard.henderson@linaro.org, eduardo@habkost.net,
 boris.ostrovsky@oracle.com, miguel.luis@oracle.com
Subject: Re: [PATCH 2/3] ACPI: i386: bump to MADT to revision 3
Message-ID: <20230516143149.42ad6810@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230515203311.2139-3-eric.devolder@oracle.com>
References: <20230515203311.2139-1-eric.devolder@oracle.com>
 <20230515203311.2139-3-eric.devolder@oracle.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: ajQajvDxJCyH

On Mon, 15 May 2023 16:33:10 -0400
Eric DeVolder <eric.devolder@oracle.com> wrote:

> Currently i386 QEMU generates MADT revision 3, and reports
> MADT revision 1. Set .revision to 3 to match reality.
> 
> Link: https://lore.kernel.org/linux-acpi/20230327191026.3454-1-eric.devolder@ora
> cle.com/T/#t
> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
> ---
>  hw/i386/acpi-common.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/i386/acpi-common.c b/hw/i386/acpi-common.c
> index 52e5c1439a..8a0932fe84 100644
> --- a/hw/i386/acpi-common.c
> +++ b/hw/i386/acpi-common.c
> @@ -102,7 +102,7 @@ void acpi_build_madt(GArray *table_data, BIOSLinker *linker,
>      MachineClass *mc = MACHINE_GET_CLASS(x86ms);
>      const CPUArchIdList *apic_ids = mc->possible_cpu_arch_ids(MACHINE(x86ms));
>      AcpiDeviceIfClass *adevc = ACPI_DEVICE_IF_GET_CLASS(adev);
> -    AcpiTable table = { .sig = "APIC", .rev = 1, .oem_id = oem_id,
> +    AcpiTable table = { .sig = "APIC", .rev = 3, .oem_id = oem_id,
>                          .oem_table_id = oem_table_id };
>  
>      acpi_table_begin(&table, table_data);

make check fails for me at this point
(my guess is that not all APIC tables are whitelisted)

