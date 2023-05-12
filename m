Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp4904425ejq;
        Fri, 12 May 2023 09:12:24 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ63JPKjrN0VrkKc6vKTQ4UrE5YeYsRp+mOolrdU7cg5kGFq9F9ARPt0viGNnpaAWt3OXtdI
X-Received: by 2002:a05:6214:1305:b0:61b:7884:4351 with SMTP id pn5-20020a056214130500b0061b78844351mr46646765qvb.32.1683907943808;
        Fri, 12 May 2023 09:12:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683907943; cv=none;
        d=google.com; s=arc-20160816;
        b=gR8EZCleRLFGGrjirWi1N+RghdCcafrkAJeR/Y4gmCGlADrty6NZVjdPDYfDuR/w49
         sqDfFljFTm+JVeqyfuKqp6GvoKEwyEZQZpLxZET942qIyWXsLGVuQp+/ZbatzjdHmegP
         6HHjrZ22oIDprfj4GpxoxNZqCHdhPU26JQHMHV8hmZkjXpgI1j8aix+eleu+leB/dK2W
         tH+nTI3aq7XQoTm9S/q4nuI4WfJolgPkPn5bdQauugaTmR96sdsc6rjRFaN4yoD4xu/g
         nsYA/tMiROkM+5cKm7ySX38TQ+3UR2aIL9iRQwDiMNhHDtHI/YFS0DfYM/sPjSuUKc2x
         pAKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:organization:from:references:cc:to:content-language
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=LmMqtvpuVvsWNXvq79fqeCWxYOr+Z5E/6xkLNQol2P8=;
        b=huPjH2VmOFxUstqW5S4IGp3Kyya6SgaVtErM6aAQhGVzhYc5ha++lzlGAk+ZYAsZ5+
         Wy0q8QwNyiwnKDTulUPpUtzxCq1NBHDSkVBW+w65M8778+UrAYdrybZC8Bg/ZUg25dMO
         qzvQ0aRcQb5y/m8zYWVzyFQaHpDHGzbo9vWYhR82k/RghSi8Yc6UDFG/9H1SNz9AuQ2A
         v4H3By0c0ezKKFBHbPKE2qk6gSn5tfofzjguTvtu36u8WiWqBVcOXJHd9ArBzVpkIq4d
         5ORnJto30j5CRFyrT11fP2uVgwcFEehYsM/5kPLjy2roY2D4yaBW5QGuylltgdqzqVdt
         YbBA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gbXNPyOe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bp41-20020a05622a1ba900b003ee0c2ffd41si2775859qtb.568.2023.05.12.09.12.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 May 2023 09:12:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gbXNPyOe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pxVN5-0004T4-2k; Fri, 12 May 2023 12:11:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1pxVN3-0004SZ-J5
 for qemu-arm@nongnu.org; Fri, 12 May 2023 12:11:53 -0400
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1pxVN2-0004HQ-1B
 for qemu-arm@nongnu.org; Fri, 12 May 2023 12:11:53 -0400
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2ac733b813fso108762911fa.1
 for <qemu-arm@nongnu.org>; Fri, 12 May 2023 09:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683907909; x=1686499909;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=LmMqtvpuVvsWNXvq79fqeCWxYOr+Z5E/6xkLNQol2P8=;
 b=gbXNPyOez+mFTXdml0PY5UHLzaqNPOC4xiwuN9w3yGprfBsIVmUwVNFuegHnTLwRs8
 rfxtrmR2VAi+sMO6vVlh5OPTs4TSD1Z4tw2SuH5UoMB/v3rgFFPQYSsNx8BVS71+bRzQ
 640OcuYqzQzL8lq7PzJWqoDYs6H9eIPB39bAOPoay6W0blupmNiJPrweYVgYfLzXTAZI
 mJcAcP/0/JRaGeEPQxFxa/MBNStVVQHVdRtlgoSZFPh8+QJpWlyCoFIGmdnUIckK83ub
 ANnqvEkAKIlIYN0opcMWE2ozvMt0S5HVol8+VSUrAjioDphN88qzO7BKWXRJ1CuBjqnU
 5wPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683907909; x=1686499909;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LmMqtvpuVvsWNXvq79fqeCWxYOr+Z5E/6xkLNQol2P8=;
 b=PJgYIy66KtdCDBJ3aSXtOwxZhvlE3Mvswh6sp0VulqzdMETgjXfyi2MLyDR09vTnHg
 A/SpHdzv+If2+b3NiKlqywsJyE/BC5A+pY3OMU3pcsPmgcztEx2BeR3TEAz9ny5ESoGr
 L4wRHSP23qptGEwWJqao7ZPwV04+4pFLTt5vjtM21+LLUMtwGjZ6zLMvglyprHmGuAzn
 DfF9wQcfkOueGeA5ZDraT97yQdVcXV6238ao1GNg2FlzTv+fLCeT2GQUnd7qm7/jCrHl
 q6G8/7zn/7VmwiCC0Y0IjwHtMN2BduxARZ+GgSj7drSmPgjS5PDWlInR9imaCuJGSCIu
 DbOQ==
X-Gm-Message-State: AC+VfDzY1f4OIaEDdZUFcTQj+hq6Bvo0jRhpJ0xcRIvbN9Ow6gPdAZyt
 IG1grWu0/WfrIaxmrZUdiSNkrWC7XGiAwc8JQPDkHw==
X-Received: by 2002:a2e:9bd7:0:b0:2a8:ea1e:bde9 with SMTP id
 w23-20020a2e9bd7000000b002a8ea1ebde9mr4819461ljj.45.1683907909725; 
 Fri, 12 May 2023 09:11:49 -0700 (PDT)
Received: from [192.168.200.206] (83.11.34.59.ipv4.supernova.orange.pl.
 [83.11.34.59]) by smtp.gmail.com with ESMTPSA id
 i1-20020a056512006100b004f148aa91f9sm1526337lfo.286.2023.05.12.09.11.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 May 2023 09:11:49 -0700 (PDT)
Message-ID: <b85b70da-f5d6-c067-cb26-3af7d1ac1862@linaro.org>
Date: Fri, 12 May 2023 18:11:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] sbsa-ref: switch default cpu core to Neoverse-N1
Content-Language: pl-PL, en-GB, en-HK
To: Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20230506183417.1360427-1-marcin.juszkiewicz@linaro.org>
 <CAFEAcA-d2_3xXMNwMG+-WOw=y=zandSM24-GfcJ8s=3etqACcQ@mail.gmail.com>
 <88e30a90-71c3-0ded-8412-0f3af6ec3b37@quicinc.com>
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
In-Reply-To: <88e30a90-71c3-0ded-8412-0f3af6ec3b37@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::232;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=mail-lj1-x232.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.845,
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
X-TUID: HzAuj+qGPjmz

W dniu 12.05.2023 o 18:02, Leif Lindholm pisze:
> Longer-term, I still want to move to "max" as the default, but that is 
> likely to require some invasive changes to TF-A, and this is already a 
> huge improvement.

Firmware was main reason why I not moved to "max". It is easier to keep 
system running when it models already existing core.

For me "max" stopped booting when FEAT_FGT landed in QEMU. Took over 3 
months to enable it in TF-A.
