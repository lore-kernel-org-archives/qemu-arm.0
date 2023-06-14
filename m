Received: by 2002:a17:906:ae84:b0:982:368b:d395 with SMTP id md4csp1046673ejb;
        Wed, 14 Jun 2023 01:12:56 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5iAnwZ+Ek0KMQJEymDg142lGCvNfiO7UlhGpR5TGkg6lSmoqn8cV2vqRNpRtBlsNGgogDE
X-Received: by 2002:a05:622a:1816:b0:3e4:dcb4:169 with SMTP id t22-20020a05622a181600b003e4dcb40169mr1635836qtc.16.1686730376238;
        Wed, 14 Jun 2023 01:12:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686730376; cv=none;
        d=google.com; s=arc-20160816;
        b=rNZpzCmfdX0MHX5984KqiovE9eOyADKo+hPDOvwOxgyPj+Wj5tGwkVwqQwouhi2met
         4GXeB3PQEuIDX99Kkq0sW+qHuv45TCuiS0AUfN7/uemD095u+ydJJcG2OBll57liOE70
         vaDBO9s1EcXYZsN+FbfNwXBvk1PBk8KwaxKaO83vu/P1xPnlu7xkbsKVQkbfwJXLPEXL
         K6q8hVof0JmHf+uRO/17JRRBbJjtlLdNZlGx1aWsKxr9EyBxfk3GR9SulTT+FusY8lvI
         fDVN8SabwqH+UuEmDlSEjnhCXBDBafVAL0yPeeHcqpD/pZNEjkkD9R2COj2ydKKmcxm0
         bqhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:organization:from:references:cc:to:content-language
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=WKzNFZIdAnfIeuFjQBvoFl5Yqdjnzufg9J/XNJG8l1A=;
        b=eLpkGGAVZ+aVzt6Lit0K484srz5TPj6Tha24pVRY+GI3v62Vi+hYziOcnnI/wvSoF6
         nKFa8zTgnpg32MsMYe0HzECBaAZWX8WGkaqwPEKArwvckoWEvHTuzGaFJrNHko20mzv3
         R+Hj4/B6QuArerByRpxlwOSLI5xNNKy4WnSCFN27KWkyS4RMfZIssqL+xwOeS1ltgjFl
         3KOGTUvAviVhFaT1b7FCFik5LJjoVgG8tezX6ziu1StlBt33Kfujb2RTFiH5MFik3J+1
         ig2aJkGzB6Xu4ZguKCEYzIeptQVJmHE+Bh/488M0awfnXnvYz4I7LJaLi8p1ERZ0wGgu
         r93w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T9OqN9ZQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k12-20020a05622a03cc00b003f3e1e4d347si8436701qtx.138.2023.06.14.01.12.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 Jun 2023 01:12:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T9OqN9ZQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q9Lc8-0004c0-D6; Wed, 14 Jun 2023 04:12:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1q9Lc6-0004ba-TQ
 for qemu-arm@nongnu.org; Wed, 14 Jun 2023 04:12:22 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1q9Lc5-00042E-Cw
 for qemu-arm@nongnu.org; Wed, 14 Jun 2023 04:12:22 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5151934a4e3so9506832a12.1
 for <qemu-arm@nongnu.org>; Wed, 14 Jun 2023 01:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686730339; x=1689322339;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=WKzNFZIdAnfIeuFjQBvoFl5Yqdjnzufg9J/XNJG8l1A=;
 b=T9OqN9ZQAKu+nJWPZDSsUY0YvyltAM3mANsfcH7Tnlssb+4N/gSSbHi7a3CLeUke2q
 TtijUjDVRrTJk22aHZHbqGr2p5x+7zKagybQLVf7abYUFyH32jWQNV9j9zbE+PZx3jdm
 o3G3OM72rIyqeQkRxYoOhjd0OpaJtHj/v4SQtZhdg9Y8FO63XyLiSdLJOIUYcV7LgeOJ
 k0n3eo8ib2fPFsym2xjvQ6kD8RJRZ5inD1a9h9HS9Xu66C2G8lO48QiUmZaMAauueUB9
 D+fyuGG9Zfk1FHjBL/waDXLw1aO4hPBG+YNNmuJWD/B/lQutqYmO8uA92waA8f2W2YfO
 ZUfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686730339; x=1689322339;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WKzNFZIdAnfIeuFjQBvoFl5Yqdjnzufg9J/XNJG8l1A=;
 b=TRjTMFjlM/5CFAhsWni2Vy2nt430NvUW/8/KNy971LG3Dksre6Ye0Ir6KCG1ynW6gB
 DXi8L645UAngyegZRHgOlgeXvmW5kAzN65XrR2ebuufIYZ9FcbHoTnLqzuAIGZSBJal5
 lVvXbmyT3BGXgMdvlg7Y4jKlSvtNLKPbl7Q59+IAgBA5kMjDCO67kDVYzL/SaW5jHrqT
 +UE3UkN3ymfuejDljO8ZzbY7e+c+E3IbGIvuHcXJTVhXzRK9qE64sY/uTl00c64WGClj
 tlWvXrjBxjTFqgXDVg+ea0ibZabwpmmmv676s0kkFzG9NMndcK92jHsywWIPfPTYXLC6
 Kesg==
X-Gm-Message-State: AC+VfDxfP+Q2D/zewly3CQ78AkUmLByb/+3FxDMmCriu8ScQ5aS2h9Xt
 5DNFp77AGj0fxPIdPlfG4ndGng==
X-Received: by 2002:a17:907:72c5:b0:981:ca85:2c9c with SMTP id
 du5-20020a17090772c500b00981ca852c9cmr8775543ejc.9.1686730339178; 
 Wed, 14 Jun 2023 01:12:19 -0700 (PDT)
Received: from [192.168.200.206] (83.11.39.176.ipv4.supernova.orange.pl.
 [83.11.39.176]) by smtp.gmail.com with ESMTPSA id
 ha19-20020a170906a89300b0097d77a5f033sm6165037ejb.24.2023.06.14.01.12.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jun 2023 01:12:18 -0700 (PDT)
Message-ID: <5e19d457-5658-edf4-855d-a8fc6dac5786@linaro.org>
Date: Wed, 14 Jun 2023 10:12:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 1/1] hw/arm/sbsa-ref: use XHCI to replace EHCI
Content-Language: pl-PL, en-GB, en-HK
To: Yuquan Wang <wangyuquan1236@phytium.com.cn>, rad@semihalf.com,
 peter.maydell@linaro.org, pbonzini@redhat.com
Cc: quic_llindhol@quicinc.com, chenbaozi@phytium.com.cn, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
References: <20230607023314.192439-1-wangyuquan1236@phytium.com.cn>
 <20230607023314.192439-2-wangyuquan1236@phytium.com.cn>
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
In-Reply-To: <20230607023314.192439-2-wangyuquan1236@phytium.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.098,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: fKQWj/EHaPZi

W dniu 7.06.2023 o 04:33, Yuquan Wang pisze:
> The current sbsa-ref cannot use EHCI controller which is only
> able to do 32-bit DMA, since sbsa-ref doesn't have RAM below 4GB.
> Hence, this uses system bus XHCI to provide a usb controller with
> 64-bit DMA capablity instead of EHCI.
> 
> Signed-off-by: Yuquan Wang<wangyuquan1236@phytium.com.cn>

Reviewed-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
