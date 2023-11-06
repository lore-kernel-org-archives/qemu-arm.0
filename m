Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp2702771eja;
        Mon, 6 Nov 2023 04:00:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IElY676awF4gebqG+3Hoq8H2W7zuaI2h0+qBwkv/JqzF/arI+YNIHV6E9zuEk2Eba1D/Hy9
X-Received: by 2002:a05:6830:25c1:b0:6bc:f6d0:87d9 with SMTP id d1-20020a05683025c100b006bcf6d087d9mr36983810otu.5.1699272007527;
        Mon, 06 Nov 2023 04:00:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699272007; cv=none;
        d=google.com; s=arc-20160816;
        b=JJOmAo7r9k5xH5MnHYnkIW628jOgj6/kpbEALPk4inPbx9aLFfHF3Pf9U8pljf17Ux
         aJkv2UBdbxpQmzRvqSgu9DrffRNiogzmKYVFXs0jk0SiuWAKkPQth8wX/YKDXBaC3g3N
         VLLYTpYbvHI4XbJmiOERY2JNQa+Rc+SiFVHe9RmTiMn+xmj6BI4Mb4VVG1eau+jcD5s2
         /FmMLIZV3H+aemcp95OfOj4TU2/oIRAODkHv5ANdhx2epC3M7vk0Edv5/i6aJBZNqzEh
         PmY13xfxy/6JHIZ8hE7WsiMJV/hFM1JKL6MxGUz0pGqAYVw6i29FfyXSx7tsyye1euGq
         jbVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=CyM3rlEfZ9+NO+IGfBXHRBz3BT+cMJzydgbt6qMBtE4=;
        fh=PRoHjD/djUAHQXeMIrzpgUv27otx4sratw48fpw7M0k=;
        b=mZCZMzZElRga4DKcj2/kNgJjgxTQlO20mbyaYgN75a8x8Lw2DlVCcJAGmGnEwhxK1d
         TlXz9eoQkTFDU4gOY/0edS/+nvkME1uC0RPU/EV/OzelpxvUkGjhkyFdYB3nCHBV9WW/
         yovVnSTz9JgoBzYI/yHKGeFjQKNDo2/aLF1GfqGXDlp4A8sBYfqG6Io3sFi+acsEuNkB
         CDAAAtbPLStHH1Z330+8s0yUHH1M7nsC7iL3TTqvmBlaZeDJ7PDEZw361R5H1MeVXEsg
         CNejGYRb8+uNMNgFYJVR7Ec9jArgdoL6AeVtVGI/66Yofd3nLfQQVrwr0qrQgBtYtie8
         ThPA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RxjWtKib;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y20-20020ac87094000000b0041cb95e3d9asi4919682qto.44.2023.11.06.04.00.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Nov 2023 04:00:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RxjWtKib;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qzyGf-0007Kr-Vr; Mon, 06 Nov 2023 06:59:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qzyGe-0007KT-AO
 for qemu-arm@nongnu.org; Mon, 06 Nov 2023 06:59:44 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qzyGR-0007kd-BF
 for qemu-arm@nongnu.org; Mon, 06 Nov 2023 06:59:44 -0500
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-32f78dcf036so3237660f8f.0
 for <qemu-arm@nongnu.org>; Mon, 06 Nov 2023 03:59:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699271969; x=1699876769; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CyM3rlEfZ9+NO+IGfBXHRBz3BT+cMJzydgbt6qMBtE4=;
 b=RxjWtKibcGrJwVWArXChxhRRjWmlCfVHEE652C20msUu/c+PrxMvjU6LbLnioLxv57
 ei4oD0OFB7kyri9q/DZwNeZQWqyI6eWOQmK9VxrU182zrLwMv7efQi8Ul1cSYc85C7xW
 cR6BLcsIk9wcSpzNTaixVcT9e6RY7vZ0SwrsUEL/aR5KyPLnxJWiGPOIO7dF9YyV/m/X
 2Vt+lPiDRarqKm2qvbCyQbzdj9lHXDq+ZIFve84t+RnKkBzx83CSqWgfofoZ5o4gNVL6
 ncMdM6inEQmGzdInXIg2hX1jfcZKdleYLJafcxub+s8BzIQj1g33PjEx4CIkZMFfSb/8
 B1JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699271969; x=1699876769;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CyM3rlEfZ9+NO+IGfBXHRBz3BT+cMJzydgbt6qMBtE4=;
 b=wr09FVZrRrNM0jovFNIXfTXOJeDnjKPj3K9eUp4rCqL22QvdyhCCbJeCmdh6tGXdRC
 Lzj7hbapmeckchumfj6RkFRfgDu7/u056Gj+NSYF8UL6x9XboPIDES8Gw+UxqVrC4RuH
 fEfdDTdBbqle5ecgD6cSWyUP4OfSQcC2COxNcarP2OWCltthfBjc18RCXFETUiCKdUMe
 v/JjLVxg1ynhC7yxeQWa6wi8FGKCfLn2lDQilFb3U+GS0bP20HC4Spos74sCooWYmJLm
 iIqLlXjVF9V0sibE92RRC19dkozvz+C53A/PMsqDRsFj9iSt2qcPiEIZ0s13IyR42vEf
 5pEQ==
X-Gm-Message-State: AOJu0Yw7K6BvlxCryU3nfwpXMBba1Qa6TGVVoDEYIDQuHlAe9hR9jQk5
 RwWW6aK7HsfU6aXL7W0XbUtkXA==
X-Received: by 2002:a5d:64e4:0:b0:32d:cb21:4e99 with SMTP id
 g4-20020a5d64e4000000b0032dcb214e99mr11566706wri.13.1699271969691; 
 Mon, 06 Nov 2023 03:59:29 -0800 (PST)
Received: from [192.168.69.115] (176-131-220-199.abo.bbox.fr.
 [176.131.220.199]) by smtp.gmail.com with ESMTPSA id
 f4-20020a5d6644000000b0032da49e18fasm9301932wrw.23.2023.11.06.03.59.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Nov 2023 03:59:29 -0800 (PST)
Message-ID: <4e080a94-214f-b8b2-6dcc-7b462b028310@linaro.org>
Date: Mon, 6 Nov 2023 12:59:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH] target/arm: Fix A64 LDRA immediate decode
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org
References: <20231106113445.1163063-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20231106113445.1163063-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.085,
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
X-TUID: 7i+qL2H0en4o

On 6/11/23 12:34, Peter Maydell wrote:
> In commit be23a049 in the conversion to decodetree we broke the
> decoding of the immediate value in the LDRA instruction.  This should
> be a 10 bit signed value that is scaled by 8, but in the conversion
> we incorrectly ended up scaling it only by 2.  Fix the scaling
> factor.
> 
> Cc: qemu-stable@nongnu.org
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1970
> Fixes: be23a049 ("target/arm: Convert load (pointer auth) insns to decodetree")
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/tcg/translate.h | 5 +++++
>   target/arm/tcg/a64.decode  | 2 +-
>   2 files changed, 6 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

