Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp432716njb;
        Tue, 13 May 2025 04:02:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVotkkX/aPnIF44SwQchAaOo9XZYNBzmu0ci2bPv/YTl0zeRrHdXnvgCICo8vCTUme/kcCT1oua1MXmxg==@linaro.org
X-Google-Smtp-Source: AGHT+IE8QDB/vPfc7TMSVPtWeiY74+elgg9YBtBx/1rtzu6fSGrgv60UNhPef4XqvmUYLZDF2lVq
X-Received: by 2002:a05:600c:3b84:b0:43d:683:8cb2 with SMTP id 5b1f17b1804b1-442d6d44b30mr152584495e9.14.1747134163170;
        Tue, 13 May 2025 04:02:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747134163; cv=none;
        d=google.com; s=arc-20240605;
        b=jJ7Oa1FEl+tfbIb2617VPM38BmfjAXznYcIG3tjATlLkUngL2ikInOJDIXDKou+Wrr
         A8NZfydT5r+N5S9aucM9azD0962jcFyBOEr6bu5clV0fG9/y00mmxnuP+btDOC3nm+DZ
         TtUo8p16pojDmlmIZubVB6SWf277PNUtOZnD/RbcEW6twSXDfvzmvsBbORAXSXrYi6b1
         BI3SFWKXRtXiYRs6xJXlR72hygcCHmmJznWrQxdZ9X7BGiKXKuFCyh0cJc/CPxIJwATF
         FW3adPdKWXd2uZbPX7CUocNx2ygjaYarE5ZDPoU0IOr05Z0iXiyJWmuBjul+IzTKpBrU
         gg7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=R+MUBu+AOkvHvputcwm8mNfXLGlZ4E78YSyM2ij8pJw=;
        fh=IukfHilyHSfDkhuSBbvZZuJo7btCZ/P83f3u1/HoAsU=;
        b=irZkLAOF5B0i6zfuTGhj7t7kP4r8xD556rDkXYIcHrKlzvXVpcU8XoSZJZtEhcLeGb
         luInS2/nQpx6TFcI6EDV8vhAUWY9yyzminmSUnuyqLdgnpLxOeWT2halQRYz2y/x2rM0
         +itF+1joLYkW8R+9t5AqDwdfR9ZpURvrUM8wt6RVDORZZ88ZxfOg/uO8MsLIr4D5/vq8
         EqEfxhxHNGiQnbrHakyQX+vrUvO5QhxZJZL+UR7uIWtEdD1cwY7S/7om+/kCkFKiigip
         WdHGaePh+FPtjVtviOPV918AWkj6DMgq+3PYfbVYSln9/gSNUVi3AbFsUbD3V24xJHzX
         KtgQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aT65QR1x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-442cd32f146si99780485e9.46.2025.05.13.04.02.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 May 2025 04:02:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aT65QR1x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uEnPC-0007Mi-Sw; Tue, 13 May 2025 07:02:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1uEnPA-0007MI-QS
 for qemu-arm@nongnu.org; Tue, 13 May 2025 07:02:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1uEnP5-0004mn-NS
 for qemu-arm@nongnu.org; Tue, 13 May 2025 07:02:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747134150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R+MUBu+AOkvHvputcwm8mNfXLGlZ4E78YSyM2ij8pJw=;
 b=aT65QR1xrOUHHtalOqhJueZQUNa9xDTioHiKcJ6+w0/Z46aKFhbrfCqlWw5Y348IprUvgp
 VTaq0AQFpen4rKlq/Pz9VO3dc1L3xypxm9rYgSG2F6WsRbqajnFo4yJU7HQLA+w4EsM6UO
 LeOSfZsNO/SkNN7X+TKE3Cp81odBxis=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-549-JS9d9SK0MFm8j8b9ljbkCA-1; Tue, 13 May 2025 07:02:29 -0400
X-MC-Unique: JS9d9SK0MFm8j8b9ljbkCA-1
X-Mimecast-MFC-AGG-ID: JS9d9SK0MFm8j8b9ljbkCA_1747134147
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-43cf172ffe1so38118465e9.3
 for <qemu-arm@nongnu.org>; Tue, 13 May 2025 04:02:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747134147; x=1747738947;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JW7oK2CyI854OSLqH48Mzg+zv/icPx31EwbrZmKAXLE=;
 b=pYTQBXSpBuCKbPCOVCoG+ixJ5hkkJNzkxQDiAxVOph+xyQJW6loW4WGRsVEyr/6faN
 zJIuJN1JVxG4DBYgjBCKrO4qrak+LGUzaki0phb4QWN6YJM8T1F+HMjHYvzX7Bqo/YCh
 40/SOpPLc7HdBMgsfxgTfKrqaTlmgP6WKVw8IuzmUfop9DHUErUHIbbRISzN8sk9H94e
 KUmXvL8TA8G86lAnBbmlAp+zo5LqHtZVaufZcOpoBwhBDyy7Sk1Zz+ELBxDGK0wD5Qdy
 ZljXoQf43FkGTXktvzZ3G+e9+C5ZFbfEd9hO6Bm9t+En827RC8iSIJ358nlaif2nTF3Q
 DtnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfS+dfPBc0Y1WmOYxy/FlEz1P9vaguRsuhynQQ17/ZpFz3P7ilNQ4awSByK1wy7J7PlJFWZtuDNA==@nongnu.org
X-Gm-Message-State: AOJu0YxRFIy1cUVK1BFWimGJGPRX/rN7/JkgVIa1mlcEPKRvhmCFvzRe
 4qgfArD23XLJnNjom2rYgEeueshgy9I+GNzcXk9Tr+8w102SAbU6zeC53fqxix9aeE5+Fek5SMl
 /ORZA48DVp0wtTq6k/3xlLOpudrgj05UProeNGvM2Rm8XbB2dvA==
X-Gm-Gg: ASbGncvWRfJelCrtQ2VbEAkFg+JIyTtjSMP2SyLqjkXAosFCQVlzHz9BQJimBZO61+7
 5C9YMQi/RBmX1v9pgAMdZsxg5Bzg72T/gHRSIxqBHhfPPpolpt7ay94iQwd4oplVAUVnI8Auwy5
 iRzwIg+TZBPrwKuoY/0E6h/7B4Elp4C/VWBa9D6QigXqyCZRG6Ei8KjDCkGTRsjcZtHh8l9eY2K
 PtEPvlpGEeecOLr7reuHrJSggLA7kxdl+f08iOz1BzEFNJObbyNtPsLSc55yKO2/VLO4rgbkWrd
 0n/MqOScOiCMQRLt4+ys5/kzldv9vZFB
X-Received: by 2002:a05:600c:83ca:b0:43c:fb95:c752 with SMTP id
 5b1f17b1804b1-442d6d18b68mr175998765e9.3.1747134146805; 
 Tue, 13 May 2025 04:02:26 -0700 (PDT)
X-Received: by 2002:a05:600c:83ca:b0:43c:fb95:c752 with SMTP id
 5b1f17b1804b1-442d6d18b68mr175998075e9.3.1747134146360; 
 Tue, 13 May 2025 04:02:26 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com ([85.93.96.130])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442ea45c209sm38283135e9.17.2025.05.13.04.02.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 May 2025 04:02:25 -0700 (PDT)
Date: Tue, 13 May 2025 13:02:24 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 kvm@vger.kernel.org, Sergio Lopez <slp@redhat.com>, Gerd Hoffmann
 <kraxel@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, Laurent
 Vivier <lvivier@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Yi Liu
 <yi.l.liu@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>, Eduardo
 Habkost <eduardo@habkost.net>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, Marcelo Tosatti
 <mtosatti@redhat.com>, qemu-riscv@nongnu.org, Weiwei Li
 <liwei1518@gmail.com>, Amit Shah <amit@kernel.org>, Zhao Liu
 <zhao1.liu@intel.com>, Yanan Wang <wangyanan55@huawei.com>, Helge Deller
 <deller@gmx.de>, Palmer Dabbelt <palmer@dabbelt.com>, Ani Sinha
 <anisinha@redhat.com>, Fabiano Rosas <farosas@suse.de>, Paolo Bonzini
 <pbonzini@redhat.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?B?Q2zDqW1lbnQ=?= Mathieu--Drif <clement.mathieu--drif@eviden.com>,
 qemu-arm@nongnu.org, =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau
 <marcandre.lureau@redhat.com>, Huacai Chen <chenhuacai@kernel.org>, Jason
 Wang <jasowang@redhat.com>
Subject: Re: [PATCH v4 19/27] target/i386/cpu: Remove
 CPUX86State::full_cpuid_auto_level field
Message-ID: <20250513130224.3aa2e837@imammedo.users.ipa.redhat.com>
In-Reply-To: <20250508133550.81391-20-philmd@linaro.org>
References: <20250508133550.81391-1-philmd@linaro.org>
 <20250508133550.81391-20-philmd@linaro.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IDNpIV7ufVKT7RrnV3Prib77W0jvdrAu-sAwltgy6XY_1747134147
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.551,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: usUea/4stARo

On Thu,  8 May 2025 15:35:42 +0200
Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:

> The CPUX86State::full_cpuid_auto_level boolean was only
> disabled for the pc-q35-2.7 and pc-i440fx-2.7 machines,
> which got removed. Being now always %true, we can remove
> it and simplify x86_cpu_expand_features().

I've found field being mentioned only by some external rust library,
that's likely shouldn't concern QEMU qemu though.

I'm not confident enough to ack it but I won't object either
=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  target/i386/cpu.h |   3 --
>  target/i386/cpu.c | 106 ++++++++++++++++++++++------------------------
>  2 files changed, 51 insertions(+), 58 deletions(-)
>=20
> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> index 7585407da54..b5cbd91c156 100644
> --- a/target/i386/cpu.h
> +++ b/target/i386/cpu.h
> @@ -2241,9 +2241,6 @@ struct ArchCPU {
>       */
>      bool legacy_multi_node;
> =20
> -    /* Enable auto level-increase for all CPUID leaves */
> -    bool full_cpuid_auto_level;
> -
>      /* Only advertise CPUID leaves defined by the vendor */
>      bool vendor_cpuid_only;
> =20
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index fb505d13122..6b9a1f2251a 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -7843,68 +7843,65 @@ void x86_cpu_expand_features(X86CPU *cpu, Error *=
*errp)
> =20
>      /* CPUID[EAX=3D7,ECX=3D0].EBX always increased level automatically: =
*/
>      x86_cpu_adjust_feat_level(cpu, FEAT_7_0_EBX);
> -    if (cpu->full_cpuid_auto_level) {
> -        x86_cpu_adjust_feat_level(cpu, FEAT_1_EDX);
> -        x86_cpu_adjust_feat_level(cpu, FEAT_1_ECX);
> -        x86_cpu_adjust_feat_level(cpu, FEAT_6_EAX);
> -        x86_cpu_adjust_feat_level(cpu, FEAT_7_0_ECX);
> -        x86_cpu_adjust_feat_level(cpu, FEAT_7_1_EAX);
> -        x86_cpu_adjust_feat_level(cpu, FEAT_7_1_EDX);
> -        x86_cpu_adjust_feat_level(cpu, FEAT_7_2_EDX);
> -        x86_cpu_adjust_feat_level(cpu, FEAT_8000_0001_EDX);
> -        x86_cpu_adjust_feat_level(cpu, FEAT_8000_0001_ECX);
> -        x86_cpu_adjust_feat_level(cpu, FEAT_8000_0007_EDX);
> -        x86_cpu_adjust_feat_level(cpu, FEAT_8000_0008_EBX);
> -        x86_cpu_adjust_feat_level(cpu, FEAT_C000_0001_EDX);
> -        x86_cpu_adjust_feat_level(cpu, FEAT_SVM);
> -        x86_cpu_adjust_feat_level(cpu, FEAT_XSAVE);
> +    x86_cpu_adjust_feat_level(cpu, FEAT_1_EDX);
> +    x86_cpu_adjust_feat_level(cpu, FEAT_1_ECX);
> +    x86_cpu_adjust_feat_level(cpu, FEAT_6_EAX);
> +    x86_cpu_adjust_feat_level(cpu, FEAT_7_0_ECX);
> +    x86_cpu_adjust_feat_level(cpu, FEAT_7_1_EAX);
> +    x86_cpu_adjust_feat_level(cpu, FEAT_7_1_EDX);
> +    x86_cpu_adjust_feat_level(cpu, FEAT_7_2_EDX);
> +    x86_cpu_adjust_feat_level(cpu, FEAT_8000_0001_EDX);
> +    x86_cpu_adjust_feat_level(cpu, FEAT_8000_0001_ECX);
> +    x86_cpu_adjust_feat_level(cpu, FEAT_8000_0007_EDX);
> +    x86_cpu_adjust_feat_level(cpu, FEAT_8000_0008_EBX);
> +    x86_cpu_adjust_feat_level(cpu, FEAT_C000_0001_EDX);
> +    x86_cpu_adjust_feat_level(cpu, FEAT_SVM);
> +    x86_cpu_adjust_feat_level(cpu, FEAT_XSAVE);
> =20
> -        /* Intel Processor Trace requires CPUID[0x14] */
> -        if ((env->features[FEAT_7_0_EBX] & CPUID_7_0_EBX_INTEL_PT)) {
> -            if (cpu->intel_pt_auto_level) {
> -                x86_cpu_adjust_level(cpu, &cpu->env.cpuid_min_level, 0x1=
4);
> -            } else if (cpu->env.cpuid_min_level < 0x14) {
> -                mark_unavailable_features(cpu, FEAT_7_0_EBX,
> -                    CPUID_7_0_EBX_INTEL_PT,
> -                    "Intel PT need CPUID leaf 0x14, please set by \"-cpu=
 ...,intel-pt=3Don,min-level=3D0x14\"");
> -            }
> +    /* Intel Processor Trace requires CPUID[0x14] */
> +    if ((env->features[FEAT_7_0_EBX] & CPUID_7_0_EBX_INTEL_PT)) {
> +        if (cpu->intel_pt_auto_level) {
> +            x86_cpu_adjust_level(cpu, &cpu->env.cpuid_min_level, 0x14);
> +        } else if (cpu->env.cpuid_min_level < 0x14) {
> +            mark_unavailable_features(cpu, FEAT_7_0_EBX, CPUID_7_0_EBX_I=
NTEL_PT,
> +                "Intel PT need CPUID leaf 0x14, please set by \"-cpu ...=
,intel-pt=3Don,min-level=3D0x14\"");
>          }
> +    }
> =20
> -        /*
> -         * Intel CPU topology with multi-dies support requires CPUID[0x1=
F].
> -         * For AMD Rome/Milan, cpuid level is 0x10, and guest OS should =
detect
> -         * extended toplogy by leaf 0xB. Only adjust it for Intel CPU, u=
nless
> -         * cpu->vendor_cpuid_only has been unset for compatibility with =
older
> -         * machine types.
> -         */
> -        if (x86_has_extended_topo(env->avail_cpu_topo) &&
> -            (IS_INTEL_CPU(env) || !cpu->vendor_cpuid_only)) {
> -            x86_cpu_adjust_level(cpu, &env->cpuid_min_level, 0x1F);
> -        }
> +    /*
> +     * Intel CPU topology with multi-dies support requires CPUID[0x1F].
> +     * For AMD Rome/Milan, cpuid level is 0x10, and guest OS should dete=
ct
> +     * extended toplogy by leaf 0xB. Only adjust it for Intel CPU, unles=
s
> +     * cpu->vendor_cpuid_only has been unset for compatibility with olde=
r
> +     * machine types.
> +     */
> +    if (x86_has_extended_topo(env->avail_cpu_topo) &&
> +        (IS_INTEL_CPU(env) || !cpu->vendor_cpuid_only)) {
> +        x86_cpu_adjust_level(cpu, &env->cpuid_min_level, 0x1F);
> +    }
> =20
> -        /* Advanced Vector Extensions 10 (AVX10) requires CPUID[0x24] */
> -        if (env->features[FEAT_7_1_EDX] & CPUID_7_1_EDX_AVX10) {
> -            x86_cpu_adjust_level(cpu, &env->cpuid_min_level, 0x24);
> -        }
> +    /* Advanced Vector Extensions 10 (AVX10) requires CPUID[0x24] */
> +    if (env->features[FEAT_7_1_EDX] & CPUID_7_1_EDX_AVX10) {
> +        x86_cpu_adjust_level(cpu, &env->cpuid_min_level, 0x24);
> +    }
> =20
> -        /* SVM requires CPUID[0x8000000A] */
> -        if (env->features[FEAT_8000_0001_ECX] & CPUID_EXT3_SVM) {
> -            x86_cpu_adjust_level(cpu, &env->cpuid_min_xlevel, 0x8000000A=
);
> -        }
> +    /* SVM requires CPUID[0x8000000A] */
> +    if (env->features[FEAT_8000_0001_ECX] & CPUID_EXT3_SVM) {
> +        x86_cpu_adjust_level(cpu, &env->cpuid_min_xlevel, 0x8000000A);
> +    }
> =20
> -        /* SEV requires CPUID[0x8000001F] */
> -        if (sev_enabled()) {
> -            x86_cpu_adjust_level(cpu, &env->cpuid_min_xlevel, 0x8000001F=
);
> -        }
> +    /* SEV requires CPUID[0x8000001F] */
> +    if (sev_enabled()) {
> +        x86_cpu_adjust_level(cpu, &env->cpuid_min_xlevel, 0x8000001F);
> +    }
> =20
> -        if (env->features[FEAT_8000_0021_EAX]) {
> -            x86_cpu_adjust_level(cpu, &env->cpuid_min_xlevel, 0x80000021=
);
> -        }
> +    if (env->features[FEAT_8000_0021_EAX]) {
> +        x86_cpu_adjust_level(cpu, &env->cpuid_min_xlevel, 0x80000021);
> +    }
> =20
> -        /* SGX requires CPUID[0x12] for EPC enumeration */
> -        if (env->features[FEAT_7_0_EBX] & CPUID_7_0_EBX_SGX) {
> -            x86_cpu_adjust_level(cpu, &env->cpuid_min_level, 0x12);
> -        }
> +    /* SGX requires CPUID[0x12] for EPC enumeration */
> +    if (env->features[FEAT_7_0_EBX] & CPUID_7_0_EBX_SGX) {
> +        x86_cpu_adjust_level(cpu, &env->cpuid_min_level, 0x12);
>      }
> =20
>      /* Set cpuid_*level* based on cpuid_min_*level, if not explicitly se=
t */
> @@ -8820,7 +8817,6 @@ static const Property x86_cpu_properties[] =3D {
>      DEFINE_PROP_UINT32("min-xlevel2", X86CPU, env.cpuid_min_xlevel2, 0),
>      DEFINE_PROP_UINT8("avx10-version", X86CPU, env.avx10_version, 0),
>      DEFINE_PROP_UINT64("ucode-rev", X86CPU, ucode_rev, 0),
> -    DEFINE_PROP_BOOL("full-cpuid-auto-level", X86CPU, full_cpuid_auto_le=
vel, true),
>      DEFINE_PROP_STRING("hv-vendor-id", X86CPU, hyperv_vendor),
>      DEFINE_PROP_BOOL("x-vendor-cpuid-only", X86CPU, vendor_cpuid_only, t=
rue),
>      DEFINE_PROP_BOOL("x-amd-topoext-features-only", X86CPU, amd_topoext_=
features_only, true),

