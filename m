Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp3503150lfh;
        Tue, 31 May 2022 07:37:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyTG5DCqu6qvUha7lGKwuHP2O6X5Tk00tQ4QL6F9PQvtZGlGxWTVtFLxHUw4svELoVVUAo7
X-Received: by 2002:a37:98d:0:b0:6a6:1075:78b2 with SMTP id 135-20020a37098d000000b006a6107578b2mr9952253qkj.15.1654007854520;
        Tue, 31 May 2022 07:37:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654007854; cv=none;
        d=google.com; s=arc-20160816;
        b=qDTR54NzgNCW9Kosp1KkiMG/UoYku7qADE/nCNaU5U7Tksn3Y/MSHrRqPZaeTQbc1i
         yhSzzxNUM6wSktzZD8hAqayhfYHcZx2oWn7WO7hMqUbbINHpoPL+J+MzsY3N3dwWRvvL
         lX8KgX5BcIIqkfzUn49shXNkdTBeRueHky0C8WjCcnVn3CNeIpeBNSr4Jo5pQaWTO8Z5
         qlRocuNySSp7V4O/AhLmGgl19b+3HwZPHX1VQ8/X0zNu9Glbh03UGTWFeZCSlBqmIQ37
         MxJO4eHwvffD5qaHAfXu0v0NxvuR1gyRgj5tNIiO1J+99KL9P/jtva+OgzL+iA+oxBEZ
         m0pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=pWdkb9nCXHNLAF4DIznBQNvVDAvL8cu0pcKjQ/KOw6w=;
        b=GYYmYXLoPK2mAoeXlLiaXSoJhh3kCXmez/zCuSOIZhlIPwXPYTlmlChQ4s8Ax2JpTe
         Rpyw9++J0MxRf3CR6Ej9npuRq/ryrMw6LYXWuy+d1C1GRIb+M7jh7/CN0QSRAmrZ0vy5
         OLHwrrqkEDxTu3z0wFbVeMILh07LrfHr7NAovhC0yP1lyCQvIsJPL+15LtcZFNw1fHZG
         ZjhJWCm457SfvKUXcCzubwT8vka1OUvTUnpdcZ3T0gmYfz7FE9ykBQHQ4d9YR2w1yPf+
         a2Ep4K8cetCsszkegarlhzF/yaR1NROtuBLC0hSXKGQBESghiqjFh3/R1hAbypsV3515
         gZwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MJQiYcck;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j18-20020a05620a289200b006a63a6d541bsi3187534qkp.492.2022.05.31.07.37.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 May 2022 07:37:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MJQiYcck;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nw302-0000l2-1w
	for alex.bennee@linaro.org; Tue, 31 May 2022 10:37:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nw2yd-00072c-H9
 for qemu-arm@nongnu.org; Tue, 31 May 2022 10:36:07 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:33711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nw2ya-0005Gp-UA
 for qemu-arm@nongnu.org; Tue, 31 May 2022 10:36:06 -0400
Received: by mail-pg1-x535.google.com with SMTP id r71so13075650pgr.0
 for <qemu-arm@nongnu.org>; Tue, 31 May 2022 07:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=pWdkb9nCXHNLAF4DIznBQNvVDAvL8cu0pcKjQ/KOw6w=;
 b=MJQiYcckaY+QECS0lzzRxW1cIpvesUrNpG9/xkztUOKHV4ZU2zrwfwh4uBT1jicIeR
 N15VvCiWe4abM0MpkOlfGnboD/x4q+9V0W5QRurZSLvc8V2BB2LAHTHuzcnM5gw1D2jb
 tfDeP1aL+cLdcbIlGCkz7OIahfpTthHfiF7poHYx1DQUdJpvx0CZd2z1W5q9nEz004Y7
 H6IF3+Ri9pAaqEX9AiuVTcTXY2oy7lHWItkV1y9Yq8OIf+cicyEOGJ6x2Trru3tzqj6/
 3v0BkPIoPiywwZy0pQLPIXhn9Ny34YN4lm+K8TrebJ+DmDNig2zit17fvFUuKYHWSy4v
 4o/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pWdkb9nCXHNLAF4DIznBQNvVDAvL8cu0pcKjQ/KOw6w=;
 b=bhcKXxsGs4AEqRGts09jef1oj4upsCK4LJumLRU3Wp+zufTPepUHjTxq5dj0c6/hXG
 pfE8572plpujyiP1ZYcB1UmuE5MVpIfUMn2dUaM6WhWV5KXrUZrpTRtKsf3HGCyKSH32
 k8O5kDef3js33hnCHKv3uwJla2AzxaTvJnC+zVHtJ623kMnwE5DF6ZPNlcJhqMfAMzW3
 exCgB6S9yYG+vcAxyp2dGKZW1qLYCjgkHusjUmoFG6XCk4AAPjFvTcizvp2B1TNIKUAn
 p7F24xkRjMWEmscPaS1S8QvBbaeph20U27keLog6vDSE7+ZmQLwpkKdw4xHtjnRkYHx4
 EzoQ==
X-Gm-Message-State: AOAM532EVfj82EA043rdewx8nyyUAWrDP8Y0Oz1e4DRZ2ONiIZbZ15+b
 Wh9REuE5YdGYgq+s/p4qvX8GtA==
X-Received: by 2002:a65:6e0b:0:b0:3aa:6146:15a8 with SMTP id
 bd11-20020a656e0b000000b003aa614615a8mr52071451pgb.181.1654007762930; 
 Tue, 31 May 2022 07:36:02 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:4ae9:ceee:85cc:a70c?
 ([2602:ae:1547:e101:4ae9:ceee:85cc:a70c])
 by smtp.gmail.com with ESMTPSA id
 c10-20020a170902c2ca00b0015e8d4eb207sm11135734pla.81.2022.05.31.07.36.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 May 2022 07:36:02 -0700 (PDT)
Message-ID: <ed287f11-a910-89a6-18e0-5ee3ba6c39d5@linaro.org>
Date: Tue, 31 May 2022 07:36:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] target/arm: Declare support for FEAT_RASv1p1
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220531114258.855804-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220531114258.855804-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7iH7i5M4fBRe

On 5/31/22 04:42, Peter Maydell wrote:
> The architectural feature RASv1p1 introduces the following new
> features:
>   * new registers ERXPFGCDN_EL1, ERXPFGCTL_EL1 and ERXPFGF_EL1
>   * new bits in the fine-grained trap registers that control traps
>     for these new registers
>   * new trap bits HCR_EL2.FIEN and SCR_EL3.FIEN that control traps
>     for ERXPFGCDN_EL1, ERXPFGCTL_EL1, ERXPFGP_EL1
>   * a larger number of the ERXMISC<n>_EL1 registers
>   * the format of ERR<n>STATUS registers changes
> 
> The architecture permits that if ERRIDR_EL1.NUM is 0 (as it is for
> QEMU) then all these new registers may UNDEF, and the HCR_EL2.FIEN
> and SCR_EL3.FIEN bits may be RES0.  We don't have any ERR<n>STATUS
> registers (again, because ERRIDR_EL1.NUM is 0).  QEMU does not yet
> implement the fine-grained-trap extension.  So there is nothing we
> need to implement to be compliant with the feature spec.  Make the
> 'max' CPU report the feature in its ID registers, and document it.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
