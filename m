Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1426382ejc;
        Fri, 3 Mar 2023 11:05:41 -0800 (PST)
X-Google-Smtp-Source: AK7set8DCG4voJ4pDcaIi0Iz9RY9/QURlR8GYOS0FkkrYwC7yilMChTrV/1uZZBKGvZcO60y6RHn
X-Received: by 2002:a05:6214:dab:b0:56c:1b8e:826e with SMTP id h11-20020a0562140dab00b0056c1b8e826emr12416291qvh.15.1677870341187;
        Fri, 03 Mar 2023 11:05:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677870341; cv=none;
        d=google.com; s=arc-20160816;
        b=ENv1dxvHoUaXeiqomeJvEe3eg6eAiKuzOHdHLBdiEzy8rrMhbnk8vCHdFvKfHrhXs8
         pdEEVqNz6uU4zMraTeHz/7lq4CCtlIV12X7DBmHiQjos4h4XZhk4nBNgfhbGBAQ1T+hl
         UYPzCcbBWO5nHtyFGpw2EUruMz1RgOk3V1OuD2O1rj8o2CeLqiD6LQLTiVZDvVMyeYqF
         MDKuNlb3nflmBpOa2Ukv1sUoScb9EtJzbpkiUyJZLKPjvXzLx9kcGFxGRZ78HLxoqURg
         PhOIwQ8ybTRljbqbUUmz637s6IyRLix4zIX1zoVBpc0vAzfYCkfxX2zwUTMTFpNp8nwK
         mlPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=rY8hg+ZDfbay23UtjvXiQyvBkil5VxYpNYFPij2yIH0=;
        b=GxcD1H6Vm+GH32NNFM2qlXV9sA3wAqJYeGat7mCnIAuC6Nj1xQl+u55o6S0odZK4r4
         PARPykFKrvnC45BGa/TeAXtcDm9k/zghGfRYb5RIYHPwskILYgDLPuS5+IV2bvpRPApF
         KcVHlYQbumIPCJ2fIYHbNVDSx0cGdwD3xGuq2v2YPQZxtXdeLc3V4f9/x9TtMGMhSGi/
         95qwenkO9rd0Dj9HICd2W0qk5cW+8WvPHBEfpHnowSEkrnCjrpxRhbRP3LbAOKiYno5v
         v1TQOxp/v34kJcLr9MYFz4d4aNIEHk5+ktANPi0awPZ3c4E2h5BPOvt99qq6ROpSxqoR
         To4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m8sVZdBd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k16-20020a05620a415000b0073bcf9a8a0esi2375576qko.715.2023.03.03.11.05.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Mar 2023 11:05:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m8sVZdBd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pYAig-0004sn-5g; Fri, 03 Mar 2023 14:05:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYAic-0004pO-5s
 for qemu-arm@nongnu.org; Fri, 03 Mar 2023 14:05:26 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYAia-0007fx-NL
 for qemu-arm@nongnu.org; Fri, 03 Mar 2023 14:05:25 -0500
Received: by mail-pj1-x1036.google.com with SMTP id x34so3622916pjj.0
 for <qemu-arm@nongnu.org>; Fri, 03 Mar 2023 11:05:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677870323;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rY8hg+ZDfbay23UtjvXiQyvBkil5VxYpNYFPij2yIH0=;
 b=m8sVZdBdj20lLIG6GVfo2GmPd+/ll5jPqioG3Wus4r48CN50yc661GZUX3yaWSWmWd
 f9mhl+mZzIsTD/HGi5cSb6r2t8lxNGaecDmUwBF29SYjQlR8B6ixi+XSSLwaWC3g5UxZ
 huiuyrDchCZK6onJ3Cg6bAYb6rVEBDtBlvX1ru2UsncggkDZF4zhkxd6PGOCT5ewM9Cg
 pBu2yj0gq3oKXKW6N7Uq3zNb6IMukxPxJKkzGazGvNL9PkckCqXgsXx1dfrO2PCnTyty
 kfXTbBHombjdYmaPHrcYF28g0Lfglk8PAc+7K2nmM3GOqjiBY2AQbJ4Br4KvD8J9Mwh/
 3Zfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677870323;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rY8hg+ZDfbay23UtjvXiQyvBkil5VxYpNYFPij2yIH0=;
 b=LVeELlaZgPRGnN8PmzRWoQPNO78IrZCnl44rDHC+UsItwlOHFqiDp/ethBK9OvWi4f
 vs/8RNvPnL8UrAwI5rwzVimv22xkCw7k7W2HgTByT+KrZfSUOPdbV2Cq+4Z2p/FqDn1H
 7ybaXdAEiJKd6/wvlDa/hrCClQnzJ3KeJZk2Kq9hprqDZvlgCqS8UE3TDJ5S2fbacdc3
 yOYi2/dfDicxzaXmxwYHR/c0M4MymrE+eZf0dUlsHzXG6czrdrulJQMQ2LLbmHqoYFoq
 T+iGf/MEH3p6+Z/CtrNcM5gJEzHLoT8l/ogLaEV4Qvq6DJvtMjBGBlmwtL2WFMTNEJMD
 emOA==
X-Gm-Message-State: AO0yUKUiqj9Q4EL9jFhdLMkvRsOysOeUuDcHYcu2+1sUauigzf1UG3uM
 a8iktC1h7dkAYfPD7RCPtxYAWTbVpn74IYZJeN2luA==
X-Received: by 2002:a17:902:a3c6:b0:19b:8cbb:30fe with SMTP id
 q6-20020a170902a3c600b0019b8cbb30femr1085402plb.13.1677870323363; Fri, 03 Mar
 2023 11:05:23 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-66-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-66-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 19:05:12 +0000
Message-ID: <CAFEAcA9hjD_WRv3Aoh9xy0MS+BB7Ps2s_+ksimzBQKryZy20hw@mail.gmail.com>
Subject: Re: [PATCH v2 65/76] target/sparc: Drop get_temp_tl
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: h0GdfRl0lFtu

On Mon, 27 Feb 2023 at 05:44, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Translators are no longer required to free tcg temporaries,
> therefore there's no need to record temps for later freeing.
> Replace the few uses with tcg_temp_new.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/sparc/translate.c | 53 ++++++++++++++--------------------------
>  1 file changed, 18 insertions(+), 35 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
