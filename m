Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp3552293lfk;
        Sat, 5 Feb 2022 16:14:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx9RIqZaPTzBNJXnTtuiH3EJqTHY/AU/T3bBOve/Hkke/F25NKawA+i3UzR3raDKqWEQOYJ
X-Received: by 2002:a25:6d54:: with SMTP id i81mr5118305ybc.702.1644106482131;
        Sat, 05 Feb 2022 16:14:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644106482; cv=none;
        d=google.com; s=arc-20160816;
        b=mTCTfVPgxfKaqIVWr3iPWWd9kbR9VwdJuhXGmrrA0jASg6RbnhvQBJEMhrDHtdV4yH
         nTbCHAeCUcs5P3D5t2lpcthAT0qVWaUmAwP46qXO2gTww3f35W8Y8LT4wFXQiXA8wOME
         2LOM3+38QqBWJy42oQd8xsg/dnpoYwcJMoCuSoxjxQkJzUiBmmLsbqvA9mWTONgBKr+z
         HB7dkwNIGNVdrNOmgN66W9D+AbeMI2FbX7rcrlAGQfmZltbhaPWjs76hCaJISRccr0Hh
         PQocwtIE4cz42hn5F74KXYCQqTPsgdlk2+Tvsv23CwC8YyR2rfloz+jti+pOHgQ02jX6
         Q63w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=lcrDTG6uCPBz/5WAKeWlJmpysP6FJsYyLGoEOrKN3Ic=;
        b=epuQmqtMipTjM2+CxI09DJc4Cc+3f3l5rJTTSGz4tTOtugRaaj12BhHFMy2X4FWNkm
         TEcodKJQumk03LmPDk/DIGc945mKE/b9cenl3BJGS3bPyGQOrEvF4/4XdEQ1QuQ6OtbG
         iCAoJkMz49oqvJD+1N+LxW/SYHilqB16Npo3Nb9iWCrP7xdlaWitJqhONJrbU2sWvRfz
         z+5CSDRkRTIv9a6+3lCQgWUk4EXzRMjwCAMWo+CPvsZGa0/ynO8B+1G5HG+BJ8rK3cow
         cgNIZMGDG4Bp0WdwTVxbi0996pJeC/bbqVQypGJ+k9lyIDI8jzy15uHk3R8+ox2EX6CZ
         fu6w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ku7NIYvM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 124si4322954ywp.552.2022.02.05.16.14.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 05 Feb 2022 16:14:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ku7NIYvM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nGVCT-0001Y8-Hv
	for alex.bennee@linaro.org; Sat, 05 Feb 2022 19:14:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nGVCH-0001Tt-OO
 for qemu-arm@nongnu.org; Sat, 05 Feb 2022 19:14:30 -0500
Received: from [2607:f8b0:4864:20::1029] (port=42911
 helo=mail-pj1-x1029.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nGVCG-0000cx-6A
 for qemu-arm@nongnu.org; Sat, 05 Feb 2022 19:14:29 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 my12-20020a17090b4c8c00b001b528ba1cd7so9767970pjb.1
 for <qemu-arm@nongnu.org>; Sat, 05 Feb 2022 16:14:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=lcrDTG6uCPBz/5WAKeWlJmpysP6FJsYyLGoEOrKN3Ic=;
 b=ku7NIYvMMw3C6ihq2fdreRYZOx4maZMI+iOAjOCC5TOX/TZCa7w/xBfxg7OE5aYnta
 o5vGCYFYEiviNJ7kHVwMPPjh9FeHHQoXGe9lPHOuRwUpWbHF6f/jceM4GhwFFdQLh7yA
 m5UgVreY6yCxX1OsS1CuDebRXUqI2hBd0MggjYiyOzjHXFPj+/0E62KY49mEJiKV04o8
 iomXxB+H+TWZt4W9iJ76jug2FGLJc6z2DjH4ZyTdZnsty1FV9fnP+w8oV2FmOLTAsM7b
 S08E08so1BpJrTgnSlMELzF2Ge8krNwwtzEeiqZFjzFlFGsy/5LHvjJCdKkT4s3a3Oih
 o/Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lcrDTG6uCPBz/5WAKeWlJmpysP6FJsYyLGoEOrKN3Ic=;
 b=uSeb7J3Ck0eD90E1fqNASYvcPypThvxqU+51Sb57LzzRAFaDG65aI96t9MS+i3heEb
 JBFIgdxDBx7KoEMZwR+BLus3RZM3/A5Ib6cp3RCJwvUzpvx7WWbFW6Y3Mlwj3YyajTuw
 6agLtrgjoJ5m7LTN1QFg2/QXPbrFyHmoEyJ+ToScHJXEpCoXsyGASLreuGQAD2bX1q28
 kD99RwLt/zQEZWtmOzWwjFmAXiEpdsboyI3VYqrvubsDdz3nK6qXUmpOwfp2K9g97Cry
 L6mRengDxkMC5g78KsoBPySnrMDFim1tb0fefojpSot9mWS8/BC/GeyWlSRM+NP/RjE+
 zgNA==
X-Gm-Message-State: AOAM532EMt1a2OidC4j23BbOeHpgR9jeeRhPjWjdfNEJ7MOU9yHnGgGU
 nyqo90vcRlxNzMitKkg/gr6SHQ==
X-Received: by 2002:a17:902:b213:: with SMTP id
 t19mr9754243plr.65.1644106466716; 
 Sat, 05 Feb 2022 16:14:26 -0800 (PST)
Received: from [192.168.1.118] ([220.235.247.127])
 by smtp.gmail.com with ESMTPSA id o8sm7235609pfu.52.2022.02.05.16.14.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Feb 2022 16:14:26 -0800 (PST)
Message-ID: <b9a3ca90-64a7-683d-6f6d-172f87f3c0e8@linaro.org>
Date: Sun, 6 Feb 2022 11:14:21 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/6] target/arm: Use aarch64_cpu_register() for 'host' CPU
 type
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220204165506.2846058-1-peter.maydell@linaro.org>
 <20220204165506.2846058-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220204165506.2846058-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1029
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Andrew Jones <drjones@redhat.com>, Alexander Graf <agraf@csgraf.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6s0wyHdtxmdw

On 2/5/22 03:55, Peter Maydell wrote:
> Use the aarch64_cpu_register() machinery to register the 'host' CPU
> type.  This doesn't gain us anything functionally, but it does mean
> that the code for initializing it looks more like that for the other
> CPU types, in that its initfn then doesn't need to call
> arm_cpu_post_init() (because aarch64_cpu_instance_init() does that
> for it).
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/cpu64.c | 17 ++++-------------
>   1 file changed, 4 insertions(+), 13 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
