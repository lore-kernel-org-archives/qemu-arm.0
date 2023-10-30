Received: by 2002:a17:907:d043:b0:9d0:bf65:29fa with SMTP id vb3csp1613093ejc;
        Sun, 29 Oct 2023 20:24:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1x/IamQOtXncrU2RVeBcHmzNmzDVpOpLw7M0Jsc1YJJvZp49T05oc4fWkUZ51VNpxTLGu
X-Received: by 2002:a0c:aa05:0:b0:66d:99cb:a15 with SMTP id d5-20020a0caa05000000b0066d99cb0a15mr8273900qvb.28.1698636264669;
        Sun, 29 Oct 2023 20:24:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698636264; cv=none;
        d=google.com; s=arc-20160816;
        b=M2W6kZtRPzcSp+6oqYi8WLAkEzY57O7qeI2ZPb++wQDGJbrx/onm7+Fkwt/9mLhJsg
         Drfg0Eb0iTOWVG6VFZ3pfwYTSB3kP4INMcCj1u9CM0TMz8FfSKfd39eAZaHBX+Yp/MPE
         amZ1XiENyxMLHzeebyFZ1HQDY5M14zI9Gq+AXhU0Rvdzt4VQZ16DRc+r6y9D8oUGY1I0
         qVoDtDv+NgY8pG9kskuSYnvmVJFiD0Jp6LQxRcucJdmR1XR6bopoZTVd+AvkUgBXgUCB
         Wxv6uXdWNykN5UX7wJad06gR97/Q036mmdXtJKPjwJxtEd5Dq6Xh3F7GVt8FeW4aJU1s
         hHOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=TUZOix7+S8UCeIxe9GrXyoIQmjmVxlOACYTBe+fKbC8=;
        fh=Hg5GsWkkEURgb3z6bjzv30cpIevLjynGSTcy1gDgd5w=;
        b=MmVCcojLwg6kPDn9sbkRq32CGBlu8L+BXbjqDvb15ZErc/ybIX5+13MZN/PTNWfrrW
         cNkTRj2V5nug7NB7b27OGPnw9YNOlrZuXn/PiTkzL0iCCUxV0W55G4bLf0LbMhRJ8qlK
         mWS/SSsPknmDgtNqdLXchvsJ2K97miEGfcNrrKBh2QS9DdTFVrPVkAusXrthJvE6gJIF
         JVazYhf9QyL0iU9XvQV/OeXH7cXn2wSwpJz90BNwUn+ienaLVJ71eq6Acc1v/Eri/WwT
         FibwVifSuBQEwCbVz2HNrkM8oNsAlZ++3pk/8C4r+SfLM2+ExHdBZEMVwKs6hoCGB7Dz
         UaWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dwTDjxbB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y17-20020a05622a121100b0041812c64671si5010462qtx.487.2023.10.29.20.24.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 29 Oct 2023 20:24:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dwTDjxbB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qxIsm-0000LT-A4; Sun, 29 Oct 2023 23:24:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qxIsl-0000Ke-04
 for qemu-arm@nongnu.org; Sun, 29 Oct 2023 23:24:03 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qxIsh-0006wN-Ux
 for qemu-arm@nongnu.org; Sun, 29 Oct 2023 23:24:02 -0400
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-9adca291f99so593351466b.2
 for <qemu-arm@nongnu.org>; Sun, 29 Oct 2023 20:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698636238; x=1699241038; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TUZOix7+S8UCeIxe9GrXyoIQmjmVxlOACYTBe+fKbC8=;
 b=dwTDjxbBSpvszEPAjqoCzlNC0dYJQP/hxe8owDLhjouYX5/jlffT9MgHEQGQKV9kLz
 Hae01k4Rua7lfBYDvaLp8T1zEWs4Ixfa7C8UGWYudE//LM2Z4681E9VWqym1GqvD/puh
 bm11kHrJrAi3hrW0Ahxw73VykrICmrHErlbFzhi29mpwVfcdu8nlM9q61VtZkOrnXHay
 NK+eVdHemBBLHU1jKg3F1U8Czr8OuLtb505L3dcpuni89Ugn2vCSK6Am/NAQti3m0m2q
 uVlIoalBwPqUQrnbG1zzWUZrHvPx009kVvkyGRgbVKsYpcwcp3p3LgewHXFyDZWMk6h+
 DjKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698636238; x=1699241038;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TUZOix7+S8UCeIxe9GrXyoIQmjmVxlOACYTBe+fKbC8=;
 b=UoVm4PK3AtyjpJsgYDvITBHXCgy9O8mlabgcdHN+Dhae3worsgyZTmKyBFsbiQHVVN
 08gfDZPrKLiosuQgg5P+QML+ZHTOU1MfxbssUvjGX5gPeXG8p67VorrNG1ViuUKESaj7
 XHbtweO9T8ixnKzwKadanJCu20fnmjkv/Cf7G1k1kN34u9pm0jkQrsTKlXlQsaTRiwpK
 rQlrsI5WFph3QrjX+TQQQOEt3r6f5doYFTjwK6So6s9BuCO+PqcoQ4yQV7mNRhqfJ4BF
 4NER3HFL3RtnPHZ/peJ/wuFlQ4U+JkH5npicQq9VYqJXqKNa6B6AagSgg8mwg0VooxrQ
 A4zQ==
X-Gm-Message-State: AOJu0YzSAnqHG6/G3je1/g/2GQA7kJizOWqHdb/FAXR/RP+t5lVGM7+q
 jNiT8F3Zfo/by7AknIJXQL/ZIQ==
X-Received: by 2002:a17:907:2cc3:b0:9bd:bb63:49db with SMTP id
 hg3-20020a1709072cc300b009bdbb6349dbmr8459604ejc.7.1698636238037; 
 Sun, 29 Oct 2023 20:23:58 -0700 (PDT)
Received: from [192.168.69.115] ([176.170.212.50])
 by smtp.gmail.com with ESMTPSA id
 q16-20020a170906541000b009adc5802d08sm5286362ejo.190.2023.10.29.20.23.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 29 Oct 2023 20:23:57 -0700 (PDT)
Message-ID: <7e52e29c-46c8-483c-cf5a-b6e6ca18c655@linaro.org>
Date: Mon, 30 Oct 2023 04:23:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH 4/6] hw/misc/imx6_ccm: Convert DPRINTF to trace events
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Mads Ynddal <mads@ynddal.dk>, Paolo Bonzini <pbonzini@redhat.com>
References: <20231028122415.14869-1-shentey@gmail.com>
 <20231028122415.14869-5-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20231028122415.14869-5-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.972,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-TUID: wl4+JJIMReFs

Hi Bernhard,

On 28/10/23 14:24, Bernhard Beschow wrote:
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/misc/imx6_ccm.c   | 41 ++++++++++++++---------------------------
>   hw/misc/trace-events | 15 +++++++++++++++
>   2 files changed, 29 insertions(+), 27 deletions(-)


> +# imx6_ccm.c
> +imx6_analog_get_periph_clk(uint32_t freq) "freq = %u"

Preferably explicit the unit, as "freq = %u Hz".

> +imx6_analog_get_pll2_clk(uint32_t freq) "freq = %u"
> +imx6_analog_get_pll2_pfd0_clk(uint32_t freq) "freq = %u"
> +imx6_analog_get_pll2_pfd2_clk(uint32_t freq) "freq = %u"

> +imx6_ccm_get_ahb_clk(uint32_t freq) "freq = %u"
> +imx6_ccm_get_ipg_clk(uint32_t freq) "freq = %u"
> +imx6_ccm_get_per_clk(uint32_t freq) "freq = %u"
> +imx6_ccm_get_clock_frequency(unsigned clock, uint32_t freq) "(Clock = %d) = %u"

'freq' is uint64_t, but I suppose 32-bit is enough, so I'm
not against the implicit cast.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

