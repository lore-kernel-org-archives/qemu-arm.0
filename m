Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp1172891lfg;
        Mon, 16 Aug 2021 02:05:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzL26jlG70761uPLKT/RYolTYO+aVsLsmiyz1JdTSboCCqr4PY8jnXHIyMA9cDepI5Duqq+
X-Received: by 2002:a05:6e02:1d95:: with SMTP id h21mr11016554ila.23.1629104735098;
        Mon, 16 Aug 2021 02:05:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629104735; cv=none;
        d=google.com; s=arc-20160816;
        b=SnzRgdY4ekARRCCeU+M4yiPEX57J5QuPWPdxtvKDqiJF8WE91UqObUCPO7oyNRYlOY
         eRF7JuR1thANKUYHZuamztf1AkyiERjQUCD+yOUnPPZkfk9DUWWX3j/HCviXorn+zUcZ
         QXeCStFIC56OXnKp4IGc1u/YKEiAJAMG+eN9STa/mEojyYOCxd6u0ABF+Z1y5YgsixyS
         HMFxGPI1tgGycxjGLiZW544xT0LJBXA0lJ+cQXfjC6B22DOAPGkN4uncj2d/S2gcn5li
         AW/7SiZL2agq3yfHoZketJ91WgNiecaQPqGnZizqKD93xQ7iiRu8LqvbuJnn6SqsV3N2
         UeXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ngdOHMoTAGAcguy3SJxbCVoEpx2LoPx939SAg80Y8pg=;
        b=Ep29+ERL2bskpA+I2zhXsHfk2rGhf/v8bU6LzC8OQFiGgq2B4xYSheG9+adkRUDfI3
         PWIoGIgxEFE7NZuEkkF1/JzY/VOC5xjFRW201DrR7pJ50ZBjWGG2OcCIlHqvdwpv+P3p
         Gl1RI9a5iui9te6Et5T1QqXAJDRc1XXi86vZzY2rBezeCSZ77Z7CH5HnbQH0dvaCZHr3
         52OTvfFcsRpM+HzDTQqwtxHMMGMWBkQbnAs9CVnf1WovSXLLyl7wFGVTCwTXg4Pxabo0
         pwX1VLGO8owDmdiKgaa62t0u9uJtISRpU2bFsfgmWmgpB37fGqSt6TA4NDs3cQOqQN5V
         mVJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U5Ug5dVm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r28si10505922jap.117.2021.08.16.02.05.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Aug 2021 02:05:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U5Ug5dVm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mFYYo-000298-Fg
	for alex.bennee@linaro.org; Mon, 16 Aug 2021 05:05:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mFYXw-0001IS-EO
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 05:04:40 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:36701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mFYXv-00014A-4Z
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 05:04:40 -0400
Received: by mail-ej1-x62c.google.com with SMTP id bt14so14632630ejb.3
 for <qemu-devel@nongnu.org>; Mon, 16 Aug 2021 02:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ngdOHMoTAGAcguy3SJxbCVoEpx2LoPx939SAg80Y8pg=;
 b=U5Ug5dVmn0hp+thyJ+yi00R2ZffqQsbW7aGEx7mtkUfT4zgCf2ROVeUMw7MDaWI9RR
 2isfeesMguDlgDGAUe0H4VZylb9L9ciMImF/IPzjV/cIbMJzjF/IZk/mC7mQatXTrK9j
 4fJlvSwaCXa0LndMmw7Z0FylRCbprA7V++l7TLHnyf1dzfNXO0WxwcVetXXgZP6rfEVt
 zizbv8wHA7pIjVKzwUz6ET4Ee19RFKeKxmJtX7/vs5HWwyBUOVqKqBt75z5yHZ5pKwia
 wGCEo60GVKnP71yIvFU3zaEEgEKwNAYZTR1hu056YLKaMwPACggGUmKojcxtxlOOVFae
 13sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ngdOHMoTAGAcguy3SJxbCVoEpx2LoPx939SAg80Y8pg=;
 b=bJx32DU7/t4ZBGPBvUrTI8nzD38J2sY6UnSdgl5L1/9qmSIxOxl7A7AXxz8EeOKBuP
 cRZjlngtweGZltkWStizRd1g7F3U8o2jvgaavtDE4Qh4ql5mOXqOgz/rgf+fuDrNGRzO
 pB7hN3ZuzwnC9F8Ko/j1VRtO3bHktK9Hm0OD5JhhFjxNvWRJFv7qO8RbNN/cCzy8Xj+/
 o1wYzvtERrg73B/BqhD2GIwR02zgxonmXbWYvf/zhTQ6z1NibFEOU+Lh/u7e9FBTiyno
 FuhYwzrsT3hra5n+9XC/xzBxnXadMq9N4D+/ZrA6xAGXmRYPtHWyyjrE6P/iW31R3cSz
 ew/g==
X-Gm-Message-State: AOAM530HizNKLpJUIG2/QhF/xZl/PY2qW1YEY4BDpFN4qEJghsWMIVLg
 u7RvgRHxmc3cUqcd9rDyu3P7P2i8OH24fyXYvh99SA==
X-Received: by 2002:a17:906:c085:: with SMTP id
 f5mr15357030ejz.250.1629104677730; 
 Mon, 16 Aug 2021 02:04:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210813131809.28655-1-peter.maydell@linaro.org>
 <20210813131809.28655-6-peter.maydell@linaro.org>
 <3e3ec979-4348-c3b7-1210-50dfa66c2b7b@linaro.org>
In-Reply-To: <3e3ec979-4348-c3b7-1210-50dfa66c2b7b@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Aug 2021 10:03:52 +0100
Message-ID: <CAFEAcA_QCLKPKx41cknfGRrQ3r8tK1G7HauRM+XEzns8YxEe=A@mail.gmail.com>
Subject: Re: [PATCH for-6.2 5/7] linux-user: Provide new force_sig_fault()
 function
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Zwc/38lnxv5U

On Sun, 15 Aug 2021 at 21:10, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 8/13/21 3:18 AM, Peter Maydell wrote:
> > +void force_sig_fault(int sig, int code, abi_ulong addr)
>
> Better as abi_ptr?

I followed the same type used for 'addr' in the target_siginfo_t
struct definition.

-- PMM
