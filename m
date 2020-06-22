Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3607245lfm;
        Mon, 22 Jun 2020 16:04:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJylrvmbEMgG+QqeHA/uoG3MHdnnaNN2J2/3S7RLUZXWXXExeaZQue6HP6PUuvLgsNNw5njC
X-Received: by 2002:a50:e047:: with SMTP id g7mr5081655edl.290.1592867072038;
        Mon, 22 Jun 2020 16:04:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592867072; cv=none;
        d=google.com; s=arc-20160816;
        b=dST7Q1+Zyh+n5nd55+siuGHmaT3viF1yiIUTYUJxlK+rNHVawxZfev93cCzWvVw27G
         47APOoRu8x3ebGk6N8UNENRwgI3b2bCkWARqjTDXNfDz5dPscTkKZe4enM9sjO1tXF9o
         cv4IDnCRfD+dzmFsuCr8iAOpwuJUNGY6AEhEqNgc/6NaemqI7k/QCVRodbsSGCWBPFn5
         2CiKVrZH+mI1le3ubkR/rdAL+oqRfrg3lDLeU3cPNLcJUfeifP/90QDyEegLySWfZ3yx
         8/NkwA07zvVaj2o+U9g0emjBrPb4lq3uxi2WCvLe2K6Qq2bHlsaMPK3GeG4CIui8GGmm
         lN8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:dkim-signature;
        bh=xRzCWX3ReFeVc/uIdEctANg6zEVQMutBkN5Zs6/zBBA=;
        b=n/2GMCx6Yl5gSiym2z+kHdsJZ3DntK+YHQzqiIKHG1E6HwqRnUdA9UD5VkpbtOdBYN
         8vesIn78YBSjhtt8IJfgjNp8mpsaYVmYCSQXP8oxzusQcwB6Ns4Pf/AAutlJVPRe8pfe
         yfbMuDoppfiW4GWPJlAduPNnklwAcTQJGm66ehEUgc9+rwP/0GtbxgA+Pp52zOluHa04
         ZeE4tbT25x87W9ormH2/epFngMw83dEYZQPZ6QZg1gRGgDrzq6k/fNXL2j5pK8qLj1gL
         YyHZ0Mp9+hxbLdzufnC8kmmsCoSTSZ/F/AiruRCu85XkqxeCxwp+/xHrj5yPDG15TuCK
         lJYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JE7fMMBc;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [23.128.96.18])
        by mx.google.com with ESMTP id y5si9721253edu.279.2020.06.22.16.04.31;
        Mon, 22 Jun 2020 16:04:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) client-ip=23.128.96.18;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JE7fMMBc;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731452AbgFVXE2 (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Mon, 22 Jun 2020 19:04:28 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:51881 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731367AbgFVXE1 (ORCPT
        <rfc822;kvm@vger.kernel.org>); Mon, 22 Jun 2020 19:04:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1592867066;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xRzCWX3ReFeVc/uIdEctANg6zEVQMutBkN5Zs6/zBBA=;
        b=JE7fMMBclqJavxmSXwDiG5mu5xajiUcEdLFEqyq+718nLBoHkq1VLM5npeQHpIPs9eDfzc
        SCI+eKS5VC7D3Kp53yRVEoCEdM5lEpiPAJO1dZ2dwB1eya8KTF4JX3bWWl+TI9C7+RImxf
        VdvZN1wzEWolAxTdrVf7bIOzh0Yvzrw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-347-Wlg1U57wMBSB11c7qLj7NA-1; Mon, 22 Jun 2020 19:04:25 -0400
X-MC-Unique: Wlg1U57wMBSB11c7qLj7NA-1
Received: by mail-wr1-f69.google.com with SMTP id a18so534851wrm.14
        for <kvm@vger.kernel.org>; Mon, 22 Jun 2020 16:04:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xRzCWX3ReFeVc/uIdEctANg6zEVQMutBkN5Zs6/zBBA=;
        b=fa2KJDlM6NHLecf3XEB5QSL+G5Wq08hpkjjbT0vKFfEvJ5tsfKjp12zMaWHPbPbqA+
         sPEkGVD+0MQ6i4YkdJ9Jy0dk6X7dz1snUZDHFnB102i8gX8l8X07EoeLy5tg5zDiWoN2
         28uuaFGHRFrAW519Og2Wtzw4xW1kQ+A7lowyyPuLE5iSVhYjOfkS0yewgxYnibkT+XGx
         /H7bQ730twxsrUjDrKJVPRiaxxf8HORVIglX+sZvvdbfgxhAAqJwAUnI2WVjmh/zHNSw
         hJKvEARsP6XKfrx7+sCCmhmUm0fDDfTGXQEyhjvJx+bJ5CJAiPVG5S7QGBSR/UcVprTb
         5T7A==
X-Gm-Message-State: AOAM531gUG7kthkbi1xMQXczQ8bs1LbK/1AHM7oa8QIs1XfmFTsNjgVj
        AvlH2jJGYKLfZm8kOmyubFobmC8Xf+jXu8tlrxT0iDCvbdj09+TRItdpvUcaCiKLi36K9BHYiPc
        NrarNwNWysN3p
X-Received: by 2002:adf:de12:: with SMTP id b18mr13456198wrm.390.1592867063781;
        Mon, 22 Jun 2020 16:04:23 -0700 (PDT)
X-Received: by 2002:adf:de12:: with SMTP id b18mr13456180wrm.390.1592867063556;
        Mon, 22 Jun 2020 16:04:23 -0700 (PDT)
Received: from [192.168.10.150] ([93.56.170.5])
        by smtp.gmail.com with ESMTPSA id 1sm1202692wmf.0.2020.06.22.16.04.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2020 16:04:23 -0700 (PDT)
Subject: Re: [PATCH v2] target/arm: Check supported KVM features globally (not
 per vCPU)
To:     "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
        =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Cc:     qemu-devel@nongnu.org, kvm@vger.kernel.org,
        Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
        Andrew Jones <drjones@redhat.com>,
        Haibo Xu <haibo.xu@linaro.org>
References: <20200619095542.2095-1-philmd@redhat.com>
 <20200619120202.GH2690@work-vm>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <c3ceeab9-aeab-175c-f778-22574f49f684@redhat.com>
Date:   Tue, 23 Jun 2020 01:04:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200619120202.GH2690@work-vm>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: qP6gkpulxM6Y

On 19/06/20 14:02, Dr. David Alan Gilbert wrote:
>> Paolo, does this break migration of encrypted memory assumptions?
>>
>> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
>> Supersedes: <20200617130800.26355-1-philmd@redhat.com>
> I'm not seeing the relevance to migration.

I told Philippe that there could be a possibility in the future of
having more than one KVMState to support SEV live migration, so removing
all KVMState* arguments is not a good idea.  But for kvm_check_extension
calls it should be safe, as those should be the same for all VMs.

Paolo
