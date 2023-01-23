Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2836673ejc;
        Mon, 23 Jan 2023 02:58:08 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtH43tKIZLHHGIseSyqqPqz6HVcNCas2Fz+54xyOS4C4V+835YM5o4KHfq/QBxp2iMHEooK
X-Received: by 2002:ac8:4c91:0:b0:3b6:970b:ff61 with SMTP id j17-20020ac84c91000000b003b6970bff61mr16401028qtv.30.1674471488586;
        Mon, 23 Jan 2023 02:58:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674471488; cv=none;
        d=google.com; s=arc-20160816;
        b=ffI4JMwzv5P6O3s0esM7Ckg6qOKVfsHZK0x5z0xgYHa+ctwrYpcc0aOiz1oEQIKooK
         S1cLjIks7hQ3X2NRQssj2HkhbRDMCIKzEIavIO5brm+B276JlHnYezGeUqYo6ww8ANty
         RdOTgIADngKHahFHYBHlSj2ZLIaAQfPvD0ih1Iy+o5h5XOyuCkSg86EE+rl8Dq4Q4vxT
         n40EqePGS+GlgrtchDg04idoUTNp50mqBVAegscWuznbPyBeXZNpn8Ey6B4qRW+VXAvJ
         tVj+Tc0y2wProF3Tj/xWQ3mR+8hGP3nSA6+jslYtkPQt04eEYGi6uQayKVOvtQNdaQCQ
         jSqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:user-agent:in-reply-to:mime-version:references
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=Lc7+Nth4tD6DUPxWOZ/wtOuz1QcSnbRXKS+0qgP//Yc=;
        b=wTTsOOzuzF6S4ZAO5WnTunDAgc6MasZUxShHoQU+452vP/aL+r0hqVAm8zp/e6dzbh
         U+MCrVHQz8TtSwVPDe3YPe7stZ/StNuV4gE6l5a/3+xOwwFu0vDrqgRds2q236zVUJZD
         ANgqLLt4aCM6bsccKjdB9L9Qre1zIGTdz0FCArByOhqDbpmbG3dINY3Kwd/36wQV6WJg
         ntyj1dc7j/F+lnZ0v8OtoTPofGB0MZwBfByLMts4utecqgO6y9EchZEssMtSeElr3t/q
         wt1GXNG2xEoex9iND6DE5911yWjf/RluDeK0UsPb9ZYiC5eZEL4tvl+3cSGVbaLQh+GN
         hhYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=T6strZRK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bm24-20020a05620a199800b00706a0fa7f0dsi12489991qkb.759.2023.01.23.02.58.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Jan 2023 02:58:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=T6strZRK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pJuWN-0007tj-3P; Mon, 23 Jan 2023 05:57:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pJuWH-0007sp-Ds
 for qemu-arm@nongnu.org; Mon, 23 Jan 2023 05:57:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pJuWF-0006Ex-Si
 for qemu-arm@nongnu.org; Mon, 23 Jan 2023 05:57:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674471462;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lc7+Nth4tD6DUPxWOZ/wtOuz1QcSnbRXKS+0qgP//Yc=;
 b=T6strZRKp9mywpX2mxQHiPHNgEws/fqrEENZ79DwEgIrMSo2b3v7LFIaFe64FAX+K2kJrk
 NI3xUaVSROJqyDcC+ArE19Sm9qxS7tjkm7YPHMTUjHsOKfwtwr/raZsyvuOLw718VUZos5
 Dpb4JiNli6C6Os16XNF7xe2kdPMwAHs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-534-Lh7ZiHWTNa2wUuPoUH_Waw-1; Mon, 23 Jan 2023 05:57:41 -0500
X-MC-Unique: Lh7ZiHWTNa2wUuPoUH_Waw-1
Received: by mail-wr1-f71.google.com with SMTP id
 r1-20020adfa141000000b002be28fd4a7bso1898582wrr.12
 for <qemu-arm@nongnu.org>; Mon, 23 Jan 2023 02:57:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Lc7+Nth4tD6DUPxWOZ/wtOuz1QcSnbRXKS+0qgP//Yc=;
 b=XLx08NQC/8UZhia+G5URCs1AL8TAd4xMU+3T+3lPg5eVlqoey3uZ961tn88zo8uaVU
 4LJDeHd0OckNyO5O7IV92Lgk5IhZHu1VqhcEqg62kpH+KxwoJqbeITK49bQRRGbhVgFq
 PrfPTmYmVFoNWWAwus/8ihHYULeVNCUYOblPk4xL2iD+yH5Z4RXhu16UIrtlnOuw6oNb
 d0pnGdEHIzib09Rcxq4QtWqBJozjPQEyM3Yk5CvoGeEimcUcSWg9gOrStkika3lItvoe
 dyxcbpSRJ1X0PN3NVI8CBP7yIf3v5K9onsMVch3ikrB8eQWM48G1+6Hu03964EjY3SNW
 5Y5A==
X-Gm-Message-State: AFqh2koSAKSCBWMyj8rQ98LdCZAkVmOrTMdNdvlfOhJDcxnAiAvbE2yN
 MN98b+pAQnALIvSts/sXvfNSCTxt5xRyO+o+3HiH8WzfAItzS1/zsTCv6SfD9X20fZRCe5PmHy1
 vaaUMg0GNCClD
X-Received: by 2002:a05:600c:198a:b0:3d9:cb4c:af5a with SMTP id
 t10-20020a05600c198a00b003d9cb4caf5amr24512153wmq.33.1674471460250; 
 Mon, 23 Jan 2023 02:57:40 -0800 (PST)
X-Received: by 2002:a05:600c:198a:b0:3d9:cb4c:af5a with SMTP id
 t10-20020a05600c198a00b003d9cb4caf5amr24512130wmq.33.1674471459847; 
 Mon, 23 Jan 2023 02:57:39 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 m31-20020a05600c3b1f00b003dafadd2f77sm11365655wms.1.2023.01.23.02.57.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 02:57:39 -0800 (PST)
Date: Mon, 23 Jan 2023 10:57:36 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Juan Quintela <quintela@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, qemu-arm@nongnu.org
Subject: Re: [PATCH v3 07/11] tests/qtest/migration-test: Build command line
 using GString API (1/4)
Message-ID: <Y85oIDWpAdbIpGUa@work-vm>
References: <20230120082341.59913-1-philmd@linaro.org>
 <20230120082341.59913-8-philmd@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20230120082341.59913-8-philmd@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: gwGg3SqpOBQA

* Philippe Mathieu-Daudé (philmd@linaro.org) wrote:
> Part 1/4: Convert memory & machine options.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  tests/qtest/migration-test.c | 24 ++++++++++++++----------
>  1 file changed, 14 insertions(+), 10 deletions(-)
> 
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index f96c73f552..9cdef4fa65 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -582,6 +582,7 @@ typedef struct {
>  static int test_migrate_start(QTestState **from, QTestState **to,
>                                const char *uri, MigrateStart *args)
>  {
> +    g_autoptr(GString) cmd_common = NULL;
>      g_autofree gchar *arch_source = NULL;
>      g_autofree gchar *arch_target = NULL;
>      g_autofree gchar *cmd_target = NULL;
> @@ -601,6 +602,9 @@ static int test_migrate_start(QTestState **from, QTestState **to,
>      }
>  
>      got_stop = false;
> +
> +    cmd_common = g_string_new("");
> +
>      bootpath = g_strdup_printf("%s/bootsect", tmpfs);
>      if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
>          /* the assembled x86 boot sector should be exactly one sector large */
> @@ -644,6 +648,10 @@ static int test_migrate_start(QTestState **from, QTestState **to,
>      } else {
>          g_assert_not_reached();
>      }
> +    if (machine_opts) {
> +        g_string_append_printf(cmd_common, " -machine %s ", machine_opts);
> +    }
> +    g_string_append_printf(cmd_common, "-m %s ", memory_size);
>  
>      if (!getenv("QTEST_LOG") && args->hide_stderr) {
>  #ifdef _WIN32
> @@ -674,33 +682,29 @@ static int test_migrate_start(QTestState **from, QTestState **to,
>      if (!args->only_target) {
>          g_autofree gchar *cmd_source = NULL;
>  
> -        cmd_source = g_strdup_printf("-accel kvm%s -accel tcg%s%s "
> +        cmd_source = g_strdup_printf("-accel kvm%s -accel tcg %s "
>                                       "-name source,debug-threads=on "
> -                                     "-m %s "
>                                       "-serial file:%s/src_serial "
>                                       "%s %s %s %s",
>                                       args->use_dirty_ring ?
>                                       ",dirty-ring-size=4096" : "",
> -                                     machine_opts ? " -machine " : "",
> -                                     machine_opts ? machine_opts : "",
> -                                     memory_size, tmpfs,
> +                                     cmd_common->str,
> +                                     tmpfs,
>                                       arch_source, shmem_opts,
>                                       args->opts_source ? args->opts_source : "",
>                                       ignore_stderr);
>          *from = qtest_init(cmd_source);
>      }
>  
> -    cmd_target = g_strdup_printf("-accel kvm%s -accel tcg%s%s "
> +    cmd_target = g_strdup_printf("-accel kvm%s -accel tcg %s "
>                                   "-name target,debug-threads=on "
> -                                 "-m %s "
>                                   "-serial file:%s/dest_serial "
>                                   "-incoming %s "
>                                   "%s %s %s %s",
>                                   args->use_dirty_ring ?
>                                   ",dirty-ring-size=4096" : "",
> -                                 machine_opts ? " -machine " : "",
> -                                 machine_opts ? machine_opts : "",
> -                                 memory_size, tmpfs, uri,
> +                                 cmd_common->str,
> +                                 tmpfs, uri,
>                                   arch_target, shmem_opts,
>                                   args->opts_target ? args->opts_target : "",
>                                   ignore_stderr);
> -- 
> 2.38.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

