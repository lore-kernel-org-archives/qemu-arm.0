Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp3067636lfp;
        Sun, 3 Oct 2021 08:43:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwRgGhr6PhoB35sHtM5fFd5Be6soj5YfdKZksEBdL89UBEaOLj71sWxprfwW2s3xS9rQxjo
X-Received: by 2002:a05:6e02:1989:: with SMTP id g9mr6340768ilf.27.1633275784889;
        Sun, 03 Oct 2021 08:43:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633275784; cv=none;
        d=google.com; s=arc-20160816;
        b=wWxEiKm+TwyK4dC9etqw0uJX4d6tHdyK1ytmiuSkxNB3fzxYAzNDAwdbrF05xBfOwp
         V6mggtm+yJt6yGfxrrjwvWW2ZpKk8sigsfxgQkIt1ubCZsCJ4ZhY2t8JYIMVVpOnZ1wP
         sR00B8iM/HVnnFjjkbvYq3MNNLTvn4zZMTfngG6E5kV0bf9d2pcxpZ3PQlTrSnc8f9Te
         A3+tVeCXLvXxfylbQ31HSHWCemYmcVUG5LtjWpuOHtUbhoFqoHnQp/N9Iy+cYUy/ovxk
         tKgd4PfXAmFZGuuHousY7UyH40LpJCllD5oIgWHLjtK3rL9dXAbdquy70BnNI2qZWPuZ
         heEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=6oYERK7WY0BnBaaY2D1daaSG7/3fcU4cM2JLTWAS4U8=;
        b=jGi9oje6u05WkBOz35aS/eU9dQ/u7s4Z8CCG0mQ6kcRD4PHtPh/Bdm4KURjB9nFqqK
         OSaQLPkNPpdtvV8zeVVPJh3t6L56n9Ci17qlQL60LqmaRHzWzWTjkpj4mAYVk2OIGebK
         NdvuKTY+kqwZGMRR3UeTFWHdyu3PqitPV4cjlw34X5pu0zvNSuWVl2CE9Af4nsRgPbDZ
         Dvg0D1PmQFr7eVKFZEHLaCFwys6wf4StXyUsx0x+bdtAZQyhNsNotVz4Zh7OK8yu0jKa
         WkUeQ4f0yVMdtsSP2nPdCsPJStnpN8DapXKh2ZW4Jm/F8AFplzAwLJNx4yxzATaF+K36
         S/eg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HamwrdKL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w62si14589447jaw.68.2021.10.03.08.43.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Oct 2021 08:43:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HamwrdKL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mX3dn-0007f8-Uv
	for alex.bennee@linaro.org; Sun, 03 Oct 2021 11:43:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mX3dd-0007eo-32
 for qemu-arm@nongnu.org; Sun, 03 Oct 2021 11:42:53 -0400
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c]:37700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mX3da-0002lK-H5
 for qemu-arm@nongnu.org; Sun, 03 Oct 2021 11:42:52 -0400
Received: by mail-qv1-xf2c.google.com with SMTP id o13so2879560qvm.4
 for <qemu-arm@nongnu.org>; Sun, 03 Oct 2021 08:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6oYERK7WY0BnBaaY2D1daaSG7/3fcU4cM2JLTWAS4U8=;
 b=HamwrdKLnTcNSNQLH49/JC575TLmKzdVGb1SQ+1yCCM5IBS5XrBwppJGfys/HMCyqg
 zRhPdGxF2qCK/zAJ5WC1j6RkTQn99aoc4fJjwmNUTRWMjrowXqN6vdaOpYWTPd02qHEq
 FhipvuG80z9x//imxiOvT3lmKmtpbCE2t7smz+zR1KLwGX1syGTOP9oJQT7kkFtbUDNo
 7OEIEzRirqx0oF5ikJKpJm6QrRPxh0qSuJDmujPQEsHmY3xSU6GnDNpK6zUt4lkJ5CW0
 wjdaRtgxImhgP7xUdhI/Ht0ChKc/U3WGUz2VnzmPG8fS0hgKo/HrB18X0DxpBBAtueh8
 tZKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6oYERK7WY0BnBaaY2D1daaSG7/3fcU4cM2JLTWAS4U8=;
 b=N1GmlkiZJxf9yj6Gsiue0gj1xKUTHOl7lvfzkIJUplBzkQCKe+Y0OExpE5xKtbq/bn
 yPCicjdz+kIE5CPunZtlYYlkAw4BSALFtzzus92jMhgBMxQZDDhAmuRSYoDAVUoEDT3l
 BIWvIAXzPYomFWcV2+XkAemO79kYjQY2CP9LXC24z8QUt+Aaf9+WMrq/yM7sngKAqpQY
 B4a9nYk7pO/c3DQvcj3C4Bwep7rOQOvVZcb7qGzOrj9rft4L8oYUXQLUPaKviFSxwPDc
 F852Ml6phiNCAOlJReioH7Z0lYBGJ60uCiQZ47zowDI2RDTvinPwvSy7Ye+a0jcXwlD0
 IzVA==
X-Gm-Message-State: AOAM530hKDn0BiWrJAzTNthWc8lSkAtckBs5HgCfMsTcmDwLxrWjJBzj
 evZ1hH9Pr34gWPIh/+J9MaWtAXk2/ADmsA==
X-Received: by 2002:ad4:5646:: with SMTP id bl6mr19576219qvb.6.1633275769408; 
 Sun, 03 Oct 2021 08:42:49 -0700 (PDT)
Received: from [192.168.3.43] (c-67-174-166-185.hsd1.ga.comcast.net.
 [67.174.166.185])
 by smtp.gmail.com with ESMTPSA id b14sm6422223qkl.81.2021.10.03.08.42.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Oct 2021 08:42:48 -0700 (PDT)
Subject: Re: [PATCH 1/3] target/arm: Use tcg_constant_i32() in op_smlad()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211003143901.3681356-1-f4bug@amsat.org>
 <20211003143901.3681356-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b94aefa2-eec7-2eb6-7ec7-34b599514a78@linaro.org>
Date: Sun, 3 Oct 2021 11:33:24 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211003143901.3681356-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2c;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2c.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RW41fx2vPmKh

On 10/3/21 10:38 AM, Philippe Mathieu-Daudé wrote:
> Avoid using a TCG temporary for a read-only constant.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/arm/translate.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
