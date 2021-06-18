Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp1716930lff;
        Fri, 18 Jun 2021 09:26:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxdbHK6vcE/dE95bDx8iEFASCASVSr7h5xEKrja9sYQmiUGlFmnikyukH3TprkPUb+vypqJ
X-Received: by 2002:adf:ef0d:: with SMTP id e13mr6141125wro.155.1624033566088;
        Fri, 18 Jun 2021 09:26:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624033566; cv=none;
        d=google.com; s=arc-20160816;
        b=sDHsWvGXKJXKbY78C7zLcQmtAkrSUS+x3dmELx9Uwgb3dtMFUtSkih8Jn8T1oEXPSY
         F3a4Nm6EANKd6xi26j89hvo6RSJ0kV1q8odoUQuYv3WDiKOBXQbScmEd0ISc3Vu6tMM+
         XnZK5KreT7HEoSzMYF9emIzkuLnnWA8+6h5F6J3Wral/uEylu921qArZ3Nsqko93zS3r
         NsD2cdYnoFRXUDkLu7kv8i/hOLsfPGns2VY3+L2v1aIZ5jbMcVoZNrSE+IUrHid9IAgt
         4SchrdXrPcPdmdqzpaShsjNaFkH4NfMM3sWUFFA72VbhD+vs4lvq40sdHabp7rGXnkJU
         Oetw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=ibXeOQEkwijqn1VkyUt19cBgm7EwKCI1LaKaTip8Xl8=;
        b=kEnu/+/5jNl4DS+m8ThK/fnPIk9ONu1XHAkKhm1SQsiMtq2EKG2Zh915IQf6uy8hmo
         QpNMG9EnCKJADL0JnvCzBljRxgw00sbidxeMTuSz+DDSUKvoU4Y6LrMcreZaSibhTLu8
         MxgqTqEZtcszQtTM1XQEd6K2lQjVT6zLahwjWyxx7l807qFtdPflTF2zkVyiaxhbke70
         nn+9a7202lXG5Twoqwxvmu/OzSwQhBj+UgnArseaYgJ2ZrO4aysn59goETyHbpeDgzc0
         LFTJ+e6ODfb5mMZjlDjnygJe8X/shZzoUbcTSy6EW2/6V6WPjCwpjNvCBdL3161A3LrU
         BpWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ss1mtOkh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c3si16626230wmq.32.2021.06.18.09.26.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Jun 2021 09:26:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ss1mtOkh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1luHJl-0006H2-59
	for alex.bennee@linaro.org; Fri, 18 Jun 2021 12:26:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luHJa-0006C7-LH
 for qemu-arm@nongnu.org; Fri, 18 Jun 2021 12:25:54 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:43752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luHJY-0003hG-Uw
 for qemu-arm@nongnu.org; Fri, 18 Jun 2021 12:25:54 -0400
Received: by mail-pg1-x536.google.com with SMTP id e22so2017202pgv.10
 for <qemu-arm@nongnu.org>; Fri, 18 Jun 2021 09:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=ibXeOQEkwijqn1VkyUt19cBgm7EwKCI1LaKaTip8Xl8=;
 b=ss1mtOkhd/qvwVmLYd9zFItXPHXsM9G/ZfQdYRoqpgLLbszBx9JvMkOVUUn0ocioPS
 Fov5qopJy3sEy2+vVgtP1/TwUNl94C9dNusBf8VxN4HFgXztlDvjeLubvgHEurSaeRR+
 P4tG/EDK1lVgqZlFGf2cqRwBbhNELfIOnxJ9yjN4fI0/hh4yFx05FY/XfuFJAr6Y+Kcd
 9IVlhsU/p7BoCmB5yv68yTia4pk8PlYVinPeQPSdT06EPuK1dK03sBWojxjyhDwey9/N
 84tqFD7Zp2vqJhZIgHhzMPkEc8/iNkBFpopxnPnjXybrL27azf1SLeR18erFA3HO45fO
 h1yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ibXeOQEkwijqn1VkyUt19cBgm7EwKCI1LaKaTip8Xl8=;
 b=icuHVwD9Y++3wGM9qe8JNwN4izdzM6ZNJBgKZK06lrm3uXzv/vIbwCEAZvX4xGgEzt
 p0r3Bwris4Uycu/GL3YRGRYcoETOLSdHRSYFJHU2VpKTF3trlIrmZY1EKS1bzQBZEEy4
 G99JPY2pXkHT0AkyA/fRYLwMXDIbZ1TfjauZ4flEgRy1n/D7dXa4zBfwbxwyW2L7AZRt
 vJ889g/eJQsPQB7fyYTAD+M1sTanNA2OVblwU+MEVfP+wvANXAgSJEbp2tGN/wHWfUvB
 +VQpmdN7gARjAenw+8Y5w5K6vjNnkYv2V4p/rkNnBY3rlXT/7RkyUarBQQWoStgSE3pN
 ucbQ==
X-Gm-Message-State: AOAM532uIe1lQDiqXXp3whXOobCeBU2P6QxWB6HFHZqrnQVVWgbybIDZ
 8gTuURop/YaxYba0bClqeUCHcg==
X-Received: by 2002:a63:1b62:: with SMTP id b34mr10616900pgm.417.1624033551415; 
 Fri, 18 Jun 2021 09:25:51 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id k25sm8206594pfa.213.2021.06.18.09.25.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jun 2021 09:25:51 -0700 (PDT)
Subject: Re: [PATCH 7/7] target/arm: Handle FPU check for FPCXT_NS insns via
 vfp_access_check_m()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210618141019.10671-1-peter.maydell@linaro.org>
 <20210618141019.10671-8-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a3ead921-b138-402b-20d8-4559162135cd@linaro.org>
Date: Fri, 18 Jun 2021 09:25:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210618141019.10671-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.202,
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
X-TUID: ww8851OLHlaY

On 6/18/21 7:10 AM, Peter Maydell wrote:
> Instead of open-coding the "take NOCP exception if FPU disabled,
> otherwise call gen_preserve_fp_state()" code in the accessors for
> FPCXT_NS, add an argument to vfp_access_check_m() which tells it to
> skip the gen_update_fp_context() call, so we can use it for the
> FPCXT_NS case.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/translate-a32.h    |  2 +-
>   target/arm/translate-m-nocp.c | 10 ++--------
>   target/arm/translate-vfp.c    | 13 ++++++++-----
>   3 files changed, 11 insertions(+), 14 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
