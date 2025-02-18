Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp518673njb;
        Mon, 17 Feb 2025 23:25:22 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXAEZ+K+ietA41tP58vAlx3s0CJ3fhBIXlYExD6ubQvjbgTsR3ZOzlWqQ/4gCLF3x2kg15SH6/g3Mbc6Q==@linaro.org
X-Google-Smtp-Source: AGHT+IGstwu7CDp6bmQ/mv92ShsKK9Hza27Rmu/IvBEeMUJg8hxAjXMM1rJfyzGuDxZJ11Oo/3ML
X-Received: by 2002:ac8:5d8a:0:b0:471:d742:9b4f with SMTP id d75a77b69052e-471dbd21d85mr181096131cf.21.1739863522298;
        Mon, 17 Feb 2025 23:25:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739863522; cv=none;
        d=google.com; s=arc-20240605;
        b=AnWMZ3A5t1jgrh0Bam1NrtH1MJRLSOWF8q4EmC2fGkG4226yhxy306VH9SVJhuCXMy
         ngcleGV6nnIr0hqX8/De0n5H94yNFhI+QMCgJg5VfhQo2XJvSr5M3g4Zid/ayJgxaVy5
         n+IgNWhyc2kS4z/sTqCuJNTrVE+AJXkwFsa5yxuuN8Blh0kGwSSnfIFUeagvHrz+9sRA
         boSmyoiyaVsZ0/rrTv2hP4aiZFytRn7LE+q5C53FTzuJNLpRT/Xrf0mFkDpUiiULjLLu
         E3McoLAbNwQTg8Kjg63Cz60mR0xPd7Yakjyjv+dXqytvx0bY7R66IEFb0yiq+Sftf3LI
         Xw0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=kxCCkdRmXeLy1Nydo7YHZSrx6nZc3sBidRkQdw6j4Aw=;
        fh=1O2gM9ypFYWxiz7BA3skDXLDpq20YKK308wjl87H98c=;
        b=TnxYEq8zKzGkdgtLK3JVlytlN18pCz/6fg8wgIBgIVgY8dvPcITxuSqEtKel0hb4C5
         ukDlPBghunv/GeC8wrCV/qt48uA5FUMny22IR9mQXxF2K8WSZfvtu7uQDn4ZfsynleOP
         NPXqXQ+nZNa3jUjqnBsU14t0pUWG9QEjMH/vv2rMR0STJ4DD0nDNjzK+ajStPpQizrTQ
         OtpuQCg7mk81UZirRIymcXTMsbLkfY+vJ8FgmVbpl0YOOwwcBMdtIO1xg87nE7KYa5Ta
         lu4v9XLwkU29K/MG5UEWsiPqLvvTu4iIGE6wZaSQ3mvOnc0kb5sH9cs+me1cMaQ3xwHT
         N1Sw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="be0P/0da";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-471f0654631si37118761cf.6.2025.02.17.23.25.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Feb 2025 23:25:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="be0P/0da";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tkHyJ-0004CV-E8; Tue, 18 Feb 2025 02:24:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tkHyH-0004CC-3f
 for qemu-arm@nongnu.org; Tue, 18 Feb 2025 02:24:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tkHyF-0003IK-0i
 for qemu-arm@nongnu.org; Tue, 18 Feb 2025 02:24:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739863481;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kxCCkdRmXeLy1Nydo7YHZSrx6nZc3sBidRkQdw6j4Aw=;
 b=be0P/0daRmLndK0JPOfGL5lBwQMNQgKmn2uMGVOL1pQQ5ZoBdzVgNQ0fmjr5+URUs6+MJS
 /mdNTvfMOQEQC/qSS6Pmq4AK4xIWV55CzyXmIbVHRg+QKdwgby08RgoPBFjyoJXSiPQFUD
 W8x9/mBGH/FVziIdEVHCw3W+3oiv1ms=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-584-vrRlRC9lMPmGccAWy6X3TQ-1; Tue, 18 Feb 2025 02:24:39 -0500
X-MC-Unique: vrRlRC9lMPmGccAWy6X3TQ-1
X-Mimecast-MFC-AGG-ID: vrRlRC9lMPmGccAWy6X3TQ_1739863478
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-38f2f78aee1so2123002f8f.0
 for <qemu-arm@nongnu.org>; Mon, 17 Feb 2025 23:24:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739863478; x=1740468278;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kxCCkdRmXeLy1Nydo7YHZSrx6nZc3sBidRkQdw6j4Aw=;
 b=N2exOtLoMD0D/vM9Uf0zN4JSt/9rBAcUTlAYGF7yFrQxOU6nXvojt/8bz2NM0nbniw
 77vSyxf2vel15H4FUxHd6TUteJeTUAFEvnkS3+N7zHcv4wdY+593DAOJ+QhzA5w9UQGk
 HsUQsNdvCNh2OuJRpJnok0qEo65L380DalXSKxMh2mvrMhwdEkr4FgRbDOnjHyHsKsq7
 0G3j0om5kfAyQpw23a2hS/j6N9q1+RLlSsalWFFNnIXfv9/f2751Rbs9NMM2NRtbqvR7
 H+OJ6EiRcazmjudZTTBrbcuLhcbYmky4Or6smc/BCzNhzscCMn91s24YiWgK3OEaVc9T
 5Cpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBemj6j1Nx3dw8fTDVWRW+rO11kCK3RicBAN42tK24b3hJ78kueBJi9Ul/PY/zvXbwMHjpMdvZaA==@nongnu.org
X-Gm-Message-State: AOJu0Yz06N+fHFQoXJgGDKCwYlmfKQ7UtoolhbXSkVnBpECFjv456Qbi
 pzKFA9tc/Mpqni1kHhFa9LV8Sky65Q0RNJCMx3uOjNyS+CJRCgI/RwtLrfwzmlTotdmByLeDV1+
 Wpiyu6KxORgzvn2PAqi12sXUNUsdkfxszJXe6iUAPOOUvdWNy6w==
X-Gm-Gg: ASbGncva16DiXAWYAW22/e4iRYqlzhA4PZV8cCNNA3G3YOXDkxPpVyx8S/trXuftOAe
 P05B+QXUknuD/cbjAc69+bBXtzJCOuWlaG+3KIQ/0cDs/eI/3srUxUR90C41THZ23CcuD2FhY0B
 B+YUrinfMe/Rbr6RGrfTPLrqYag8EyAB+eMbM2M08tl9ejoAMez5nsbSkOBrzAGYGUBDGfCFvm/
 w4ln5Hbjv/eBGh7v4a2sB90D799rqnyjt1u1JJCELyql5eRgdaVhyD2qDpmEnx/eypeLenk4JgA
 iM04JrtS0CsqBYyYFrBlEa05qmCsYYidfaJEtXBGcFQZk/Zt0xoa
X-Received: by 2002:a5d:6c66:0:b0:388:c61d:4415 with SMTP id
 ffacd0b85a97d-38f33c20aa7mr10663868f8f.18.1739863478070; 
 Mon, 17 Feb 2025 23:24:38 -0800 (PST)
X-Received: by 2002:a5d:6c66:0:b0:388:c61d:4415 with SMTP id
 ffacd0b85a97d-38f33c20aa7mr10663851f8f.18.1739863477730; 
 Mon, 17 Feb 2025 23:24:37 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f25915719sm14344352f8f.60.2025.02.17.23.24.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2025 23:24:36 -0800 (PST)
Message-ID: <88169d47-f3a1-4dbe-aa9e-9ca3617adca8@redhat.com>
Date: Tue, 18 Feb 2025 08:24:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] Fix vIOMMU reset order
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
References: <20250217133746.6801-1-eric.auger@redhat.com>
 <SJ0PR11MB67449A41C11701DC5719A63292FA2@SJ0PR11MB6744.namprd11.prod.outlook.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <SJ0PR11MB67449A41C11701DC5719A63292FA2@SJ0PR11MB6744.namprd11.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: E3yH-480eM2do8dIx7RDrPUdKmgMj6AQQxRmxuCBvO8_1739863478
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: Oo5uTP8xb6pt

Hi Zhenzhong,

On 2/18/25 4:32 AM, Duan, Zhenzhong wrote:
> Hi Eric,
>
>> -----Original Message-----
>> From: Eric Auger <eric.auger@redhat.com>
>> Subject: [PATCH v2 0/5] Fix vIOMMU reset order
>>
>> With current reset scheme, DMA capable devices are reset before
> s/before/after
ugh definitively! :-)
>
>> the vIOMMU which translate them. This holds for the different
>> IOMMUs and various DMA capable devices such as virtio devices
>> and VFIO ones. With virtio devices spurious traces can be
>> observed at qemu level such as "virtio: zero sized buffers are
>> not allowed" while for VFIO devices, translation faults can be
>> observed at host level.
>>
>> Virtio devices use 3 phase reset and virtio-pci devices are reset
>> in the 'hold' phase. VFIO device reset are registered using
>> qemu_register_reset() and as a consequence they are also reset
>> on 'hold' phase.
>>
>> Note that the tree of QOM devices resets depth-first but it does
>> so while enforcing the 3 phases. First the tree is traversed doing
>> the 'enter' phase, then the 'hold' phase and eventually the 'exit'
>> phase.
>>
>> However the QOM hierarchy is not built so that vIOMMUs get reset
>> before the DMA capable devices (IOMMUs are using either legacy reset
> s/before/after


>
>> scheme or hold phase). Changing the QOM hierarchy does not sound
>> trivial while forcing the vIOMMUs to be reset on 'exit' phase
>> sounds reasonable and much simpler. Obviously this relies on the
>> assumption that all DMA capable devices quiesce their DMA before
>> (ie. during 'enter' or hold' phase).
>>
>> This was tested with qmp system_reset and virsh reset.
> For the whole series,
>
> Reviewed-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
Thanks!

Eric
>
> Thanks
> Zhenzhong

