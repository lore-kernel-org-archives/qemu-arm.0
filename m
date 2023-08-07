Received: by 2002:a17:906:f20a:b0:98d:b2f5:1316 with SMTP id gt10csp1642735ejb;
        Mon, 7 Aug 2023 11:26:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF//0ospWC6bXjX2gzbn4vtVB4fmzDsCjhvWOvsOJjvENmcExYOlMv4NaOnGUGuWKRWuzvJ
X-Received: by 2002:a05:620a:2409:b0:765:6923:623e with SMTP id d9-20020a05620a240900b007656923623emr9598444qkn.29.1691432765549;
        Mon, 07 Aug 2023 11:26:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691432765; cv=none;
        d=google.com; s=arc-20160816;
        b=DCmCX2FyKnhDxbZDi8f9rYhOxfp8QDARFr+HsC2Kfux+KeyGjM+kL/El333isCLa3F
         7Zd1PgrLWlc948KABB9E3AEclXM3JFqKbp2vhO80KlP6u1P2yhk9umLFX/OQem+3HGXr
         rzEWYEQAaiJrdL1KtqFiArOTz+2T3NvC0Ip5v6U0WF7+J9pjwCLWGd+MRXwKOFGMvVJn
         Cp2E7PVmVTgNlh5tLiNhpzNnavUcpTkITFMYkXWcxKrlPTCjCcwo1dWIf/TAHPLkqi1z
         D+OlkMmnOozm19PQYF62S+cEj3jApCVWOMB+B05bCHg8Q6BIrr1RS3HPwZbkeqPzQWqH
         ukhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=stB5Ducho0LHOXzfvfZklHE4ZxBA7pXKjt/BciSnHG8=;
        fh=7ELSr/5sFo7qZWUWozFMp+B9CMHRnMDW7I5B4MPhJxE=;
        b=ZYpw1qEsnSChmCetTBiEQpyZrucdRM+Nx0Tszs6wvRqwXBbmyq1lb5CFUcBdoYibxI
         3Nj+ueoVn/6KIlcTrrt+ziselIES6ikSSWQw01bbS65YRqvaPTo5lc/xJd57QS5Van/i
         VsXAVV8GcG+IhMTw/uh4MLjZavL0MtC4h4Pbl42VpUX6zcZ6aNxnaSe5SDAbRm2pqNFz
         cWga7j2/wwVXjNBiwKXaByNHSwcqoVLKIQJLNY1YS25k4BjwezxH3lWq+SrhOMec9b5g
         TuPkwsLUrAJ9hvPpBqIXebwWWVaP5oTvnUH7Zykvbh/etwIfwt+GbdcSuVlkKljc+hY5
         fM0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qt3ALz4B;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bk40-20020a05620a1a2800b0076cc9615600si5433270qkb.774.2023.08.07.11.26.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Aug 2023 11:26:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qt3ALz4B;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qT4vM-0008GA-8B; Mon, 07 Aug 2023 14:25:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qT4vL-0008Dm-4Q
 for qemu-devel@nongnu.org; Mon, 07 Aug 2023 14:25:47 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qT4vJ-0003qW-MJ
 for qemu-devel@nongnu.org; Mon, 07 Aug 2023 14:25:46 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1bbc06f830aso32587285ad.0
 for <qemu-devel@nongnu.org>; Mon, 07 Aug 2023 11:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691432743; x=1692037543;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=stB5Ducho0LHOXzfvfZklHE4ZxBA7pXKjt/BciSnHG8=;
 b=qt3ALz4BQTRZ7Xrtg2KW5r6iwKXLO9juE5x2gdxLnYB+q04xSKhyXVspIrCRUHewJt
 MAs3cxFzLeiYoMt/Fjq5gwCb6S0rH9riy1jfIitbv15BAHaRPS+JauakwsToDy1gtKKV
 maAUt4M6JSEqMwscJjsEsttXAA0lVjWj1VBIvCUFMEoL9lJKyOV4pyVFBFujOphuOXcB
 DA207dW4CEJh6b4EBRYPIXDw4BmFgdMmrIUKiLD6PNrWyE39L78m8f/aOfWS7u8MqV9I
 4Di+o9sedkSnJB5FUtnQsS3tgJ/zUoJZ9sjNIYssaZvP2ab52h4GsocwqW8ZqEGp/X45
 fJvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691432743; x=1692037543;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=stB5Ducho0LHOXzfvfZklHE4ZxBA7pXKjt/BciSnHG8=;
 b=HDIfeZH/KGIcy1fgzwRwO24YuOEe5nmWF4YuqoQq973qKzvffCKyakoOiO0vyEOxhm
 +xrjgoSwPoVpNrtmUWkx3PFYc5xO0DhzkMp85g+Xq8fylwaPx1PE6yJ1kuI7nHOBSJXH
 h9f6TJjZ08ZceClnyvP26mqEbsispc4tKCnpP6n9/QagywPkTe2V3YWxRGXBdqgubG1A
 kD4zCNOxN5C3Wgt67EwH8lWOx9V07CK4kAZ8i26Zd3Cx/RkQZ/2M3CA0icpEKbeysATW
 ZtKskpcDKJo0ZI2+CWv1vdSQjrH2vE7oBvRQNAYTxykhZuMjjU/RMwi1F60dyOoKliMD
 zB6A==
X-Gm-Message-State: AOJu0YxafVSu21RzsnGHNVaAJtvKn6i7EIl5sS0bhPVfalJ2k9WgBhGg
 Br1OIciwdEEb0Y213TFVXKjMLA==
X-Received: by 2002:a17:902:f68e:b0:1bc:7e37:e832 with SMTP id
 l14-20020a170902f68e00b001bc7e37e832mr323843plg.19.1691432743593; 
 Mon, 07 Aug 2023 11:25:43 -0700 (PDT)
Received: from ?IPV6:2602:47:d490:6901:e306:567a:e0a1:341?
 ([2602:47:d490:6901:e306:567a:e0a1:341])
 by smtp.gmail.com with ESMTPSA id
 6-20020a170902c24600b001b9df74bac6sm7205497plg.260.2023.08.07.11.25.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Aug 2023 11:25:43 -0700 (PDT)
Message-ID: <70fb61d3-30c4-af17-67ec-b985cc862aee@linaro.org>
Date: Mon, 7 Aug 2023 11:25:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 07/15] target/arm: Pass an ARMSecuritySpace to
 arm_is_el2_enabled_secstate()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230807141514.19075-1-peter.maydell@linaro.org>
 <20230807141514.19075-8-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230807141514.19075-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.809,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: TVwABnOclVPO

On 8/7/23 07:15, Peter Maydell wrote:
> Pass an ARMSecuritySpace instead of a bool secure to
> arm_is_el2_enabled_secstate(). This doesn't change behaviour.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/cpu.h    | 13 ++++++++-----
>   target/arm/helper.c |  2 +-
>   2 files changed, 9 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
