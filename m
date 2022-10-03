Received: by 2002:a8a:84:0:0:0:0:0 with SMTP id s4csp371652ocq;
        Mon, 3 Oct 2022 01:27:19 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7Fz8bH6zBD2jk5TgTHoCzo+djkG8GFFAw/MVIrJB4ElganDJsMWBdhagCsSLTkAEGaJ1iH
X-Received: by 2002:ac8:5ac7:0:b0:35b:b658:4b6c with SMTP id d7-20020ac85ac7000000b0035bb6584b6cmr14859474qtd.207.1664785639249;
        Mon, 03 Oct 2022 01:27:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664785639; cv=none;
        d=google.com; s=arc-20160816;
        b=VU7AG0cpXNnuz1gUWseb2qW5P9ME8xmksK289m7Dx8FIhOvYppNy1T99+HD1BKX76r
         AUUyu/nsnyY8h0AHHnBsmZ20VxvzEtX5CEOtTsHou+FQqZaZJUWJ2pVshKsxXhp6xOcR
         37Xw4oaOwO4ym2kgwqdpcKDjw3tAuYGIXojPj+1XmxHUlpVY9WiKYJc+FIM0tBB50vgk
         BMRU/MRkLq8zjDRFUO+Pk+ryvRu7TjFl9cPiIFCrMLUTymxRuppKBLUKSE0FkyeT17Pb
         snr2PcRosd6DkGJqGZfklLneXwoTGxipKDT8QmXSBWNTvrO6MIY1/AYybNDTw9Kj9QqN
         8MAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=JzS24VJwGHSGhDR2ORh8VoWzNume/0Xvv2pouMr/xbA=;
        b=Z6EzT1S5Sc/5zhELb7Uu7D04YeboFV4N0xSAT1BHqegdY3qoe3EnppeH+t9QLd6NbE
         nf0Ocmw6yH6V+hCyJc2YwIItFPRfHigmZLUZAnzhbNnJLosKeeCptTmrnxj2cpQx8ugP
         JjmhLHw/CEf/RmGgVP0mDL8dMbx71R74a5FrRj/3LIpeLxqEhAveg7gP7MDgBVi5l8Pb
         LUTlMteR3g4OQ050PEmtXz7iktow+vgP8CJb6O8OjKflnJhPgYPRnGruiGRNBCrzp4ff
         jkQmZQy7DiyFHCJ1ejL0cHFJ5Tl/SBibX6dAFjGQAs+HTaiuWVRrF+Ur5xjuqhLnSvRk
         41SQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KuVax8wY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cc5-20020a05622a410500b0031ed0db09e5si3389103qtb.474.2022.10.03.01.27.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Oct 2022 01:27:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KuVax8wY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ofGnG-0005zk-S1
	for alex.bennee@linaro.org; Mon, 03 Oct 2022 04:27:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1ofGn0-0005ym-Rk
 for qemu-arm@nongnu.org; Mon, 03 Oct 2022 04:27:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1ofGmz-0000Ah-Br
 for qemu-arm@nongnu.org; Mon, 03 Oct 2022 04:27:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664785620;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JzS24VJwGHSGhDR2ORh8VoWzNume/0Xvv2pouMr/xbA=;
 b=KuVax8wYZKH05c7UYf7C1mRJlFfxqnVUW6Q7Zld0KzEzoIonDsyM1zuU/mswYZqcYV3wID
 vhBLISOp0m6exk82eRERvMPfjEd5j9Tnpw7VAopxTY0tmVSW6rDlBSr9+m1OaYmCl0n+i5
 pWxXgxs3vd/2L8P9El3ucC15FyiZGGE=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-112-_4S9GVvHPMq6u2SITnfpUQ-1; Mon, 03 Oct 2022 04:26:59 -0400
X-MC-Unique: _4S9GVvHPMq6u2SITnfpUQ-1
Received: by mail-qv1-f69.google.com with SMTP id
 i10-20020ad45c6a000000b004a25d0fea96so6505339qvh.3
 for <qemu-arm@nongnu.org>; Mon, 03 Oct 2022 01:26:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date;
 bh=JzS24VJwGHSGhDR2ORh8VoWzNume/0Xvv2pouMr/xbA=;
 b=5crVMji68If4er8mF5QEnZzLS0EnMYtq8Wbv3fh0MhaXAD0+8+JT5dGpdsT//YoHbp
 lpnFOn4fj17CYg5aTN5EXKPj4iZy4babg0i36MBtrFsOES6uadAEtCwybkH+JsH42AyB
 zSnD2LqHAM/ora5+yG570NuWKWlYVJdtk5YBM/zi938kCjDNWLd2g3pCHW0i7yC8tEHy
 HltftXXEI/by+Gk4V7pRngZgQX2aHGgmYmxTDky7kTuhGauJv33QJmWKO/kAK7Im+tBd
 GNg/ZzCopyenKhOGL9Vecif4qadRwtLeRbegq08njh4Ue7i9J/n2oiYVv97lBs0XCnTX
 kxmA==
X-Gm-Message-State: ACrzQf30qtAljPUP4b1epled8meETYtPwIyTYVp+aO/UNgh/58t/v1P2
 PjhjaeSsA5OshI78jv2GSNrOoG58FXIR9POdb/0AmAO/jfNg6Twk9xAsutp4xfr87wc2txOFz8X
 PHhqT/NIMiQTa
X-Received: by 2002:a05:622a:15c4:b0:35b:b493:f8fb with SMTP id
 d4-20020a05622a15c400b0035bb493f8fbmr15244381qty.300.1664785619151; 
 Mon, 03 Oct 2022 01:26:59 -0700 (PDT)
X-Received: by 2002:a05:622a:15c4:b0:35b:b493:f8fb with SMTP id
 d4-20020a05622a15c400b0035bb493f8fbmr15244367qty.300.1664785618954; 
 Mon, 03 Oct 2022 01:26:58 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 q22-20020a05620a0d9600b006bb82221013sm32228qkl.0.2022.10.03.01.26.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Oct 2022 01:26:58 -0700 (PDT)
Message-ID: <2299b4da-83d8-834c-2134-10abe36d7f7d@redhat.com>
Date: Mon, 3 Oct 2022 10:26:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 2/5] hw/arm/virt: Rename variable size to region_size
 in virt_set_high_memmap()
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, cohuck@redhat.com,
 zhenyzha@redhat.com, richard.henderson@linaro.org, peter.maydell@linaro.org,
 shan.gavin@gmail.com
References: <20220921231349.274049-1-gshan@redhat.com>
 <20220921231349.274049-3-gshan@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20220921231349.274049-3-gshan@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.086, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vO4mqJ/O6uQI



On 9/22/22 01:13, Gavin Shan wrote:
> This renames variable 'size' to 'region_size' in virt_set_high_memmap().
> Its counterpart ('region_base') will be introduced in next patch.
>
> No functional change intended.
>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  hw/arm/virt.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 4dab528b82..187b3ee0e2 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1692,15 +1692,16 @@ static uint64_t virt_cpu_mp_affinity(VirtMachineState *vms, int idx)
>  static void virt_set_high_memmap(VirtMachineState *vms,
>                                   hwaddr base, int pa_bits)
>  {
> +    hwaddr region_size;
> +    bool fits;
>      int i;
>  
>      for (i = VIRT_LOWMEMMAP_LAST; i < ARRAY_SIZE(extended_memmap); i++) {
> -        hwaddr size = extended_memmap[i].size;
> -        bool fits;
> +        region_size = extended_memmap[i].size;
>  
> -        base = ROUND_UP(base, size);
> +        base = ROUND_UP(base, region_size);
>          vms->memmap[i].base = base;
> -        vms->memmap[i].size = size;
> +        vms->memmap[i].size = region_size;
>  
>          /*
>           * Check each device to see if they fit in the PA space,
> @@ -1708,9 +1709,9 @@ static void virt_set_high_memmap(VirtMachineState *vms,
>           *
>           * For each device that doesn't fit, disable it.
>           */
> -        fits = (base + size) <= BIT_ULL(pa_bits);
> +        fits = (base + region_size) <= BIT_ULL(pa_bits);
>          if (fits) {
> -            vms->highest_gpa = base + size - 1;
> +            vms->highest_gpa = base + region_size - 1;
>          }
>  
>          switch (i) {
> @@ -1725,7 +1726,7 @@ static void virt_set_high_memmap(VirtMachineState *vms,
>              break;
>          }
>  
> -        base += size;
> +        base += region_size;
>      }
>  }
>  

