Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp4773600lfb;
        Tue, 7 Sep 2021 07:23:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyApiVAHkzAH1iejBSv5zP3xtaq4BjiZYn95jq5aHGBgjeKdcC4eU4GfpnF9fuEmcuNtyFF
X-Received: by 2002:a67:ec88:: with SMTP id h8mr9583058vsp.47.1631024580282;
        Tue, 07 Sep 2021 07:23:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631024580; cv=none;
        d=google.com; s=arc-20160816;
        b=csVovGyyri8i8aIke0iUn4+LYB11DBaTklutIQh4/gi3f6bl/7+Wz4Mk5NZwpcfZj1
         OjhKSbjFhWnbUkcwyUh8sC06FEQrneyNVulMoFQljT5dzp54eriJN4Ik1rhWhEuDB1r+
         pX/8jdj6e1IlFvJQlAKCLFXnmCkVCrMOPHZt71xGxCV5GokR3T/6M942tJakUc2heDF6
         +jvzr7oAfUYkw7jwbufFWZar1LpMu9b8ex0MzBRLzOk8ilcnAWrPWNyBBdmjrnt3mOGM
         fYsiSjt19pGxsV7tnezhOU5OopEjdHhkKVNzP8BP0rEtN+vMSIXsCJhVSXVR3Ta4KFw6
         cOkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:to:from:subject:dkim-signature;
        bh=He+09qJONqc1cnUJiBJ3b/dKCXckIUSdmhvP3jiodOQ=;
        b=vGUU+aCLc7Or1Wm5nmxF0DZWdhC+10IxuBPCbzuRsl8wkPA6YmlF0J5Sk0ezSJ+VuE
         RWtsZNjDGN/mrUi+BY2p+UzfzTvYiBwv8uA3NbgH4LEihTxTECvlx5zSttDeal4IZQ+o
         RRZgD20rLaBoQRKOiCrfGlSgzEyR9UKGxgDzItHiBhkHbbnjFJwzJZNWubHGLd6tbXP7
         fmTCf5Z64EEbFdmYg04AhG9OXA3qqQUWlobjysfuJPjyulvurqcNHaZqBxCLWGOyxRen
         j37WExVSMANsCW7eY/PBafkQ0glL90yYpICA7cXjdtCRCwGVvc0xHEyG0hZlBfqJx8lk
         iq5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QvGbQxTU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t40si3230106uad.8.2021.09.07.07.23.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Sep 2021 07:23:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QvGbQxTU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mNc03-0007qW-J4
	for alex.bennee@linaro.org; Tue, 07 Sep 2021 10:22:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mNbzq-0007qA-W3
 for qemu-arm@nongnu.org; Tue, 07 Sep 2021 10:22:47 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:43564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mNbzo-0005CA-QN
 for qemu-arm@nongnu.org; Tue, 07 Sep 2021 10:22:46 -0400
Received: by mail-wr1-x42f.google.com with SMTP id b6so14739630wrh.10
 for <qemu-arm@nongnu.org>; Tue, 07 Sep 2021 07:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=He+09qJONqc1cnUJiBJ3b/dKCXckIUSdmhvP3jiodOQ=;
 b=QvGbQxTUBZFt7k7vn7oPNX87mhrynHWSNZIPLUDFeG861Rkhb1FWxt/6BSpqCVNiDv
 B+c1Apc9D3EmJZZpefB30foel278A3/18bjyToy2PPOq7ew3T4DLcexq7ByW52fuRujJ
 BJQR+erDSe+IJUwCHocuBsGDEfYxfZ4YKa1uMO12CNEP4F8kpyxVINupGlz7Y/xQu4ra
 2TV4H+vnC4i3aXqE44b8Pi61UfdEhQAw8pxT3WaU0fnzUf2WbK5RjGLpoVV80FIUHyIg
 lSeMy4O9qLCSiA3FbHbSxAftHjlzCqEXzv0aARjdKKWVAdANwHVr3iQfF8INpD4BkQLc
 EUlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=He+09qJONqc1cnUJiBJ3b/dKCXckIUSdmhvP3jiodOQ=;
 b=ViQ9t7XOZqfi6m67c0C7LxXyMSjJBDF+yH0hLUhXTTetmPko6buAO3U2SHMobRUzeM
 WvhHRJZJfm6UgKvVgIfICc0Goz55oKpKbRG09zJ9WInS5nEJ5j9VHxHvtC0tqm8/EZiE
 h7TjYV5lYOurVC78RRdyykVGQVbwFhDR6bfE5KqAGpVq0ZhuhDrSw0rK2RHroFUpu/ci
 saECeJhYr4QtUYZsv1RbUOLd1E52wHlW+mBfU0NK7ZFSyH9JM4PcHfn+xNPd/8M3gGE7
 qZZ3JYEs9ubmtFpxSVu5fCTbnfGX+3AJuBrJSOOIhVnak8R5JcSMH4d+cfTvDwialST/
 FsWA==
X-Gm-Message-State: AOAM532PyEvuk60q7SbaoU7zW0y9feOwiTXY3e1LtTSpLB9o1u0gNvIg
 t/F3mwzoNGk6F3Csl74HN9fEGA==
X-Received: by 2002:adf:d191:: with SMTP id v17mr19330928wrc.345.1631024563126; 
 Tue, 07 Sep 2021 07:22:43 -0700 (PDT)
Received: from [192.168.1.165] ([139.47.33.227])
 by smtp.gmail.com with ESMTPSA id d5sm11333464wra.38.2021.09.07.07.22.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Sep 2021 07:22:42 -0700 (PDT)
Subject: Re: [PATCH 1/4] target/arm: Add TB flag for "MVE insns not predicated"
From: Richard Henderson <richard.henderson@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210902150910.15748-1-peter.maydell@linaro.org>
 <20210902150910.15748-2-peter.maydell@linaro.org>
 <76cd3594-f864-232c-8687-19a1d44ff07e@linaro.org>
 <CAFEAcA8EoyaCSzA1vL_SHY50T6Fxjm420_pYgXx1_+E-nV-MBA@mail.gmail.com>
 <906c738e-904c-99ba-b6ab-2556e9262c87@linaro.org>
 <CAFEAcA8-wj4TEQ+VKhVk8JuUW3xKA2NuJ2AnU=2ZTDdMfieuGA@mail.gmail.com>
 <dc5b66b4-4d34-6da9-ceb6-00eb524a070f@linaro.org>
Message-ID: <7cfafc41-5aa0-fc3c-18f6-4ac7581806e2@linaro.org>
Date: Tue, 7 Sep 2021 16:22:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <dc5b66b4-4d34-6da9-ceb6-00eb524a070f@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.332,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JjGS2S/xnLIS

On 9/7/21 4:11 PM, Richard Henderson wrote:
> Well, we could let gen_goto_tb see that is_jmp is already UPDATE_NOCHAIN...

Perhaps anything besides DISAS_NEXT?


r~
