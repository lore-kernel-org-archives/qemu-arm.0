Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp2099191lfo;
        Fri, 5 Feb 2021 07:19:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJye+UF71UT0NlJWdm9bwV4NRzaH5fK6Yhaoom7AOabtpCAea9dApwmrCzSh626U0u0HLPof
X-Received: by 2002:a25:6b4b:: with SMTP id o11mr7312558ybm.262.1612538378434;
        Fri, 05 Feb 2021 07:19:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612538378; cv=none;
        d=google.com; s=arc-20160816;
        b=rXSnU3HhRa/HND+LWsbwoTfy8VzRv4B+Z1v/OJ4nU89hV0HUe1fhEBKgEZwHZgqmk/
         MF5cOWeszs7O3DOePt4gLG2lFafrC0CdU+46mO1GTa9usBFNK3c7Kfj/O3nqAdLGihQt
         4Y9vLDBDelmGWwFhg7saukePNK7UTt+09DP17tnS4RC5p/A2GTML5eTb4G349RljVHuC
         qYP18fPLPqVA9FOE/JiT2OZPh8zz478lC+sT3GZ/cu7ewXX7cOIst67SotqraFlwput9
         PBi1S1XeeWi+3D9Hz0irNl2VlTPgTdiu7SgkMSEOcs6gR6/R7YEg79tx6HEBNHdv+AKD
         aURg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:to:from:date:dkim-signature;
        bh=dkbrlN8kdtdbglYaZX1/Hk2/MbLaHTIhzSK7E907WME=;
        b=uipdc/n+dkNeBhQwdJkzWMFfj5Q27SdGOrpf6hPctLROrqPgMYkiX9bR0x6BM2g72G
         CC7kXrFFfnlIUfnM/sd7OztW8sCpBT98KgZMAz4uVBjoD9Th3GBh6Ok7BI8YX8lJLiQh
         ZPf/Wii86LiDho/hwhxDfpCBOk6j7pba1/NRUYBrOpRgPsIAVhjL7g9WQu92QHSo4wTi
         WtnZUV/4l/GEvjiRXq1vcnzxAf27AXE3ZK7v6i2rkLHdc7jg+Cwwpvr3JdVlFfoZVwSy
         /Qc8v06r+UeeHiBCeUtuMBlKHNphd65ugG9KGwyQ/TOqXZQbwXG8wvrBIKnnuTgCr1U4
         41Xw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GY+vN20m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s9si5474344ybk.249.2021.02.05.07.19.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Feb 2021 07:19:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GY+vN20m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l82tV-0006CP-QV
	for alex.bennee@linaro.org; Fri, 05 Feb 2021 10:19:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1l82mu-0005lZ-8O
 for qemu-arm@nongnu.org; Fri, 05 Feb 2021 10:12:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1l82mr-0006UZ-D5
 for qemu-arm@nongnu.org; Fri, 05 Feb 2021 10:12:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612537964;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dkbrlN8kdtdbglYaZX1/Hk2/MbLaHTIhzSK7E907WME=;
 b=GY+vN20mMr1c4uFiFb71n6W9pBDi+uGc5QAnU66urkc5Ebty2NQsDmKOyZjwpPGDJqhtS9
 Weuu/zjOC/+k4adI+yv3ZZvqV+PQ3KW6JnzQcaVg2sf8LjLWo8ZzZ1JbR5goZJx5EAPDuK
 ovLEPLi4seuW2LD61E66wNIJ50GaGR8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-ALaUxsHHNEGV4KX1EWGc5A-1; Fri, 05 Feb 2021 10:12:40 -0500
X-MC-Unique: ALaUxsHHNEGV4KX1EWGc5A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74F84100CCC1;
 Fri,  5 Feb 2021 15:12:39 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.195.147])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 589EB5D9FC;
 Fri,  5 Feb 2021 15:12:32 +0000 (UTC)
Date: Fri, 5 Feb 2021 16:12:29 +0100
From: Andrew Jones <drjones@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 6/9] hw/arm/virt: Display list of valid CPUs for the Virt
 machine
Message-ID: <20210205151229.ro6atrqa5bdwuj57@kamzik.brq.redhat.com>
References: <20210205144345.2068758-1-f4bug@amsat.org>
 <20210205144345.2068758-7-f4bug@amsat.org>
MIME-Version: 1.0
In-Reply-To: <20210205144345.2068758-7-f4bug@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.352,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8ZR9FKJQXcWh

On Fri, Feb 05, 2021 at 03:43:42PM +0100, Philippe Mathieu-Daudé wrote:
> The Virt machine is restricted to a subset of the CPU provided
> by QEMU. Instead of having the user run '--cpu help' and try
> each CPUs until finding a match, display the list from start:
> 
>   $ qemu-system-aarch64 -M virt -cpu cortex-a8
>   qemu-system-aarch64: mach-virt: CPU type cortex-a8 not supported
>   qemu-system-aarch64: mach-virt: Please select one of the following CPU types:  cortex-a7, cortex-a15, cortex-a53, cortex-a57, cortex-a72, host, max
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/arm/virt.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 7802d3a66e8..6ffe091804f 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1830,9 +1830,20 @@ static void machvirt_init(MachineState *machine)
>  
>      if (!cpu_type_valid(machine->cpu_type)) {
>          int len = strlen(machine->cpu_type) - strlen(ARM_CPU_TYPE_SUFFIX);
> +        g_autoptr(GString) s = g_string_new(NULL);
>  
>          error_report("mach-virt: CPU type %.*s not supported",
>                       len, machine->cpu_type);
> +
> +        for (n = 0; n < ARRAY_SIZE(valid_cpus); n++) {
> +            len = strlen(valid_cpus[n]) - strlen(ARM_CPU_TYPE_SUFFIX);
> +            g_string_append_printf(s, " %.*s", len, valid_cpus[n]);
> +            if (n + 1 < ARRAY_SIZE(valid_cpus)) {
> +                g_string_append_c(s, ',');
> +            }
> +        }
> +        error_report("mach-virt: Please select one of the following CPU types: %s",
> +                     g_string_free(s, FALSE));
>          exit(1);
>      }
>  
> -- 
> 2.26.2
>

It'd be nice if './qemu-system-aarch64 -M virt -cpu \?' would only output
the CPUs that the virt machine type supports. Then this error message
could suggest running that in order to get the list.

Thanks,
drew

