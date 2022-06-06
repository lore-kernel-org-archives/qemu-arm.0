Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp1332578lfb;
        Mon, 6 Jun 2022 05:33:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw/JWMVuaMIgxI1KxemUgHlkNkwt4n3riiS71xFCoeQT19FmSkLi/TFP1JTmNJwcsBBuMkd
X-Received: by 2002:a05:622a:514:b0:304:df73:5240 with SMTP id l20-20020a05622a051400b00304df735240mr12602985qtx.141.1654518788853;
        Mon, 06 Jun 2022 05:33:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654518788; cv=none;
        d=google.com; s=arc-20160816;
        b=UfEX5yrT7ArrKcpff6TeTfyi+tBfmqoR6Jb9kBIQ8cj5CaKGsaqLdo56jkjNGI3nJ8
         lGGChDMC9rLK/DKHgqnTDitr6OQYeEmXakxFnM6eDGKLS5mwPgz4/oN9R2hDiPq0Yq6V
         gWVpGYvvPBe8ijS+n9RZyX7/hY2Nr5Y6aUiDLorllbe8kukC8RB8bhKYMVyVD7z46YLX
         DxDRlB79aEgqRCSVXuK8wcymz05eXhHb5B/RVE1ibRw6whKbNgcqEHfZkRQ6+DEpdE24
         Ua0blV/gkpjIGK0KZWmmOb9H7AH/oAx+3kCZPYL4waAHfJS0qRnavhS4TUg9CigQ6qoX
         uCfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=ltl3caQJxh/EIfkLlzcIoJbBLSHc6/ZB2lvJGACPr5U=;
        b=utS8BPJbqcnqPb72j93KjxB04EOUjM8p/bd36tYeu1E72666GM+g7f9n3/Kplfhre+
         SxMYtHqNOEbZlUTPi5yiqlvInG8zi6kusBjFwroyhaQIFC8Slwpk5rno9OV0SHO5hEeT
         9NHrafl5JjoQRn4lCYq1xMjDK1EPaFPW5IPwoUYNZqiLsDGxMDh3n3g43Ugr2Egr9mYs
         M4UipMtnLSkRaBONRDHarh9RYuuu6hgoLFM3ztvxUqRZUlMxPQTJCqS9jeZmS0ofpTSN
         HTJ4xVe5ARXrPU2RLP8j1Rh1ZW2FRdSGv2vrUca/1iS87hfZgZu1FEP6yOaVadPzEOxX
         9Nbg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NdZHsxgm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h11-20020ac85e0b000000b002f3f7f19090si8083212qtx.275.2022.06.06.05.33.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jun 2022 05:33:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NdZHsxgm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nyBuu-0002wq-BW
	for alex.bennee@linaro.org; Mon, 06 Jun 2022 08:33:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyBpo-0006LT-UI
 for qemu-arm@nongnu.org; Mon, 06 Jun 2022 08:27:55 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:44546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyBpn-0001Qn-He
 for qemu-arm@nongnu.org; Mon, 06 Jun 2022 08:27:52 -0400
Received: by mail-yb1-xb35.google.com with SMTP id a64so25350394ybg.11
 for <qemu-arm@nongnu.org>; Mon, 06 Jun 2022 05:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ltl3caQJxh/EIfkLlzcIoJbBLSHc6/ZB2lvJGACPr5U=;
 b=NdZHsxgmQGpBa555uL7cmwAeyU/yTN45nviHY9m2KU4jNr496/3XNkiqZwcfC0K7AQ
 72qNSegEkID8PyOdY97AqbjwYTVKWfvcUwOpdRmYzaz9WveIU+IiBfQ/QrwG0XLrOxpd
 jl39hKbOImru4+7iGjLxzDPAhFtjrXqwY/jP5CY+jhcAHxXdsS838A509W4twwdIl29o
 7L75IsaP+azXgX79mL17rZwCOzlIeNG7PEKqko5psOwGBTNm/pG9p76RpGsKZrWM7YwC
 jTKi5tObmF3FCyQjJhx/sTpCJgCxGsk1IhPUFMeJ9ko+gLHTlh0nMJIuufrGyxM9pK9K
 qAMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ltl3caQJxh/EIfkLlzcIoJbBLSHc6/ZB2lvJGACPr5U=;
 b=FQyATsxo4Ou3QVLTpSUCd7py8rXJ9dSEd78uKbb9JhMtafIGSegWCE+4XtTS7RCRai
 IPfBoFjvhRacPSJNizyzbrk3gIiSpIh+JhzKtmCbmWR7f59DCPiER43R47erKnAXF2Ij
 liZ3i92CMZoiqvhtYZ0yViMLkUWifPIpnVUbj7YCcRX8ua5GAa5bxSBZbSqKWvcCMqOa
 3qwzc8dXIeN+KGjfAT5s1iZh/i8abAL2zzLqG7LSN0AQQoddJPPqqegTebWGflGw1Yuk
 Jd2myDAWYCsruBdyVToFXFc73KokkK5SKAglfW/13EValstWoIQGwlj9TF19GTNndE0B
 EVLw==
X-Gm-Message-State: AOAM531Sf0eRfTiAkaUx93riZ2wbBMMLwNgwT2JRsKH3ZEW6s7ekCyCi
 XPdo3YQbYe3aCemJS8f8jg/EYhrRcIR5RVe6uUTWm1RbZlM=
X-Received: by 2002:a5b:6c1:0:b0:633:b5c7:b9b7 with SMTP id
 r1-20020a5b06c1000000b00633b5c7b9b7mr24950897ybq.67.1654518470951; Mon, 06
 Jun 2022 05:27:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220602214853.496211-1-richard.henderson@linaro.org>
 <20220602214853.496211-10-richard.henderson@linaro.org>
In-Reply-To: <20220602214853.496211-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Jun 2022 13:27:40 +0100
Message-ID: <CAFEAcA_5sVZwk5hf6S27tNeRkiLz+htiTo3oZqP=SdBHciVcuw@mail.gmail.com>
Subject: Re: [PATCH 09/71] target/arm: Do not use aarch64_sve_zcr_get_valid_len
 in reset
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: RLCEL9HnUma9

On Thu, 2 Jun 2022 at 22:56, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We don't need to constrain the value set in zcr_el[1],
> because it will be done by sve_zcr_len_for_el.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
