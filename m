Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp4005744lfa;
        Mon, 19 Oct 2020 09:13:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzPm+DLOyPHwfcBtYJZTrZYUglEhpWchL7aIrfr+TZb5RhMlqrs/pKRmMhMg+5XrhOr9Q7v
X-Received: by 2002:a25:75c5:: with SMTP id q188mr585288ybc.292.1603123996044;
        Mon, 19 Oct 2020 09:13:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603123996; cv=none;
        d=google.com; s=arc-20160816;
        b=zJGaBAPCdsJPMpI+Bwup0J3zpQupbqZW1V/9g4GklMuS9gAYlfnYowVHSqfdrxouds
         37jb7W4YcBAwQPcAsnCxuh+ets9npvlepOqEqP7Iz39QEcnGWJbs4Z5IONwsAf2aVHHb
         wjiFcIjGqQ/4GMF+FYIrb7exe7hN/WJLOotxkdnEttrtRdz8lpuAy9l/EC7Fusq9KNcK
         I+lQ7aD61oEnEzoyA5/UW60KT5cQ+l47v1l/WWY0cDO+WqkkryBUAwYVzwoiRQFBXsYl
         94RXQH3wtiwIJhKNndGwGXGEQnZEZZVowc2ICpaXnpaI0AhSBQ/XTN1OYI2swNLhM2ew
         wVVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=GQpcYyIs6dBhaxIqbwXb8JwMFZPuxTa4HBaDcfLZq28=;
        b=CGSBSGl72bju1Vo/0lXASBzr4Pq8y9GEfz2+9PgFoopJTqKuKD9xLQZrgLIPtYD6zR
         yMbUDrDe23s+iAiBNBmVnxgHkrAkYWkJyj+EtQca9rZjqYp2zEvxh0K91K6/BZSljZtv
         Qnn1rpMxZxfxkm6URoLFEfdXHqQff6JteB2CZOf+yZovZ/9EYZVQCUSg5IHuNYYOEV5b
         wBC46Ajw8cBZNLIysY1Cn1vr728kFQq+bEm8uZF/D7IZBJ3fIK/j/d+LMCjYViX4rb+B
         in7GBPOci6dSp5ciMet3jzyC6sLjrr32I55IZCHpJF2v566Jci6uYZ3+cup++vaRdapJ
         NRPA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="BDQ+bM/d";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 22si333740ybc.413.2020.10.19.09.13.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Oct 2020 09:13:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="BDQ+bM/d";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kUXmd-0002i4-EQ
	for alex.bennee@linaro.org; Mon, 19 Oct 2020 12:13:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kUXmL-0002c0-VZ
 for qemu-arm@nongnu.org; Mon, 19 Oct 2020 12:12:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kUXmH-0002li-NC
 for qemu-arm@nongnu.org; Mon, 19 Oct 2020 12:12:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603123972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GQpcYyIs6dBhaxIqbwXb8JwMFZPuxTa4HBaDcfLZq28=;
 b=BDQ+bM/dpC7zmVoJZWlBfOsUihLuJc9/Jm/mjRHwyAYAcwWYLnq+UnQD5ctb3Vl9BSZEoj
 BHiLemYSQWENDwP6I9GmLdxWJbEqcZ0U+4T9W9QYSiFBCOjfh1c5p3NGeDWy6PpOlxPuf5
 EAlYoUi2iAqD/l6MheQGVwjFqpppjiY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-474-mQ2tddmwMSmNtTsZTugByw-1; Mon, 19 Oct 2020 12:12:49 -0400
X-MC-Unique: mQ2tddmwMSmNtTsZTugByw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 452331800D41;
 Mon, 19 Oct 2020 16:12:46 +0000 (UTC)
Received: from thuth.remote.csb (dhcp-192-238.str.redhat.com [10.33.192.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BE9CB6EF5B;
 Mon, 19 Oct 2020 16:12:44 +0000 (UTC)
Subject: Re: [PATCH] hw/arm/nseries: Fix loading kernel image on n8x0 machines
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201019095148.1602119-1-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <918b0dbd-668c-a3ab-0819-cb77be5f32b9@redhat.com>
Date: Mon, 19 Oct 2020 18:12:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20201019095148.1602119-1-f4bug@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/19 02:32:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: J600ELTQbNoD

On 19/10/2020 11.51, Philippe Mathieu-Daudé wrote:
> Commit 7998beb9c2e removed the ram_size initialization in the
> arm_boot_info structure, however it is used by arm_load_kernel().
> 
> Initialize the field to fix:
> 
>   $ qemu-system-arm -M n800 -append 'console=ttyS1' \
>     -kernel meego-arm-n8x0-1.0.80.20100712.1431-vmlinuz-2.6.35~rc4-129.1-n8x0
>   qemu-system-arm: kernel 'meego-arm-n8x0-1.0.80.20100712.1431-vmlinuz-2.6.35~rc4-129.1-n8x0' is too large to fit in RAM (kernel size 1964608, RAM size 0)
> 
> Noticed while running the test introduced in commit 050a82f0c5b
> ("tests/acceptance: Add a test for the N800 and N810 arm machines").
> 
> Fixes: 7998beb9c2e ("arm/nseries: use memdev for RAM")
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/arm/nseries.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/arm/nseries.c b/hw/arm/nseries.c
> index e48092ca047..76fd7fe9854 100644
> --- a/hw/arm/nseries.c
> +++ b/hw/arm/nseries.c
> @@ -1318,6 +1318,7 @@ static void n8x0_init(MachineState *machine,
>          g_free(sz);
>          exit(EXIT_FAILURE);
>      }
> +    binfo->ram_size = machine->ram_size;
>  
>      memory_region_add_subregion(get_system_memory(), OMAP2_Q2_BASE,
>                                  machine->ram);
> 

Fixes the test in "make check-acceptance" for me:

Tested-by: Thomas Huth <thuth@redhat.com>

