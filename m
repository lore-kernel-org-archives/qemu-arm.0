Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp798880lfa;
        Wed, 28 Oct 2020 12:35:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwxTGQosYmYOU0l9qBr9ly1Nz7j6MuARtLR3i5NmpAJUevLi82XG9fRgUIJsIrV8kS6Oj3R
X-Received: by 2002:a25:6e8b:: with SMTP id j133mr1126663ybc.273.1603913713209;
        Wed, 28 Oct 2020 12:35:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603913713; cv=none;
        d=google.com; s=arc-20160816;
        b=Tvd+MOZpSaR42hPdZ+ZlZeZXMXaFkrFQE/d78UKR+ElhNRnDxrFmnOP4DSihN6Sy5D
         YAjpu6e4Q+lA4ldHTugFT8ytq6K6EBbip6T/mZo0TYrpvWdZa1xgD61wej+iGi4Y8J5S
         LjfxbOIumdabfOszQfwRhf9JqCNV+EXCUPHcZBcs4BkUoJ3HKQtn2dOYG4BJMc6gLH5b
         IY635qmSwgF8x4P6qKC7EdTBbVObFkJdNZCa7EaXwrrGBn+XANw2HNWH7/+0EAGGaqn9
         H0LDE5EVp8K0pdvTOHvDWKx8oHauI8mLqjkZ0ZkHEZLEp+VLKxGLyaGDfS46/qfl7tTQ
         +sCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=0lsfgTTZDn8KwJgod1DnAX82pyeZ0k1S64kkEpHNFeo=;
        b=W+vPjKFf/CuFjbRpGZu/8FuEYEPfRjL/Ft4P6e5Zt2c/xuF4MR44x1EUacxfobkckv
         JAD0QNO0Gm4cUrussbmQ0goplSS0fmG+jnH15Pco0OVY/fHWjpWC66fpvXpl9z/XVvjl
         LcU4ekzallSBldL8EVS+6iAH+HBysRSL5ZPhlL/i/O8v4aJhZ4Qk79KQ4lbV5p4wo8GM
         A/dl8gskH7brZwkA6I8+3zWezl/24FqggMh42Tq4Q8DUfJ8D8NQ4hcA9aIjmMB3Nlr9+
         D0hKYDMtTUEHByjgk2OJTtgPx9xo6ygiWBz8Mroh8SfwioRiySlP6/0oAGtNobKsKdgF
         FLfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UwV7fLX8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a91si566288ybi.165.2020.10.28.12.35.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Oct 2020 12:35:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UwV7fLX8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kXrE0-0006w6-LF
	for alex.bennee@linaro.org; Wed, 28 Oct 2020 15:35:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kXrDk-0006jV-Pz
 for qemu-arm@nongnu.org; Wed, 28 Oct 2020 15:34:56 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:38122)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kXrDh-0001pQ-EI
 for qemu-arm@nongnu.org; Wed, 28 Oct 2020 15:34:56 -0400
Received: by mail-pg1-x543.google.com with SMTP id i26so338090pgl.5
 for <qemu-arm@nongnu.org>; Wed, 28 Oct 2020 12:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=0lsfgTTZDn8KwJgod1DnAX82pyeZ0k1S64kkEpHNFeo=;
 b=UwV7fLX87rXseihsHi/k1q6h8+LGkotmyxXDGoavGDGQeJ9+203ufgIdy22omUozB2
 l4h1p66uM/W4O3lHDuwUTv9KxQgJ4SREbX+rePuSFutZgKAEMB3GybYjQV9OHdCLjZhH
 Rjcp5NLpcWTbpM1PvBuLHHugXcorikmSoCJ0zWSDktV6BUO8GCcjWYHoJz8X2KucL8ub
 Xc4f7kADW4z6vNd+g2Bb2DH+fERer73X/CxBazKn+dEBfxL+mELcRgAOep0XIWEJwwXC
 /HRMNzV09SEw7zwETD5T83zFeDLSVg1Qyyj6kaOhEyWEsWbXWqKXNhuP/n62sfEwCtL2
 Js8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0lsfgTTZDn8KwJgod1DnAX82pyeZ0k1S64kkEpHNFeo=;
 b=q06ad76is/JtKb70gToqqfG/DpROdJyPGT+UGPoYYAYdkaEg82F6SPOH4OLRxVMx5o
 MfPAdNhYbUuRA5kTUs59D/Rl91nqKQLBUJSXvzieTwFiKWL24B+VyNpVtFmt/70jcDtD
 RVW/kXu46Z7j00DCXJSHcL91cexDa/fHAJH2mvFuB4YnwlkmvA4jN9q8daeUFyY8BzIe
 TlJM66ZzrNDuYnpbEf+YnjsKX8G7vgcE5x27HEI0/ZVKeGoYcHKaEERfl9JrVT+H2xWa
 gf67I2M30RJQddFxyVbEKpNfnxSnjxDN5Qe0QURsO7IDIf0bVPbezz8/g+yirvJYPsBp
 8TnQ==
X-Gm-Message-State: AOAM5305GFAvwRwoQyxefXb26ywCVLs8OQ+WsflbPe++4tIBlad3zlZT
 NBK5Ez3dSawK9zc/L5xkBDYTdA==
X-Received: by 2002:a63:134d:: with SMTP id 13mr854569pgt.370.1603913691228;
 Wed, 28 Oct 2020 12:34:51 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id o65sm167836pga.42.2020.10.28.12.34.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Oct 2020 12:34:50 -0700 (PDT)
Subject: Re: [PATCH 0/2] Fix some Neon insns on big-endian hosts
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20201028191712.4910-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bd6afe2c-8151-623a-b576-22742680541a@linaro.org>
Date: Wed, 28 Oct 2020 12:34:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201028191712.4910-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::543;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x543.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.921,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nPwCzojQ4N+c

On 10/28/20 12:17 PM, Peter Maydell wrote:
> Peter Maydell (2):
>   target/arm: Fix float16 pairwise Neon ops on big-endian hosts
>   target/arm: Fix VUDOT/VSDOT (scalar) on big-endian hosts

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
