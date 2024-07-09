Received: by 2002:a05:7022:1005:b0:83:cb6b:1575 with SMTP id em5csp1510622dlb;
        Tue, 9 Jul 2024 07:11:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVjUwiMRu7b2hPiUram79ZFUYVd/zmI/Aee397J2x+JFirzwJirfWbC/RCwSwaG/NVZ0QzCeBX7QI973Ts7VgkHePV/Id57
X-Google-Smtp-Source: AGHT+IFFM4lTPFpVz5yphwVnrfYZDwV7ZhoHbv0WyTEm8u/0vF7YeIa6Le0GkBdBEcKmVCdf3ThE
X-Received: by 2002:a05:620a:2a04:b0:79f:9fa:8224 with SMTP id af79cd13be357-79f19a78c9amr309270785a.36.1720534316290;
        Tue, 09 Jul 2024 07:11:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720534316; cv=none;
        d=google.com; s=arc-20160816;
        b=CJVLTAgZLMrT+pUyTwMIw/NBIUu8Fx+hksyzvw8wTPIOVa53VSj5JjrwzIPq0dJf/w
         /nu7RadZQOqbcL6u3YUba0PWRNrhCvWiyO2vvL1iJklOzT2P1XcszjCk567qcgMj4ThM
         BPuJov+Jeoiiep0LJbmORvdu9Rm5wXU2/UrHx8ek1mnPjmCGNegXviNcK70TJKb13Enp
         5ewjMfYmQzqQMSm9+9rHnc1O/ecjZGiF93Ym2iD2kCkLXJy6O8rvGffXVU+bY8wbqhWZ
         gEGHLj+a2JjGjV66vR+fJvi0lEKv26b26C0zHZsbgqIhq6Ty7bIhKtdoelHxMJtGcPcu
         aG1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:cc:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=p7vYtHKbZ2cJT8oGb2gM+7beXn/UcCM+JbgqbyZMXSw=;
        fh=9dJBVdw5w5Om3LAsX8d2J6qaz7vkRKDLKyzmkdLCS1g=;
        b=fJS1BCZu1MmSIsPiflqsoU1XGi1h4v9vWplKvuyLIQCbK4OlhDgIQy4ppYnQzw2Jnq
         yH/vZZMMdH5rkg1zo3V/s6Pn+Vng3QLI3bCTdPDsZBhXhBGV4QJJ4Rqm9eI9yEtXHkF1
         aQIe1fQ3FG2PY72wXn+0kgLI5T42UV+c6oHYoyIK8a/WXtI2/Rj9/D1jQMi5rVo8Bo6p
         REpKkY3wsdJvdnCkxHrMYl4aaheMknMIpHFvq43+YCgbg4ibkdVhFiPPj5QZxbW5SHFz
         76nq9mhouNPs9Ydc0saKcZxifgfg0e9GjcjG13t4tBCYLtklEERNmyeMOwY15WjOopS/
         jRRQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YDKHdJiB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79f190a17bdsi217022285a.262.2024.07.09.07.11.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jul 2024 07:11:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YDKHdJiB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sRBZJ-00034r-P2; Tue, 09 Jul 2024 10:11:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sRBZJ-00033b-9R
 for qemu-arm@nongnu.org; Tue, 09 Jul 2024 10:11:45 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sRBZH-0007a4-DQ
 for qemu-arm@nongnu.org; Tue, 09 Jul 2024 10:11:45 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-367a464e200so2808789f8f.2
 for <qemu-arm@nongnu.org>; Tue, 09 Jul 2024 07:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720534301; x=1721139101; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:cc:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=p7vYtHKbZ2cJT8oGb2gM+7beXn/UcCM+JbgqbyZMXSw=;
 b=YDKHdJiB1wfJlpueIigdz3o6cJ2O6GtGjfgFWK0Ndfr9aacfvXpPCPShEgsFk6yOgQ
 n/H0EHB8pnkOGx8kZk1b4N5fxqRKwe1Aag5/wRipAvTYHIsuH4FZwENCTfbpvfxF7zFw
 fooOU+4AsRxpFhg4QOYMJvyK33depD05h+9G6YE+jrMhUctaDP4PXMn96N/M48309yS2
 TsV037EURvegsdsNpHq/chkg2bCH1o27EDEZctw8SqDk06bM5j+vA0qUdEubJWQFzTgV
 plHU/OknewfBUBXZVi9mhbYTNV9URg05M+nYVpb1I8oxtXHM8sL5Fltg9/WrU4n3dZ1z
 kPZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720534301; x=1721139101;
 h=content-transfer-encoding:in-reply-to:from:cc:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=p7vYtHKbZ2cJT8oGb2gM+7beXn/UcCM+JbgqbyZMXSw=;
 b=wgpBQoK+8690MsPwRJg3Qnf15Yio0MjXbVfkfZa6NrbcwbFidvqp7AxWSlRBxK4ame
 bbzd+rvjHGkscVH4m0EMQvdjn1SbKthC6kPUEH6tFrw1vuU0s7MalqayShJEjLFkh+NE
 3rd+1q1ej9Yq1t6NjMdMILUt+LOL57ZXlcwN0BmGPORxJ5lNNkS1luwI/G9MKZeUa+aB
 By+22aYXfiLbf4/f70VPkdOsFL5javD4u3H2ZTYwgG4+Uj8JKkK8OlUY5A59kbRP7Nl2
 A03xh/Y3cncDPwE6saPNv8MaNQSLIBWi3Rt/WyMgZeErM+cqASfY01MdZwhIkqHPRmvf
 0kYA==
X-Gm-Message-State: AOJu0YzGLlrZSkbKgi+tur3kEC37o9A0lnHv8vW3yta+B+TDCIl+LlXt
 o3zRQxHqR8JjtxReO27DSkLxGPdMQraXzjkJAy8ImGw3aX6KGuMWBDmIcTPCk7g=
X-Received: by 2002:a05:6000:144a:b0:367:9279:c402 with SMTP id
 ffacd0b85a97d-367cea467eemr2549424f8f.1.1720534301620; 
 Tue, 09 Jul 2024 07:11:41 -0700 (PDT)
Received: from [192.168.69.100] (vau06-h02-176-184-43-20.dsl.sta.abo.bbox.fr.
 [176.184.43.20]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cdfa0666sm2672131f8f.73.2024.07.09.07.11.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jul 2024 07:11:41 -0700 (PDT)
Message-ID: <448e03c7-9bf8-48f5-b172-36bb06ec1139@linaro.org>
Date: Tue, 9 Jul 2024 16:11:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] target/arm: Fix handling of LDAPR/STLR with negative
 offset
To: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20240709134504.3500007-1-peter.maydell@linaro.org>
 <20240709134504.3500007-2-peter.maydell@linaro.org>
Content-Language: en-US
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240709134504.3500007-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: dmYDeQEqRUkd

On 9/7/24 15:45, Peter Maydell wrote:
> When we converted the LDAPR/STLR instructions to decodetree we
> accidentally introduced a regression where the offset is negative.
> The 9-bit immediate field is signed, and the old hand decoder
> correctly used sextract32() to get it out of the insn word,
> but the ldapr_stlr_i pattern in the decode file used "imm:9"
> instead of "imm:s9", so it treated the field as unsigned.
> 
> Fix the pattern to treat the field as a signed immediate.
> 
> Cc: qemu-stable@nongnu.org
> Fixes: 2521b6073b7 ("target/arm: Convert LDAPR/STLR (imm) to decodetree")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2419
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/tcg/a64.decode | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
> index 223eac3cac2..f873e8bc8b9 100644
> --- a/target/arm/tcg/a64.decode
> +++ b/target/arm/tcg/a64.decode
> @@ -520,7 +520,7 @@ LDAPR           sz:2 111 0 00 1 0 1 11111 1100 00 rn:5 rt:5
>   LDRA            11 111 0 00 m:1 . 1 ......... w:1 1 rn:5 rt:5 imm=%ldra_imm
>   
>   &ldapr_stlr_i   rn rt imm sz sign ext
> -@ldapr_stlr_i   .. ...... .. . imm:9 .. rn:5 rt:5 &ldapr_stlr_i
> +@ldapr_stlr_i   .. ...... .. . imm:s9 .. rn:5 rt:5 &ldapr_stlr_i

BTW I noted some instr formats use 'uimm*' for unsigned immediate.
Maybe we could recommend/enforce that, having 'imm*' always signed.
