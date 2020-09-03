Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp695348lfc;
        Thu, 3 Sep 2020 09:48:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzLazNpukdxz049s7EDi60gXlS/KiKx3QFHCqaD0vXCc33AfujqQMRATEUZMrBxSjzZRGWc
X-Received: by 2002:a25:bc3:: with SMTP id 186mr3714067ybl.2.1599151690515;
        Thu, 03 Sep 2020 09:48:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599151690; cv=none;
        d=google.com; s=arc-20160816;
        b=hrwPokVcOHp9PTA9zeEKJ1tLVHdFC/AL9XLFK6n57bte6elANwZvkcMfCnZb1TwH6e
         9xL8kt7f85mOoHD0AUKuLet8nVVHeLfs2S71CMLpus8MyCEobNZ5ChXSbUZRDougGTlG
         OZQh3lPnRZ/hzMtageuyYrjD8l9ly2MnKKkyrdiEoitJ9OyRgAmz0WyIxpJy3SKnisLO
         n6Y3gAAcjsgsGDaIFsFCsEjFqyIFUrDhrqp2YHN/4BQ2KHw63D0PcjIXVm7Qnm2CWTtY
         lEy3Zll7z/aBCpx11LiWC2ZVa/kPTaWJBdGB7Kg7W0PVXc4PUE10CVBEMW/pHBgO43x/
         EaMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=MqEzl7bYtjx6L00QzbuzeF7tsc3PgsBkPDFIIf9kTuU=;
        b=sfQRwWq6W/8TquxH20/aICa7QMThnd8EYaq/Xo6bJ/6ry7tV84qcvPcWdD48zeTcQF
         QGfytf3n+F0bIHx3JN5xW45WJMArUbGbhFMrnEvoZNyyh7/IoaQeTYUEsvP7f+G+jEMn
         dDxHNFizHaO2Tol57VL4MOejbfAge2rbZ2oM9Y/AWlOpk4UZ7hSdo5smGEE0lgzfwWdu
         vjFIRmBYw6Ju6/q67U3pdS6AEtZLzJCYb3kEnD0X90qhpSEVsJ/6rvj1xdsDDSBA0O4o
         M8dnITSYVF7FvCu/30TyZip/M/sy4ZSfnSIRM92MkXK8lIWAXaVLzWNLGSW2VNZbGP/1
         rMVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OUk3I3q2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w188si4508400ybc.281.2020.09.03.09.48.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Sep 2020 09:48:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OUk3I3q2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kDsPB-00058W-UA
	for alex.bennee@linaro.org; Thu, 03 Sep 2020 12:48:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kDsP3-00057U-9l
 for qemu-arm@nongnu.org; Thu, 03 Sep 2020 12:48:01 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:40168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kDsP1-0005LQ-G3
 for qemu-arm@nongnu.org; Thu, 03 Sep 2020 12:48:00 -0400
Received: by mail-pg1-x541.google.com with SMTP id h12so2593092pgm.7
 for <qemu-arm@nongnu.org>; Thu, 03 Sep 2020 09:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MqEzl7bYtjx6L00QzbuzeF7tsc3PgsBkPDFIIf9kTuU=;
 b=OUk3I3q2OP1PwnaLggOkAkANBJodhyNlNKAMruvJT7831ybbqKH2980kp0tksuyqGr
 DQbBvUNflIOcVVx8bLr96X8dSesw4Qj9H8pVjcxuDoGReZRVQYENExhn1McaL+aOAvT6
 BVisjTmofzssN+y9/AkUMPV6UsWfvEt+EVTZy/C+ka9JO7+snTUZ3Bzn/W/cB9B9JoZY
 NF+aUWMa5oIozXGkWFaxuvu6AyjNcKZqTmQzwfc4MI1tN/r1/ZD/dfwomjdm2ye0Scxt
 2BxM9O/Yv9ZY3ktTeFAuhwLtX6BIcM8I9wxk0GdEQ32N55btx2O2+D2HcFzb4ZvEqwW3
 0LOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MqEzl7bYtjx6L00QzbuzeF7tsc3PgsBkPDFIIf9kTuU=;
 b=IxxlfzshrCkaAXpdRqM2pdYV2X0vkzoCo7vjSFrEBZxFdnjIrtKMtHYs+5qTa+VDx4
 qeMBMM22pitrA3O45FesMMMW30opgVKnNCMcGEGhfun9fx0CZ4GlNfFrlI82eMzHmvfN
 Wn1zTCGNxsFLwh7NUhDiRjhLSiL7SqV5F88kajZdgc9Uqub8JCy9QfZPk75RpH8T8tfp
 CUuzcoVL+ESi1yT2OCV84nM1cHHvBhR3BYKAScrbTeVmJzkEHtMvz0gb3UhcGe5qxkr7
 OUfktJsovDVA2//BU3xf7uFJBayAHKNxNGy6QZk8z2tXuasaOp3Iqa1eZ/z7yx6lzA1A
 NpaA==
X-Gm-Message-State: AOAM531n7U5+bqyyKsMV/eDmvI9aUibtIk+z5gwxY0TmiIDX9ZtVllNA
 VcpeF5CnCnPMa0HH/c9Nj8Z3wQ==
X-Received: by 2002:a63:6f82:: with SMTP id k124mr3647574pgc.357.1599151677391; 
 Thu, 03 Sep 2020 09:47:57 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id s8sm3936837pfm.180.2020.09.03.09.47.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Sep 2020 09:47:56 -0700 (PDT)
Subject: Re: [PATCH] hw/arm/mps2: New board model mps2-386
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200903144425.11060-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <79c86090-02b2-2849-ab6e-c600c02e69c8@linaro.org>
Date: Thu, 3 Sep 2020 09:47:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200903144425.11060-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::541;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.403,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kumar Gala <kumar.gala@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TEAMn4ZfEcF1

On 9/3/20 7:44 AM, Peter Maydell wrote:
> Implement a model of the MPS2 with the AN386 firmware. This is
> essentially identical to the AN385 firmware, but it has a
> Cortex-M4 rather than a Cortex-M3.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/mps2.c | 30 +++++++++++++++++++++++++++---
>  1 file changed, 27 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
