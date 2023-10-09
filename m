Received: by 2002:a17:906:b756:b0:9b2:89ee:1eb8 with SMTP id fx22csp61008ejb;
        Mon, 9 Oct 2023 14:06:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFa7OngKUzDts/jpp42Ujqz6D1ShqOHu0Uo6IO5fjVfJKaARsHmZbiyBKQ3AqMQ4txAWx6K
X-Received: by 2002:ac8:5809:0:b0:418:125b:2cfb with SMTP id g9-20020ac85809000000b00418125b2cfbmr23698266qtg.3.1696885597278;
        Mon, 09 Oct 2023 14:06:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696885597; cv=none;
        d=google.com; s=arc-20160816;
        b=VA2DtvaD3qwStjdw36hmeuq44axQMaUnFWHfCEJ/MLhZaANw7b29yV/ZXbzKyEzCa8
         CLFCQ3+9bZ6lWFB40YBzARyXTpZyfOt6F/cR8BNphv215m5xGznWG4AQFKV71JlQ+UgT
         Er6CNNkyK5Z/eGk6e15ewJSdzGs/WCNfvtwvLTJu71bRiqqX/gBowjZceTEHLL5p6JSP
         YXW8bf7UnK1P7Jcyt73NOGg/9Wja+bwImma8FPs/dMPKZj9poCl6nIZsANiATahxMigz
         Vzr875pv4BZ3SqvoR0aoWiB/6ysbgxZLRxLYdjDLt3rwLRIlwAwBoTj0vhqqM1yj3r99
         hTlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=VB6Jffdm+yxNoXKr3ZGZhLr2PFYo5MOa/33khoSwvmo=;
        fh=Emi9jBOsJ+W7psiRd7yxitgio08ISVBCYWmIm5NxnZ8=;
        b=XbrsZLkUf8wQsyE2dUzeuKzZhXAXGHqDHzBkmWTNvWhf2Qw461vRQhYgKfCdZQztp5
         i/xgOkP/K8fW1Z9q3fHq0BURmm/wAezuhYYoApj7ItWdi3i+Z8Za/B5r4OwoKYO5bVUo
         Rod+BNU+FQeEMcv92X5vwkE5qDyBfB7VDeKSHDJQN2gEMxwbsqyC0dedj8EDBPxAMT6K
         2f0cR44+lXQwoPpd2sz9sTKS8WgUJZRgYppL2Jgd7+Yz02r41PBhqmNGPwdyUa5ZtZn0
         uK7pVEbOI0riLXB7I+TIrIxofVhrZHDkMtXIuyuWaFdBpbO41Q8dcbV6CHTViXWTtDV4
         g0+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=e3S3+YYR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s7-20020ac85cc7000000b0041992ce3a38si6714243qta.805.2023.10.09.14.06.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Oct 2023 14:06:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=e3S3+YYR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qpxSS-0003WB-Fz; Mon, 09 Oct 2023 17:06:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clegoate@redhat.com>)
 id 1qpxSP-0003Vh-A0
 for qemu-arm@nongnu.org; Mon, 09 Oct 2023 17:06:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clegoate@redhat.com>)
 id 1qpxSK-0003zW-Sp
 for qemu-arm@nongnu.org; Mon, 09 Oct 2023 17:06:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696885583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VB6Jffdm+yxNoXKr3ZGZhLr2PFYo5MOa/33khoSwvmo=;
 b=e3S3+YYRCh7dbysofYYDhztKQxxwOxJDBoCfdNkAPEeT02lgVTlzecp28wVyQNTez23fHJ
 /CK/fk8ib2+qXggQ1yHAzK4ByWnzyHdX59YIhpPzlbWYGGclDbXtAXA8AzCV73DURjZnbT
 RKhra2ADGARK0io9Z29lF90uxHm1aVo=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-283-aqGC5iWJNvurCOS_ex1Htw-1; Mon, 09 Oct 2023 17:06:21 -0400
X-MC-Unique: aqGC5iWJNvurCOS_ex1Htw-1
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-65b107812f0so60282286d6.1
 for <qemu-arm@nongnu.org>; Mon, 09 Oct 2023 14:06:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696885580; x=1697490380;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VB6Jffdm+yxNoXKr3ZGZhLr2PFYo5MOa/33khoSwvmo=;
 b=pn4eNtXZSo8r5lOMP2ahXEeu2Bi77X2SmsrqTK9BO1lvEsWjjlcV5WD6s/orLbNkzV
 1dKAlGyqaOYEROlJRQnernpHgmj85kLF8r4fKygmc0yZpT7ktmcLsu9C8pNzIYyAOu75
 HIuRcTD6osIan2nbxcbD98MHGlWruF8wjiuEPewfKprIhSs/dN2FbabSV1yq1KrDuzCK
 VLm1Iio83fDt8A0ld7DBKqhj3B79r94KCU8Qt++/pC2yVPMUm9BiPPW0pjVe23BxOBOX
 kzta+XTFjmMZM6dQejYHtN5HncwOcZNpzzqDjoctLbq3JOM6e1MISzBK9bA73CvLRFfy
 NgHg==
X-Gm-Message-State: AOJu0YzK2OHn+D+b+tjAEYRLWWWnK/0xtwO2jPd/n+MTp0jJ47V6xtSl
 M1nyq/BDaRBtVaooAyt5n1TnIoRo9slDg2teCz4R5qw1LuF/wlkOmpOx2OG34+GjVsKJUpnPLTP
 BZj+6jEpXe+Nw
X-Received: by 2002:a0c:8e8c:0:b0:64f:60e9:9285 with SMTP id
 x12-20020a0c8e8c000000b0064f60e99285mr14527540qvb.30.1696885580610; 
 Mon, 09 Oct 2023 14:06:20 -0700 (PDT)
X-Received: by 2002:a0c:8e8c:0:b0:64f:60e9:9285 with SMTP id
 x12-20020a0c8e8c000000b0064f60e99285mr14527532qvb.30.1696885580345; 
 Mon, 09 Oct 2023 14:06:20 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:280:24f0:9db0:474c:ff43:9f5c?
 ([2a01:e0a:280:24f0:9db0:474c:ff43:9f5c])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a0ce445000000b006562b70805bsm4121983qvm.84.2023.10.09.14.06.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Oct 2023 14:06:19 -0700 (PDT)
Message-ID: <a448bd71-f0e1-0390-8d11-922698946015@redhat.com>
Date: Mon, 9 Oct 2023 23:06:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2] misc/pca9552: Fix for pca9552 not getting reset
To: Glenn Miles <milesg@linux.vnet.ibm.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 andrew@codeconstruct.com.au, Joel Stanley <joel@jms.id.au>
References: <20231005211046.3609577-1-milesg@linux.vnet.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clegoate@redhat.com>
In-Reply-To: <20231005211046.3609577-1-milesg@linux.vnet.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clegoate@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.339, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: YVvqF3ZVKnhY

Hello Glenn,

On 10/5/23 23:10, Glenn Miles wrote:
> Testing of the pca9552 device on the powernv platform
> showed that the reset method was not being called when
> an instance of the device was realized.  This was causing
> the INPUT0/INPUT1 POR values to be incorrect.
> 
> Fixed by overriding the parent pca955x_realize method with a
> new pca9552_realize method which first calls
> the parent pca955x_realize method followed by the
> pca9552_reset function.
> 
> Signed-off-by: Glenn Miles <milesg@linux.vnet.ibm.com>
> ---
>   hw/misc/pca9552.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/misc/pca9552.c b/hw/misc/pca9552.c
> index fff19e369a..bc12dced7f 100644
> --- a/hw/misc/pca9552.c
> +++ b/hw/misc/pca9552.c
> @@ -384,6 +384,12 @@ static void pca955x_realize(DeviceState *dev, Error **errp)
>       qdev_init_gpio_out(dev, s->gpio, k->pin_count);
>   }
>   
> +static void pca9552_realize(DeviceState *dev, Error **errp)
> +{
> +    pca955x_realize(dev, errp);
> +    pca9552_reset(dev);
> +}

This looks wrong. You need both handlers, a realize and a reset.

Thanks,

C.



> +
>   static Property pca955x_properties[] = {
>       DEFINE_PROP_STRING("description", PCA955xState, description),
>       DEFINE_PROP_END_OF_LIST(),
> @@ -416,7 +422,7 @@ static void pca9552_class_init(ObjectClass *oc, void *data)
>       DeviceClass *dc = DEVICE_CLASS(oc);
>       PCA955xClass *pc = PCA955X_CLASS(oc);
>   
> -    dc->reset = pca9552_reset;
> +    dc->realize = pca9552_realize;
>       dc->vmsd = &pca9552_vmstate;
>       pc->max_reg = PCA9552_LS3;
>       pc->pin_count = 16;

