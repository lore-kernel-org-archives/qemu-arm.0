Received: by 2002:a17:906:3683:b0:98d:b2f5:1316 with SMTP id a3csp531902ejc;
        Thu, 10 Aug 2023 02:19:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGb098IH6cWji1PbNEijZuOBoJA2II9eVBHQb5h3zmgeqCnPCstb2+n651IDEo2m9ckGWKk
X-Received: by 2002:ac8:5c47:0:b0:40f:db31:3a8e with SMTP id j7-20020ac85c47000000b0040fdb313a8emr2567945qtj.46.1691659186183;
        Thu, 10 Aug 2023 02:19:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691659186; cv=none;
        d=google.com; s=arc-20160816;
        b=akTjXKIOgzb5q8fkofMxFrryBwA6jeLoMX0aehExtnfzLe+rAnI8SJerAo3GXO6T9W
         6VYbf+HQRx1VhmY/j8Zk6cfba822ZSEdyrYldXFHXqYbpTXj7aBjFp4lyJ5GNssUoRv5
         hDBWmRhlRvOMDqwd7p1dpdgEVaJzTohH0QZJDinUlQ9ZnRjq9zbqyeaUc6WUR1uU2AnA
         j2TM5OwNOEJE19CoXz51RtHXVAhJswZH6LN6D4irXTZNZmFyYy6m6uC66ICh54QM2hgN
         yZ6Io3uUbYkKstXhznd/6kI6nzzQtEhKQwfWVh0bLETQOS/91GsFmcnLXi05Kq2D/HBN
         mBTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Wok+Pb9fiOkZwEwM1AKW0JzsbHPjqCpjF/vuHCX2Jds=;
        fh=zlpASWiFX/cotIFAyrriCRJDmFpobIKVCGxuAsr+eCQ=;
        b=DNqwdEPOpnsEVCBy1RGkFnATDpXA+zPK5QTblQ7Bpn7t/IDSl0A2+VCFbjhezC+o5V
         bgefvuzJyBKsZ7I5Mgv0lR0aN/2/yUtk3OjGlWSOXfQ9vTt+4IbRrBG+vp0gM1nCFbQD
         2PfPnDUj+JeTu9hrvPPhV32gjpl5vvrxB8JCfktipc0ADATnpJiB0mkwnT4zMHg8spRx
         DaQ0RNv3dr8sdI/W64rmbe25nU5b3MdDj8/nckcm9iVSMUY++GADTgHExolT54e1WX69
         PkDSAmySSeoggqtbuvjx/XRtglXUcEyiJByxD8Dm6HY4f5bHZe6zjJJjAqQnYgDVfx9x
         hG8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xCpHOCI9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l9-20020a05622a174900b00403ef121a4bsi646420qtk.733.2023.08.10.02.19.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Aug 2023 02:19:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xCpHOCI9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qU1pK-0005Mj-8a; Thu, 10 Aug 2023 05:19:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qU1pI-0005ME-L7
 for qemu-arm@nongnu.org; Thu, 10 Aug 2023 05:19:28 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qU1pH-0000Wu-99
 for qemu-arm@nongnu.org; Thu, 10 Aug 2023 05:19:28 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3fe5eb84d43so6098195e9.3
 for <qemu-arm@nongnu.org>; Thu, 10 Aug 2023 02:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691659165; x=1692263965;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Wok+Pb9fiOkZwEwM1AKW0JzsbHPjqCpjF/vuHCX2Jds=;
 b=xCpHOCI9wSYk/oK5s2Gf07WLLu/MZ/7xbbGChV1cmi4d6A3Mbt7dD7d1XFeYZp0sI0
 EoTlVfzmidlBdU/NNaGCMkr+wI/hh2S+UeZ9pgcnd8sVuWaZfYseiH66lnbR72kxZ+x6
 vgQnEbVSlfhgDzLUpXemwKdvDQODnzvi+IxFkP5IExDDTBvWZNywAvoQTEu9hQSP16Zn
 QPE/onzWoU/9VsN+XGXdByMJQXb7ktgAs6kHz8xI/B3CmQxOh/pE5NltRsaQohWc8ImN
 spRTE4kFIRY1D+/8ELP8u+48TFGuewhcyMx1VF9w8fvLz8QIcugpNAFb+vc3BEIOGJ9e
 Pvmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691659165; x=1692263965;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Wok+Pb9fiOkZwEwM1AKW0JzsbHPjqCpjF/vuHCX2Jds=;
 b=ONbxqhrxWqaviRm3ZLWEhLc7mTC5xj81galvCgyYWYTwhDyuePZzXxvBmnmwPjQUa/
 u1chZDmMqIoaOqK5N1AfBUrEV9OV5+NQoIgx2xOGkl0WXZapa1/1k84IUu1jxjdEN486
 M8XypzkK9j84+uN1toFhKIcq0/2lQDK1d4sh8jqZSNIwLoojNTwlw5PueOoFJKKAlCl+
 iEkEtYU2LidE5rLDRye9Vxtu+Qe/l2X6VsFj2+UIM6U7roLC606Nr+TMsptbsICL2eFi
 iZzPVbqfXDyWZewLGj7cDB2yjEOKnvbYyryUnKb3JA1QAbdCNOKGSsbpXuHciLBGwvyc
 Y0NA==
X-Gm-Message-State: AOJu0YwGO7gwYvgf0PenBC6XBxkE9svrgyv1soby5R+EqsSBsVw3XLHD
 FCOpPR1ZNQLI4gEN2PW0s44+0g==
X-Received: by 2002:a5d:5150:0:b0:317:618a:c72 with SMTP id
 u16-20020a5d5150000000b00317618a0c72mr1748150wrt.64.1691659165318; 
 Thu, 10 Aug 2023 02:19:25 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.158.65])
 by smtp.gmail.com with ESMTPSA id
 i8-20020a5d4388000000b0030647449730sm1499723wrq.74.2023.08.10.02.19.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Aug 2023 02:19:24 -0700 (PDT)
Message-ID: <509ea8c8-a9bd-ca90-ee07-832039a5bd25@linaro.org>
Date: Thu, 10 Aug 2023 11:19:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH v5 4/6] accel/kvm: Use negative KVM type for error
 propagation
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Richard Henderson <richard.henderson@linaro.org>
References: <20230727073134.134102-1-akihiko.odaki@daynix.com>
 <20230727073134.134102-5-akihiko.odaki@daynix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230727073134.134102-5-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -61
X-Spam_score: -6.2
X-Spam_bar: ------
X-Spam_report: (-6.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.14,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: EN4xPBQMs9yZ

On 27/7/23 09:31, Akihiko Odaki wrote:
> On MIPS, kvm_arch_get_default_type() returns a negative value when an
> error occurred so handle the case. Also, let other machines return
> negative values when errors occur and declare returning a negative
> value as the correct way to propagate an error that happened when
> determining KVM type.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   accel/kvm/kvm-all.c | 5 +++++
>   hw/arm/virt.c       | 2 +-
>   hw/ppc/spapr.c      | 2 +-
>   3 files changed, 7 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

