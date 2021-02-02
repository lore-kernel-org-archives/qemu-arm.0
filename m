Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp180205lfo;
        Tue, 2 Feb 2021 06:50:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz9HOCLayDcxEFcT9xHn1iXjZyqI8ZBTmnsfb9QAHhtIM3mm5IvNBJz2pdTe/ejvR1Cv1kZ
X-Received: by 2002:a25:d757:: with SMTP id o84mr3980215ybg.5.1612277425135;
        Tue, 02 Feb 2021 06:50:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612277425; cv=none;
        d=google.com; s=arc-20160816;
        b=YhtTsVG0q34VLbM5SrPJCM0pEjDUkl/bZ/ohJdPS0PYUdgeeeNLE/WxSdwP5D6RwuP
         mmaP2Ox6eZ5Jt6/kngvFgrfrNhac5USB7Hhllg2Y9FjX/USR09O0HMhestDkzky62f9E
         4beh6c/7OorqD8k5aRglAfqNmyodPtkwE3LS9RLbhudGhIV7IXSDJu1q9R8EguePaXLz
         4OPg+4HHRAL0khOxhybmeC6X57JPIZKTAj9Koy3XJDVTv4Zk7j+xFTKG6OBC6GCf5sej
         MSPYcRoBX/3mLgwmCKsxQ4zCpyVCcuZM4VujanFwhJBGhfgGUE48ZfALqE47M7tBPJXu
         P9Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8NKQ+Fx583Zc/5dBhH3dK6JgJF+MH3jY6mmFe0o2AZE=;
        b=Ns8tAZdxBmYuL9JedmHJgAMBooNEGwI47ftk7CpK2VrglV+R+MSUyZnAIl7vJSXJOm
         XHqSFamjmiDRwiuKNJ7+RfbBSkpodSCrSQC+NkxCFJ5HlSymT2S6v4MYt3952/1O6S2e
         rkzsxFZJpCfVPj+f4Dpcce7nSQVUm4yimTffwPBLs2kmvpg+wjiKvtM5DnyBZmqNW4tH
         rQdUlq4SvwCOcr0T/wF+FO2S9fWtuE/sXu9criJeQf7qoeiSp7e4GDXYO1QptAlB/P8/
         AIPKNCc3/NXxcv1OICOGkSgWuYw3WG5uszZdCnSJSBNUafdm2sfzPZx/+KrP1PIUbDab
         Z79A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="m0/p6y7A";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 140si10109424ybf.401.2021.02.02.06.50.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Feb 2021 06:50:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="m0/p6y7A";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l6x0a-0000bo-Gb
	for alex.bennee@linaro.org; Tue, 02 Feb 2021 09:50:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6wkM-0000U1-QQ
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:33:40 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:39727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6wkJ-0005sS-Kv
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:33:38 -0500
Received: by mail-ej1-x62d.google.com with SMTP id p20so10955687ejb.6
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 06:33:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8NKQ+Fx583Zc/5dBhH3dK6JgJF+MH3jY6mmFe0o2AZE=;
 b=m0/p6y7AHCBe+LNiK+6oaIJmamlcp2bZwME88lu0jwkBOETP9qko13xTgUlBbvwoFD
 TAr9xorplvIhyvoPZmVzMbQnhJ9u5SYevpY8vSY+fAERqpDX5Yyc5w5wYhE/gGUrrFkm
 qfQnM/BD1EjqPVQFV6vMNCVJsfQFNvInRhYfeh9W92FSVmuSOGF/7FZJp4xXOnEdj1hn
 aGlgillVmcQjYGJVWJ2qWfrn9sf2AwvMMwllkZF6T7RNhUqzLGfDRO70DXRFuYoI2W7Q
 2MJ47XxrVXAXmhQ7GNWQXu7QaRvxPFqIBg9y54QdUdEONYG6Lbf4hlvjxgwHzWuKmn3v
 PleA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8NKQ+Fx583Zc/5dBhH3dK6JgJF+MH3jY6mmFe0o2AZE=;
 b=tzOUoWCfzRiMNwgqBz95P15ha+c+0xf4WyA/uW4E2jF6SgPjUef1clZTb0gdMErKMS
 UO4ss2gL+1wMFvCLHZiykE1CS4OZ3BDtcgmQsrcEcLCE6aKCUvt/ypalfE3GIW3RKio/
 IGiBdp4HqbbK+dCfwUIksA6ULf2SXU3Z5QGPFySZykpM2jRkxlqCy7JJ0hXNqPRdGxF6
 p089PiGlUP/JiqHM7+HLQZP8ChDnnhNsubULhwjdIzbWb8euMzh9FdW8kfzN9CVfQBP1
 Kf36oyP4JrViCk98oX7yL9wmpR5IJxFx9QUZV6JdXGr5NK0/LPXZt1wRA5m2HGsQNE72
 vUnA==
X-Gm-Message-State: AOAM532M8ZrsdB7tQohKXj0/NDSj0BPmROr87RFStwOQJAjswWEVEDwk
 6CqJQ80lrVH49CZURK9NSttzegJBWrgX4lwNsOylRQ==
X-Received: by 2002:a17:906:2e4f:: with SMTP id
 r15mr437095eji.407.1612276413569; 
 Tue, 02 Feb 2021 06:33:33 -0800 (PST)
MIME-Version: 1.0
References: <20210128224141.638790-1-richard.henderson@linaro.org>
 <20210128224141.638790-6-richard.henderson@linaro.org>
In-Reply-To: <20210128224141.638790-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Feb 2021 14:33:22 +0000
Message-ID: <CAFEAcA_sgJFvMhJjtJOGdWB=db8cgLz6Yv=0GsXpGq4Cw2pG=g@mail.gmail.com>
Subject: Re: [PATCH v4 05/23] exec: Improve types for guest_addr_valid
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1uj64abZpqAn

On Thu, 28 Jan 2021 at 22:41, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Return bool not int; pass abi_ulong not 'unsigned long'.
> All callers use abi_ulong already, so the change in type
> has no effect.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
