Received: by 2002:a17:906:494e:b0:982:8c08:340e with SMTP id f14csp2732750ejt;
        Mon, 19 Jun 2023 03:31:39 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6BDaPtDQY0RlNxGeK+MaoQn+8dz7vVfeaz65Sv8ClmfBTXi0NuWjr5Uhp20BOUanxEMkMD
X-Received: by 2002:a05:622a:120a:b0:3f3:91bd:a46d with SMTP id y10-20020a05622a120a00b003f391bda46dmr12641929qtx.8.1687170699212;
        Mon, 19 Jun 2023 03:31:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687170699; cv=none;
        d=google.com; s=arc-20160816;
        b=vZGJOJpcMEAGFsFoYWl3roi5LUplkmAIZzJdWosfKWq2ghh8ui9yWVj0pyySCe9oJG
         rKs1IeLxj8JLlOYug0iZYYVXJm2vdVhoB4FvIRa59GVt2hFW178+CeUZuzcglMy/Msow
         Rdz58Y+aRUAwBthXK417Kes+AylY1B+xtnznZj1xM0JUfVHMUdHOXy3Q5lWun/TfXh2r
         AZGCmnn3S7kOkxU/qqv4kzPU/k4gEvYANFQVXAEpA0VKUUvqUyHm5uxFevJxeY47CymT
         AHU7FSxoQIHgM699U6izphrt/sJBXxhmVklH4B0OpXB/1XwBE12amgVLhf8Z4+IPwtlt
         TWUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=lUfXjtLupSMJ3yKze1TTHyJxYmZY2v9n1/dVIXXT3Os=;
        b=DiFBrIaD3TwuhjxeRYRH2wM25VsZWAwnRmxfSBPzlef+t+3P8WlUcRGRHwIzW5fiFl
         HUjZBh0qk07RGsdIUFL60dVVpHCR/TenWrf2wP63oFHtQDJ/qAwnxGm/EKUWZWfzyVB1
         5sr5DdCNAfqljttVW3yTds3pZru5mrPNsjfQcoP1HKTuKW5odD4sDfG5tTTO+QzNYmrU
         Nd4kOzgPox/Cjf4BvzIi3okLyGdp+97F4evGbMHIDwEr01u2BPGV46sSoF/4m+wrYXb9
         Xu7FyRMtvZIRWpG7CGw6Su9vNTfTp2BCRELj26dbSmtH3i5Ga1LwNEPZRSaDbjrsR0DM
         sJhg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AHIOLvit;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s28-20020a05622a1a9c00b003fde98266dfsi1779540qtc.81.2023.06.19.03.31.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Jun 2023 03:31:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AHIOLvit;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qBCAH-00049C-0n; Mon, 19 Jun 2023 06:31:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qBCAE-00048o-Ez
 for qemu-devel@nongnu.org; Mon, 19 Jun 2023 06:31:15 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qBCAA-0001Ml-Mk
 for qemu-devel@nongnu.org; Mon, 19 Jun 2023 06:31:12 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5186a157b85so4815161a12.0
 for <qemu-devel@nongnu.org>; Mon, 19 Jun 2023 03:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687170669; x=1689762669;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lUfXjtLupSMJ3yKze1TTHyJxYmZY2v9n1/dVIXXT3Os=;
 b=AHIOLvittp/uGRekx4MQUhBhNMP58/jgmwrmmz/dAHLcB1b8jEtnAI44RUMhWdc4Ye
 vM0k0T88ChrGNBP5zUDsMDxF3vCUgte2Mu5UJF/rxvqc8rkp6s3asnuzCtn2SPV97Mxr
 1VB8iZGa2ozF1MzYWXTKy7QuaKdXGV5Yd6FOQeiYrWZtFnBKwYvRN4+p9zni/VdbO5o6
 BVecSCC/Wua1zCbPDzhMCg5XkVeBLlhY4cepkrwhV7R5UMr4kswPLTPIKCzTCXEWLkDl
 hZRkuyynp/Yz+K9WgaJ0zA+AVGkCqKbQo7WAVmzpQ0pYjQwBHvgq/AYxubfrSY+sAv73
 E/Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687170669; x=1689762669;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lUfXjtLupSMJ3yKze1TTHyJxYmZY2v9n1/dVIXXT3Os=;
 b=PQD+K6wez4MBjdnLeTrU8V7D5CoBW5Nw1YXaaucECeScnovxrXD87jStudmTFrup7g
 KkBQdBGuGsbKFilbOvR+o/+QZOjX9B1CNu6Bkvcj8ZAy/ZhZc3WfxF8LKotH4daBUJYw
 5mHcbf92SNgxT1OJuxW3laGLPaHiZnfa49JgNEtp/DCP0kaecvZijHoRg33QLGpB3acH
 Xa5C8MAkeiNfAn20x82ycoDFmktTaipWaJYPVC4ebTgKVg6NgZJDferz4dbUiMwNPtCD
 1k88QcLNR3F+kPrCS6bwYyyVM1rUE2tqRhYSVQ7S1L69xpod5eLq35PL1+Ppt1zrNlIe
 6ukg==
X-Gm-Message-State: AC+VfDyVjrhxg/KZbUslqKzxXeYQyUtH4VR7yMkx2hedgT6lW8hcxVUZ
 mzh6GT2xZIUWLQP71Bt3ZwNLVFbh0KcL/3qbEtjtNA==
X-Received: by 2002:aa7:de12:0:b0:514:7f36:7092 with SMTP id
 h18-20020aa7de12000000b005147f367092mr5889917edv.12.1687170669144; Mon, 19
 Jun 2023 03:31:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230607092112.655098-1-marcin.juszkiewicz@linaro.org>
In-Reply-To: <20230607092112.655098-1-marcin.juszkiewicz@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Jun 2023 11:30:58 +0100
Message-ID: <CAFEAcA-Z0QR3eLaqTuzJBbjocx2LournYAsWwZgCrK6UFbRZkw@mail.gmail.com>
Subject: Re: [PATCH 1/1] hw/arm/Kconfig: sbsa-ref uses Bochs display
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 9/utg+qoAyZX

On Wed, 7 Jun 2023 at 10:21, Marcin Juszkiewicz
<marcin.juszkiewicz@linaro.org> wrote:
>
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
>
> ---
>  hw/arm/Kconfig | 1 +
>  1 file changed, 1 insertion(+)



Applied to target-arm.next, thanks.

-- PMM
