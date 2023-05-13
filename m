Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp5275991ejq;
        Sat, 13 May 2023 00:18:55 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4n7ffc8FkHUuMsSovqsQjRTsELymzGLnGSZ/dL1O9hls5vxn79B7XLJbSL7lHeyic1ZyRj
X-Received: by 2002:a05:622a:347:b0:3d2:7f3b:c691 with SMTP id r7-20020a05622a034700b003d27f3bc691mr43524930qtw.47.1683962335561;
        Sat, 13 May 2023 00:18:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683962335; cv=none;
        d=google.com; s=arc-20160816;
        b=ehlOq0SmlHyZBmppZvPNVQaAVocWMFYQlnywSsCVzTcuASH9m9U2al/oDdeZnv+BGX
         jPdsZvtyJmmwUzfGnZzG8Ya+gZg5g22qmZW6nd2Ff1QAfnhXpopcc1MRQ5gmO5KB+4I/
         1C9NUJhPtYje2SYmqUdtXzjFxFDYdNN/Y1gCwfmL/dHUDyEoK70vUBTeJofaFbOG+R/o
         CsWqTcgiaUn2vKitIuLRLTxNFj95ZQKFrUMlGkZ1l7eEZC1X2+3ELYx0QphUR5QHH7V7
         /Df39RGlbPd9sP/5WuAkMZzRySJCN+LW8+iy2cnajNul86HtnERWxXbzy4wN2dHrxkW/
         GNNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=ra3qSJv6qTfa0rEeJxmtIqjVl28WXUOsLtDuxKLdqOI=;
        b=WSXv4xvyTHAfcU3uL+XltgJE5jbbjZLg7VRqeMP3+Vd62kJ1x/llj42oiGVxhTGPw2
         6CLRLSP7qHrF+eI3VBoBner9VjIuY1mK+vDb2OnPxjM2KpOaq7KgFUrLrEU+wYE01/m5
         pS0LouhF60k7cnU1dyJQM0QBbFxhQvGx3ZalNOPLSDODdUvq5wC4ct4fvTRTvkFxorhJ
         UNn6MwUZRHYCwCkPtyn6OMqwBJEdZlO29efN+Oq+X/KcMNt0XQfIxWj1ABatK8fkLvPt
         hJld21bwH4DtHh4VfBcs3Mc0vqloRVqknw3foNSUhKXmf8hfdyLWn6SO5E1I8+2GAQRu
         qklw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nRoTIGuW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h7-20020a05622a170700b003f203509588si6407858qtk.284.2023.05.13.00.18.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 13 May 2023 00:18:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nRoTIGuW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pxjWb-0005tN-3M; Sat, 13 May 2023 03:18:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pxjWa-0005t0-Ey
 for qemu-arm@nongnu.org; Sat, 13 May 2023 03:18:40 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pxjWY-0003vL-VU
 for qemu-arm@nongnu.org; Sat, 13 May 2023 03:18:40 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3f49bf0223cso39993185e9.1
 for <qemu-arm@nongnu.org>; Sat, 13 May 2023 00:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683962316; x=1686554316;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ra3qSJv6qTfa0rEeJxmtIqjVl28WXUOsLtDuxKLdqOI=;
 b=nRoTIGuWgifF7qzqscmFHCokIMADo3xWZUkZnbplA+28Wo94eUL29HLzMQRVIEM1fU
 Uz7PmC6mOfk4gRka0lHs9ZdzViB2utJM07b5ahrz/MIm3J6bccBmweunBBU6RpqWZs2Z
 At15pwLpgQWjkFUwuFLPiAtl07Uuu2IMaamAkA16XvDRE/99rD1ziTUi2we9kbAi28sz
 GGljjDqnVMcGaDf/guIeAo8EoNWBrETp60wvyI2iaSIo3Fk+GKWUUz9BubAHhwyAJHIM
 dMEGRcodvkugU9R6RGTKqf3gFi6ATDttSI1kaX9I7nD5b6/UzRTWx7xZso7pkcRQejF9
 YNDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683962316; x=1686554316;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ra3qSJv6qTfa0rEeJxmtIqjVl28WXUOsLtDuxKLdqOI=;
 b=HoHRXUgO0UjjlQhkTrjUhmL6LVmnv8RCqQR/tRoJbk7ovc4NUJ/zvjsQ1fT8EDV++A
 dIzbALL9uMQelH9MGMO+W9uO7Vum6kOuAPieInas+A07kleAiy2n89tGMutu+Sh6Q6nX
 eLG7M2ONDvXkV24HtfdA2nqwPo7uFHuHYAZ8mn//7sZYDEFCd7QH2zPLaPwXUz1TG4Hu
 g9YYaTCFpODHDvc0kDoNXMCXfuoP+0tg//ZQXe91XIBifwv9C0zZqtC13bD9WL7RG12T
 Q9FYKwLFkFm1F/hvL07TQNJW7F+8ynaNyVvm4HXrmgqO6/e/r636Bu5m92gB+pxmVtL6
 pUFQ==
X-Gm-Message-State: AC+VfDxHuMTY5/CP2AQDGRK3gb7XvRfmMoBi1nZikd0T+10xOVzNWar1
 k0bj8WAWqtpCa7At0Ju+Qc/4las1hAQjNHmCrTmfNw==
X-Received: by 2002:a7b:cc93:0:b0:3f4:2bb3:a5bb with SMTP id
 p19-20020a7bcc93000000b003f42bb3a5bbmr10181379wma.9.1683962316427; 
 Sat, 13 May 2023 00:18:36 -0700 (PDT)
Received: from [192.168.190.227] ([83.98.42.3])
 by smtp.gmail.com with ESMTPSA id
 21-20020a05600c029500b003f42d8dd7d1sm11582504wmk.7.2023.05.13.00.18.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 May 2023 00:18:36 -0700 (PDT)
Message-ID: <5c541caf-1641-9047-1a96-49cc87f2e2dc@linaro.org>
Date: Sat, 13 May 2023 08:18:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 12/20] target/arm: Convert Extract instructions to
 decodetree
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230512144106.3608981-1-peter.maydell@linaro.org>
 <20230512144106.3608981-13-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230512144106.3608981-13-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.845,
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
X-TUID: 98U+0WBZTV/R

On 5/12/23 15:40, Peter Maydell wrote:
> +# Extract
> +
> +&extract        rd rn rm imm sf
> +@extract_64     1 .. ...... 1 . rm:5 imm:6 rn:5 rd:5      &extract sf=1
> +@extract_32     0 .. ...... 0 . rm:5 0 imm:5 rn:5 rd:5    &extract sf=0
> +
> +EXTR            . 00 100111 . 0 ..... ...... ..... ..... @extract_64
> +EXTR            . 00 100111 . 0 ..... ...... ..... ..... @extract_32

When there's exactly one use of the @format, it might be clearer to just merge the two

EXTR     1 00 100111 1 0 rm:5 imm:6 rn:5 rd:5  &extract sf=1


Either way,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
