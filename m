Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1835247lfb;
        Thu, 21 May 2020 11:49:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx5TzJ1nxbWklUpBYrWAog9eFCYeXr8Y7tQFekBP/ECm8qyXC31azF3gfq4TGgaZFW8KPLu
X-Received: by 2002:a25:787:: with SMTP id 129mr17028347ybh.359.1590086998002;
        Thu, 21 May 2020 11:49:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590086997; cv=none;
        d=google.com; s=arc-20160816;
        b=bbv/B1duOp5qpJTPA8yqStlZYrLpem/x4jms1o96t4ts6Vlzz9/Ds9dQ7q7G04MOk1
         bmr3Vpf1nB2nauLi8bnEFlSW314R2MQl9mywhpRbe+vTbytjrBKMuxYlUIZmSDAxT6nH
         rbQ50Zpog89kBOtJuwEwzP2gANcyRLNCL9f8teQyJ9SZkFezwVj9MpTvTzRiKVeuOW5D
         qdSYY6RKeIV0lXHFybYuIjOJtbwFKvYuS0rdXj/qnNamJ3OI5g/c9RuDA9FJkCn+oABy
         fnR5qxeyvzGpMHlNcAXV33+jarAG2imMAERDz1SB/mkS/Ua0/3OhhCcrckkg5TZRa2od
         ZZ6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=vg+43JhF462N0nwHUjxtwXluWT7aGYu/k17D/8knOpY=;
        b=Vl0w7ptrs5zGbW3ll5KgN3VC4JnutODNrYnzrLWKaRMBFQUibtJVjbrObr3hx66oYd
         j4WVPDl/UvlclB66WSBqDVuyVPiNIG/Hxh/AleK6brzClcQKw28+ItZDYDWTHCpHsxdg
         YmzuBJ54n6nJt6av67W5TWAxJBgfpgaEqfoTrm2tjJS3pi47mbg0OVJeFbmMzGtsTWvJ
         lOfd2q8zJ0ApdEvfudBjo8acs3w0r3qugwqKH+09HHhCqBTjnbkQ92UY1xusSciTNiu5
         IpnGODcLZ0bwNoaxXsfT9rhB4G/ZduAixuNWoq+/jHfycMqjBVe2QbFnnGs9TqNBmAM/
         O7QQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=tRQ4Ki5S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r206si5498549ybc.378.2020.05.21.11.49.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 May 2020 11:49:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=tRQ4Ki5S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jbqGT-0004xz-Af
	for alex.bennee@linaro.org; Thu, 21 May 2020 14:49:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <e.mikitas@gmail.com>)
 id 1jbqGG-0004vP-FP; Thu, 21 May 2020 14:49:44 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:53130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <e.mikitas@gmail.com>)
 id 1jbqGF-00008f-JA; Thu, 21 May 2020 14:49:43 -0400
Received: by mail-wm1-x343.google.com with SMTP id z4so6454259wmi.2;
 Thu, 21 May 2020 11:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=vg+43JhF462N0nwHUjxtwXluWT7aGYu/k17D/8knOpY=;
 b=tRQ4Ki5SKHdqbeJZ0S67QSYStq8Z/eTzINOJpHD10h/OiAlPXnXzYfYLOrhPiK6Vvw
 DBD4Wd9XaLzuuZceeUBbFdRzqoDma5HpuTXpDv38Q/C82Ch1PY9SzVp8OG0TDPBkBV00
 1daUVnQ+8AGTY2soRxgi0c2CLtyT8hosxUzEV5uBHb1CNvowWUHpQlqQ9t3UIib4clI9
 XZrLlJTlNgegXZfwpLJum1nlRZl8iGwg1KLb/pYgRl6zFHlWLDqud9Mr+p0ydLwhzy0M
 Ufd3/l9bngW7FCE2ZjABhIW8pPOT+A2OFxTap15TqjzROMBYKqROfDwSk1Tyd5wYGCeu
 DvOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=vg+43JhF462N0nwHUjxtwXluWT7aGYu/k17D/8knOpY=;
 b=sKw1c+yyfXJaIR8aS0AQQ4KugNXWKh8/IDZXlgQ8GvynaCyQ40Pg+NqUp5W1QCnXyf
 NfwHPtniMPpXsvYuZkrFv/hOuD0zweTd+HSzxU1hvd2JLuHsT9IJ/N1nBOS3nxDSVy6T
 biwQi0nMLJtzeNqzXddS/ZGbBECurB8sYbcn6/MG46vV551cuN0bU7AnLDFlmooRxmVe
 R5qGSbZTUbYr7u9+LDgtPjbglbNQJXJYI+6mAY59cuuUxz7wSsbjyUi1BomXp/JKYCM9
 TYtYfnsjzQLocbDcEpfOQ0vIrMu4CKkeR5Yxa6vGcZA2nUE/ydTLo4eREjYT5pHpq5Gi
 +OQw==
X-Gm-Message-State: AOAM530vEJDf+7QQXE1632PeveW5AfCleTkuSi1IzFPeKUK+kic9pcyz
 pmMwNnakjG2oJnX7TTcEzFY=
X-Received: by 2002:a1c:b604:: with SMTP id g4mr9829829wmf.103.1590086981015; 
 Thu, 21 May 2020 11:49:41 -0700 (PDT)
Received: from eden-linux.lan (bzq-109-66-59-205.red.bezeqint.net.
 [109.66.59.205])
 by smtp.gmail.com with ESMTPSA id g69sm2590022wmg.15.2020.05.21.11.49.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2020 11:49:40 -0700 (PDT)
From: Eden Mikitas <e.mikitas@gmail.com>
To: peter.maydell@linaro.org
Subject: Re: [PATCH] ssi/imx_spi: Removed unnecessary cast and fixed condition
 in while statement
Date: Thu, 21 May 2020 21:49:23 +0300
Message-Id: <20200521184923.19360-1-e.mikitas@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CAFEAcA_i=HsBtpJh_o4+NWNeUihvNTccfB67gs0WrXttYdTc2A@mail.gmail.com>
References: <CAFEAcA_i=HsBtpJh_o4+NWNeUihvNTccfB67gs0WrXttYdTc2A@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=e.mikitas@gmail.com; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-trivial@nongnu.org, alistair@alistair23.me, qemu-devel@nongnu.org,
 jcd@tribudubois.net, qemu-arm@nongnu.org, peter.chubb@nicta.com.au,
 e.mikitas@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QCbGrhEtsjJH

The ecspi controller is supposed to support burst length of 1 to 4096 bits,
meaning it is possible to configure it to use a value that isn't a multiple
of 8 (to my understanding). In that case, since tx_burst is always
decremented by 8, it will underflow. Sorry I didn't include an explanation.
Should I resubmit the patch?

>
> >              DPRINTF("writing 0x%02x\n", (uint32_t)byte);
> > @@ -206,7 +206,7 @@ static void imx_spi_flush_txfifo(IMXSPIState *s)
> >          if (fifo32_is_full(&s->rx_fifo)) {
> >              s->regs[ECSPI_STATREG] |= ECSPI_STATREG_RO;
> >          } else {
> > -            fifo32_push(&s->rx_fifo, (uint8_t)rx);
> > +            fifo32_push(&s->rx_fifo, rx);
> >          }
> >
> >          if (s->burst_length <= 0) {
>
> This seems like a separate change to the first one;
> in general unrelated changes should be each in their
> own patch, rather than combined into a single patch.

Should I resubmit this as a patch?

>
> The fifo32_push() part of this change looks correct to me.
>
> thanks
> -- PMM
>
