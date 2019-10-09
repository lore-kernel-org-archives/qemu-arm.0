Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp330126wrm;
        Tue, 8 Oct 2019 18:47:31 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzrtPnBBSCJDJyLf8CUHSksxbjWuWsQ+7nwLkiaQoUSQzWbFhd8kSiYIFGinFyd1Dbog06F
X-Received: by 2002:ad4:5044:: with SMTP id m4mr1325521qvq.85.1570585651706;
        Tue, 08 Oct 2019 18:47:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570585651; cv=none;
        d=google.com; s=arc-20160816;
        b=Pkd53DZTPmJ2PrK8I44/y+OyNATbR15pUgRFK9RcUHwNb6X8gZvJWRGzXGXMi8g7wU
         5ysvMYKm2ezlw9zHJdJHfnzIitoeGRFAU31+NyWtgXK/dKZofBCFpOVEaWBwb/sPHzqh
         wvaXp1cQZyC0nfnap0Re8fNH1lmdiBckNLiIy7KmB1FaTpOA8+OtYzQgiwAX9gTeke4F
         5FVPqiMwkNdIwKXzrHOrQTy2xYxH4m7VWj5eKSkxrf1jrblege7Xa8+8ElSYHjGLIJHk
         EA6xM4fCxIGyOigjhTVEJnJ9ueUW4v9aLdHowcw3bjcIiFuAUpDgSwwpRnc3XmuJ/0ob
         oOQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:dkim-signature;
        bh=zRt4S9oyc3QFCLV2pBB/cMLoUlJm+z+QANmW6K5tY7s=;
        b=Ews9dxlmfBOmWcQzD2gshdUXwsT7b/0L4x+TjnCRPgURPNYeWxSUnxA0Zr7MBltntu
         gc4JmuosuVHkGB6DFaP1YTwbF8JfoHDIbMR6pHfe/797owe8KufUPEBjL4h1urJFees9
         EinysyYQZaU79Lzian7/Or3fO1Ld7YL0I5tUgB5vU0JeiiUSZKcytAwf2Ri/NFCocRwD
         XFqVY7+OZDt4/0FyHirHrJic3J+NyQrHthWu/OMWptF3nb/dFN1IgnuNDmpQCiXSl8t4
         5Qm81XPpqkgsGPMDiWuIy75EbIfV1NbXEcRlZFVVVFMJeR8yCP5xXyp3JxJOsgHZcY1k
         9i5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qjdDw6zq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 18si767009qkh.191.2019.10.08.18.47.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Oct 2019 18:47:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qjdDw6zq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iI14c-00072w-U6
	for alex.bennee@linaro.org; Tue, 08 Oct 2019 21:47:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42192)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iI14I-00072H-Qj
 for qemu-arm@nongnu.org; Tue, 08 Oct 2019 21:47:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iI14E-0007Aa-EA
 for qemu-arm@nongnu.org; Tue, 08 Oct 2019 21:47:08 -0400
Received: from mail-yw1-xc41.google.com ([2607:f8b0:4864:20::c41]:44459)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iI14E-0007AF-7z
 for qemu-arm@nongnu.org; Tue, 08 Oct 2019 21:47:06 -0400
Received: by mail-yw1-xc41.google.com with SMTP id m13so214363ywa.11
 for <qemu-arm@nongnu.org>; Tue, 08 Oct 2019 18:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zRt4S9oyc3QFCLV2pBB/cMLoUlJm+z+QANmW6K5tY7s=;
 b=qjdDw6zq9Hru4FPq4Dk7V111yGeuT8N59QivX+bXSTu4SSGpE0stcU1Zo1WobBNIbn
 AQRQQlZsO1fgA8YkR+G23pn841lVgPsp+lgYpoAM2dOGAJRnVia+TMogvniE9QKl68Xh
 jAn1LS72zmdCLy6LOnHKswBOMdHiNBHOO0NYrJqzBNe9yL5o2uGa+2R3FXv4DBKDh9Op
 v4kyZm3eihaQlT3U5Tc3xbh9wZe5jpSbkw8CvWQIreYvq7u+h0NF2jNq60lioEu27Ddr
 QUpSVGUpelMvCSgjChtAjEciaJW07b4hDKW8PTFEtR88Y4QtQ5gYU+yLLx5j89f+xEc5
 wQzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zRt4S9oyc3QFCLV2pBB/cMLoUlJm+z+QANmW6K5tY7s=;
 b=qec5LcVe+2QhVV0XV3ljfl8k8HOEGQELB0R/aWGekQowxuoCyCkM5uQBouRB6beMb0
 YfBA8joV4Is24humLPMPnT+midem4mICrJnp7+e/7u6a89LgzE1ymvCgf/paNx7saDKl
 L51331ZTczlZVELu/RCJBmUwB5kyNNqttYL432TSXcMQCQPLjJF5m2tjpvLV7mrV9+Z/
 iNcrWDbV0cNWggPs+/NYE/o2/WEAIFbnysXeT2UynKU3mRz6d/AXuS5Ctr4g2SLE3InL
 mRLz6o189vqgBPy0L/lQ0PoGK5by0avZceLi8bOfNcro5cxYmz+1xQgzHXm8phSEXltI
 HkCg==
X-Gm-Message-State: APjAAAXtERZ3FX62q6BrIvTI5uandigsGNdAW9ZyIuC/rCFm3GuQsGwC
 EgpGuGBq+5YY/IupYl2Z5NyKMQ==
X-Received: by 2002:a81:4bd2:: with SMTP id y201mr1025374ywa.7.1570585625423; 
 Tue, 08 Oct 2019 18:47:05 -0700 (PDT)
Received: from [192.168.1.44] (67.216.144.16.pool.hargray.net. [67.216.144.16])
 by smtp.gmail.com with ESMTPSA id w8sm206718ywc.20.2019.10.08.18.46.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 08 Oct 2019 18:47:04 -0700 (PDT)
Subject: Re: [PATCH v2 03/21] tests/ptimer-test: Switch to transaction-based
 ptimer API
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20191008171740.9679-1-peter.maydell@linaro.org>
 <20191008171740.9679-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <91135320-6b16-ad9a-e2d8-5ad7186b054a@linaro.org>
Date: Tue, 8 Oct 2019 21:46:24 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191008171740.9679-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::c41
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gExuS4WYs6sY

On 10/8/19 1:17 PM, Peter Maydell wrote:
> Convert the ptimer test cases to the transaction-based ptimer API,
> by changing to ptimer_init(), dropping the now-unused QEMUBH
> variables, and surrounding each set of changes to the ptimer
> state in ptimer_transaction_begin/commit calls.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
