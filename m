Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp1899122ejb;
        Fri, 10 Feb 2023 06:20:34 -0800 (PST)
X-Google-Smtp-Source: AK7set/ZJle3mFVvIbzX85yfvMXZiL+SboQUI0uRZhR4ownTtBkyjUQ1ycyNCDo0BcS+hw4y9s6G
X-Received: by 2002:a05:622a:1749:b0:3b8:6b19:7f95 with SMTP id l9-20020a05622a174900b003b86b197f95mr27321017qtk.19.1676038833910;
        Fri, 10 Feb 2023 06:20:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676038833; cv=none;
        d=google.com; s=arc-20160816;
        b=ab7bOAW2plREemZR7oTo//3wJFsJL92Qltb08I6GJbxWHlFRdq2HohaHldIVJzUQEr
         Wso09r8c+m20JhZ04iq/vPh/UgSOhro/22ZkQp94imCjEj7mASQimd6XfEyIJj31+rlo
         kqU9HJMezFTKladxeg1EfDaL6zkikzgl6bRSJ31pNDtMZBqcsEZTI/arWU6pBkXLPqLl
         /HZnJN0NYXNa3nYj3RgXYBFPxsL92/6WzYusdlBU7feoHKTptDyJGYQ7JWdtgklpysGb
         iThUhmiL/CPewnE51yxA3hDxGZMLVDay+gD0gVlFIiUiIZ0BcJppLQ/o/59GvTq/M7Cg
         yjyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=hTcnDZvycRk5gg/DzH15zsFVLX/kcc04AW306UhY1yU=;
        b=Tt6ifd9k3qrjroO61EbKmNrhzVku5THt09qDP6eIWHIa8mRtg4DQOIGh8LLnFgX1YS
         vNrIe6oaaVTpGm5+DMb8rbx9Wm3vRSugURbiwJWwCLUSe6Wacd0HoC8KeWEp9vwG00/0
         NgO/CSxkGn5DSLx/PPcUqgthn8eyY4tMAKe5rNgKro8yuPCuE1HBHTxmqBmlR61l4KKM
         Fu2/o3ttImc90Q61AEQnRCeuoe3CqWeqTj3QVTyQPnTCEqThzINv9naHq9e26jGXpdtA
         6q+YFue9NNbVbcPQlU6YaX1LsksTYAUvP0pwyb/sWGEQyBymhZ7DK8Phhj4+P5At9U2v
         2IVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sm2Vu4VJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 8-20020ac85708000000b003b8559f2a2fsi3647233qtw.705.2023.02.10.06.20.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Feb 2023 06:20:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sm2Vu4VJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQUGJ-00057h-ER; Fri, 10 Feb 2023 09:20:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pQUGH-00055Y-DP
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 09:20:25 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pQUGF-0007GM-Q8
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 09:20:25 -0500
Received: by mail-pf1-x434.google.com with SMTP id a5so3539513pfv.10
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 06:20:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hTcnDZvycRk5gg/DzH15zsFVLX/kcc04AW306UhY1yU=;
 b=sm2Vu4VJObc7i07iHlCgDeD/ybLoM3mI5/utOZZQzDzg5RxPhFV2cP+YrlFJtFyFga
 vktNDw76BCfOxyaRegz0uF4br/7zkEcp7LxKyQbeZphNRVqC+jWHhFOvC0CbdssDnGuk
 4OqNlu2CLGFIquhQuArg9Avx8UdC/Ciywk+BOtu9hyxg+efha1cTVfYFb9Su6pBhroz/
 yaGqvMzzRFyPbpO9p93fh4qTJUIXKKImR4gAqK7OBW99ggg6Oykq1L5er8/51xJTaV5o
 bI6zKy9ig6d2fLmT14nwMgy0AP9vTdm8gLwiBgop7CG2Ea5DAA0kddfGBAYA3dGgsN0+
 BFDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hTcnDZvycRk5gg/DzH15zsFVLX/kcc04AW306UhY1yU=;
 b=JSBRTDOrpW73sKTlfH9UnLr2shtLKq+TGsCRlc8KSr8gNyv0iZajPmL7QDCYAdw+BD
 zEKmDj0Q1eFS1ox6EeayXSQZQt3YQM/Gg9dtnome5HHVvOyu60Qr6QoGbQn75bEDU8XN
 ExZ2OI8bb+5Yu0E7ePyetCZ2OLgFvd6FodHSHyJbGCi7O1uL0PuHLPfTl7HVpUyaRVl4
 IW10wOoRNxPdIHhNaRWNm6+pziAPyEsR0tIbZ3Z3sw3zyU+eK6vTUitgoOZhH2mpBiSp
 0+440iAgDeXaVK7TUQEq0czVFKiw5HVUL7XS05Q35vNlnXzs/OcqfxIB6WEvudSG+KX8
 Nq4Q==
X-Gm-Message-State: AO0yUKX9M+oX804cgbvHo0KbOdlye7GVVO6+WI9IbHluvKoTqVFYp3gu
 w4RhKXBZzewEUR7UkqoUUYGIL9ghh4CrncfuzcmULw==
X-Received: by 2002:a62:53c6:0:b0:58d:a84a:190b with SMTP id
 h189-20020a6253c6000000b0058da84a190bmr3353385pfb.48.1676038822008; Fri, 10
 Feb 2023 06:20:22 -0800 (PST)
MIME-Version: 1.0
References: <20230124000027.3565716-1-richard.henderson@linaro.org>
 <20230124000027.3565716-22-richard.henderson@linaro.org>
In-Reply-To: <20230124000027.3565716-22-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Feb 2023 14:20:10 +0000
Message-ID: <CAFEAcA_NQ=-nS4qQ3QQE6_9fn01YkJgPiwsPq6XDCCpYy4NkjQ@mail.gmail.com>
Subject: Re: [PATCH 21/22] target/arm: Enable RME for -cpu max
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, yier.jin@huawei.com, 
 jonathan.cameron@huawei.com, leonardo.garcia@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: pOY3J2KUF76x

On Tue, 24 Jan 2023 at 00:01, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Add a cpu property to set GPCCR_EL3.L0GPTSZ, for testing
> various possible configurations.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Looks OK, but I think we probably shouldn't enable RME by default
until we're happy with what we're planning to do at the
system/board level (eg should it be like MTE where it's only
turned on if the board has support and turns it on?)

thanks
-- PMM
