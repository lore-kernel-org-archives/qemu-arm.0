Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp1773962lfc;
        Fri, 28 Aug 2020 13:47:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxSS3dyPt5Kifx4intPf4NzVmYAom8OAos6g45NHAC6e4AJVwMoeJwx71JZJc4DLkiXjBhO
X-Received: by 2002:a5b:d0a:: with SMTP id y10mr5411872ybp.128.1598647640087;
        Fri, 28 Aug 2020 13:47:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598647640; cv=none;
        d=google.com; s=arc-20160816;
        b=Y1hzfAUDozfxv5sPPL7kB49ULhu/4uDiSuIkNcwA5UpPCm1driRTwOvU+J5t2zGec4
         3ocy7S/Km13Pnas11uNJivw3+Sba+cyiXGF7GrMFQRprEp49YEzWa2vtN7d+2Wi5rO58
         MmB6Ger1yB2BSh9irGD3aPwLTK4hQKarGue8PudQ0KJCoUzoDZGIx0t/lHWPg16W90jJ
         8JnM7EuNA8S/ljRl8TvscQGhLLDNF8zxXnPwL8ONuQLwmZsy7U4ZBwFL5qAhtX+7Wu82
         uPjfp11NQlFEySJXUspUykDjIEwXew+bGkE8tmrqQuNWwm1Eb5sysR1dgwizQNhMHqQD
         FqCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=IycITABhPsUsLfYZPozRPkYOlc5L72MnAv6fCG/m5+Y=;
        b=Qa6jdmn6Nv5QlRtrxgb0+xAmg0ViXAKSWuwvICS11q2Ndqh3bWGaxrj/YaHKSr+G9J
         3Uf8C/ZYZv+VSf0RUSyjoLNtuO0sya0xDgsKaVkRGLvGNxsVU7TkrXKb92MnFnqe8pGH
         XBnrRv9E67KHganiOhIi+wJz37u8wXw/9+olaiM26CCkt14J8eBlcsj1JaEygZu8cpJq
         jhgk2WwKrBvuCdoU0lDyTqvfIlwf4KHUoO0eVv1EdDDroigZrbua5kqN2osK0NceyK1W
         vjTKXfjsEm8L8G8JD6t1NfSROuRNWGuiZ2RTuv8/IMxLqVb0w3Sz+kTfGFIJLMECERp+
         JPEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eqdvio5M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 124si376756ybz.22.2020.08.28.13.47.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Aug 2020 13:47:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eqdvio5M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kBlHL-0003eg-C5
	for alex.bennee@linaro.org; Fri, 28 Aug 2020 16:47:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kBlGH-0002TU-4y
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 16:46:13 -0400
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:54642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kBlGF-0005Sc-GQ
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 16:46:12 -0400
Received: by mail-pj1-x1044.google.com with SMTP id mt12so129951pjb.4
 for <qemu-arm@nongnu.org>; Fri, 28 Aug 2020 13:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=IycITABhPsUsLfYZPozRPkYOlc5L72MnAv6fCG/m5+Y=;
 b=eqdvio5MKgz2KVV1WUVxylk5cL31/2uwtN1cg2wUXxuCF+FnVa32APskkaJEdrZEZV
 YX7dtacQ9st3jUIpkdNsaDf74ZZTWRTc2wL4Wvn/EA2/dwDzbYxRmiHu8XDVneuZF/qq
 570HFYaENlA3r7s+RRTAcq9q9A7rL3F8mCivjZ4zSL2KD2r3zTksygp9+cBzvGPcAk+G
 YOb/Dn0Hrj6YFKtj6S/moR+BetSNWhrTag/W0QX/28Qgchozy6hyhOvCseTeidV0lBbG
 7e/5ykRZj4eq0B2K7coUCqnNQp+ZycTHCNgPY2ZjDvQFXrDdIYRzYBoD3dosJQGh1P8l
 x72A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IycITABhPsUsLfYZPozRPkYOlc5L72MnAv6fCG/m5+Y=;
 b=SLnfuKUw1jZyUc90Fz7MtWKeUl7TkUhDWUqhu9Y7lmlMdtSk7NMv7NZCDNH6MbDVQa
 VP60vIxHmHb4X+7ggfKPsYcN4duzWNrvI6D1mEAC9PPaBllPDur/jeLnsO/en1uzlKcq
 Lxr8acHO7//a6/DUEzJoQ9JznFTaUrdTV4GyS4OmT5ltRk0k1+xulOOoLwiVeW5HqAZ4
 Lt9dp1b4lMkE1nNqiZGBKpBtsYXPmlV9aocurrCsCWAIroTx8YPd9M0OoOWYnnkbwyXm
 ZG+0JF8F+A4TJXl+tU2Rrr/qFNu/eWshzm+52sVNd8MnM1YOg4GV9YUjbddUd+Q8JB0U
 ol7w==
X-Gm-Message-State: AOAM531z2GD/4t9/DDFkxLB/+0vVN+GQdooLTQOlbFNSrPRn2vSg5FOn
 RpTM22qD8kWnZCrXYnwdwscr2g==
X-Received: by 2002:a17:902:a617:: with SMTP id
 u23mr534016plq.188.1598647570152; 
 Fri, 28 Aug 2020 13:46:10 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id e16sm310153pfl.100.2020.08.28.13.46.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Aug 2020 13:46:09 -0700 (PDT)
Subject: Re: [PATCH v2 27/45] target/arm: Implement fp16 for VACGE, VACGT
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200828183354.27913-1-peter.maydell@linaro.org>
 <20200828183354.27913-28-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7b6198d0-9ac4-1712-784b-47ca17d96c52@linaro.org>
Date: Fri, 28 Aug 2020 13:46:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200828183354.27913-28-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1044;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1044.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.809,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: s2xIivJDQLHs

On 8/28/20 11:33 AM, Peter Maydell wrote:
> Convert the neon floating-point vector absolute comparison ops
> VACGE and VACGT over to using a gvec hepler and use this to
> implement the fp16 case.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.h             |  6 ++++++
>  target/arm/vec_helper.c         | 26 ++++++++++++++++++++++++++
>  target/arm/translate-neon.c.inc |  4 ++--
>  3 files changed, 34 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

