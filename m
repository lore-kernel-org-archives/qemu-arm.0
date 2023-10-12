Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp449554ejc;
        Wed, 11 Oct 2023 17:07:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFDkfGQjrgBLph/VjL3Hhwq9V4o3NpoHp1Bqec5Z7SXJ12Q8ieQFJXzSnNwiEFvyEQ4oQze
X-Received: by 2002:a54:4599:0:b0:3a8:f3e7:d696 with SMTP id z25-20020a544599000000b003a8f3e7d696mr23844965oib.45.1697069249232;
        Wed, 11 Oct 2023 17:07:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697069249; cv=none;
        d=google.com; s=arc-20160816;
        b=un21pvA6u0DyzP08u2Yll4cZWTuY0UV6fzk4GnkBbjzIY88PtxUpRu866JqaCwYXxZ
         GF0AQjIiVgUsASULn2PdRgI0yuZmS9FtW8qPD8lwzaQH+pP9ZPpiDnRNmIFE5xVoPXx2
         buf5pFmND5PSGQOTL1bAd2hJdHSrENG5F2KCFR9LIeStU/3vE/WtdoQwWIoKpTM4pW1u
         0uO2bIz9aev9GUPN7APSQjdKUwJymfOXu4r21zYf6WnZ1tbe5Hm1VcxPplRqNcrL66rd
         ymBH/XxFM70yeG44KrO8daUOjIQ5ZD+eb7jbXqEBsvgdTsQkn4iibumb8ctUeA/4JDFm
         uooA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=hUf8E+eMs0QyN33MJTQzm2FGUE5kLHOwk8wWC8IMkGM=;
        fh=UoUFvcIH1Llqwj9lcubayb9wLqiblQuJi8py3jS56vc=;
        b=Njrfba3iF6CiIs93cUlZxBZRskUzh25O8Z/hLN3diHnVQFcwTsD6pTs6zCBrlN49HE
         KcCjme1aCDCEl0DSk2eSwsjH29rrBPu56j8PGR4ERnFPhfYDQaD2D8R1UlX2GmsZIKcq
         TSG0oUyjMTQ45qbDBBP0QDWMyuycbo2aPSEaEX6Gm/lFjaL7kBTRmg481gHsySgbH0Fl
         ivY5a8w0QVCgI5BQ2haeUvY6x+MdqgMypeb+Raic9HsF9XS6FHv9JiNnBZWCN1WZ+e8D
         84llzXm+tNup2tac3WbBCRauQxxHRytdYBQX1gztvDbK23Sc4u1siMUR82yIBxIX5oSQ
         uHKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=duKOIpp3;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <gshan@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id z7-20020a05622a060700b004032cc7e439si9799636qta.471.2023.10.11.17.07.29
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 17:07:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=duKOIpp3;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697069248;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hUf8E+eMs0QyN33MJTQzm2FGUE5kLHOwk8wWC8IMkGM=;
	b=duKOIpp3ZROQPOofdHY9ZCj0zuzo7N5PKh3u8On6fS4bfZUwZT81iSM4kd2WLkV8fCoBW0
	tXMTrzzu9joC2pL4zpd7ooEk4Jo9Cl0k/sRUqtr122ehdQbss9KXVDlagpT69qdqKc5Ps5
	JbidASwMhnRrXAoXvU/oT3xlNRm0VSs=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-554-ddXC3tz7NLirBChRg098yg-1; Wed, 11 Oct 2023 20:07:27 -0400
X-MC-Unique: ddXC3tz7NLirBChRg098yg-1
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-1c9cd87af72so3473185ad.1
        for <alex.bennee@linaro.org>; Wed, 11 Oct 2023 17:07:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697069246; x=1697674046;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hUf8E+eMs0QyN33MJTQzm2FGUE5kLHOwk8wWC8IMkGM=;
        b=oBDHmYwpsr8tzk6Ked7+AQGWRseHn1jAcXbMz+T8Xc5K3l8wO4c74HeP1dKO4MuGYZ
         +X4H2eeynPwyfMm0GZ9x9rPJkcsJ2A7A9F4WBAyhVNTakuXqo7KhNZwblmgQRJihk1tM
         zl9ypCwmvLB5Hl5epvjTOgeQDeU/cprKaBQxL4h5jHWhURkJQWrY3ipP3xGlpuZG/zyj
         K6BGEK0tR+TAXUA1pLMKctLmCCGD2M1M8AD3f08DD47XE+XyYhoFHDcW7ZVdgV0fQHuy
         jTHZ6VW3SnBNMB5v5+7qjS+cm5qeUMOuBw1NC92nu/FBJUQnqEjmsA3GjfmXKPDhFsPe
         VC/w==
X-Gm-Message-State: AOJu0YycBJn4LQTF6l2jI79icu0Xe+6vXBzvAwvTbObPZlkLItr3taeL
	XC0hf9zQ+G/hSf2wUxLubn45vJzu0+EgBfZ5pMtljSyTSRD1NvnY/Ybfb70FeEIKiis03hE0ext
	KxZJ6YALTQjd9sw+T
X-Received: by 2002:a17:902:d508:b0:1c8:77f2:7d03 with SMTP id b8-20020a170902d50800b001c877f27d03mr26336776plg.45.1697069246365;
        Wed, 11 Oct 2023 17:07:26 -0700 (PDT)
X-Received: by 2002:a17:902:d508:b0:1c8:77f2:7d03 with SMTP id b8-20020a170902d50800b001c877f27d03mr26336765plg.45.1697069246113;
        Wed, 11 Oct 2023 17:07:26 -0700 (PDT)
Return-Path: <gshan@redhat.com>
Received: from ?IPV6:2001:8003:e5b0:9f00:b890:3e54:96bb:2a15? ([2001:8003:e5b0:9f00:b890:3e54:96bb:2a15])
        by smtp.gmail.com with ESMTPSA id iy3-20020a170903130300b001bf11cf2e21sm450493plb.210.2023.10.11.17.07.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Oct 2023 17:07:25 -0700 (PDT)
Message-ID: <ca79ed5f-b807-10eb-8f79-c2def1ab028f@redhat.com>
Date: Thu, 12 Oct 2023 10:07:12 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH V5 9/9] gdbstub: Add helper function to unregister GDB
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
References: <20231011194355.15628-1-salil.mehta@huawei.com>
 <20231011194355.15628-10-salil.mehta@huawei.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20231011194355.15628-10-salil.mehta@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: xe68gbkq+9r/

Hi Salil,

On 10/12/23 05:43, Salil Mehta wrote:
> Add common function to help unregister the GDB Register Space. This shall be
> done in context to the CPU unrealization.
> 
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
> ---
>   gdbstub/gdbstub.c      | 15 +++++++++++++++
>   include/exec/gdbstub.h |  5 +++++
>   2 files changed, 20 insertions(+)
> 

With the following nits addressed:

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
> index 349d348c7b..97b89e2d00 100644
> --- a/gdbstub/gdbstub.c
> +++ b/gdbstub/gdbstub.c
> @@ -491,6 +491,21 @@ void gdb_register_coprocessor(CPUState *cpu,
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
> +        g_free(s);
> +    }
> +    cpu->gdb_regs = NULL;

        cpu->base_reg = 0;
        cpu->num_regs = 0;

> +    cpu->gdb_num_g_regs = 0;
> +}
> +
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
