Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp3527119lfc;
        Mon, 1 Jun 2020 16:08:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzYYzhZ7YOEQfKn4eWqEmdzepGxVeAW2EStIHhqYChzzyi3137b0GIKhjvwlii6hMOFqKE/
X-Received: by 2002:a25:4807:: with SMTP id v7mr37689632yba.121.1591052916740;
        Mon, 01 Jun 2020 16:08:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591052916; cv=none;
        d=google.com; s=arc-20160816;
        b=olUyIcIP0sRWicbbA8AXskOQKGVNOsPgPCh6adPL/FgXyPaYtsxZo5UuU6qg6KYw/w
         RIfDzuiiGbmkggBU0DlpTwEJ0Zdz4wJ3BMnF1tsD3i6i+K5Ux7iMwJ9YjtEsQUJuauPp
         Cqt6cf8Qe1EUEi+iFgdWyTb2VwlUPf/IWwqE/7q7EpYDr2aGEZ+EHxOHT7/HahnAMo5Y
         uZ4Pfv93y2o6go3TmM0RYSZkmebgGbU017/MOBmtrw+0aX1Vj1xhissoleGNezetmIy7
         OkQ24DDCUHvINf4f5orM0mpUw5a2Jk5lmZ1lpy5INhEgkNyrSjAvsHYdpQT5WFpW7kSD
         DPtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=2opHqdEGBYyYvRfqGA7MHjnnPqX/mrrwqx5O7Vtm8rE=;
        b=0fR9unVqZAaSxB9lhMLQF+ani0P2CmfoI6ZzKgQ3kw07SXlRuVCxDXEyFi05VOv/aJ
         lmeJUL+53cSq/I6omC3FtmVFHtpxpxC7K7lM7Wkp44AG6pTe+q27MIyAbUAe964e8Ju8
         0xOi6vxTyOfDLIrYYLzySGRUFIBxuTYCbjssP6jzUVsiEqOkbUGnVEP7mT5eaGJEKm8k
         zp90v0F741xFxOOvet+U2Y6JThzLS9rvE2PF47h/ov69WBeig+2YDJACO0noqTnXnV+5
         yXihKC//y/vloJV+SLzfJwwiKN5a9JKI79/rfs8qfaQswvN++O1ZevABoYItFdr8UpP6
         xTBg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RKtLpGFz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n85si620313ybg.397.2020.06.01.16.08.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jun 2020 16:08:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RKtLpGFz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jftXo-0006mh-3r
	for alex.bennee@linaro.org; Mon, 01 Jun 2020 19:08:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jftXb-0006mE-VY
 for qemu-arm@nongnu.org; Mon, 01 Jun 2020 19:08:23 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:41181)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jftXa-0002zM-RI
 for qemu-arm@nongnu.org; Mon, 01 Jun 2020 19:08:23 -0400
Received: by mail-pf1-x444.google.com with SMTP id 64so4132647pfg.8
 for <qemu-arm@nongnu.org>; Mon, 01 Jun 2020 16:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=2opHqdEGBYyYvRfqGA7MHjnnPqX/mrrwqx5O7Vtm8rE=;
 b=RKtLpGFzEgG2JoYYg6ExVAAyU1zNXDoFcxW3RoBRTvi7Nuw7mF6mawRjVI5zDFC0X2
 wtJnhi5nxrB2iVlO2BotObmVFlNixl76ztmAL9eV5kFYzx9mkvwjT9h0aGOpNuBgkJcN
 EoR/s5R5EHtHxdqYAGbL3lEmkV5rVcohMmufwCRHn1KhkpxGkxt+XdMEjfCiHoGYc5r8
 AMhDr8HKLQ7fQq0vU4u88hoIvdLACTVHp0exk3ocHqnd06sUEo2RCVK2ZZ/b2YbsJLl3
 PoCHfAcAHnyQ2LX4mv/oujp/sTdwVHAJ5uSihTW5RaSaHSBiKYxvPvVo5PaFGagcMC7J
 KbLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2opHqdEGBYyYvRfqGA7MHjnnPqX/mrrwqx5O7Vtm8rE=;
 b=J+Ml2hp+yJ2mHa1p5Q/ywZeD19Mgg4wEVAaqf7zgQ5NYFc+fPoeavx3hyyVg3ILRzq
 Ere/R0GZrtDkmClS7JxSXXig8VR9qED+xF8gCkveuXEDumv+dgMCta6FeN/7DHE1xCjA
 F45jhxslmuxH15y65gY9V3MQxh9eYb+76ANYJOF8k/qPDOlGx6bm+OY2AAQAXN8kD7Dw
 i1oQelxIvLvNuUntFM1wjgfrgk+gQBIipmgGSbim4+e3oPgQ5b96uNIcnWbyVcUHXF+b
 +qLTBHM0lee4ZfVrkHxhM1E2Fv+dbjfS+WF717JoP7DLlqDqXhEdMAWuwaaek1+tPiDN
 ibnA==
X-Gm-Message-State: AOAM531Y3BlwuA13QiU+RTO7mymQQJPbbnDdenabK7DuKEmVCICqVQlP
 zOMwpEaXxOJ8lInzO+3bn0gL+g==
X-Received: by 2002:a63:c5a:: with SMTP id 26mr20783421pgm.270.1591052901059; 
 Mon, 01 Jun 2020 16:08:21 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id d12sm397623pfo.153.2020.06.01.16.08.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jun 2020 16:08:20 -0700 (PDT)
Subject: Re: [PATCH v2 1/9] target/arm: Convert Neon VSHL and VSLI 2-reg-shift
 insn to decodetree
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200522145520.6778-1-peter.maydell@linaro.org>
 <20200522145520.6778-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b3c7861c-7687-70e7-dad8-0ea4dd640c35@linaro.org>
Date: Mon, 1 Jun 2020 16:08:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200522145520.6778-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-TUID: GrqNyWHwS71P

On 5/22/20 7:55 AM, Peter Maydell wrote:
> Convert the VSHL and VSLI insns from the Neon 2-registers-and-a-shift
> group to decodetree.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/neon-dp.decode       | 25 ++++++++++++++++++++++
>  target/arm/translate-neon.inc.c | 38 +++++++++++++++++++++++++++++++++
>  target/arm/translate.c          | 18 +++++++---------
>  3 files changed, 71 insertions(+), 10 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

