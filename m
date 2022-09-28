Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp255787ocs;
        Wed, 28 Sep 2022 05:39:01 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7gFY628sAKysW0pqj/NjgBE5qk7XEralXkPFzdtjJgFaaTDTrNzaOpnoftCZv4vxOJ1WxE
X-Received: by 2002:ac8:5a83:0:b0:35c:d945:6442 with SMTP id c3-20020ac85a83000000b0035cd9456442mr26029252qtc.57.1664368741051;
        Wed, 28 Sep 2022 05:39:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664368741; cv=none;
        d=google.com; s=arc-20160816;
        b=dvujmtZDR6h554Rx+Km1TqVFRel1nXwUpsNWOrix5tteWVkEqeItOCxJUgqVGV265S
         ZiS6wh+uAbdc+JE0Efx6UnFhS0c53mNoAGfdarW88RdipT2qsHTrmUKuUgo1oSUzFFKz
         Bia4Xod5qsJMyCT6SapNS/gls5wfsEDefIXhGf2PZeveDZkqRnd5EyJJdqSk60Tchoco
         e+KmWxjRtAy22q164zKlQlQTqwuZj22CfC3FQbV/pA5F7k1sAZDMvlrsWJCgo3Pgyqyx
         EjUvM6KPxcClKXNEJoMxwgbd3docWbeeQOf6atUQSEm3At2qDBs/tnf6s8DQyFpSKead
         0CGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ssHiT8auoEjKjLHr/WW4tRUwm7tu+pz8C/+F+yd1mBs=;
        b=tvdIdImdynAINLlES8WAFAYP4NxPsm4tIYVQWdPGsaG3P7AWK5aHJS67ZFzyk0WnON
         lExz+WTkJyzGvvoV6aeU9Ur4MRzyEZPN6n+4MUeFKdE9bsq2FkNuUSDX93KXT/cNaait
         1H+SbiAa7vK+FzC1ruChzcaQGcRZqPL/r5cFmWVDQhUOrB+wy6CY6KCRH4UnTLKe0S/B
         ngChjgblI9p3b93TpB8usq81bEBgCEyGXxsv04PtQGoXoMLsm5+6paZZ1xCZCDsPF/Ue
         NJSL9FSRrqoPvhgKH3QPFq2ITAOIIjDFsn3RjBucjAgUQuVhbf+qdp6FQVTuCCkflhlg
         /sEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=J2XD1sLz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bj24-20020a05620a191800b006ce4073019csi2501387qkb.527.2022.09.28.05.39.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Sep 2022 05:39:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=J2XD1sLz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1odWL6-0001oQ-IT
	for alex.bennee@linaro.org; Wed, 28 Sep 2022 08:39:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1odVtu-0003cX-7g
 for qemu-arm@nongnu.org; Wed, 28 Sep 2022 08:10:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1odVtr-0003FE-1A
 for qemu-arm@nongnu.org; Wed, 28 Sep 2022 08:10:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664367050;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ssHiT8auoEjKjLHr/WW4tRUwm7tu+pz8C/+F+yd1mBs=;
 b=J2XD1sLzDu11bmzFk8TRSyPo0HNxhk5YpwRVqvJ/4TutQmuQLlThG6D5ietf4a5WdgRGOc
 L/83I/OBbktbRnvzeFlYo9n13XderHcENFUTLvy5P4i51ggdWUhq6iAvLTaEhVdrMK+Bqr
 UcBXf+YYvIHrVP64iZCj2w9pzfKM5wU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-248-3IdZ-_DUOdK0AqI8kLJTDQ-1; Wed, 28 Sep 2022 08:10:49 -0400
X-MC-Unique: 3IdZ-_DUOdK0AqI8kLJTDQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 n7-20020a1c2707000000b003a638356355so7028909wmn.2
 for <qemu-arm@nongnu.org>; Wed, 28 Sep 2022 05:10:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date;
 bh=ssHiT8auoEjKjLHr/WW4tRUwm7tu+pz8C/+F+yd1mBs=;
 b=6oW4nhQilOKaBoC+HWnp0zbu2hHZxas7Yvd+JPoPW1d0zga77+fitgFnFu28j/uQ93
 4NURyMwZGeYe6um5/1WIQNkPhCbzxQLzJv4ASjUOeKNARnmqxc1ZpaMVQHOxhBag/it4
 BsF+A+NdCipz8WCtoXS5uQTlMEd9Us8ZNQzN02IM+jel1ssNrtzf5CHdTQek9ph87TH1
 cg1b1dis3VZOgBnTKvURJitsG0rrRmNwNAqYPSpZIKrHzgC5YPDtjQIBdqtbMVvFnB4j
 FmFDqaOj5qDp4ChA70+Hz3Z0nlB767CUK+TZjA+XtG/ZqAm3+Lbvdn52dCcVlMYjqkcR
 xN7w==
X-Gm-Message-State: ACrzQf33sKyCnzxC0Nl/xrV4Kq55wuICvsA1hJtFDwMVJBARnEEmkgmr
 ft/L+CWNijz8zoDvETXaTavu/79igwcu4QRf/P+DMazZahaovomcvvGjGKe8HJWaP7L6XiuIQ1X
 xMxzELrW5p4W3
X-Received: by 2002:a5d:5407:0:b0:228:a79b:4432 with SMTP id
 g7-20020a5d5407000000b00228a79b4432mr20355715wrv.96.1664367048258; 
 Wed, 28 Sep 2022 05:10:48 -0700 (PDT)
X-Received: by 2002:a5d:5407:0:b0:228:a79b:4432 with SMTP id
 g7-20020a5d5407000000b00228a79b4432mr20355687wrv.96.1664367047934; 
 Wed, 28 Sep 2022 05:10:47 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 m67-20020a1c2646000000b003a342933727sm1595104wmm.3.2022.09.28.05.10.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 05:10:47 -0700 (PDT)
Message-ID: <6e1b2667-b561-51ac-57af-123a393fc677@redhat.com>
Date: Wed, 28 Sep 2022 14:10:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 3/5] hw/arm/virt: Introduce variable region_base in
 virt_set_high_memmap()
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, cohuck@redhat.com,
 zhenyzha@redhat.com, richard.henderson@linaro.org, peter.maydell@linaro.org,
 shan.gavin@gmail.com
References: <20220921231349.274049-1-gshan@redhat.com>
 <20220921231349.274049-4-gshan@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20220921231349.274049-4-gshan@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.319, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mMcHBuwUnrkz

Hi Gavin,

On 9/22/22 01:13, Gavin Shan wrote:
> This introduces variable 'region_base' for the base address of the
> specific high memory region. It's the preparatory work to optimize
> high memory region address assignment.
Why is it a preparatory work (same comment for previous patch, ie [2/5]
). Are those changes really needed? why?

Eric
>
> No functional change intended.
>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>  hw/arm/virt.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 187b3ee0e2..b0b679d1f4 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1692,15 +1692,15 @@ static uint64_t virt_cpu_mp_affinity(VirtMachineState *vms, int idx)
>  static void virt_set_high_memmap(VirtMachineState *vms,
>                                   hwaddr base, int pa_bits)
>  {
> -    hwaddr region_size;
> +    hwaddr region_base, region_size;
>      bool fits;
>      int i;
>  
>      for (i = VIRT_LOWMEMMAP_LAST; i < ARRAY_SIZE(extended_memmap); i++) {
> +        region_base = ROUND_UP(base, extended_memmap[i].size);
>          region_size = extended_memmap[i].size;
>  
> -        base = ROUND_UP(base, region_size);
> -        vms->memmap[i].base = base;
> +        vms->memmap[i].base = region_base;
>          vms->memmap[i].size = region_size;
>  
>          /*
> @@ -1709,9 +1709,9 @@ static void virt_set_high_memmap(VirtMachineState *vms,
>           *
>           * For each device that doesn't fit, disable it.
>           */
> -        fits = (base + region_size) <= BIT_ULL(pa_bits);
> +        fits = (region_base + region_size) <= BIT_ULL(pa_bits);
>          if (fits) {
> -            vms->highest_gpa = base + region_size - 1;
> +            vms->highest_gpa = region_base + region_size - 1;
>          }
>  
>          switch (i) {
> @@ -1726,7 +1726,7 @@ static void virt_set_high_memmap(VirtMachineState *vms,
>              break;
>          }
>  
> -        base += region_size;
> +        base = region_base + region_size;
>      }
>  }
>  

