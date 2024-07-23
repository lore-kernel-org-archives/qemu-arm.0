Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp2229677njc;
        Mon, 22 Jul 2024 18:16:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVC5g/Gz6WOcpgD5Es+KY/7ld3r3Ykz6xBFjCDDZ7RIcvHaYWy8L9DhXELx1pMedtkpdGQYjjNMXa5kzLiPSLh5GnrWn3vn
X-Google-Smtp-Source: AGHT+IGLoV0TgXWtKw62mzNewcbijsmIr1rLZqgPsouaCxkbzclKpS+PC7jc/AcdwW57wk0pRWOQ
X-Received: by 2002:a05:6214:509b:b0:6b7:ab98:b8b3 with SMTP id 6a1803df08f44-6b9610c1fc7mr121704266d6.34.1721697368086;
        Mon, 22 Jul 2024 18:16:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721697368; cv=none;
        d=google.com; s=arc-20160816;
        b=NrxQnPAqrG+igxz0fwkKBHRXsyb8QE6twtP7X81zwVZqMsyyH1SVIj8OSsrEtlU0Ud
         IVvjYr2xXQNR7jenWnpY9WSnaffDyiEvm6163+BzhuYH1WXp0gQDKggfkENf3uUaMpyd
         CmID/vR9RAQxhrdRQ9LaogeW9ArUTXVzwbb+AEG9AiNzcbfXWdf6JJvhOwZxoeNK1Vx7
         ugdw53laKXS7/fRR64BxO0xO+9Lk+Py4lxnKMXpW9i7eBtMfez2t4LVe+qmX3ml9gJwY
         w0bfVXgqFCCrFprfF2pmqNrd5+nb46crzMI4AnR2HbUmNuZfuq384qsAop/tmV5/47aD
         hR5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=llxCVToRyfUAht24Ji+fDcCnlhyuGiCqw7QeSSjcM40=;
        fh=9L5N+zLg1JiCMvhyyFKAttguLWg9bTu1T9MGdyJAfbI=;
        b=FmqLrDvM7idXC/Iw3AbSggib7TRe2SV/y4gfBMq+c9/ZHWHgFBM5FQa+f+TQSKZoL4
         YeISd1SCoSn96AL3+Uwg4uz4arPvciSudi6pi6RUQmli/T3F5C4pXOMsy+6AcZfJKS5z
         6QcGM4YPupGhnSBogMrX+4V/QM5DpyN0Zs4xZcznEYjhJY5B5/lmPVmJW6uHXkPDPFcs
         CaM8vKTDOdchhMSHpQ9YeoBtiErEn/ROZ5x52IE3QK2AkSsJX8m5oK5cU6UUa0TMLh0S
         4TdfQU/5SyI9FUqP0L7+VNtNi3CasCw1HibVs+KMB6tO4/dmrgWLWywMD4YfHqjSw7BK
         AYjA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="TpR/zpyt";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b7ac99a135si92173506d6.257.2024.07.22.18.16.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jul 2024 18:16:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="TpR/zpyt";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sW48L-00030K-4D; Mon, 22 Jul 2024 21:16:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sW486-00024R-9U
 for qemu-arm@nongnu.org; Mon, 22 Jul 2024 21:15:50 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sW483-0001y6-P7
 for qemu-arm@nongnu.org; Mon, 22 Jul 2024 21:15:49 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1fc4fccdd78so791365ad.2
 for <qemu-arm@nongnu.org>; Mon, 22 Jul 2024 18:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721697346; x=1722302146; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=llxCVToRyfUAht24Ji+fDcCnlhyuGiCqw7QeSSjcM40=;
 b=TpR/zpytxaOXRxlrAfFJdGBJ7R2DrfJS+EqjnlxDsz4GoB7Phm5MeiyJINl3hNM/c4
 xiZ74LoTlhCydRQGZPnZ3QM6zsfJlKtZrEB4el5bV9+18Y1UqNkLfY6Qs0rjUo7hDgId
 WluTs8BqVrdk2a8McsZ9+MFNqHr58Yy9Mg5hoNUxcMd+ha5juO2BGFdgNaLfWixEw/xr
 yKVFyMPp6d77hOlQn7ti9CqLe3VrfAeN+8lcjdeJHpE4/e+PmN4HlgdjBkivPJ6vv40V
 HT5Z2XTdrowL3Y0wzd2URDNDCsw3KvMUM2Q+ZlWVGDPedeiMKnxSTqT63ruTIyLlDLLc
 rTeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721697346; x=1722302146;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=llxCVToRyfUAht24Ji+fDcCnlhyuGiCqw7QeSSjcM40=;
 b=p1meZt/7HVMZEJT5GYzwhBK4xIBRtqfyUxwXVhX1sie8+dByTIjY9DmfwLcNrMDRzM
 aLMbekHo6JIySCzVENf9w1ovdSia6b0zcO3cYBzTqYKlcUq5EmKsNvXFRz8SzhjJSrYf
 0jx8c9y6/TpVdD7LXv1Wn+dm1Ip87Qmsn4cI5S45II+GzkJd81fVp9g5NVTAEK4IBCtL
 LDnfbxPmncSwUr5OwuyCLnKMWq0Vl+h5Z+tDyXVwLexX7Q2a4PrRfR7SKi1hSH0IYJrB
 RmNawDRDaxeOI+YeeK2Xi1LrYCNyoTwYQXBPq8vvsWjuvnKZ7Nct+X8qN1vkusceUiOe
 1jVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrHk5e/FPagI7dmeCTS3UWqy9FiAbNLjCJnLHooQdv27jsf/7OH0a9BEmpx2uUpptD9J0uMxWcrwwTzfky+yjC2IH6
X-Gm-Message-State: AOJu0YwF8iK8Jp3Ey67FE5S9tFYdXvcBbq6Ms1rBPhI7FYmxadP5Rcht
 ym8aE3d9Em++/LOT8m4HOcIzfRc4gtWwLIn3rQzab/jroFpAWbIif8ammaXIEg8=
X-Received: by 2002:a17:902:d58b:b0:1fc:60f1:1905 with SMTP id
 d9443c01a7336-1fd74638e50mr62534495ad.61.1721697345991; 
 Mon, 22 Jul 2024 18:15:45 -0700 (PDT)
Received: from [192.168.1.113] ([203.56.128.103])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fd6f436d26sm61586465ad.201.2024.07.22.18.15.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jul 2024 18:15:45 -0700 (PDT)
Message-ID: <8919bbcb-2e39-409d-a90b-c924932bdccb@linaro.org>
Date: Tue, 23 Jul 2024 11:15:39 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/14] bsd-user: Make compile for non-linux user-mode stuff
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20240722214313.89503-1-imp@bsdimp.com>
 <20240722214313.89503-14-imp@bsdimp.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240722214313.89503-14-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: ke0t5+UVlywI

On 7/23/24 07:43, Warner Losh wrote:
> We include the files that define PR_MTE_TCF_SHIFT only on Linux, but use
> them unconditionally. Restrict its use to Linux-only.
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   target/arm/gdbstub64.c | 4 ++++
>   1 file changed, 4 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
