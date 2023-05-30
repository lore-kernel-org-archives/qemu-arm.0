Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2151115ejb;
        Tue, 30 May 2023 05:48:53 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4s7i9AbBIS9h/vRATWSlBgCuYVJmasIn+z2QNJKY3s2Iimj7hrcMlsD02v9Y/nb2hfMuny
X-Received: by 2002:a05:6214:b64:b0:61b:3557:a699 with SMTP id ey4-20020a0562140b6400b0061b3557a699mr2816541qvb.9.1685450933251;
        Tue, 30 May 2023 05:48:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685450933; cv=none;
        d=google.com; s=arc-20160816;
        b=nCpH3WLOkFmUy3Qb59aVuwbFLhBB2DoKWIRMYyNN6+gRx78w+6lWxIZ4l/n/30U94j
         Sm6LzcQRE+Ivb5BwT8I1IzNGyGCyvcsqN/DHEXClUkzV8rjl55iVu24sa38EPbJy8iKc
         q7vpCKq7NJFnlAIivvrSfzT5qlMChoJw+mBQMDQqOvlQVfsAPjIMk8CFCy1LRzZWoOK4
         b5DysVriKKwdNEIxkYT0HrkasSPcLNJTab/8j4BGDHW2dd6l2ndd7t296ocUU2jbjcy1
         EEfNOxzddA1OznrrB1qfEyEw8zyN5WiW3Gj1HKrajCnxhoh2p/9c3cX2wFu1jYFRYrTW
         x7/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=zuBh/LEWp4WSjpTEKKhURTRkk58x4xiP1SYwoZGx6M0=;
        b=b3hBDBoYCF/RE7jIzN8yeMYvkc+NNFXdugubkJ8hdwUKG2inW8V8HCpjEHTXfvcOoR
         V5BPWTsZW7/VRRDoVQzvqj1e0t6AnORs8Nb2onaytrcKsuVfzgFF0wd2s9i2HMikhk9b
         fT0n+VBP3MGLcWqHr/pFM4madxRqrwKS69R/wH602B760B5Z5M8g+bTUhmFZPpQFiFzh
         7ffF0YQvcWjvrrgipzQtMy64f0Z82F/JN92i3NbZdfCabVeStsRH6XYZ4PYEytfDN2wV
         LrQ5RvU2KiOwNqoMoZPvitWatwo5SRP64RsRsZauXdUzO6/7cqaKG0QqhILt0F1lnxzh
         k8HA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="ZC20/ifr";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 3-20020ad45ba3000000b006257782665csi6344937qvq.131.2023.05.30.05.48.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 May 2023 05:48:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="ZC20/ifr";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q3ymH-000579-M9; Tue, 30 May 2023 08:48:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q3ylx-0004rK-VO
 for qemu-arm@nongnu.org; Tue, 30 May 2023 08:48:23 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q3ylw-0006FH-3J
 for qemu-arm@nongnu.org; Tue, 30 May 2023 08:48:21 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3f606a80d34so30509175e9.0
 for <qemu-arm@nongnu.org>; Tue, 30 May 2023 05:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685450898; x=1688042898;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zuBh/LEWp4WSjpTEKKhURTRkk58x4xiP1SYwoZGx6M0=;
 b=ZC20/ifrCFm0f+GbQ3lFo1c/vxoqZgbumoj6/oJBd7aCXvqAvAvWeEtdeXDJ6BbBwW
 goOtrAsepJL+X6RDlDLqrGfFO95iCrqjQ8QSULR6XriaKOpIHkf32N633xtcoN5nQgrT
 9QXSELlYnBxvnSdHaW5mKID1h2VNW3P0nCOqSbEiCLzpeTh1+C9+PMsUrxi4yf1u2WFb
 qT12SsLU/vkN06Hf67GvCxiy8f+HLpHne3q9aR+M+zHfD5LjkJa28XcwS8nODG+wySEG
 ReT8LLLQ1zGit3Jk4rr/OhTdVLPwVcfSZRS8+146YPCGziZtliEu6TnsBrYqopL0PvF+
 98hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685450898; x=1688042898;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zuBh/LEWp4WSjpTEKKhURTRkk58x4xiP1SYwoZGx6M0=;
 b=S74oO23TC/GTnI5Hdrq+NPQjrORRx6zJC3PMFawIIp5d1bd8XoKv23zZ0qsmmoIBhm
 nmMBjwV7xMMhGalLmrM/gFQimpY/fwrRevvjjRZlVF9ULB525RLNWDC2/10pH4tT9Rsf
 kba1/XS2dto1W5kQGbzIZCGUzsmyQ0U1Bpz9m0GvZQJPNDRYMVbl8jNlgkbMS+B/DpL9
 T/An4Q68t73pebweaM9hlU313vbotsqTYLiiInV/XQa0t5+7DQwLmsUE6aijJzE9PuPr
 VAywiHxvNzQdZEMvRuQnm/Ffb0NuKxGj5yS1IfjdHVMZNidvRuEMdN9MgJcWBDgu/KDS
 EHJQ==
X-Gm-Message-State: AC+VfDxJZciRoiUPKwfuokGUpkC9Mr+Ovr0mKmgRxNBKsXnJ8+uc9O3H
 boX3E2tbqnoG99SGtrKwQ2tKgXVXwHCCk0SB3pQr8w==
X-Received: by 2002:a05:600c:22c4:b0:3f4:2897:4eb7 with SMTP id
 4-20020a05600c22c400b003f428974eb7mr1516944wmg.38.1685450898624; 
 Tue, 30 May 2023 05:48:18 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.180.1])
 by smtp.gmail.com with ESMTPSA id
 c3-20020a05600c0ac300b003f50e88ffc1sm21131077wmr.0.2023.05.30.05.48.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 May 2023 05:48:18 -0700 (PDT)
Message-ID: <401da06f-46a1-e485-dae5-d8a0a93a54e8@linaro.org>
Date: Tue, 30 May 2023 14:48:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH v2 03/20] target/arm: Introduce finalize_memop_{atom, pair}
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20230525232558.1758967-1-richard.henderson@linaro.org>
 <20230525232558.1758967-4-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230525232558.1758967-4-richard.henderson@linaro.org>
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
X-TUID: iLHKJyZCIimN

On 26/5/23 01:25, Richard Henderson wrote:
> Let finalize_memop_atom be the new basic function, with
> finalize_memop and finalize_memop_pair testing FEAT_LSE2
> to apply the appropriate atomicity.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/tcg/translate.h     | 39 +++++++++++++++++++++++++++++-----
>   target/arm/tcg/translate-a64.c |  2 ++
>   target/arm/tcg/translate.c     |  1 +
>   3 files changed, 37 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

