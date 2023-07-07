Received: by 2002:a17:906:b1d4:b0:98d:b2f5:1316 with SMTP id bv20csp723738ejb;
        Fri, 7 Jul 2023 12:49:16 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFmB/Qd64xX2IAQGhKMT9rv2dX1o5t20C7/XvnJhy0r3t663fjhy6b42LiEfjnyMDRiFkx0
X-Received: by 2002:a37:f91e:0:b0:765:6994:3fa1 with SMTP id l30-20020a37f91e000000b0076569943fa1mr5437349qkj.43.1688759356417;
        Fri, 07 Jul 2023 12:49:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688759356; cv=none;
        d=google.com; s=arc-20160816;
        b=lRmuXTo6I26PmDassSeSRDcQ36RPAFErYjWdgpgA+71BXi+LUcKExWsbY1riADklBT
         fG1S3ALVdSGMfp/82QRuSmTGfPNpLbGQpAZR1/n8zswQDmEr5spQUqgxKiXTbHoeXKed
         5ynB7BzXTUwrbI+77vabizG1gjl/khZrJVA+/mlejrKslpTKja46086cYFh7vYdPqaiu
         x/DMIeFJ0kmLJSQXAS1En9RjR5Aw+36eKrhopnml1jv+4PGXSnzmFQvtt2o+4rhBPrQw
         w5hCpGkNp7xpZAUi1BKqc6AaZgdK6juiutFY0uSfsnS82/u4l5mv0q51svcXOYQXIF6m
         NJng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=JjarKcvNq6+XRYOE3rQGMFJp4Yz9FBXqTtaJLLCcfmI=;
        fh=j8pwsiah+H3QGMu65HcARaW+qpQzvNSIWsTdXEYkYfs=;
        b=qqWRWQJSrH3xzPefBAuJzz1mV6p/E87giFx8m4qKGo+Bqm+0GGz+31NhSAnUI1Msri
         e4JiuruTIs2JssXPqfKm+07BzHlWdgnXNDWWZdeJ1w4dh6VRkI/0Ryj4PF+bAln4hiUe
         FoWWZRGyuXF9fSxrYA74VwZAPa5A60tRve9/7tQpE+hrTm2Q2pX6dVf7PhbjDEt2ANZh
         4v3YVfPdTrBbomHrRayuJAPM0rt0asKc3yPjoOkgJAIqyPuGWMUlI8RYwTO6zAL7f5RI
         PyNbQ6oznZcsIjoV56bO6DWMRV+s61numde9la0yflIyMqozS15JG+kV1tKqTD8SCDdc
         qhww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iS1xE30R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x3-20020a05620a01e300b007620a2f6f07si3107801qkn.474.2023.07.07.12.49.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Jul 2023 12:49:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iS1xE30R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qHrRV-0000CF-2J; Fri, 07 Jul 2023 15:48:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qHrRU-0000Bl-An
 for qemu-arm@nongnu.org; Fri, 07 Jul 2023 15:48:36 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qHrRS-0005GU-Rw
 for qemu-arm@nongnu.org; Fri, 07 Jul 2023 15:48:36 -0400
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-99342a599e9so285908266b.3
 for <qemu-arm@nongnu.org>; Fri, 07 Jul 2023 12:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688759313; x=1691351313;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JjarKcvNq6+XRYOE3rQGMFJp4Yz9FBXqTtaJLLCcfmI=;
 b=iS1xE30RYZrePxrSzYot25+WXX9WgODqsO6p5a1m8VuTGyq9QIpOZW2aP1Pankskw9
 Zm+4dubtKCcbvq9iM1v5gtFEgd9uz6xcY7/2pZ1rKEiNwTTx+DHlFies8ZpJJ0m4P+N+
 fteAyajhgcNq6RRdNIBeIjBQXaV4JCc8L4eAQemunwBSpH0NCKVg7dqXltnSw45jBQIo
 as2gFfnel+HL2K+aNSHCqzIKsGW6ef+fUC5JaU5/S/4RrcNN/aP0gEIaA2WZfTCTvgtA
 A7Op5QRUX7IoMi0+bT0/UCWLbk5NSI3t3XNTZRvCy3Rt74IRo/uRSG0mE1hLarcQWRfM
 fQiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688759313; x=1691351313;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JjarKcvNq6+XRYOE3rQGMFJp4Yz9FBXqTtaJLLCcfmI=;
 b=h6Lyb0lSTgQKXK9HQJ/w41Lgi2mnEh3mNXuwlHPjkfn+3OeSFhQcVRi6m4zJh1r1Ip
 /tnNHZJF1orYxoAMSKTEcfWVp0yIVdYj/lVLkWy8XCUk7mU2p/dNGqDEy2Oe6xrEzzaN
 lvny8fTbxcHwpZ7MemnPJ3nn63PkQ6dHh8fXC9qKv5CuLOjzIwED5XG9QtSPldzxjPmp
 ggAIeCJ0hCmRWj1Fizn1bVOlOr8fIcQaNSZIYCEG7RbjETJxE06RGM2Ki2UNUnPD0Z4P
 SyHPiNbHiZHXtW2Y8uwfD85QNv9e5g1t1ym4YQpYCWZDD0AbjRBFB7MLBbWBs0UObo+R
 N0Yw==
X-Gm-Message-State: ABy/qLZ+Ty+iV/Tt6nRVAwr6qGuRIUw/xO4ha7jwOwZjAQvpUXfdL1Yd
 CyKQTTyUP+xXxet17wIV+IQUOQ==
X-Received: by 2002:a17:906:535b:b0:993:da87:1c7f with SMTP id
 j27-20020a170906535b00b00993da871c7fmr1072173ejo.7.1688759312956; 
 Fri, 07 Jul 2023 12:48:32 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.215.192])
 by smtp.gmail.com with ESMTPSA id
 i12-20020a1709063c4c00b00982a92a849asm2546017ejg.91.2023.07.07.12.48.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jul 2023 12:48:32 -0700 (PDT)
Message-ID: <942e89c1-2636-d65c-733a-35040cd07f1e@linaro.org>
Date: Fri, 7 Jul 2023 21:48:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v4 21/37] target/i386: Use aesdec_IMC
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com,
 eduardo@habkost.net, alistair.francis@wdc.com, danielhb413@gmail.com
References: <20230703100520.68224-1-richard.henderson@linaro.org>
 <20230703100520.68224-22-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230703100520.68224-22-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62c.google.com
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
X-TUID: DYEQr+dc64Nn

On 3/7/23 12:05, Richard Henderson wrote:
> This implements the AESIMC instruction.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/i386/ops_sse.h | 11 +++--------
>   1 file changed, 3 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

