Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3882998lfm;
        Sun, 5 Jul 2020 00:12:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw5jEoqvoAs1ZxZ/kymmMw8jBJLL0fIX93+AQe4JoeZ+zqbZ+PEKq1GI16tFCuIKnMpXAM7
X-Received: by 2002:a17:906:3c56:: with SMTP id i22mr27578283ejg.12.1593933175075;
        Sun, 05 Jul 2020 00:12:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593933175; cv=none;
        d=google.com; s=arc-20160816;
        b=q03uj+WHcob6LcGxiw9QDWeO1h8MYia0BkXHnbLmKJSNGk+EkvNsIMjNEOwJJQ+823
         Vi+zKgqlsT+75EMEQqmNUjIWi5wH4fLkEiqwqTymwNdbv97P0PiBOmdpILnU2vez2ALp
         dxkhfo232j+Q5YcY0JQSUyAdc66qT0KUVVTYi+pisdwbknX+GXYkUau841qRvB3PZTHg
         w5NKtzX+Is4rV7efjQUuIUX3gj+SPR9FSSte3rB1LRkN61NJEFvjJmo6oG3gzTDdMhCE
         VI9bP/X9qjxmGIbDmmWyIhSVLIMK+KKxD1eZx5KTzQwhAVfEZanGSXgiAsH7Rcb2Aa9U
         l9/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:dkim-signature;
        bh=LvIwUW+HT9nLceqRk75QgxghUvMJ3y0FU0XGr+ELl2E=;
        b=k5i4pLehsrUzHF2cOphKK4bvSRszXE5uXUiA1D5nvpOo85gR7pECelFysLUT0T9rrj
         KXDA1acm50XHNKGrpHhmuV1Uk0fxffMEHLAzec9VLZ8yWOsl6v95EOZmCMa564IMZLI8
         5eczJtBnmWYVoRvhMpSPbteT02pqVJ2QOfHPK4BIURAxFhm2N8iXr5hw65J+qOU7PvQG
         f1PxWM34TjzTw1qetU0WV8qZaEo450H4EGahpaNixY6j2N6HMpKrx2b989b5j9E8P/9s
         K7YSV6mlC5wLzBadjwnn4Pu5VvL8o+YLthfb5EG6Fuy8Rh7pKLGWVUKbYKwsyxGKOwdD
         lBoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=i7tXcZXy;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [23.128.96.18])
        by mx.google.com with ESMTP id v12si11024772eja.379.2020.07.05.00.12.54;
        Sun, 05 Jul 2020 00:12:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) client-ip=23.128.96.18;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=i7tXcZXy;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726369AbgGEHMv (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Sun, 5 Jul 2020 03:12:51 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:38236 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725901AbgGEHMu (ORCPT
        <rfc822;kvm@vger.kernel.org>); Sun, 5 Jul 2020 03:12:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1593933168;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LvIwUW+HT9nLceqRk75QgxghUvMJ3y0FU0XGr+ELl2E=;
        b=i7tXcZXyxdmN6dYm5WCWo9rSRjTtxc2FJjZazpv0ho2NUw5tG/2Gl9MYrRsclfPSWPJUIs
        CDXeG+zL9HB/i0heJ13YoDHkjRseolTReWD1QJKOe3Hkm8HUhztn7m6V6fH0/ivqwZzOa2
        btdctVtjb5md+xihQY/k7/3wcpKkmZg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-147-Rub8kqyPNBivwLXQ4bnpvA-1; Sun, 05 Jul 2020 03:12:47 -0400
X-MC-Unique: Rub8kqyPNBivwLXQ4bnpvA-1
Received: by mail-wm1-f69.google.com with SMTP id c124so9026430wme.0
        for <kvm@vger.kernel.org>; Sun, 05 Jul 2020 00:12:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LvIwUW+HT9nLceqRk75QgxghUvMJ3y0FU0XGr+ELl2E=;
        b=hGD3cVUv9xp6+MPRtapmT7iyiyVQhlq/wK7/D6AdevBiqCi4bD4WgBpLWVolO0Ai7j
         2ohCyPx+g4aEHLsmCe5etOUauSiO04UKKqp6D3QheVSQgcfmsLF0z3jZyjyP/VNqJvxP
         SdRcVylvP4mwRmQeu10atyJAxi6cvY8viY4VXuvz6r6oYlKokfUtqXScsGuRFxj5M5lF
         TH6tq26aM/59/bM3WRxWkd0JhPvBANcRKcFhZTEiJoiWcUfadpiuMduEfRz2RoCWYjmT
         zly1w0SZBGItn9+Kjhfb3+luNNCwLOKXCHgTTlbQM+Wa81Frtk2+jxa0c32PlNbEDQwU
         w+gw==
X-Gm-Message-State: AOAM532ltFnL1S242CK35ktrPL90rO8b6Ib/dhbt4GHI29yLudr/QnzK
        4eohZ9ia8KW/ZFxjon6WbSLU6Ox5nf1jX/aEFqJcwuAX5IO1xnfZwZ+I+2aAM6XEko9bFVbMQ6R
        A3msSNeAz72G0
X-Received: by 2002:a7b:c3d0:: with SMTP id t16mr47478460wmj.117.1593933166436;
        Sun, 05 Jul 2020 00:12:46 -0700 (PDT)
X-Received: by 2002:a7b:c3d0:: with SMTP id t16mr47478437wmj.117.1593933166172;
        Sun, 05 Jul 2020 00:12:46 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:adf2:29a0:7689:d40c? ([2001:b07:6468:f312:adf2:29a0:7689:d40c])
        by smtp.gmail.com with ESMTPSA id 59sm19816795wrj.37.2020.07.05.00.12.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jul 2020 00:12:45 -0700 (PDT)
Subject: Re: [RFC PATCH 4/7] accel/kvm: Simplify kvm_set_sigmask_len()
To:     =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
        qemu-devel@nongnu.org
Cc:     Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        David Hildenbrand <david@redhat.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
        Richard Henderson <rth@twiddle.net>, qemu-s390x@nongnu.org,
        David Gibson <david@gibson.dropbear.id.au>,
        Peter Maydell <peter.maydell@linaro.org>,
        Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Halil Pasic <pasic@linux.ibm.com>, qemu-arm@nongnu.org,
        Cornelia Huck <cohuck@redhat.com>, qemu-ppc@nongnu.org,
        Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Thomas Huth <thuth@redhat.com>
References: <20200623105052.1700-1-philmd@redhat.com>
 <20200623105052.1700-5-philmd@redhat.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <cc7b7da2-fcf8-5c5c-5c3c-9e96368ddd22@redhat.com>
Date:   Sun, 5 Jul 2020 09:12:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200623105052.1700-5-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: a4q6JBZHyjg1

On 23/06/20 12:50, Philippe Mathieu-Daudé wrote:
> The sigmask_len is a property of the accelerator, not the VM.
> Simplify by directly using the global kvm_state, remove the
> unnecessary KVMState* argument.

This is not entirely true, if there were multiple KVMStates how would
you know which one to read from?  So it would have to be a global variable.

Paolo

> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  include/sysemu/kvm.h | 2 +-
>  accel/kvm/kvm-all.c  | 4 ++--
>  target/mips/kvm.c    | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
> index 3662641c99..44c1767a7f 100644
> --- a/include/sysemu/kvm.h
> +++ b/include/sysemu/kvm.h
> @@ -469,7 +469,7 @@ uint32_t kvm_arch_get_supported_cpuid(KVMState *env, uint32_t function,
>  uint64_t kvm_arch_get_supported_msr_feature(KVMState *s, uint32_t index);
>  
>  
> -void kvm_set_sigmask_len(KVMState *s, unsigned int sigmask_len);
> +void kvm_set_sigmask_len(unsigned int sigmask_len);
>  
>  #if !defined(CONFIG_USER_ONLY)
>  int kvm_physical_memory_addr_from_host(KVMState *s, void *ram_addr,
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index afd14492a0..7b3f76f23d 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -2240,9 +2240,9 @@ err:
>      return ret;
>  }
>  
> -void kvm_set_sigmask_len(KVMState *s, unsigned int sigmask_len)
> +void kvm_set_sigmask_len(unsigned int sigmask_len)
>  {
> -    s->sigmask_len = sigmask_len;
> +    kvm_state->sigmask_len = sigmask_len;
>  }
>  
>  static void kvm_handle_io(uint16_t port, MemTxAttrs attrs, void *data, int direction,
> diff --git a/target/mips/kvm.c b/target/mips/kvm.c
> index 0adfa70210..cc3e09bdef 100644
> --- a/target/mips/kvm.c
> +++ b/target/mips/kvm.c
> @@ -48,7 +48,7 @@ unsigned long kvm_arch_vcpu_id(CPUState *cs)
>  int kvm_arch_init(MachineState *ms, KVMState *s)
>  {
>      /* MIPS has 128 signals */
> -    kvm_set_sigmask_len(s, 16);
> +    kvm_set_sigmask_len(16);
>  
>      kvm_mips_fpu_cap = kvm_check_extension(KVM_CAP_MIPS_FPU);
>      kvm_mips_msa_cap = kvm_check_extension(KVM_CAP_MIPS_MSA);
> 
