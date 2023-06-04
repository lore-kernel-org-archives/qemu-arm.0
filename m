Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp2046235ejb;
        Sat, 3 Jun 2023 18:37:22 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6tVjqXRA2D9IbR5AO7kzfxMWUAo7118V6MHzepZ7mnXHxI1bKzUkX0QdubnlsuCwyzLMy2
X-Received: by 2002:a05:6214:528e:b0:621:231d:8a37 with SMTP id kj14-20020a056214528e00b00621231d8a37mr3186443qvb.15.1685842642734;
        Sat, 03 Jun 2023 18:37:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685842642; cv=none;
        d=google.com; s=arc-20160816;
        b=paaZYLDZPpdhPCVJPPVM+1ptkHQzB85PBc2X12pQ/MxucHShoi4048vxWnTmWMYurY
         OM4+yQCABk6pVHpt6l0lCyd6l0wGNsj3VR4E+/tLNOE0SL6C4E3Rju5s9BpWgc2kTnVp
         mnY7kC/8499tmER0iC2e4trKlVgF+EQFrWkCCTm++d56q42ZrpqikQCFY4C8h6r1McTl
         WEM/ae1bPEXV9AnjOhFZYrc4PrJ3KSHzEIDOwO19JzVUJsj5qyxFXswNJ9wXkiYXtbQK
         gOYjTFMAbO6F7rg9Wv6TApUsbf4RAYTtEaq2WmsA2chYuBovOUu0iePI4E0gcrAc9bjZ
         5t2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=DQyhYJE5iFDJ/EkCg9l8WzQ21731dpMSG1R6NtCPeM4=;
        b=KSZHHnTkWEGh2oKxsSVw/+sJPT2XKoFH+topzGE7d/wc+9ZTjQMi1Fp/FipPpc5lJ5
         28XTfCiQDt0THMhfxhHKOvqyN55sS/KMrKIpbiTfWsIYaoxsfCNfa1wfNMDtLeJl7Nbo
         SLyKn0blklSc8PruSqCwsmJxU6Wai2/+9PcGsBeZyrPoLrkZgxLLGF3AAntef0LubIhH
         9AAmOGegCfh0mlybIx7MW0g9bF0DMX7yVXpPSt+41dm7mSk4ASLjMVdlSDCQoh2AgIOi
         t6iBGLo0b7m5gs+hohzEpkjr/qJ6TdkxGL7MIEUVmUHR8Tm+fofiB0MikoGc9ojMNi45
         3bWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=p4gZ4iEB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c12-20020ac85a8c000000b003f2207cedcfsi3029577qtc.428.2023.06.03.18.37.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 03 Jun 2023 18:37:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=p4gZ4iEB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q5cfy-0007rf-7p; Sat, 03 Jun 2023 21:36:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5cfw-0007qw-6Q
 for qemu-arm@nongnu.org; Sat, 03 Jun 2023 21:36:56 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5cfu-0001ze-J2
 for qemu-arm@nongnu.org; Sat, 03 Jun 2023 21:36:55 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1b04706c85fso33476315ad.0
 for <qemu-arm@nongnu.org>; Sat, 03 Jun 2023 18:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685842613; x=1688434613;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DQyhYJE5iFDJ/EkCg9l8WzQ21731dpMSG1R6NtCPeM4=;
 b=p4gZ4iEBN8yqMlMjZayYOFINHp3G4ABTIdt5j0O3RfN14cIGKdjOotsJh4juIx8hm+
 Ys6LU69S0mzyGLFCXMEvZ6bn00EO/FMa895aiP+Oz+clJxWiK07wzgBlouYle4CDchhY
 tcRL+h1hNDi0VjLoV8MmfzmEPWBzFWjN2CAUjUktiHhF0TaatO0gMprDa6hHSS6KWOHw
 mQ5LYTK6RuF+q58Y/7dthirmv40JQZ9J+o57t6/XS0Y4lvJa68baC9YO2a4G2xNR90w8
 JE4iSbARCa6CQ7v5Een2OlkXPlOIZH1EUkA72Zu5itaarTV38iiYIcAjUbRyN2os3uC2
 +Wbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685842613; x=1688434613;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DQyhYJE5iFDJ/EkCg9l8WzQ21731dpMSG1R6NtCPeM4=;
 b=bKoLZU3QFNFc2XLoPU/igUw9SSO/j8fnROqxcAqBRyIbqhJG576g+4IW/pOHD9isw2
 jQRkNBQLcFyzZYtcs2Qq14MEoUyP8ZB8Cpi5t4kP6psln0oJieuWQfBXSF0zTFI5mWqu
 ZMR+U/+SKLZS+eQcEbqbF+sPJQWoGB9Bh5p0vk7TyXYEUzMlflD8YMKE8lyXzGstTAxt
 gLJHTx2UeYTe/rIqT/wyBskUoq/rgEpCRmbk8x4j0RVWrevNTfdVqdUylKIbwCNnL8I4
 IjcJAUVXqEO7rz1m7Pu+KKBURJHNDYhb0ychqmebmpH708LIXz5TCQqA97UVFh5lOC1j
 J1jQ==
X-Gm-Message-State: AC+VfDwammo0DZHFv1KIFZ8fXgLZAEglx4KaCqvrRNhhqFgLf30M3s0l
 OK3+N4Yu46kFXPook2ZeEkhdkg==
X-Received: by 2002:a17:902:c410:b0:1ac:a6b0:1c87 with SMTP id
 k16-20020a170902c41000b001aca6b01c87mr6143350plk.48.1685842612964; 
 Sat, 03 Jun 2023 18:36:52 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:9a37:84b6:b3f0:f301?
 ([2602:ae:1598:4c01:9a37:84b6:b3f0:f301])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a170902d50f00b001ab25a19cfbsm3798619plg.139.2023.06.03.18.36.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 03 Jun 2023 18:36:52 -0700 (PDT)
Message-ID: <c29e0708-b137-e23f-f510-676411dc3514@linaro.org>
Date: Sat, 3 Jun 2023 18:36:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 20/20] target/arm: Convert load/store tags insns to
 decodetree
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230602155223.2040685-1-peter.maydell@linaro.org>
 <20230602155223.2040685-21-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230602155223.2040685-21-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
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
X-TUID: JQi1/ofEDv27

On 6/2/23 08:52, Peter Maydell wrote:
> Convert the instructions in the load/store memory tags instruction
> group to decodetree.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/tcg/a64.decode      |  25 +++
>   target/arm/tcg/translate-a64.c | 352 ++++++++++++++++-----------------
>   2 files changed, 195 insertions(+), 182 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
