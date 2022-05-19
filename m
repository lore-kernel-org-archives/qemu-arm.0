Received: by 2002:a19:ef07:0:0:0:0:0 with SMTP id n7csp1259249lfh;
        Thu, 19 May 2022 09:34:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxiFX9IvrpbLDvpJGXPO4DnhIdC0Z7Ak0cHqxfYWI84Bjm5LaKy12X2aV8Fh2eMy6Y6ZGsp
X-Received: by 2002:a05:622a:1b91:b0:2f3:cbd3:1d3f with SMTP id bp17-20020a05622a1b9100b002f3cbd31d3fmr4572203qtb.37.1652978048317;
        Thu, 19 May 2022 09:34:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652978048; cv=none;
        d=google.com; s=arc-20160816;
        b=Ry1wmf2uU0D2zGqi0nPcW6cJnlXp6ZMSorrmw2xKbXZewAvfUc/mxReZW8ygY9eO/k
         RxwR74pUoZ2aJDhtartDXjwh6oPEmLaHwTFOhOyqBFJVuSjeBR/VECD4TaGHf9DGXp7i
         HH+hU1aZVKnuYfZGIThkj2BAY7E2FCVa+xaNLiuujSvQH2HXcbinNO/AxK5FfFD6RbYD
         S6Lqz1URpKdswnJvMW2UXcn55VbGHOBWszFIRZ49J61FHeuYhXsKq654233GPoebhKgS
         F9zYDoBvZJ/5Q7snMmylbVfmgredm+O1qWR9XInTG70CKflia+h34LXAmMzaWITsnzA1
         q5Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=IMljC8Xt9Lp3w6Mi2pLPvYPv4WBF6EpCQhvunQlqR4E=;
        b=hs2GuNjgRy0fjCH8i88B9uwqRZJ623BWPExROlHb1K+eDMSPcAf823hfOQSH3+FX7O
         tMwHtKhXhqmZKoDlQuFaiWMrSs4o2S9zuH5DjLZYayk7GKvcB8HelHjfL8CqWrZ196KR
         kpw1/aA97yYDMEQg2sB2p46Ivzh7n+n5eTmkhL9ETvCP3NlhBDac32Ny94G2tc+IjKLG
         tCaNKyACfHtIsGOiI5CDnTt9RSkrj1aC/MnWlHgSKo4r85m3WE5GCWhHJLoV6C8++Q1S
         zFOaThzwrvwJgviwIig3rod+gN6W+IREdPKhkOXawuwKq+US2wkUNGciVnM+d+LxPHqV
         2xhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lP1jWQKY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t33-20020a05622a182100b002f3d1a09661si1520641qtc.488.2022.05.19.09.34.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 May 2022 09:34:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lP1jWQKY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nrj6F-0003KU-Q3
	for alex.bennee@linaro.org; Thu, 19 May 2022 12:34:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nrj5r-00032f-Ql
 for qemu-arm@nongnu.org; Thu, 19 May 2022 12:33:43 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:44870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nrj5q-00005N-5c
 for qemu-arm@nongnu.org; Thu, 19 May 2022 12:33:43 -0400
Received: by mail-pg1-x533.google.com with SMTP id v10so5519244pgl.11
 for <qemu-arm@nongnu.org>; Thu, 19 May 2022 09:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=IMljC8Xt9Lp3w6Mi2pLPvYPv4WBF6EpCQhvunQlqR4E=;
 b=lP1jWQKYMge+w6+IiqHBCu/LAQC8z9M0Fs7+EqmbCChHhNZ2scNo4mw8Iuy7UD/YFZ
 yGVr7ZAbJMXi4TTdmlyhrWDmZS45465kwUsd6KsTUYcFCyy/troU59n6s8i1CMDCJOs0
 oMvjkRIKcnMFFs0bTfodPdmMr3UD7X6CDCtz4e0bwm8c2HyPKkVI4augXjnL42F++KEE
 l0aXgHzRoMoqvlfkUPu91OxzP9E1lMJIQYOFzGfqRiPv77/AHc6BRKW+8fbPgyohblaD
 ueQ2ocKyV2VU6BSF6vzlI92/K7tqRutUM5mWHRXKioI6kLIc2qTj6wL4BAU67A1m78ma
 WPMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IMljC8Xt9Lp3w6Mi2pLPvYPv4WBF6EpCQhvunQlqR4E=;
 b=WqxLtv28vaySAy9LKQX2WwCYoNQXuQq+kSlZYfRc3mbz6/z+Vtx7WvLIHM7sDDNDv1
 QyGJ0RiUyOs4EYO6G8gf5/r0x9tP0/eICjmecP+jyC88NyUGXd1QF3W4ywtpxdTO9v4k
 pKZ0Lx9scHKYAfOYlQOU8lA/XJ6vze4Vjv6c1n+Ph+Z0zD9HYyPAfb1hpRVc1dBneWbB
 TK3k8FxTLjsE854OshG5vU7e/Lu7w+GSplDsRJMbLpRDL3RVcU3udMnKI6toZdaBLUro
 SMS9o6Q5hCUwvHhi7CMNbonRL03CppR+QeAW7HwxAr72ybCPK0VnellssWWdMOBIcEWK
 M0Bg==
X-Gm-Message-State: AOAM533l96zCS10jrD6uxeDEsTgKbcfqNLYjoYYz5m8+TqAQNWrOEUtT
 +wfrtaDw8pQW+aDGUc7p9SHmwg==
X-Received: by 2002:a62:f901:0:b0:518:307a:b392 with SMTP id
 o1-20020a62f901000000b00518307ab392mr5456776pfh.44.1652978020564; 
 Thu, 19 May 2022 09:33:40 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 7-20020a17090a098700b001d25dfb9d39sm28236pjo.14.2022.05.19.09.33.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 May 2022 09:33:39 -0700 (PDT)
Message-ID: <764b9678-f67b-3f9c-7f00-a30a35796eb0@linaro.org>
Date: Thu, 19 May 2022 09:33:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 3/7] target/arm: Do not use
 aarch64_sve_zcr_get_valid_len in reset
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220517054850.177016-1-richard.henderson@linaro.org>
 <20220517054850.177016-4-richard.henderson@linaro.org>
 <CAFEAcA9SU0vXtzw76HkN4wrSgsMyBNwA_bHGa7x0u0rtNe4LQw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9SU0vXtzw76HkN4wrSgsMyBNwA_bHGa7x0u0rtNe4LQw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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
X-TUID: ow90cmquiMEg

On 5/19/22 03:40, Peter Maydell wrote:
> Not all the code that looks at the sve vector length
> goes through sve_zcr_len_for_el(), though. In particular,
> this is setting up ZCR_EL1 for usermode, and all
> the code under linux-user/ that wants to know the vector
> length does it with "env->vfp.zcr_el[1] & 0xf".

Oops, yes.  Linux-user should be checking ZCR_LEN from env->hflags.

> Incidentally, do_prctl_set_vl() also sets zcr_el[1] and
> it doesn't call aarch64_sve_zcr_get_valid_len(). Should it,
> or is it doing an equivalent check anyway?

I think this got missed when we introduced the set of valid lengths -- it's still assuming 
all lengths less than maximum are valid.

I'll add a couple of cleanup patches for this.

r~

