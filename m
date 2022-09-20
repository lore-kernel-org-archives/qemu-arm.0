Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp1989567ejy;
        Tue, 20 Sep 2022 12:18:53 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5bTqgmpQD9gIzZmnKECybCl3N2xmud4Wf9cj+DbNkzqG+1RUCDEZq0b7aknVrtNfW+GPkJ
X-Received: by 2002:a05:620a:c55:b0:6a7:9e01:95c9 with SMTP id u21-20020a05620a0c5500b006a79e0195c9mr17915897qki.63.1663701533649;
        Tue, 20 Sep 2022 12:18:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663701533; cv=none;
        d=google.com; s=arc-20160816;
        b=umb07g7/Wbd7fShwRppiwssXzvinbpn9sJZ1z4JSvEClK895xCX45rqiCCeZat9trs
         cK6hLBZM6swSOtboscM5JUqIWx9JJE/B4U6hJiXUX9Tg/JDAZYQ/yluKwDZZGnM/ggCR
         pcba9BsRcUUlnAnd5xdemaS8uLbejdTB5cIlz4tWZxMHvSF6l+J5U8nlVNeEiOspLTwH
         BZbpRLqRuKKRKd4hLiXHvf0GkR3LAEkFbw6kjwtspF7K6kUsidQVSUjBnTLC9hvgqiC1
         o46q9s3Zk8obpkSlnsZrX1IcInMzwdNm8dLnB0dwDlWrkTZPj1FzKbtRLsMS23PtkRpa
         NGdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=U07SsdNX0UoLXfyN/gGpR9oU1/x/cPFgwFWdiBezl/w=;
        b=PB6QajBJG3CN5YuYFsVKuoPTh+btGlVvyM4Bb6Z4wo0t8IfskBnOf1A+nlcugKKohF
         AwtmfjOxd3Fr+qRiGWsN5pcTY00tgqQpnwoYEU5u9AHTo0N3DwNC4woAy8zp5FoJiNOs
         u5PHo0VQM66MNpiM9eKxWxBPa177S9PFLB2cIajbXLl0x/19D3rdzVNLm88i2ypUrB3T
         kjqt+qJfM0sLMOAVO1R5b4FVxO36H9hHGcL4NqMogD2V5ayZ2D6K5B9h80X7IQ41ocVI
         7seQYgy44/VOxGxmrNFskBcIkOWnpF2jZDnJUfYmZS1SIM684zOaHSN9gPj2lJpdTt7I
         xH+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=d78T0ego;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s9-20020ad45009000000b004acdd58eb4dsi249784qvo.279.2022.09.20.12.18.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Sep 2022 12:18:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=d78T0ego;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oailh-0003J2-4W
	for alex.bennee@linaro.org; Tue, 20 Sep 2022 15:18:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oaf7g-0000zN-By
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 11:25:28 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:43627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oaf7a-0007p3-91
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 11:25:16 -0400
Received: by mail-ej1-x62f.google.com with SMTP id lh5so6988377ejb.10
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 08:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=U07SsdNX0UoLXfyN/gGpR9oU1/x/cPFgwFWdiBezl/w=;
 b=d78T0egoSFf85su8iLPsBgnMQFIenYTvEzBpdwO/+pjSkgP7ins6oeGyXoesfMYrli
 X5V3cUmiTe+eS8uMCNjAtN4YfyEXBz95Xou1YKgN5exgvBum4xjzCcJIiqF79EZoouis
 zfLS/uXKo6xaFbpGa6L4vNfEWi5yhai+vxcL2isEdFKAGuXWvvKpwjNd8X18S7QYlFX1
 Vm1DQkvAzQlEfe5Jpis1JuPUcf7KR2N80fSrttSzMDqbcBizkE8LKxV4OSj+L0YuSdMl
 uUZ7qlCbG0V0qQ2fWVue0Ofv5W6v60Lp0Bm44oyK3yW/gWVBrsx6rQBCQtmPLMZhVD9n
 tKbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=U07SsdNX0UoLXfyN/gGpR9oU1/x/cPFgwFWdiBezl/w=;
 b=isciIr4lXQqr4DS0r9MbzU/PqYgzr78krja1gAh2nMlUoqZ9w2qfGgMoG1M3SUtCTI
 FS/t8Jvn1/G6/GEbSiBkS+SSKi6NANnM9ltcq5xx2rilIpW/Q4s5MQLfY6C3cvjKs6z8
 7L8WEdnqG6nGmcY2t3hfErlyzA95kBagDXm5XFW+HgenJfmove934ELn1+4rGqMP9pkp
 v5eqAjtvkgWsXPO9stD/RFlpPecwcQIGveEmtlMsggDw3c0C+L6806oGnWbl8IGVzG79
 lvX5OlvL0agcmsx4/mQjTcLBqNNJmcFBUvKILDakm4Fv9SAIAeLeDz1+5JSXc0Y9S2jl
 lnRg==
X-Gm-Message-State: ACrzQf0hrWzI71Qn40UIfmaYmZ2aL7IgHatSSIBmL7r+SUpfE3+AGxoL
 MqpgUFNekGRaKFehSrR0L34a4LIJSY0WbQR10LzXLCO2Czk=
X-Received: by 2002:a17:906:9c83:b0:779:c14c:55e4 with SMTP id
 fj3-20020a1709069c8300b00779c14c55e4mr16863365ejc.619.1663687512747; Tue, 20
 Sep 2022 08:25:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
 <20220822152741.1617527-25-richard.henderson@linaro.org>
In-Reply-To: <20220822152741.1617527-25-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Sep 2022 16:25:00 +0100
Message-ID: <CAFEAcA-zMATFHQd=_9CzKZPoOuhzdW6r91PTfLhoTzcB5=16aw@mail.gmail.com>
Subject: Re: [PATCH v2 24/66] target/arm: Merge regime_is_secure into
 get_phys_addr
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xRnrzgHRWlNz

On Mon, 22 Aug 2022 at 17:56, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is the last use of regime_is_secure; remove it
> entirely before changing the layout of ARMMMUIdx.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
