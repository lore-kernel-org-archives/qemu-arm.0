Received: by 2002:a17:906:bfc6:b0:9a1:fa4e:495e with SMTP id us6csp421369ejb;
        Fri, 8 Sep 2023 06:24:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELtFol8ItZwlZOAXA8tMQF3wNoxskttf41yOjeOm7kNXWd2eaLRHQGvKWmi5L3TLubJbL5
X-Received: by 2002:a05:620a:a03:b0:770:67e3:1fee with SMTP id i3-20020a05620a0a0300b0077067e31feemr2354770qka.65.1694179470161;
        Fri, 08 Sep 2023 06:24:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694179470; cv=none;
        d=google.com; s=arc-20160816;
        b=cAlerBsjtWwzjX0Ex87cYjdj+mDA86inpJ5mpU4LxheJXOxWouvlV20etLrIt0OKuh
         SjRnz/NNnBS6BOi+NTHMSzex3GtVUA3s66faaU35yjfr8hzgiPVOdg2SXwxr4RZIFhyo
         YjdZtiejvlVOj5DGqDdwJOGSeZDsi6AK7Ph5qiFvqyUTQSwA5S6P2m2Hi/UeA0Woycq5
         2cZAY6XrBh7WURYARWR1e2iiYwkDbbteUvAZDFbIvhQy3+deA66G1lPEigdj8IkkQKOk
         9ayHRRXdd6FbOLDY7DtUiVWDh0LL5pdgZXHKdvjxLrBqNnxnt9tXyZ9ZaUfSAcFcE17O
         r61Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=1G9jEN0L2RqvID71WCf+WwTVwnk2Gp91F9cYIMBJEjI=;
        fh=/ftcwOPYeEIhzseC7WF42kR+xVR/IJiWpLC1+A7SOWQ=;
        b=dyQIVgvr0NXZ0l3rUtcqn5y41fE4klf6JZkoz5f+aW1iQpl36IzfksZTt7XjvlvMA1
         rXsc6NJTi0sDJwMC/YsDx37NU94X2KGHz01tqAd7NrfmEnJU8vUPZVoWUNvfoPov6nhI
         /3+6Kadkejydwcka95NRlSVblJXmKuN94o+a8guIVlpiYdYT/askBsos5r6U1odA/UZD
         pukgYKdwxUgiNoahn1rm15TuTDCR2VPqx929CC+Vgr5iwvh76B/61mPbzUx9GDHHMoAE
         yrxiaS5X7OEo9iMsoG6j1Nz/WMOllrxsXy4HJcmtbRuRKhbWRDzzeKF2Y5jogisU/Yey
         dLaw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ByICHVKL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id qh17-20020a05620a669100b00767ea41549bsi1058173qkn.194.2023.09.08.06.24.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Sep 2023 06:24:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ByICHVKL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qebSs-000753-GO; Fri, 08 Sep 2023 09:24:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qebSq-00074Y-Qe
 for qemu-arm@nongnu.org; Fri, 08 Sep 2023 09:24:00 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qebSo-00017k-Ee
 for qemu-arm@nongnu.org; Fri, 08 Sep 2023 09:24:00 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5280ef23593so2614320a12.3
 for <qemu-arm@nongnu.org>; Fri, 08 Sep 2023 06:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694179436; x=1694784236; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1G9jEN0L2RqvID71WCf+WwTVwnk2Gp91F9cYIMBJEjI=;
 b=ByICHVKLFgVgqNpcR8ZCyjc3sa06ZRZkOF1iYdq8CZAC03aa6qieikQBq/DHIdBhEZ
 g1ie5e2pnQgJ0PRnXtQzP74gs1STJGn7sOiBcIi1IcD6rFYjdsMU7WN/ofsmHzP3z8wc
 gNWtX3s0CXCL7KDgwj+xAavhV1XbuoRkdkGWdw7l7vg+rxL3fsQZh/Mh/03h78yALb3+
 4Hz2HGJqZGJKZELNazXE1IYYnDEXZC6cH841dgKcC20X5UN2RtsGDDGvFhTqGtDFZCKO
 EYIbv11Uj1rdHxoonPZZdtq3vdSHAcALB87WumaM9KQxSb4xztdV+mpMaLPOLHm4a9Ow
 lkkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694179436; x=1694784236;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1G9jEN0L2RqvID71WCf+WwTVwnk2Gp91F9cYIMBJEjI=;
 b=AnwAbHxvIcvLAQBxitvI1IHWg0f2+0Ov7/PkUyf9rOumhc+wV7+4gBM1PHSviU1JhU
 OAR1tkEoeP8IA6MdP31FPQtaDKJrGDriu6qKcn9YuMZyGmpVChfmAWHtrUu0W4+fNBnr
 bheFUAvicqQ5oPrjlOCE5vhtwil71PXPJiP3B4u7QCoKkphGLOhKP+ohnKZZuhnPrBMB
 YSU4jsQ0VFayg5WGaGA24M74ho7c8ME/6IRBPgyYFaqLgxu5LjHUPCtEuqiXBimd7oHS
 a5KncDfkjILI1bEyPDVGx9k1iSaGoE1C7eIvoqeX9g+S+QdDz8nvyYXgwAKxoc3A5yIm
 uatA==
X-Gm-Message-State: AOJu0Yx8ssqF/epaO04DEM0p2XR0ume3XsBhTqiCEOmbmvBSMcHfnD1Y
 YoPEyVbBAF7stta7yIMSpQTtuHWMgExSpFDyFBRJQQ==
X-Received: by 2002:aa7:c641:0:b0:523:7192:6803 with SMTP id
 z1-20020aa7c641000000b0052371926803mr1868667edr.8.1694179436434; Fri, 08 Sep
 2023 06:23:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230831232441.66020-1-richard.henderson@linaro.org>
 <20230831232441.66020-3-richard.henderson@linaro.org>
In-Reply-To: <20230831232441.66020-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 8 Sep 2023 14:23:44 +0100
Message-ID: <CAFEAcA_rkA5MtRDCRK3ZZYxK4OQ7ToYy3eZh1NQRVehM-OwcPg@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] target/arm: Implement cortex-a710
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: T2v0gvbzpbqf

On Fri, 1 Sept 2023 at 00:25, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The cortex-a710 is a first generation ARMv9.0-A processor.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  docs/system/arm/virt.rst |   1 +
>  hw/arm/virt.c            |   1 +
>  target/arm/tcg/cpu64.c   | 212 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 214 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
