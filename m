Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp4284349wrs;
        Mon, 26 Aug 2019 12:08:28 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyXpLwZAXNdSOdmJCbQYiTrQa75sIFVdfXqauDJt5J6uxTAmb4Zg3hPxyfQY/tEuQoQjhMx
X-Received: by 2002:a05:6214:722:: with SMTP id c2mr17009348qvz.74.1566846508620;
        Mon, 26 Aug 2019 12:08:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566846508; cv=none;
        d=google.com; s=arc-20160816;
        b=LqY/Yg3bhUmuQrhJU/KxKEf4h8X1BmnF1gHWCcek6ku5gQ+eUhKiEqsJgK84PlPR27
         7pw46lGlUtthQgJ9DQtSrm6RjMQWkkz/pgBFl0bdxKLPzoHWdCUah1//brLMdmmxI9Uk
         a0/EI33aNpBN7/+XnfX8REP0CEAAHd5IQBPQVTxNIXFQMSmkHnc+IuI5hZ5hxC0T6ZW1
         vCKVf4PuG/GXY24iWh7oL5sRYkRC0we3u5EyNvFrIcisK9aI7YUZOv2GXWUVa659tkiy
         zrGg7wMJmwsjX0lK90uEra62ugLffrSnk/k4frpmtDJrFDHPYtfSooz4+iwuVH8OBbXt
         YDjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vCJU9i8aqvr04aQ6i0EfwlW8XMIwknWX/OBeWiLEgC0=;
        b=NK9u854pc0jzriwkDkbnQ1adehV3zQTQ+9TbNsLeOgknx4MNVG1i2/moHv3quwipX0
         cAXwEcOu+uPHWYYxrd7fQn+q6EB4v1p7l8zHpZvGS6dRqTq9QdF7h5uCiqpz6nKFYb2f
         ASsDQDn7CF8vpJmm9nhd0RGKuf8s4J3kMwJ4UONmJF8SowZTeE/Rjtd930sdTnOAVNiO
         bblhfRNTxv9VfQdHkY0UgJvGbHdnLQhbZVX/si5un++CtT2ObvLgMkC4Bla8wq306rlj
         YYA+BP5xynEgS62j5l1W7/wmj9LvKNckhsBI1+bV/4Iy9thVXjCNM3a3M4SFfbRhGHSs
         GjVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PbmslqeK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a42si8754562qva.5.2019.08.26.12.08.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Aug 2019 12:08:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PbmslqeK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i2KLs-0002W4-23
	for alex.bennee@linaro.org; Mon, 26 Aug 2019 15:08:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36386)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i2KLi-0002VR-I4
 for qemu-arm@nongnu.org; Mon, 26 Aug 2019 15:08:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i2KLh-0003Xz-Eu
 for qemu-arm@nongnu.org; Mon, 26 Aug 2019 15:08:18 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:38142)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i2KLh-0003XO-8e
 for qemu-arm@nongnu.org; Mon, 26 Aug 2019 15:08:17 -0400
Received: by mail-ot1-x344.google.com with SMTP id r20so16247147ota.5
 for <qemu-arm@nongnu.org>; Mon, 26 Aug 2019 12:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vCJU9i8aqvr04aQ6i0EfwlW8XMIwknWX/OBeWiLEgC0=;
 b=PbmslqeKsaVBe1CBmhxvtwz6/k0hW+4DZXSZ1PMobVAZHyIKPtwEPjKeBJ4OA5RgIG
 1/KTKjjRXvJ+XJUbbU4WbJ5AN1gBey8hOUuS0jtez409/nTtIQsJ96A8uGFMMuafDa2n
 Xf7+NgF4xenakd8+Ld6z1C08Hp8FcFGFXH75vdJHbp5nysEYAmcUhNfJU0Q/6pLdSliQ
 tkTcZ9Rr8HQF5R7fzCcleaumZUVD9SVRruRPOPDVQdAMkAQ1cIZlA0dW0z3lP6qVvzAI
 eJ51afBD93EHt/8YLfjMzzvBlAzYuYbl8nKapZuG9Ibot7zB+7frS50PECLvvvYqgUjr
 EtWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vCJU9i8aqvr04aQ6i0EfwlW8XMIwknWX/OBeWiLEgC0=;
 b=jrlGQ65ygqnfB0383FzxNvrS6BZKmexp0P2iSvWvpduTDd2e9niPce4zenbjnzWsZs
 jE9UcembyPpHZEjw28cHEZZs3rnXE+BVVuubcOKiZuGD+F6F2uBmvULTMWlYDQyK+5cI
 qXVKgPM4SHwvFAcW3sTswrz1e7Aj/jmcjjBXLMFyacTSBJveZFe4YjrjI+77+fXIN8Eg
 5NDwlq3SkmKvPTEIdjendkpxMv9kp9t7IEfAjBhfsDdmVKopxW0djskpfehqcMuDpDON
 LXm5F+H1wOYmq/rC9HMuhoGxbWveYTru2FeFBFvrrL9IX4/NuPvIApXWPvR//CawdGEM
 acfA==
X-Gm-Message-State: APjAAAUKgLhbF530I0V0mEXorv8xzyOkEQ8/g4Dk3pFVGGHo9d7Ch4R6
 o1UddZM8Y5QYzVGCNt/J2Jp7RaVSsCJW5R0F2GTxAQ==
X-Received: by 2002:a9d:6a94:: with SMTP id l20mr16022310otq.221.1566846496219; 
 Mon, 26 Aug 2019 12:08:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-56-richard.henderson@linaro.org>
In-Reply-To: <20190819213755.26175-56-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Aug 2019 20:08:05 +0100
Message-ID: <CAFEAcA9OxF20x_aBv-D4GUMx44LWUn8wgwLQPm=ZkQBZ7oyZmQ@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-arm] [PATCH v2 55/68] target/arm: Convert T16, extract
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GKv91V0cXHkC

On Mon, 19 Aug 2019 at 22:39, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 14 +-------------
>  target/arm/t16.decode  | 10 ++++++++++
>  2 files changed, 11 insertions(+), 13 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
