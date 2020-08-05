Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp207559lfy;
        Tue, 4 Aug 2020 19:53:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxA3AHEkcA9OtUriVBXCk6mxX39FxCeaVHGn/l5ADEorn17MQRhpwVfQQI1Hw1NSSQ5cuQV
X-Received: by 2002:a25:9843:: with SMTP id k3mr1613191ybo.466.1596596024215;
        Tue, 04 Aug 2020 19:53:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596596024; cv=none;
        d=google.com; s=arc-20160816;
        b=tdzEuLOsTuw6gJSKhABktg6dEG3Jq6iDb9NTzbvanJFsH3rUT5ucc3wv3HEUWx91wL
         SIfwpsGkMdgt4ZUX4tV64udERRZ3MuKvZm9HRjHNtgxm132Y+JU+x9OSm3u1SOc34EQn
         YuB2mhmOU7Qi6JAgomKpvE40IP3LO145qeiNtMasYcwgv262I7S5+bU7O3l2DQseXItk
         VphUSkGRmjEGEMY9flr49UVHPm+RHHc+flE5rQk87ALwdwHDdfpLT9lA00gy94ZV/uYH
         ySFtcE9GQf4/FQ3cH1wXeEjVNwRogcOvWPv+EypVG+yfA7+YEKO/S9NcBplcXVz9oZ5y
         B26A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=LpoOxU+4i3v1XNfXCzBor7huV1kvbwWuPUtmczVqqeY=;
        b=BUrrps6KHN9i/iGefHPt82g2DYlB/1wzI+LnXmAyBCnuShKH/+f1I1KSF2oFxoOglJ
         22uE999FTvuHU1nQWfYXdVyTDhCHcwSUyYs85sMLVNz8mPqVIjP80MkBdXi6nNO7ue9x
         oDJQsCg8kdzz/6ZHF7FA5ycWzm62KY1XHJqaHrnnUhCtlh+Beu5oqtc/j3dEprPTNYOo
         MKTH3NFbMRaxrP2eCpuVwcQs/OC//bzeF6xXBK9rkc0o/y40DF+ODWxAyc2vOwQQ8pnA
         EVhk29Hkk9Cot5IBitR/vMFChTyxZFCmTLaPs8NYgaOiJFnXvmh3pRVbjrXngVDF+hmb
         Al2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nNdlj9JI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o62si680461yba.223.2020.08.04.19.53.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Aug 2020 19:53:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nNdlj9JI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k39Yl-0002In-Kz
	for alex.bennee@linaro.org; Tue, 04 Aug 2020 22:53:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k39Ye-0002If-WB
 for qemu-arm@nongnu.org; Tue, 04 Aug 2020 22:53:37 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:44646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k39Yd-00012E-5e
 for qemu-arm@nongnu.org; Tue, 04 Aug 2020 22:53:36 -0400
Received: by mail-pl1-x641.google.com with SMTP id w17so24438645ply.11
 for <qemu-arm@nongnu.org>; Tue, 04 Aug 2020 19:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=LpoOxU+4i3v1XNfXCzBor7huV1kvbwWuPUtmczVqqeY=;
 b=nNdlj9JIPy4tQ5YaqpqjSIJqJClLHXIyOB7p9iuhOuaQqXHxn/9jC+jmFfjLZI9G/j
 amRt5c0w/76Rlo8Yk+5wB3pxusGRvRSvHu9DoFZVvz9v9lgPMGHWNoG4e9fX8pnvnGd8
 v4kc0EYCkhl32WrlN3Bm/2yY5v/RyChWUgwTH/kWGR/b6mkeVPFLtsTwOAuvnIcQ2T5h
 /H7fVg/xXUEPR2IlpTvLFRUzyL6nURtK7IXjPL0oVsKa5WtJUpDks6+mfv5h7WITloOA
 0vQF5Gf8/HnwKfVii2ezOgaO1i+DxEjKfKIYoBHEuVeC9oDBVikcAGyLbmRoHw8BqpiN
 bL+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LpoOxU+4i3v1XNfXCzBor7huV1kvbwWuPUtmczVqqeY=;
 b=r05hJFvd/F40t9hYbx79YRVdFI7+kcigM2Zc+Rmjw2yCdNyJPqB9cle3VFHOtg6hfr
 HU8jJH9gd+P/9yEtt8GlY6SyDxkMY81uhpBX0ocIXaBK+erWwE1FlU/9uLgAAq1LCC8E
 1RLkLqba/uV/j1FoKQYPJJHhR4g252tMzSpXmoW3TamCfNqR9qtjXXYT6SaaLb+up6x7
 vEBl6PLtFUmf5iQgnvWuApl9ao9zWgKp6hUqzjzkB1o62HQiKEvYiGPP2iHvhz4EdT2l
 5tSKd6q2OHeJpHT4HM7Qv4FlDugezT/bM+hsSf4CEmftAH0esOh1xE7+jYDxT6y4IdnQ
 m8kw==
X-Gm-Message-State: AOAM530j9f909vb1XdcAQBInO3tlMFnJAWxyp54fDSpdVwj8U/K1wYXm
 jrjyhQCN5581i7UUU6rPlKZRNg==
X-Received: by 2002:a17:902:cd10:: with SMTP id
 g16mr1113514ply.338.1596596013121; 
 Tue, 04 Aug 2020 19:53:33 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id fv21sm688913pjb.16.2020.08.04.19.53.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Aug 2020 19:53:32 -0700 (PDT)
Subject: Re: [PATCH 3/7] target/arm: Convert A32 coprocessor insns to
 decodetree
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200803111849.13368-1-peter.maydell@linaro.org>
 <20200803111849.13368-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <04a0dcf7-37e1-b8be-6ec3-45820c583686@linaro.org>
Date: Tue, 4 Aug 2020 19:53:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200803111849.13368-4-peter.maydell@linaro.org>
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
X-TUID: m3zQoAGfTS+B

On 8/3/20 4:18 AM, Peter Maydell wrote:
> Convert the A32 coprocessor instructions to decodetree.
> 
> Note that this corrects an underdecoding: for the 64-bit access case
> (MRRC/MCRR) we did not check that bits [24:21] were 0b0010, so we
> would incorrectly treat LDC/STC as MRRC/MCRR rather than UNDEFing
> them.
> 
> The decodetree versions of these insns assume the coprocessor
> is in the range 0..7 or 14..15. This is architecturally sensible
> (as per the comments) and OK in practice for QEMU because the only
> uses of the ARMCPRegInfo infrastructure we have that aren't
> for coprocessors 14 or 15 are the pxa2xx use of coprocessor 6.
> We add an assertion to the define_one_arm_cp_reg_with_opaque()
> function to catch any accidental future attempts to use it to
> define coprocessor registers for invalid coprocessors.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/a32.decode  | 19 +++++++++++
>  target/arm/helper.c    | 29 +++++++++++++++++
>  target/arm/translate.c | 74 +++++++++++++++++++++++++++++++++++-------
>  3 files changed, 111 insertions(+), 11 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
