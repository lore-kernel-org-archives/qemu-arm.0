Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp3499632ejb;
        Tue, 6 Jun 2023 06:47:46 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5rlPOtDsWqsu0epJGiDiJ/a7FjKwWpltzg0l3T5NjCdCXnvKCcVgrMm5vOkEx9EV8A4+RO
X-Received: by 2002:a05:6214:765:b0:629:e646:bdbe with SMTP id f5-20020a056214076500b00629e646bdbemr1746440qvz.24.1686059265778;
        Tue, 06 Jun 2023 06:47:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686059265; cv=none;
        d=google.com; s=arc-20160816;
        b=iZN70DHP4VB3Kx3TNRCF2+OBBP5WhaAeXQcFZG9ggmunah1K2ON4fyPnY+ghvhd5YH
         +0RWBsVfYXRbIQCm1REB1bymhLx2vgmQUq9Zqa+WI6MgX9ygePO1taB/f/AqX+WsL4Sv
         YlWAUTWpbRCJu0XttM+r0nze0K62LQKdI9EwnhqPNcw8l8FQZqe0RT4LVc+j1wvZm0SV
         8V//YU49SX5qohIkVmWH2ptH/CQpuCOzjw3nW29VXZYRF4dBZXf7B9Qfk51nFVYXbqCS
         vy/bB0doXvXY7vlXo0ibL5WpzSXOwUP/5hoxLNTe02FK/TiniZ9t4P8icRV/EWlh13tO
         Tq/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:organization:from:references:cc:to:content-language
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=uX22wGQTarq3hyB8jiingQotPaacT1JRBeq8d/0Q2Ag=;
        b=c3UaT4f1NnGHhgzzSu5mook6Idddok0aeVykUaR+GByGSqWRrcjBGV6LYwfsO7RrSc
         u516PfPELFQBmqM/cw4W48PKcMlH2h1YkhI3vlysXC36RjyBRqNwfbVFVpcPovTjW/yA
         3SrnIM119MFIG4uM1pGQWj9NdvfuT1zabZ1zt2vB3BwzlROB72XEfGkt/Seo0NGHf0xf
         7J9BAm2DRaiWPlybkvjughKwFCWB8RtKQY61wgcUCrnlyRY3H/CFqjkvoHYlfWZR4HS1
         I0ZCd1sLKNsxFR36xLIGknKYrppGNUb8stWu60Z8ET+xRuqnOtweI/GFouIaTQMXEUcS
         v3Tg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qFOqutHV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j17-20020a05622a039100b003f3900226a0si6474457qtx.21.2023.06.06.06.47.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Jun 2023 06:47:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qFOqutHV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q6X21-000168-7J; Tue, 06 Jun 2023 09:47:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1q6X20-00012P-1r
 for qemu-arm@nongnu.org; Tue, 06 Jun 2023 09:47:28 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1q6X1u-0000DU-1M
 for qemu-arm@nongnu.org; Tue, 06 Jun 2023 09:47:27 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5147e441c33so12585906a12.0
 for <qemu-arm@nongnu.org>; Tue, 06 Jun 2023 06:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686059240; x=1688651240;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=uX22wGQTarq3hyB8jiingQotPaacT1JRBeq8d/0Q2Ag=;
 b=qFOqutHVgpygBNGER/o/RItcrwQuG9fYa5uL33jqqIWS5AHjCb5U1RYLbWu/07udCO
 wK8UCAzCtZMTDre6DET1Oy6YYW/8jGDhv/wB7b5iuVEAu1IRmvpT8Ksgk9ENVwb6899b
 /4RlohxWGEKEDU9xPfsmJ1LpDd5pPh54zDLrkWohzr9Mxe7EhwWVy+SZJuXYC8ZldiOW
 /fOjlaXVFyw1Hq3l9ZRneEtIUv80+FuBVe7JPi9WEBFdhdvYUJWkIpX4p0/OlYUmj9kY
 Rp446BQ6Pm+5Y1yyOIX6faqt7FxOOfig2DuSc3XOuQTDWTyBXot/z6QkazErdw0oN/RJ
 t71w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686059240; x=1688651240;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uX22wGQTarq3hyB8jiingQotPaacT1JRBeq8d/0Q2Ag=;
 b=U3RlPVSPYSeSb4v+0L5xQlRxCW2LvoskP84CHm0StJ9Qnq86jG9udLpC52IopQh6W5
 IEwfR5ph/uF5AqmRsywL9qwRDWV+vmQacuZ44d9NTl6eq6PLOnbmguESfCv4Y21aExTn
 PCa2o63dmrG9ly6xtJ7F88144d93PyxQjqBZoJQNSVfEuwSXgqDX6Qxk0ih9usWm+WSm
 JDnPj1k1P8DVNMy8gSxyMxaIkYHQ9ZbSw6OJiONXp5Q8grXN/Rvx7bshId9vra62YE28
 RcldCVN8u2810rzlZ1Ma2GSuS1h8ObHLucJuRQwoB0XIvcNnonKoU1e5D2xY5Ih5vviS
 Q3Ww==
X-Gm-Message-State: AC+VfDxuc+QC6z8ZcKXKjJhz2/VEjKh63VDD3Z/YdVInKpUtFHLdB59L
 DvJoQUP2srzsIPsLm99VenvomQ==
X-Received: by 2002:a05:6402:184d:b0:50b:7959:8b09 with SMTP id
 v13-20020a056402184d00b0050b79598b09mr2566721edy.15.1686059240322; 
 Tue, 06 Jun 2023 06:47:20 -0700 (PDT)
Received: from [192.168.200.206] (83.21.93.182.ipv4.supernova.orange.pl.
 [83.21.93.182]) by smtp.gmail.com with ESMTPSA id
 q22-20020aa7d456000000b0051631518aabsm5014340edr.93.2023.06.06.06.47.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jun 2023 06:47:20 -0700 (PDT)
Message-ID: <1bf47953-8589-a453-5e05-6b36b28f4fbd@linaro.org>
Date: Tue, 6 Jun 2023 15:47:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 1/1] hw/arm/sbsa-ref: use XHCI to replace EHCI
Content-Language: pl-PL, en-GB, en-HK
To: Yuquan Wang <wangyuquan1236@phytium.com.cn>, rad@semihalf.com,
 peter.maydell@linaro.org
Cc: quic_llindhol@quicinc.com, chenbaozi@phytium.com.cn, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
References: <20230605095536.117384-1-wangyuquan1236@phytium.com.cn>
 <20230605095536.117384-2-wangyuquan1236@phytium.com.cn>
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
In-Reply-To: <20230605095536.117384-2-wangyuquan1236@phytium.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-TUID: NTqU98C5c4TM

W dniu 5.06.2023 o 11:55, Yuquan Wang pisze:
> The current sbsa-ref cannot use EHCI controller which is only
> able to do 32-bit DMA, since sbsa-ref doesn't have RAM below 4GB.
> Hence, this uses XHCI to provide a usb controller with 64-bit
> DMA capablity instead of EHCI.

Please also modify hw/arm/Kconfig file so SBSA-ref will select XHCI 
instead of EHCI there.
