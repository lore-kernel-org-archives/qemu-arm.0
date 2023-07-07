Received: by 2002:a17:906:b1d4:b0:98d:b2f5:1316 with SMTP id bv20csp746941ejb;
        Fri, 7 Jul 2023 13:39:23 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHw8h5nGIgCA2hqmtjqNk2jlrDGa81+211nUgZItm5i21bHJtTWovAmiDNkwkDtef8yGE4U
X-Received: by 2002:a37:5a06:0:b0:763:9e42:6bf7 with SMTP id o6-20020a375a06000000b007639e426bf7mr5334964qkb.66.1688762363101;
        Fri, 07 Jul 2023 13:39:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688762363; cv=none;
        d=google.com; s=arc-20160816;
        b=J61rU1GZgfZMwgjDC7q3/9cDq/Npq9+OZPGsyMPZVljTXyYikrFryThZnLYPwvgzyO
         q9MbdUsNDlaLnVtIcY5qKK+2c82TCgKrItMiibWFuhaZYUz1poXU2+s2PcFELloETOdg
         AZDogB0vJymijYoHvxW/p9WrSFKwf7MUEdQjnYASP9ISrM2Yk+VTdTf0ctscsTKwwNq2
         g2p0KSMkjblwh6DHr03GJwWddv0XVUTw3C6sPDgEfKE7fiUeigv9KOhLvdjQcqyPCqJg
         YLczlK1bjaSR5I1HpnZgT7ZwOnbETSRdsTwkJM++uNUOfcDbj+729lC5ppMlz+Y4at+h
         8MDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=et+/elcHg+a62zExuPVej8nSALpAZoGG0auR+sdNInE=;
        fh=j8pwsiah+H3QGMu65HcARaW+qpQzvNSIWsTdXEYkYfs=;
        b=oIPjNepdXPBrIcfQoQQPdHTzoa57BjO6GTjGZnWxoHLExCD2xeHIHhyM8uS+2E3lWl
         /nlF2K6SMU8WfPA7gc+NoMq88qDrmqxsR5Ao6Ty9ckClpE6rmihYyQpEY80gecPt49Y0
         yPqRQbaYjRw9YTbk1xWV1ZO9EqkhVlFa+NiLwbFPVrPPa2J0r2H3MqiWXoL8r/8YkYLI
         I1yko6Mu1bHmcpC4q9iaeKiKGgJhNrR/aeZmbTS3IpHqWDcvTr3kOfqs7Qkhytb6/OMl
         0BgOa2O9ZWE7KL2y2dw6IeUDF/xzC6ignVlEdraA4R+91u9J7+02qfNCO3uuALaJT5vm
         B96Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i5qplfqU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v5-20020ac85785000000b004032991c379si2998534qta.426.2023.07.07.13.39.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Jul 2023 13:39:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i5qplfqU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qHsEQ-0003lb-P7; Fri, 07 Jul 2023 16:39:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qHsEP-0003ky-Sp
 for qemu-arm@nongnu.org; Fri, 07 Jul 2023 16:39:09 -0400
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qHsEM-0002Nu-Dd
 for qemu-arm@nongnu.org; Fri, 07 Jul 2023 16:39:09 -0400
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4fb9ae4cef6so3772508e87.3
 for <qemu-arm@nongnu.org>; Fri, 07 Jul 2023 13:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688762344; x=1691354344;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=et+/elcHg+a62zExuPVej8nSALpAZoGG0auR+sdNInE=;
 b=i5qplfqU8VhKZN/r+LJ6QXQHjFlthpIcUPvdVCsoP8f/lmFXK7YGDu5voPUyJXyLLf
 qwygHufhVvxc4JgpYhkUuqjtOq6DJqFP00g3+IKdPGbj25gDXwMEZ0iapNUeUCs59mq+
 mUboskpvFXQrE6P8XlTS54dJXqjBRMOYhZOKC7DiACPCon2sAmZLgUDlY/o4RmRjhqys
 rKXVCmsRQc6rtDlDkrhvi2kY4K7yTriZyj6iJta8tsYvn+xWHnCryw2RMiNEE6iOq0h0
 UWC+vzP6TNLPr2lDCqX53NZLOCxBJM+YLUyZ+OA4+e0iyevhuv+bJlzsu12Qcca+8GUu
 OyXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688762344; x=1691354344;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=et+/elcHg+a62zExuPVej8nSALpAZoGG0auR+sdNInE=;
 b=cQGwXE5ahVU+IvqjgDFN7FeqLf8usBP2C2zlNPto3mniI6Zo7YhijbCP/Ri93ZWhUz
 iqE8Jj7pZDmhoG+Pw2Zt4kdYy1oKCqC8K/1pVheUWcv2k90W9PzFYUQcVVw//pvb5Xj1
 AZyzN72cModJvZ2CMf917d+AjS4SkSdawLl2fvJAD6BYRpmzcU4jIi1i7ipX0ly4eiGU
 ehqOLhx+kTz5aSaTo96ecYTOo0tJLj2DWWgDjZ9fGCwWkQvUMDuC1VfIeQud3iNbPW/Y
 BQnlgX3mr/pvVxKhgf6L17tiZqDy2HblLOe/At0+QwaaZJSD7uRO4/vv5PWTLks8DBV5
 3qEg==
X-Gm-Message-State: ABy/qLbazH/bqywhIAtoadKXKR5HkoUyeRpeFVmRe/MBW1PZ/PDYAMT+
 BIxS6n68xPIyZS8+zNyEb3Fn/A==
X-Received: by 2002:a05:6512:6c7:b0:4fb:8eec:ce47 with SMTP id
 u7-20020a05651206c700b004fb8eecce47mr5275445lff.58.1688762344383; 
 Fri, 07 Jul 2023 13:39:04 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.184.32])
 by smtp.gmail.com with ESMTPSA id
 b5-20020aa7df85000000b0051bed60f333sm2415641edy.48.2023.07.07.13.39.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jul 2023 13:39:04 -0700 (PDT)
Message-ID: <1c8c0a18-fd38-e74a-bc00-116efc6488da@linaro.org>
Date: Fri, 7 Jul 2023 22:38:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v4 29/37] target/riscv: Use aesenc_SB_SR_AK
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com,
 eduardo@habkost.net, alistair.francis@wdc.com, danielhb413@gmail.com
References: <20230703100520.68224-1-richard.henderson@linaro.org>
 <20230703100520.68224-30-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230703100520.68224-30-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x12a.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: HF58pJMyNj8D

On 3/7/23 12:05, Richard Henderson wrote:
> This implements the AES64ES instruction.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/riscv/crypto_helper.c | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

