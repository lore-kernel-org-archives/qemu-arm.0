Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp6630ejc;
        Wed, 25 Jan 2023 14:53:38 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuswwRBNGy0euZxJ/0lSEEBkqrNB6nunM67Sly1nTgmyn9tPHZJ0CvUFOCmSpHVIZK5b5Ed
X-Received: by 2002:a05:622a:1e97:b0:3a9:8b17:d090 with SMTP id bz23-20020a05622a1e9700b003a98b17d090mr54500261qtb.36.1674687218044;
        Wed, 25 Jan 2023 14:53:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674687218; cv=none;
        d=google.com; s=arc-20160816;
        b=wi+y4owpNqbRSd5MCchLjpuaD0c9nwrGlR2BSJPdXkrANdU/6u/ujGPJKLeBPDJ64u
         iYV5cUBMP6fwd+D6I390mog05CrUSwyte4/UNPL88e+XtvySp85IOXvzfi75bYtgfNZq
         tuD+QsVWCcKRs48wwmHmQHJXzuZJZcVBATPF/hsRhOFdS+ujN12YVVSGEype+ispUgbd
         Ib1R2df7VnHlUU0ubvQoDQFan1srSaHMqrzEPCMJZWLCkML6xwS3mriy0BtPnKDbrV8a
         nQcFSujmuuydUuwl7NkitJBvCZjp5/MS44c6IBvEpnYYccHLJ2z/bGVgMhvWZQKucxtM
         0Wng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=5S9AdAYHG/UyStTSLM5+quyKBcHwp3+/6AfE5D87uvQ=;
        b=pUSQTO4Bvp2wnZF9wEWukt8w6t55qlaZKZI8kQP2we7h2A9GdP3JvLfPBSVo/uG69X
         pwicsKfBdtZIUMTelnjBIgqEVcZ/TGwVuNrk8BUmG8f3yJd7MA42RsTa1amYH+IQ37A9
         ok8YOJg4naWQkoRWm0roFgDOA8jciQl3i/Bxe0bQAVcDvC+MJjekS9rlU8hMCTBQhF1j
         AEILId3gr+/EbU4hLxXqBit2gkIXStGNQa1zI/uAlEjUbVvbt3hBH1Kw1lE94EZL29WB
         IFWY8MHo4PXcWkzU2xU7rJzuiLBiHdHOF5w4+zCDCOOS9qoJKRNmW5c8puY7gb4345Kb
         6wbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="XLfmT+G/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i2-20020ac87642000000b003a4f21d8f92si4291480qtr.552.2023.01.25.14.53.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Jan 2023 14:53:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="XLfmT+G/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pKoe0-00008W-Hs; Wed, 25 Jan 2023 17:53:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pKodz-000080-7A
 for qemu-arm@nongnu.org; Wed, 25 Jan 2023 17:53:27 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pKodv-0008G0-2Z
 for qemu-arm@nongnu.org; Wed, 25 Jan 2023 17:53:26 -0500
Received: by mail-wm1-x32d.google.com with SMTP id j17so82262wms.0
 for <qemu-arm@nongnu.org>; Wed, 25 Jan 2023 14:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5S9AdAYHG/UyStTSLM5+quyKBcHwp3+/6AfE5D87uvQ=;
 b=XLfmT+G/ibPnhnWJ0mBV1o0dv7uomrw805zEMkDoIouQ7NUtWR7psB1a1Bu5/yhafd
 +QMIlMD4ZC6lIMwxarlTGH3RYMbD26HWc9yXsiIVac56oaBMf5lCaqNKJhAKH8GKrr+e
 Dr/f/1LAG5wo1GunsZMCqEjAeBhpM20tlRl+46JfIGTGE9MomH9/VnGFclBD28JObhu+
 GiC8bV+/T94kKsPNJPFm22qsk0536rv8rVAsTskMqOMYxhoKHRfEPewaSDRkkYqHy3aj
 TPFxf2YT2qe4B2ZmWw0jkbiKotokdO+k9F1HlGhNLJAgapPWXFUwGq9Y5v8vHIFxQK+k
 qNhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5S9AdAYHG/UyStTSLM5+quyKBcHwp3+/6AfE5D87uvQ=;
 b=t/dIc3gJgbi0NCMDVW4Ro+rU0bTkvphLr7kWllKjXUrxCEiJ3SBNhSVBeJ/nKJf026
 WLDF5Imj9J35xTUEqvMItskPyXKHloxdmojHnkZRS5hDOdK2ckoayPEmchALUtX42bof
 NKp6c2GXrXs1vy8n2b13rx5JOFcdXjFjBM2Q1ks5+Rra4wIhaeXTwcAibWR5y7TOqriE
 3yCPiJjLngYFTXg40dRAdH3TkQRGzY045JdjFCpydPOb/ObiskpsOta4So2GLJK/haFX
 JcI2rEM1Pg5mzqIrys288omSAaeDsSfDCynMDhBy1blCx8wfkeXJE+pFzpjR5tJKZNBK
 JMiQ==
X-Gm-Message-State: AFqh2koOLCKlW5zt+OO4oqe+67nxjt1ByoTtZamr2ngf8UNYc5+SlOtg
 S6qpjDypvEGbpZmBbYJfrUir9w==
X-Received: by 2002:a05:600c:4e05:b0:3db:1d8:9f25 with SMTP id
 b5-20020a05600c4e0500b003db01d89f25mr32398931wmq.2.1674687194750; 
 Wed, 25 Jan 2023 14:53:14 -0800 (PST)
Received: from [192.168.0.114] ([196.77.22.181])
 by smtp.gmail.com with ESMTPSA id
 j38-20020a05600c1c2600b003daff80f16esm4429343wms.27.2023.01.25.14.53.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jan 2023 14:53:14 -0800 (PST)
Message-ID: <3fe9d8c3-233c-4673-78af-694f0a452400@linaro.org>
Date: Wed, 25 Jan 2023 23:53:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v4 34/36] target/i386: Split out gen_cmpxchg8b,
 gen_cmpxchg16b
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net
References: <20230108023719.2466341-1-richard.henderson@linaro.org>
 <20230108023719.2466341-35-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230108023719.2466341-35-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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
X-TUID: UoxpAXabYE9X

On 8/1/23 03:37, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/i386/tcg/translate.c | 48 ++++++++++++++++++++++++-------------
>   1 file changed, 31 insertions(+), 17 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

