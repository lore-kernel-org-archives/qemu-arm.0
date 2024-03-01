Received: by 2002:a17:906:489:b0:a44:3ba0:e9d1 with SMTP id f9csp1326029eja;
        Fri, 1 Mar 2024 13:20:09 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUpss0XDlETwba1oRYVeR22MQnhnsyiOwnt3E0KujjUP8xeVK8QDZWiCHtOrElYivJMHNbl3uoEI+w1E7N3pMHdW4lMEmFd
X-Google-Smtp-Source: AGHT+IE+87Q6zbEOlDNAoYh5UwP1rmkm9yqnAhxfzY2dfi7u46yDR47B8QluWTEB5vnD26kH3oPw
X-Received: by 2002:a05:620a:3706:b0:785:635b:ac2b with SMTP id de6-20020a05620a370600b00785635bac2bmr3734037qkb.32.1709328008767;
        Fri, 01 Mar 2024 13:20:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709328008; cv=none;
        d=google.com; s=arc-20160816;
        b=RLrrH18GQpgwCCcoBAO6t2wZASQ3HNBX/7ZHf20lUPyg3aA6laKbxE24fGUfR7/Eh5
         LEgTq9bFXPjOBfM6Ys1MK0LizH0sYfs5J8Ukl9N5y6pSj7y0LxoMSPGBE1K00fYZ7o1p
         YdoavNE3axq+vYdzUWiBu7KofsHuIBmI4/7AZZUSodUDGzd50dlij5EQ4oBZSWgWpXdq
         1LibZeSP6Uw0MXvDMXb+Ygk/XcF4RghdwZZPRSehKRDTAtri9B9H45uLKEPvb2WT6n53
         lmwXYHqj/2F9ZZ2AxuNzzuIkTRGyKKdkKf7tuSWxvbt6UpzGotQn2iY3QwzkGW4mMQHS
         d9Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=bDwdHISmLSY4krXDpn1gbWdD12mP21WT+zg/WfUsNtc=;
        fh=u26cu6AWyXS55HzXw0SLlEu7K5SOkBH/tEiaviTrMnk=;
        b=vGdvjQ4m59Np67VIH1G4WeMgIDsYIrx+S2WLmpJ6n3JL7q6LakZDHRrnCjcZZ60bNh
         nRTSEH4/qUYn0+JNPsTZ+DnJupqVntRe85s402fhgZEvGAr6C9aTytDPPlx16n4k6isy
         iyyv3rQABYvBlGVD9qrSC3QzyhRkekUyedEMyrZ4F3xlbhuLqW6h74BwqTPymWmCIyKg
         uVU17gBpi4IT2K9upEYOp89fC4gRceheXR0lJdKJcdhKrg5tict8lR9sM0OQJErVA2e/
         LLT3eVfoPXYv1ZnDBUCxmejUUWvn2kzqH94kK61AqficZERPzvnIXLm9TvWNIzFQNf2M
         N5nQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gHdFzk9s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b10-20020a05620a0f8a00b00787d6989706si4302208qkn.98.2024.03.01.13.20.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Mar 2024 13:20:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gHdFzk9s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rgAI3-0001NG-Ph; Fri, 01 Mar 2024 16:19:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rgAI1-0001Mx-Qc
 for qemu-arm@nongnu.org; Fri, 01 Mar 2024 16:19:34 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rgAI0-0007KB-7d
 for qemu-arm@nongnu.org; Fri, 01 Mar 2024 16:19:33 -0500
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1dcd0431f00so19569645ad.3
 for <qemu-arm@nongnu.org>; Fri, 01 Mar 2024 13:19:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709327970; x=1709932770; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bDwdHISmLSY4krXDpn1gbWdD12mP21WT+zg/WfUsNtc=;
 b=gHdFzk9sIetff4NYjdh5mhkjOp3qqPtxSkraU61c97bUeU8wCoMFePWJuKB9+871bk
 yMIPsraSpoHW5UbOUQTMNJOaaGw6fYWXc/JcqlteQQkKD/ewr5TsJpnBkLUlD+ZFYlJk
 SyZbvFQT7kj6mGMZHvYWOLdoYHJKCK4kV8kg0oEWtVeO8CzP3eIMszOFo4l/vxhZEGw0
 DvBr5cWZDJ+57MZFLb7/geyr/DzRlnym5LigOWZ75AZ+iofUH9M0mrrKyMEvc2Eh2oPE
 RyWLHHIYneEp9KK5Iht/WWj31pDbul3xLGdNhNY6UaeQoKaNb9f1c+Q4alwbWkCXU6uy
 2qTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709327970; x=1709932770;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bDwdHISmLSY4krXDpn1gbWdD12mP21WT+zg/WfUsNtc=;
 b=Efgq21m5jU3wvwPUbwU5p/DkRLz9cH8WsK9oRyOYFoZUjBRFR7XQStNA2lhuq9IoEE
 oL+/cL46cZkAw8WXNMNCc/xG9dz8CsWdoHpOf8auIPYfuWKABWHgmVRQ8ly12ZIANyMF
 JS6exspGgFA7/LTLxdpgm8EvUOeH+E0xK05HDdbHMJ5ZKnIpR0gi7uF9Nk5rwZr2x/gy
 hNZ6I4roWnWHRKuWdhbNerRpzGuqoQ9kp/l5vFxolrpEtPJ6Q0fqsYtNyZEftXx8UiPD
 mP4NU7yE3H7fAgdYXIuDbpl6lFzdlgMfxME9JB1WS2bW2XLRr/zcJF5bfjYxrRiSGF0q
 kZXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCur7NHs9szduDdXJZ+5rMoPvrFDNE2RfbjT/+kZpljOy7UaWovxXUHCRla3bEaKfkyojkDe7zZfvfVmjPz/U34bPV
X-Gm-Message-State: AOJu0Yy62XCNCl+K3Xgy7UBwzB6Kp7Lg4EgAqgPFC+6xj5VOBrRaasdi
 dPgLMc/03B1YmeuVA++Xy2ee1VzDavPFaQM53IgQjZrqUuR/ddAwldqTuEexOM4=
X-Received: by 2002:a17:902:6544:b0:1dc:7890:72d6 with SMTP id
 d4-20020a170902654400b001dc789072d6mr2576785pln.22.1709327970621; 
 Fri, 01 Mar 2024 13:19:30 -0800 (PST)
Received: from [192.168.6.128] (098-147-055-211.res.spectrum.com.
 [98.147.55.211]) by smtp.gmail.com with ESMTPSA id
 r18-20020a170902c61200b001dca920ae40sm3898386plr.203.2024.03.01.13.19.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Mar 2024 13:19:30 -0800 (PST)
Message-ID: <f0dd2308-6a94-46b5-821f-12ab907d29ea@linaro.org>
Date: Fri, 1 Mar 2024 11:19:26 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] target/arm: use FIELD macro for CNTHCTL bit
 definitions
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20240301183219.2424889-1-peter.maydell@linaro.org>
 <20240301183219.2424889-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240301183219.2424889-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
X-TUID: EKJVq0Iri3Y5

On 3/1/24 08:32, Peter Maydell wrote:
> We prefer the FIELD macro over ad-hoc #defines for register bits;
> switch CNTHCTL to that style before we add any more bits.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/internals.h | 19 +++++++++++++++++--
>   target/arm/helper.c    |  9 ++++-----
>   2 files changed, 21 insertions(+), 7 deletions(-)
> 
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index c93acb270cc..6553e414934 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -224,8 +224,23 @@ FIELD(VTCR, SL2, 33, 1)
>   #define HSTR_TTEE (1 << 16)
>   #define HSTR_TJDBX (1 << 17)
>   
> -#define CNTHCTL_CNTVMASK      (1 << 18)
> -#define CNTHCTL_CNTPMASK      (1 << 19)
> +FIELD(CNTHCTL, EL0PCTEN, 0, 1)
> +FIELD(CNTHCTL, EL0VCTEN, 1, 1)
> +FIELD(CNTHCTL, EVNTEN, 2, 1)
> +FIELD(CNTHCTL, EVNTDIR, 3, 1)
...
> +FIELD(CNTHCTL, EL0VTEN, 8, 1)
> +FIELD(CNTHCTL, EL0PTEN, 9, 1)
> +FIELD(CNTHCTL, EL1PCTEN, 10, 1)
> +FIELD(CNTHCTL, EL1PTEN, 11, 1)

These bits change definition based on HCR_E2H, which I remembered when I got to patch 5, 
which adds code nearby the existing tests of these bits.

It might be confusing to only provide the E2H versions, without some extra suffix?


r~
