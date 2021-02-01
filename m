Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp3494612lfo;
        Mon, 1 Feb 2021 07:15:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxrUiPALI9uLXZbeTlGoTKRWuuJbJeXbKU9/ZMoFh5eNeHRwYjEwwGg9DahcGJ8ESqgAffF
X-Received: by 2002:a25:ca94:: with SMTP id a142mr26755483ybg.239.1612192547968;
        Mon, 01 Feb 2021 07:15:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612192547; cv=none;
        d=google.com; s=arc-20160816;
        b=zrWqR0O7QzUiYLP1sebNV8Nbm1T5SVA0QzUCbW5hk6RkXvohLJ+uMBm0Y8ySkDeIT0
         ZCc2HwstKWgQxlaclY988r5P2xWOqD57s4MFnPoM7rGUyyQOlYzW7BOdr5+Gp3rdVlSH
         swiubPI1g41VnDtMKfpHh8w0buI3rGZNlV/pOuLATXlIWoy245IowE69ctJgkFHekzYn
         9mIE17j4G1AYpOT2ZHI3aFJn0enlZkUpcr2s/h3bdVrC05OT+4D/BgC5jmeVqqyyQCcP
         lKLk7h6/qRFG/Lp1GESWcJ0lvycUu35QZt2ExQert5oFOhK5gimf/PR+oGFMjw9Fbq+Y
         fsNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=ozIpMqdD+iWDcSAqUu8JnyllJwpaDgaHUGFapFVXhs4=;
        b=tnT2VgIVIW1ROy+phXoWKlDZKQecG70jv+Gt92vNNrrZElnlFrYnwXwzgueSeYNHbq
         pWcaoy78mLg+cs4cZGmWZ6+tpNYO+kcPkqyEmB0v0Bod6lTgeRkiJJchxL7aSFnSMCvh
         KBYLO2Dn8F+z809DM1iiVFGvzGbMbThL0B7Scslya1bed29dMtq5Jo+2aqdp+XaZp/Bi
         BNy2KYzLf8PylLxsjXjO2HvnpuXH8Z32s90067ts/sc+EaqBWISDHOWX/CV5V5s8yWFX
         WvPAw9P/w+CCGvYT3VofBx2F0p+al0KHX8ltbeCkWw1mzVY7nISu8tukoBxYdQdg2Kxj
         I+ag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=FuWzrP2z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t14si1311990ybi.213.2021.02.01.07.15.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Feb 2021 07:15:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=FuWzrP2z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l6avb-0006Eq-Co
	for alex.bennee@linaro.org; Mon, 01 Feb 2021 10:15:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l6aus-0005mo-1s
 for qemu-arm@nongnu.org; Mon, 01 Feb 2021 10:15:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l6aun-0000mH-No
 for qemu-arm@nongnu.org; Mon, 01 Feb 2021 10:15:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612192493;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ozIpMqdD+iWDcSAqUu8JnyllJwpaDgaHUGFapFVXhs4=;
 b=FuWzrP2zj2OFKtPYrtK6zE+dYh6Ap6wtopKu4aHVXr9DkelRmk92fXOVJh1gVPivp9xfbW
 JRkBg9GV2yjwIvrlKB8pJXkJnHOm7yKhwW/QueQ/W7B5XJIrnDwl/YpsCMdraKms8GF41N
 QwbxYhZ7RTJ4lEecTJ/F8ejvE4iGNY8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-526-Vvnr5UTbOMe1OOkSqhOvTg-1; Mon, 01 Feb 2021 10:14:51 -0500
X-MC-Unique: Vvnr5UTbOMe1OOkSqhOvTg-1
Received: by mail-ed1-f70.google.com with SMTP id f21so8094431edx.23
 for <qemu-arm@nongnu.org>; Mon, 01 Feb 2021 07:14:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ozIpMqdD+iWDcSAqUu8JnyllJwpaDgaHUGFapFVXhs4=;
 b=hJjMXHC2QxM160lR4U6w8f7phdjfLN0tygP+hYCQo0M2GwJeGzYGjj1nEWA13zlu4h
 LFhHDjQLjebpsSRE1lp0xZlMeJMKBmdiiXxOV7thqCligDFgBNuaFMGuYxLcpVqpE7+3
 qJR3iUUFbQOlwye2wH27mY2IgSSQM8wZDCFIh2eo3GhzxTXUaPJpPx42zDxsR35GTQV7
 T4Q7GJvL+yHbmX1jX8Um/hVZGorNPD70CDUoUtem8EbVJUGbdKq/0RYdKDL5GuyBUVW+
 RvyRb9e4gNRmbeXduPLqKyKMGssIw/U+ZWbQpT4f4+Md+zyd12AIMOIpKu17PQj94HyV
 OtIg==
X-Gm-Message-State: AOAM532g+yb9+Z9t6SKGZxhvw7ZTvmFN50YD+UwOq61yqG1S7JGL3+Ds
 rO300e1Ctujbw/SCJFezxgroRU6BBWMTPAJaH1txPLxWcNKthF5e87GtvVdU81/me28I+cGPq5X
 lMizOH7SBz5cO
X-Received: by 2002:a17:906:2b11:: with SMTP id
 a17mr2895262ejg.203.1612192490330; 
 Mon, 01 Feb 2021 07:14:50 -0800 (PST)
X-Received: by 2002:a17:906:2b11:: with SMTP id
 a17mr2895213ejg.203.1612192489878; 
 Mon, 01 Feb 2021 07:14:49 -0800 (PST)
Received: from [192.168.1.36] (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id m26sm8014991ejr.54.2021.02.01.07.14.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Feb 2021 07:14:48 -0800 (PST)
Subject: Re: [PATCH v2 2/2] accel: kvm: Add aligment assert for
 kvm_log_clear_one_slot
To: Keqian Zhu <zhukeqian1@huawei.com>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Andrew Jones <drjones@redhat.com>, Peter Xu <peterx@redhat.com>
References: <20201217014941.22872-1-zhukeqian1@huawei.com>
 <20201217014941.22872-3-zhukeqian1@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ef90fe8b-297d-0a57-bad0-ebc6e1d24333@redhat.com>
Date: Mon, 1 Feb 2021 16:14:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201217014941.22872-3-zhukeqian1@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Zenghui Yu <yuzenghui@huawei.com>, wanghaibin.wang@huawei.com,
 jiangkunkun@huawei.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: g2ApCwTMyF5D

Hi,

On 12/17/20 2:49 AM, Keqian Zhu wrote:
> The parameters start and size are transfered from QEMU memory
> emulation layer. It can promise that they are TARGET_PAGE_SIZE
> aligned. However, KVM needs they are qemu_real_page_size aligned.
> 
> Though no caller breaks this aligned requirement currently, we'd
> better add an explicit assert to avoid future breaking.
> 
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> ---
>  accel/kvm/kvm-all.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> ---
> v2
>  - Address Andrew's commment (Use assert instead of return err).
> 
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index f6b16a8df8..73b195cc41 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -692,6 +692,10 @@ out:
>  #define KVM_CLEAR_LOG_ALIGN  (qemu_real_host_page_size << KVM_CLEAR_LOG_SHIFT)
>  #define KVM_CLEAR_LOG_MASK   (-KVM_CLEAR_LOG_ALIGN)
>  
> +/*
> + * As the granule of kvm dirty log is qemu_real_host_page_size,
> + * @start and @size are expected and restricted to align to it.
> + */
>  static int kvm_log_clear_one_slot(KVMSlot *mem, int as_id, uint64_t start,
>                                    uint64_t size)
>  {
> @@ -701,6 +705,9 @@ static int kvm_log_clear_one_slot(KVMSlot *mem, int as_id, uint64_t start,
>      unsigned long *bmap_clear = NULL, psize = qemu_real_host_page_size;
>      int ret;
>  
> +    /* Make sure start and size are qemu_real_host_page_size aligned */
> +    assert(QEMU_IS_ALIGNED(start | size, psize));

Why not return an error instead of aborting the VM?

>      /*
>       * We need to extend either the start or the size or both to
>       * satisfy the KVM interface requirement.  Firstly, do the start
> 

