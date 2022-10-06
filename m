Received: by 2002:a8a:1930:0:0:0:0:0 with SMTP id be48csp703966ocb;
        Thu, 6 Oct 2022 12:07:11 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5QWwE2qyvyPuemtsd4F8V/KSznPdXoCUzJzaSdWbynfKZq9Nw44K3bwe/m0xJ4rUT+FWFM
X-Received: by 2002:a05:6214:2aa6:b0:4b1:95e9:f948 with SMTP id js6-20020a0562142aa600b004b195e9f948mr1205384qvb.129.1665083231255;
        Thu, 06 Oct 2022 12:07:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665083231; cv=none;
        d=google.com; s=arc-20160816;
        b=XyPOVA9v+msmUBepBOsnDr92MLiOCiW25k6k7Kj4vwLPZZ6CsyAM8w8s2QtpUHf4r2
         gH7CkuLkvd5y8c8JgfDgljo4kTszAilQeQjY26QwxoKoAWMDcLO6PXFTM0tT+VcTbiaL
         7AMWGyasu5pOWrrmcPmR+hfcbC4/nLlah2LJoPOgDURuASnLe/yxvtIzP+k23hhi0Q9W
         LZCkDCgVMW38OC6StPG56hIfHgpAMspaSkjqbDcPr65CMirPOWeG3O3ICqnbJzXkJijI
         g9xSSkiC3T7rcHxQ0Afo5cvIGNyaybp0QqoWlSfKmD53ziOg3sOcYb4tRNnVEaD2XMU9
         fn6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=bSF30V8eSnQWtJkjBX6iOQToqueoUcs9p30LyXyuWIk=;
        b=K6aTYJ1OuIhA+n2NcBYnFZinTHxibuxaC+eoOq38hntzwa9weqQxCrLveYL4fR6DWU
         CzFr/kF37Fhe8YfJUnzaKIyTHZemKTb6vx3AV1qQN4/RYVt29WrwlhEJQdj3sjUkhYSp
         qRHmPlXFhOhqGRrI4uw6Ggw1m8ZmFk0am7jk758xFaxPv4ml7ddbrXuY+rXd4nBrqCca
         Baps/1k9RpvjJYs8AwaPo5u3yWnst1P0skq+Z2xfmseuvH+3mHqttKvfihq5jfh5w2xC
         BYqTugpqIOHg8otZwKZeQZeZsvuPy/E8dZEgHgnIloz/lWyQv59+VVicMX8AEIe3Zh5s
         evcw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vV+z5X2P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v13-20020a05622a188d00b003436719dc25si246038qtc.590.2022.10.06.12.07.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Oct 2022 12:07:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vV+z5X2P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ogWD8-0002Ck-Qk
	for alex.bennee@linaro.org; Thu, 06 Oct 2022 15:07:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogW2I-0002c4-Rb
 for qemu-arm@nongnu.org; Thu, 06 Oct 2022 14:55:59 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:33312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogW2H-0007Ng-Bb
 for qemu-arm@nongnu.org; Thu, 06 Oct 2022 14:55:58 -0400
Received: by mail-pf1-x42f.google.com with SMTP id w2so2948006pfb.0
 for <qemu-arm@nongnu.org>; Thu, 06 Oct 2022 11:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bSF30V8eSnQWtJkjBX6iOQToqueoUcs9p30LyXyuWIk=;
 b=vV+z5X2PNJL0qjE9qIATTobw8gS9GCgJszRMag5tV/froCAB/0coBUVVI9SZlyAqb/
 +4x4afsjjTFbriHCWDzMDo9bAde1v6VkUKY20HU1ChR7d0pSFb+3D48t554mH4jpkpSW
 JTsz4SllaIg/ePivY7cdZ7LZiRNGtT1vYlnuN9KYD4kMjUVGjkn2tG1q7LmKBkw4BiJr
 84D9cp0dLo6tai3BefX9PDu+Cy4BdetHL/CEhn7ZfvNjSjpQET/E1HQHpgOcvEqd6ymt
 3N0G5Q4m4+EjpM02ZQHIS0iFH2R9moHaCpZyoXkzHgiV0inZzCjDZ0+PT1hksH6Hhtlw
 OOIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bSF30V8eSnQWtJkjBX6iOQToqueoUcs9p30LyXyuWIk=;
 b=VN/kRhUcun36edTq71dcb+i0Ac57I/OmzirH4S+MCy0iiwHK16yik0p38AFoA6iM8R
 Eim9Y+ljgmGHz61R6Yme4b0JSGnK2LOn8g1GTfc5mlC+kOnL1YZdq8wyMIkyU05RPZzB
 v/iT4nAaUh8aFnWmTnnclk5x+1J9lXE5dG83yhs9sPNevwryEPLAbX25fCQzqG69g9g9
 VR50+NR2++gGbrSZK84DHdS6kxXXMLpW5bV+6RISTUfkf93vqh67bA/vDBuxuzZ3hYQp
 PlWdzvJnfC9N8fFZjrOIxaTCFMfjJiQ+5CFXljNTOxC8fN+nWZqFwww4QpeAYBodC0Rz
 wgsw==
X-Gm-Message-State: ACrzQf1pHTAPI38oY0gLgaHud04RxukssYnV961yfAlEvMVgPT1NVSlD
 llgnEDCEEh6bQTIU6KEKtBhMruSCp0SVpNpTQYdnl6/UiDk=
X-Received: by 2002:a63:2212:0:b0:43b:f03d:856a with SMTP id
 i18-20020a632212000000b0043bf03d856amr1093525pgi.192.1665082555885; Thu, 06
 Oct 2022 11:55:55 -0700 (PDT)
MIME-Version: 1.0
References: <20221001162318.153420-1-richard.henderson@linaro.org>
 <20221001162318.153420-2-richard.henderson@linaro.org>
 <CAFEAcA_LSd9mPFiDHyofdHVq2kshiL6FjxNG2aSXXc8jkGb3vg@mail.gmail.com>
 <ed6e925a-ea37-5575-bc3c-aee2a887d5bc@linaro.org>
 <CAFEAcA_8Fc5033cRHp9rhgnX4spUsGNPxAdYRNtiE11Beg4w9A@mail.gmail.com>
 <7339c803-8cfb-f2c1-bfbf-b07aa4f596f4@linaro.org>
In-Reply-To: <7339c803-8cfb-f2c1-bfbf-b07aa4f596f4@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Oct 2022 19:55:43 +0100
Message-ID: <CAFEAcA_ch9xe0gTQipKg-QMRorZjS6=OKqfRn=WhiSxTsqFe2g@mail.gmail.com>
Subject: Re: [PATCH v3 01/42] target/arm: Split s2walk_secure from ipa_secure
 in get_phys_addr
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KnKfEhYsFxQJ

On Thu, 6 Oct 2022 at 19:20, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 10/6/22 08:22, Peter Maydell wrote:
> > Yeah, cleared-at-start is fine. But here we're also relying on
> > the stage 2 call to get_phys_addr_lpae() not setting it to 1,
> > because we pass that the same 'result' pointer, not a fresh one.
>
> I clear it first: that patch is already merged:
>
>              memset(result, 0, sizeof(*result));
>
>
>
>              ret = get_phys_addr_lpae(env, ipa, access_type, s2_mmu_idx,
>
>                                       is_el0, result, fi);

Yes, but that doesn't help if this ^^^ get_phys_addr_lpae()
call sets result->attrs.secure = true.

thanks
-- PMM
