Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1406033ejc;
        Fri, 3 Mar 2023 10:44:38 -0800 (PST)
X-Google-Smtp-Source: AK7set/cK85Dp9eVBaJhi3vWcp2QqdgZodhNmSHzKpB93OvC+PyiMI24fWlmsQpcXyRMcU/7QgxM
X-Received: by 2002:ac8:5714:0:b0:3bf:cb70:8a4f with SMTP id 20-20020ac85714000000b003bfcb708a4fmr3955352qtw.41.1677869078212;
        Fri, 03 Mar 2023 10:44:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677869078; cv=none;
        d=google.com; s=arc-20160816;
        b=WMGdgJR9OghPP8pkB7wyxVu+pqOcrYG3IkcaOZ5TWAHcqhEZsb+J8fU9KeqT9B5MCU
         lZh3GoyhtcTmlfoQaEVf0D53n1cFn1HYyQIK1fg44jXAVdfEkeVh3oH1VnDtCKE+WmfD
         TdJvi8/bClfjTnzn0tXHCObQ2c6lVCnwBHF7rNX9Di8OXApPqwVuRpdEyRpOwmSdpkz+
         /t2nl41WMB2FNGvcV1NInpQ/kcqax1jmRRXAcaYF5wLAvwpY1Cmh4lGBBtKLv9S2ldRG
         73Nwu6RHCXtWFOigg7dWcxg44M87E4GOgKiYbbP2xkgmznpzXtjmAh5UQDgAmruCma7G
         BfYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=sQZzZcEGjMCNAdpg7pW4PnlMgakuvC67V9XQ3TiLV4w=;
        b=wpP6aEUn11Mb1z+YYNwn4pBsw8Q4jDUwJHEQnc/D9ADHjurdGOtEAXkDUiW2TFP9bi
         8rG2HghDhk7uUMLoxxZmEbUU4Jam4LDDEsjvhaXWDvzmN5c2MapBtwlCR2bViGrn4KGC
         kCfZzRCRf1Amu+ERizv8qWeXX+a7+zs/exwL4H36i61qVbNJDEHaPF2FLRkIvdvlRT8m
         7EkkmmO1AgMA2+lUf4ru5M4a4pLKDN9X8KQOTZoIDGWCUMHzVafpG8zYjOOsFsdlo204
         B578Sc5cdgWpyySNbU2ATieB0SdlTS7qRnH86QDe5qQ+cREbl4YtfjL0neObsb5AJ7pd
         lEIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bTOA9Df5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e12-20020a05622a110c00b003bfc28e414fsi2381463qty.687.2023.03.03.10.44.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Mar 2023 10:44:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bTOA9Df5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pYAOC-0001nN-Gg; Fri, 03 Mar 2023 13:44:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYAO9-0001jr-Sm
 for qemu-arm@nongnu.org; Fri, 03 Mar 2023 13:44:17 -0500
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYAO8-0007ez-Bb
 for qemu-arm@nongnu.org; Fri, 03 Mar 2023 13:44:17 -0500
Received: by mail-pg1-x52e.google.com with SMTP id s18so2074431pgq.1
 for <qemu-arm@nongnu.org>; Fri, 03 Mar 2023 10:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677869055;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=sQZzZcEGjMCNAdpg7pW4PnlMgakuvC67V9XQ3TiLV4w=;
 b=bTOA9Df5q0V+NQyltpkgQUtPGlWL/HYHUonQmNiX6yY3+UnFqH7O4HQYt0ILrtVK9J
 mZEDGmBTIvk6gRIPyFoYTMEwT8ZasHD8jsmCwvLck3g5mbXF8b5WbkMpea41KoU0CDKn
 doYXPo1fFZs2JGa4wqVNRxk4Dv0gNaecpDNH8scLg8KA1EDP0jAq90X68EsNh8OPci3N
 JUc2pGViAm52uXSqpkrgm3yWa1hqWd4y/Eg0H1AgsDXCHB4b4H2q2BE4aTrL5WJ/MioM
 7gDbRCLdRvJn/Rg6a8tAdUpZWTzaPgSXAhInITQct+kTJ9SE+ycV4O5/cZn75NjwnuT9
 3OAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677869055;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sQZzZcEGjMCNAdpg7pW4PnlMgakuvC67V9XQ3TiLV4w=;
 b=Qdy9MT7gyq24CouOTMjY4TDLowBX9wGB9z3cWpuEi8JE2xn0h8oV/jDFHl5jhtjAkZ
 vKkXeqMJH5wsD6MVOw9Ci8ndMjajz4mHSzPw3K4WciEy9ZpeAGfvHbALtu7ZFfCDT3TW
 8kiE07HubxAme0lF/1HZL0/Hp0jYHOcANsrQLAHId0vOtwMgJlJKjl8U3QEg8rwq6FIw
 hSHmWkJALcQ6gyMTnHfSq8N/3Rue7/NVcinawc3JPv6jBWEcDKzR3n1095CJf6wt/wwq
 xo4tAtaG8eg8dMeRPuD7tlq1m16vF90GwVsWfv5EASEgWRUsYKPbFRh0Yv7cT6zvp6dA
 n5Ng==
X-Gm-Message-State: AO0yUKUAL8vYazxp9q12m+coz5XigDo1xsfHxu6fP+0wmeP/1Pkw+rpF
 9qXsPVnxOVCfkq+4oe+0/LO0bSuTsuX7d0EEyd0hOA==
X-Received: by 2002:a63:f705:0:b0:503:7cc9:3f8d with SMTP id
 x5-20020a63f705000000b005037cc93f8dmr864956pgh.9.1677869055010; Fri, 03 Mar
 2023 10:44:15 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-20-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-20-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 18:44:03 +0000
Message-ID: <CAFEAcA_0BTp6YL_CEHDQBaNDiE3GSeV4pAFWyYBWRY6OKtTCjA@mail.gmail.com>
Subject: Re: [PATCH v2 19/76] target/avr: Drop R from trans_COM
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: YVd8EV9ulPG+

On Mon, 27 Feb 2023 at 05:32, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This variable is not used, only allocated and freed.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
