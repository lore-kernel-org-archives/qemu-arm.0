Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1047437lfm;
        Fri, 19 Jun 2020 16:45:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyW1ASkJVIWJorCe05JhqnYRGVptX8EIJ9m7nUAcYkw9X7NQ8gPgtYksQNqyV6xH11rSGhZ
X-Received: by 2002:a25:846:: with SMTP id 67mr10518570ybi.490.1592610309678;
        Fri, 19 Jun 2020 16:45:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592610309; cv=none;
        d=google.com; s=arc-20160816;
        b=k+X+8zXwwJBuYHzts5L8a4fR/oAz+aRXoK9jTLR4mOuoIkZInin4v585lB0kU8Ejrd
         34uZLJ3Wcdc0Dj3+9QWKVfP6u+7BA33QwBKZRbOlAhWSXSaVZWN6SJFlgZcCc4bpNazp
         +5vZQ4Nttb1vA24jt5G2UyY/UMTyTUlFeR21+YU890r4siBX81B9hKKbdQu2Hzv6p3vs
         ede01a2ye8LPrOjJYhsyRSd9u7zCqlrmv0vIQFqqsdmaB7SBxwpvx7W9OZcptCTAyaiV
         RnC3pmV6RgCpNEv1ihnqFEzIxk6BQNsxoCaWeZZLXWWJ41SAU9yHp0hUcxkzPhWb469u
         QbvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Oz/8lmGaQ/euwDwUdlzaSW8+tINnaGVYs5pfXT02Two=;
        b=Kp/2137FYy2XAMdxUpozGQI/tUkNmRu5whTEo8rqKebymH41DRZh851CQeufoeNWrT
         Mpq57dpjUps7vLRqwEcUjASRH16agVQcsrQ6z2sOVGDz6zcg4/Ia6JEyNKxsyWn03LOo
         3BSQN7Dn4q0GPUXr34Tfl58K6h0EmcFsljoIXlSBl/CD7eyIlIfI4V2ca2PKGovALkoL
         4RnDAM2f0yyOPql0IP3QHO8n0fRNzpOuxWh8tyg2AtubynEcQwb2Rc9ADWV4KywiiQM3
         mXrtGb1yrGSqfEsL4aWg/6lyAiGCRch2CB33n3D640rUDSZuUHgzF+ranfy4588GntRO
         QI/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U8zMX6Sl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r7si7233802ybd.373.2020.06.19.16.45.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jun 2020 16:45:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U8zMX6Sl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jmQh3-0000H9-2J
	for alex.bennee@linaro.org; Fri, 19 Jun 2020 19:45:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jmQgt-0000Gn-Kj
 for qemu-arm@nongnu.org; Fri, 19 Jun 2020 19:44:59 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:38251)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jmQgs-0002Uo-2J
 for qemu-arm@nongnu.org; Fri, 19 Jun 2020 19:44:59 -0400
Received: by mail-pl1-x641.google.com with SMTP id d10so2690573pls.5
 for <qemu-arm@nongnu.org>; Fri, 19 Jun 2020 16:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=Oz/8lmGaQ/euwDwUdlzaSW8+tINnaGVYs5pfXT02Two=;
 b=U8zMX6SlZBCvtbncKyowmbWXt/w7LYSyfj49vTBBkIz7cy+PtsicV4wNy0siSWhSVN
 e08MbDg5BgUvMf1Bna+e9b0LK6BBylhGLWrLvKxgb8ORx1Oa1nfCTk6meg4WynyG4dpH
 m1MD2T6Iw105L/QPf4hkq+6+ZovjnGFXKiewAarAc9qldTvI4cNFdv8EfWUu/inFqqoe
 7b6c7OODN86NNLoy0CtjIwFIsXrCV/Xjw4YD54+zZZrNChjxe6nlv6prj+dKDDERfz5z
 ZC+8swlwaAcYpUMiXY0akV0Ihnjngce6LvfA4D5EEgltFEVVG5zJUYecuiwIdyMfyVlM
 aTCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Oz/8lmGaQ/euwDwUdlzaSW8+tINnaGVYs5pfXT02Two=;
 b=A2mpT0mBowF+xGp8UIUAWVkiilQCqCa8e/m3ryjmla6fkAMJ1adDfN5S6R6qU9Sefb
 2olULge6EI0jq950M0H/eHErfCJfGagmvxT5FQGCCzCkF5jvsNPGKG4pEC/CuAOASmp6
 LFxefE92NtYuI9SxoHGHE6Wa9iQwqLutfkfBezgM6QQTK6CXoI9v+2+p0jHx+pwyMgkh
 Int24ugJVvvTkblzxPqRvnrpTuiFUIBzXy3F9BQ9poQva7mSAXKu7AwVm6v4mj+C1p84
 wNbWYtVkWO5avrXovsf7d/nGCPRCNDRRv9ny5fsDeaBHA4pSqpa6GmtTXSnPEcAvkPeF
 yVNA==
X-Gm-Message-State: AOAM532ApHFSgl4vvcPE5x9cxZQ/VJRAF9TQ5Ci/tRzJhzLCDpGJVK4+
 X+mpuykH/e8PcgqzREOjm2JOsg==
X-Received: by 2002:a17:902:ff06:: with SMTP id
 f6mr9780266plj.22.1592610295717; 
 Fri, 19 Jun 2020 16:44:55 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id f200sm6896281pfa.62.2020.06.19.16.44.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Jun 2020 16:44:55 -0700 (PDT)
Subject: Re: [PATCH 15/21] target/arm: Convert simple fp Neon 2-reg-misc insns
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200616170844.13318-1-peter.maydell@linaro.org>
 <20200616170844.13318-16-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <16597338-096c-06c0-3b5b-9966bfe0b19b@linaro.org>
Date: Fri, 19 Jun 2020 16:44:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200616170844.13318-16-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::641;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x641.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
X-TUID: 4pDbwngLLr/A

On 6/16/20 10:08 AM, Peter Maydell wrote:
> Convert the Neon 2-reg-misc insns which are implemented with
> simple calls to functions that take the input, output and
> fpstatus pointer.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate.h          |  1 +
>  target/arm/neon-dp.decode       |  8 +++++
>  target/arm/translate-neon.inc.c | 62 +++++++++++++++++++++++++++++++++
>  target/arm/translate.c          | 56 ++++-------------------------
>  4 files changed, 78 insertions(+), 49 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

