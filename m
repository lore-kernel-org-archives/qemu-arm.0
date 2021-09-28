Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp4749996lfp;
        Tue, 28 Sep 2021 03:58:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7gwwNG+Re2Fn55HDb/oRkdAFgTyQGc3lmzDKNRlE9C4q/iXL/nZZJWzbJkLqiI/NH5WIK
X-Received: by 2002:a4a:ca12:: with SMTP id w18mr4398260ooq.96.1632826723870;
        Tue, 28 Sep 2021 03:58:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632826723; cv=none;
        d=google.com; s=arc-20160816;
        b=dmcYGzEst2DvWrsBT4O0c+7kMh90M0tF+OvSnNDS0AMS+FdSOTd+OU5qai4GWuWAss
         hxQ3FlEYZ6wZ3CxhurPlSOLcPtVrlF5DiFwfFtGBzPfasjtOadpsinXselUyoAHSN/jJ
         tE5xsOy73YiilrH+2iRW4aS9xzTxsNgxFqcWGPl1pJeQ3XiEt68UWzUAfXnntkim+HSd
         LqXyJA5G46a6kYKHgopvS08pXSzljQqXBZeCwW77jUKjrlzIEzH8BmD3oHL6dyg4R4ir
         qWjtZffHiyD213aRzMVPNTkhtE1C0jhFzHHiSex6EXwmnRK+KoHpDY+bs88KJCDK3eWg
         1piQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=OBmgT684d3V/w8GmefcY6+SwuahSJTJUkp5geTMA2Bo=;
        b=c5zpjr/yO4f1saIesodDSa25ZCX77LwgI/bbNLJCZnqxAcX1KnbSMr4ghaYyUhia0I
         xGasD1gvgRyrRK/q4J/sykUIB8BRhipqmAb4u3bda5CJwhDbAfFQhLYipZQMF5dgqc0H
         em76l2baVTaSByB7yxhwdA5xGaZPjyveKB2NmepWyPuh+gqBak5HCJ2j/oRXxwdWgFUE
         DQq7jR555OmwE6xBIYDvcPLhgoXFhVa2mNOuOS4L7w8ClEyQYg+iXuSuN4Vgr9sGr3Wk
         x9ykQrFR05xatMhft5pER9s7LgjE/DA+dS3YxXtF/SWCKMsmSGUMsN1u16k+NOJw55aK
         8Tbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=JD3vXFX4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j206si20516583oih.182.2021.09.28.03.58.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Sep 2021 03:58:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=JD3vXFX4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mVAot-0000wW-5j
	for alex.bennee@linaro.org; Tue, 28 Sep 2021 06:58:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mVAog-0000tz-DI
 for qemu-arm@nongnu.org; Tue, 28 Sep 2021 06:58:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20201)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mVAod-00089P-SZ
 for qemu-arm@nongnu.org; Tue, 28 Sep 2021 06:58:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632826707;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OBmgT684d3V/w8GmefcY6+SwuahSJTJUkp5geTMA2Bo=;
 b=JD3vXFX4J/PsMxCwsZL4+cmvMwGlVTUHQkFb1+oKCzP6Jx4P5tmUJpnOlkMz8NYdERvr/t
 NtGJotx7nemuJPJu2R0j5vf/g7yVIK7i7gHZhZp2afdcSl4Qe8yVLtmS7ph+Lfmxz+SLpC
 LEeXyFVOdZD14eT+shS/NryX6psrZ/4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-tBctE74yPsK01LzGd_X2Ag-1; Tue, 28 Sep 2021 06:58:25 -0400
X-MC-Unique: tBctE74yPsK01LzGd_X2Ag-1
Received: by mail-wm1-f71.google.com with SMTP id
 200-20020a1c00d1000000b0030b3dce20e1so977188wma.0
 for <qemu-arm@nongnu.org>; Tue, 28 Sep 2021 03:58:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OBmgT684d3V/w8GmefcY6+SwuahSJTJUkp5geTMA2Bo=;
 b=CB5bMcgChSPncE0qEQ9/QJ4y+dyakzKo8v046lMk9kBd4TOtFfxh2WOtnmfsxFVGV1
 zMzoBhD34jAHd/cQH3nnymqrMU4AxLICTCBRnqRRgMI/kQfznT0e83xAjGyfofgAXBXd
 FbxB/5diTOAVPWWjaUhM7D7TqzqEX8Y4FZZmSObLz72NtNy9BhAtsDcifpi6tPYCL/oP
 ALC/aRzR+36tjXRDUH0uChnZ3rpY5NlqhJdXoMYPlEH1fiL7rufKRKqoaH0u9UeaW4UH
 GlBPCslX34teVRbYKTE5VytpmrDOdGvYc4uQAeQUGJxA1HBXgbT92feKsieTxR/qhFYs
 4HhA==
X-Gm-Message-State: AOAM533o8XmYGnIbDOuqQw1H6OWf6ReDhVPcIs3ww0x9C4ioce0mM1kO
 pJj5Tmn9wV8tns4QUwkjmYind3h4qHAdKDpdF/+2pWzgE+S4SFEiyEyMELPzOMmftW6G/3ndSSx
 ZpG4RtsZ/jjGf
X-Received: by 2002:a05:600c:214d:: with SMTP id
 v13mr4018923wml.30.1632826704683; 
 Tue, 28 Sep 2021 03:58:24 -0700 (PDT)
X-Received: by 2002:a05:600c:214d:: with SMTP id
 v13mr4018900wml.30.1632826704537; 
 Tue, 28 Sep 2021 03:58:24 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id g25sm19136406wrc.88.2021.09.28.03.58.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Sep 2021 03:58:24 -0700 (PDT)
Message-ID: <c78012a1-b5e1-3505-965d-b807886accda@redhat.com>
Date: Tue, 28 Sep 2021 12:58:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v11 12/14] machine: Remove smp_parse callback from
 MachineClass
To: Yanan Wang <wangyanan55@huawei.com>, Eduardo Habkost
 <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Andrew Jones <drjones@redhat.com>
References: <20210928035755.11684-1-wangyanan55@huawei.com>
 <20210928035755.11684-13-wangyanan55@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20210928035755.11684-13-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) CTE_8BIT_MISMATCH=0.001, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.562, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Pierre Morel <pmorel@linux.ibm.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, qemu-ppc@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vsLl5Gnys21I

On 9/28/21 05:57, Yanan Wang wrote:
> Now we have a generic smp parser for all arches, and there will
> not be any other arch specific ones, so let's remove the callback
> from MachineClass and call the parser directly.
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> Reviewed-by: Andrew Jones <drjones@redhat.com>
> ---
>  hw/core/machine.c   | 3 +--
>  include/hw/boards.h | 5 -----
>  2 files changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index f5dadcbd78..23f77201eb 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -918,7 +918,7 @@ static void machine_set_smp(Object *obj, Visitor *v, const char *name,
>                      "CPU topology parameters must be greater than zero");
>      }
>  
> -    mc->smp_parse(ms, config, errp);
> +    smp_parse(ms, config, errp);
>      if (*errp) {

If smp_parse() were to return a boolean, this would become:

       if (!smp_parse(ms, config, errp)) {

Regardless:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

>          goto out_free;
>      }

