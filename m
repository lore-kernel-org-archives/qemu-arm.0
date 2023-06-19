Received: by 2002:a17:906:494e:b0:982:8c08:340e with SMTP id f14csp2806530ejt;
        Mon, 19 Jun 2023 06:19:15 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ68dKGkCGu8/sAmY+XPin1ZtFOGx2lsEjNN1CkvAmi+ZgsuhPxCZMnLID5F4cAEXmdV01mw
X-Received: by 2002:a05:6214:ccb:b0:621:231d:8a37 with SMTP id 11-20020a0562140ccb00b00621231d8a37mr11349823qvx.15.1687180755325;
        Mon, 19 Jun 2023 06:19:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687180755; cv=none;
        d=google.com; s=arc-20160816;
        b=RO8Xne2StVyCaKoMMe0fMp9bKr+h5H/Wf6xd8LU1/E6+g+Yr+z+mlrNhLzhNgZtdkw
         KlCtgrmTDVUI6WlMO3sMb8+ijtQrXUUI+JE6T8VqDCxpvx4xHaBHYvJMZJlUf+RIvUsB
         r3UcI0eGHh2xUuHMsBqz8qDXVtee3SgHcr1pQmn3UEHqC5sUCQUGiFhTUXCY7HOmCxLg
         EYL72etcEz1a/tAWwFOugFvVbwn4i1SlrcHLNM+41htsVuhXaZQ/hewRLV97QaND//vJ
         lJd+qx+WcmsmGGVbYNZAoPRPvHPJEIeGJ/rP2DY8zGAkZ5qKirDhTSXg0TaJ884XFLn9
         Lw9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=kV5ocU7i0KBGnZGeOM1hIpbYTuDSpqrAyFJP5fIGdWg=;
        b=R1HbSdmMx7cE5eW/ea4XQpJywCgC9FbrrfSWKIonSFsTkkfjUo1/MYfvg6z9dYJgLJ
         sk3Pv/RRxmg23jhmtjpL5FoJy2LLB3+o7duFGEKFfiGYU3ubtScc1FkpiDQLQzPq+hIv
         Dr3KuTmDGttdF2nNzbxQrbiaH42imw/6NaChfkmc6LXkOMvgtN8TvVHrhdVITA++Nyka
         BxEoQllxamcjiwqR0+3++5tx2wmeKkALwZF+omMF6H9xSxNo6YX7+Ck4O3qdjR563UbJ
         NwIT3XGTeHYVwyHHEGxmPTDmEUcI1tzhcG2yrJsGROFbs2GdFz2BZoX0xT1G1BOmE4bE
         uT1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="VQ2o8C/6";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ou10-20020a05620a620a00b0075cf2261b22si12821542qkn.470.2023.06.19.06.19.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Jun 2023 06:19:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="VQ2o8C/6";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qBEmc-0005Rz-U8; Mon, 19 Jun 2023 09:19:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qBEmb-0005Rb-Qv
 for qemu-arm@nongnu.org; Mon, 19 Jun 2023 09:19:01 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qBEma-0005gi-3u
 for qemu-arm@nongnu.org; Mon, 19 Jun 2023 09:19:01 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3f90b8ace97so21507595e9.2
 for <qemu-arm@nongnu.org>; Mon, 19 Jun 2023 06:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687180737; x=1689772737;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kV5ocU7i0KBGnZGeOM1hIpbYTuDSpqrAyFJP5fIGdWg=;
 b=VQ2o8C/62rZ+PSvaRUUcTnQytF8XhwI1mD72WU55YycNSpZkOOWu6hUxCamALw+uC+
 lvgX055QCubK8zxFzBzQPALx4A9k3UJsbQR6y01/j8dY/f6DxnxZMsVjGFkAIuutd6o5
 GFfZ3LTITNmYahqqbjzZt5nKfgTjTcvv/5QVGwfYmRO67hxLgNrRShnL6/6ayV/wwhDV
 oonEoWfZVT+olmkZIdcconT74i/1N9yErMQUD+So7MX5deYky0l9JrCFTqT4F98N+CfE
 hTNyGA/pKETax5BcPfMrGVCWpScI4yFpinrdVQBHtSv6zvCiJNBVOJKolL+KTO4i3+t/
 OTpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687180737; x=1689772737;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kV5ocU7i0KBGnZGeOM1hIpbYTuDSpqrAyFJP5fIGdWg=;
 b=ekSP5danoq4P0CGR/HaK50zxnLv2IPzkVQUnftv8sVXs/zkGXETIBlZCdbS27boXrq
 2mubVdSiIeRWwqIO5ykLGM5LSz1ctS/e3UMUMw8RHgc/hT/c98Se1EqRblmEGZCLXTCH
 B0HprSLPRN1k2YboufELtnv3nuZ/dHsTvj8pUa4Tnyg7lUEr+Ocg9AC7TqXDEyxVbZ5G
 3M8Vnbab8Sx+h8Hd1+UFjSnt+zKhQ8buciG0O66lyQtOW78dLdl9cb1r+d+AIVzaWMlv
 leyr7exrVu7iAfiQ1WdT61/vGT4LCDDYm65FJ1jfQyxkIENbKPGrWprigoUM+9qJaF1y
 mwSg==
X-Gm-Message-State: AC+VfDxugjHlX0z5ClxpjBRLtIC9ZrTZj4XxYrQjbj+oaaNfPIn30I26
 gI+2CYuJ/aBED1xuqHXUVjCUkA==
X-Received: by 2002:a7b:c342:0:b0:3f4:d18f:b2fb with SMTP id
 l2-20020a7bc342000000b003f4d18fb2fbmr9447164wmj.8.1687180737358; 
 Mon, 19 Jun 2023 06:18:57 -0700 (PDT)
Received: from [192.168.69.115] (sar95-h02-176-184-10-225.dsl.sta.abo.bbox.fr.
 [176.184.10.225]) by smtp.gmail.com with ESMTPSA id
 l5-20020a1ced05000000b003f70a7b4537sm10722393wmh.36.2023.06.19.06.18.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jun 2023 06:18:56 -0700 (PDT)
Message-ID: <1515598d-0de5-6114-efa6-963bec310e6f@linaro.org>
Date: Mon, 19 Jun 2023 15:18:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v2 35/38] crypto: Unexport AES_*_rot, AES_TeN, AES_TdN
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
References: <20230609022401.684157-1-richard.henderson@linaro.org>
 <20230609022401.684157-36-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230609022401.684157-36-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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
X-TUID: 3QRBUVWi0k7i

On 9/6/23 04:23, Richard Henderson wrote:
> These arrays are no longer used outside of aes.c.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/crypto/aes.h | 25 -------------------------
>   crypto/aes.c         | 33 +++++++++++++++++++++------------
>   2 files changed, 21 insertions(+), 37 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

