Received: by 2002:a05:7022:108d:b0:73:d412:d72c with SMTP id ep13csp701103dlb;
        Tue, 6 Feb 2024 13:47:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHNHk8RoBSH8iC/C6Z2xn4IvSyA2AsjTUsem37RhNchLU4ErpSmPAETyPEKnE8dkZ5n8QQm
X-Received: by 2002:a0d:ec43:0:b0:603:fd67:a5aa with SMTP id r3-20020a0dec43000000b00603fd67a5aamr3332021ywn.19.1707256049457;
        Tue, 06 Feb 2024 13:47:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707256049; cv=none;
        d=google.com; s=arc-20160816;
        b=vvJQjdu6pLpfoYj+MaYkKvVj/pldWPUbL5d4Gs4zBidLO9iJy1hUF39mBWx2N3PaKu
         ZapCnNnZ7V3wFhah+x7C9Dp1tCDQE+dn1Kq7AVlxVDyCNaHAIvEt+oxjAa5PwRRWzZP+
         9n9sgG4qa3esgPOZCb4wy8Zc1P9ONIFoBU1IHcJmJYP0+3JWu8xg8WMIaaG1GqoUcKee
         7nniSULXBQIpc/6L+0b1d6s6A2aqoorRwxsOnlgIiQaMsz97mDeH43fSqKoPDPgnTWPR
         XBVtudhMft4uBYMZwe+B0plW0i5csboMIH3y0t4XXWOglGEDOikQTyRENhYPUiMhfGKO
         GlFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=415qHFYNEGh1hFe0iT8uX89EgN+vnOMnD6jFX4CySZg=;
        fh=OXZcZn9gezaalDrAjulrCgt/4PKyLwhlNMe0/J0FoMg=;
        b=vm6fZ62b1mweFpYkrB4h8rzyb28sVHeBOk3ZcZax09l0QSD81/uonc8I6B8FB0yxoP
         FIHzSdVKoAal8sVU8Spc8LgInxuKNIFUw1Angf4UjR0pgWMnJWrRSForC0QKie6d5l1f
         68aHHgSOmtenjC8HvJ6FE4CcTWTbY0DCgNTipEJ2MPY9Nngd43gFjkjdZNjbe76AgHLz
         ipSAEAc2kU5oGcKhwpRb7+VAFbLb6zAPrwHSTDukjpfYYMJndjKA9rBDHzhdRXIZ6+f+
         4eKffKodqGWDouTP1ZU7Tj5JAExShWh1485E4KMbSEOb2/u3tOCsC1JO4f6IT17dDR9S
         9A2w==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rsB19+2N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=0; AJvYcCXvP1pt8yPA/OPDQmj8+puMNotuhCGMk0dMcS3vfBEjM6uS9UJEkr7UyJd2FaJbak7Do7eIZAv5tecQn5/JRSBgthwYzsQJ
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g13-20020ac8580d000000b0042c3b2613a2si1184843qtg.546.2024.02.06.13.47.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Feb 2024 13:47:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rsB19+2N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rXTHX-00060s-Vt; Tue, 06 Feb 2024 16:47:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rXTHW-0005sI-3M
 for qemu-arm@nongnu.org; Tue, 06 Feb 2024 16:47:06 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rXTHU-0007PK-E9
 for qemu-arm@nongnu.org; Tue, 06 Feb 2024 16:47:05 -0500
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-6e0523fbc27so1103080b3a.3
 for <qemu-arm@nongnu.org>; Tue, 06 Feb 2024 13:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707256023; x=1707860823; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=415qHFYNEGh1hFe0iT8uX89EgN+vnOMnD6jFX4CySZg=;
 b=rsB19+2Nu4UrjrRJFgqE0KxIy4hYtt2HygfbnIhLBC9XjMC6kA2PyZklbDEJWcp+Us
 37cqY6KNTURArOr0cbXvnAm+4Qy0CrgoS2DcVBSye8242YdM9R5v9DrUeQG+orlGI0lo
 M8avv2qJTcVKVXxFKcmaMdTePa8xy1Fm420DV336JY+WEBdWU3YcoZmBOtFWHbtm3t+c
 lxciI0xC8qvyXO/5ZdTYtTT+jcf/6yo2G7s83wA5qDXR29Ee7SMwCpD21Ief9HNtKIig
 1QjBkfvD3xTpPuMkuQilVmFgzGQAlp9VFZfh/38vmrhqtWlaNBdIJlXVdj2h/K/H/thS
 XWDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707256023; x=1707860823;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=415qHFYNEGh1hFe0iT8uX89EgN+vnOMnD6jFX4CySZg=;
 b=pPj6Zy8alFiNTuxic7ooPLO13k817Dyd5/0o1GCzfufMJ2w3KyJM62PF9BvsolnUQQ
 lJw7TTz1QqHOftxezXEoiE6aa9LGDxhvFF8xDMxusArHfoNiVICJULgdMrY5wHvvhn1w
 nikNGUUkMFkR+mREk8sMPvRMoZpLAYLotSRkmdTtWIdDwGZNZD2CmJ2W82WZSE+bnSHb
 +Zm2k9K0C9QUmunG/7XnFl9UGoFmtcu8UhTdadtq9leSEAhPIJWtGONZAlFcHQx6T4+1
 79yK4R1AON3dK+6fbUvEZWffIwQgpKTAaOs7cJCx+Q4U/clu1pBGJlSigFr1gQZW/hsn
 0cCQ==
X-Gm-Message-State: AOJu0YyLvUAgkmsR9Jkl04KzM+0S0kho0eW+BR3aV4eNNr4JYPTfcDIK
 zdoNX3BgdvoUWfkoWri5eisiIN7S6GJyaFOoQGsKiviw+UGMEptpPuWZmTfyVWw=
X-Received: by 2002:a17:902:c403:b0:1d9:6420:7867 with SMTP id
 k3-20020a170902c40300b001d964207867mr3655433plk.11.1707256023167; 
 Tue, 06 Feb 2024 13:47:03 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCX7lnSLcram6eHu04XyVDVtd7iBnIipMppbnsTDtdw9BmhEE5l8oDo/7Q4Isos6fCfKS4lbI5eeyhzGeUKmzEel+hmLFDqhgorzGd2B+1AjLKGt07jFtSWz2+Q=
Received: from [192.168.0.100] ([43.252.112.200])
 by smtp.gmail.com with ESMTPSA id
 e11-20020a170902ed8b00b001d940ae8ffasm2382196plj.6.2024.02.06.13.47.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Feb 2024 13:47:02 -0800 (PST)
Message-ID: <9d67ac5c-abf5-45af-be06-c75498b9ecbe@linaro.org>
Date: Wed, 7 Feb 2024 07:47:00 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/13] hw/misc/mps2-scc: Fix condition for CFG3 register
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240206132931.38376-1-peter.maydell@linaro.org>
 <20240206132931.38376-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240206132931.38376-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: XpeAeL45THTT

On 2/6/24 23:29, Peter Maydell wrote:
> We currently guard the CFG3 register read with
>   (scc_partno(s) == 0x524 && scc_partno(s) == 0x547)
> which is clearly wrong as it is never true.
> 
> This register is present on all board types except AN524
> and AN527; correct the condition.
> 
> Fixes: 6ac80818941829c0 ("hw/misc/mps2-scc: Implement changes for AN547")
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/misc/mps2-scc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
