Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp1152791ejb;
        Mon, 22 May 2023 05:01:58 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4amss0n8e79KDAI2pXUIcqgmU0ZwX2YJPs5zzeWDfL9vcsKzCdP7NFSQDayQRFHXqSh520
X-Received: by 2002:a67:fd96:0:b0:437:dbfb:6001 with SMTP id k22-20020a67fd96000000b00437dbfb6001mr2256232vsq.2.1684756918397;
        Mon, 22 May 2023 05:01:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684756918; cv=none;
        d=google.com; s=arc-20160816;
        b=0x1+wTlu2X7bng9cWUDTm0gOKUMG9NKaEe669Nuk9/HQUnodjwZBj+Nnen4xoWxVa/
         4MDCNOZlf2Nom2sUCWvIqSE2t95fXnw52KKGnJzvLvM7bhfBI16ZZa8Qq3GRtFV2DVrn
         v6SD/5gymm1IYfRn7ZAEkFwJsuKh7oqPvODg+i3qnJ1lGSePqYY69HNE8a913z/AzDlL
         2bXF864baIyYEsndrFWHJls0+PTccOrlamgKhoMrQ07xD989Tuh8EB59rtfaGVZj4Ff7
         aNjARzv5lAbrya7Xlj+n4Kd1UV6EminBfx9iYrp+tRXK/59q37tTQa/xGqpaOhJc7OlF
         IXOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=5NoExjJY2ASCuOV/0s+i6E1DsyrLp/ezztyoZ9LE87w=;
        b=sQnVoYn7UAWaw2NQ1kFeZBlJ6s7+kn7p/3gPAD11qsrKxF9Rhj6bMzq0zyarwRYWD8
         GGRYIxMjHhgLsHm9jc/qZFReGFqvZQE33KHySb+cP2h5WC9PK8PleRjpdNev0rmuUDUB
         AIYd+2DqZeFaKEdRPgInGZR5YR2hHU8ivZVNjd6jq4Z9iANUdOnX1mNrFdU9eqjs756b
         EOxhJ8FvooR80bIvMa3U97gUA2KLDJ7jAV3VK8lyzpP+lqr3ZezQkTGr4p8gviCEai/J
         55AZWus9cZRyQzM/DbUe7p6m15FSvTQGyAKwOQ0T56LxsRs0I6toJiNDIcDOxLT9/YNu
         1QnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JxxtpnGW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z2-20020a056102066200b004389ae6ae70si474371vsf.599.2023.05.22.05.01.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 May 2023 05:01:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JxxtpnGW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q14EQ-0004wI-L7; Mon, 22 May 2023 08:01:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q14EP-0004ux-2k
 for qemu-arm@nongnu.org; Mon, 22 May 2023 08:01:41 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q14EN-0001fx-89
 for qemu-arm@nongnu.org; Mon, 22 May 2023 08:01:40 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-510b869fe0dso10604728a12.3
 for <qemu-arm@nongnu.org>; Mon, 22 May 2023 05:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684756897; x=1687348897;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5NoExjJY2ASCuOV/0s+i6E1DsyrLp/ezztyoZ9LE87w=;
 b=JxxtpnGWu11beu+G7LfdviAjQ5WoesmyUlvyYrfSvp8NWIpe1fZkM2bg2YDO2+oDxb
 ytnoMSSbyeSTlXp7eW99AMpW1VNC+mFUMs4WqgIbi6v9KxVvbGs9XaPmJA6yqRqXTJT7
 htupd7ZWAagTOKy4EMkqcMkDWPVmrmdW69YA4raJwuDXWwoi/wfJvQYC2Ke/Wv8KJ7ko
 YVwlggB1V2R3Gjhf+uiaxh0I6+904USeMU9/PFojta/ymrpQLYN414tNK/u+FiIbiglY
 4QR9OXEiivjMhfqDIYkBtSQ59WL08kHs1EZWo0GKnoHRFhWemQ9KA5jxC0Cof8MBzWsi
 rQQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684756897; x=1687348897;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5NoExjJY2ASCuOV/0s+i6E1DsyrLp/ezztyoZ9LE87w=;
 b=FC/iMRQJKaBAUJCJSY03p1sPAE0MspsLPBs91YYgWpstGL9aIhpIisd4Tjyf8m3xgi
 Y7jDvD+q/es1FLv5zkeljLpIu+68x3Rc4efSHvsFg/ogTOfXueJKK+aX9Pt/sYLBFB4h
 KFqUfW04uwZ05wHQ9+vTzgy2EVyNsYihI7b2jWllxfW9yZhbUoeOC3dBrGmlmj2sHlyo
 xI/1xeqGx5Q+acx5QnDcQSIRRku98hhW6WOYP9fqTBKpzkWaixauPrwvYjQw60FFRL5U
 Y+AFtGCUmRX95KKSFusDlLkb+r5WWSRbnLIQfYrfe0Iavf+0DJHdBi2xZBTL73yC2+Cd
 gALA==
X-Gm-Message-State: AC+VfDzrCZ5NkyY/IUchFAluVCkXt5OSgivQ11OEVXz4oW5DI5TJT6Jr
 FUUX7bvzGEqFOg4S/wywzysuulGrV6z6tj1l1pyO/Q==
X-Received: by 2002:aa7:cf8f:0:b0:50b:c89f:f381 with SMTP id
 z15-20020aa7cf8f000000b0050bc89ff381mr7851532edx.29.1684756897342; Mon, 22
 May 2023 05:01:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230522102910.20942-1-sergey.kambalin@auriga.com>
 <CAFEAcA_aV0DvL3DgqU9SKKRsqCoMrvwbPoomx+NA8fkXKkTytA@mail.gmail.com>
 <e5f053c126a24a62a4e1e8d309d939ce@auriga.com>
 <CAFEAcA8bLr+_raHie4JxoEJAQ7cuj5nJKTYt5+7r6T0w8FFNsg@mail.gmail.com>
 <ea63d09bb2d249b282a429ff9d373e4d@auriga.com>
In-Reply-To: <ea63d09bb2d249b282a429ff9d373e4d@auriga.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 22 May 2023 13:01:26 +0100
Message-ID: <CAFEAcA8HMgJ5_WwC6Mc5E61_KN4kqvpW6AE_EyDf-JcrFVQJMg@mail.gmail.com>
Subject: Re: [PATCH] [rpi4b] Make bootable rpi4b model
To: "Kambalin, Sergey" <sergey.kambalin@auriga.com>
Cc: Sergey Kambalin <serg.oker@gmail.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, 
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: hy33cblkou2H

On Mon, 22 May 2023 at 12:42, Kambalin, Sergey
<sergey.kambalin@auriga.com> wrote:
>
> Aw, I thought the entire machine should work at the first patch.
>
> Thank you for the detailed clarification! I think I've got the idea. I'll split it up.
>
> Could you please tell me what size is appropriate for a single patch?

The most important things for patch splitting are:
 * everything still has to compile cleanly
 * the contents of a single patch should be a coherent single
   thing that it makes sense to review in one part

If there's something in there that only touches 20 lines of
code but is a coherent single change, it's fine to have that in
its own patch -- small patches are easy to review.

At the upper end, I tend to think a patch is a bit big
at around 200 lines, but for the specific case of "here
is a new device" bigger than that is OK, because it's
just adding new files rather than merging changes into
existing ones.

https://www.qemu.org/docs/master/devel/submitting-a-patch.html
has some other advice on patch submission, if you haven't
read that yet.

thanks
-- PMM
