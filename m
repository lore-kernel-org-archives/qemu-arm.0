Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp623742ejc;
        Thu, 19 Jan 2023 13:11:14 -0800 (PST)
X-Google-Smtp-Source: AMrXdXukpPilEWLTvyKAgixi9MiJIbyqtbHaZTcOYrgwxaQsxNN+KauP+bGTIv2vKcWdNsSrYDVk
X-Received: by 2002:ac8:754c:0:b0:3b6:4731:1d0b with SMTP id b12-20020ac8754c000000b003b647311d0bmr13381930qtr.16.1674162674047;
        Thu, 19 Jan 2023 13:11:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674162674; cv=none;
        d=google.com; s=arc-20160816;
        b=ocu1O6q6EWJpTEiY08W6B9v2JD+dwhpotNDkcEfRrp25coealc1elbJaeoybYEfHtk
         Cy/CK4s4wFiiAZjj7ARM1mA/x5VtpkxOysva6gPCros/HR+W5VGzM6RAJfp0OaZqEk8x
         jFM6pqYKFXKQyan650CF5GF1+Skppbt1fPhxyAPnL92v3XBwnkePJfUyIKTCG0zNscs4
         D0jgqY3QU9zJI/RZo+X0DynXruNdmkwkhLBK9gkyu5qS/K1Fh2Bn/m1VgrpN8hwZGz8h
         AMsOaz6wNAFQc/y4HyMLPDcjmXqYKsQ57t1uW3boclWB3ISN6hZweJ8C8VS5H5YpfxM2
         y7Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=42tY+T9PvrxAnf1fJX5R4pjz86hy5EUfIq5pxa5Ru0Q=;
        b=f2j0TL82NNUpNXaCmBBMgnhcFukFjFHZzCFcHoRyA8YoWVDn/HrMFXWbfyWRRU7lor
         qrg6ZOCs3jPKizX3oVERJIgM0O34Dx6UPX8WUmnC2tWYU4ozSQZqZMHu3bXUXKzOpaLa
         VVl2R8IV8zguabSNIg4LDviTJTFOu6Sf12mIisKgZSuzEDYaJCV7JpARESuVGxea4rcv
         +6eLkytqZiOauQU/wRnzQwGAOOMy0AhFdiJvBkkvJp8pOmWs7O1U5et8x7ypFVEXQP0Q
         Z7bOQ/HSPEjrCjGZmL2/F4nKrcthgsAEHis+EzGKlEU3CNHHXZ/U4rg6+n+p4BvXIJfu
         zjNA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fWaFbDCy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jr42-20020a05622a802a00b003ad55e2f3e8si19293109qtb.413.2023.01.19.13.11.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Jan 2023 13:11:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fWaFbDCy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pIcBV-00058E-TR; Thu, 19 Jan 2023 16:10:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIcBU-000563-A6
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 16:10:56 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIcBQ-0005X1-Jn
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 16:10:56 -0500
Received: by mail-pl1-x634.google.com with SMTP id d3so3479854plr.10
 for <qemu-arm@nongnu.org>; Thu, 19 Jan 2023 13:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=42tY+T9PvrxAnf1fJX5R4pjz86hy5EUfIq5pxa5Ru0Q=;
 b=fWaFbDCyOn0uz9KKCESBMC53b+f90qtnGjUFu2nUBP4kKYTF3nvaLrUoF/HYnxey3i
 l09TJbjj+CIWBAQYVoOVvRt8usfD5dL/8E6iLOmrSk2r/0nEB11vvjnBcO7OeeiRi+iN
 milsLtNQXrhSQEsZ/SzP6ZgkW/no0Rrj+MqM+27m3Z8wWl6VdtdjXgmnisO7w37ZOk8P
 dEvHD2VCxzsdcd8zcgFvVTMRwRKsIGaz+gbzwRXYNV53kt/ggg6zg12d5pvdYNojjl2n
 8xQFZfrU4FMDSCVRkiJIaXOTm5RfcV8UL9ihRzYxoD2SGR84Xrj1EG6sSwXbJeFcalYc
 enPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=42tY+T9PvrxAnf1fJX5R4pjz86hy5EUfIq5pxa5Ru0Q=;
 b=mmVUeoRewqxJ0ROEIFTW1jY9jD8+PQLvXUZrt8wnwRlQpN0vaXhW8hOs0sE0p+FlJz
 /69Q9a6ZF/ugC07jezsYR/ZNYLhw4OwbhEFZyv2fl9ICoTEPPjBwRYCZjaxrr5LyWvhz
 oq4U3E8nRKsLa8UDKe49iuRRA6su9FHZIOyfQVPnqUs6XDOxfz0O0WkHkwIYQm1aflLF
 zpxIcrnBniuCIJ4OlN+puXk+eOJcMu88DnTesnRVqqpxshuYagZeBpRx0BGuDxEhkvhO
 2hzGOYGcveFkuD2PKu2ghMMhLm52UPnYkpJqONnea09572qIaFWJFiM+Ee3jWAjTKTpR
 +Tqw==
X-Gm-Message-State: AFqh2kr/154+dpnlC+VMztJZQBLd3zdZA1rHzHOZuSuPMS8OcTsThdZz
 aFMJq4osUCwTgIBYUSo65Z71vQ==
X-Received: by 2002:a17:902:ec85:b0:194:dda4:4b5c with SMTP id
 x5-20020a170902ec8500b00194dda44b5cmr1262953plg.28.1674162649875; 
 Thu, 19 Jan 2023 13:10:49 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 21-20020a170902c11500b001869b988d93sm18722809pli.187.2023.01.19.13.10.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 13:10:49 -0800 (PST)
Message-ID: <ca41b949-e31e-ba69-7876-e6180ef52a3b@linaro.org>
Date: Thu, 19 Jan 2023 11:10:45 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 07/11] tests/qtest/migration-test: Build command line
 using GString API (1/4)
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Fabiano Rosas <farosas@suse.de>, Thomas Huth <thuth@redhat.com>
References: <20230119145838.41835-1-philmd@linaro.org>
 <20230119145838.41835-8-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230119145838.41835-8-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-TUID: E3HmJJtxdL5s

On 1/19/23 04:58, Philippe Mathieu-Daudé wrote:
> Part 1/4: Convert memory & machine options.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   tests/qtest/migration-test.c | 22 ++++++++++++----------
>   1 file changed, 12 insertions(+), 10 deletions(-)
> 
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index 6c3db95113..7aa323a7a7 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -582,6 +582,7 @@ typedef struct {
>   static int test_migrate_start(QTestState **from, QTestState **to,
>                                 const char *uri, MigrateStart *args)
>   {
> +    g_autoptr(GString) cmd_common = NULL;
>       g_autofree gchar *arch_source = NULL;
>       g_autofree gchar *arch_target = NULL;
>       g_autofree gchar *cmd_target = NULL;
> @@ -601,6 +602,9 @@ static int test_migrate_start(QTestState **from, QTestState **to,
>       }
>   
>       got_stop = false;
> +
> +    cmd_common = g_string_new("");
> +
>       bootpath = g_strdup_printf("%s/bootsect", tmpfs);
>       if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
>           /* the assembled x86 boot sector should be exactly one sector large */
> @@ -644,6 +648,10 @@ static int test_migrate_start(QTestState **from, QTestState **to,
>       } else {
>           g_assert_not_reached();
>       }
> +    if (machine_opts) {
> +        g_string_append_printf(cmd_common, " -machine %s ", machine_opts);
> +    }
> +    g_string_append_printf(cmd_common, "-m %s ", memory_size);
>   
>       if (!getenv("QTEST_LOG") && args->hide_stderr) {
>   #ifdef _WIN32
> @@ -674,33 +682,27 @@ static int test_migrate_start(QTestState **from, QTestState **to,
>       if (!args->only_target) {
>           g_autofree gchar *cmd_source = NULL;
>   
> -        cmd_source = g_strdup_printf("-accel kvm%s -accel tcg%s%s "
> +        cmd_source = g_strdup_printf("-accel kvm%s -accel tcg%s "
>                                        "-name source,debug-threads=on "
> -                                     "-m %s "
>                                        "-serial file:%s/src_serial "
>                                        "%s %s %s %s",
>                                        args->use_dirty_ring ?
>                                        ",dirty-ring-size=4096" : "",
> -                                     machine_opts ? " -machine " : "",
> -                                     machine_opts ? machine_opts : "",

You removed two strings here, but only one %s above.


r~

> -                                     memory_size, tmpfs,
> +                                     cmd_common->str, tmpfs,
>                                        arch_source, shmem_opts,
>                                        args->opts_source ? args->opts_source : "",
>                                        ignore_stderr);
>           *from = qtest_init(cmd_source);
>       }
>   
> -    cmd_target = g_strdup_printf("-accel kvm%s -accel tcg%s%s "
> +    cmd_target = g_strdup_printf("-accel kvm%s -accel tcg%s "
>                                    "-name target,debug-threads=on "
> -                                 "-m %s "
>                                    "-serial file:%s/dest_serial "
>                                    "-incoming %s "
>                                    "%s %s %s %s",
>                                    args->use_dirty_ring ?
>                                    ",dirty-ring-size=4096" : "",
> -                                 machine_opts ? " -machine " : "",
> -                                 machine_opts ? machine_opts : "",
> -                                 memory_size, tmpfs, uri,
> +                                 cmd_common->str, tmpfs, uri,
>                                    arch_target, shmem_opts,
>                                    args->opts_target ? args->opts_target : "",
>                                    ignore_stderr);

