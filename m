Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1437557lfp;
        Fri, 1 Oct 2021 09:24:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxE1j5t6sVcIKhP4p/M2CoadJQDMad/SVOwURTDJ06Xkt5iobHPKimP4LhngbfSEZELT84m
X-Received: by 2002:a1f:5343:: with SMTP id h64mr6417983vkb.0.1633105483318;
        Fri, 01 Oct 2021 09:24:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633105483; cv=none;
        d=google.com; s=arc-20160816;
        b=DCXvhiQfSjo0qHUCxfasKF2DwSiYfIfHCOGNDkMdI8uIo+EIKPkedhi7ASgB4bUxr+
         Io/u6DodvTYYfHVqozGY8Fk6zYQxHZoOkgaYDZNgu77S4nWQ7tbW+I7wlaOwFbzufAm0
         +wwYMueLER6KjBn1nj5gRMJKuepNrft9DV7ELPsL5VV3MBKniVgdQejiacXYMLT1Ozo7
         96VcNrjh2iYoBzxS93F4pe6n5PfDgyOLeMGycjWSSO+1FlCkCiBV5U1e0/4ISF251QV/
         0Sbf0ZE1R8Rhrda9H3e8Obajm7/x4sgwuyCetXU9jKd7UI3vGoxgQjYv1C3Upnumm7ff
         /ejQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=QKgJtsydda9Ani2XKZGqnJtka7WauNhBSfmvwZf3MNs=;
        b=vskHHY8vAAqGRXEhVXgaXBBNPkCYEbsoxfaK7MPCOZUhmD3k6ozbtaprYcfguP6xXR
         gGo79pLcQFoQNTEt5kvsbES6qLNzoBC7IaToO5+2WVfbwBQYUgiw8UC+Ff20zOsrxrQ2
         lmUT+eMbaDUvcCGanx8Sp45oWpleuuqWl530yhym9TMRL+89NPjkw6tsP7Ya4Qtdyfzi
         aqxUas3wrttDaRE3d5CZ0YPa0O/D3ibXgYraRiJG2ULiJ07cg0UZiK0WN1o3CeAcwhl8
         ZMLUfjziNnsfEAUkpCetVNRnwmaFPcQc+M+ND0IhAmsw8FR3+9TdXK8xq8dGAObNUBTr
         fUPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GzKhG+SA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u9si6435830vst.402.2021.10.01.09.24.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Oct 2021 09:24:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GzKhG+SA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mWLL0-0006Ts-Ls
	for alex.bennee@linaro.org; Fri, 01 Oct 2021 12:24:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWLKU-0006QE-LI
 for qemu-arm@nongnu.org; Fri, 01 Oct 2021 12:24:10 -0400
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735]:45684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWLKR-0006cD-J3
 for qemu-arm@nongnu.org; Fri, 01 Oct 2021 12:24:10 -0400
Received: by mail-qk1-x735.google.com with SMTP id q125so9646531qkd.12
 for <qemu-arm@nongnu.org>; Fri, 01 Oct 2021 09:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=QKgJtsydda9Ani2XKZGqnJtka7WauNhBSfmvwZf3MNs=;
 b=GzKhG+SAL5Fjf7IsgQXvOql+EpqhFCfBHQmnMJLYXlmeiXB0LQ76n51BfduVEmobCm
 JV4IkdKqaxTveSufjgkmhl/En8dTGVMUQqey7Au7x0sw73f7DPVlDcRss23aadr59dpF
 VkewvhS+za4A1jMA4VNDu0ULw2uGYgbVjmP/BdM+n8sHr+G9fBj0k4N0/j6JgSfASUDF
 +LvcppddycV23wvrWBAWvZlL+CcC/yJUTTO0lQVrTICACcQwj0Iy/LexvAiY70liZ2BD
 glDkcx877I8h0axCBwQYDGDL6Ryr3gucbe4wOFVnBCvHUNNBnXJkjtvBxufFbJ+YgWAc
 k5Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QKgJtsydda9Ani2XKZGqnJtka7WauNhBSfmvwZf3MNs=;
 b=Q+nUONCmdERcpYoWCpEarPe48N2RLJdtAOOLAt/fFs7AhdQ5HwTLYzcB5SWMA2U64z
 kDcp2L0UukJhKMPMQtL77IRPApU7o1gUlGZCoGWXJApYYMGLuwPDXvnw48rg8zcVbOkF
 4f1yxSBuJ7RhLSjHWcy1fXm84kdtaFjcDxGaU08om7gRXGuYlgO7RWO0paWuIBhit9+h
 24EaT7rKmdaz9Pfk8ZmEJZ00np1Bwst7Kl6Q4M29beAu/RD13cW4wM5VPbeBSeY7jcrA
 /V3ZC1RSbMFO13P0NvUtUQwjk5bIXAflfiesZlpFQrW9OP4uaW/CO4jPbwdeK/v3Aftp
 vytQ==
X-Gm-Message-State: AOAM5330LEgPlDsEbf7FtFzmqKksO/xjj97ZpXzucpO/Xp4zeKvw5j7D
 pu129LjTYVscmcumb4GffXpVYg==
X-Received: by 2002:a05:620a:41a:: with SMTP id
 26mr10329225qkp.380.1633105446448; 
 Fri, 01 Oct 2021 09:24:06 -0700 (PDT)
Received: from [192.168.3.43] (c-67-174-166-185.hsd1.ga.comcast.net.
 [67.174.166.185])
 by smtp.gmail.com with ESMTPSA id f5sm3494574qtp.44.2021.10.01.09.24.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Oct 2021 09:24:05 -0700 (PDT)
Subject: Re: [PATCH 1/3] hw/intc/arm_gicv3: Move checking of
 redist-region-count to arm_gicv3_common_realize
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210930150842.3810-1-peter.maydell@linaro.org>
 <20210930150842.3810-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3e7cdccf-4a14-0147-db18-381bf888d431@linaro.org>
Date: Fri, 1 Oct 2021 12:24:03 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210930150842.3810-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::735;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x735.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.127,
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
X-TUID: aV9LoSZbCrGD

On 9/30/21 11:08 AM, Peter Maydell wrote:
> The GICv3 devices have an array property redist-region-count.
> Currently we check this for errors (bad values) in
> gicv3_init_irqs_and_mmio(), just before we use it.  Move this error
> checking to the arm_gicv3_common_realize() function, where we
> sanity-check all of the other base-class properties. (This will
> always be before gicv3_init_irqs_and_mmio() is called, because
> that function is called in the subclass realize methods, after
> they have called the parent-class realize.)
> 
> The motivation for this refactor is:
>   * we would like to use the redist_region_count[] values in
>     arm_gicv3_common_realize() in a subsequent patch, so we need
>     to have already done the sanity-checking first
>   * this removes the only use of the Error** argument to
>     gicv3_init_irqs_and_mmio(), so we can remove some error-handling
>     boilerplate
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
