Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp616090lfb;
        Mon, 4 May 2020 09:34:57 -0700 (PDT)
X-Google-Smtp-Source: APiQypKszENFysN+Svm5e4GLJPNAnHu70WHALma+sMegn+5Wqz7z5gbEwOgrUWK78QTFUi2B54Vp
X-Received: by 2002:a0c:e90a:: with SMTP id a10mr18112109qvo.124.1588610097195;
        Mon, 04 May 2020 09:34:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588610097; cv=none;
        d=google.com; s=arc-20160816;
        b=e1OweBOZc1V8VY4Y+dI8ug0cPzpWL5YtAlZseBwhTd33bSpGz7L7N8/OTl8gRLn5mU
         DU4y7SyWF8/NJSGnxsJ7WKXcpkcS3pls/6UjWUE0BIBoAkpmYpazRTihUkySvzXMulBb
         5Yi2dK3nQs5Qm/YDkXXM9paJEhq6ulwKjF4FwlccEVoPXpbOEmtljLFylrEXLAYmNJqx
         7NXGynfDotERoPFNTgleK4+gWuvRwnqDHNB4rPE+G/NhWGAzuFrVOqnk0u0hVRn0VBjL
         7LMbTNa+YMaPaPzoiQ7Czpwro/+r0vDhZU6tLn2R6pJOT5YfO/zXg4AS+s1oxdGKW3uJ
         zdSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Qzl7Xz9Nr1ACa3t3aRFh72lgGoWAE9Z+asQafjUbDlY=;
        b=d0+cljpvy6aF7V6wfGlZlCMBj416AeJ6byPonzLuXl8tz7JV5r55b7ZFi2CbaedpD7
         S2k9UZFui9w4D5FYRYlo+IEQUvFjavtkT3I5QZb18hrlovj0m+xpc3fs1pjGguWc++3g
         PM/sNfkuTNSEOQSzM1HlbbU9Lc/Y6OJD5cnUGuYR40/v+6JUbAr46MzcXTB/FF7z9SW1
         Cy+dPhadtW5O1D8rBy4ip+q3O9CifOTwGxB4rE/qVaGNEbooQrg498AP+sl3EFjB8cEq
         j0u5Pzk00rDzGJCzgqWR3YwPB6V7/Fhys9Wot61hQGNDXYkz32Zr/QquwRCc43PptvO0
         IZwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BVtI+uSI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id a26si6520524qto.322.2020.05.04.09.34.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 May 2020 09:34:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BVtI+uSI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jVe3U-0002Q9-Hu
	for alex.bennee@linaro.org; Mon, 04 May 2020 12:34:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jVe2C-00018Q-Pw
 for qemu-devel@nongnu.org; Mon, 04 May 2020 12:33:39 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:46779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jVe27-0007TD-O7
 for qemu-devel@nongnu.org; Mon, 04 May 2020 12:33:32 -0400
Received: by mail-pf1-x441.google.com with SMTP id 145so5732015pfw.13
 for <qemu-devel@nongnu.org>; Mon, 04 May 2020 09:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Qzl7Xz9Nr1ACa3t3aRFh72lgGoWAE9Z+asQafjUbDlY=;
 b=BVtI+uSI3ojFqJGMxTSnW7H1fTk9UHjxZ9ElggpziacbPy7nuV9g3L6yLtUCrgWYH+
 VlO7JxiACqkD5T8ZCG3UKINNIlkLb9rboykTYHhRE6cLR2kyRibj0ICo/DWv+jSkd0Dy
 T65EXsjy1qckjG+5fDJUXDmjqkU/CjBnLz4QHhG32RikfTA9hI0OYgg32mXUytR9DkJd
 KB4OrE9EhxrV6VrZL1CgHiHzaIh3Nl3B9ujZCWxytdTNQ97LdUlGnZZD+oQz8VjYjBIX
 kcaGooMA8qYEND2Pk/XC+YrzWzScQAdw+SRFhLqdl1d624yu77QVWuorNUWOtZlFg19P
 0NPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Qzl7Xz9Nr1ACa3t3aRFh72lgGoWAE9Z+asQafjUbDlY=;
 b=knHQieKxyyOJgaq2Q7N/C6GSnKS+y2WFB++5fMGorIeAMetqnGrdhST9A8TxGyjXqC
 Jcr5gYhiusjevigYGhbB8vewKjDXAL8aM6/I0abA9lpP7qk/zUQ7w1iiwIBHEMS5Twaf
 wIDWMjxMb8m+OERxuHlvau1/iIGhaFqlTdMES/Sk0TnnNyPLtSXGHJWhr5BagACyeC+n
 5VH77JDhVZjZofeEMLGv2+7DsjcpcguP9hNLwshMVTPBzVofRXjB5iYElg/8HFqSlpMX
 MVuh21EjsvEWlRmRZko4zLyaV5kohVpdO9yrlE6x44CxdIjV9l3WKwroc4tKrepvg/A1
 U+3Q==
X-Gm-Message-State: AGi0PuZJ5Miy2bSZ3R2ubHL2RQ/NuPlz4YCfJi/v6qya2tbcvKhwjV5G
 hHnakoTPp7BjnBOX0RlJRxtFMg==
X-Received: by 2002:a63:ef04:: with SMTP id u4mr17509122pgh.280.1588610009737; 
 Mon, 04 May 2020 09:33:29 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id b29sm240462pgn.15.2020.05.04.09.33.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 May 2020 09:33:29 -0700 (PDT)
Subject: Re: [PATCH RFC] target/arm: Implement SVE2 fp multiply-add long
To: Stephen Long <steplong@quicinc.com>, qemu-devel@nongnu.org
References: <20200504154303.5230-1-steplong@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9120944e-86a0-82b6-5d04-d679518616b7@linaro.org>
Date: Mon, 4 May 2020 09:33:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200504154303.5230-1-steplong@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::441;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, apazos@quicinc.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: h6eRjS924VP7

On 5/4/20 8:43 AM, Stephen Long wrote:
> +    for (i = 0; i < opr_sz; i += sizeof(float32)) {
> +        float32 nn = *(float16 *)(vn + H1_2(i + sel1));
> +        float32 mm = *(float16 *)(vm + H1_2(i + sel1));

For integers we could rely on C types for the extension.
For floating point, you need to call float16_to_float32 here.


r~
