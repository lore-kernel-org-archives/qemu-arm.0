Received: by 2002:a17:504:240b:b0:1be9:327d:8ee3 with SMTP id v11csp2782898njc;
        Sun, 16 Feb 2025 23:32:00 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVHRKb//xOnQjwNDQvIf0eNiHBYOV6HP4c17HkQ1xIii+7dfPxvECLu2HccAyvsjQlzkK/CTkLFSy4SGg==@linaro.org
X-Google-Smtp-Source: AGHT+IERVVNFFSZAnLaVQ78dNxGqpMrmBSNZcun6D6VC/wVIehmP4tW8UnagYiIAKARcvndbln8b
X-Received: by 2002:a05:620a:4016:b0:7c0:69ad:bf41 with SMTP id af79cd13be357-7c08a994573mr1089807585a.7.1739777520059;
        Sun, 16 Feb 2025 23:32:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739777520; cv=none;
        d=google.com; s=arc-20240605;
        b=d/axfOxiKPUdghumMj5B+4TTHrAgkeIvwYizFbqcc0Vd1jA4k1pVMooa1eXR9N50+H
         EIGWkMKCMLwdhYodG9J9KR6UI+AwZy5uUnL9wNSXD6fjSxle6rDnqvOBfSzmO7VRrGww
         JlItv2qtveKrhpotDA67rnHcRqL4Wc1FQ9WnKMEcKouBIdCHol8iu+56ANa5Yl9n52pn
         M164pfqXQAepUaM3ikgIeKLhggdP8iWej+Tdc1Zwy/NspH/XOis7MvdHFw7Qt1IqdTla
         38uTJszmZI6xbmrew3jciflxt2UFsWvkwJ2yXnxyMNJUUnPtxpG3Y+EkSjqGL/GjkrLs
         w18w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=1mgPwNvFo80Y/h1i6hS2G2/GiYmVIt1qcN3yJXz5F+s=;
        fh=tKr1/vp7XInagYxezItU5qLJ/Ln8qL3c5x21MXACzRY=;
        b=ibnGN5yIcHxzSGix5vSUjF3Gi2muNYvrdPUSckL7+xYq+nSwHIUCdASmelG/SwQX2g
         8OzhdHRZaDgUlgp2GZgUy3p965gzUhQzAc3bak39zl18PwfREIGnM6HRRRLsUhTXy//3
         5G2g2i0iZPgxvtfBP3dTYr2qO1Wsf4HSl1NxbIbaVy2wVbw1fk3fsv5Pa+RQU6gPGA4F
         eS7Yd9ZVzdZquNndezv4TvJbuBDpVcSKZPm313fLIPCrOdHZJ2Z9M4UpG12rJt7ubtus
         b8cneBFuo1ScKlbbEqyd3mOkM2XJvxHEQ2BJqlLCmtbZWvHzLsAtytZuxkKqKc3g5ec+
         sxaw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GpvL5OR2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c095b2fe46si237316885a.115.2025.02.16.23.31.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 16 Feb 2025 23:32:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GpvL5OR2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tjvbY-0007lU-Ue; Mon, 17 Feb 2025 02:31:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tjvbG-0007kV-2v
 for qemu-arm@nongnu.org; Mon, 17 Feb 2025 02:31:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tjvbD-0004SJ-4E
 for qemu-arm@nongnu.org; Mon, 17 Feb 2025 02:31:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739777483;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1mgPwNvFo80Y/h1i6hS2G2/GiYmVIt1qcN3yJXz5F+s=;
 b=GpvL5OR2DWEvXgTMh7WDqw/lj3NN8SOhQqwaMACA6cF8aw+cdKIHc2CkTul5ofEzVaZ4fA
 2MBsLveWLQRoRWZ97Ab5cGY/2/pZvUJ1Eo98D/DLjFmwTx4h6vbad81xdLNpE0VHMb8Awy
 kGrXnWdEvLJRiL7ESAhhj74r9SG/Tas=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-520-u-KgwkqmM_mws7kcmNYdDA-1; Mon, 17 Feb 2025 02:31:21 -0500
X-MC-Unique: u-KgwkqmM_mws7kcmNYdDA-1
X-Mimecast-MFC-AGG-ID: u-KgwkqmM_mws7kcmNYdDA_1739777480
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4394c747c72so21303055e9.1
 for <qemu-arm@nongnu.org>; Sun, 16 Feb 2025 23:31:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739777480; x=1740382280;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1mgPwNvFo80Y/h1i6hS2G2/GiYmVIt1qcN3yJXz5F+s=;
 b=pTxa9aSwUiM105JwTgJOUb6MY20uKtCZPAqDRXXFZ00IICzK8jD9uEvk1F1XxAOz/c
 rAs1mkZZkeZ8QfMRwRk+4ieFIR0NgAuHMBLCidxZspAp10a5D4TN/McSABwaJyVpTINx
 hWrkAvtPp/sBlkn2KbjtUnDaw7/mPbDGe5MO5r85bsSpNfjeraxJesqJX66Uv3mvV7uS
 9nAREbPehzPG9nnLwOFTisx7CYTuaZGJMGuWnotmTw06pwT1K1zUWghwG/NHfiTkO7vs
 10Bndq0Xd8YIQz5LvAQW3pTnd6Tf/hMaOkap2l6rRmWzcBppONSEo5TZqagtL1zfELhq
 iK3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9vnZgqB9QXRmecod5nb7rBSazxGyqdQjNDvbUzt9+lLx7fF0yXCI+zT1Ff5P2BiY1PlCseZN/XA==@nongnu.org
X-Gm-Message-State: AOJu0YwLSos5aPuoEsnnUP3ibaFo7h6XrCN432zFmq0ch60LH2HuFLcn
 cE5em3K96OhOkcvULtSA440A9pdIPdzsOBnaFXloU4Ojrg0Bmac6ZCrwCHGs2P7TjCAw3gIGSVg
 uECg3Q0pOymfP4ibULsOK+CyTc5mPS3ym+cEo5jsZL58zyxTlAg==
X-Gm-Gg: ASbGnctmLRFOlEc4s2yIuFPHb2XfLaeI5TGn4fl8oOk11bkoOGTGCfVkNgCw744Nrsb
 CL1tJ7O2rTAJFAHo4fBo3Ukicxvg+M16RyLLl+BTY3ObI4CEmmkMmdBno6pIIMfXHCNc7S9vkza
 YCnEJNGL1s9yCtvSto+B0fiekVPUWSc1yLRiG4UdmFhjP2qzf1NrWbx0/imaQnLVOOMJ0VS7+Qq
 CK4+FzqonGO5ovjHh/TDgad1fZQCIISkm/D4rL5FBL4/8vQclv4Zky5ep0mE5tmtOc81UouJizL
 9pDhbE47ojcBZbRsKgHSwGtFjpOR/sBij1myajfc3Y1ZEpeYOmCw
X-Received: by 2002:a05:600c:1c21:b0:439:45e2:897f with SMTP id
 5b1f17b1804b1-4396e6e32a7mr99796835e9.11.1739777479745; 
 Sun, 16 Feb 2025 23:31:19 -0800 (PST)
X-Received: by 2002:a05:600c:1c21:b0:439:45e2:897f with SMTP id
 5b1f17b1804b1-4396e6e32a7mr99796535e9.11.1739777479386; 
 Sun, 16 Feb 2025 23:31:19 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4396b0aa4e9sm74734875e9.16.2025.02.16.23.31.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Feb 2025 23:31:18 -0800 (PST)
Message-ID: <ad754ae8-0d0d-4a19-bde7-b3df1e56546c@redhat.com>
Date: Mon, 17 Feb 2025 08:31:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] hw/i386/intel_iommu: Tear down address spaces before
 IOMMU reset
To: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>,
 "eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "mst@redhat.com" <mst@redhat.com>, "jasowang@redhat.com"
 <jasowang@redhat.com>, "imammedo@redhat.com" <imammedo@redhat.com>,
 "peterx@redhat.com" <peterx@redhat.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "clg@redhat.com" <clg@redhat.com>, "philmd@linaro.org" <philmd@linaro.org>,
 "ddutile@redhat.com" <ddutile@redhat.com>
References: <20250206142307.921070-1-eric.auger@redhat.com>
 <20250206142307.921070-4-eric.auger@redhat.com>
 <SJ0PR11MB67444138EAFE0660733B315D92FB2@SJ0PR11MB6744.namprd11.prod.outlook.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <SJ0PR11MB67444138EAFE0660733B315D92FB2@SJ0PR11MB6744.namprd11.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: iJZCasVfe3R3i8LYGumZZHia4lhncl1axy7czSvN8mc_1739777480
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.382,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.01,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 4/seLh4Y+jc2

Hi Zhenzhong,


On 2/17/25 4:02 AM, Duan, Zhenzhong wrote:
> Hi Eric,
>
>> -----Original Message-----
>> From: Eric Auger <eric.auger@redhat.com>
>> Subject: [PATCH 3/5] hw/i386/intel_iommu: Tear down address spaces before
>> IOMMU reset
>>
>> From: Peter Xu <peterx@redhat.com>
>>
>> No bug report for this, but logically tearing down of existing address
>> space should happen before reset of IOMMU state / registers, because the
>> current address spaces may still rely on those information.
>>
>> Signed-off-by: Peter Xu <peterx@redhat.com>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> ---
>> hw/i386/intel_iommu.c | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
>> index 21a8bf45f8..1bd9ae403b 100644
>> --- a/hw/i386/intel_iommu.c
>> +++ b/hw/i386/intel_iommu.c
>> @@ -4702,8 +4702,8 @@ static void vtd_reset_exit(Object *obj, ResetType type)
>>     IntelIOMMUState *s = INTEL_IOMMU_DEVICE(obj);
>>
>>     trace_vtd_reset_exit();
>> -    vtd_init(s);
>>     vtd_address_space_refresh_all(s);
>> +    vtd_init(s);
> I'm not sure if we should have this change. vtd_switch_address_space() checks s->dmar_enabled and vtd_init() updates s->dmar_enabled. With this change, will we leave stale mapping there after reset?
Yes I do agree. This could break the as switch. I will remove this patch.

Eric
>
> Thanks
> Zhenzhong
>
>> }
>>
>> static AddressSpace *vtd_host_dma_iommu(PCIBus *bus, void *opaque, int
>> devfn)
>> --
>> 2.47.1

