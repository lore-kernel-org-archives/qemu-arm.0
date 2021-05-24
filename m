Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp3572901lfm;
        Mon, 24 May 2021 06:44:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw5JKi8hLRwgIhqES9vJdqI+U+uSt25qa4zsa8HJQlU2/FqXZuxAA7gsbrvEB+fWi+UC+/l
X-Received: by 2002:a9f:3d8a:: with SMTP id c10mr22287216uai.51.1621863894545;
        Mon, 24 May 2021 06:44:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621863894; cv=none;
        d=google.com; s=arc-20160816;
        b=TsZ6dfn4Lkwy0VZto3rxKXvXF151gnIWX3Q+KyIDVe4CxBe4WSACPx4/Hq+J119DAy
         G/uGA8hpfbL7b8JzWw8MnbKmuZqk3zJQ3UKeKF/C+hUoFWK1SUW4RrMcE4srPC5wTbey
         EB06W4/b4AW/E4xtviKKjrIXdtTOa3leWT4cuKhPpVRdAr0BRsZCtqT8TYQlGw2lssVW
         va2Ly2gOogriwk03V8X1YjKkb4YiolU7wqKKnlIsgq7fbx1As/dwGFkkZRw0UxcaS2k9
         e6UhxrSljf6z5j+/2G0umGpCeAekzVEclQPfpRndIqGso3bRgzUHHRemMgf+USu2nUW3
         V9Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Vb0y0vXi4ceo5XMP1870eceilWFjs0QUNE82DmFck2I=;
        b=k0feEoytI3KIEfPiCQzJwAdKNg2m6WLsdQrJVGHK67cw26LTIkgOrrCOfDjpxMGtff
         gA9Bq6QmVGL5VuZ/lq63zgvXs9Xsh1L1Kqz2DITLmAa2wLnH0HXynpHivMxv0WEiFZS0
         treQXNQEe3xtZ0ndQQth4soyYJmMlv67UsDkTVJ6wYq7K76HUGN9oWy+0NaLTFpQUYfo
         ozEQ9zCd3jBH4tOStRHy3Tdxd7ycbH3xfLKVCObW4mhKAjP/mq/FDfANLCzEH/OawCeT
         +57cGmgK3e5u1u32RJp3eu4UKtNWmMFSU0OVFTVEkTRh1tuGj+Qoj99cU//24dAdBWKH
         tOPA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=B9k7yHli;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c9si2321174vsl.12.2021.05.24.06.44.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 May 2021 06:44:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=B9k7yHli;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1llAt3-00081I-T3
	for alex.bennee@linaro.org; Mon, 24 May 2021 09:44:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llAsv-000814-WD
 for qemu-arm@nongnu.org; Mon, 24 May 2021 09:44:46 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:40780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llAsu-0000K0-1Q
 for qemu-arm@nongnu.org; Mon, 24 May 2021 09:44:45 -0400
Received: by mail-pg1-x52b.google.com with SMTP id j12so20127228pgh.7
 for <qemu-arm@nongnu.org>; Mon, 24 May 2021 06:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Vb0y0vXi4ceo5XMP1870eceilWFjs0QUNE82DmFck2I=;
 b=B9k7yHlih2Ho0dgM6iVKessQM+iftKgP3KoT5sO6/RI/leXDjvtXT8HFBNJpZvoaby
 9HunfXSvzjBhcqukor8ns8/vGouIut3G1mPajPlfsqtuKM2f3gmW2b6WgVA7yLieQy3Z
 eulUyieC2XlyPoyEiEVnd8iVkr5I3PIVhrn9Q/U+YbekiJ4ldhiRjMmW3SmB96fo7dTC
 H74oNsiaJWy7tliEXOwKjUIKIZKZCtaNSSNhuXHsC9r5oh53KR4sXPMNz8PmmzjzQKZk
 VcgiJeNBNzhsNdNmI1WDkBFZLlHQXFKtsWTeON3xPr9KojPwzx2iDALlCT8WJiRNloXQ
 ePJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Vb0y0vXi4ceo5XMP1870eceilWFjs0QUNE82DmFck2I=;
 b=jSMoBSP5q41hZAI2pL5G7hHlB8M+uXZ8XsVxwzNiEybQEkQ3g9oCtjZCPUj0rZF7A4
 uoeUjPDTzJ82Cqses7wo/UwqTkifldoap+bbLGpQhLXlM7uoUQptK+i8hx8JoqkpMiAD
 frKsI3dCthfwwvUaD+YDuuBgKus3AoBv+JlLB/YCmQLaxaZpIW7lJq3q1ZJXXIxEQ40j
 KMYUBIUgKw7vWtLbCft2XtzRdV4iYxqTNMGVmVgRmjJnXipFKsl2UCdI13BSaNnUFA0h
 Pmbk5EVuYLiOp+elRtifnFzyfvBKL4xfy3iL9ejyRtbPmOYOspuHaM/jnOFzjGhIer2O
 Jesg==
X-Gm-Message-State: AOAM5310JuxtVHgm5RDHSnJ9OS9ItNz/IOcalEkpHMyHS9o+oWxmGoM+
 154Z1z+ehg5fBhGr1ZcJfa4G3A==
X-Received: by 2002:a62:7c46:0:b029:2dc:cb24:b5b1 with SMTP id
 x67-20020a627c460000b02902dccb24b5b1mr24706886pfc.77.1621863882489; 
 Mon, 24 May 2021 06:44:42 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 j9sm7085254pfc.220.2021.05.24.06.44.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 May 2021 06:44:42 -0700 (PDT)
Subject: Re: [PATCH 1/6] hw/arm/mps2-tz: Don't duplicate modelling of SRAM in
 AN524
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210510190844.17799-1-peter.maydell@linaro.org>
 <20210510190844.17799-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ab21f19f-76d2-0bdf-5f26-ff6082855285@linaro.org>
Date: Mon, 24 May 2021 06:44:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210510190844.17799-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Devaraj Ranganna <devaraj.ranganna@linaro.org>,
 Kumar Gala <kumar.gala@linaro.org>, Kevin Townsend <kevin.townsend@linaro.org>,
 Jimmy Brisson <jimmy.brisson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IMvZ5cgpjCmW

On 5/10/21 12:08 PM, Peter Maydell wrote:
> The SRAM at 0x2000_0000 is part of the SSE-200 itself, and we model
> it that way in hw/arm/armsse.c (along with the associated MPCs).  We
> incorrectly also added an entry to the RAMInfo array for the AN524 in
> hw/arm/mps2-tz.c, which was pointless because the CPU would never see
> it.  Delete it.
> 
> The bug had no guest-visible effect because devices in the SSE-200
> take priority over those in the board model (armsse.c maps
> s->board_memory at priority -2).
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
