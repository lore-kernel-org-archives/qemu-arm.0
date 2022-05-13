Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp355053lfj;
        Fri, 13 May 2022 08:13:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxwkDr2K3R5Zj71kwE5hngdg3E/7JVeOmTLTQu2sDtHkiOe0cUm0qd1wmpGIoOoUBAJNV9I
X-Received: by 2002:a05:6214:21a5:b0:45a:ea15:625d with SMTP id t5-20020a05621421a500b0045aea15625dmr4657608qvc.62.1652454822518;
        Fri, 13 May 2022 08:13:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652454822; cv=none;
        d=google.com; s=arc-20160816;
        b=cU7HdBf+M5Da87CveD9CX0JFnJjPuaBtiEE4exCuV7Ulj9ypqkT6/y2JUgfsgzhiwC
         Y3peLOCDeCg4jgIJEG7T4b74x5SpdH1eJiZvvO3D4mZq7bqrj4xp1G88+RiSos/3j1Pp
         6LuxQnpK07HELbKh5hiEaL23qwaUBek4GM3EySy4KncAd0IMtUz5QDDuElUeTkKPTaIj
         eGTE3nS2FVVNTf3s+1Kkr/nWpJ5+NRjjF+gc4MPNEO7tKUfWvLaxZN+oN2F69cYCW+uJ
         pWMmryeDuH0VcIaQxFHmQRNTgPdo/s4yAHqL/Vq33QvNu1PXkUsx0NeGDBPQK9/F57SV
         VVAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=L5QtYLHEZBXt+/iP6MIrqtT+84zvAC0dFpBvzZOGREE=;
        b=ztFb319uwooCHR18JWoj38YOTGp1lZSQeaZMzsLwpaXCnV+6t6ykq/Hl3jcsvLFfvZ
         kj0a33aeuBtC3OcEBExpt3YjLdGpkOlcAMOQvqftW550EXG5qyXtC8wCv657Id3zSHzH
         QMLHDTL7gjeiQYFeoDIxY7nQubVAWlD8o8xRd8MClU5EBb4iGeMgufFhtr0r+6qnbX5a
         PKZwaPRkqhdmgTS305+EWiGeCTN+AbeN+2/D787tDpb5Jo0dRGleLn4KhgcYxjf6Qfng
         y8+xkXFFucJ7cMycEpp0AmoQPxXTQxQIyLAr9+qQOIIVch3Fa2dusxi5rPYhcq9M9KR0
         RcRw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aQdlvAx0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l26-20020a05620a211a00b0069f7eb55dbesi1582795qkl.376.2022.05.13.08.13.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 May 2022 08:13:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aQdlvAx0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1npWz8-0007Fq-0N
	for alex.bennee@linaro.org; Fri, 13 May 2022 11:13:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1npWyq-0007Cy-Dj
 for qemu-arm@nongnu.org; Fri, 13 May 2022 11:13:24 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:46953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1npWyo-00038p-Ht
 for qemu-arm@nongnu.org; Fri, 13 May 2022 11:13:23 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 cq17-20020a17090af99100b001dc0386cd8fso8031555pjb.5
 for <qemu-arm@nongnu.org>; Fri, 13 May 2022 08:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=L5QtYLHEZBXt+/iP6MIrqtT+84zvAC0dFpBvzZOGREE=;
 b=aQdlvAx05UBta2S0eAjzJlKWxXLLsq89rySM5Q+YnjMcPgI5beqGNKFpeu5rlGHmdI
 M4y8bYEgPKXGp9w3s3YipnHB0LnVUKy1doJYjBC2iO058vZ5tGwdPuikjjqhnqfa5xVr
 WXgarV7aPdJFPoeA3ctgnd0IM3XUslf37VYbMlKx0fVWtvvzjMugU12qoPijbUDmQBPI
 FnJo/IbFT/HH93/PDQ7zJGkRchCP41WQeEDNjM3OHo0xPY7m4MAmOQrfJyUg7gUDJyXd
 eWxiGvR0JNuUYd6c3PzxUJaofxzFsXYxxPyiSC4PNgqx731DXUP7Re4FgWJzCwxakMcG
 ARew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=L5QtYLHEZBXt+/iP6MIrqtT+84zvAC0dFpBvzZOGREE=;
 b=TJOrGTiynbWWreFphpsWma1jTq3e9XdGVb8ccnM8KHlj203L0X8+J6K/HlOzn+C/BJ
 b6FZ++/N2FCObfYHIDQKu4bhmGyuMR25+em+MEbtxZgduotzqLUNcK9XMm0MbVC0oH53
 4hAK+4EnKuB/j9yx4YDvzk/xWUeHfD02kBiPKgbmg1tnfWDwMMYMsROuoyvH0GishM67
 Yt0BWcYjS4mJprCH7evZGS/mpd2EcAlv+Z4VJsAilrg2QEx/QQUv4WJxnuSEloD0l3Fj
 ry9k1eVfpsUDc061U15TIeqA4ii5IKr9dLeHXGMpIPvx10APnhAA3qqs2IeWYkyfZBoP
 Ls6Q==
X-Gm-Message-State: AOAM53270WSvqvau4GkVGsi3M6lQsJl1gvLMaWgVpeRnsl+22qdfycBY
 afZFEp3Ts+LSzg2m886Was+6qQ==
X-Received: by 2002:a17:90a:5515:b0:1dc:c1f1:59bd with SMTP id
 b21-20020a17090a551500b001dcc1f159bdmr16584845pji.81.1652454801072; 
 Fri, 13 May 2022 08:13:21 -0700 (PDT)
Received: from [192.168.66.8] (50-78-183-178-static.hfc.comcastbusiness.net.
 [50.78.183.178]) by smtp.gmail.com with ESMTPSA id
 im2-20020a170902bb0200b0015e8d4eb1bdsm2055505plb.7.2022.05.13.08.13.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 08:13:20 -0700 (PDT)
Message-ID: <f07ef0d8-d02a-c1c0-7b26-a619fefae1ee@linaro.org>
Date: Fri, 13 May 2022 08:13:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] target/arm/helper.c: Delete stray obsolete comment
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220513131801.4082712-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220513131801.4082712-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
X-TUID: +naf7e/MrcWJ

On 5/13/22 06:18, Peter Maydell wrote:
> In commit 88ce6c6ee85d we switched from directly fishing the number
> of breakpoints and watchpoints out of the ID register fields to
> abstracting out functions to do this job, but we forgot to delete the
> now-obsolete comment in define_debug_regs() about the relation
> between the ID field value and the actual number of breakpoints and
> watchpoints.  Delete the obsolete comment.
> 
> Reported-by: CHRIS HOWARD<cvz185@web.de>
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper.c | 1 -
>   1 file changed, 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
