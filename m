Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp2229043njc;
        Mon, 22 Jul 2024 18:14:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUNWBuv9/CLzWXoXEJAd0kZQQM3Is9P/3EZnbh1arzVeVQljsqY4AZW3OPObBxXPQaXsTcy9f3m493uAah3MP/GnHJJukeB
X-Google-Smtp-Source: AGHT+IHx7JqCafL/ES/KsFJaUUO1+0KpL73AsxDR6l76cfEyLq4lJmG8teZLYzZZ0pI7thP1lQ5M
X-Received: by 2002:a05:620a:4446:b0:79f:197d:fe88 with SMTP id af79cd13be357-7a1c06b835emr201725585a.7.1721697251596;
        Mon, 22 Jul 2024 18:14:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721697251; cv=none;
        d=google.com; s=arc-20160816;
        b=IEAw20WHZPHDE3w34sIlV05qAd5QturrrHHKUCWgKb7Zxw61egEzJhorRNFEwbdk10
         4rjn9rG/5TdprH+RxRBA3vbN6WO1fk2V7hHmLKnkh91x7+Hg3TrVnrPlHxxhC/VrtZkv
         YVDUKixR3VtWzNgdkd20pK3CwgfRdsm4oQtyQ0OeCjVrDc/ihC5WaI3pZbcXqSEzIEvd
         HKcs3W5/Ba8ZdT7uDAiNyUVX/WGJwBaOvYwX08Gw74uKZq2FQyZFFPyMyx2GXlLgWDD4
         b7Vhlk8oWFU4pTHhbIRdII39LfpwN8eZ9b4Pau/5+rSAAN87WIfqt8bAiDXA39lanJqx
         7D7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=/9saZgItypPDjS++JM/jS4biXVHQ8w1Nms9b4HyS/3k=;
        fh=f7xNRJPksXfOgdgcdCHDvHI6YPDP+b0QRIunT+yCIvk=;
        b=J9fQpq8YM3w72nIb+E8AHHk9CV+EsWaySXp2bNx8o2t1nhdOU+abll2vvKl/r97JQ2
         1DtjyI04jH1QWhtF/clpevU8wj7fVhFdF7rsTj2XWC9bh1qqp/5Urc67YdLG6g8K203D
         sl7IJFZ7B5ugLWqwqeUDAuOEnkW+DH6G6k33PuSRX0f/qJ2pFCMFEPjcPXQ4XnASwgAJ
         /jSWnii0w8CEmUyQEuPNQwyIcdTVb0FcSZuQOnqj0C8YBpEs8u7H2LR6ySI3uZ3nyfeP
         f27SO9beSrNsT5vepAommOFjZUQytrBiDMuu63UCITurOasyc3PzOJO7POVxXmk1lzp6
         VDvw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rKbr9rTT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44f9cf02294si92205861cf.648.2024.07.22.18.14.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jul 2024 18:14:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rKbr9rTT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sW468-0001tr-Ge; Mon, 22 Jul 2024 21:13:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sW467-0001od-7s
 for qemu-arm@nongnu.org; Mon, 22 Jul 2024 21:13:47 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sW464-0001cB-SS
 for qemu-arm@nongnu.org; Mon, 22 Jul 2024 21:13:46 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-70aec66c936so2728163b3a.0
 for <qemu-arm@nongnu.org>; Mon, 22 Jul 2024 18:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721697223; x=1722302023; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/9saZgItypPDjS++JM/jS4biXVHQ8w1Nms9b4HyS/3k=;
 b=rKbr9rTTYEsduUKiigoPBl/odtruHgOXYZ72EAiZvYYk7ZxCSVMgeBTQIaKXevg8sw
 u4c3+2+jVXFJ5sntWdgKyEXeMJkbDuC7o4b45wzVfnunQUklxL0u4s4fVGQbrNgb8n8n
 TsmpecG3io3SSdb+q9OJuTa1/4ecelNjt9OHcRdrW/m4VKdxteaGH+GM81z05jGBNOCH
 kgi1I2DB011KnchXxpK4nsRIOlKd/udPkFvkQ8YNLM8ijO2UiAmqGYbvg5JegGsSHNWu
 5Vnli6lnl/UGFFUdlLJfAI73TiUZFVqfBL79DC+g3SWXNSwgdHDzVFLXAwHgQCpNkEjl
 dNkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721697223; x=1722302023;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/9saZgItypPDjS++JM/jS4biXVHQ8w1Nms9b4HyS/3k=;
 b=Ot8Q97GSTd4dHvWj7wZSN6P4tto29jIAiWgUxZqQyW3ccjbdpkuSEZHxfiG+7+AcQS
 Ms+reCOBjnQ4rveCu/2gZw/wDUr70veiNCX3wbtpBQWceZPQYDSEQoxGkw6o6UxG2hMu
 mGc1eJmiJOE3M9542os4qfIkH2C4iw36QF5PhpcBXhMCjr9lwNKFKl4MJ7H1qkqtR6IM
 +g8pqRZT/9gbjxznH6EtUF6R88BVzQDTJdGyfC8bak4N2LPGduev+t5mRBo6ijSYL/Lz
 SaYcqTfxx7HQAf6Ugn7c8SLHk7hXM1ivoYdZmormnZxyHwQd/EkSgas3FCGHjiF0PZk+
 6xdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCOflvUnp60zIFKCQIe5UIAygf2pzX0il30zUe24GRnk831ZXM4AvbX+ncrB/qsEfQadDweLEnxmg/J1DWdPk6jWgI
X-Gm-Message-State: AOJu0YxCoLQcCUeG394V7qBt4I0A9yVtVx40MT/53s5OKlMgaW6JMiBc
 rHRoj5ZWlgwELcJl5KzbVbaQVvtHE9mLsg0S+g6ivOYdyQu1hBXR64eXkEbQl4Y=
X-Received: by 2002:a05:6a00:1744:b0:70d:3438:9689 with SMTP id
 d2e1a72fcca58-70d3a874509mr2109726b3a.5.1721697222884; 
 Mon, 22 Jul 2024 18:13:42 -0700 (PDT)
Received: from [192.168.1.113] ([203.56.128.103])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70cff59e358sm5948733b3a.167.2024.07.22.18.13.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jul 2024 18:13:42 -0700 (PDT)
Message-ID: <755440ab-5d66-485a-aa13-dd352c558be9@linaro.org>
Date: Tue, 23 Jul 2024 11:13:36 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/14] bsd-user: Sync fork_start/fork_end with linux-user
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Jessica Clarke <jrtc27@jrtc27.com>
References: <20240722214313.89503-1-imp@bsdimp.com>
 <20240722214313.89503-12-imp@bsdimp.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240722214313.89503-12-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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
X-TUID: /4Xd8mSxS8Ry

On 7/23/24 07:43, Warner Losh wrote:
> -        /*
> -         * Child processes created by fork() only have a single thread.  Discard
> -         * information about the parent threads.
> -         */
> +        /* Child processes created by fork() only have a single thread.
> +           Discard information about the parent threads.  */

This comment should stay formatted the way it is, per coding style.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
