Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp1708970ejb;
        Mon, 2 Oct 2023 20:17:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZ8emHNFSkNOVetDPdsLz0fX/vWK7mjQ13I3qEz8HV00dHuAZhEK1KhUVqcL9jC37b7R2k
X-Received: by 2002:a2e:9a89:0:b0:2bf:f32a:1f68 with SMTP id p9-20020a2e9a89000000b002bff32a1f68mr10772265lji.19.1696303026351;
        Mon, 02 Oct 2023 20:17:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696303026; cv=none;
        d=google.com; s=arc-20160816;
        b=yrNAOqCFJiKwmvrHGQTaSX8jRnIcRKOtmzZfEuw8uiXTniJ1hL4VzkPM1WI+SuPJtf
         vQ6XQIQU7pI/db5eskYSCU47GA02JgMecjhbSID/cZqN0+mi3PbQKMkd6UHMUNe/bMXH
         ySnq6/wQKltcHC6YLfnAjl+tc/eEa3PupRRMTKlbbLF/DX3QLXD7k+Y0kLQP1YMFpegw
         j/8yWmQYFRiwi6J6KuYJ/r37Eu9ZocFBIiz+qCHnAZWE2199pR3rf0d2urz6X7v4gH7b
         f8EnXkqJePXHz+wDSfX1bSCNVHh2trhPwD4Ua4wchpe39BRxj5tHJZ8JwdVZYoMDjGZS
         UtmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=co6wypmiQw2a5aSWkvn2QUY7MVsGOjPIrOjbZiaS4so=;
        fh=UoUFvcIH1Llqwj9lcubayb9wLqiblQuJi8py3jS56vc=;
        b=yjoTymSgjPt94aNhlyKQluappUNB7tYdctx2OnKwC71GY3PWOPqE/+WinS4YHbBt4+
         J/XPZmYNdJOzt5TT88EwEX131KoJVvEU2PlmwuACtLOF3W8278MZoX7WqmAs5rgV5fd0
         RoCVcudEi9YY7AkFK/onubrDotGUolw8zUFvcyd+5yN7bkYWnmP/CUZLJN/DmtOTM5rf
         Vk7frlyK+PHuic6x/qnqC0X5gXhcPxcUIaaSwM1ofwnrvPc7I7QBXpgkP68XubS48wya
         NTeiOonfWRXflInS+kyySW7SOsKJqRYxr0+u9oQxxMEgA2RIlcDd6yTmh/d1fY4ASZh5
         KPYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VbBrHi48;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <gshan@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id n15-20020a2eb24f000000b002c00b5d0821si195671ljm.339.2023.10.02.20.17.05
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 20:17:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VbBrHi48;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696303025;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=co6wypmiQw2a5aSWkvn2QUY7MVsGOjPIrOjbZiaS4so=;
	b=VbBrHi48MEn/D2CHwG94PdrBN/ePrFOX+1QaZ46gSv+G2+r3Lfqw6GMHPj5S2pCthCfzXt
	PU1FhKut4375iQsFn9UoNqzMp8wqKuzyw2uljNK9yLjR4M6lyp7hfoiJxM5iwx6RvnQmzA
	T2iV6RDin1PrR9lJU6OOxEgPfXuzirg=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-290-UdkTh4sWNgaghLd2rcXP3g-1; Mon, 02 Oct 2023 23:17:03 -0400
X-MC-Unique: UdkTh4sWNgaghLd2rcXP3g-1
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-5703b4e92b7so241341a12.2
        for <alex.bennee@linaro.org>; Mon, 02 Oct 2023 20:17:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696303023; x=1696907823;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=co6wypmiQw2a5aSWkvn2QUY7MVsGOjPIrOjbZiaS4so=;
        b=mpbJm28RMHrjDJpjYJpaf159N8lQvUnWHnB/UFsKuoiuQ/nBLYLK8ZTTA7QAIw5vv7
         zKyKuRGAgGCCgEoJno8wDKRgcgFIMy0hk/Blw5ZvEsshyPRmBueCVqDpC8Adq3K9qCsh
         nJFv9gSKj3k1ixO/t+6fN9w/koR1X1zqP0r6qilARCYtP8tbb9DhTCP9GoK6TjcWylIJ
         OV1b8zrnNeDakXeRt+73ku8NVpaYLzrO+rCNVqYeII2PjDth1GC+dxJtVfIPG9HO9Dj7
         7sqK31PlnbdZrDThQoN+ys6yiEbwnG0xi2LKoGK5oyMg4sbr5toexPaA3Je2Df3Mnxuv
         OQeg==
X-Gm-Message-State: AOJu0Yw9DYrDQcxbVzC6/S+AvWZVgeqGeqj4Ci1dkD71seUdn/qJ756Z
	8o6Urwj4rDNPc+X7LwENoY1aimF51WAnTr5XQX6Yvkvb2vVmAJ+VC/KUTGwFdzYKstewvjyBt9R
	3rxdCIcrFh+u47O5N
X-Received: by 2002:a05:6a20:8f02:b0:140:730b:4b3f with SMTP id b2-20020a056a208f0200b00140730b4b3fmr15614130pzk.1.1696303022716;
        Mon, 02 Oct 2023 20:17:02 -0700 (PDT)
X-Received: by 2002:a05:6a20:8f02:b0:140:730b:4b3f with SMTP id b2-20020a056a208f0200b00140730b4b3fmr15614106pzk.1.1696303022448;
        Mon, 02 Oct 2023 20:17:02 -0700 (PDT)
Return-Path: <gshan@redhat.com>
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5? ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
        by smtp.gmail.com with ESMTPSA id h14-20020a170902f7ce00b001b9f7bc3e77sm218209plw.189.2023.10.02.20.16.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Oct 2023 20:17:02 -0700 (PDT)
Message-ID: <1b018c9e-fde4-e486-b853-1d516db2d2b2@redhat.com>
Date: Tue, 3 Oct 2023 13:16:49 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH V2 09/10] gdbstub: Add helper function to unregister GDB
 register space
To: Salil Mehta <salil.mehta@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: maz@kernel.org, jean-philippe@linaro.org, jonathan.cameron@huawei.com,
 lpieralisi@kernel.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, imammedo@redhat.com, andrew.jones@linux.dev,
 david@redhat.com, philmd@linaro.org, eric.auger@redhat.com,
 oliver.upton@linux.dev, pbonzini@redhat.com, mst@redhat.com,
 will@kernel.org, rafael@kernel.org, alex.bennee@linaro.org,
 linux@armlinux.org.uk, darren@os.amperecomputing.com,
 ilkka@os.amperecomputing.com, vishnu@os.amperecomputing.com,
 karl.heubaum@oracle.com, miguel.luis@oracle.com, salil.mehta@opnsrc.net,
 zhukeqian1@huawei.com, wangxiongfeng2@huawei.com, wangyanan55@huawei.com,
 jiakernel2@gmail.com, maobibo@loongson.cn, lixianglai@loongson.cn,
 linuxarm@huawei.com
References: <20230930001933.2660-1-salil.mehta@huawei.com>
 <20230930001933.2660-10-salil.mehta@huawei.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20230930001933.2660-10-salil.mehta@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: pIeJLFT8MLFK


On 9/30/23 10:19, Salil Mehta wrote:
> Add common function to help unregister the GDB Register Space. This shall be
> done in context to the CPU unrealization.
> 
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> ---
>   gdbstub/gdbstub.c      | 14 ++++++++++++++
>   include/exec/gdbstub.h |  5 +++++
>   2 files changed, 19 insertions(+)
> 

With the following nits addressed:

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
> index 349d348c7b..89ac0edfea 100644
> --- a/gdbstub/gdbstub.c
> +++ b/gdbstub/gdbstub.c
> @@ -491,6 +491,20 @@ void gdb_register_coprocessor(CPUState *cpu,
>       }
>   }
>   
> +void gdb_unregister_coprocessor_all(CPUState *cpu)
> +{
> +    GDBRegisterState *s, *p;
> +
> +    p = cpu->gdb_regs;
> +    while (p) {
> +        s = p;
> +        p = p->next;
> +        /* s->xml is static const char so isn't freed */
                                      ^^^
                                      string so that it needn't be freed
> +        g_free(s);
> +    }
> +    cpu->gdb_regs = NULL;
> +}
> +

For consistency, CPUState::gdb_num_regs and CPUState::gdb_num_g_regs
need to be updated accordingly, even the CPU instance will be destroyed
shortly.

>   static void gdb_process_breakpoint_remove_all(GDBProcess *p)
>   {
>       CPUState *cpu = gdb_get_first_cpu_in_process(p);
> diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
> index 16a139043f..7d1368d377 100644
> --- a/include/exec/gdbstub.h
> +++ b/include/exec/gdbstub.h
> @@ -27,6 +27,11 @@ typedef int (*gdb_set_reg_cb)(CPUArchState *env, uint8_t *buf, int reg);
>   void gdb_register_coprocessor(CPUState *cpu,
>                                 gdb_get_reg_cb get_reg, gdb_set_reg_cb set_reg,
>                                 int num_regs, const char *xml, int g_pos);
> +/**
> + * gdb_unregister_coprocessor_all() - unregisters supplemental set of registers
> + * @cpu - the CPU associated with registers
> + */
> +void gdb_unregister_coprocessor_all(CPUState *cpu);
>   
>   /**
>    * gdbserver_start: start the gdb server

Thanks,
Gavin
