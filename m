Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp697455njb;
        Fri, 6 Dec 2024 00:37:20 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW5kCY7+vbo63YtVVctU6FO1xF16EbnXCbI1uzzTXR13qmpMUsWhU7uhiQKUseZ+IgLMzLEWx980LfKug==@linaro.org
X-Google-Smtp-Source: AGHT+IG2Opj8VTokip3nzrCMMqHsW3rx+jnbamMnWilE3q1LMwQrMaEUtrJP21I2FQp8PQrYBfy9
X-Received: by 2002:a05:6214:2a89:b0:6d8:a32e:8426 with SMTP id 6a1803df08f44-6d8e70d6bfemr19226626d6.3.1733474240072;
        Fri, 06 Dec 2024 00:37:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733474240; cv=none;
        d=google.com; s=arc-20240605;
        b=WdwgewGw4affsjoUUVxpjzLma5PkliW6zdxIhZ3faO6pm5ObckYZYzgwCoEbKZ2mD5
         P4gYf/vcZa42q5WzM8tQElz56bFlt8NMU96f5ERgxDEdNv4yTl0YvtlhpIvN4rBXX4NR
         L9Ns9fq4ZufTlKOB2HzqInMVPLGq53xEgfgz1xqkaiaoCXsbmEBnBT+hWqvFQhSpqT0c
         utpJJOB+gjaVHr83AiE+U3DK/UNK5Htys59FnQItByH95Lo/GCoXR9h3LX3sF4fELOR4
         HpcWkLUTqrdxXu10knsiUC1e3AHMV8Oz0pQ1R/gvXQdOMEEgcf8DQb/N3nQ6qcmOF792
         MS3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=QCl3PHmt6qlGcM3ZvZDaCsEoIvJJJgXeqbaj9gb5HVM=;
        fh=d2lB1fAPiHKd26l6vFh8JDoP5FPy0sYlcDJfKBBSiwE=;
        b=gYWuhjjgOwoSW1nxVoPER1QEdt7guwnCAE+ovVyXsRJHVoVAMO0tmJMbtIL7yo9w5e
         /+rXycVccTOmLNdBWW/WdEg9XFJ8Bli3WZtsfg3JPonqNkT0rT7P7MXBFL8SOSgZX+Vk
         JK/ar8S/6YLzB011b/ZZgDXRauxOY0UG0yhdaEmGx5XXWY1KPU+aA/sdE07qpDbmlieW
         0U9rk6Yrn9TfG94hfnGCD90Q0/Vc4mF5lJLtLY2ycAJhlwCEBfTXO7MA73zQpYl3ra8e
         kgxpkHs/js5PYV5RtZp9G8JSefFQ+ABV+37sm2aFeDPwBPPQe2uSbQ5mN8hNQjBn6ph+
         734A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b0udav+b;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d8dac0b324si41350316d6.372.2024.12.06.00.37.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Dec 2024 00:37:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b0udav+b;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tJTpg-0002qE-TU; Fri, 06 Dec 2024 03:37:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tJTpZ-0002jg-KW
 for qemu-devel@nongnu.org; Fri, 06 Dec 2024 03:37:00 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tJTpU-0000a6-EP
 for qemu-devel@nongnu.org; Fri, 06 Dec 2024 03:36:55 -0500
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3862df95f92so203623f8f.2
 for <qemu-devel@nongnu.org>; Fri, 06 Dec 2024 00:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733474210; x=1734079010; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QCl3PHmt6qlGcM3ZvZDaCsEoIvJJJgXeqbaj9gb5HVM=;
 b=b0udav+b5vvr3nK9fCEEkkdJvRF5Guho60exIjRgBfeKdg6xRZedKQHGY3Te/ofgoH
 W9S3oanRTv+/051PZg5PTaGYsQw+npcPbykfswAip2MyRO7NjF6QM+jS8KF728UCvrT9
 syvEBdRToX1BjT6TMbEON9ADT7DrQEEYfBtoGwyegfeMqmLv7xT9wfxJZhK9rPYS31Cd
 aq6ecm7LyyI2u9ymdo16KIUrLdd7VxGmupVXxdUYbcgNlyj1oCNUxtQLtJhKZCAkSLpG
 oUCBwYT6X2kEyxFOX9XB4Rexml/1PWMibWlDKts7Do22A1NPzG4siA6hVswB6ZQRMPpe
 wGiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733474210; x=1734079010;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QCl3PHmt6qlGcM3ZvZDaCsEoIvJJJgXeqbaj9gb5HVM=;
 b=HmJrTMHuITSyAfntLe3FuTP87Iq6botiTq5jX8Mqid5ljGoy302KWlvaDI7GujeLHX
 ylC5GNYYIxJlRju7lce1cs3X1+a8qBtVOLY9OdXtWWRUJYPKenv4zu3pL13rno3iGezb
 8k4foGIHsfn3vp01VFsLX2zThlKzQPoOiyn9D3jUpPgkX033wgfIuYpiup0pJ4aiLEoX
 ozsRMp0MTviRaVcqWiR6u9N9fT/KjARL+6AUwD9C6mzhu4tUjSl4HtRv4fcqYdV7gVy5
 gNlSOCh9AssBXQpfOYOdhGpQOFHyNlMVGD6tuS6JZP9DidRz/mahmToLbUTLbYwEzukc
 lazQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWk6BtON1vuhOPq8pv1/MuP4TNFLLHi45nfXxMHgjWYiLhkqHLoPays0UUVn4D3P4BSoDwE91RLrd1r@nongnu.org
X-Gm-Message-State: AOJu0YwxjxFcTaPvgZvP/M2AkyjLdT7B6emvRBRLdhHzQw8sxFFeMyWX
 NaEMsSyrhHsHa336+5OUuzGiUAJHejybwtJ242Stm5bgI0daYeCglAG5ign2uac=
X-Gm-Gg: ASbGnctk/Oc8I+JxlAaD91yRXYZHuCHan2r2DzUYUIZs+seB7E9EPGEVm40SpTVQRHl
 4cRGoKFItrC3RDboo/fJE7foF96FgBidrAkSbH+/QxnrsY0EGFVFTCHTz9jXu/VrzpKHOgxUZvr
 w96bErFT5xO9pIs/g2Ib1MccSQxhv8ZRjI5gfbjlHQhGEAgmSUhX5juKGmk2tNLTUfzYz2nHm06
 Xn2J0PJLMtgz3gJtsffhi0A/96UQY4lMQp+G89nZKGITl1rEXQnCjw+l5GkvtUgaILAPMuxRBh0
 9Z3AdQmG0DG4CMS1+g==
X-Received: by 2002:a05:6000:1846:b0:385:e13c:5406 with SMTP id
 ffacd0b85a97d-3862b36ab39mr1600845f8f.21.1733474210026; 
 Fri, 06 Dec 2024 00:36:50 -0800 (PST)
Received: from [192.168.69.223] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3861fd46844sm3976953f8f.53.2024.12.06.00.36.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Dec 2024 00:36:49 -0800 (PST)
Message-ID: <4ab03d91-fedc-403f-840d-2989357356d9@linaro.org>
Date: Fri, 6 Dec 2024 09:36:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/9] target/arm: Convert vec_helper.c to fpst alias
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20241206031224.78525-1-richard.henderson@linaro.org>
 <20241206031224.78525-5-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241206031224.78525-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: pzwjiPNJ6AvT

On 6/12/24 04:12, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/helper.h         | 284 ++++++++++++++++++------------------
>   target/arm/tcg/helper-a64.h |  18 +--
>   target/arm/tcg/helper-sve.h |  12 +-
>   target/arm/tcg/vec_helper.c |  60 ++++----
>   4 files changed, 183 insertions(+), 191 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

