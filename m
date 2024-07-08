Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp2690903njb;
        Mon, 8 Jul 2024 06:27:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWk9Ydfrez2IvZvqP/CZrUjh+4hcHWXvDnkj7f0egit4kE2g3xgv/uiNsydJ8HkEAcY1D8T0k01TtTQq07Ex15tqvYrPfDN
X-Google-Smtp-Source: AGHT+IGeB4GBZ+a6EKQl5+HSTg6QOI5SHu4BWf4hoPXFg0cQ0Dk3HLgQKrAz6PEh9pAYFdeTx7PV
X-Received: by 2002:a05:6122:1e0c:b0:4f3:207a:c664 with SMTP id 71dfb90a1353d-4f3207ac86amr3583051e0c.14.1720445265435;
        Mon, 08 Jul 2024 06:27:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720445265; cv=none;
        d=google.com; s=arc-20160816;
        b=rKFkCB7XqsPleMgb40Edl3eJpRvvzDE8UBmYmVhxhbPvnYl3Q6yftE0nVeFtRw1sIn
         40nMm3pQTCG9RdVZTE0mYgfvO4sHfbdHnx2xyceshgKjAE7Bx3mPxJUgDfd5DwkM6+Ix
         OV0YwD/lxsOlY1tmbOfc3SGd4fZl+0Ol9CGrRLjzlVltFpgfVhxI+LcrAIM6qHNC6a7o
         FU8tEIaYEiu5zlfmrFPWAJMRNFzr1jV8qAA9N6ZdTQSF5wCouXFh0YFXatS0z4bfIwWI
         MyNdH4Iv893PRlsgOW8jIZY6sW6DpnDkbiE3o+HBqzixwoMOVA4T4kbfWDNCaq0tdVQz
         CGiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=GBg8DTmpRCRORQjVbZrwngCucqavvFsZaznshBr/qow=;
        fh=pb5oL122UYvFV/Za+dLWugsKQsEhDYmleTRL9WCPedI=;
        b=XzzORV1ElX8OisYjcH1NzgathDxyfbqJ2/lHzsGrEnI1FEvV2qORGeuiika6CpnwnY
         7d0Y408GyH5cj5BwGddY8qxyCy8q6NmuTo2Qb1sM21dpW7viSotiSx41/dwKtpsOmYKH
         mx3zBEkiLBZ+zTPSIiQ1YOHTRi7HblFKCaNRITCd3/lNhALoxQ0VoEjxMra7YO4ynxaP
         3900W0MF4sWTee3QdgQ0o8zK3h/a/T82CQXx42P1FfMU4+Mqkz1u2/wWEevTHFAtt6gR
         PBozTvMG75xM3epBf3SzksF5oQioHOIl0/jSlid9vWFuqYoGyqSOwSDDftVnauad2gxy
         b6Rw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HdqPnQVY;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-447d558e58csi70473311cf.180.2024.07.08.06.27.45
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 06:27:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HdqPnQVY;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720445265;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GBg8DTmpRCRORQjVbZrwngCucqavvFsZaznshBr/qow=;
	b=HdqPnQVY19vOaCD7dPkYnv3CvK8uJx653u8Sy30LFXwkmZ+CiwdnaOAm8mOlwYEfQZMW7W
	apSektmF66rNUcZ45d5uo51DsUq5/pWsnhJIKcqAW/j2xf3YsNiCIae9PIJiefZkRrfUBD
	P5kkBbXqiAWcCOENxjJGU71trtnwoa8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-145-srF62t5_PdiIhuGj1-6TvQ-1; Mon, 08 Jul 2024 09:27:43 -0400
X-MC-Unique: srF62t5_PdiIhuGj1-6TvQ-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-42666785d74so6815185e9.0
        for <alex.bennee@linaro.org>; Mon, 08 Jul 2024 06:27:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720445262; x=1721050062;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GBg8DTmpRCRORQjVbZrwngCucqavvFsZaznshBr/qow=;
        b=jw4hHgnXysKpCUHPDI/ACbZP87r/yVx6cGisuDJxT71zD+rl3Il6AIHBLEnmT1SuNi
         YkFCfQTW1qIBVp4/PQkS0T69Bo5l56RdPbK4T1i1oWIidH+C3zs7b0W7wTLfCvfyx2BI
         RJtCg6ANfuOlGgugLpMH9NvuD6pqAA+YHZBU1LItkoxnEsfKCxSIn18diTBHIAmTwZwE
         M6ejJw7oXoz2Ypb3rGHakjFiyF7HEdajqzKniPnto8Xl/XuPnm2GcPdsv8qxPa9HzPXS
         UjMM/gdDITN8bCHDmHA4VIPZ5G/NJE0hKIGi/nGDCTC+TlAKB+w3YgJMqJPe+R+vPDsg
         y/kw==
X-Forwarded-Encrypted: i=1; AJvYcCX63w9uRyz8TkuXBMiltt9z6TbHe+38bT8cN1JoSgEVSBleH35UmncKn33ZjmKg61pK6pONN2LWqVGchyuguR53VPKJ+asj
X-Gm-Message-State: AOJu0YyZUJ4dtZy5wdWP6zfdEbyfJhSjk5Wl4Y8Ncs03jw/9ONQMHMBl
	lE3qjkf3ZT0UErV60Hu6EB0ZAxyF7WhSBdZlumPFZ2aJV9czwhUrvytUIwefkrS3vJsx2ktyli1
	fpSz7Jj4oyknTI9HnXMC0BxBkzyZTjQt7Rq71SBYEgrQKuCNirDMZyQ==
X-Received: by 2002:a05:600c:18a6:b0:426:5e32:4857 with SMTP id 5b1f17b1804b1-4265e324bf4mr57943495e9.0.1720445262529;
        Mon, 08 Jul 2024 06:27:42 -0700 (PDT)
X-Received: by 2002:a05:600c:18a6:b0:426:5e32:4857 with SMTP id 5b1f17b1804b1-4265e324bf4mr57943215e9.0.1720445262194;
        Mon, 08 Jul 2024 06:27:42 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d169dsm167318375e9.5.2024.07.08.06.27.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jul 2024 06:27:41 -0700 (PDT)
Message-ID: <2e9dd97d-6e67-41f1-a8a2-71c90b163c56@redhat.com>
Date: Mon, 8 Jul 2024 15:27:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH v4 07/19] hw/arm/smmu: Introduce CACHED_ENTRY_TO_ADDR
To: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Mostafa Saleh <smostafa@google.com>
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, qemu-devel@nongnu.org,
 alex.bennee@linaro.org, maz@kernel.org, nicolinc@nvidia.com, julien@xen.org,
 richard.henderson@linaro.org, marcin.juszkiewicz@linaro.org
References: <20240701110241.2005222-1-smostafa@google.com>
 <20240701110241.2005222-8-smostafa@google.com>
 <20240704180438.GD1693268@myrica>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20240704180438.GD1693268@myrica>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: 8G1ZPx8o3Xsh

Hi Mostafa,

On 7/4/24 20:04, Jean-Philippe Brucker wrote:
> On Mon, Jul 01, 2024 at 11:02:29AM +0000, Mostafa Saleh wrote:
>> Soon, smmuv3_do_translate() will be used to translate the CD and the
>> TTBx, instead of re-writting the same logic to convert the returned
>> cached entry to an address, add a new macro CACHED_ENTRY_TO_ADDR.
>>
>> Signed-off-by: Mostafa Saleh <smostafa@google.com>
>> ---
>>  hw/arm/smmuv3.c              | 3 +--
>>  include/hw/arm/smmu-common.h | 3 +++
>>  2 files changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
>> index cc61708160..229b3c388c 100644
>> --- a/hw/arm/smmuv3.c
>> +++ b/hw/arm/smmuv3.c
>> @@ -950,8 +950,7 @@ epilogue:
>>      switch (status) {
>>      case SMMU_TRANS_SUCCESS:
>>          entry.perm = cached_entry->entry.perm;
>> -        entry.translated_addr = cached_entry->entry.translated_addr +
>> -                                    (addr & cached_entry->entry.addr_mask);
>> +        entry.translated_addr = CACHED_ENTRY_TO_ADDR(cached_entry, addr);
>>          entry.addr_mask = cached_entry->entry.addr_mask;
>>          trace_smmuv3_translate_success(mr->parent_obj.name, sid, addr,
>>                                         entry.translated_addr, entry.perm,
>> diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
>> index 96eb017e50..09d3b9e734 100644
>> --- a/include/hw/arm/smmu-common.h
>> +++ b/include/hw/arm/smmu-common.h
>> @@ -37,6 +37,9 @@
>>  #define VMSA_IDXMSK(isz, strd, lvl)         ((1ULL << \
>>                                               VMSA_BIT_LVL(isz, strd, lvl)) - 1)
>>  
>> +#define CACHED_ENTRY_TO_ADDR(ent, addr)      (ent)->entry.translated_addr + \
>> +                                             ((addr) & (ent)->entry.addr_mask);
> nit: maybe wrap this in parenthesis to avoid future usage mistakes and
> drop the semicolon 
With Jean's comments taken into account,
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
>
> Thanks,
> Jean
>
>> +
>>  /*
>>   * Page table walk error types
>>   */
>> -- 
>> 2.45.2.803.g4e1b14247a-goog
>>
