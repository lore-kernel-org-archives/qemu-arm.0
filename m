Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp1842980lfc;
        Fri, 28 Aug 2020 15:53:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwRtGW03rZd5zFX5iNjwnNGQ5pYRF5XHw0bHnJyfGD4+h2ZK7tkryZrR+43mM3QHtw4xK9M
X-Received: by 2002:a25:3b4a:: with SMTP id i71mr5311963yba.464.1598655215142;
        Fri, 28 Aug 2020 15:53:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598655215; cv=none;
        d=google.com; s=arc-20160816;
        b=M/1qd1OC5dnlJ3dNu3Hkz0p5dgdOr7ShFIPjHRJu6eONeBtRPFnP0XIgQY1t/o/Iu+
         KjSTT6oCVntULwi319jqtN4iWBBS2U+V25BsTIpwureFLgoh4lH0PnZwL2b5IXMGpw2F
         utd7IVd13P7Bw6t0FLYKAaTPH6sqc+Ycars78dOTeg50V3594ZtP6sUkSXadxswV14K4
         K0EQ0XvufIGERcFopFkcVp53dQ5UMPAeeA9EPHwEGTsOQ7jmJV06jXQ0rDrIUNNYQgEy
         S7jAjzuFZilheKCRCpCbeLW5Y6dz/2fBf6zawNxW59ZW2BXTcWMWi4I/5PNl3kIPNFD3
         lcvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=qZMBGY1sYFrOWoXC23RgfrMfKmeOv0aCQr6EtuQHPUo=;
        b=ZZ2M+hTPdxGOQpaB4bPgKY1P0uAl35fkK2Trw2Btu3kcp2Ls7Or1nhYaTqiqUvN1bx
         5cy/Ub+rG+LMMoxJDPRW52sw7Y2NQSXluzw6Up7aPn5cMen59MS6vK4ClNtkp1JZ/evZ
         /SBJfPkoaj+kYi7Jv17qrRzBe3lcg9I9HZOZoasSLz+SVTf0IudGKfuENnldo41kIFFR
         DR0ChaTgQ9yb8eI3I7LrUmMnV8lQhezCP/jY9CmQH21e8niOeOpSuR202daHiQSLAcak
         J5G9cuSoTxMMiajYt2/vJghjqgxNLluPKbHhqrHfLARzZKo9R0H6k/WAB+fqSfrlMoHV
         H3gQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G0POt68J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 124si583581ybz.22.2020.08.28.15.53.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Aug 2020 15:53:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G0POt68J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kBnFW-0006dd-H0
	for alex.bennee@linaro.org; Fri, 28 Aug 2020 18:53:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kBnFO-0006cv-2B
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 18:53:26 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:33587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kBnFL-0002mm-Ql
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 18:53:25 -0400
Received: by mail-pg1-x544.google.com with SMTP id o13so1124220pgf.0
 for <qemu-arm@nongnu.org>; Fri, 28 Aug 2020 15:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qZMBGY1sYFrOWoXC23RgfrMfKmeOv0aCQr6EtuQHPUo=;
 b=G0POt68Ji8gQlonMjJWKCKTD5LmlzCTuh34V1n71xEvxgT1C9Z3Ilgwn1wqL/uI7xO
 4OPHbiGUEggPbJ1AE+7j8NU67cFgJMnGHMICAbsWPAszp81gfrk2GmZ4QkUDRAiheUJU
 do0D+MERfSr3IYWZa2dSa1yztzdq9N2wL2vC9iir6XC5UagTSA/w+z7Dc6vrYNHVr2Ts
 EUdg+qGsQKyNPlAiWcpo6WZvYN9IW3yFVNzUf00sbQ6GgSHTPladFzFuv62EnT7o7Oy0
 iFqI6mE+5yH3oJ+tD3ZD4uCfK2D1wczb2pRzAHDdGSL6wElD8uSVbR6RRKeUkCZIygRE
 TopQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qZMBGY1sYFrOWoXC23RgfrMfKmeOv0aCQr6EtuQHPUo=;
 b=SSlC1CL+n6/Yr7prHSUzMogaveUim4RicmC/Ycc+x0UKYQwhZcT6nuZNmHSlrvNb4/
 bDJb1dFfV26fsrJDuzsG1XXO0+RYc5nRS633Y30xBAZFbZRayYRXphICEqi8qU9pnYSo
 nzlBj4jq8VZbWNL7kTb0Qp4BxMG1Jq8sst0xd3mJozsjkpSU9B/hx0DQWVPHPmqtwqxY
 rhPKWgYNA2Mp9MHF3rgiHwnETJ4C8FK5mgwTA5MNRXEkXCcOwKRqi2uz5vEF3gIJkpdW
 V6oHmqvZVE/ZCuLnCCUttlHv8iXpD5OPRWgyCGKOn/+8G5pxgNKRZjaHn+HTIzYnFaJt
 U02w==
X-Gm-Message-State: AOAM5316jhEDbhKIC8n+QGu0Hxx93Vb4EXeDULYOzUngfKx5SWQqiRA8
 c5kog3ba0WZwdKCBa42TXbER2g==
X-Received: by 2002:a65:6897:: with SMTP id e23mr721892pgt.103.1598655201523; 
 Fri, 28 Aug 2020 15:53:21 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id y7sm338105pjm.3.2020.08.28.15.53.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Aug 2020 15:53:20 -0700 (PDT)
Subject: Re: [PATCH v2 24/45] target/arm: Implement fp16 for Neon VRECPE,
 VRSQRTE using gvec
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200828183354.27913-1-peter.maydell@linaro.org>
 <20200828183354.27913-25-peter.maydell@linaro.org>
 <55675521-a61c-186c-599f-7373e9165184@linaro.org>
 <CAFEAcA87JLog+Ly5wvRi2bOvwDvFVL5mjpnkeB3h+pckbnNMmQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2007993d-9f64-dca5-5fd9-510c87cd8e86@linaro.org>
Date: Fri, 28 Aug 2020 15:53:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA87JLog+Ly5wvRi2bOvwDvFVL5mjpnkeB3h+pckbnNMmQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::544;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.809,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /N1zaEJwLAH9

On 8/28/20 2:40 PM, Peter Maydell wrote:
> The other approach would be to standardize on "the decodetree pattern
> always converts the size to the data-type size, regardless of how
> it's encoded in the insn fields", and then you could check against
> MO_16 here. Would that be better ?

That might be clearer, yes.  Otherwise it's hard to tell what "size" means
without looking at the manual for each instance.


r~
