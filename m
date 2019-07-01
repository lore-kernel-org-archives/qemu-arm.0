Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2470883wru;
        Mon, 1 Jul 2019 03:02:53 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyerq4/GjEM9PyerIKmxp5UYbxpUcq/LWrryzKilr/piQeUbB1l6g2yprX8YSvUrOO2Sq6w
X-Received: by 2002:a50:91e5:: with SMTP id h34mr27409426eda.72.1561975372968;
        Mon, 01 Jul 2019 03:02:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561975372; cv=none;
        d=google.com; s=arc-20160816;
        b=iqJ5CqcuGOxW/FswjYDtkYcTsSyscI+exOoFsXse5ZDCgy8gJq8fFCYMTkSp7wWUji
         HxAvlpgRKALsgD9/UFfUxGkXbFHDFlbaHk652X5X2uuIXwznlqi35ynanw6LtYzsK+hs
         omSXL8gemziRpd5KjKL5GH24CYmupTzXy69juwycygVSFVnor9AuKT27F5SUGoKGxVXm
         FYh1WDdbDnvFUjJFXVKpBqVVzllDZOiLbbKR19bmUTinSotMMnS3Yl4/P0JgUIgteGQi
         wRwGveItKt6KfvoLNXe0FnWopSVmWtil5tP8f3UvZccFLjuiUQBzXB+vOVGHVPcFQHwK
         Bhfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=YtzbtwJeSmY2r9CQ/aodjkBS7oniY9D5Gqhkb0tm5cE=;
        b=yAt4cXfSIglj5bLckheHJ8c5xcgu5q/oM4iDML1T88w4BS2kAQxBQ5cQ1nSqilMeV5
         aYq8ZUGOYPenCYt9slsl470i/0RZb3jUR5iVpDcy7cr3sgodf9UkOo0wnY1eiFKJE+Mj
         eMBMAL9ELJ6208Bk0V9iiM3JJiLfUdExTjjY24zN+wZCtO9QNXD+lPBp6RJWEzXNpLes
         VUIHJJhaQrLgOSiplglW+DIcC2LjTKoLQvUkon9sCWT4O5hwm1xn1hOsGesfAmjQN7Pj
         /OqJ60oLMH4pYhirVeCpiaDzs3BdsL/dY+9s9Hmwrc+lWtilzinEoPJ249ghBEUmZq3B
         ZAVw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gr2si7183414ejb.321.2019.07.01.03.02.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jul 2019 03:02:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hht9A-0000HO-2y
	for alex.bennee@linaro.org; Mon, 01 Jul 2019 06:02:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55457)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hht5A-0006Nf-Ma
 for qemu-arm@nongnu.org; Mon, 01 Jul 2019 05:58:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hht59-0007sb-KH
 for qemu-arm@nongnu.org; Mon, 01 Jul 2019 05:58:44 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:40048)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hht59-0007rg-CR
 for qemu-arm@nongnu.org; Mon, 01 Jul 2019 05:58:43 -0400
Received: by mail-wr1-f65.google.com with SMTP id p11so13088484wre.7
 for <qemu-arm@nongnu.org>; Mon, 01 Jul 2019 02:58:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YtzbtwJeSmY2r9CQ/aodjkBS7oniY9D5Gqhkb0tm5cE=;
 b=sfxMlpMRGYYlWE9aJSFQomagqMlla68l/VlWzt3MOoIE5JXNnQzwlB0fsgMbd42lIS
 +hVPw6TDo452yhnjw0+oF9ItQeCcy8KFjUTeO6b02mjqe/H+hGSbAeGELCQlBYoOWK9j
 +WAmCjGOMVW5AvAFb9U11TXXvx4uMhPMM44UPJmRcYsLvYGVjb+7nRI/ga2gMlkP0xka
 zOy7cW07lYxKUVMI3KjPJL3RuhCW23RsdV4Pg4DPXdA2DjmaUbxP8e2gAK+C7RMgQ0v9
 87XF0NOctM/5oAhx0JkSqY2+1yMePnfPfo86TkUfUKzv5SYu62HVPUxz3efEW+8PEDl/
 hP2A==
X-Gm-Message-State: APjAAAX8jT3BeMWK5p9sZCtslYks16Kr3+Lr/a6tUk6Y2XIM6OjYNDgr
 Ez7wTbXfqLsupEBAW67YEM42eg==
X-Received: by 2002:adf:82a8:: with SMTP id 37mr8172535wrc.332.1561975122450; 
 Mon, 01 Jul 2019 02:58:42 -0700 (PDT)
Received: from [192.168.1.38] (183.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.183])
 by smtp.gmail.com with ESMTPSA id t15sm8826375wrx.84.2019.07.01.02.58.41
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 01 Jul 2019 02:58:41 -0700 (PDT)
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 peterx@redhat.com, pbonzini@redhat.com, alex.williamson@redhat.com
References: <20190701093034.18873-1-eric.auger@redhat.com>
 <20190701093034.18873-2-eric.auger@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <ca989a2a-05db-4222-7068-9d294f0434f7@redhat.com>
Date: Mon, 1 Jul 2019 11:58:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190701093034.18873-2-eric.auger@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.65
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 1/6] memory: Remove unused
 memory_region_iommu_replay_all()
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vQn/DMjnLonh

On 7/1/19 11:30 AM, Eric Auger wrote:
> memory_region_iommu_replay_all is not used. Remove it.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/exec/memory.h | 10 ----------
>  memory.c              |  9 ---------
>  2 files changed, 19 deletions(-)
> 
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index e6140e8a04..bdd76653a8 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -1076,16 +1076,6 @@ void memory_region_register_iommu_notifier(MemoryRegion *mr,
>   */
>  void memory_region_iommu_replay(IOMMUMemoryRegion *iommu_mr, IOMMUNotifier *n);
>  
> -/**
> - * memory_region_iommu_replay_all: replay existing IOMMU translations
> - * to all the notifiers registered.
> - *
> - * Note: this is not related to record-and-replay functionality.
> - *
> - * @iommu_mr: the memory region to observe
> - */
> -void memory_region_iommu_replay_all(IOMMUMemoryRegion *iommu_mr);
> -
>  /**
>   * memory_region_unregister_iommu_notifier: unregister a notifier for
>   * changes to IOMMU translation entries.
> diff --git a/memory.c b/memory.c
> index 0a089a73ae..290a1493ef 100644
> --- a/memory.c
> +++ b/memory.c
> @@ -1910,15 +1910,6 @@ void memory_region_iommu_replay(IOMMUMemoryRegion *iommu_mr, IOMMUNotifier *n)
>      }
>  }
>  
> -void memory_region_iommu_replay_all(IOMMUMemoryRegion *iommu_mr)
> -{
> -    IOMMUNotifier *notifier;
> -
> -    IOMMU_NOTIFIER_FOREACH(notifier, iommu_mr) {
> -        memory_region_iommu_replay(iommu_mr, notifier);
> -    }
> -}
> -
>  void memory_region_unregister_iommu_notifier(MemoryRegion *mr,
>                                               IOMMUNotifier *n)
>  {
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
