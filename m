Received: by 2002:a17:906:5ac8:b0:98d:b2f5:1316 with SMTP id x8csp3325928ejs;
        Sun, 20 Aug 2023 23:18:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSyMgz+kcLFt7/dyo0GJLZunQaSGlpRUgApxmk8QN+LnUFhfjPEltjh7m2ZbWrFqfqhxIb
X-Received: by 2002:a67:ff91:0:b0:44d:4aa1:9d44 with SMTP id v17-20020a67ff91000000b0044d4aa19d44mr546043vsq.8.1692598717956;
        Sun, 20 Aug 2023 23:18:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692598717; cv=none;
        d=google.com; s=arc-20160816;
        b=GK4o+ohTVI00HuaQFCY6Wj00la0AydKcnbvYT8t7qJQf9om+CMJhb4+dbWBopR16Jk
         nWQzzqsDMgnA5GfxO+hRCZRhdoPuGTrHR5W3LV/oO3NRGuWFfxu3475OU1+Pt9hIWxeh
         g1vL3nVFq9g7V5Ud+Tv7b+pZrZVKzWGh/G50AKISFOCKuODMek2kQjoAYoW9M88Y1Rrd
         QqllkUIKnUBxlF20I30LRA4bJvzqzXwneEsOOjjdo75uFlgBJv3KjabltFCPEoMxiY3w
         xSbHhtRhLxJhjaDCnFh4hDTN6q3XRVErtZfeFPwvDNQYdBGyTyiXnNYHCdMXq/pihFtC
         HGSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=gl1eOXu8iN7Kzx956eSc8+DM/IwL9/EWz9C+OcIYleo=;
        fh=I3ROdjL7h0WWLArn7HUzKwjXf27njlP14FAmu/F64/s=;
        b=T2IbWLZv9973dYfc4Yy/dzjQzOQxYfSYSwTO+248mNm84TPXLByKlCIJQyrdufuBGA
         YwVo0Ug7EJfiPqCSDqvFwDWHBOYBTRsWYmgtdB+0Ujg3MACMYiNhDPtc3tYUIrNerFgU
         r7zlf8eddRniYSWKY1mEHt0uoCn/RhGvAAVb40HD+ekV93/r6eCBw8TwUYX64SHACRF2
         1kNFhXqZ5CWdqYvdGd9FmaVTjEk+eiCt7Ro/FmiOVvgEKJqkKYS4+bQ3QOBMkdDRvpbq
         UuWo+WmpHZgTetKMwbIr1ovMKW0sW13Sud0rBXOXGbyrRzEI1rJdtPJmE+WlyCAtxwnH
         jKSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G6wbMkku;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h8-20020a0cf448000000b0064f3bee93a7si1485477qvm.143.2023.08.20.23.18.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 20 Aug 2023 23:18:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G6wbMkku;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qXyEq-0001tg-Ab; Mon, 21 Aug 2023 02:18:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qXyEo-0001t1-2k
 for qemu-arm@nongnu.org; Mon, 21 Aug 2023 02:18:06 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qXyEl-0006BL-Ns
 for qemu-arm@nongnu.org; Mon, 21 Aug 2023 02:18:05 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-307d58b3efbso2646646f8f.0
 for <qemu-arm@nongnu.org>; Sun, 20 Aug 2023 23:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692598682; x=1693203482;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gl1eOXu8iN7Kzx956eSc8+DM/IwL9/EWz9C+OcIYleo=;
 b=G6wbMkkuVZuzvgda16Ed2H0QKsO4W/bBecLy9OIOqZ9Rg2lGl07aozi6HADgGHYD5a
 L6GgtpFgFHBIE0dpw6WQdvHy81Myec1C1lPDJc/+YiN3wRHS2QMj4HRTHiVufNBWo7lg
 TAWlA1eTitXfbpXQZwDOCdjS1v48BDtbW20Sb5QTSnipsswzmXro4dlLUvaD48sL9Q66
 eketLE7AOfczr3IK7HmIMU+AgPm+wHRY+YUYPYkZgszvJUMfoNOUlKSb4qdmgOW1qhXa
 ZqB1hQBHE7/5YtqtSVTWsHQaSryIgitNlnv0GpEd0F4g4YxNzSXYB3iw5lYBAEOBh26l
 VKHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692598682; x=1693203482;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gl1eOXu8iN7Kzx956eSc8+DM/IwL9/EWz9C+OcIYleo=;
 b=l0nA5e5JxrI4BpywMmmQOBoWHOfV6tzGWEfIBV/WQ4I/HH86iezTQvSI4dFOUp5UCW
 NCybZEI0PeGBakzwrCUgTuw9NYIOUPuRrdX8n3o/y3RYRQURY6rP3yxgllEZ3oBi02yA
 nys+csVzblY6kagFNOtGN6BQgO0ksArVAKaE1VKFI5ii237HMe5LiTQAwSJEjBifLib7
 uWPRPUI6ykLUhJGs+mOEdyZ5Ga5+75X9lCK5ixOzEtqmk4mDuw7R/RE5+TU0JZoyQ5Uk
 I3sVSto2jXEMWwdOFjVqiDe8O0WMTzgCLZJmQCQQrKis6yDw+2e4DIiVa7RFQRMaOt3K
 UKjQ==
X-Gm-Message-State: AOJu0Yy4bU6IV9soBmZFmklC0O7vBDiJr9CHlbbzrX1jMCVnlR2CL2FA
 wCmtyS++VZhdhrQx07e5Ka7hLk3DgSGd0Rv6ixM=
X-Received: by 2002:a5d:5962:0:b0:319:7b96:a1be with SMTP id
 e34-20020a5d5962000000b003197b96a1bemr3274272wri.71.1692598681971; 
 Sun, 20 Aug 2023 23:18:01 -0700 (PDT)
Received: from [192.168.69.115] (static-176-182-122-208.ncc.abo.bbox.fr.
 [176.182.122.208]) by smtp.gmail.com with ESMTPSA id
 n16-20020adfe790000000b0030ae53550f5sm11153442wrm.51.2023.08.20.23.18.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 20 Aug 2023 23:18:01 -0700 (PDT)
Message-ID: <d4465e1c-c01d-568a-a002-818f56a391e6@linaro.org>
Date: Mon, 21 Aug 2023 08:18:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [PATCH] target/arm: Fix 64-bit SSRA
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-stable@nongnu.org
References: <20230821022025.397682-1-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230821022025.397682-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.279,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: cMxefDzohtzC

On 21/8/23 04:20, Richard Henderson wrote:
> Typo applied byte-wise shift instead of double-word shift.
> 
> Cc: qemu-stable@nongnu.org
> Fixes: 631e565450c ("target/arm: Create gen_gvec_[us]sra")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1779
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/tcg/translate.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

