Received: by 2002:a17:504:1f11:b0:1be9:327d:8ee3 with SMTP id z17csp940732njl;
        Wed, 9 Oct 2024 08:46:28 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW5Aei7r5IMS9tV8C5X43YogDxjQQk0SdAAoSd+fTl8EAwdcluxaQcX4pwnygtKUfdWgnqGWMnvlo+4Jw==@linaro.org
X-Google-Smtp-Source: AGHT+IH8/6TZ4bN6Q2pKK0K1PK2dCetcwfVkYN/F0uZJfgS2J5clkMsghwVrCM18lMd58dRj7i58
X-Received: by 2002:a05:6214:5681:b0:6c5:688a:63b4 with SMTP id 6a1803df08f44-6cbc956189fmr44140046d6.50.1728488788152;
        Wed, 09 Oct 2024 08:46:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728488788; cv=none;
        d=google.com; s=arc-20240605;
        b=S+BSNeVCqxhNhWSR9ivW6MUE1uUslKnsxkhyYhWi7UZ7Ndb77nsBGWdhfTiTg5BElo
         6WUwoS4/nc+L0AxqE+WXfJgE6JENm4kU4Cn6vRBvM8A9LUJHCnZU08+xRr8BfF8Cs51P
         csDYA4gfEepdCij5CH2P8dc4v8slxdGd3h5RcJv3Ol++Eee00P+c5mcPw9DDliat0mxI
         DTLV19BF9wZ0eNW2LuNF8u8sA5qYtBRpA+aSSDd5cRZAQ1i6KrY4xmxhjXjGUSK5WP//
         zbBUuIBE0UZ0xzrZDh6pKidw3QKwH4/ou+JMx/+YZ9MyrVyb2uMBiZ39AohRxSlYLeiI
         ylEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=PlzQWPOjYSNkzCN9W8sMelrGptif3yHwA7aQv3qQb94=;
        fh=UhTN51+ZR3YoytOlgEEVnFm8AEbR1uHmXKUSwsiY2Ls=;
        b=gCWGApY7CCVVK44A2ep4bWR+9Za/+LJrTZUtLmd6HElQydFeryKJyGb86doDviniWk
         yhSFz+XbPxXmSKDOCQb5M4WZxC2VTQhOGm5oJyZIx3PvP6FT4C9ACBZgN5FvV0PY18t8
         LlKego4BPbAlNcDb0NOMpiqbKkLO1INkeiYdY6k7JxFmFl1XaPNhVxSoCfWvPphWNOFo
         2zfgYA+kLouPL6mvc+oQRz56gNuLGiBmIVsTN8oSBoUK98AvOJhDWZnyO/fZrzhbvK2r
         ImIMiL04zkTvypw2almGuVJ/zIimOmuaJ1MtwW1Dmraa6Hvra3LnjU7BpWokd2ykag2z
         aU+A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KLHeF2zM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6cbcc84083asi14310036d6.196.2024.10.09.08.46.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Oct 2024 08:46:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KLHeF2zM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1syYtH-0004V3-Du; Wed, 09 Oct 2024 11:46:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1syYt2-0004T5-BJ
 for qemu-arm@nongnu.org; Wed, 09 Oct 2024 11:46:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1syYsy-0003nk-Az
 for qemu-arm@nongnu.org; Wed, 09 Oct 2024 11:46:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1728488756;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PlzQWPOjYSNkzCN9W8sMelrGptif3yHwA7aQv3qQb94=;
 b=KLHeF2zMhJZEJSLK4urbaOCVgVOtMK1Huhj563n461Hv3SCs6SrFeuRR2htHigqDkx1Joc
 dkPC5ZtjsfLK9ooUtpcaHFyin44ya13ZNnDS31HCv1fNaIuCvvA9E2YqAEGCg4FtB5LE7b
 D64Efo2ndf00i+uDunhC77XBVxsevr8=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-389-o37NjGiBPs2jdaWEE0Hxuw-1; Wed, 09 Oct 2024 11:45:53 -0400
X-MC-Unique: o37NjGiBPs2jdaWEE0Hxuw-1
Received: by mail-oi1-f197.google.com with SMTP id
 5614622812f47-3dee94f0dcdso5914121b6e.3
 for <qemu-arm@nongnu.org>; Wed, 09 Oct 2024 08:45:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728488752; x=1729093552;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PlzQWPOjYSNkzCN9W8sMelrGptif3yHwA7aQv3qQb94=;
 b=OztnM/vIReFLbEH7R8CHFPswPgvM6L3g13vfPyASQOLAF/JGpOBnuXwg6IRH1EkQW0
 o7Zyo5k5LFbN1KPA5t+0Bs2j4OJP7HawVt8USd8/F3Olx9xf235j2EW5OcEvPVZco6r7
 IdqDAMkHGbivfM5k3vB93gcZOpv7StLpCeUVBBWblIJ39Y/cnlRqRDxXyPTo455WFnHC
 GITWj+I1o31nc+JY7jETv6syP0fS1/BwvcDWls8c0gcxY2q6JvKf5aopDNWiSZP23MCv
 0l8k0YR98BRUYoK7RG1pC13Ff7WDwz/QXEoJ3sve7FTIg+CZ7F2AEn1oqs705ardh4Wp
 6Y9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkZE3j6/qAvUZs0TlNQXCP3jUVVMGddzI9oem7tTnuDxlTFKqwEAau7RNxIuLX6GA/c7K+dPN9jQ==@nongnu.org
X-Gm-Message-State: AOJu0YyFaB1/yQJa1oZa57KRyZ720+ZYj7dCzP6GTA3gIX2ItSwLvpR1
 RweG0R9g0x5v3wyB2TRTWotLXyVWYSbju8X4HIJ4aVLVWkcicJ5c/M5V7eV5KkjNUEvXEgHgW3z
 p6Bhsvul/rPBXbPnCEbvS6K+BYhXZoQa9iw8IN8bK1PcsEm16ew==
X-Received: by 2002:a05:6808:151e:b0:3e3:9721:4ced with SMTP id
 5614622812f47-3e3e67463e8mr3310047b6e.40.1728488752438; 
 Wed, 09 Oct 2024 08:45:52 -0700 (PDT)
X-Received: by 2002:a05:6808:151e:b0:3e3:9721:4ced with SMTP id
 5614622812f47-3e3e67463e8mr3310012b6e.40.1728488752092; 
 Wed, 09 Oct 2024 08:45:52 -0700 (PDT)
Received: from x1n (pool-99-254-114-190.cpe.net.cable.rogers.com.
 [99.254.114.190]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7e9f6c46a20sm7429373a12.76.2024.10.09.08.45.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 08:45:51 -0700 (PDT)
Date: Wed, 9 Oct 2024 11:45:47 -0400
From: Peter Xu <peterx@redhat.com>
To: William Roche <william.roche@oracle.com>
Cc: David Hildenbrand <david@redhat.com>, pbonzini@redhat.com,
 philmd@linaro.org, marcandre.lureau@redhat.com, berrange@redhat.com,
 thuth@redhat.com, richard.henderson@linaro.org,
 peter.maydell@linaro.org, mtosatti@redhat.com,
 qemu-devel@nongnu.org, kvm@vger.kernel.org, qemu-arm@nongnu.org,
 joao.m.martins@oracle.com
Subject: Re: [RFC RESEND 0/6] hugetlbfs largepage RAS project
Message-ID: <ZwalK7Dq_cf-EA_0@x1n>
References: <20240910090747.2741475-1-william.roche@oracle.com>
 <20240910100216.2744078-1-william.roche@oracle.com>
 <ec3337f7-3906-4a1b-b153-e3d5b16685b6@redhat.com>
 <9f9a975e-3a04-4923-b8a5-f1edbed945e6@oracle.com>
 <cf587c8b-3894-4589-bfea-be5db70e81f3@redhat.com>
 <966bf4bf-6928-44a3-b452-d2847d06bb25@oracle.com>
 <0ef808b0-839d-4078-90cb-d3d56c1f4a71@oracle.com>
MIME-Version: 1.0
In-Reply-To: <0ef808b0-839d-4078-90cb-d3d56c1f4a71@oracle.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.151,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: FPm9NjVceG+5

On Thu, Sep 19, 2024 at 06:52:37PM +0200, William Roche wrote:
> Hello David,
> 
> I hope my last week email answered your interrogations about:
>     - retrieving the valid data from the lost hugepage
>     - the need of smaller pages to replace a failed large page
>     - the interaction of memory error and VM migration
>     - the non-symmetrical access to a poisoned memory area after a recovery
>       Qemu would be able to continue to access the still valid data
>       location of the formerly poisoned hugepage, but any other entity
>       mapping the large page would not be allowed to use the location.
> 
> I understand that this last item _is_ some kind of "inconsistency".
> So if I want to make sure that a "shared" memory region (used for vhost-user
> processes, vfio or ivshmem) is not recovered, how can I identify what
> region(s)
> of a guest memory could be used for such a shared location ?
> Is there a way for qemu to identify the memory locations that have been
> shared ?

When there's no vIOMMU I think all guest pages need to be shared.  When
with vIOMMU it depends on what was mapped by the guest drivers, while in
most sane setups they can still always be shared because the guest OS (if
Linux) should normally have iommu=pt speeding up kernel drivers.

> 
> Could you please let me know if there is an entry point I should consider ?

IMHO it'll still be more reasonable that this issue be tackled from the
kernel not userspace, simply because it's a shared problem of all
userspaces rather than QEMU process alone.

When with that the kernel should guarantee consistencies on different
processes accessing these pages properly, so logically all these
complexities should be better done in the kernel once for all.

There's indeed difficulties on providing it in hugetlbfs with mm community,
and this is also not the only effort trying to fix 1G page poisoning with
userspace workarounds, see:

https://lore.kernel.org/r/20240924043924.3562257-1-jiaqiyan@google.com

My gut feeling is either hugetlbfs needs to be fixed (with less hope) or
QEMU in general needs to move over to other file systems on consuming huge
pages.  Poisoning is not the only driven force, but at least we want to
also work out postcopy which has similar goal as David said, on being able
to map hugetlbfs pages differently.

May consider having a look at gmemfd 1G proposal, posted here:

https://lore.kernel.org/r/cover.1726009989.git.ackerleytng@google.com

We probably need that in one way or another for CoCo, and the chance is it
can easily support non-CoCo with the same interface ultimately.  Then 1G
hugetlbfs can be abandoned in QEMU.  It'll also need to tackle the same
challenge here either on page poisoning, or postcopy, with/without QEMU's
specific solution, because QEMU is also not the only userspace hypervisor.

Said that, the initial few small patches seem to be standalone small fixes
which may still be good.  So if you think that's the case you can at least
consider sending them separately without RFC tag.

Thanks,

-- 
Peter Xu

