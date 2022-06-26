Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp1426133lft;
        Sat, 25 Jun 2022 20:38:12 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sEo4BVZuUimZ+LuvK0XDJncrJO9pN5XAP+kpDkFUeUkK0cUJOoH5hJIaWk8EJelFvjhItr
X-Received: by 2002:ac8:4e82:0:b0:305:c4a:37cd with SMTP id 2-20020ac84e82000000b003050c4a37cdmr5076057qtp.106.1656214692596;
        Sat, 25 Jun 2022 20:38:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656214692; cv=none;
        d=google.com; s=arc-20160816;
        b=QjSsEDQ2Sn7LTgmQJFiQLIjdy/28nBmvdfcUrBzehPiziHs7EsPLNxfFbnmo81vjiC
         0xu7mYlDDkud6oL5glxeHyo2SJbHXR3sMm6DL7FLCiEmRgbHxW9+D+Algj4/zdd2FPif
         95Ybd0J9UzhZLyJ//aEri4FqiAAfPiyT1pXzQXUxy5lCytVySJzJk/fcFs6OVB55bVD6
         48aK3TE71E+NoAvjOjkbWWJiKnhHvc/bLfr0mE1cfS5UDKlSF75mee9YuDCjttQzeRwU
         ujUMk1n86FPxCDTH0zAuehR2QXjg/3s9FkiM5rwAooPD4X8r20tNAHu/q8HnsG+rJ2+R
         GlEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=fJNzNynPbmLmwXk/EBwjTxTWNWtbFcYQklW5/Hi/ouY=;
        b=PXZRIyXN+cOGQXt9O4i3sDyHk4Wf38bAyN39asfwKxXRfuO08zqPnGPCG0zITCVkkL
         SNVPN1R4uFABEY46aboGI2vjXf3E90mYaaV7y+XteZ/Lq2ZtOnZ6koojB0UwJeEpAQtm
         odmyEIvi6GhMwC1lqmld53IxR5EzzxT+FT9punwz4GQR+GhzzSXnkYjuRgBq9TKcCeQV
         U6kpK48lWj971jVTlzvw7wKjdwpC9OQYvX6++CcNICpDudpiR2J45zdBrM4xQoC2O3rY
         xb6WGNOWwjSKR2lN8ljKdX92qovUj1YwNTu+czoTI5Lind7njNevGYn25N2n/GOlK1+G
         xGjg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LUmBxAHE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s9-20020a05622a018900b00317cd404d14si3360726qtw.561.2022.06.25.20.38.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 25 Jun 2022 20:38:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LUmBxAHE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o5J6B-0001kr-Tl
	for alex.bennee@linaro.org; Sat, 25 Jun 2022 23:38:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o5J5q-0001kL-Sn
 for qemu-arm@nongnu.org; Sat, 25 Jun 2022 23:37:50 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:34628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o5J5j-0006Zo-Et
 for qemu-arm@nongnu.org; Sat, 25 Jun 2022 23:37:44 -0400
Received: by mail-pf1-x42c.google.com with SMTP id t21so6001122pfq.1
 for <qemu-arm@nongnu.org>; Sat, 25 Jun 2022 20:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=fJNzNynPbmLmwXk/EBwjTxTWNWtbFcYQklW5/Hi/ouY=;
 b=LUmBxAHEX/p6K1eNZqkok6oAzSA8z2Uedq/H+th2o481BsLIp0AzwyiJUvH4JQZ1Po
 nlsJ/OZqAytKed+cMHP/YPZOMw+0fymp8vCCU1qQcNjblvZqML0YJcjCGMD1m/Z9npDa
 FFiMEJw4iIUF+0G4OGcDUnpdoHOnY8rSOGsrJ/IXYIQlT3ho2HIefWS4787UiytD1di9
 WEGRyjnZDmA7FrbCM6h5S9WhxzWZxoz5N07bsccwz9sPT+XOsC+yDBf3NTEaGiAmPYyv
 KnXXvs7g76CV9T/FgiL1lZd9RpM0u4h9CXJ22wxYYNhiEPi4FFTbXgzTichG27PK86ps
 b3Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fJNzNynPbmLmwXk/EBwjTxTWNWtbFcYQklW5/Hi/ouY=;
 b=7Pc+tyMh/5L4+XMbX0ha0F+Ei194q5RY0CP53GIlGPN2mc/K6wiTBcS3aP5GmTltJi
 dup5PPNt7gNXlWE1czl+eQo4gmqz3Q7J0E9PdNfwMMow88qC0tC2mgBpKMqxFrI/QiOT
 AKDqR1vSdwoY6jV/SiyFtCCNakD7zU1WAnnqyIM0U/Cs3WxW7k0+PP/uKwGo5uJhBg0m
 BbLMx5hrYzuo1dWLXePI4bo9rT1NtzVqeYVsf0kDbc962yWTN5MyzUC7lNsp8jtdDSN7
 7oH66ivR44BMAtOJ9bg5pPGyG+vAcLDCoIq7ypsv3aTVA53MfPyVxuCqyBicUXAbNGiE
 uHdw==
X-Gm-Message-State: AJIora+xwEMEJsyu1bywovb8JJZgmbYa+1WMRPk/JDlPKSc3JLM0gWgO
 +fnloOJ3xEo3JNf2ypuK+T3LXg==
X-Received: by 2002:a05:6a00:a8f:b0:51b:5ca1:47f1 with SMTP id
 b15-20020a056a000a8f00b0051b5ca147f1mr7403847pfl.50.1656214658717; 
 Sat, 25 Jun 2022 20:37:38 -0700 (PDT)
Received: from [10.10.67.53] ([116.12.83.234])
 by smtp.gmail.com with ESMTPSA id
 u14-20020a170903124e00b0015ee60ef65bsm4382006plh.260.2022.06.25.20.37.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Jun 2022 20:37:38 -0700 (PDT)
Message-ID: <3094471f-5b5a-1613-5d48-504a9f997a12@linaro.org>
Date: Sun, 26 Jun 2022 09:07:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 22/51] target/arm: Trap AdvSIMD usage when Streaming
 SVE is active
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220620175235.60881-1-richard.henderson@linaro.org>
 <20220620175235.60881-23-richard.henderson@linaro.org>
 <CAFEAcA-9XuMV06P_A079c24xeUGuxOQ2hR+mxwJy-fA3xVS+Ug@mail.gmail.com>
 <eecb93a9-0f5a-2a40-eef5-3a5fe0a2079b@linaro.org>
 <CAFEAcA8pVo_ua62r4SvUC242afcJvD-1EHSV28OY8GpWtpjq0A@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA8pVo_ua62r4SvUC242afcJvD-1EHSV28OY8GpWtpjq0A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bo6gDohx8dEt

On 6/24/22 14:38, Peter Maydell wrote:
>> Can we use this solution in the short term, and fix up advsimd while coverting it to
>> decodetree?  I'm more and more convinced we'll want this sooner than later.
> 
> Yeah, I guess so. Is it possible to do the SVE stuff the right
> long-term way and have the short-term fix only for the A64 AdvSIMD,
> or do we need to do both the same way ?

I could change sve now, yes.  I'll try and find a reasonable split: more than 1 and less 
than 50 patches.  :-)


r~

