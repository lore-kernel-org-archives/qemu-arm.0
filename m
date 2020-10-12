Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp832793lfa;
        Mon, 12 Oct 2020 01:08:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwqp8jL2afozYh3I5iCAVg3puc2MR87gPbGihDKo5cl5DR9kGgQM7g2ckpEZV2tBAQ3xC0F
X-Received: by 2002:a25:aa53:: with SMTP id s77mr31275328ybi.413.1602490091449;
        Mon, 12 Oct 2020 01:08:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602490091; cv=none;
        d=google.com; s=arc-20160816;
        b=QTEwblB4ScQlk2dUdz+xCJ1iVS4aM5HaFbT2vR7QZSXbD1aFe6dtLRo4sp91UoFI4S
         rNoIgCOEaAvzMaCH1lT1Pupqz+DDZpZSQ9CXqBomJt4SKnp2wPpVD5LXso5lE59CzBD+
         nDiT7o/aThIEcu+0T4BxIIKQQykth7Eaw1Tl7uRZ4eMgFzrURPDqjJvmm8jnuqaYvYSL
         5OHNj+Vei7ipKbqBoCHyjVHsDV+9RU/uJy0GpdYTuCK/nWPgMJIKDwMR1rKMIC9RxjkX
         3UWm2RfNPtgOubUDn/l/VrD2tgS2VZGyMkrSuSxs/RzQ6rAjklp61ViZIj/kheeli1fX
         L4cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BWDQO5aPrAfLfnQelq3/3NNlBK1si0DmmIdvr2r8kNg=;
        b=boyfS0Yv1p9X9jg3WIUM3StjAU1kTy1P0G/C+91ijYDmZlo6MrMI9J0cqi9dP/A8Um
         EwnSWwjKGa3AlQCaMqanvdSD43VUQd2heys6ErUNrD4hLBY+zJxRq/RmJ1GMhDJwIxo/
         Pflm8z+2gOqL4hUkp0CFTgLNh+MrBWpGGOcE6QICF2MOgWyj3BTkmeMy5K3FnNBZADd6
         j6Hxoz08qLxRNF9QFe3cb9SfQGTV+O8of8GjdTxux3AKCkcMrbN7KLAp1ecDz85Q5txg
         1ekCZYjMQvV2eHhN83DSY3xDuKUuFd4g/xJqnH3KHivyksGsfI+nIt40RbmCUoNolF7r
         QVMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IwbT+GU1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r4si14655480ybc.69.2020.10.12.01.08.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Oct 2020 01:08:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IwbT+GU1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kRssM-0006r5-SW
	for alex.bennee@linaro.org; Mon, 12 Oct 2020 04:08:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1kRssE-0006qo-QS
 for qemu-arm@nongnu.org; Mon, 12 Oct 2020 04:08:02 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:39895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1kRssC-0004pP-V2
 for qemu-arm@nongnu.org; Mon, 12 Oct 2020 04:08:02 -0400
Received: by mail-pl1-x642.google.com with SMTP id y1so4627814plp.6
 for <qemu-arm@nongnu.org>; Mon, 12 Oct 2020 01:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BWDQO5aPrAfLfnQelq3/3NNlBK1si0DmmIdvr2r8kNg=;
 b=IwbT+GU1M44w/A02IZ6ldAQqSgsFDaNcgaQY5Er+GH0cfF8buW3/uVhsgiozAXh1PO
 FBW3arADSVJguipvFIYs/c+sl2A7/zw8x0IKG/S79AY005INvpAw7vii+rFIXnBUfTvh
 CDJgqFdOcMtBY7LldLEsptDn97K2ScIgoUtz/MzaKqW0nJFRpGxZOUv0aPNe9y5oGQ28
 ZP/3kqiCqMtwSmuCUcOECcOlQy1UX5+8QHxCx7LP68lWC9PQrvEgvoGC4XuaV6ZRRdLG
 VXL+HzmaiQalU5Jh0SHEg/OLMcPybRUYpYFmV6sYGkw/xQ6zwyPczKQ/KesEAoQQn10q
 y5dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BWDQO5aPrAfLfnQelq3/3NNlBK1si0DmmIdvr2r8kNg=;
 b=enyDaNob+gked6u4ZgJ5lAlvHooxpOhPzRG4Ugs/PswP09EmqXI1IiKfTNvd6qJPT9
 vw3U0vdohNU8ZzjLTLpLQAjJBTCd6tGP1XStvV5HI+x5lvCjIq9tSBC9Lq/HEITzE03U
 cFVkDkCKgoN/8TMDwZzXg+PI5BoMyAPNNNmfw2bsnN9RDJDS4i+OeyREJpECVGbXJEzF
 +h5IkH/pVakMWvpRDzl0pCMTn4Er02NMT5b1KYI6djaXhNCsN8dp4g6i6LsH4r+QK1vs
 xhpjB/Q0F1stAmtbaetXTcianaW39PCsvh39ORgnKU2BQ9Y9jkPE6nDEtfyzX8U80+BX
 HgDg==
X-Gm-Message-State: AOAM530Urchg8Pz8HCvhjaqj6InNdsp2lEEHulHcwSR3gmiTrwXxylGh
 Bgl8+9edFeTx5d3BZPy8BK5Y5QnaBBda+VlPZ9iqlQ==
X-Received: by 2002:a17:902:b595:b029:d4:db82:4403 with SMTP id
 a21-20020a170902b595b02900d4db824403mr4334605pls.49.1602490078807; Mon, 12
 Oct 2020 01:07:58 -0700 (PDT)
MIME-Version: 1.0
References: <74151CBD-4750-4E68-9127-21076C019036@getmailspring.com>
 <CAFEAcA9cZPgaHGuCs0J20YJ48V2eXHFFRsb9a56xFULjtFtn3g@mail.gmail.com>
In-Reply-To: <CAFEAcA9cZPgaHGuCs0J20YJ48V2eXHFFRsb9a56xFULjtFtn3g@mail.gmail.com>
From: Maxim Uvarov <maxim.uvarov@linaro.org>
Date: Mon, 12 Oct 2020 11:07:48 +0300
Message-ID: <CAD8XO3bE3PTrZjxHVWE3_7Dif_WXySSnQTU=kf_yekFrgf4J3g@mail.gmail.com>
Subject: Re: Re%3A [PATCH v4 1%2F2] hw%2Fwatchdog%3A Implement SBSA watchdog
 device&In-Reply-To=<CAD8XO3YmTC7fzxttg%3DQLMpJbg7uLogatxN7q7vf-iGZjyQLjjQ%40mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::642;
 envelope-from=maxim.uvarov@linaro.org; helo=mail-pl1-x642.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sdRKhLNiYDEc

> +static uint64_t sbsa_gwdt_rread(void *opaque, hwaddr addr, unsigned int size)
> +{
> +    uint32_t ret;
> +
> +    if (addr == SBSA_GWDT_WRR) {
> +        /* watch refresh read has no effect and returns 0 */
> +        ret = 0;
> +    } else {
> +        qemu_log_mask(LOG_GUEST_ERROR, "bad address in refresh frame read :"
> +

Then it has to be  uint32_t ret = 0;

On Fri, 9 Oct 2020 at 20:51, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Fri, 9 Oct 2020 at 18:30, Shashi Mallela <shashi.mallela@linaro.org> wrote:
> >
> > The value being returned here is 0 (initialized to 0 at the beginning of read function).
> > I have seen similar practices being followed in other qemu implementations like for example bcm2835_dma_read() in qemu/hw/dma/bcm2835_dma.c,a9_scu_read() in qemu/hw/misc/a9scu.c.
> >
> > Please confirm if you would still like to add specific value like 0xdeadbeef for bad read offset.
>
> Judging by the subject line you've mangled the headers on this
> email so I'm not sure exactly what this was a reply to,
> but in general QEMU doesn't do that kind of "return
> specific marker values for bad register offsets". We
> typically log it with a qemu_log_mask(LOG_GUEST_ERROR) and
> return 0 (unless the h/w does something else).
>
> thanks
> -- PMM
