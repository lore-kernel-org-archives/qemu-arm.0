Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp421260lfm;
        Wed, 22 Jul 2020 00:14:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzoh24EvV0X7c9ltQoT39o74ntaeEqg/7+c1zMulyOy2P34qam8/7hGZaBJst6d50cThI84
X-Received: by 2002:a25:7508:: with SMTP id q8mr1851419ybc.126.1595402056808;
        Wed, 22 Jul 2020 00:14:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595402056; cv=none;
        d=google.com; s=arc-20160816;
        b=t/Yckr2MokiMIAMEVNEJ9iGq10dvMH3hjIJTVBv4LkQh+Aj+HtD5Ryi7rz1CmmnWZp
         gM8CbM959Tx5nOZuFUPWx+lE5c9AarYhc3/+V11N3Grw9cNFq5QT+ykdJqxhECKSo5dV
         J3ehHawbxj4Mee7RKjVEPSlHXJiTv8t52JikVEy63/cL+VfDY54qYOQfmGXxb7fU/L3w
         BTlYTABaRKGJ+OdDfkJ2OhtP4UT8cMRVjyCWY9+cHB6Jkd0JqHz7F3W0fSNM4S/v6Hf4
         tz4GDpt6S0xGjd7+95iXxE4UdZ8+Y98lMtjonCJeAquAZ2hGPQ6Xo8VeUxsp93mUXSkh
         scIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:from:references:to:subject:dkim-signature;
        bh=55sAn4KH8DjegnjcyB+nfzO7WLFFQuZxf88ZYgJxYAA=;
        b=Q2xHIWnXm0NwjQGEJ4SnQ2tKdKx100sX9k2yguz0eIqx+0ZITUkSD7m1hZ1DQZPOyQ
         8dZdI1scAm6G9RCLonRjzyW/T34M/HyMMginQVPDo4lTMDQPz8OL9LThN2aAGjpuxnfM
         Pv/ICecnsm3u61u/eNeH4K9PIx6ISJoa0ZrzYbgq0qh6uPRG/XSp8Sz/+FL3MxGLNyKZ
         xJeF2HwMrMBgs4ITIPpBsytKEQxvj2e7KR/hPfUO//h4kQPoAWUcj5ysEP1TS5+7SdsV
         s0iOYY2vDEnHqntKq71plRipew47LlrJLgxFxgZDAvKjIxwX8JOdDvOibKjwbI7ZMzab
         e0rQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=gb8kszd8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y1si22558193yby.225.2020.07.22.00.14.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Jul 2020 00:14:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=gb8kszd8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jy8xE-0005uD-2A
	for alex.bennee@linaro.org; Wed, 22 Jul 2020 03:14:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jy8x3-0005tp-N1
 for qemu-arm@nongnu.org; Wed, 22 Jul 2020 03:14:06 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:52312
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jy8x0-0005GH-Ek
 for qemu-arm@nongnu.org; Wed, 22 Jul 2020 03:14:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595402041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=55sAn4KH8DjegnjcyB+nfzO7WLFFQuZxf88ZYgJxYAA=;
 b=gb8kszd89FceLp3IRn/wAg+cIsFtCkNrzeC9OHtTOMHPneJb/qYay0vOOSEljZJRw4Yk8N
 lyPi50BRIsOgyvj8G+PHCf+FzxcJMwfOQ0c2VYN20PXzZnria3ttImcXW43en8zi92TAGe
 GtuMxZJGmrgkXBhpQ9KvJ5kgv++BDcc=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-P7130jhgPg202h4WalAaOA-1; Wed, 22 Jul 2020 03:14:00 -0400
X-MC-Unique: P7130jhgPg202h4WalAaOA-1
Received: by mail-ej1-f70.google.com with SMTP id gv21so638416ejb.8
 for <qemu-arm@nongnu.org>; Wed, 22 Jul 2020 00:13:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=55sAn4KH8DjegnjcyB+nfzO7WLFFQuZxf88ZYgJxYAA=;
 b=tbAvr0O5BE1NJIlIFHxCOGhiDE/lBGrhZBCgVsXK6G04Tesx39QX9jmFKQq76TnrkF
 y4m0ZwW797SOv/tN8yauKB5lyaCzQls11r39sDWU+V3+taDjb0IyEnfQp3AzWtqxv9G1
 7J0KCG7tDEdZLpNpd6cCYtFvghZB/KQ4gizeSrb+0vHNW2VYill2D60ZsW1Z9OYNBzzl
 HzNtbliDnlAzaFQJf0EmTQNWsIqUbRISyr+kJYP0HCIm/avRSBt9GCeG47s6SPpGPct3
 +/xeiSX2b9XndFg+oXdjhzyGcJY74opu4HAPa73I37ZwyPnz+SJqfYesni/jtZheUcWF
 uGbA==
X-Gm-Message-State: AOAM530MoaYHeYR00pLVJj0OvXqeEYVdCAK6PEl8JVRUxYUOo/rONYmv
 eJLRqJ0fI1RKt6lXU6P7xJC1/t87A7BgcBgh3T5AB/cTqS3hF1mR/KVRJ5JWEn6bmEA6BPvxJ3Q
 pZar6T5eS7Cun
X-Received: by 2002:a17:906:1a16:: with SMTP id
 i22mr29661536ejf.439.1595402038857; 
 Wed, 22 Jul 2020 00:13:58 -0700 (PDT)
X-Received: by 2002:a17:906:1a16:: with SMTP id
 i22mr29661503ejf.439.1595402038590; 
 Wed, 22 Jul 2020 00:13:58 -0700 (PDT)
Received: from [192.168.1.36] (138.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.138])
 by smtp.gmail.com with ESMTPSA id j19sm18939232edt.44.2020.07.22.00.13.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jul 2020 00:13:57 -0700 (PDT)
Subject: Re: [PATCH v2 3/9] ppc/spapr: Use start-powered-off CPUState property
To: Thiago Jung Bauermann <bauerman@linux.ibm.com>, qemu-ppc@nongnu.org
References: <20200722035016.469075-1-bauerman@linux.ibm.com>
 <20200722035016.469075-4-bauerman@linux.ibm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <d0f25f95-039e-d150-9369-7a1334ff3e12@redhat.com>
Date: Wed, 22 Jul 2020 09:13:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200722035016.469075-4-bauerman@linux.ibm.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/21 23:27:14
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, qemu-arm@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: we1EoZphkxxb

On 7/22/20 5:50 AM, Thiago Jung Bauermann wrote:
> PowerPC sPAPR CPUs start in the halted state, and spapr_reset_vcpu()
> attempts to implement this by setting CPUState::halted to 1. But that's too
> late for the case of hotplugged CPUs in a machine configure with 2 or more
> threads per core.
> 
> By then, other parts of QEMU have already caused the vCPU to run in an
> unitialized state a couple of times. For example, ppc_cpu_reset() calls
> ppc_tlb_invalidate_all(), which ends up calling async_run_on_cpu(). This
> kicks the new vCPU while it has CPUState::halted = 0, causing QEMU to issue
> a KVM_RUN ioctl on the new vCPU before the guest is able to make the
> start-cpu RTAS call to initialize its register state.
> 
> This problem doesn't seem to cause visible issues for regular guests, but
> on a secure guest running under the Ultravisor it does. The Ultravisor
> relies on being able to snoop on the start-cpu RTAS call to map vCPUs to
> guests, and this issue causes it to see a stray vCPU that doesn't belong to
> any guest.
> 
> Fix by setting the start-powered-off CPUState property in
> spapr_create_vcpu(), which makes cpu_common_reset() initialize
> CPUState::halted to 1 at an earlier moment.
> 
> Suggested-by: Eduardo Habkost <ehabkost@redhat.com>
> Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
> ---
>  hw/ppc/spapr_cpu_core.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> NB: Tested on ppc64le pseries KVM guest with two threads per core. 
> Hot-plugging additional cores doesn't cause the bug described above
> anymore.
> 
> diff --git a/hw/ppc/spapr_cpu_core.c b/hw/ppc/spapr_cpu_core.c
> index c4f47dcc04..09feeb5f8f 100644
> --- a/hw/ppc/spapr_cpu_core.c
> +++ b/hw/ppc/spapr_cpu_core.c
> @@ -36,11 +36,6 @@ static void spapr_reset_vcpu(PowerPCCPU *cpu)
>  
>      cpu_reset(cs);
>  
> -    /* All CPUs start halted.  CPU0 is unhalted from the machine level
> -     * reset code and the rest are explicitly started up by the guest
> -     * using an RTAS call */
> -    cs->halted = 1;
> -
>      env->spr[SPR_HIOR] = 0;
>  
>      lpcr = env->spr[SPR_LPCR];
> @@ -288,6 +283,13 @@ static PowerPCCPU *spapr_create_vcpu(SpaprCpuCore *sc, int i, Error **errp)
>  
>      cpu->machine_data = g_new0(SpaprCpuState, 1);
>  
> +    /*
> +     * All CPUs start halted. CPU0 is unhalted from the machine level reset code
> +     * and the rest are explicitly started up by the guest using an RTAS call.
> +     */
> +    object_property_set_bool(OBJECT(cs), "start-powered-off", true,
> +                             &error_abort);

Since here object_new() is used, it is simpler to set the field before
the object is realized, similarly to cs->cpu_index:

-- >8 --
@@ -275,6 +275,11 @@ static PowerPCCPU *spapr_create_vcpu(SpaprCpuCore
*sc, int i, Error **errp)
     cs = CPU(obj);
     cpu = POWERPC_CPU(obj);
     cs->cpu_index = cc->core_id + i;
+    /*
+     * All CPUs start halted. CPU0 is unhalted from the machine level
reset code
+     * and the rest are explicitly started up by the guest using an
RTAS call.
+     */
+    cs->start_powered_off = true;
     spapr_set_vcpu_id(cpu, cs->cpu_index, &local_err);
     if (local_err) {
         goto err;
---

> +
>      object_unref(obj);
>      return cpu;
>  
> 

