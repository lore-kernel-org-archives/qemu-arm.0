Received: by 2002:a17:906:faca:b0:92b:dcda:f23e with SMTP id lu10csp480502ejb;
        Mon, 13 Mar 2023 10:00:51 -0700 (PDT)
X-Google-Smtp-Source: AK7set/nhf+i2CNmcgun6opprJhTR2nWVHTXm8JoTtJbMmAsZy9S9ACIdQMoOJencoKSJdyj2SGB
X-Received: by 2002:a05:6102:3d8d:b0:425:a2d9:d3f7 with SMTP id h13-20020a0561023d8d00b00425a2d9d3f7mr49303vsv.21.1678726850911;
        Mon, 13 Mar 2023 10:00:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1678726850; cv=none;
        d=google.com; s=arc-20160816;
        b=x4fOW6V5e4GhfdxW0bVE2SfWtQg2agBgwz6omqb7KbTWVzDRX6937iHd1qpQp0mf/W
         I4BI9T2Azi+oWeOIKU8eZctDDUfIvjqVh/5W7K5lkZFHIiHRCG9hjjclznZEI9RL8LQf
         T9QE8WHG0EYUsOm3JZqpvjevC4qkZzuLSaswNUcfpLb2UYnBDR64MviYNeFaGE/XDDKU
         m3oLh/Ho9L0mwZCReLMZ/cfPbKuHSPAkyfg1Gbu4RBz8l83f2XwgkITRHhKquRNLnba7
         fnlz35JfhRQOth9v/JP0/qwAD5YJOo6f+iG2MZ/2Pzn2jYHB5Dectu17CcdwVgKmgEIb
         knIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=f/NTA0m58VYA2FYYSRkiqdmY+kq2aNlBMmAjVBPjoxA=;
        b=lFgHrECnxkQ0MYTuS4+CD30GxqtxpSGmkd9EoC6O3mWA7MtIxnkmDrBoDCzcj1Idrk
         j2k76Vf+1v1HnVSfM822fG6FpfgXBsDTv0rFwC2Mn3BJhcYyZ1be1zyZoDdfUF7sBgA9
         jhnL4OhYdbS/Je2C8HVWWDusa2uuVMitcs8/rwuHoGVcalj9blS03tRYZeMhG2NPsLqD
         NVpPJdt5ynGd9g/8YqviA6If7K9Tkh71lTnpt25lKM535j4Jyhl9/XCjeglhPJaSpgKj
         +tkkvGr2WfXR/P34MwxY1QBxAyFq794INuIfd1QvARqpvoWIq+n5Hp3SSftV8FMawvn9
         0xeQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KLUIU0lA;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id p3-20020a056102124300b0041561623fa0si2082120vsg.713.2023.03.13.10.00.50
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 10:00:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KLUIU0lA;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678726850;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f/NTA0m58VYA2FYYSRkiqdmY+kq2aNlBMmAjVBPjoxA=;
	b=KLUIU0lA4NlJ4Z75qwwgNOV5EoUSEF09uy5zhMD5TRF7aw7PKw0hDmfIjnJ7xxnPt72y96
	yn7rwfZyQ/R2Dd50ESccD5JB1CkhUrUOkT8yA8eNOWcSoDcd/Z0rZKJkFAsGpbELNGnkA8
	8+9zYx7Dsg2so8HSCNI265R67eOgMZ0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-121-d8JO-0PfMk2Pm_VfTu4spw-1; Mon, 13 Mar 2023 13:00:49 -0400
X-MC-Unique: d8JO-0PfMk2Pm_VfTu4spw-1
Received: by mail-wm1-f70.google.com with SMTP id z6-20020a7bc7c6000000b003e0107732f4so4407481wmk.1
        for <alex.bennee@linaro.org>; Mon, 13 Mar 2023 10:00:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678726848;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f/NTA0m58VYA2FYYSRkiqdmY+kq2aNlBMmAjVBPjoxA=;
        b=qmahb+jDxsD+PfAeby17YUlc1foAIDScmEQvpyMyB/LGew19jybH4r6DLsUJ6agfFd
         LFErkqsvKnqAcPrzFtZ+QIlk3qzyvMRkZ4PGa2aX7d6batag+GDMFRtV+4l/5dHIX29v
         tWZ4towDxx1bawMExSzBAgt/ib9KbmTSV069SVyIXsFiPaarqDmGjQZtNBdELaH7o37Y
         RMRhkr7XbSfGGMlmjZbQ2P89dgZf+Y2uga+HrptzCmFyFHhcH3k3ujosCDozL1sPnjmC
         CI0HYzlZLDzHFbAVNhaLEodv5szm4TdIjy6KW+JBW3nnGTezzCCS2oo3vsJhIAqx+3YP
         0UHg==
X-Gm-Message-State: AO0yUKV/SoLaqML/aoAbrkD7clLGj8wFwvv1+qZkceoVVrZ4cCB8U5VO
	7tv4guz4BJtXepIE5/Z+8crbPwSTHVysDJLkRyAFqBgi6hJZP3ANXRcUZY1bE1A4fZ/XkH1dtm8
	+BMRk32QOFkcG/dXW7tv0b3t57wQfPX4W+oqGRFxs7heU0i3wkHIka/PUE58F/2sYl/GUqzKiyr
	c=
X-Received: by 2002:a05:600c:4ed4:b0:3ed:26c1:8e5a with SMTP id g20-20020a05600c4ed400b003ed26c18e5amr2554014wmq.10.1678726848196;
        Mon, 13 Mar 2023 10:00:48 -0700 (PDT)
X-Received: by 2002:a05:600c:4ed4:b0:3ed:26c1:8e5a with SMTP id g20-20020a05600c4ed400b003ed26c18e5amr2553987wmq.10.1678726847921;
        Mon, 13 Mar 2023 10:00:47 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.2] (ip-109-43-179-26.web.vodafone.de. [109.43.179.26])
        by smtp.gmail.com with ESMTPSA id p1-20020a1c7401000000b003e1202744f2sm255637wmc.31.2023.03.13.10.00.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Mar 2023 10:00:47 -0700 (PDT)
Message-ID: <c57c82bf-1b05-f29b-80fa-04a7279b5d39@redhat.com>
Date: Mon, 13 Mar 2023 18:00:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 10/11] include/exec: fix kerneldoc definition
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Peter Xu <peterx@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Peter Maydell <peter.maydell@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20230310103123.2118519-1-alex.bennee@linaro.org>
 <20230310103123.2118519-11-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230310103123.2118519-11-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: o+PHyQpS+yNC

On 10/03/2023 11.31, Alex Bennée wrote:
> The kerneldoc processor complains about the mismatched variable name.
> Fix it.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   include/exec/memory.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index 6fa0b071f0..15ade918ba 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -1738,7 +1738,7 @@ void memory_region_notify_iommu_one(IOMMUNotifier *notifier,
>    *
>    * @notifier: the notifier to be notified
>    */
> -void memory_region_unmap_iommu_notifier_range(IOMMUNotifier *n);
> +void memory_region_unmap_iommu_notifier_range(IOMMUNotifier *notifier);

I also keep running into this problem ... I wonder whether we should run 
sphinx with "-W" to turn warnings into errors when configure has been run 
with --enable-werror ...?

Anyway, for this patch here:

Reviewed-by: Thomas Huth <thuth@redhat.com>
