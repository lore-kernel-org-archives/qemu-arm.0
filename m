Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1007527lfm;
        Fri, 19 Jun 2020 15:36:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxY26LfyfWekFFu1OxsK1ws1JPcpPD41nleeWUYKe0TU91od022wRy6p4ylr9+NPhcmavPi
X-Received: by 2002:a25:d684:: with SMTP id n126mr10273166ybg.476.1592606215092;
        Fri, 19 Jun 2020 15:36:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592606215; cv=none;
        d=google.com; s=arc-20160816;
        b=GENG00h8EnjktMdI4MtR2Ykm6Y4W1J4/nOMsUx1xCuju1VyYMsQRXoA78r4rnq5VJt
         +zWSO9QVQM/aVJS+w9eOenXcJ9gpdx4Uj5+diknSq/xHauMqMsZcLJlvCbTxPTGxE+80
         t/9szQLFUiSoCq093zMu0Dwvnwvd8XeBaMC2hrqnKn3zT8j50Eln64UU+3fzdkCuHWmg
         rz58H+pLXDVHHSKsaVVKRfSZewObLk8fWBv369RlzKK6cxdsaQbA4nac5sqx9QRIqVsi
         n2CsW5uE+AjMdJ0M/ekdGXVB1of0BcAH/wRae9Bs4XQmtFpywPt8/fzWWZ5xSNX1POHu
         xA3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=hLVqqCghvfYDRZyz8EhKaK9PowVzIvkh+wHhcQzhoN4=;
        b=ClDCbmkYNXQSbyi8XtFt+ynIZqdA8c2Q3RXHNbcI+iSlQeTuA03aLH+LjxV4QJs/p2
         9tkY4NhEjSNlkdgV/Rkb4jsahEl4Ty+Vbh74hAcds9PLWcR3rEZGkIz+awRDR7ioNdN/
         sT0Qaba/LhqFj4FyQBAh12Kj3tnfetQgVsLmYkKO1zEMwOte08JiJ/56a+gKqyflC868
         12ByXN83rVuSnAfKncwOhLQlw8BR8kMvVqI50QJZY82w3IqqQTIif1IRDyyoQK+HL151
         HnrL0jGyjPJ5/IRxExnzj9gulB4kLTFxzmGPC9kLAJOANCF3UL0ydaaA3jRZ8qfSNmlb
         pTMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Vx9Rkoyj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o23si5863812yba.275.2020.06.19.15.36.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jun 2020 15:36:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Vx9Rkoyj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jmPd0-0006Lw-GP
	for alex.bennee@linaro.org; Fri, 19 Jun 2020 18:36:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jmPcs-0006L5-Ke
 for qemu-arm@nongnu.org; Fri, 19 Jun 2020 18:36:46 -0400
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:32983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jmPcq-0000hn-Nl
 for qemu-arm@nongnu.org; Fri, 19 Jun 2020 18:36:46 -0400
Received: by mail-pj1-x1043.google.com with SMTP id b7so4825359pju.0
 for <qemu-arm@nongnu.org>; Fri, 19 Jun 2020 15:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=hLVqqCghvfYDRZyz8EhKaK9PowVzIvkh+wHhcQzhoN4=;
 b=Vx9RkoyjkNsgy8/IldfA047BkVum74atk5KM6+rh69Ot+bbG/sKsNbGC318hcR2IVu
 VyApcSksBWyO3WkDyyehDpsOXL8FtrHXYTeNUZjzUaKSiNROMv5pDMBDI9QRJqBlkYDU
 y+MgUfpmDF2VxU08j+QliJ4dnFpoWWtnJul4HKBBh/3O3jieaNyvGFFt1nf9UaMVpvf7
 AzbMZk3HQjojbAthj41ZfwX6RzwuH7p8iwiWkJqrIsAD8PtvOq6pl/LQZ/Z/UW+yZFLF
 A+exLw544TWq2Xdj443w1j9FbpfLp4MKZY+YuAhocCPKMh2cQVBqX3TNhwr1B932x5T3
 1KUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hLVqqCghvfYDRZyz8EhKaK9PowVzIvkh+wHhcQzhoN4=;
 b=YK7LlwwMNl3LtTlmiW9+zNZTX9opBLDcutfaD7Kn7Amo8HC8nbrye5b1PZBgZVwCzi
 Ex+ZHjnLaeshbURbckwSu21Tqr9ite5n70IXGxsUatDLiy5tcGuzY+RiZI0Kbr1FGKQ5
 6tUKSX2tq+Zm0RiEWdA6AJUmjR+PttDB8OKZ7QBI5BImx+jGuzjXUMRO9++yGH5auDy8
 P+G6/2ubIuNFQm+Jr3/3OzHtklcceaCAbFyfiyOc7TGoIGwxVB5Z4c4WEogeyRQdWx/R
 2nO7zAAzHstc0fIFzIFBNzaWYrNrShGmYFE3cWs8ymAXOfv5Z3atDsGWTCdVfp1TqvD8
 TvcQ==
X-Gm-Message-State: AOAM532VUa8okL/vJzy3Wd1XBKLnMFcA02MD7WpbCWIgUdWF/3qOrse5
 Zq6a0Cgo2dUl9inbc6KjvB2UFg==
X-Received: by 2002:a17:90a:d0c1:: with SMTP id
 y1mr5542811pjw.164.1592606203022; 
 Fri, 19 Jun 2020 15:36:43 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id x20sm5953687pjr.44.2020.06.19.15.36.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Jun 2020 15:36:42 -0700 (PDT)
Subject: Re: [PATCH 01/21] target/arm: Convert Neon 2-reg-misc VREV64 to
 decodetree
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200616170844.13318-1-peter.maydell@linaro.org>
 <20200616170844.13318-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <893f9cc5-b20d-04c6-a720-fdf89b72e851@linaro.org>
Date: Fri, 19 Jun 2020 15:36:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200616170844.13318-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1043;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1043.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-TUID: E+Hnhat2o7DV

On 6/16/20 10:08 AM, Peter Maydell wrote:
> Convert the Neon VREV64 insn from the 2-reg-misc grouping to decodetree.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/neon-dp.decode       | 12 ++++++++
>  target/arm/translate-neon.inc.c | 50 +++++++++++++++++++++++++++++++++
>  target/arm/translate.c          | 24 ++--------------
>  3 files changed, 64 insertions(+), 22 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
