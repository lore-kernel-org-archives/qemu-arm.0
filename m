Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2797791lfm;
        Mon, 29 Jun 2020 02:03:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyFdlVBFsYlw2+w9LA+ffqd57Ri77sBWHjYM/V4A0bIrc8JJfZyu8EwzwyupiVJxcOt6M//
X-Received: by 2002:a25:6b49:: with SMTP id o9mr23602018ybm.275.1593421433934;
        Mon, 29 Jun 2020 02:03:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593421433; cv=none;
        d=google.com; s=arc-20160816;
        b=tofXy9K7GkVwjavYSZkzFGaISOXTtXxEUZvyOK3qOUKRVlkOV6UGPHO662fWnvDjyA
         GPyx417FRV9y+gzrKfhE5l0dmix99DqwKNF5S7j/m+DC83dNHBrq49XmbdBZcRJvnJl1
         cPNYxCxpuvZJ3llE5zn05AKQ4QBdOVwdKWdo6W05pg85i2WLxUjsEJHuQ+LpxYO3hysX
         //jZr+KyCfRE17sVeSNdumsixxbCZqsVIGiflyGmSgzcA75XtDvIgM5FXEhrDxcI4Quc
         C6PldBTzqE43baLaAZt+ZOwHVgJE+necVEpviB9qObeNfVVisqk+KRzu0D9xA4BV3zeN
         Dc+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Qi81FFPGwwGe3yhfdkVHKsQBPa1IQiolDV9VBMKBsAQ=;
        b=Prf7yLoa4wNUbmJjRebNUlrDjrfcGAyhbdF6V5Sey3DYX7josj+F5gvTVeJNxK67dB
         RJeFlzJPNVRmt1HebirRAmQoIGtF94y+ExUn6HG4DBBs1j2pB5naa/2mV2Qa6b0KMvW0
         SmIbHej+GMw/ejKr/HFJJSEqFoaVRYiAdjEbExrXTaEo0CYcW9NMvBMf/hUH50ysXhAW
         Oa75EU4Wr1PdDWK+7CaW+ecQISV08RHhutOl16a086Sikr4OtLZWlcPwEakPfdr7SUkB
         yDhAW5AA9JDIHsRI5Kzf47fbIuK9mZJAo5RJzh7CEwQSQZ2aMvUd7ONX3qPRL7rZBx1Q
         Dxcw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=qkYw4IJi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h21si34978424ybj.392.2020.06.29.02.03.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Jun 2020 02:03:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=qkYw4IJi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:43414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jpphh-0002rA-8x
	for alex.bennee@linaro.org; Mon, 29 Jun 2020 05:03:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jppfg-0001a1-1F; Mon, 29 Jun 2020 05:01:51 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:34191)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jppfe-0002Vm-Bl; Mon, 29 Jun 2020 05:01:47 -0400
Received: by mail-wr1-x442.google.com with SMTP id f7so12717885wrw.1;
 Mon, 29 Jun 2020 02:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Qi81FFPGwwGe3yhfdkVHKsQBPa1IQiolDV9VBMKBsAQ=;
 b=qkYw4IJiWd2yXiKbBHAHRuiHl22CnhW2UIoRy8uA4uMemUDDlU5qDUKOgRd6MNUtl3
 /n9zTV+/0QH+PQyw3B4DlJ4KV8Tu+P6HMTMm1IF2vilOPVsjMBAtjKcvm3sO1Hj5Lss2
 mCZwBTLk3Hk8rIRXxtOBzAWdX5pDfiqoJoGDVyNFP9W7eJRZItscI5dZBWBOAnQaK03z
 xWercgCXWw7N//TyERyBuDzV/hRPO0MwZkevffNowW+wk1nT1pxNYUHW2Ohu//fUEF/6
 Fdi6q0UFoQF75dW6FRNsnt93MRVMgTiSunklzmjng4gOGTq8FL2rYptwbhGTzCHwWRX5
 Iw+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Qi81FFPGwwGe3yhfdkVHKsQBPa1IQiolDV9VBMKBsAQ=;
 b=ZCSau1wGVgZd4G0gi3JBdl7+crVA+FLiWv4+PTol3wUhxFH3USY+h0U/+iFejiRazq
 rCFV+HNRtxpcHczmyVa0zzXFATvANpMIhxAD0dRCV9NpkCmah+DS+BzE7GNjD617r7ly
 qT+sm/nqiZ7M9+tYtba4OgUpwNMDu8SXnpm4byuqJPm6nGIUTcO3b26RZG24ukpD3Gvm
 PSBiIun+hYfa+QqRyyA1qGQDQaSGZMTIpdJnFPPIiEUyXl0NZyyrss6Ly0UM/cCee/Qu
 chRq1s1d9QOd1mhZi2HHDnlxnDkv/BD+v+k13uUKKSRYlIuIJ6VYJNIAvrrDMVIdq2lA
 cl0A==
X-Gm-Message-State: AOAM530BXwGJpG2TfrU+lU+RfR68bPq1CO2qJu9OtGekMfSwDbzUgjiU
 Mn8UvXn8OlozyrhmkFvxouw=
X-Received: by 2002:adf:e5d0:: with SMTP id a16mr15419928wrn.48.1593421304436; 
 Mon, 29 Jun 2020 02:01:44 -0700 (PDT)
Received: from [192.168.1.37] (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id u16sm791493wmn.11.2020.06.29.02.01.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jun 2020 02:01:43 -0700 (PDT)
Subject: Re: [PATCH 07/17] hw/misc/max111x: Don't use vmstate_register()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200628142429.17111-1-peter.maydell@linaro.org>
 <20200628142429.17111-8-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <9254a124-fa3a-a630-e3ef-17aeeea65cec@amsat.org>
Date: Mon, 29 Jun 2020 11:01:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200628142429.17111-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: U5D6U/ZDgNPn

On 6/28/20 4:24 PM, Peter Maydell wrote:
> The max111x is a proper qdev device; we can use dc->vmsd rather than
> directly calling vmstate_register().
> 
> It's possible that this is a migration compat break, but the only
> boards that use this device are the spitz-family ('akita', 'borzoi',
> 'spitz', 'terrier').
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/misc/max111x.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/hw/misc/max111x.c b/hw/misc/max111x.c
> index d0e5534e4f5..abddfa3c660 100644
> --- a/hw/misc/max111x.c
> +++ b/hw/misc/max111x.c
> @@ -140,8 +140,6 @@ static int max111x_init(SSISlave *d, int inputs)
>  
>      s->inputs = inputs;
>  
> -    vmstate_register(VMSTATE_IF(dev), VMSTATE_INSTANCE_ID_ANY,
> -                     &vmstate_max111x, s);
>      return 0;
>  }
>  
> @@ -206,6 +204,7 @@ static void max111x_class_init(ObjectClass *klass, void *data)
>  
>      k->transfer = max111x_transfer;
>      dc->reset = max111x_reset;
> +    dc->vmsd = &vmstate_max111x;
>  }
>  
>  static const TypeInfo max111x_info = {
> 

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
