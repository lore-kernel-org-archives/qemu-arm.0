Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp6536190lfg;
        Thu, 4 Mar 2021 12:00:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyS95yDHbbXGThnI8wwomRX/IlQW7kZ84zuhJICHQl1jcLc1p4NbB7iZdFHR4XmGYZMMgVk
X-Received: by 2002:a05:6e02:e87:: with SMTP id t7mr5282475ilj.211.1614888028347;
        Thu, 04 Mar 2021 12:00:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614888028; cv=none;
        d=google.com; s=arc-20160816;
        b=LG8tn3weJVLNlkfcfBwltRZomjfCaqT5e+39ZYISp85990jDMuJG4InniM0qdJ3FeT
         pG93SEZLSSeHMleV96+oy9Qe12h8RdrmpDowyZ/HIaQeMXUUwkFpJ+gCH0CYB64M63Lx
         24Afu23vRjRs4frjiYynSWF9nZNyD8YBU0elqGHij6n1ZJzWsu0aChtMh9RLlWqY0/AW
         QIaNH2Q8tdkQ8ACAV+0KZbVlPOvTzBEMcwGBwahqblvHoF7QniIm97r0hBJyidl6q5Ti
         sWEFOlxNYxjBh3i8L9uxbTuDCubmk+vK9NuggxCvyy4np1cp/aTApTxziATn4dY/BwbR
         jE/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=2PDidat/5n0adeJ8s41QFfi/VPyZDChH60snQE48x2U=;
        b=IDtKfKgYk8Ux5wy4lVlZTDPV7sEgq1EXPHSyLoSBmF2fQ2Ua4jsbBLePQUQvxB6U4v
         j6JcRPibKvz8/ZLkYLgY0UbYh/HyfyeFjm22YVwN2zmVfaEKXb5+4LxvC/sNDMM08uJE
         zd/Cq/9zFjTCeHfUy0yQCZmspr2Z9CwjQ82USeASvSVupVK+f9Uss//uuGaknqfCBHQ/
         pE6BcoipyGUI48vDDq3ebcSZK0dtBf5SUbWxVbPKWHIOpyFXhOMOJUncJNtEQsc363p4
         +CLZfIrVyZcy8BqenL2UbhjE2HyieSq70GujCB9U7ETPqbyPQTl0WsJx+jrz1tRjVrxY
         n9vQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="VdGim/cN";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b24si279192jaq.29.2021.03.04.12.00.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Mar 2021 12:00:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="VdGim/cN";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHu95-0002A0-MD
	for alex.bennee@linaro.org; Thu, 04 Mar 2021 15:00:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHu6p-0000GX-Iu
 for qemu-arm@nongnu.org; Thu, 04 Mar 2021 14:58:09 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:41494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHu6k-0005u6-AC
 for qemu-arm@nongnu.org; Thu, 04 Mar 2021 14:58:07 -0500
Received: by mail-pf1-x42e.google.com with SMTP id q20so19722822pfu.8
 for <qemu-arm@nongnu.org>; Thu, 04 Mar 2021 11:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=2PDidat/5n0adeJ8s41QFfi/VPyZDChH60snQE48x2U=;
 b=VdGim/cNVY6IMFv/HfLqGLfkpfw9TASI7thHnfGHb6QaNLfjJkX2JbSNxYLiiRLBpp
 +yyp/rcuuyJnadwZkspBEL88p5FCbD966JVPgfzV2NsSk3hzw0jMSSs4qKjqsoWh2hSn
 cN0eaVkub6m3KQnl/wEI+TeLgTGrsSpI7I16S2DSrrYpgFigD9I1vcVvjiZ8zXjcIaxv
 7YvcdimbPYh4uW3RwWT3nk1GPG5BRenhwYRtWOD7ZFx5Y+VI/VVCkxM1/htpkwsWl2SC
 ML9TcA5ZJZn+jUPvLy/SvF7KiLWlD4DwILq1w8imdfm+4l806WaARVvWvGAGeqCzB9uk
 YMow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2PDidat/5n0adeJ8s41QFfi/VPyZDChH60snQE48x2U=;
 b=QncFb/GSelADQKsVgPZpW1c9E0AbcNpcnOdaBOJevU00TjGG5Mpac1Q8W93TmUxvNd
 r6yR87an3CUwTG311n8Qw+20gKxqU1yUSbtbHjpPHXAPbjieOHVUYw4rI0q5nl4WhaMf
 kkQ4JWhr0s3omyJ1+eYUQPuWQWUtHCvUC3ijyPHTtxZkJQyQVAmjUvZY/aPXBOqGH2M+
 p7SxZw4Z0McrEb5R+eoy6y0QImKAzkZd2/q5cQYDDYijPoLThFHri3Gb0xzpqwhtifqL
 dDBS8IB9VeqBA6MNFEgBU/KdJWV+OR6aGzhJBwYojebKLu7pcsR+zkkzADqHI9KXOft8
 tzyg==
X-Gm-Message-State: AOAM531jh3hq6D6Sq9nyYxzgIi3FOKzI9W9qVurryUF8TpXEY4qWTRvo
 Mb4ncXpLTt3zR2oAZei88hinwg==
X-Received: by 2002:a63:5d59:: with SMTP id o25mr4899865pgm.322.1614887880538; 
 Thu, 04 Mar 2021 11:58:00 -0800 (PST)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id s4sm104582pji.2.2021.03.04.11.57.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 11:57:59 -0800 (PST)
Subject: Re: [PATCH 19/44] hw/arm/Kconfig: Move ARMSSE_CPUID and ARMSSE_MHU
 stanzas to hw/misc
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-20-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <91712699-8adb-e2ce-2429-5f1d12c15ed2@linaro.org>
Date: Thu, 4 Mar 2021 11:57:57 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210219144617.4782-20-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-TUID: aqCPKFdJ/E4h

On 2/19/21 6:45 AM, Peter Maydell wrote:
> The ARMSSE_CPUID and ARMSSE_MHU Kconfig stanzas are for the devices
> implmemented by hw/misc/cpuid.c and hw/misc/armsse-mhu.c.  Move them
> to hw/misc/Kconfig where they belong.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
