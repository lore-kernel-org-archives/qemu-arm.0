Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp519531lff;
        Fri, 30 Jul 2021 12:41:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwLAoO95BD9z2AZYPYwX4Yp15bFTYnVTzHFQDA058fvPM1dADfyBvExnQ+ZIcVbUZ5yCp0X
X-Received: by 2002:a17:906:d153:: with SMTP id br19mr4360677ejb.166.1627674118129;
        Fri, 30 Jul 2021 12:41:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627674118; cv=none;
        d=google.com; s=arc-20160816;
        b=Y0VU1hzPSwZVWf0ZYyBHk/XHDiq3wVCD9LyYpHw23JGTlhnyWN4AUtZDIL28v/ybHY
         551mJkHEMSi5GP4ZX9hY+J6kqShyMd10V9Qk5DPbEOpnCSwgN/IxXuGWVnF5sGkSdP8u
         jFQVKD//CuMlfpgu5heBckWnWeyhat2ExTTlp1KTTOIUuerWGdB9ZNPLVhK+k78BSMWm
         7B/p9FesbC1px9hCTLtif1bbntBYlv135qqhn0pHB14iwH0qtXxeoVfsZ38mu7YzE5sg
         3soM9fS7DhJyWPMMNGNdPzYolr1KFARXVCvY8o5ipXqziYcuPXNyyunGF6oY2OKcutdX
         V7xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=XIkIZUOXJZAefI+U0E2hTAaqkdhFCiAxcuC4xPnzYMA=;
        b=k4KiaPhT5naZ+jB8UaWpCuw0X6T6Xh+t6AYLo3TBuc8l9n8lm1d2WZi+CJso/NXpdR
         ViDuijDm9Pt0Q1ERFPtZeqGURdwpPsJYm/Cvefkhaw2CwKa7jS/O0qxe2lMqvDKAollF
         56aot3zBi/b5R2hzA8tbyARF9bNYQhRLJSgivRfikHajrVhQ8cVE/jjLXMv162ks2QHJ
         ppv+myFPlvbAmdv2z+D9nhJrVkv/p45sU5/gqNMMuKV/mqRRzdR+Bu2Igcn31gMVBYb/
         HitiM3pPkyakafwtvXs68Q1gBnwarjYG1iY6+yYqYiFZF4Ea9PUnz/MvQ/C8crxXI/hH
         dv/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VBddcm3j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id di10si2640439edb.484.2021.07.30.12.41.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Jul 2021 12:41:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VBddcm3j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m9YOL-0005wA-8k
	for alex.bennee@linaro.org; Fri, 30 Jul 2021 15:41:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9YO7-0005v5-Qq
 for qemu-arm@nongnu.org; Fri, 30 Jul 2021 15:41:43 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:38430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9YO6-0000nP-9c
 for qemu-arm@nongnu.org; Fri, 30 Jul 2021 15:41:43 -0400
Received: by mail-pl1-x631.google.com with SMTP id e21so12318151pla.5
 for <qemu-arm@nongnu.org>; Fri, 30 Jul 2021 12:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=XIkIZUOXJZAefI+U0E2hTAaqkdhFCiAxcuC4xPnzYMA=;
 b=VBddcm3j6amC//jKLLg8WLKAY4PPBL1kXTHmQazS0BXzHCpIbSRKe93hU6UCjVyopg
 GqgEQqrmYEv478A+hJ317G9wg4WMY6yP4iHomcTMu2fp8B84wg39mFgGUDImU+8WNvAx
 z2+HUXcvXM3DHQE7zAnEZjw0mmYXhKizjKF8nLEaRA03wxsrNWXI3gfFl+PksSnOJg4w
 a4DIRAhYCqyrwNzzgv7VM6aXUZkKTwqeyJdKW47oF2tRvH0MjTLo5sxS/7KGv1a53cxr
 2/w8Nkh43Blo62HhVamK9lxeZp0FgcuKiGeoa569P3m0W7/cI3gxGkiZg4E3/pvKtPRD
 A5Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XIkIZUOXJZAefI+U0E2hTAaqkdhFCiAxcuC4xPnzYMA=;
 b=X1ldvIiIdIoEw9/CFfpfz8Aaua1cALFdmxHt4WPeicU9pLRjP8iwiGvyuDlBNF4tyh
 mYaN628VTJlHJsm0up+0nfBcENoG1lZPAU9f7ze0z2qd4+61VX/caTZRxuWSa2gqWU5q
 ObopBsXaRill3LDg1MYv4t2YKj36IC0bFg9dRAS/2XR+fbiSeaC6Jr2acmTIVwvABXMa
 tCLaoz5sd8SRLrGjTFZOo+nNhDaK0lYrSn0kIcDiDIIErH37UjF1ap/ycRA0m1nPo7x2
 vdnB0O7SUP+pKoinrWZdztm/yXp+hkF1ymHCmK7UdX2nzp+dheH9bd8rq95ebw2+qMrF
 y4PA==
X-Gm-Message-State: AOAM533QVHunQhphynQ7BTLoSAFxxDXmdpLGnd5Aui0Cl9GTjOLiTict
 xpDVTaZwTOKyyPIMuAJnHPYckQ==
X-Received: by 2002:a17:90b:4d0b:: with SMTP id
 mw11mr4854420pjb.122.1627674100731; 
 Fri, 30 Jul 2021 12:41:40 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe?
 (2603-800c-3202-ffa7-c4c7-6719-c57e-8ffe.res6.spectrum.com.
 [2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe])
 by smtp.gmail.com with ESMTPSA id g14sm3116440pjj.16.2021.07.30.12.41.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 12:41:40 -0700 (PDT)
Subject: Re: [PATCH for-6.2 39/53] target/arm: Implement MVE VFMA and VFMS
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210729111512.16541-1-peter.maydell@linaro.org>
 <20210729111512.16541-40-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <10327c97-27e2-b3d2-8e5f-20a4ec41351f@linaro.org>
Date: Fri, 30 Jul 2021 09:41:37 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729111512.16541-40-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.125,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vP3em/jmHZWL

On 7/29/21 1:14 AM, Peter Maydell wrote:
> +            r = FN(n[H##ESIZE(e)], m[H##ESIZE(e)], d[H##ESIZE(e)],      \
> +                   0, fpst);                                            \
> +            mergemask(&d[H##ESIZE(e)], r, mask);                        \
> +        }                                                               \
> +        mve_advance_vpt(env);                                           \
> +    }
> +
> +#define DO_VFMS16(N, M, D, F, S) float16_muladd(float16_chs(N), M, D, F, S)
> +#define DO_VFMS32(N, M, D, F, S) float32_muladd(float32_chs(N), M, D, F, S)
> +
> +DO_VFMA(vfmah, 2, uint16_t, float16_muladd)
> +DO_VFMA(vfmas, 4, uint32_t, float32_muladd)
> +DO_VFMA(vfmsh, 2, uint16_t, DO_VFMS16)
> +DO_VFMA(vfmss, 4, uint32_t, DO_VFMS32)

Here's where I think passing float16/float32 as the type will pay off, with

   r = n[H##SIZE(e)];
   if (CHS) {
     r = TYPE##_chs(r);
   }
   r = TYPE##_muladd(r, m[...], d[...], 0, fpst);


r~
