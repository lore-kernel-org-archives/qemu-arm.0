Received: by 2002:a17:906:ae84:b0:982:368b:d395 with SMTP id md4csp986582ejb;
        Tue, 13 Jun 2023 22:36:10 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6Q6fnmQOLvaZYPpL409jfq/k5ickpa6ormdly7IF/JCgPpbBKeo7AE061miuSI84lAj+KW
X-Received: by 2002:a05:622a:256:b0:3f8:5ab:ddaa with SMTP id c22-20020a05622a025600b003f805abddaamr744312qtx.68.1686720969956;
        Tue, 13 Jun 2023 22:36:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686720969; cv=none;
        d=google.com; s=arc-20160816;
        b=Fa3lmTlw+Sd/PV74zFw1mZPCmMvTj+vihwOp//ecUS887uIoJNxsvvGMZZkaEeiV75
         PSfollyiV+g3jQFFc2kPM+p1ZJtmWd1uhOY+X/zKv+JfvpLz2rt7X7vrx9VN0KzLufIP
         wTd/TyNcuDeHrt8bu3X/FokwQ7nwe+zK+uTGxQ71YWk0ObVw/CLoki6E5B2ji51U/uul
         EQHOGVN7r+437QztCUjt5hSA8TXbRCzl5ngIAbmMD/lHul7FoXf1o1k3KaMhBqMXHlDL
         lDlNA29YXNdbMlzpDPgsKXkWOf5p06+qCiYCvchFRVVDF9Y0dWplv6Yj22SGjctXYt0o
         rLYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=YTepOwZjAtLFEGurG0Na895JDeGDsFrRU+W+VFHVgac=;
        b=tpI9GJbTXw8nRFsok5fO262AfQIgBQiGv8jh5Lea9v8Qwc5WkIufEPvBgqxg1sVwNH
         GrHqT8J8XbcB4JSJVuonZpm8zraRgXB1VEA18DmTRraZcQuBbdVGlpA8o9CHkpTM1YwT
         qkZoxQpVUJKgVSv+LwA7GhWkVPu0XGz/plA/hI8HOVC4agJEN2lMMFU6BC7yY97PBdZQ
         gU3MlPj4+PcRZLvW8tH5Tj1J+UzSOhNeYJ7DWIZu1gcb0oPIptnflHc+yRVXbhb4RRGP
         dkQX9ciMKe3SGfjNkQUKphG73syWaqz98VbQDzRrnZSRSv+PtANIKzaUsYTB5HQOAiXm
         Gi5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H+R60nOl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o14-20020a05622a044e00b003f3b8d3e0ccsi8033552qtx.785.2023.06.13.22.36.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Jun 2023 22:36:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H+R60nOl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q9JAU-0005OY-SX; Wed, 14 Jun 2023 01:35:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q9JAT-0005O4-Ml
 for qemu-arm@nongnu.org; Wed, 14 Jun 2023 01:35:41 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q9JAS-00056S-3A
 for qemu-arm@nongnu.org; Wed, 14 Jun 2023 01:35:41 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3094910b150so6256328f8f.0
 for <qemu-arm@nongnu.org>; Tue, 13 Jun 2023 22:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686720938; x=1689312938;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YTepOwZjAtLFEGurG0Na895JDeGDsFrRU+W+VFHVgac=;
 b=H+R60nOlZ8xDi9RmpOyljX45AcsE6/ue2pD40Vu86nYhENaJ2pCwcMJ7/8Og12oxVp
 AaIOL/xI3sfQQcMWJmFOWFBAKVdltQ/IVhXmeX8VsGl7DLbnbmGx69gVabkaRBR4Rad+
 qgardgl0Gs2yTz/YUgnabtCW3rZXX1XTEgW2G620BctaaIXqHdUhwF8V2c7DFjrSC+IR
 hXJqBIWoF+4jQsKO1e/0tDlxq/+fdsuwOlEV8JnTZKPbZlaChU6+Rbc6exCvHXE3Vryo
 y8qL0IK4vS013ZWhzhpob0cGVFKXJ3/RFPAVe4hbx73AGKKGULXsUCwRTA47pBCQtzMO
 Tp/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686720938; x=1689312938;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YTepOwZjAtLFEGurG0Na895JDeGDsFrRU+W+VFHVgac=;
 b=VZsC1jqs5+49mBSKkzVnAlEjXK9YWB0+2NH+6DMXjyWre50Zuyz/19udOJ7SMwGpR4
 jogp92Utmuufvm3CKjZy5fgumJT5AIZLyV5mgAijhKVR8glfo8We6DaB9GQ/EjJv7hVb
 86w601cRtOcevNO/aD5nZMwXsAxRRK8a8I66l9HefLXYEZxgb6Yoa8ywFKjGC/7dIXYb
 8I4ySZsSkGakgwr5WaNKkjMsbknn03g4xD/+MbgB/kHasXtk8CLjIf6foOD/I2Kb84Ut
 JdWEQM/PP3EpfxYi+69rLepnq9I8DMsndO5XNaX8XY43aeTAlaR6oBO3ALK5uhFdejAM
 9N4A==
X-Gm-Message-State: AC+VfDzeQgiit/sCaOZtncqdDLZxSoZO2H0v684EcrHyW2ABD31BVsz1
 qV8WCQPV1sthI8Wn7FuP36/PWNaMGbsstOrDVYbmF/z6
X-Received: by 2002:a5d:5289:0:b0:30a:d8f3:3e41 with SMTP id
 c9-20020a5d5289000000b0030ad8f33e41mr8271674wrv.7.1686720938287; 
 Tue, 13 Jun 2023 22:35:38 -0700 (PDT)
Received: from [192.168.4.112] (90-182-62-66.rcp.o2.cz. [90.182.62.66])
 by smtp.gmail.com with ESMTPSA id
 t25-20020a1c7719000000b003f7eeec829asm16215079wmi.10.2023.06.13.22.35.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jun 2023 22:35:37 -0700 (PDT)
Message-ID: <096a97a3-bfac-a0c4-6e11-d99cbce10cbf@linaro.org>
Date: Wed, 14 Jun 2023 07:35:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 22/23] target/arm: Convert load/store single structure
 to decodetree
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230611160032.274823-1-peter.maydell@linaro.org>
 <20230611160032.274823-23-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230611160032.274823-23-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.098,
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
X-TUID: CqURAEAzHg3v

On 6/11/23 18:00, Peter Maydell wrote:
> Convert the ASIMD load/store single structure insns to decodetree.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> Message-id:20230602155223.2040685-20-peter.maydell@linaro.org
> ---
>   target/arm/tcg/a64.decode      |  34 +++++
>   target/arm/tcg/translate-a64.c | 219 +++++++++++++++------------------
>   2 files changed, 136 insertions(+), 117 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
