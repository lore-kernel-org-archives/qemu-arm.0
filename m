Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp720343lfo;
        Tue, 2 Feb 2021 21:49:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzENMN8uOW5EbZAqbiZLdt6Fpx+twuVdfYrqrm0exqy5+jPCDjKrhWJkCfsyMleqYN6u8L8
X-Received: by 2002:a05:6902:701:: with SMTP id k1mr2178860ybt.342.1612331368586;
        Tue, 02 Feb 2021 21:49:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612331368; cv=none;
        d=google.com; s=arc-20160816;
        b=I82XjyVsLdvoRvaHq33LaxAw2L6gR+f5fwJes2BAKxpMzUkIn/mDSHwZmWTyuCq5Ri
         HCy7OlFWxbx+9cfFVwWBICiV/mr1C6OzTyGf2GlosVF4Ti4jwq06pDGNCrRQlmTybBq+
         y0B5tAI4jw7YMMniFrUeyK8/ft43jkxRvgGCfVhMEst9v4z5BMU2rvuHFUA/CedbNUjx
         p82HA2F0j17SFE3cKwDCmFbW/UPvshPYsPkDXLpyvj9YmqywFsemkfjhA1MVys7PxtE3
         MMHzGnEJ6/BHCWnYyjlXM/QnR9npt46mFqyDBKOMVCuTiJ+wi5606pTMViTjwrvUsakv
         1UAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:to:from:subject:dkim-signature;
        bh=bgeMERJZbFZAc6USC3fjOyLoKU/bLq3+UFxkbpKL4/c=;
        b=gO6uxxljqY+Sju9Bl0SVPOMqut+rbv3e4Vzi5KCUzuZDshwmJn6HQF4vl3+54P9xDj
         ltkWgB8prd0PMd37ldkEKcnebyMdOQLM+NMy9QtvaVgBMyn8jGzMfur4Qh5sM1JxyHPZ
         bmZKRhkeLn0KwOTVtWxzIH1lSQFQ3HOxEsbLXCfGJWf6YKONY5+yaBAH+JdITIstxKJd
         33+stD3orvlQ7sZ6BUQ9z4IsOjRrG1H18BK+DEyoBgA93siOCPM2OqYBW8rfqTgC9JMX
         AARJRfoaTqjRsIY6JYr2PK4Z8UcF2yQjPcBDJKQ6iE9/cg31umfM3thptIy6SG6I1N6a
         FkzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Xpjp5dZ+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d16si1424246ybe.248.2021.02.02.21.49.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Feb 2021 21:49:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Xpjp5dZ+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l7B2d-00081a-Tw
	for alex.bennee@linaro.org; Wed, 03 Feb 2021 00:49:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7B2N-0007zP-46
 for qemu-arm@nongnu.org; Wed, 03 Feb 2021 00:49:11 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:36248)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7B2L-0006qj-GR
 for qemu-arm@nongnu.org; Wed, 03 Feb 2021 00:49:10 -0500
Received: by mail-pg1-x530.google.com with SMTP id c132so16571894pga.3
 for <qemu-arm@nongnu.org>; Tue, 02 Feb 2021 21:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bgeMERJZbFZAc6USC3fjOyLoKU/bLq3+UFxkbpKL4/c=;
 b=Xpjp5dZ+P0LfHwzKIU8RZnRcTQUVHQ7bMCYevrq0rtYbsA8UwJI7cg7VB6MsERr9I1
 u6KuC7nEbcyEPaqSMfhABJ+oL7RWElKXQGkgxlJTUGMdWerGze2aB1EsP1xORXf9Dpbf
 J9BBBcSWXtLjxRnDtOxt1i/ZRRsv0fa11u5jApARLGQ0gf+2uAciJv7aSFdfq3n1Rszp
 4jxNYMg8vVeKNpwKQi7P/GEHywldEMDu+JRGPO0Ry5WwSIDVyO0h4bE09+dPLECk31oo
 1u3b9BuhjhekjgTHhVHKt6WnTw/X5jGbHKaX+4r3SZmavPgdoLDy+QwebFcsP7AxP6Wi
 N0Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bgeMERJZbFZAc6USC3fjOyLoKU/bLq3+UFxkbpKL4/c=;
 b=Qiseq0HK7dfo3rzOkZPerEyoqBbeLCMVh37vyy0H+MSkDdSI7BN5CA3dkwX5S9k1b1
 0ATsAK0fWzSxrcgTyyYTPr26FpEmOrPH9Waz4p11JN926DTvAc3az29F6wAEV8jx/H5Y
 i96L9FMyBPnvF6E3XGlv1GNejHTpUuKchhu/2GzLUG6m/CICOT5tJAukD8Do3d0BSJnq
 oticK/w/klbyReSsE4kJubdDmlsarDOn2KopjeMIz6gk2grnaVs26gOyXULQEbXaK/u+
 axoXxb1amoH7yMRnrOdB+VpFPyor63oibiSWmjPdJ8pqE/Qy8KV1h38/it363toyDQbR
 YABw==
X-Gm-Message-State: AOAM530UJWvljZ2KU8bJbPjLydHLa80NO5IKqOyGIcjaOFoieMKW9Bmz
 vlpTku9I9RbS8B8v/GMzIRi5hrbeaJeMdEKd
X-Received: by 2002:a62:e30e:0:b029:1b9:3823:4b3a with SMTP id
 g14-20020a62e30e0000b02901b938234b3amr1574694pfh.15.1612331347982; 
 Tue, 02 Feb 2021 21:49:07 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id b206sm792760pfb.73.2021.02.02.21.49.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Feb 2021 21:49:07 -0800 (PST)
Subject: Re: [PATCH v4 01/23] tcg: Introduce target-specific page data for
 user-only
From: Richard Henderson <richard.henderson@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210128224141.638790-1-richard.henderson@linaro.org>
 <20210128224141.638790-2-richard.henderson@linaro.org>
 <CAFEAcA8r5+ciCFb0kPC1bAi-kU53iJBiLf7Jiso-gr2cOBtxeQ@mail.gmail.com>
 <ededd9b5-5836-b1c4-9fc8-e732bf1c2204@linaro.org>
Message-ID: <2aaedf0e-3594-13a7-7576-8e0566464224@linaro.org>
Date: Tue, 2 Feb 2021 19:49:04 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ededd9b5-5836-b1c4-9fc8-e732bf1c2204@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.155,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: G0sW5MCTNt6i

On 2/2/21 4:40 PM, Richard Henderson wrote:
> Well, here's the thing: this appears to be v3, reposted.
> 
> All of the work I did for v4 has gone missing.  I went to go fix the single use
> of current_cpu, and it wasn't where I expected it to be, and that's when I
> noticed.  I'm grepping blobs now, but I must have made some horrible git error.
>  :-(

It's not quite that bad.  About half of the changes are here.
But e.g. patch 11 had been split into at least 4, and those are all missing.  I
presume all of the r-b that I collected before that point got lost at the same
time.


r~
