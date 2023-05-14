Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp5834329ejq;
        Sun, 14 May 2023 02:35:44 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7MvPK+N/AGuiTFc9KNWPaiHjJLUcjq4k2ckM3S6LArnWycaxf65YMQQOL5qnG24pPnDlBv
X-Received: by 2002:a05:6214:cc2:b0:5ed:ddf0:7c2d with SMTP id 2-20020a0562140cc200b005edddf07c2dmr57896719qvx.25.1684056944212;
        Sun, 14 May 2023 02:35:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684056944; cv=none;
        d=google.com; s=arc-20160816;
        b=hgEYvJawz9asYX0Ugejzsy4uuLpfVNj+H2UtV+fsPvW/7arELlTF3jBwKf8MUCxXe7
         HL+VHdkY53FP7LCGZirhdUX/NNVNOiLWc+LP4pcmu5W6AFyPppeD8T5wYMgV5HR/fvBB
         AK//I4UktehTytj42B/MycAZXDfRkYAHsXTBH+xyzELnwnQbfHmJ+PHGJXDNrgUFazDQ
         nYWkQeYwMEO3Y1VVys08efEnrGbZ+544OLpwYEpw04iGY3WFhU9Kx7qtKut9ecKjYTOM
         UCBPBfphKaso1mxM0oJP64e3CjG21G2qmM8HQVn3CrVpY74T8rIrCRRmydFof7mdOK4/
         azLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=iJIbMldCeSCNyVjITMQ5Y20/6S2f94OD/kf6/0hooI8=;
        b=zrZGv+pAZ+HM/elTitSX70x1ksZSXAAqBgYgwl3gKf8AkDK7CV06GyQzkauK2p89lO
         c4FD26ghO0c5rSUgE6NqBtflLbRbOVgMR/Aoudr6roYzva8bwpTCX5CTWGt9w4SHuC4G
         G76qk3qWhvj/B0aBQEx7RomRuKWf7Ed4dwbvXr5xqpFU5mL1FqplcUtA89uLFGsQfOf0
         An7DBFVQD53g5KVCBacEOveQlP3bjrcykNS2i3bSs/OPtMNx2YO2t6UDd+Iqy6QyCkwg
         7Ye5WNEYNr67SSC5jP4vBiLCPTNBk0dcYYNsu+YMJMwD4VdFo3RkxvnTJdxxg1rPdjRr
         nllQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=p6g2OGkW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pn5-20020a056214130500b0057104cd4825si8712117qvb.68.2023.05.14.02.35.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 14 May 2023 02:35:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=p6g2OGkW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1py88V-0007sG-PA; Sun, 14 May 2023 05:35:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1py88Q-0007rL-75
 for qemu-arm@nongnu.org; Sun, 14 May 2023 05:35:22 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1py88O-0005qf-CQ
 for qemu-arm@nongnu.org; Sun, 14 May 2023 05:35:21 -0400
Received: by mail-pg1-x52e.google.com with SMTP id
 41be03b00d2f7-52867360efcso8157819a12.2
 for <qemu-arm@nongnu.org>; Sun, 14 May 2023 02:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684056918; x=1686648918;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iJIbMldCeSCNyVjITMQ5Y20/6S2f94OD/kf6/0hooI8=;
 b=p6g2OGkWW5x3VfHGkC6hJ3SzWNH2jpSRL6vR4kA5NxTDzorggBpPphTvY4DHuB6lez
 lIMlzkYhdmXFmELmrdbK7dQEb8Ng0aRbA8uj4sQ4/Sloylp2iYEcUAOe0Tzs5TA/0ile
 kZDxH2Thvi52TRaWXBU1lXM/6F5/udlwKUHhfM2Kb1EZang6RoigHJSuMzuZxkwApnS2
 YUNSEecB/vO8vFlB5Bfy1Kl09vVBGLJyR8xvYivVMIMF1zUdCBffiARCkf78EL/2TCCz
 CECLL37X27JCXxIzTl9zWuvfZZiWP8Y6gRM/l9q0IUzziR/SLCLMVtIA8d7XzhemdBZA
 IE+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684056918; x=1686648918;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iJIbMldCeSCNyVjITMQ5Y20/6S2f94OD/kf6/0hooI8=;
 b=DlWmzXmB6kfUCJX7GW/NN/HdHGboemVcMDw4HndVLszHjoCa2Ab6EaKz6CLq1M4K7h
 3y4xZKqaJn1JBB0snCdwlQ3yA4f3oa4G7FdzXJ17sd192eznXXjUvJyx+KRL0z4O0OAT
 oITAmIpH5d3+H5VINjWnau0iOFBYlQ3iHp4/nEr02UocJGUU5VtQvXq6Wn2nYW7d/oog
 jzdFQ45PJuQkSD6ttA0TmG8Y3gDRnuLI6bRlNE3kpUy5kQXuc4FAorQVo6PlaLCHOjgB
 fvkAK002kB7HIX1SBKxUDFr2gGDXghxjr4agzHJ/KBV6i8q9GeXMLgH1YNC0ZmFDSbOS
 0utg==
X-Gm-Message-State: AC+VfDw5FT0vuTjjwk0b5ldukUCB+/tbQrB+8VxfnMX2PEUYWN3x/Cx8
 Bwo2gpd8DPiG8ph2vCEX5eKKNQ==
X-Received: by 2002:a17:90b:3a8e:b0:24e:2f9c:ee5e with SMTP id
 om14-20020a17090b3a8e00b0024e2f9cee5emr31713236pjb.42.1684056918176; 
 Sun, 14 May 2023 02:35:18 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:1836:b4ca:fe24:b474?
 ([2602:ae:1598:4c01:1836:b4ca:fe24:b474])
 by smtp.gmail.com with ESMTPSA id
 ie14-20020a17090b400e00b0024e1172c1d3sm22909580pjb.32.2023.05.14.02.35.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 May 2023 02:35:17 -0700 (PDT)
Message-ID: <21519446-9990-885a-ea08-597d13420d8c@linaro.org>
Date: Sun, 14 May 2023 02:35:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/2] target/arm: Saturate L2CTLR_EL1 core count field
 rather than overflowing
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230512170223.3801643-1-peter.maydell@linaro.org>
 <20230512170223.3801643-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230512170223.3801643-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.923,
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
X-TUID: aoFwuL0OLyX6

On 5/12/23 10:02, Peter Maydell wrote:
> The IMPDEF sysreg L2CTLR_EL1 found on the Cortex-A35, A53, A57, A72
> and which we (arguably dubiously) also provide in '-cpu max' has a
> 2 bit field for the number of processors in the cluster. On real
> hardware this must be sufficient because it can only be configured
> with up to 4 CPUs in the cluster. However on QEMU if the board code
> does not explicitly configure the code into clusters with the right
> CPU count we default to "give the value assuming that all CPUs in
> the system are in a single cluster", which might be too big to fit
> in the field.
> 
> Instead of just overflowing this 2-bit field, saturate to 3 (meaning
> "4 CPUs", so at least we don't overwrite other fields in the register.
> It's unlikely that any guest code really cares about the value in
> this field; at least, if it does it probably also wants the system
> to be more closely matching real hardware, i.e. not to have more
> than 4 CPUs.
> 
> This issue has been present since the L2CTLR was first added in
> commit 377a44ec8f2fac5b back in 2014. It was only noticed because
> Coverity complains (CID 1509227) that the shift might overflow 32 bits
> and inadvertently sign extend into the top half of the 64 bit value.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/cortex-regs.c | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
