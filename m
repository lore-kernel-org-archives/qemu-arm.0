Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp3524925njb;
        Tue, 10 Dec 2024 10:11:57 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXDIX1uOhS/B1g2cTprTvMeMwByK2l+68527Z8iZmz36501YmfeDGoT3v6kaPGudtB9OprSY3j8IWweKA==@linaro.org
X-Google-Smtp-Source: AGHT+IFPMAwDaaGGQzOOMkCjvHQ8Bw40GjdiauU52gZRalwzQPd44+ShYtqV0qfAi3T03utdzYyk
X-Received: by 2002:a05:620a:40cb:b0:7a9:c24e:4df8 with SMTP id af79cd13be357-7b6eb50f7efmr13195385a.44.1733854316831;
        Tue, 10 Dec 2024 10:11:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733854316; cv=none;
        d=google.com; s=arc-20240605;
        b=Yztu8jv2jR7X0I0NIqVF2cuQBCaNBCDSNWPRdaJgO7M/ge/L+ULlu8JSRUMfNthl02
         UcI8wZmFndQPg1PQRwO/PoR+MpTVmrinbw/HV2pLkQ5bsanK4mRsUzuoCo4Fasm87xAw
         /N7rD02/zQ0KGLWyf5ui4FY+ZqbdNs902TLu2pn2Au9fNXGMVw1mFnBzLeDtggZcQLzQ
         hiTqg7VvV0x4XAzLgFPABp9e8tUyjWryO2Cr2RlelITzcuuwIHpZceo3fVJh1H8Dsgi7
         2xyT2uJQEsTocUvzmEUVR+De2+C+P4BJhqYi0DJxm3O8OalKcRZh5ljn2+Ajqoq6NJx0
         Ug0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=xNCAZCmzTIS1DDd1dp6cPLo6uaK+hWhPDAepblsyRtM=;
        fh=FF7ClvR7Hm0uRHKb8gCYaMAIwUEN2uBg+Xn94txoLfg=;
        b=ho83EitpvEaj8tcuNWBv6FZ7HlS/xS+55wX9JyqUanA35AnZ5AxH8kp3z29zYZ0USK
         F5K4Oegj6SQHCTFXljmSG4Al0zDR9QeDditF7CD+w0SSEACPPNXFaOiP1Pi4N6fYY20o
         PsjlcffTPg6DD2IQpufME4K3yKJR++ApkU87RGZglCWRa43w7QgDJNmvbxRW1m8Pxoh1
         RDeDT0sqPzVH15u4uhBd2Xs/5wffgu2jYof1uPDN1lxWWngGoAq0AgtyIR9PQZuJIVGi
         VwO+aXtEaIDWhRVP+IQg2VaEMvtXDOsOVsYI3FhpXfhBXmaZK10PscYzj9kAWybqs4j5
         Sprg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zu3UjfbM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6eafeadccsi19761985a.421.2024.12.10.10.11.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2024 10:11:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zu3UjfbM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tL4hq-0005oC-6g; Tue, 10 Dec 2024 13:11:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tL4hl-0005ni-Ly
 for qemu-arm@nongnu.org; Tue, 10 Dec 2024 13:11:30 -0500
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tL4hj-0002fX-2k
 for qemu-arm@nongnu.org; Tue, 10 Dec 2024 13:11:28 -0500
Received: by mail-oi1-x22e.google.com with SMTP id
 5614622812f47-3eb7934a948so256101b6e.2
 for <qemu-arm@nongnu.org>; Tue, 10 Dec 2024 10:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733854284; x=1734459084; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=xNCAZCmzTIS1DDd1dp6cPLo6uaK+hWhPDAepblsyRtM=;
 b=zu3UjfbM3wIqN/y9dAR9xO6eKiO82Q01YnHzGLhWKNDuOscZXN6DCKNejyDS7fEGrk
 TAMx73veKgYvXkmp5QarVjRW+S+DbaqYIJ7LumxAgfxzu3zi34d9UZxWsszGAyIczyt4
 dZh2q0vZYFEVLbtIKCrkn0uDzyzNQo161UUQdrtrZ0Ebp5F/FLXgps6CfBCaF7ZjYh1o
 kNPyOLxYB7KYh1cGwFaaKumGwTgkKP+2dkNNQE27god32RFoB6EFExg3vbxc5JsbhXNo
 RVPXIJl6bILUZ8WdDIkB2apEZbMQ4BkrFUZfKUk414vXVPURphzldm0kVbxH7szBZwl6
 wniQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733854284; x=1734459084;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xNCAZCmzTIS1DDd1dp6cPLo6uaK+hWhPDAepblsyRtM=;
 b=iIcaSfPI6m/fCNA4Lanm34UWBiSheEjQGCZKEtZ2yUUANyhaMIqLcrbzFFkQgvBq52
 Bjk/8crH9iezbRGsd6Epn2eYl9kKisRTHhDCVXA1vBkThgJaW0oBiVSAJs0ilAYEpGf2
 62LIfpGPUiqIPe6TUqIdoOTFRLark7vE1yzM+efmV/1gFhmy3gL5f9XCP2N+0a0J6pPn
 +ANTxFVTEp99oL22+E+1Usyuzc3hnaPS1qT3/jiviOCI8gT6o7viJlTap5Xn08gw9YsL
 +57x1cw3ZJEjU2En9nzK4TdSyWzf3GfK6l41ahnQ1DHDFQJjQdyd7TrnBRbmjB+pFIU+
 ZEpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvmdDu2He1YHBjx55PQJpfKV6jEiyyqM3NLxI391C+9BGu2uYX0FYyddUyIMCoQ+joghG2GekiZg==@nongnu.org
X-Gm-Message-State: AOJu0YytkmzUNfLeUt3MrsiD4ynsSwuQ8mrcT9S66TxLuJ4h4beiLe4e
 PIidNiK4WFgzsFt5ndLyA9EnwbRntYDvUbvaA8mWfg0xKopySZ3Jp9a4Gwr5PEg=
X-Gm-Gg: ASbGncsByZwponiNAD2pkUw4s2vE6zwLpzMVCOTj3DLKirWJ2WA0iA1OjdluCOqonat
 XToH9hakv6oIiREfWcTWmbxQaPlo9oQRip9uaqeilqajZzq/MPYGq+bmQ41YeCy8Q1j0NEvudTg
 YtqjG6re2nbNTGAqmWHb9KumXkhDhk4uu6+ktPV0szaN16ru2v0UBZUOQeKJdPJKIcjZ6YraGB1
 ZKkvjU7w7C8uCQIGhLhwcV03IsgHC8yDUC078OMkR5I13D2XM7/ldfoZO0+CjnqDu7P3s8=
X-Received: by 2002:a05:6808:1919:b0:3eb:66a1:9dab with SMTP id
 5614622812f47-3eb66a1a7a4mr4121263b6e.10.1733854283145; 
 Tue, 10 Dec 2024 10:11:23 -0800 (PST)
Received: from [172.20.4.119] ([187.217.227.247])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-3eb6dc15475sm500104b6e.39.2024.12.10.10.11.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Dec 2024 10:11:22 -0800 (PST)
Message-ID: <bdbf12a9-0e34-4924-88a5-80b2f7eb1961@linaro.org>
Date: Tue, 10 Dec 2024 12:11:19 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/10] target/arm: Move TLBI insns for AArch32 EL2 to
 tlbi_insn_helper.c
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20241210160452.2427965-1-peter.maydell@linaro.org>
 <20241210160452.2427965-3-peter.maydell@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241210160452.2427965-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 8LHKMhmvUO/Q

On 12/10/24 10:04, Peter Maydell wrote:
> Move the AArch32 TLBI insns for AArch32 EL2 to tlbi_insn_helper.c.
> To keep this as an obviously pure code-movement, we retain the
> same condition for registering tlbi_el2_cp_reginfo that we use for
> el2_cp_reginfo. We'll be able to simplify this condition later,
> since the need to define the reginfo for EL3-without-EL2 doesn't
> apply for the TLBI ops specifically.
> 
> This move brings all the uses of tlbimva_hyp_write() and
> tlbimva_hyp_is_write() back into a single file, so we can move those
> also, and make them file-local again.
> 
> The helper alle1_tlbmask() is an exception to the pattern that we
> only need to make these functions global temporarily, because once
> this refactoring is complete it will be called by both code in
> helper.c (vttbr_write()) and by code in tlb-insns.c.  We therefore
> put its prototype in a permanent home in internals.h.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/cpregs.h        |  4 --
>   target/arm/internals.h     |  6 +++
>   target/arm/helper.c        | 74 +--------------------------------
>   target/arm/tcg/tlb-insns.c | 85 ++++++++++++++++++++++++++++++++++++++

Subject has an out-of-date filename.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
