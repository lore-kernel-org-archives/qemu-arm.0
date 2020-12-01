Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp164135lfb;
        Tue, 1 Dec 2020 05:40:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxg1XA3qCntVd8YnteW5IacneKYNcFUnKAHZy1pC/SR8vqQ9RegF0HcftjY8EMcOgkz2rGE
X-Received: by 2002:a25:1987:: with SMTP id 129mr3209020ybz.188.1606830056851;
        Tue, 01 Dec 2020 05:40:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606830056; cv=none;
        d=google.com; s=arc-20160816;
        b=IZqo7CMqF7l0bzPbYa2aboIAfQS7ejui6Uow4oRWkYqt7S1zvz+HAF8XCi0AygDv5I
         Jl8hHzEOmmMTKqFtgFsSxlsPVZWNzRwmUsy7Sn/UbMzAZKgE1QMqxAWKjBerDmFbNOu5
         PSV4mEBkwPyebY5Q4IzZXM1f6jQWsTkIUtsYXZ6f/qcFYkh09GDKyHqRW30LQFSN99LQ
         RLNsZEu6STI4gOor+K0/IS4nnMT916zXoSvjEKuJmX4Hqff9cD/wbMOCNDIFVVOp0eIs
         Wd2mIGA7+YrPXz1Xv20sgQ+refGQPxbVCxKr9VrSjHhzTbTN1ruScu+hmD2FuNqSrJYr
         gYFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=G/ptSAaY3XZJ2aosnjTtTSy/4gOV9yDdfEjmAvdYVe0=;
        b=piVklQBM0TSJudBL83RA2EtLDdsDUGNnjUpBwIz+5UzUoOt9jofD+ouyZK4fLfCcPq
         UFgvTKVL1RK+Tca3LAF/v8u6w/3XZ9dB43EhalwL/ryWRqJXCDWi3HghOzBqoIJ0FE9q
         THYC6SDzdhU7nqJjubevZKyXsjSdO2H5F24BtyyMiUEWudzqbyPyjcQNHXqoMbLgLAO4
         Lg0JRFSBPcIy2d15NIbDQBjswyiv1TmzQnE0yni8fN1UjcYExH6sCR3bPLv/xfIZZvYK
         XyelharDm6fGyf+hhASQ5YKjBO5FVMUwLRRlAObOZK0jBbaiNC4EgnlA6eKDrPWL4exg
         TcXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TMnxGIjF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y5si1679933ybq.284.2020.12.01.05.40.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Dec 2020 05:40:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TMnxGIjF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kk5to-0003Zw-28
	for alex.bennee@linaro.org; Tue, 01 Dec 2020 08:40:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kk5t9-0003XW-Sy
 for qemu-arm@nongnu.org; Tue, 01 Dec 2020 08:40:15 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:33751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kk5t8-00020W-3R
 for qemu-arm@nongnu.org; Tue, 01 Dec 2020 08:40:15 -0500
Received: by mail-oi1-x243.google.com with SMTP id k26so1775606oiw.0
 for <qemu-arm@nongnu.org>; Tue, 01 Dec 2020 05:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=G/ptSAaY3XZJ2aosnjTtTSy/4gOV9yDdfEjmAvdYVe0=;
 b=TMnxGIjFB7HPQVGS/FQmsf7pvtfFcuEr1i6rJZ9TIM+pMhbgY5VT0Pc7OFc/BtABf6
 pwnx/uAMREv0OCivazsXSCyEgX5FgcFsZ3U8KZq/CeKPwJLb4VLy1DYL097t4Ex2bhg8
 54I/APw1s6H4pPKQtrlMDBg12iSwAcSwFmTKJ7N9F3VZkQaoccZD9jsUwhUx9CnW3Aoo
 AwinmaxiRYKhkd/uF/VgWl2PpxinHCIbe805TICo08VEnNUAsoT2FouJ0AFjR/jReCpP
 lREp9w5wz8WAvcONXFsBbiqSMRXhCMOfH8SaxM3zsQ9LSkiwzZUixok4wpBcCMNUgZ6n
 w1dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=G/ptSAaY3XZJ2aosnjTtTSy/4gOV9yDdfEjmAvdYVe0=;
 b=CZ9XZwILYo8oFkwwA5+cc47JQv8vMZbEgtEE7qAb7Y2FGJ+9COq2JlGStWaT14PytB
 NUcHBrri5XWwmwEjWbB6VxX5M/CvseuVuWTm0Y51LGqTJiDQNDzOb66L480QVL0Z6v21
 xblzrbkWW8od0tfuAKztBSXe+AdLI9gplZn6rSA4NBbOPMAqwJK/76FUj5n0vxzVzBAp
 4bnHmd30gBU11ZIdmzG+ceCi1axkxIh8Ntu3BTGUVgHsI1Vsj7Au1fNX140lIwFWNUI0
 qeUklaC1vUq0V+NbomL7VQ68v7EKdFX+3LnJu2HGx1pCdxnHM51TmRWKTfL4qDlS+SZk
 N3mw==
X-Gm-Message-State: AOAM532fNQmvjr8KFPkLOKz1fsNFg93gFVaEufj4dF9Fr5KqzYo3H9M8
 Tc3fTajER6l7zLZl6h5mtn8F0g==
X-Received: by 2002:aca:496:: with SMTP id 144mr1691460oie.136.1606830012797; 
 Tue, 01 Dec 2020 05:40:12 -0800 (PST)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id c1sm366276ots.68.2020.12.01.05.40.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Dec 2020 05:40:12 -0800 (PST)
Subject: Re: [PATCH v2 13/28] target/arm: Implement FPCXT_S fp system register
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20201119215617.29887-1-peter.maydell@linaro.org>
 <20201119215617.29887-14-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e7e1b95a-4616-a83a-c20a-3e1933ad4c54@linaro.org>
Date: Tue, 1 Dec 2020 07:40:10 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201119215617.29887-14-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::243;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x243.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-TUID: c8iI8vqZfbIy

On 11/19/20 3:56 PM, Peter Maydell wrote:
> Implement the new-in-v8.1M FPCXT_S floating point system register.
> This is for saving and restoring the secure floating point context,
> and it reads and writes bits [27:0] from the FPSCR and the
> CONTROL.SFPA bit in bit [31].
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-vfp.c.inc | 58 ++++++++++++++++++++++++++++++++++
>  1 file changed, 58 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
