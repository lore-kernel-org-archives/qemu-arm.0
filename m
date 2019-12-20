Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp3253140lff;
        Thu, 19 Dec 2019 23:29:31 -0800 (PST)
X-Google-Smtp-Source: APXvYqyfn2+l5Hz8Zhjm+lXKSUt+gQd9xpCSs7rmwyYqDNVquIMu21QLRfd0Qrztr9eP8tkB1Byq
X-Received: by 2002:a9d:2c68:: with SMTP id f95mr13644954otb.33.1576826971516;
        Thu, 19 Dec 2019 23:29:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576826971; cv=none;
        d=google.com; s=arc-20160816;
        b=bhrwODPraAAZkTI2uU5mCY6KGNoVAxDa8p1tvZPyzQVB6w1lEWJAQtd4alEPIM3IfB
         eIm+fXpVdJH4xvVwKECHzCmp7jMZBteSQM4bTBgeD4CarTI+o9hTHJF/3jRsEU5feK/2
         8y0fj8/CiqR2sKkv0xCILTgdaYmsj3tJWuG7bqnWc+rtz+cKe8oxfdONVg5p4LaP0nvu
         dlbv2FVr216XgPiHgkiqBDa4WO/FvlljJm+rrGM146UZmMAYZx4XaxPkTTWItoxBKLYM
         KeV0kS84gvIbe9FrIvQPpCek+2p4TR3i5sdRqplV+C6yA3VF9MvURmhX45gUbA3rFfzp
         nYRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject;
        bh=9T9kjcHIthJbwk/BaJGJVshO7lVtEwZpZD5yegYHYuk=;
        b=H5HYvNmB3QJUqrKrfvaTXeJInL6iZ/iD4Y/HXX12UpnF9Wm4Lcvi4+LXJHx0EJ8my6
         OrL71eswV7dbVNNyrJUhvKn+DY2kug5xTcAiD6X4Nyc4bV9WlFDlngrHmlW995pPu0SR
         f8HLQqFU+r2BzttDqwXsngDExIlVGVO0F8TolGkINb69/w6YxKZFOIrv81fLREctc6bj
         fhsXjAGasXjXy9QtJtItMsjXgv0PZdLwJZ/qXpRmitRhNEaYPMtfDEHdI8XtbF/ysihO
         qZsHc/xX4xe5uAv5eec2Uo4AV9L0Ki9iNSTMmsxWX7JcPoaaZgqruaZY/lUJr9X0O22P
         0e0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id q189si4355412oib.179.2019.12.19.23.29.31;
        Thu, 19 Dec 2019 23:29:31 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726651AbfLTH3a (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Fri, 20 Dec 2019 02:29:30 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:50360 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725920AbfLTH3a (ORCPT <rfc822;kvm@vger.kernel.org>);
        Fri, 20 Dec 2019 02:29:30 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 7EF0A9E8FB0866428E41;
        Fri, 20 Dec 2019 15:29:27 +0800 (CST)
Received: from [127.0.0.1] (10.173.222.27) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.439.0; Fri, 20 Dec 2019
 15:29:16 +0800
Subject: Re: [kvm-unit-tests PATCH 12/16] arm/arm64: ITS: commands
To:     Eric Auger <eric.auger@redhat.com>, <eric.auger.pro@gmail.com>,
        <maz@kernel.org>, <kvmarm@lists.cs.columbia.edu>,
        <kvm@vger.kernel.org>, <qemu-devel@nongnu.org>,
        <qemu-arm@nongnu.org>
CC:     <drjones@redhat.com>, <andre.przywara@arm.com>,
        <peter.maydell@linaro.org>, <alexandru.elisei@arm.com>,
        <thuth@redhat.com>
References: <20191216140235.10751-1-eric.auger@redhat.com>
 <20191216140235.10751-13-eric.auger@redhat.com>
From:   Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <d56a4973-ac01-65e6-8e5d-f48da9458b5c@huawei.com>
Date:   Fri, 20 Dec 2019 15:29:15 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20191216140235.10751-13-eric.auger@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.173.222.27]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: ardBlZyKocDI

Hi Eric,

On 2019/12/16 22:02, Eric Auger wrote:
> Implement main ITS commands. The code is largely inherited from
> the ITS driver.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---

[...]

> diff --git a/lib/arm/asm/gic-v3-its.h b/lib/arm/asm/gic-v3-its.h
> index 245ef61..d074c17 100644
> --- a/lib/arm/asm/gic-v3-its.h
> +++ b/lib/arm/asm/gic-v3-its.h
> @@ -161,5 +179,23 @@ extern void its_enable_defaults(void);
>   extern struct its_device *its_create_device(u32 dev_id, int nr_ites);
>   extern struct its_collection *its_create_collection(u32 col_id, u32 target_pe);
>   
> +extern void its_send_mapd(struct its_device *dev, int valid);
> +extern void its_send_mapc(struct its_collection *col, int valid);
> +extern void its_send_mapti(struct its_device *dev, u32 irq_id,
> +			   u32 event_id, struct its_collection *col);
> +extern void its_send_int(struct its_device *dev, u32 event_id);
> +extern void its_send_inv(struct its_device *dev, u32 event_id);
> +extern void its_send_discard(struct its_device *dev, u32 event_id);
> +extern void its_send_clear(struct its_device *dev, u32 event_id);
> +extern void its_send_invall(struct its_collection *col);
> +extern void its_send_movi(struct its_device *dev,
> +			  struct its_collection *col, u32 id);
> +extern void its_send_sync(struct its_collection *col);
> +extern void its_print_cmd_state(void);

This function is not used by later patches, I guess it's mostly used
for debug.

(Assuming the Linux ITS driver has done the right thing ;-), I just skip
looking at this patch.)


Thanks,
Zenghui
