Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp3400917lfh;
        Tue, 31 May 2022 05:05:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzHYbYEHsMpbZoKyrjrMQnl6NzwgShiwq/jU9h9B4UNsX3PjU/P1c7z2VAayNkF5DZcFrRi
X-Received: by 2002:a05:600c:2e54:b0:397:57df:dfb with SMTP id q20-20020a05600c2e5400b0039757df0dfbmr23305616wmf.200.1653998701446;
        Tue, 31 May 2022 05:05:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653998701; cv=none;
        d=google.com; s=arc-20160816;
        b=cWL9HaSe4ZP6+A5VEfYrZQOnixZFOIEwJhumkQW2ZWmdqVRenBqfptM+exHkvG4ujF
         MEZtjVWpr1gqegVVMUoHAuQHgdacSm9TbZM07umMVKXe1wflCKYJ+RtxIMxBlTi0VpyA
         JnSwTbsidwHoj+MYy3kbOmWPzYehNolM5ruoNeAlO/IsT+faiX1GuHtoVB3lKkHt6eI9
         roaFmN31dV2kCy7RWJdDvrzC5syjoJkupNsJFc2u0XGgNrG5lWFbA9tMy5S39Us29MbT
         sPjteLuhCOBQ/vXCCjnS+khpmF5MeIaI3jU1lQH8Ya6+o2/2PjqyAaaoQ7+HhgDI7TTI
         z2Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=c23+p0Wp3qkRJ+JZFgBrUFvUk0UkRN22ccsyr4/FQLU=;
        b=l8jJBys5RggZp4snUcquAXKsUf06UOQHr+ZXvgRpglUqmLnXeqS1YN2PZaDIY3sbDO
         vjkkNmrUDGi+6w867YdnwCJMfs/kct26WDMdVhdBWaX+RsNHMGF19OlDCOBF15v/O3JP
         TpWXJQCNCIanD913fPfAGIajhA3iJQaAX/SLPgOpZq8B82COc6yExIq+w5Oqmrbi/HhJ
         +M+fQFKHfxKjbdresX9x5+C/PP44Rp0QGiQpSbZ+9xM1kNi+n/g2HIAYVosxPBS00tML
         NgFqs6ecghIPFUdCtzvBHO4SXq9P3VRAqFhfYL6HUpgOoH4J2LoNNPfMG0572CjXppuQ
         Zbzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="nmT/j8Mw";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w12-20020a05600018cc00b0020e5d353ccesi10939785wrq.914.2022.05.31.05.05.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 May 2022 05:05:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="nmT/j8Mw";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nw0cO-0003cu-Jn
	for alex.bennee@linaro.org; Tue, 31 May 2022 08:05:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nw0bY-0003bb-KD
 for qemu-arm@nongnu.org; Tue, 31 May 2022 08:04:09 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:43783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nw0bU-0001gf-Rz
 for qemu-arm@nongnu.org; Tue, 31 May 2022 08:04:08 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 l7-20020a17090aaa8700b001dd1a5b9965so2055612pjq.2
 for <qemu-arm@nongnu.org>; Tue, 31 May 2022 05:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c23+p0Wp3qkRJ+JZFgBrUFvUk0UkRN22ccsyr4/FQLU=;
 b=nmT/j8Mwanp6RS9+xGsPNGofixwNz2pJuYGu9IvAArGO4LdWiRyTZkDlB1oozHAoyH
 YA/3T3odMcl5DT0f7iBIDAv7O+uydugywaSQTkwYjGhhor1SRH5pVcBF1EPWkSgnos9j
 s/EnwEgoUS8nYi/wlGHA8uJYWaE6rIxxJQ3+r/9i4q3/afmrjm+KJ5EyWkPy17DO5i4I
 /U0qmabLMuG6GGZgF9E8TbgcYvITcp0Oi+7pGaZFJl/u+p2JWBhYVCG9DjTycQB3IDDX
 7dafM9iN6O62c+R/RbbZ2x0YgqmaqkPMDokiCQ9lYNq1doGoF3Z20U649TiMSjIQ/54+
 wxnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c23+p0Wp3qkRJ+JZFgBrUFvUk0UkRN22ccsyr4/FQLU=;
 b=yjibkTK9gHMDD13AiCAPNLOki/grL7m3Qcm/BlMU7rT8OdgKPWX3gZx4h5pQUdog0C
 VfctPJFAIgntjfudxwshHh+ilRV/THGQ98XTzNVFtekd3sa4WvlQ+uRKNoYod6Bc0ykI
 jGbgK2LC3lh1bRmcVdUFlOJ90iH0Hg2p2OMWSdjT4rg8egTHwyf/LxmYgHBb3cnVOQn5
 r4V3meT91unX10sxrzZoCF4WDCwCbSIQYzITuC4B0MXyfALyibWNSm4Zb+Oq0ZmA+EK6
 +4wUb8TqPsFS33TmcvLgcA7PN4tCPTiMmER5aZNE5C0LpBX460ebQfsbpcSw63dfE1EK
 iXrQ==
X-Gm-Message-State: AOAM531jfMSB+65Yh9S5QoIhhr+5JYY9Y3CcGddtl5J9t56nybz/OtOm
 goYyG1xylICk2VhdXKOUaR3rBDNqYox8z3PMuMQZ7w==
X-Received: by 2002:a17:902:d4c1:b0:162:dd2:407 with SMTP id
 o1-20020a170902d4c100b001620dd20407mr48111678plg.15.1653998643477; Tue, 31
 May 2022 05:04:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220523204742.740932-1-richard.henderson@linaro.org>
 <20220523204742.740932-7-richard.henderson@linaro.org>
In-Reply-To: <20220523204742.740932-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 31 May 2022 13:03:52 +0100
Message-ID: <CAFEAcA9xAKTL5nwZ+mLMwbMeunfmvPtAia-PRbGAz96Q+w-aNA@mail.gmail.com>
Subject: Re: [PATCH 06/18] target/arm: Move arm_generate_debug_exceptions out
 of line
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: cIYgX+VFgJtX

On Mon, 23 May 2022 at 21:53, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Move arm_generate_debug_exceptions and its two subroutines,
> {aa32,aa64}_generate_debug_exceptions into debug_helper.c,
> and the one interface declaration to internals.h.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
