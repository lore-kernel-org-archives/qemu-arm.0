Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp944168lfb;
        Wed, 21 Apr 2021 18:49:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzVx++F3fzxNcuKJ66Wt8BCePPhkddXR0Uq+4Org7ym5+Qipkfb6EoY/fCHcrP4x7+jTcl5
X-Received: by 2002:a02:94e7:: with SMTP id x94mr1075457jah.106.1619056151138;
        Wed, 21 Apr 2021 18:49:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619056151; cv=none;
        d=google.com; s=arc-20160816;
        b=i5dWd0onSdljgd6tTYLXIto0AFujwCCQAE/kExF9Z/CfYop4ZgBkkz9irfxRM4xwRb
         Pk3H1kWhMpfsIWqvIrv+spYEylkmUW4b+slWl7yNN6nyGekR9CejUsvy0q5mZLuTCkvI
         E4gg4TTGxqw3HLnjCs8zdX3Tu1rOAurQaOB7uQVdu2uHXTK06EWhpUdBoWM3b+l4+B75
         nf3itazIaeh3X1Hz5SA/XhA5bh+ppyu5Gg4/MCbFFe/7mtxBMs5nZHsRKtSimekdFWaV
         B/A0CTPfr4wUZY2Z4MoYo0ix0bJK1YBkr4W2OynVfhS+8wpd12oM4ExzKNYe65tqv0EU
         ZMoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=4LhIsUUioY8n/vayD0if1744kDLVa/8Q1z6IXGIiw5s=;
        b=qK7Dl+8HpY/kshqAM1FBi5VaZKO7e//vp7n2IrsH8HXTib+hbbIqQPCApeV6g+84nu
         oE29XNx0cfsnVZ0i9fo417f8+FFleQTmH0pFPKylhQ6DjdGPe6RaNEeyCCSepYximvME
         oplBdGNo4BjzqnJpWqo8caoE+/qTtSMcRxkYtRVhAd6ScvkvzvGVOZxSPXvfLGE4ZrXC
         EEuJHmIzv/5JCX3jX09wGTPWlB0Ee7+pn300BdvDIt+RSXqtuMiSpO/J+/pvDixkna1D
         pD1b/L1x4kPQT2vdz27q5un7bEc3uzIH4ff+2GVxCk6/XiUyxEvFokkQQB39RPQQ2dXj
         nu8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="X/0tUGkB";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j2si949283ioj.71.2021.04.21.18.49.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Apr 2021 18:49:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="X/0tUGkB";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lZOSs-0005Fs-Dk
	for alex.bennee@linaro.org; Wed, 21 Apr 2021 21:49:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZOQz-0003z8-IH
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 21:47:13 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:43567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZOQx-000708-3k
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 21:47:13 -0400
Received: by mail-pl1-x62b.google.com with SMTP id u15so14143686plf.10
 for <qemu-devel@nongnu.org>; Wed, 21 Apr 2021 18:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4LhIsUUioY8n/vayD0if1744kDLVa/8Q1z6IXGIiw5s=;
 b=X/0tUGkB6S7Ygs9UVHK25PWrOaSRkt3y7APA+HzNLV0/TupXwySGqnl0dzMuvZDN4X
 HQpXbFfYWRAg6AnRprjUbzqQRtxqQX+zVM2p9+s2gVtKm6vlqDSafOCakM7pcTt4sDo5
 RmctS0KUoMI07OT4sDRZxsBRHOEeypKiVOQmqI/IaRXeHQG+1YnLNhf8ol0vRhggzT9s
 8M09K+CEnMzMswwjyYthNimQWjLgJzPMWUlejiyTfr/cvbefyifgFNAv+Azg6+0WOydF
 hb6pfTKZ6/mjMr6Xv+EUneKvKBqqvbaoe2i89eYileN8ACozAw3ofm3CuB/AkbDPWQpb
 qf8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4LhIsUUioY8n/vayD0if1744kDLVa/8Q1z6IXGIiw5s=;
 b=I7QAbuGi39NS8us+nkrvFfnhWcFaDEt0ObjGLhLZc2VkCjFUsQFCWkhbSAZhZrICVQ
 6iWUY7DngkQ3rwvU90zOG4zZt+uRSDgbCa/YI1kqOB0or1WiyEPOn21IGCstUh3krk/+
 G3uA3uVDG29Nak4cAx94JDMbYup+rNWUFfIYXn7VhpIF7GNuBBBIaxytjszMWy0ptU+s
 r49xRvQ17oULAUwczWDlV/4O6Qy1CZmfRteui4FQmyyKGGdKGW9mbMohDM9tHDNrkGmJ
 duysuT21fCWLs2CFku5Se4PjIs7GQUinBEjsqJLEBQcDxLwQuQiumep5EHTcJQC1oPWe
 mBvg==
X-Gm-Message-State: AOAM5339oQUYOgwdAO9B354Lj0rtBOSEpcMtH/acGlAhdWyffHEk3GIx
 T7d0ndpbUWBksXlr1tvesoEmbVUyHfn1Uw==
X-Received: by 2002:a17:902:b210:b029:eb:535f:852 with SMTP id
 t16-20020a170902b210b02900eb535f0852mr960142plr.80.1619056029706; 
 Wed, 21 Apr 2021 18:47:09 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id r127sm418325pfr.163.2021.04.21.18.47.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Apr 2021 18:47:09 -0700 (PDT)
Subject: Re: [PATCH v2 6/7] hw/block/pflash_cfi02: Remove
 pflash_setup_mappings()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210419094329.1402767-1-f4bug@amsat.org>
 <20210419094329.1402767-7-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0cb5d237-df43-e0ca-3914-8516d12838ed@linaro.org>
Date: Wed, 21 Apr 2021 18:47:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210419094329.1402767-7-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>,
 Stephen Checkoway <stephen.checkoway@oberlin.edu>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>, David Edmondson <david.edmondson@oracle.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fc7BOX4Iea2b

On 4/19/21 2:43 AM, Philippe Mathieu-Daudé wrote:
> All boards calling pflash_cfi02_register() use nb_mappings=1,
> which does not do any mapping:
> 
>    $ git grep -wl pflash_cfi02_register hw/
>    hw/arm/xilinx_zynq.c
>    hw/block/pflash_cfi02.c
>    hw/lm32/lm32_boards.c
>    hw/ppc/ppc405_boards.c
>    hw/sh4/r2d.c
> 
> We can remove this now unneeded code.
> 
> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
