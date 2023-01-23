Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2837231ejc;
        Mon, 23 Jan 2023 02:59:46 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuixxk8LtHzt5ruFyNtdxYt070NJIDC0N2laSOQ9FO5WBWtk61p0i73Sv/RPb1Soikl8AP/
X-Received: by 2002:a05:622a:22a5:b0:3b4:a6ac:770c with SMTP id ay37-20020a05622a22a500b003b4a6ac770cmr35551667qtb.45.1674471586181;
        Mon, 23 Jan 2023 02:59:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674471586; cv=none;
        d=google.com; s=arc-20160816;
        b=AXx9yx+Z1jNy6Qez2uxkWrtPA8DKFe5EaPnaNKECT7HuhuBnTIKn2nCTgUMk+W+uzc
         /M9yfHCsA7Qx7ryvBu4gkIxg/fWpxl6k3qSpaMjVMkTIDAyuoKRfP9M6UaYil1qaUWkO
         YTmIsqpbZfKpUTQwH+l1w/g4Yid0ik7WecRj6myO0zGVQAN2qY6RmXRllsgdnM9q2vM4
         NHeYuht+hfLkLxpzL6DDvfNavwsEW+IArTqWWOmcPRGuCDNDtS/+62Lc6Z4C8yU8JWK9
         1A3KuvSetHFlrwK/6j1U7c098iPNaV49CNgcr90OH0pmWbjryQq5a5NY7nwR4ZpNwjki
         S2fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:user-agent:in-reply-to:mime-version:references
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=myTxCe5PucInwvFDihFM6lx/CJUs8oHXuHxOxQX6gcI=;
        b=A4fzm4V7Q9XEqBVCfgoL4J9vMb/l7Aya3rRTeGoZH/ujW1hcnYqyuOkmeDfo+PLDZj
         XL1IFB0cNhJSc+fgmvxVUAY2fZodnhKZCFMek83tsJLMs7X/xHzkuW7rDpta1NauAW+Y
         a46q5cQB3dgNCdwE5YiyKi0QZCWAZ6Vj2uRfxigQeR/G49ylUFxirm/ihhI9hfenKJk+
         8+fQTIQ7b93x4dymUhY4o7bkseqmY1knPogkcRHnXch7XmoqJKjj+OLq9OZA3TMU1YUj
         RmwD+Ok16CUrURFPkXs9SYn8y9gh/u2S0t0nIbz2Z1XSYDYSz3DQmD8uleXen7EilOYG
         3AdA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MvF5n+Gg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bb17-20020a05622a1b1100b003b64371b8a5si11576850qtb.386.2023.01.23.02.59.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Jan 2023 02:59:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MvF5n+Gg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pJuXw-0000Fv-Ou; Mon, 23 Jan 2023 05:59:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pJuXr-0000FR-7D
 for qemu-arm@nongnu.org; Mon, 23 Jan 2023 05:59:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pJuXp-0006U3-TE
 for qemu-arm@nongnu.org; Mon, 23 Jan 2023 05:59:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674471561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=myTxCe5PucInwvFDihFM6lx/CJUs8oHXuHxOxQX6gcI=;
 b=MvF5n+GgqvlUk1T39HOkUM0kVNrrCbulEbhylpoEClJ0b5r8X067C8GTHdLneq+TyUV82F
 a9JdewweaY5faupkMx60Xk9RLMZ5HPvq5crj8gCEKhzh8iesKMwaR0b6oATOjLKcZsvKk1
 xcQ2/cBSS26GBq2uDeGIpBAEnIShUf8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-588-9itd3cEVNnat2CTwmUZcNA-1; Mon, 23 Jan 2023 05:59:19 -0500
X-MC-Unique: 9itd3cEVNnat2CTwmUZcNA-1
Received: by mail-wr1-f72.google.com with SMTP id
 r1-20020adfa141000000b002be28fd4a7bso1900198wrr.12
 for <qemu-arm@nongnu.org>; Mon, 23 Jan 2023 02:59:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=myTxCe5PucInwvFDihFM6lx/CJUs8oHXuHxOxQX6gcI=;
 b=e/JZoTJVGm4zMRCixwIbr2UF7ANRNGgiGAj+dqvAlq6KjwI77B2SwnKvzYxHiRnRO+
 3Gh+c53setaP4kG1i1VdpxUZc0K/ykU6wLXhEAStO4In/8IGm6yfRjkUGqWk/0521w37
 sdXcKCAgsspuztQ2xNQnHqEr0DE81shrJrKwktQ9A0lgHazZfI7hHDw3ger291ZiJ2ZO
 cXeTKCj/zQ36QSqf/YeIW0sPzkDBP1IWVL0yl7W7Y5eic/Q8sup1Qk92ZFIJPlUoxHXr
 jUiVn67GomqpRZAK4ZfKsuG30kOfk6oA2xkUFvZJXAMjvZUqHrAiSIGTntuWcSFV2cyz
 KeHA==
X-Gm-Message-State: AFqh2ko3Uukf+A6sA726ITy3NwflyB38QKNiIVDPN7GC1t7F9qe+D6Ai
 ES7xWcGrFgkWsj48uOcITnzZpO5IwAp/A0YLHUU2IznPE0w1z+/o2gugksP3mIJjlgxwTRqRq9e
 A3lAJDPdvw7pK
X-Received: by 2002:a05:600c:2d05:b0:3d0:85b5:33d3 with SMTP id
 x5-20020a05600c2d0500b003d085b533d3mr22491896wmf.16.1674471558548; 
 Mon, 23 Jan 2023 02:59:18 -0800 (PST)
X-Received: by 2002:a05:600c:2d05:b0:3d0:85b5:33d3 with SMTP id
 x5-20020a05600c2d0500b003d085b533d3mr22491880wmf.16.1674471558372; 
 Mon, 23 Jan 2023 02:59:18 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 l7-20020a7bc447000000b003dafa04ecc4sm10235937wmi.6.2023.01.23.02.59.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 02:59:17 -0800 (PST)
Date: Mon, 23 Jan 2023 10:59:16 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Juan Quintela <quintela@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 09/11] tests/qtest/migration-test: Build command line
 using GString API (3/4)
Message-ID: <Y85ohEspxLesiE1b@work-vm>
References: <20230120082341.59913-1-philmd@linaro.org>
 <20230120082341.59913-10-philmd@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20230120082341.59913-10-philmd@linaro.org>
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
X-TUID: TrNYMGi8bOcz

* Philippe Mathieu-Daudé (philmd@linaro.org) wrote:
> Part 3/4: Convert accelerator options.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  tests/qtest/migration-test.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index 670097a956..1ed3505c91 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -603,6 +603,13 @@ static int test_migrate_start(QTestState **from, QTestState **to,
>      got_stop = false;
>  
>      cmd_common = g_string_new("");
> +    /* KVM first */
> +    if (args->use_dirty_ring) {
> +        g_string_append(cmd_common, "-accel kvm,dirty-ring-size=4096 ");
> +    } else {
> +        g_string_append(cmd_common, "-accel kvm ");
> +    }
> +    g_string_append(cmd_common, "-accel tcg ");

Yep, that's the right way around this time :-)


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

>      bootpath = g_strdup_printf("%s/bootsect", tmpfs);
>      if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
> @@ -678,12 +685,10 @@ static int test_migrate_start(QTestState **from, QTestState **to,
>      if (!args->only_target) {
>          g_autofree gchar *cmd_source = NULL;
>  
> -        cmd_source = g_strdup_printf("-accel kvm%s -accel tcg %s "
> +        cmd_source = g_strdup_printf("%s "
>                                       "-name source,debug-threads=on "
>                                       "-serial file:%s/src_serial "
>                                       "%s %s %s",
> -                                     args->use_dirty_ring ?
> -                                     ",dirty-ring-size=4096" : "",
>                                       cmd_common->str,
>                                       tmpfs,
>                                       arch_source,
> @@ -692,13 +697,11 @@ static int test_migrate_start(QTestState **from, QTestState **to,
>          *from = qtest_init(cmd_source);
>      }
>  
> -    cmd_target = g_strdup_printf("-accel kvm%s -accel tcg %s "
> +    cmd_target = g_strdup_printf("%s "
>                                   "-name target,debug-threads=on "
>                                   "-serial file:%s/dest_serial "
>                                   "-incoming %s "
>                                   "%s %s %s",
> -                                 args->use_dirty_ring ?
> -                                 ",dirty-ring-size=4096" : "",
>                                   cmd_common->str,
>                                   tmpfs, uri,
>                                   arch_target,
> -- 
> 2.38.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

