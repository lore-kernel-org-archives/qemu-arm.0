Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp866451ejc;
        Sun, 12 Nov 2023 08:22:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFdmhXoN/yHUlsFxOZiDZrMQyKBkTA/BsykJ9Nn7KLNlAU4ThJuY69Iwexcu83+4G5nHYSM
X-Received: by 2002:ac8:4e56:0:b0:418:1f52:1421 with SMTP id e22-20020ac84e56000000b004181f521421mr6981134qtw.9.1699806156474;
        Sun, 12 Nov 2023 08:22:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699806156; cv=none;
        d=google.com; s=arc-20160816;
        b=GwYEcjuucJf8d74dw6S/wbNf5T4cKrOMMQ3phynoI3fn8M4SfF7NNCoJACWEyr1fQN
         0D0L9OyyBxXSMe/89t/M24cKO8j7a+YPva/GOJBZWQpkni2DW6WmHtL+OCVC4B7FKOiz
         d3YJPJx02CMSaT1QeyzfYSYudkUtrjOTHb+Dn5y3DN65gWAVFH40uC1v1OEC7UOr6Upx
         KKFz9n+gOfMStaKSuPR1vuCdxMNt7TCX/fjc/IYmLuGm88nQspuweMh6PaTBd2nIxE+o
         fjJLObTSE4Emf2NBm9yJzS/b+j+i7ZZP8TePJD451p6bmepABWGtC0UFRJtYxcnAsnNU
         8JvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=ocmIQd+SVY2U71IwwT0Nh9IIR0HnuTvPwuQ/4K+4PK0=;
        fh=+xj4Yfkfa7hWRbLS+DTrcNY2o0evBrBbm0gAigyTnIw=;
        b=UHzaaqn2+FEDDKFAIOf3YLhrvzX8S3D9LGlVWdb0HzS9JlARAE41kQLe9s+BIYhYwe
         V9UA1JQw3yiZHDrOF2ysPUbntAl2Q6Mn9Da4IM7fvEVgCUi9m6It0CyUL84S2Z3k6/fR
         9X08NO4wmFH5q1lbBxuEUBJmJE6E0RgLW+/tTsDRjnPjQSBdRxnLU2hTTnsjamncnoBb
         GfHMR26o9Ul9N2F7PLq/0TaZSnUSZauL4fcmWAxpicNe2Qo36gVIuWpe5h4oICrws2bk
         nhNvY+QmlaMpj9JIlp7Q62/18CGGSbmAlYHI2nhu8dnavgScRD68Ia/BgDYB4AESGIaD
         bi8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YTzkZIGs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w20-20020ac87e94000000b0041962d20ecasi3101205qtj.90.2023.11.12.08.22.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 12 Nov 2023 08:22:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YTzkZIGs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r2DEB-00069q-Il; Sun, 12 Nov 2023 11:22:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1r2DEA-000699-Ch
 for qemu-arm@nongnu.org; Sun, 12 Nov 2023 11:22:26 -0500
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1r2DE8-0002h7-Rz
 for qemu-arm@nongnu.org; Sun, 12 Nov 2023 11:22:26 -0500
Received: by mail-ot1-x32c.google.com with SMTP id
 46e09a7af769-6cd1918afb2so2380615a34.0
 for <qemu-arm@nongnu.org>; Sun, 12 Nov 2023 08:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699806143; x=1700410943; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ocmIQd+SVY2U71IwwT0Nh9IIR0HnuTvPwuQ/4K+4PK0=;
 b=YTzkZIGsmUMf8KUp+V24y79E+6iuhEtIBFMZ9me5Zty8XjI1lmww0AhQWQQxvooIHy
 sOuMOrG5g+MI/PlAA/9+XzrXwgSPCdiL8282aMABJMwvUJjJsb8GbvsYLGEOnpmYD4l0
 0hUbgDqUk8D/87Ku3/mX/Fjwo5Q9n6OSNs+H09c5WmPcLYAz/IbSKU5ZAW4pz/NXVagx
 HSbEB8R0SaXv7fw/iQmzlBc6sZrfTZ+z+HwYHZ1xHD8tA6hvIBOpyno93HlhiUNAFu7T
 Wt7RV9FdgjA7bfIJ244rxAthQumBhqHrpPQFqW6g20vTTmYQsIXsQT0bRrJPcBoph7IN
 Lpvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699806143; x=1700410943;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ocmIQd+SVY2U71IwwT0Nh9IIR0HnuTvPwuQ/4K+4PK0=;
 b=Tjva59NJ6frxtq40xXOgwLZNwsIe7XAkuVLs4Ig8b1vf0j1NZVJF/sxgMVrqymWNxB
 0tEeWaOH/ouVuBQBt4s352Q/2bHvBTmbaXxkfrcfdoPDGsu1HxqqZqkpG3GbpR6wkMKs
 zjMohel6StBePR8oQYM4kppEkc/Ss3U6bZ+Vp/V+09imn2VLhnjMgJD0fE10LNOHO2o8
 XYZFvDynecmBx2LEqvK92iGurnhbnlqhdWSj80qoQfLMBOVCQrviJxQtnIQnZ4xnk+xl
 gGPBUQRv9WZ3fQZFfbWdm/6mSamdTg+FJlLkiEc+m11C/PV528PdZKnkM5mwUrdfUKQR
 4iRQ==
X-Gm-Message-State: AOJu0Yx5dGXm477fSw28j2iqzSRlTfsm3bXeXODT8jzusc4vKqGBnmqm
 j4vqzSGLL2nGC2ZHoiOMoSQjew==
X-Received: by 2002:a05:6830:71a7:b0:6d6:45f1:d7b4 with SMTP id
 el39-20020a05683071a700b006d645f1d7b4mr6140058otb.35.1699806143067; 
 Sun, 12 Nov 2023 08:22:23 -0800 (PST)
Received: from [192.168.114.227] (c-24-20-177-206.hsd1.or.comcast.net.
 [24.20.177.206]) by smtp.gmail.com with ESMTPSA id
 w123-20020a636281000000b005891f3af36asm2828571pgb.87.2023.11.12.08.22.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Nov 2023 08:22:22 -0800 (PST)
Message-ID: <80d7bc69-1277-496c-94fe-e1fd974f6ea1@linaro.org>
Date: Sun, 12 Nov 2023 08:22:19 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/arm: Correct MTE tag checking for reverse-copy MOPS
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20231110162546.2192512-1-peter.maydell@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231110162546.2192512-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: j0chvC3okwYC

On 11/10/23 08:25, Peter Maydell wrote:
> When we are doing a FEAT_MOPS copy that must be performed backwards,
> we call mte_mops_probe_rev(), passing it the address of the last byte
> in the region we are probing.  However, allocation_tag_mem_probe()
> wants the address of the first byte to get the tag memory for.
> Because we passed it (ptr, size) we could incorrectly trip the
> allocation_tag_mem_probe() check for "does this access run across to
> the following page", and if that following page happened not to be
> valid then we would assert.
> 
> We know we will always be only dealing with a single page because the
> code that calls mte_mops_probe_rev() ensures that.  We could make
> mte_mops_probe_rev() pass 'ptr - (size - 1)' to
> allocation_tag_mem_probe(), but then we would have to adjust the
> returned 'mem' pointer to get back to the tag RAM for the last byte
> of the region.  It's simpler to just pass in a size of 1 byte,
> because we know that allocation_tag_mem_probe() in pure-probe
> single-page mode doesn't care about the size.
> 
> Fixes: 69c51dc3723b ("target/arm: Implement MTE tag-checking functions for FEAT_MOPS copies")
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/tcg/mte_helper.c | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)

Acked-by: Richard Henderson <richard.henderson@linaro.org>


r~
