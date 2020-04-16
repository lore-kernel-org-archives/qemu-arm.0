Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp1800719lfm;
        Thu, 16 Apr 2020 06:17:01 -0700 (PDT)
X-Google-Smtp-Source: APiQypJW8V8QhZrvcMhyRWpFRAcJ1XwHiGUWmGewIxXHTxWajFCn5ylSqzOqxqvk74sVmLkSrVP3
X-Received: by 2002:a37:aacc:: with SMTP id t195mr14959562qke.464.1587043021074;
        Thu, 16 Apr 2020 06:17:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587043021; cv=none;
        d=google.com; s=arc-20160816;
        b=MzWTQoZY6tQUgd5rffW8+R3DT6+zXEZoRP5DSZ4uxTPwXgvyTr2ZOiY/8+iJtvNMsH
         PGhVh9/BX832Tr+gre/H89OA6GrqP5JhKZsijjmA/V09sbP8oUqBPrb4IxIQuTtCdHA5
         AwQHMx3Y/3hNGrkxuZA8zGR+3to8LuCENC7LaZutTN6kp8nz9UnS9AR2uAL0zmn/uhqY
         E1inid2/W1Ba/Uh5xXXnmvWznHi4Z/o8v4aWrBK/Ue0kO6Q2aqiv0t4tRR5eFDL1S9mP
         b1Qmf8dQx53tGcdB/McgsGvZZC6XKvd7FfeGz2C0STspS7/OEHTFe/uL1O1GtMl5OfeC
         0FyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=A9OFyrGh0eE1YABFUF+nwyRCn1JfdgbcSY8EmfJuFtc=;
        b=N0r0fiy0R7fcAWBxjEOFjF1ONIqSdvjSCb1CuT6gCWVGD1LHbcdlwHr8CS8hoLp0kU
         Bi0ZqLWtm6RBtuKkXfPKZVQolWjD4Dt3i4WZhByNfbQ3DuTjLiGrG+uaahs2zpHFSs1o
         pRMx8Z/EWJ3VV9yZEbjJNZY+viKr30P3hW3+YWJl1bw2Dszmo4qgbeRgGmQVrl8PHLU1
         t6BVWlGOTvTJEUlaBWiW5nSPY3CWReygNPNKd8SQDmU5NnYUE4QI+5H4E+K4Bfyiug22
         4qGZHbO5m5zi+rcQCTkNiGPBMLvDfvwc7FAVjFaJygn0c06LnTUFXp55TPEVeTyfA8e+
         2QkA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vlhGFYIe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t15si6351325qvm.179.2020.04.16.06.17.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Apr 2020 06:17:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vlhGFYIe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jP4O4-0004BQ-I4
	for alex.bennee@linaro.org; Thu, 16 Apr 2020 09:17:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60271)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jP4Ne-00048h-0V
 for qemu-arm@nongnu.org; Thu, 16 Apr 2020 09:16:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jP4Nc-0002cO-GA
 for qemu-arm@nongnu.org; Thu, 16 Apr 2020 09:16:33 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:42960)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jP4Nc-0002c4-Bl
 for qemu-arm@nongnu.org; Thu, 16 Apr 2020 09:16:32 -0400
Received: by mail-ot1-x341.google.com with SMTP id m18so2976555otq.9
 for <qemu-arm@nongnu.org>; Thu, 16 Apr 2020 06:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A9OFyrGh0eE1YABFUF+nwyRCn1JfdgbcSY8EmfJuFtc=;
 b=vlhGFYIe6ysFjF3D2qEWeA1nBBEqJv6zaZGPc1YCcMuVof1r6ZdHL2mbSS/Mkx92L+
 8QtsSwRz1k+EKtXj+mt9ScO/yKbxXfkYcDBvhhgZuoLia7S+hVCL7MbYAzSz5AjP2Hpt
 /YRscDG53218V0kg7qoUgqF5ZkscgPvTCzlBcsC0yy6MSzrwlqQDH7UY6DDtXms9RaTI
 yBi7e0Pn46KlUWTiqglu4fraE5w8A6LRMa3NiwZwSZomMP4fM2wd4UX6fi6wjTAq8cqg
 FVJLroT+juqzYxRFg+4dBPKL7g8fntOtcrEhGS5ypvZPPd+RmkBnQW+m4pFSFQ6GhY/i
 z9mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A9OFyrGh0eE1YABFUF+nwyRCn1JfdgbcSY8EmfJuFtc=;
 b=YxQyjqKb/6Ov5ZTC0FN2MICKnqd9Pr0y0Ggxsqfcs7ik1WpVyeZLNftdnUiiVPQYg8
 Y00uxhgbTlRzq5ghhgR4JdO9anXGYw9hDdiOHeVlsoEUNRGLBO7Uu+yWLBHgTr9E2seg
 qy5RRjPKHHlGTe0e5sxMLOeVoIjHLupiLcQCXIxkp02W8KPaYvtEMHmGuAhtmGfz0G1b
 PU+fQ2goY/VIQHhMXZMdicR7xI2qZoKdIuFQsALP+nRy1/nbhA6HUaXWn43z4F0jdE3M
 DBNZAT1ZM/qF/0QuQU4Rfyvj0/pHf8xa2g/AqAqqjhjd8Q5v+nW3cwNCawGnAdb3OOeb
 nrrA==
X-Gm-Message-State: AGi0PuaQtL/BMQ9GVtOSMVFG9JSvMOPDphSOfTFttnNMSxsWbDK6qINA
 +37cCNByhVB87YmZufx2bJk0hdQiTWJsvVr9Z5G57g==
X-Received: by 2002:a05:6830:1f39:: with SMTP id
 e25mr27010878oth.135.1587042991330; 
 Thu, 16 Apr 2020 06:16:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200311064420.30606-1-richard.henderson@linaro.org>
 <20200311064420.30606-8-richard.henderson@linaro.org>
In-Reply-To: <20200311064420.30606-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Apr 2020 14:16:19 +0100
Message-ID: <CAFEAcA8K1A00YKQ3VH+0=3M3j_JjTV-pEtqkNTWvft5tUoNs9w@mail.gmail.com>
Subject: Re: [PATCH 07/16] target/arm: Adjust interface of sve_ld1_host_fn
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
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
X-TUID: hqlb8pUuYuRk

On Wed, 11 Mar 2020 at 06:44, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The current interface includes a loop; change it to load a
> single element.  We will then be able to use the function
> for ld{2,3,4} where individual vector elements are not adjacent.
>
> Replace each call with the simplest possible loop over active
> elements.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
(I haven't attempted to verify the details of all the
arithmetic, but I assume you've tested it all...)

thanks
-- PMM
