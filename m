Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp3355881ejf;
        Tue, 9 Aug 2022 13:51:09 -0700 (PDT)
X-Google-Smtp-Source: AA6agR73CKBA2Kq3eb/cLaNcj3USd2O3pHpf/sETaPyq7uhxdJhf7WP5IJh2QfM9+TJ8WX0e189V
X-Received: by 2002:a05:6214:234c:b0:476:754e:7ac7 with SMTP id hu12-20020a056214234c00b00476754e7ac7mr21081343qvb.114.1660078269223;
        Tue, 09 Aug 2022 13:51:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660078269; cv=none;
        d=google.com; s=arc-20160816;
        b=aiEegUhxsk9b5pjOjEawGLPkQ6LJ8YtRxC7vTmFIXehl/sp0j4n7Xrg65w61N/Opek
         fXEnNhBY0WztsvfEbqG8cFRdu8hVaEdzSoKcEr7HYnBKbk3WgajQpYdynZUGHlrA6r46
         G+bRphEngJlFusTyg4EVfenfReFNHCMcj/g7ifDUqPrBjYUoC4b2mPcOpkA4JDS9hyMy
         E5YMO1GRg9wB3XXuyiWYIleXiEpf/FDlZju4tVj+k97gGWLIIruC/9yecvYWEWI6+KKM
         O7DrDPJ6q/vpzdoRbDK9hLFKp6+DrDRwet3yiHVxc44Nh6w8ZJ5yYgbY3zRbfkGmE6UR
         s3xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=N25F2AJKXvO9lt1Y9urN2LQ10+yqCuRW8/sQDN0FfQU=;
        b=Hl5YlkndZAY/owifo5RqMg8ooFCe8/9PQnY6oXKa0k+uzqZ3EkAJptWVA7wH+MPeZM
         O2kAGQsQZw1s5V+DGBo8Pkobt4MOW0seh04v0HnaW4ckdjzXGlNPJx8dF2jJMCxi2ZYj
         9e8IGNSTFl6onHPN6cEgCiyIOor/08pgmRhoRbDMsUxAzrWsOLNv9au7ubKVrO1wT7Sb
         6U2KphS07mlb8U02Mfgu3dqFtsRD50wImUjulPWG6i+AVxW76/I4I9fAF362Vv0Qnf7F
         gk23DhD4xiwqnbzQU5ykHy84mXJX1cI0j+lgLA322Qe0oh5z0BEtW0us0cRMpe1/eRNN
         Wwgg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="vRqZ/tK5";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y9-20020ac85f49000000b003430869e73dsi1626632qta.626.2022.08.09.13.51.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Aug 2022 13:51:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="vRqZ/tK5";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oLWBw-0006CD-NM
	for alex.bennee@linaro.org; Tue, 09 Aug 2022 16:51:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oLWBO-0006BC-8w
 for qemu-arm@nongnu.org; Tue, 09 Aug 2022 16:50:34 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:42958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oLWBM-0003nV-TV
 for qemu-arm@nongnu.org; Tue, 09 Aug 2022 16:50:34 -0400
Received: by mail-yb1-xb33.google.com with SMTP id 199so20231456ybl.9
 for <qemu-arm@nongnu.org>; Tue, 09 Aug 2022 13:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=N25F2AJKXvO9lt1Y9urN2LQ10+yqCuRW8/sQDN0FfQU=;
 b=vRqZ/tK59tKc6IglnjQxk5v6h5Of/r7H+fUxbJ93cwBYXkeL3MWRvQHScZPqLLaxrl
 rqz1jvUDZ5jx8slEDRYYKuFQ2B+XT5bVjdw7nPswOLUgqaIhDwf5zLkU16JsG8CYt3lz
 YGT+eu1f3I0Nj15SdH5v8bgGOa155z24QajNT7u0+GN9EJMQze5mbkk9naq2MppPibfR
 j+Vi6DSAafhAB4fG7HVlWULeJyyqmvhHj7RrzggU3ZrqXmQ/lXujlYN4YoEehrOKsrbX
 cupIUI9hmAlo4Am9J1WFvaWXUAZdLJ9VEGNOALg3HLnpJhyCMYfTsIZ0pI8hWEB+Ztgj
 I4mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=N25F2AJKXvO9lt1Y9urN2LQ10+yqCuRW8/sQDN0FfQU=;
 b=RIFpKgdK2KnCBb4i5ve2h9YQtWt1/yZhOH02p4w5lb3k1uYc8r/awCbBE4l14O4ZVM
 8tg45P1prlYuIPTQy8b3ms+npbXVzzD5uxOP6Xb9229GLpnUb0NxDFZarpqDyVu7YmJx
 /AuJk0bEnfTo9oTyL613L6jzr6FQDNY2IvPL7Hb/bkXARp8wokNQ6pt0Hg8DENdWb/DE
 mRYOJKmGcY8RWy5kCNAODK9OnGCB8ugWqul2Bd4NZHx2tF0GiIb2W80EbY1BsmB6PLaF
 vhAGhHrmMorPjfs4XfELEcs+QIJY841jxoRl36EqUDyNyVzxakIv5A6L2Ztjn78s8PL7
 y3Rg==
X-Gm-Message-State: ACgBeo2ntYh9WpbthgbKB0RnTgAnrE6ssJ935r7o2NFrApvDb0iTwxF7
 fwFXLPmahdsRcn5zWPW7v4oYayBaJoo/F3UMhbdmLA==
X-Received: by 2002:a25:d4a:0:b0:671:6d11:d14e with SMTP id
 71-20020a250d4a000000b006716d11d14emr23237480ybn.479.1660078231664; Tue, 09
 Aug 2022 13:50:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220727223905.624285-1-qemu@ben.fluff.org>
 <20220727223905.624285-4-qemu@ben.fluff.org>
 <CAFEAcA9QxwtyB1muGCJh9THdGCu3gEvFAqemvYMUHca6Z1PvAg@mail.gmail.com>
 <20220809185016.kyw6kzlqect4h5rp@hetzy.fluff.org>
In-Reply-To: <20220809185016.kyw6kzlqect4h5rp@hetzy.fluff.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Aug 2022 21:49:50 +0100
Message-ID: <CAFEAcA_HAnE9-YqUXA17G30ZHUWY5VqDt6dP+uKciyebofkcHw@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] hw/core: use qemu_fdt_setprop_strings()
To: Ben Dooks <ben@fluff.org>
Cc: Ben Dooks <qemu@ben.fluff.org>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, 
 Alistair Francis <Alistair.Francis@wdc.com>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: tQXUUI9uD45K

On Tue, 9 Aug 2022 at 19:50, Ben Dooks <ben@fluff.org> wrote:
>
> On Mon, Aug 01, 2022 at 12:30:22PM +0100, Peter Maydell wrote:
> > On Wed, 27 Jul 2022 at 23:39, Ben Dooks <qemu@ben.fluff.org> wrote:
> > >
> > > Change to using the qemu_fdt_setprop_strings() helper in
> > > hw/core code.
> > >
> > > Signed-off-by: Ben Dooks <qemu@ben.fluff.org>
> > > ---
> >
> > Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>
> I've had to make a second version, so assuming it'll need
> reviewing again

If you didn't change the specific patch that I gave a reviewed-by
tag for, then you should put that tag into the commit message
next to your signed-off-by line in the patch you send in the v2
series, to indicate it's already been reviewed and doesn't need
re-doing in v2.

thanks
-- PMM
