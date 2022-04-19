Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp2253807lfk;
        Tue, 19 Apr 2022 01:55:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzalEM2URQrfCY0R8NIYeps7OnlmDLJ1UVWgvPZgDj2AanqBfprdZbMALhCHPbI2sT4neS6
X-Received: by 2002:a05:6214:20a5:b0:446:787a:e765 with SMTP id 5-20020a05621420a500b00446787ae765mr732130qvd.118.1650358549280;
        Tue, 19 Apr 2022 01:55:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650358549; cv=none;
        d=google.com; s=arc-20160816;
        b=wtzCqySc3U/GE0pTH/fpwrNFwcaulJ6NI/U4+A7jL01aaw3r/1AZJ3S2cDzmcVKB9y
         2+5tKWVfcG3HGqN1MtxjZILTqA7E9WCIq+tgbk/jvbLPqKxhcAjg7fXdRYx3s9nVGGYR
         NFpBQgCizsXt+Wgdwt/7E+51B6Ygkwl0tVz+UXJMYa9xSNieCY9esTbGEpJZPhTOqNR8
         9GCAK0EiDR8MTgCQFI5r9eXLK265tp+ISGi6My5wro3ukCBju9zqSHe49J7Kj/7cc5Th
         LQ1c45o2RWFfd5TAsfyj+lo7OJLqoCpXddED2KW00aCLMsAG7Zinis0A/qPzunnzLMKt
         ESSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=avMta+Zwq+d+0ZNxRQ4wPkw93beWV82HNKunWhZ8D48=;
        b=f1n7k9WDB5LMp7lGufM4Fbi4GmWPgcZfoS0GiV1VBhYVgNsy4HQ0k/qJL92IWTtUxC
         hQirUhEU4aWT3iSo7iKUOdQghNRbag1TLl7NwcYa8S/y+oo72Te2wsw1AeiMJ08+0pZT
         1oRvXs85dQgmk5csyXr0Xd0YU5cNlBIN7rTWlJ4IZN4nQarB+JuaSkQOKLA0Lo9yfxYo
         2RNuTcNt3FPpYbcPUoaQtLkZ3GmI0QB0oIGtfKfJajbIGr7eHSkPFT5rUZ1xPLC3hb7y
         GgqS7ZO+WzOm0z7Egd2TYclQHjP3+jFsJwhQQ4Cq77iwxJMZ8s//XZcsGACm930Qitr9
         i0eg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=cbOVqxuB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q3-20020a05622a030300b002e1fbf3c008si2644443qtw.505.2022.04.19.01.55.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Apr 2022 01:55:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=cbOVqxuB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ngjeG-0001Wi-PY
	for alex.bennee@linaro.org; Tue, 19 Apr 2022 04:55:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ngjdC-000113-SC
 for qemu-arm@nongnu.org; Tue, 19 Apr 2022 04:54:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ngjd9-0005jb-RQ
 for qemu-arm@nongnu.org; Tue, 19 Apr 2022 04:54:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650358478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=avMta+Zwq+d+0ZNxRQ4wPkw93beWV82HNKunWhZ8D48=;
 b=cbOVqxuBUVdw4SgWPnB9G0Tt2nd1CFblOb7xNtfcqaqZ3eyn4w5liKi3MpQcVrPS99g3xa
 e3SLpGX1sTXDxmxWVVAT6oGcZUKhX/gqVtM9SaB4ulLxCPOwgT4nOYYUw3hItzZS8uoSbk
 3bVa6VZ7mcDq5MrAG9uqsOUy5WQRhPc=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-619-Sa8_dPsrNSeGZw7nIEvSzA-1; Tue, 19 Apr 2022 04:54:35 -0400
X-MC-Unique: Sa8_dPsrNSeGZw7nIEvSzA-1
Received: by mail-ed1-f71.google.com with SMTP id
 i4-20020aa7c9c4000000b00419c542270dso10632163edt.8
 for <qemu-arm@nongnu.org>; Tue, 19 Apr 2022 01:54:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=avMta+Zwq+d+0ZNxRQ4wPkw93beWV82HNKunWhZ8D48=;
 b=7mz+9rXPZT9xjY6x7eAB9ko8J3hYGbrKF7TdbFH0FB3ZZ3OJcWPcWUGh7SG6kQ9OPM
 Kv8na3lGKnXRh8L6T3D5zCyApwlWAUMJppD68oNugszVijXluCNDG/0STGDZseV7jBFJ
 tJhvgvhb5fDFtZb5Gb49/gUQ1TxgEHwW1BE/dlKeFkPMctQKW7O9pMFfbYadbW5++yRA
 P2BIw/Zif62wvHZjFEGo47rIZnMPrJ21j1+BQGebeubLRPTM0X+NJWq1eTNFBCFDumrv
 Ze1mmquueDpUJ7O3AgK4P7yyvwI8jNuc2eqb5pD6FcXpY1iIfmmWGDsWDDrsV/EVE9w3
 rWwA==
X-Gm-Message-State: AOAM530h5j7JO0k/fSJNR+IlLOsy8F+gxG/mhkzNxAtEPRuPafBaSkUI
 juIojsTorPeLnAsbtYyUoyNkafjo9hyru1bAtQxwZ7kJ2stsqQV6R5FrmRW/WXI3cIHujQS6wZv
 TRCBrq9Y1tJZM
X-Received: by 2002:a05:6402:298c:b0:41d:6b63:aa67 with SMTP id
 eq12-20020a056402298c00b0041d6b63aa67mr16386693edb.42.1650358473859; 
 Tue, 19 Apr 2022 01:54:33 -0700 (PDT)
X-Received: by 2002:a05:6402:298c:b0:41d:6b63:aa67 with SMTP id
 eq12-20020a056402298c00b0041d6b63aa67mr16386674edb.42.1650358473661; 
 Tue, 19 Apr 2022 01:54:33 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 n14-20020a50934e000000b0042053e79386sm8188005eda.91.2022.04.19.01.54.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 01:54:33 -0700 (PDT)
Date: Tue, 19 Apr 2022 10:54:32 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH v5 4/4] hw/acpi/aml-build: Use existing CPU topology to
 build PPTT table
Message-ID: <20220419105432.11ad0f90@redhat.com>
In-Reply-To: <dec9ab46-746d-9810-0784-2cddefab67ae@redhat.com>
References: <20220403145953.10522-1-gshan@redhat.com>
 <20220403145953.10522-5-gshan@redhat.com>
 <20220413155232.0a1f4d88@redhat.com>
 <dec9ab46-746d-9810-0784-2cddefab67ae@redhat.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, zhenyzha@redhat.com, wangyanan55@huawei.com,
 qemu-arm@nongnu.org, shan.gavin@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /EQmn+RNaxaH

On Thu, 14 Apr 2022 08:33:29 +0800
Gavin Shan <gshan@redhat.com> wrote:

> Hi Igor,
> 
> On 4/13/22 9:52 PM, Igor Mammedov wrote:
> > On Sun,  3 Apr 2022 22:59:53 +0800
> > Gavin Shan <gshan@redhat.com> wrote:
> >   
> >> When the PPTT table is built, the CPU topology is re-calculated, but
> >> it's unecessary because the CPU topology has been populated in
> >> virt_possible_cpu_arch_ids() on arm/virt machine.
> >>
> >> This reworks build_pptt() to avoid by reusing the existing one in
> >> ms->possible_cpus. Currently, the only user of build_pptt() is
> >> arm/virt machine.
> >>
> >> Signed-off-by: Gavin Shan <gshan@redhat.com>
> >> ---
> >>   hw/acpi/aml-build.c | 100 +++++++++++++++++---------------------------
> >>   1 file changed, 38 insertions(+), 62 deletions(-)
> >>
> >> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> >> index 4086879ebf..4b0f9df3e3 100644
> >> --- a/hw/acpi/aml-build.c
> >> +++ b/hw/acpi/aml-build.c
> >> @@ -2002,86 +2002,62 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
> >>                   const char *oem_id, const char *oem_table_id)
> >>   {
> >>       MachineClass *mc = MACHINE_GET_CLASS(ms);
> >> -    GQueue *list = g_queue_new();
> >> -    guint pptt_start = table_data->len;
> >> -    guint parent_offset;
> >> -    guint length, i;
> >> -    int uid = 0;
> >> -    int socket;
> >> +    CPUArchIdList *cpus = ms->possible_cpus;
> >> +    int64_t socket_id = -1, cluster_id = -1, core_id = -1;
> >> +    uint32_t socket_offset, cluster_offset, core_offset;
> >> +    uint32_t pptt_start = table_data->len;
> >> +    int n;
> >>       AcpiTable table = { .sig = "PPTT", .rev = 2,
> >>                           .oem_id = oem_id, .oem_table_id = oem_table_id };
> >>   
> >>       acpi_table_begin(&table, table_data);
> >>   
> >> -    for (socket = 0; socket < ms->smp.sockets; socket++) {
> >> -        g_queue_push_tail(list,
> >> -            GUINT_TO_POINTER(table_data->len - pptt_start));
> >> -        build_processor_hierarchy_node(
> >> -            table_data,
> >> -            /*
> >> -             * Physical package - represents the boundary
> >> -             * of a physical package
> >> -             */
> >> -            (1 << 0),
> >> -            0, socket, NULL, 0);
> >> -    }
> >> +    for (n = 0; n < cpus->len; n++) {  
> >   
> >> +        if (cpus->cpus[n].props.socket_id != socket_id) {
> >> +            socket_id = cpus->cpus[n].props.socket_id;  
> > 
> > this relies on cpus->cpus[n].props.*_id being sorted form top to down levels
> > I'd add here and for other container_id an assert() that checks for that
> > specific ID goes in only one direction, to be able to detect when rule is broken.
> > 
> > otherwise on may end up with duplicate containers silently.
> >   
> 
> Exactly. cpus->cpus[n].props.*_id is sorted as you said in virt_possible_cpu_arch_ids().
> The only user of build_pptt() is arm/virt machine. So it's fine. However, I think I
> may need add comments for this in v6.
> 
>      /*
>       * This works with the assumption that cpus[n].props.*_id has been
>       * sorted from top to down levels in mc->possible_cpu_arch_ids().
>       * Otherwise, the unexpected and duplicate containers will be created.
>       */
> 
> The implementation in v3 looks complicated, but comprehensive. The one
> in this revision (v6) looks simple, but the we're losing flexibility :)


comment is not enough, as it will break silently that's why I suggested
sprinkling asserts() here.

[...]
> Thanks,
> Gavin
> 

