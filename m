Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1012363lfb;
        Fri, 15 May 2020 19:06:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwihlsvuyU9wibuC2vLPZ2uMdPMdOD3D9Do541oevkMMcIPgMcGJ3YPrrk+lLVLpTCQAoYy
X-Received: by 2002:ac8:5184:: with SMTP id c4mr6320475qtn.356.1589594770908;
        Fri, 15 May 2020 19:06:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589594770; cv=none;
        d=google.com; s=arc-20160816;
        b=JzvvQcaMHdGDebunztZPXfIUmqL52jyz4L94EO5R7Ey+Y0scIfXGVfxDKztFKQrHq/
         InwgWJfPFfcaZPuoFU0lDv8R6eszhMp1oz31hOnR7Z9QS7aafw8ncL00eIRFsLsxiswE
         gKm/GdxWuSKbzujAIR59Y1sPvdE9f66bdjBVGabjypaSxDd54iND429EyHMtTisYYs4x
         4xwqHwmkuU6gpwP3fMBfhSOlZBQA1Iw8ymDfKUKYNrX86Cpas6iMD08vP6v3wvqMbRiI
         TJvh87QoK8xhZG7vb55gafMX5q2I+OSFj/h8FJouKjF34OQDYaKfOJezjmc5zeck2DmB
         U6xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=K3/AiZCIlNmYCHQNHs9+FLhY/VlxpY2cSgseGGZqYdQ=;
        b=cfWzLeSq7JUAG09kUODO31G3kD7FhMdcw3bXpxg2WpB+QD/6e7wTD+FcUjVB0jesAA
         94Tp5IGD2fEuakcCFlaBp7uukRwArLNH9tsAiHgw58KKfioiNPb4fOKSW/I6aZ372pPU
         J+PSrhyndHl9glr1Pgy1vizP5k6a6Sc2zxUTgP62jwCktHpJ2D8Hy9tB7ZRjeqIWst6f
         RAnQaKaL431gf0DnupOIor30BNuA5MAdrojN7o2zQYs9HTQKnGysmwBBn8Ve6RW4upTk
         sFjSs01HLV7zEeI7SxiR8Ju58pV7bKRsGh6n5F7njugBNlkxW2tlhfjegSBGQmqrxqYt
         7Q9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=soGxyvtE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m21si2148878qtb.83.2020.05.15.19.06.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 May 2020 19:06:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=soGxyvtE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jZmDK-0001wc-Cs
	for alex.bennee@linaro.org; Fri, 15 May 2020 22:06:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jZmDE-0001wQ-1Y
 for qemu-arm@nongnu.org; Fri, 15 May 2020 22:06:04 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:36337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jZmDC-0005A0-IX
 for qemu-arm@nongnu.org; Fri, 15 May 2020 22:06:03 -0400
Received: by mail-pg1-x544.google.com with SMTP id c75so856665pga.3
 for <qemu-arm@nongnu.org>; Fri, 15 May 2020 19:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=K3/AiZCIlNmYCHQNHs9+FLhY/VlxpY2cSgseGGZqYdQ=;
 b=soGxyvtEvh0WXwjadjLnRwdW7P6/EtX2IAd7GcAV9Hf9u1KSoeoLmdzFCzAvYBsbRa
 rmgtKW1H3D81q0pDqDMb9ThDGEZrtN6vXHLogVILo19qBLrvvK1k0eALF0y2wXRlCkzO
 vLHTCItB3fhvlvx+Css7kCbSUlOeOeLezF0WPJOzvCf8tGSwcQTXCi8hAuto9nM7FRXP
 mxvmtzQVTS26yWGrYB2oZZaI+2simIne23hK9QpFHnr+l9XCtTtB2B73QRh4hY1IMtG9
 RE5a5Yl6/ITy0ddAr5CrODgfAr3OF8Pt+MDxhGZ4yY/KdpOM5qoC4nLIOMDvcY8O8OGD
 hkEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=K3/AiZCIlNmYCHQNHs9+FLhY/VlxpY2cSgseGGZqYdQ=;
 b=P/M0ozO+muCOMDDJ3b2EGHgc53d7QfAmC92j2xEooww6Y9UcYX1r9Q6wopJlENN88E
 D0xjWjyMImBzj/oceHGJxIO6K898k4Bh3r01UQP1UXbDYzqi5W+Pf4TIc5rODS4NKEU7
 hrM4uP9V3Xs7kU/CKCyUTp6YHpcqLfhlQSv3DkLHzkoqYA/IYUpm9f+5Y9ZHohxV6++E
 GBUU9eFH4VkLYWh1ZBnsuh2pC3KRatlM7SS35zTHTG60/N1c0c77FEd+ETnlJ+KcFKZF
 VPju5MyyOT4Pd65Z4rsGzyzy2zyUWV0/KWFIO1rIMAm505HC91u3KS3bcrST+GG34xOj
 LKyA==
X-Gm-Message-State: AOAM533X3UAeZWPaRjqKEred5QCkuiZ26ONaEIxx6cddVJbHCv5fsAA9
 HFrK+LcdrbMcmnZAHYxCsyDihQ==
X-Received: by 2002:a62:35c3:: with SMTP id c186mr6553417pfa.261.1589594761115; 
 Fri, 15 May 2020 19:06:01 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id i7sm2448419pjj.33.2020.05.15.19.05.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 May 2020 19:06:00 -0700 (PDT)
Subject: Re: [PATCH 07/10] target/arm: Convert Neon narrowing shifts with
 op==9 to decodetree
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200515142056.21346-1-peter.maydell@linaro.org>
 <20200515142056.21346-8-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a1f1a87b-7b31-cb70-6d2c-b68a864a2429@linaro.org>
Date: Fri, 15 May 2020 19:05:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200515142056.21346-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::544;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-TUID: Knssgp/dK0uY

On 5/15/20 7:20 AM, Peter Maydell wrote:
> Convert the remaining Neon narrowing shifts to decodetree:
>   * VQSHRN
>   * VQRSHRN
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/neon-dp.decode       |  32 ++++++++++
>  target/arm/translate-neon.inc.c |  15 +++++
>  target/arm/translate.c          | 110 +-------------------------------
>  3 files changed, 49 insertions(+), 108 deletions(-)

Modulo &2reg_shift_nq,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

