Received: by 2002:a17:906:b1d4:b0:98d:b2f5:1316 with SMTP id bv20csp744869ejb;
        Fri, 7 Jul 2023 13:34:28 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHs0k3R67SDfF8FArvj8eEemsABWRgoes3AHF7k7cL82ngqk/EMHeHua+vZIde3Nwrr/573
X-Received: by 2002:a05:622a:593:b0:3f8:3090:15c9 with SMTP id c19-20020a05622a059300b003f8309015c9mr6598024qtb.30.1688762068299;
        Fri, 07 Jul 2023 13:34:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688762068; cv=none;
        d=google.com; s=arc-20160816;
        b=r3SeYsCYEmq/gFFBa7OrO0ea7qSwKEHwBlUK7gI9R3pkvEwJcfhT2I8TCmLJZDxjgI
         EALDhXfxAf7kNCie4oP5M3CJVrho0F9VIMU1GPdUNj0iUjHDDTqlOWeGu79lx4T/01tm
         xlOKKkuIgfqFImpNvxpHGyEds67+5flx51oAR3c1sPjdi/+K7NGUqH0AaRg1sH4oweKw
         LMyCP06rr5Q3cVBYaiI37m93N5TbUn7BTc5MmLDNsdZxOC4xxi/G7Bgal81Sy+2g4G1S
         zOTwuvao5xe4JCkS6lm5QH6xj+YS+6aSMIeIyapcF0vAOOfQyWhiR9FE5/t2lxVh0q9b
         rOqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=A5h7AH8oqpzXuSee3k/wK6DkuJ4jydhcu2xiWPa1XAY=;
        fh=j8pwsiah+H3QGMu65HcARaW+qpQzvNSIWsTdXEYkYfs=;
        b=v1nSEEnzqA1AiNSM+RgWi787N8wCFGqL91lQ2jr3KVGDkWLkkfeyGp6qm+elQZnDUf
         IIctJ5uJuUxVpUlkx3Rpy9RDkB+lMKoZolXVx1h5Fvs3VbWJA5tqS7/rJ8hKvLCN4QPP
         J86utVt3jYjj2OcNEZTQEg4QBt4u4s6Qn/bOZ1/NkYDvhsdtHRpmGnlrdg//jE4SKhvO
         15u0M2BgDFLf7yQ4VnHSJ9i0JhsWFsnKtPb/nWhIclAyz4fpfFNh05FSoch2295Hogd+
         kWrQGeIpadP1tZ/Vo3IgY9A9T5Nq2dPjOCVp94Py4JollaDFt9bUkdMZpuZEkWsXC7TN
         FMLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nZC1GUvO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x6-20020a05622a000600b004039e75fe53si925127qtw.250.2023.07.07.13.34.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Jul 2023 13:34:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nZC1GUvO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qHs9o-0001Sd-SE; Fri, 07 Jul 2023 16:34:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qHs9m-0001Rz-Sv
 for qemu-arm@nongnu.org; Fri, 07 Jul 2023 16:34:22 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qHs9l-0003Zt-CS
 for qemu-arm@nongnu.org; Fri, 07 Jul 2023 16:34:22 -0400
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-991ef0b464cso664918166b.0
 for <qemu-arm@nongnu.org>; Fri, 07 Jul 2023 13:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688762060; x=1691354060;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=A5h7AH8oqpzXuSee3k/wK6DkuJ4jydhcu2xiWPa1XAY=;
 b=nZC1GUvOlYfLTg0wfSMjiWwwDC0KNPigCoiJNrc6tReuqQMobAOzz30JJDpbCDDWNs
 6WmmU5hPtnReXN96ixBnldV3xJLHRKDFu9cSmOaHwbFH2C48A6UnfGqoIPXk1wX9K2L8
 53nuTNrG8QVEpgbJ0MdX7CDKICL2sh0REe0nOC3WKm7qd6AWS0NUuITMfJ717DfdKu+I
 xG2pwgtea1MxHAc1yZgaxRhk+kkB5M9m6yqEOzDc+rljjtqwaFODjpmWZrfHMdB7J6qA
 t2aqhNRy8Dx8S3v+0QQUhb5qMH4q4ppYab4sDNWXliSZfSNv0RtBJKTjJhkjH2PP5jwo
 3b1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688762060; x=1691354060;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=A5h7AH8oqpzXuSee3k/wK6DkuJ4jydhcu2xiWPa1XAY=;
 b=gNkDX2KHi/ccMQ80G8D2148nOyBv5TJZyDTR6ub4WvFfemEV4+Ll/VDqXPwR/g0Rxs
 51h6b/JTjSXsVm4nVQp/TkUJceUTD4tcrnLMT4uovZo8D0mfaysgm4CrV6fzGBkhZMe2
 g+ltfxkWeNwqtmBWiUbAcijkLmNhMgyfeYXO4tRGjIZuIF9Y46VrcEZSemQ6A/D7td/n
 GS+ssU8z/6QMmqz3GSpmNBXwhpRsBP/04yiN3l/gQXVJDnMKSapwiVWYqJSSUoK0Ygpv
 PMzsri+K7zRcvf7MaLF3NrrpJ8vLPXWnKt3T1w62R+F79/6e27VCo5XbphPhVnQjNc6N
 Ronw==
X-Gm-Message-State: ABy/qLYlV0IohXc5e0KubdaVedGbnuB3q67Y1j/pWxsCIxNFsrKouXPY
 EIA8jsIVpRy19YNz/qLO7HpZdw==
X-Received: by 2002:a17:907:3d9e:b0:985:259f:6f50 with SMTP id
 he30-20020a1709073d9e00b00985259f6f50mr9653323ejc.34.1688762059736; 
 Fri, 07 Jul 2023 13:34:19 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.184.32])
 by smtp.gmail.com with ESMTPSA id
 x9-20020a170906148900b009786c8249d6sm2608467ejc.175.2023.07.07.13.34.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jul 2023 13:34:19 -0700 (PDT)
Message-ID: <ca0fc5a7-9dfd-210f-05b8-c4b0b1e6edad@linaro.org>
Date: Fri, 7 Jul 2023 22:34:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v4 23/37] target/i386: Use aesdec_ISB_ISR_IMC_AK
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com,
 eduardo@habkost.net, alistair.francis@wdc.com, danielhb413@gmail.com
References: <20230703100520.68224-1-richard.henderson@linaro.org>
 <20230703100520.68224-24-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230703100520.68224-24-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
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
X-TUID: pjq3EFXw2tpP

On 3/7/23 12:05, Richard Henderson wrote:
> This implements the AESDEC instruction.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/i386/ops_sse.h | 14 +++++---------
>   1 file changed, 5 insertions(+), 9 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

