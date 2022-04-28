Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp1601059lfu;
        Thu, 28 Apr 2022 02:45:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJz8qDD/VyG5uFt33aQs3rtIp/lqE3GGEfxixven14JwTbdf0ZSDqVYhjkjzN2y176fzz/
X-Received: by 2002:a05:622a:1447:b0:2e1:c405:b05b with SMTP id v7-20020a05622a144700b002e1c405b05bmr22541127qtx.626.1651139119683;
        Thu, 28 Apr 2022 02:45:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651139119; cv=none;
        d=google.com; s=arc-20160816;
        b=CKd/PAQHKPnWQzHV6/IDgNNugne8gqeurAiiAUFM+QTjJmFMF4U1LfBNVi4wmaR6Ic
         nhSAiUwq3NSbDVjR6uzHakj5nQITwDDjiv5JCkYLi5d63mlTZq5Xyy2EZ1jjOwtlaojl
         L/e52vNncPINDpcSDY6lyBKEqh9XDD3COQZl0G9sIe81RBcBhHtLwXgEKSruNvHDLRjr
         UP8xqgNYTTAQUikDGx+VNJbRSnwEwP4pYRef5T4KbmhFwXbHqbnc4O/lmu92r16bKNhH
         0IMoPX967j0/oS1q3LO+6OB56rTMWqY/b60aaB1Tq+Tz9r+G2JcK3ay9Q92WrmlvXqBj
         8e5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Pg5cCx0SRvdR0JuG3PVtMZz3oUZSOSf9ETYQ/iSvKX0=;
        b=EF+Gn8comfGbEj8NlI6sNnTOtURAohNHnJcOJtD35XaniK7faXmlXb73FagtxxC/Vb
         f9oR11jugSPEmB0HoWgQ/JnWcP4+aBG27OSfXao4LJmGcwGkTgNkSAiZ9ZP+4nU+BKXj
         ARM0sc0VVZMJdGuzamq/6Yqi8IIm3RqkzidqHOTlCN/StxyYgzUgQK5TaicrwA6meSM4
         vtqMNoi62o0tiqGUSxMqNqPOfojlrVJizWJL2MS7x2U66gFcvQv3nWNJp0Q808qpe13g
         21iMJ5ariUJDvMvzLaOIscx3bybMHZQWpc9umR8xFdw/ogTY3dHNsSegyuXlqVB0tvBR
         9qEA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MNdMhud5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o63-20020a0c9045000000b004443bfb70f4si1443252qvo.397.2022.04.28.02.45.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Apr 2022 02:45:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MNdMhud5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nk0i7-00082i-3b
	for alex.bennee@linaro.org; Thu, 28 Apr 2022 05:45:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk0ex-0005pa-I3
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 05:42:03 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f]:41765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk0ev-0007RP-U8
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 05:42:03 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-2ebf4b91212so46383257b3.8
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 02:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Pg5cCx0SRvdR0JuG3PVtMZz3oUZSOSf9ETYQ/iSvKX0=;
 b=MNdMhud53niq2rqvKA3gq/dpkHM8BVNGBc3bnuiL5RPaXr/od7FuuzRtn9agDgmUe2
 50dtOBlpaLowHIbjmjyWXcSRu3s2DgqhMGhNB2NmRKXzpER5OGzvsZKjYn4GXZqIz/Ke
 UWBXIYvbCRDEKFO0KFUd0M3OR7JIXIOJOyYEs6U2h4o5JphuWVMGrWRLHusnoSbc5UjD
 UZmZ2xi/Y0ZPNcTx9I+efM1+J04iz4cmt6uDYrPSswg2Bpm1wdCEgRodgzR/2iWFGJ/z
 WybKnJk/Wgtmhw0a05ctIWayB5Th0iSvZsVR57UREpVI0qakT0KpWVyv8xG2F4VPR1AN
 mNJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Pg5cCx0SRvdR0JuG3PVtMZz3oUZSOSf9ETYQ/iSvKX0=;
 b=EUSsIbXOYEIh1zOpoOTMNqeJx7tMcLk/i/KjZrReyhqENqTdw99uxpdIXiZ5/u4QU+
 7KaZGgI5be5AjSN2kb9Ph8ZriU7OyJquCYeLNUqcmEP2/wRRDFsAdt1XYKeWypJkZYxN
 mVrQZabOnYcRnjBxOWPUPnC3TLU4a4H7MkK5ovyMxW28EhqDStj1RTrQXphLIIS9RnQm
 bmvQTF57zD726ez9UhyHieRjCfkhdfhRCE7RXma7WbtYX4MdoKa/hAvq+kiguAPFsl02
 wE9nIohMn9+5Gr6T2+B7POZ/fLoDKQKUn2PYfhNZYO6VgzToTWIVtVsnFkJt0QW4JbsX
 JGeg==
X-Gm-Message-State: AOAM5324Jb8fepDFLxiozGeGO8zgaMoMheBffE2BiP2M7Kz8smsoktBr
 CtuD0S1nVB5bW+Kq6kaFdIfLgVEsgddWR2fbK01VkQ==
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr32343678ywb.257.1651138921068; Thu, 28
 Apr 2022 02:42:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220426163043.100432-1-richard.henderson@linaro.org>
 <20220426163043.100432-8-richard.henderson@linaro.org>
In-Reply-To: <20220426163043.100432-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 10:41:49 +0100
Message-ID: <CAFEAcA8NfEM8DOBcgbDo6epm398K4AeXFB2xojNCSUG3N3135g@mail.gmail.com>
Subject: Re: [PATCH 07/47] target/arm: Use tcg_constant in disas_exc
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KY5EA4lKrH/x

On Tue, 26 Apr 2022 at 17:32, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
