Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2902919lfy;
        Mon, 27 Jul 2020 07:26:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwE1WwKDwhOrWzI/hmUdMD99uM0OtGPZUbZFmudPiKhogeRziBcxertSpyJKlgLmcVwB8pO
X-Received: by 2002:a17:906:dce:: with SMTP id p14mr20656023eji.442.1595859968221;
        Mon, 27 Jul 2020 07:26:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595859968; cv=none;
        d=google.com; s=arc-20160816;
        b=yG/E6rQETQWkgdmNBiZfIUYFL1uIk7CDxFBiVTjH6ixcBCGnNKJHzwO+YQVqvG6fo6
         ATVp3ngiQ2ws4LI5e4iRcQJRUsKKkyyiT+teIAiAk6Hy7zVt9CYeto9AftM+DaSEm7+/
         FfFJ23MS9FPNy1iD7ZycYdvcXs4WEt2NZWF44BomjOgEbkvtYlJ9bUd/5lGzjERpyGMa
         EeareAGmC7gtMcOX9nobYyZSSyip65cU5RIz7Zaqb27ALTEiGyKKFj9OjyJhmtIRwhgT
         M9cD6pPqebMfcV4WnLf3cjajvs6U9lHOumdSAE73ijHzTy+tm4vtI9UobCiHThs8NTU4
         fuMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:cc:to:subject
         :dkim-signature;
        bh=f1nruIkH4Jxy3iYFtzV56x29iyq7meu8IAa80mcmG9U=;
        b=epI7UdEU+TAi0do33O8ONCaqCNrxzWzwHvp/QirxNjnnnC0fc30GNB3k8BuFMHfHFu
         OboQqtu/Cm6XOpVOr4qMCtPWbdUlqX+knTYQLvI5/LLb5Ct6gGPIwmhOp+jkvjIGBQjy
         Xcjkb7WTY/v9hDmAxkxPFL6p7Mf0HFDrMdwAKTn9dYTvQDpUrE4tQjgLrTdkJ8szmPzT
         gFPFqzqsEUNl208NFfb3+n4X6Lg0R6EQCOmS9Cb8F6qhvib1EknBIriAlMtnnXWL6Zn4
         Wla6+OXPMVohz7C5aEP83sajvlsjZ1p50yys2xRZAENZHIqk4rduJH1lwc2kkfcWodLL
         IabA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LC+g56a8;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id 33si3686465edq.578.2020.07.27.07.26.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jul 2020 07:26:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) client-ip=207.211.31.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LC+g56a8;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1595859967;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=f1nruIkH4Jxy3iYFtzV56x29iyq7meu8IAa80mcmG9U=;
	b=LC+g56a8S3HYG52cJdHFtOsPtn16VAcrqEOeaJkVcmTfrlIAg7osOVEE9s08nwD2sPsyYN
	7oGYzCGxUlQcV5ATQYjsMl0YeQJpX5+EzWAvWZq4H5B8Tr8thQB+j/+fQDTT/74Qp4dQJ3
	jU6k2iqOQE5utN0rOzxP8RqTNswju/Q=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-OxAF_q3eOZ2HvBXvr-LoDw-1; Mon, 27 Jul 2020 10:26:05 -0400
X-MC-Unique: OxAF_q3eOZ2HvBXvr-LoDw-1
Received: by mail-ed1-f70.google.com with SMTP id r24so5661241eds.15
        for <alex.bennee@linaro.org>; Mon, 27 Jul 2020 07:26:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=f1nruIkH4Jxy3iYFtzV56x29iyq7meu8IAa80mcmG9U=;
        b=Rz6onKtakaujsL9Sg8t+/VH0SiePcWc5nfLRHDLkXqy1yIG93i8KALjlmeVvr3sThM
         PiQsgG6W067PaQJmyqX8pZkQpQ2+h5NQ+9Vspbr1KjZsK0CWEg4g8w9EObgl+qQT1vUt
         WTFa2K4i6RUVuy+IbV7a6PO/C0THG3IX8re1UXkJ54PbMReS5UDV5eFbB0zNpRZHR3du
         ElOJiyCpRlBIhgfxYviyKq4xiS31lrRohHZhpN9IPuQVl4f5u55OovFL0aWveWfc1QLn
         SJIQ9lLd9OlE0jeep3BDjmmOPr/ljzKIHV8CMDOGo+kMhHMSL7a00xwTiuHppEINlbUu
         BgpA==
X-Gm-Message-State: AOAM530+k067Xm5QrUVTHlu0GUNqR56QBtl9hAv2vC3QCIBwX22bVbhZ
	T8kXaFZFy1ffRORXYvbZtxFmhb9a2ORMj0dLxAym72/zpfgGPIidK2vnKuRF8vHzbdTf3O3joOO
	W/BKxBcmVt0vAGpmH
X-Received: by 2002:aa7:c2c5:: with SMTP id m5mr21848549edp.214.1595859963389;
        Mon, 27 Jul 2020 07:26:03 -0700 (PDT)
X-Received: by 2002:aa7:c2c5:: with SMTP id m5mr21848526edp.214.1595859963130;
        Mon, 27 Jul 2020 07:26:03 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.33] (214.red-88-21-68.staticip.rima-tde.net. [88.21.68.214])
        by smtp.gmail.com with ESMTPSA id a1sm7176764ejk.125.2020.07.27.07.26.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2020 07:26:02 -0700 (PDT)
Subject: Re: [PATCH v3 3/8] ppc/spapr: Use start-powered-off CPUState property
To: Thiago Jung Bauermann <bauerman@linux.ibm.com>, qemu-ppc@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Greg Kurz <groug@kaod.org>
References: <20200723025657.644724-1-bauerman@linux.ibm.com>
 <20200723025657.644724-4-bauerman@linux.ibm.com>
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
Message-ID: <1d97ef8a-13fc-201d-1fbd-263397a6021c@redhat.com>
Date: Mon, 27 Jul 2020 16:25:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200723025657.644724-4-bauerman@linux.ibm.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: 7lhBTDMBr/2p

On 7/23/20 4:56 AM, Thiago Jung Bauermann wrote:
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
>  hw/ppc/spapr_cpu_core.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> NB: Tested on ppc64le pseries KVM guest with two threads per core. 
> Hot-plugging additional cores doesn't cause the bug described above
> anymore.
> 
> diff --git a/hw/ppc/spapr_cpu_core.c b/hw/ppc/spapr_cpu_core.c
> index c4f47dcc04..2125fdac34 100644
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
> @@ -274,6 +269,11 @@ static PowerPCCPU *spapr_create_vcpu(SpaprCpuCore *sc, int i, Error **errp)
>  
>      cs = CPU(obj);
>      cpu = POWERPC_CPU(obj);
> +    /*
> +     * All CPUs start halted. CPU0 is unhalted from the machine level reset code
> +     * and the rest are explicitly started up by the guest using an RTAS call.
> +     */
> +    cs->start_powered_off = true;
>      cs->cpu_index = cc->core_id + i;
>      spapr_set_vcpu_id(cpu, cs->cpu_index, &local_err);
>      if (local_err) {
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
