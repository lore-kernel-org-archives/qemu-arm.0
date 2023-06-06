Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp3539144ejb;
        Tue, 6 Jun 2023 07:45:33 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5CDt7DC3nQ1yHsqZSAQg9C5h3eL/d3GQB1TnZvMsauc2UndwCCBW4R9YPRmotq6OJmc9dd
X-Received: by 2002:a37:6343:0:b0:75e:b9c2:b1f9 with SMTP id x64-20020a376343000000b0075eb9c2b1f9mr2772692qkb.8.1686062733663;
        Tue, 06 Jun 2023 07:45:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686062733; cv=none;
        d=google.com; s=arc-20160816;
        b=k8Tnrk6jjKcPm1XkNFw516la0G9RiQ0IoHRA20WompGrQVFID3s41uPlrnTs/IP/E9
         NUXE3noS2xDtFYyM+LHD6pW0Mq91LAv8EZKDj7ufulSCOA2Pgrvg147mJ21whv4WBNWs
         MCTJf3xRFJFfxm/JG18QcwY0F9LHNVIBn2A2xFa7zHQLNSwQ0p+wkhsle/+ENxnKyggQ
         s+iLyKZlYMl9WDDz0Dx9400L+DhuU6wZWC5s/7dqt2wG6Es1Yvq9ME0CI13tXjYNvjRv
         1qqYPqE5YISoqAbJXkkid/8U7ps7AwiEAg+AjyMdxRyJWqzdBsfB3TE9jvVI3ibk/7pT
         yeWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=n1tJ2+L5cHCKhwAu73ijDxV4qbX5hmhJ/fdum4OqMek=;
        b=xj7rxiXR4YUMJsvCWvbWS0ytom4n7T2TI5H/MvmpxJ5SaaN1cc6GVi4/MmXMHDTBXA
         /VkxoenUAoCGX1fLycG+WwNPL+7vj2/mBJHKy22+Laim6bjiULNVT6MnF1w/Vq51Z+6L
         x2jrs+JmX2fU3kj0bEl0Hi/4gGpiaKUVKGehDqy83n75USVABouql3xWi6QQ9JhLDGbz
         KddFkAZphEJVpdzQp+zHxLBmgOBvIIMlBGUBddI0say5GYPBXdbkuyYjLoI6gPFY5vZp
         /zisMZepuq4ycQo0b3KR6A1gT2Vha4FyusvFSmOT73P+/Wdi1hshB/2B4ec1/Tb+54xc
         QW1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cXkLIF4O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id op29-20020a05620a535d00b0075d3a59099esi5543896qkn.140.2023.06.06.07.45.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Jun 2023 07:45:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cXkLIF4O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q6Xw7-00073T-Cp; Tue, 06 Jun 2023 10:45:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q6Xw5-0006zx-PV
 for qemu-arm@nongnu.org; Tue, 06 Jun 2023 10:45:25 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q6Xvv-000450-8I
 for qemu-arm@nongnu.org; Tue, 06 Jun 2023 10:45:25 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-2564dc37c3eso5450505a91.0
 for <qemu-arm@nongnu.org>; Tue, 06 Jun 2023 07:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686062714; x=1688654714;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=n1tJ2+L5cHCKhwAu73ijDxV4qbX5hmhJ/fdum4OqMek=;
 b=cXkLIF4OrlCwwa5akW6dvgabsRFZ6lFTOVDKjmpfxXz4lTY3KTJmfW5F7hoesuRxmU
 2+FO+0Dr4z3uMWdcPwpHCykvYjfhFkLqZgGv0U2P6g+usS+IiZP1q2wy5MsofCpv2ue5
 cRhmEiZGubPuEMjPKvxDm+31ru25I2Q9RC6mts3eg+XqpExoX5+zl4gl6ca6tjjHHY5q
 UJsahjQmlhhmRPtCLZpni+X5JKIYupiLAloVfDJSedCk/+Lrhu2i9U8+HCp8KGfAd000
 B5sNQ+do7XxKsE3lH9POmvlm1T23llc6krvgsbICYE6ZwrY2Y7wopLcSGjzNt+vIA4Zi
 3Iag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686062714; x=1688654714;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=n1tJ2+L5cHCKhwAu73ijDxV4qbX5hmhJ/fdum4OqMek=;
 b=NDyqwzAN3p2IMqNALmn2BfjxEcAHTz29kYJHYIiFYfL7tCLdePmuZEUYVh+PEb/waN
 POSeyd8VpkyeHHbSFlf9zXgNk4aX2YKFAIt3jo6hlkX1S6RJ1+0nwyotZHgLaI7RLuj0
 JKREwu4ZFK+LjrC4uz+CfFIoaWk8tbcVUS40Gk9qMztrA9/gxBcHN6lFZJvK0UUL/TMM
 nfPAdnMKRCGJVNzcQYz5zJSNjAgVRv1XdOp3Ot+/+iSFD/HQaLLtzuOxo56upyPAXrBH
 kGTtaeC/N6kiJDSWNwlmrQuqCzRnatNECuxnIvbHxP32OXuS0U6S8WKxWmpsuOXOoqSu
 EC5w==
X-Gm-Message-State: AC+VfDy8LS7HdzaIFZGbWjKly/36mCoqIqi2C+Pr+8T2u6xf7m2glGLb
 otHafWDXYhaASMdGBfp+npakQA==
X-Received: by 2002:a17:90b:2397:b0:250:50c5:cabc with SMTP id
 mr23-20020a17090b239700b0025050c5cabcmr12509845pjb.3.1686062713761; 
 Tue, 06 Jun 2023 07:45:13 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:b7fa:ce59:1445:805a?
 ([2602:ae:1598:4c01:b7fa:ce59:1445:805a])
 by smtp.gmail.com with ESMTPSA id
 d7-20020a17090ad3c700b002529f2e570esm7742448pjw.28.2023.06.06.07.45.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jun 2023 07:45:13 -0700 (PDT)
Message-ID: <599d706c-070a-c2d3-990e-f6a1720f3485@linaro.org>
Date: Tue, 6 Jun 2023 07:45:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC PATCH v2 1/9] target/tricore: Remove pointless
 CONFIG_SOFTMMU guard
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-s390x@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org
References: <20230605222420.14776-1-philmd@linaro.org>
 <20230605222420.14776-2-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230605222420.14776-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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
X-TUID: HSuCvEyaMkPd

On 6/5/23 15:24, Philippe Mathieu-Daudé wrote:
> We don't build any user emulation target for Tricore,
> only the system emulation. No need to check for it as
> it is always defined.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/tricore/helper.c | 2 --
>   1 file changed, 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
