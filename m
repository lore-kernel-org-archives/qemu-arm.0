Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp2084600lfj;
        Mon, 16 May 2022 08:53:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxcIH2Wc7vVEh3aqIgEaTpVCdf5hyDEhASLVNaVXUib6IamTAJIV6KG6fQbJ5bUfcIj2cZ8
X-Received: by 2002:ac8:4e91:0:b0:2f3:cbc2:eb0c with SMTP id 17-20020ac84e91000000b002f3cbc2eb0cmr15776660qtp.459.1652716432813;
        Mon, 16 May 2022 08:53:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652716432; cv=none;
        d=google.com; s=arc-20160816;
        b=1Ji6/2/EClsPqeBDE9MACm1eSDin3q22tJpLyERz1292bt1Ak4Gh6DPbazXoGjRikN
         DbiRlCKYij8mY/a00yvVFf0BlnmmW5UHLorkcGsVy0AhH6ZBwsVsDe0/pMPE6c0d8b9X
         lbEJuhkhbYUvDigomnw1wVdQU8ezvbfCwF3+JP/euMJOmmtgL9/4Y24PmFW82otTGNu8
         Ct3A9g6hRPjoEYIx5K6beTNzB4be1RFJBXxVWJxYCAp/xSaHOEhc5D5IgSryWLgTQL3c
         npJtldPyyBokCo8i9g1Qag2ZtxZwSbg5xmPE2QH2EI/MIwmwbUZeE0FoQjLHsyCCLVG/
         Z6Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=I/3A8SUVUV2RC9p6q5CTxBgapEUdSZmisXM+TWCG4PY=;
        b=TEaABvolz5YwTz7yqzzlBQhoewzMdjfAxVVsFz/or26TlOPlayZEA1hi/hlfPzs5xV
         SuEQH7L43UTlIjyD0XiH+NQh69cw7+viIBqXQxRWHhcRujafHWd6t1EKX3CYGCY1552E
         sQz30dVuTAXGSJpJLWKOHhOhcTArCy103Hbqpfqm0WFVtlbXK2Q9rfLGMDP/wTIsMLZ2
         BnlULCWvWeSF4AoljDFwNGTJ6QAFL9Un/1io0fa8nIa40J0asWwqRUAyCOgEx/w/NHh5
         1IFDljKQSpl7YxlIlJ63tFL97XPKNJbDlFybruuhc0fkWutkwJtcOpznN0NNC6dXx8fh
         Ve1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NSkuWycb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b10-20020a05622a020a00b002f3a220aa47si6513482qtx.626.2022.05.16.08.53.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 May 2022 08:53:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NSkuWycb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nqd2e-0002OE-9V
	for alex.bennee@linaro.org; Mon, 16 May 2022 11:53:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nqczT-0007x4-1P
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:50:35 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:39688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nqczP-0002Kn-2o
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:50:33 -0400
Received: by mail-pl1-x62f.google.com with SMTP id bh5so3025393plb.6
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 08:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=I/3A8SUVUV2RC9p6q5CTxBgapEUdSZmisXM+TWCG4PY=;
 b=NSkuWycbqkqPGP9vfUeimhtoZCQDayaud5kMygayS7A5NmA71EgSSkMu/teuG44sYJ
 LVmh8xK8UK8WizfO65tsh8lYgcXf94+Uav2ZbU+KWD3d7MvYS8zBE3F51PSaOGehlVSn
 CHYqWGo8slef8N9ir5aMwaaq62XuIAbmhWy8Fltq74g+9K4mpsOurwYhNYM+qXhmdbGA
 EP1tRNoBH9T5Lg+9MSQHkp+Xwz+xsuF519P0yT5UY9tS7bvK7QvvmnpUYx0Np4MWhVs1
 UUxNd6PBcf0pjWH3mv3LDWLvEz6HQUvbfV3H17IvsC5/SZWkvtuCP2B90xYGyyj9/TBd
 SSHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=I/3A8SUVUV2RC9p6q5CTxBgapEUdSZmisXM+TWCG4PY=;
 b=DXNwr6cdD0AfNGiWhI/pPafSwGRg36nPue2T7jtZ/nhySd/Dh0sKHlM6qkNfg//i88
 eu+Nd2HMv5Wwon51DKiw62XTjubhgiCvqW2temrU4HJR0QWjrYcFEGEoV1LDubwkR/ft
 2GuNLwuflLQ2U6Gw18PwfwlLxmpNJgZHC1LQyySBsXUzZi4bcDQR01diIPvphLemVc6m
 s/66s3nKq13ByUq2OE8Em7eAPvkJbf6nOOKOv4NVRUy879LzODD1T7whQcfXx+WZXmh/
 91HcSEhP40/weP86iozDggi669ux/6cc9EawSPXlWydWqgpzfCuRUt7bBzQWi1q0YeTl
 7J7w==
X-Gm-Message-State: AOAM532idAEAS0l33twRfRh9xgYFpKCnR7IlSzUn6IYjSV+/hwYO0mGz
 kqRNQcEoPyRsf9S8V4IDqFY/Yg==
X-Received: by 2002:a17:902:c404:b0:15e:9aa2:3abc with SMTP id
 k4-20020a170902c40400b0015e9aa23abcmr18008603plk.172.1652716229528; 
 Mon, 16 May 2022 08:50:29 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 f15-20020a62380f000000b0050dc76281c9sm6991795pfa.163.2022.05.16.08.50.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 May 2022 08:50:28 -0700 (PDT)
Message-ID: <dac737bc-ccbf-08af-9ca9-b7e75a4ac5dd@linaro.org>
Date: Mon, 16 May 2022 08:50:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] ptimer: Rename PTIMER_POLICY_DEFAULT to
 PTIMER_POLICY_LEGACY
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Francisco Iglesias <francisco.iglesias@xilinx.com>
References: <20220516103058.162280-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220516103058.162280-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gs/KKHQLkb6T

On 5/16/22 03:30, Peter Maydell wrote:
> The traditional ptimer behaviour includes a collection of weird edge
> case behaviours.  In 2016 we improved the ptimer implementation to
> fix these and generally make the behaviour more flexible, with
> ptimers opting in to the new behaviour by passing an appropriate set
> of policy flags to ptimer_init().  For backwards-compatibility, we
> defined PTIMER_POLICY_DEFAULT (which sets no flags) to give the old
> weird behaviour.
> 
> This turns out to be a poor choice of name, because people writing
> new devices which use ptimers are misled into thinking that the
> default is probably a sensible choice of flags, when in fact it is
> almost always not what you want.  Rename PTIMER_POLICY_DEFAULT to
> PTIMER_POLICY_LEGACY and beef up the comment to more clearly say that
> new devices should not be using it.
> 
> The code-change part of this commit was produced by
>    sed -i -e 's/PTIMER_POLICY_DEFAULT/PTIMER_POLICY_LEGACY/g' $(git grep -l PTIMER_POLICY_DEFAULT)
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

with the ptimer-test.c string change already noted.


r~
