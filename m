Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp653396lft;
        Mon, 20 Jun 2022 12:47:58 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vb/oZmBnzydc2V5I4Ii2DUCFrnUQYzsXeC9kZJ7ZMPVtPwJygms7M3NvNDL/rzgbGJFFyX
X-Received: by 2002:a05:6214:2621:b0:46e:76ea:f067 with SMTP id gv1-20020a056214262100b0046e76eaf067mr18238149qvb.102.1655754478379;
        Mon, 20 Jun 2022 12:47:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655754478; cv=none;
        d=google.com; s=arc-20160816;
        b=Vcqnln1jrHVJONzvgSaJetyC47cuLDQgndChdBZr2VzHr2/Ff6mUa9/05e8NrSRtzH
         hTnKRSfEn+0Q9jaQjMhwpWrr5XKlzobVL7Gc0c4XcfAqyaMDEyTKog+SX/24WXK6uOmh
         EwL94IOCwieujxTFtNr92f69af1kJIMNSeqDPD2aYgsruipZd40YaXUGnq+aDdLLOsSM
         99JRYWYqSnKItKe1vjwCKUxREZYvMAMIY2oQ+pE/GiUZnIvMLGQws7lNJm5xgCdyMPEw
         UuMYQaLRDVkyTeEIMzoeKny8AlvbXk0zB2W2L5In64oRjthGRjO+gWQAX2MTasKPRLYF
         gw0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=nIAO/Zins5qj40jY9GfY1sOP0ZTJqTr7V4CHn2opwgQ=;
        b=VW5xqHI6luLe+ggNd7P7HDJcNTIaDOxUBIu2BxTQ9SbD6n14/TgamCSda9hRFDoy8L
         wsNRvqWKtPaJm/45W7Cn9TTsjtob8PO47UdeF8bbfqQ6VIButkmKmGnsQ6YW5dE/bRad
         8653NP50/eH0ggiwj8OacNJVozJYuaziHZbjPyWhSAG7vF5kuEAEF0otLYwzlvQccgDK
         qPz9TmUedyV9y4vBhqk50KtjOTBLH3iXikzimswD6LpyfeMuVqcwYQ316G4UgChcDRMY
         IjCLr5iE1h/qAaad3AiWWq2hdIv1a+D9ySuExSTlpyncnerLrhUrw317eJGuTH0B9HDI
         eWgw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mdUeQ+MS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h22-20020ac85856000000b003050c60d15esi9229754qth.599.2022.06.20.12.47.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jun 2022 12:47:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mdUeQ+MS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o3NNN-0007EP-8x
	for alex.bennee@linaro.org; Mon, 20 Jun 2022 15:47:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3NMl-0007C5-0B
 for qemu-arm@nongnu.org; Mon, 20 Jun 2022 15:47:19 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:34570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3NMU-0002WY-5q
 for qemu-arm@nongnu.org; Mon, 20 Jun 2022 15:47:17 -0400
Received: by mail-pf1-x430.google.com with SMTP id t21so4842685pfq.1
 for <qemu-arm@nongnu.org>; Mon, 20 Jun 2022 12:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=nIAO/Zins5qj40jY9GfY1sOP0ZTJqTr7V4CHn2opwgQ=;
 b=mdUeQ+MSeHjFgdmgeOaFGFv3KycLkmaYS1P0LtTh0AkB1YP22ahS5cCE8Csqn//0U3
 XJ9Dx7eBFozJjTP2PGcJ/6FYcTeLMvMBX78CO+RCjT5YuMMC9lZzYSdMUeUEnG0vLAVT
 bhTImlaCDK1bgzoR1p1zIHAAiFOVXJCwui8LvNJ/E3P60YHpfaoFnv24GpYgwEMa9IfS
 BeTJAmThuyZBNqXmuTIf6LuUQBUx3f88So/AHNcH1K3jp4S9BtmS+6Rgwssi7oUmVzah
 NrJQiEUki9Y5DrUs7k1w+7LYTSlxlPtCz8XVpbq6XRuNIQI0EvmKlXR+dkrGb2hfTeZ8
 gIIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nIAO/Zins5qj40jY9GfY1sOP0ZTJqTr7V4CHn2opwgQ=;
 b=HUw0KtIYCfMC41yUHdoYJoeUnRdTbqqzQZoO7zKUyMi+rQxco4AXgeHx2T26vXzYh6
 FXc9NrqQL4b2/pwzgrc+6ew2/iA1k/E9XH6jDkoUypUhe3r0Ci8eCIsRetPC1O/DsBh+
 jwp8TD21W7BqC6XgPAti+0jogTPXLWjt15JSvMb24K9kRD00uNRMKfxcmUfjG2WdfxDr
 q8mERVqeJF9YH5Qe269vI8koDzUDWSmaw09uxacG0DH/VdEU9hwmhRuTXxE+ZT0hRHzt
 YQar14KOqnXZ3PkAiO3mb0fp2hTU1BhZJLt5owBn+ye62YCSP50oPO3bE7SRi5tMGAy5
 M8Og==
X-Gm-Message-State: AJIora/5DNEpWX/mnLcBnpqdjzg8a6zJT8GVFmEWAZMy8UDIAlSLoDbX
 /NofRrDyWOvgJDpAn7xDsSUTlw==
X-Received: by 2002:a05:6a00:10d3:b0:4fe:5d:75c8 with SMTP id
 d19-20020a056a0010d300b004fe005d75c8mr25894410pfu.6.1655754420723; 
 Mon, 20 Jun 2022 12:47:00 -0700 (PDT)
Received: from ?IPV6:2602:47:d49e:3c01:a3e0:8a80:7b85:aea6?
 ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 t9-20020a17090aae0900b001ec8c53544esm4692219pjq.46.2022.06.20.12.47.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jun 2022 12:47:00 -0700 (PDT)
Message-ID: <096ea244-04b2-571b-dbd7-4b5b51eabd08@linaro.org>
Date: Mon, 20 Jun 2022 12:46:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 2/2] target/arm: Catch invalid kvm state also for hvf
Content-Language: en-US
To: Alexander Graf <agraf@csgraf.de>, Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20220620192242.70573-1-agraf@csgraf.de>
 <20220620192242.70573-2-agraf@csgraf.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220620192242.70573-2-agraf@csgraf.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LbX9WmnCGwua

On 6/20/22 12:22, Alexander Graf wrote:
> Some features such as running in EL3 or running M profile code are
> incompatible with virtualization as QEMU implements it today. To prevent
> users from picking invalid configurations on other virt solutions like
> Hvf, let's run the same checks there too.
> 
> Resolves:https://gitlab.com/qemu-project/qemu/-/issues/1073
> Signed-off-by: Alexander Graf<agraf@csgraf.de>
> 
> ---
> 
> v1 -> v2:
> 
>    - Use current_accel_name()
>    - Use !tcg_enabled()
> ---
>   target/arm/cpu.c | 11 +++++++----
>   1 file changed, 7 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
