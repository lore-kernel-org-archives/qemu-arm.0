Received: by 2002:a17:906:3fc4:b0:a04:79f0:9a0e with SMTP id k4csp317686ejj;
        Thu, 23 Nov 2023 03:31:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHezicMHsmKy1NBVkUaOczDlybLcRrM8UBRcMR3kXYkSx76xws/fSvbS1ixJ3t9L/rHJtCL
X-Received: by 2002:a05:620a:4626:b0:773:bf62:b274 with SMTP id br38-20020a05620a462600b00773bf62b274mr5676232qkb.61.1700739091262;
        Thu, 23 Nov 2023 03:31:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700739091; cv=none;
        d=google.com; s=arc-20160816;
        b=I0+GoO0gx40G6mGPj7wWEY4wJdVig+Qy0Q9AsZ3KG5VD5DIGa01tXFYmkovcyzZuyX
         7mnGjlcw9lvZuD9/PN8vqdxPPxkCAGnk40bgFQp6S1DnQrB3cLvHIlA4EizADEyCbyUM
         kcqhlbIsErEwyvipEiB+aIYzC25QpKlU9aCJnyjqqVPbQPVrnT9G0ZCBt4J0th29l5Hx
         63sUptVKGkasoVwvbgMYSJo1+s3E03yBCINfwioLl2HBLFOzf9rmKTWuFTaZV6VDmhSj
         6UAW4cvmtCcgFZeEQtFqkNvboWnbuvqlAXr9fsfeXvPURku6reBo5L+lUh1SYGm+ZqGr
         7kRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=rNT4uJPZ2Dmm1Ek6e2mDzvr1mgbyyVH2ct5Ei6V57t0=;
        fh=UMlouvVl3Ph4Ne7UvGTvosqVcNxKyKMHDiGsZppDwks=;
        b=tKLzkVCb8G3cBgSmzlPU3vJ5DDsGuJhVNxz7f3cPeS9kCiXYYRAINKVpZXfs/24a2D
         zOx9jv+CBJF3bQ8+6og5aVJz5rY2WcFAZ/D7KiEvPi0Nf772uDuvubCZi4b5uuFDiKld
         bNYS6s1OxbjkWQjTWU60ZNbMhbSqbNMgOkcvIBzyekzIA/9NNYjABbWmAMCW2Mak9bSu
         /SI2mgGBeo2U2BSlCs9IeNTjmWpWGKABQCIgffZ+KVv3nEGcd8u/3OeXiVxqThRtkKFI
         naiYZTXiwzobm9vBvLCa60tqTtZPFn9hq+Z1u2HryFcKD1Z7tdxnk7AFNimO+DJP3RWn
         MvTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pNMSCTk+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n15-20020ae9c30f000000b0077d67c826b9si885533qkg.551.2023.11.23.03.31.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Nov 2023 03:31:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pNMSCTk+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r67vc-0007bR-7f; Thu, 23 Nov 2023 06:31:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r67vZ-0007WD-4s
 for qemu-arm@nongnu.org; Thu, 23 Nov 2023 06:31:25 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r67vX-0001nM-KP
 for qemu-arm@nongnu.org; Thu, 23 Nov 2023 06:31:24 -0500
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-32fd7fc9f19so480420f8f.2
 for <qemu-arm@nongnu.org>; Thu, 23 Nov 2023 03:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700739082; x=1701343882; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rNT4uJPZ2Dmm1Ek6e2mDzvr1mgbyyVH2ct5Ei6V57t0=;
 b=pNMSCTk+c/CLJfTGdvUytZ9r9UmplxL9/naiqLKxa1gGfUVT32yX7TZWmIDyz69b30
 RGoxSzjydfaBqR9Kgm78CKqNlOvFHoHlTQT8j5agsVCVhQYSOXYhzeRirX4bpN/GMiJz
 M+eRB/3ymT6GE4yiQcpVWPn/EX/L7H8S893ioccdwSJdCtn7JYEJiFRHwqgEklv1mCmR
 U/h0zjSjZwiertbxJFZqM7Fj0oyUW4hTapqBHun0brx93gWasvTXx9p4+70UdXoHdvTr
 JGgzi1qFmRwluA/EZ8EVMxG6/9HZF8tcAyV9ooqGtcKf1asAW8Q+EV+zIMb+3fVxATGv
 tFBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700739082; x=1701343882;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rNT4uJPZ2Dmm1Ek6e2mDzvr1mgbyyVH2ct5Ei6V57t0=;
 b=YWrhcyokxeVhhl3huBy4Krffq2gXa1carZS34EgffSxE3SYSiv1qMcv/gJSnvr+Ccj
 mMQ7X3XRluWnvMzJOeeDFFDnZLmh/RYK0TDCnp475ilD6ppOyqVZLIe6PuVKaX/R7fEs
 N7Mm5A23Ax1nSCoB2os4/RdZNB+83AzpqaJrF0WMdN77fbDqBxNrwNwih9y4A0NixHAm
 5vlkRNKdi2pYwX/UpO6BoNDlTGGgqmkGUxsWZje51uVZUwFiVSykUv4JDh0noI8/yygr
 QHByEMpunlBcbcuwYBuAHXStXMbZq5fIMxxsbNrUYWL4MjZN3jMEEq4/hMMBUBEXUtnF
 B5HA==
X-Gm-Message-State: AOJu0YyA/VBspyWcLEOy39m8KCKKq4WlmAe2/WAki6MODIBxwRjfVrfo
 vrKnQGwpyOBJi1qffAwxF+AkY/K6BwWsloaco+0=
X-Received: by 2002:adf:d1e3:0:b0:32d:90f7:ce4f with SMTP id
 g3-20020adfd1e3000000b0032d90f7ce4fmr3331006wrd.38.1700739082053; 
 Thu, 23 Nov 2023 03:31:22 -0800 (PST)
Received: from [192.168.69.100] ([176.176.165.237])
 by smtp.gmail.com with ESMTPSA id
 z11-20020a5d4d0b000000b00332cb23ccbdsm1381619wrt.81.2023.11.23.03.31.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Nov 2023 03:31:21 -0800 (PST)
Message-ID: <3f8e7301-c6a1-4b38-b0dd-62d8b8bcf8d3@linaro.org>
Date: Thu, 23 Nov 2023 12:31:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/21] target/arm/kvm: Merge kvm_arm_init_debug into
 kvm_arch_init
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20231123044219.896776-1-richard.henderson@linaro.org>
 <20231123044219.896776-4-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231123044219.896776-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: HUOsh3tTsGSq

On 23/11/23 05:42, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/kvm_arm.h |  8 --------
>   target/arm/kvm.c     |  8 +++++++-
>   target/arm/kvm64.c   | 12 ------------
>   3 files changed, 7 insertions(+), 21 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

