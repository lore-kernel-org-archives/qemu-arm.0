Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3322429lft;
        Tue, 28 Jun 2022 08:53:40 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vqUVIrX4QvFxiFCsDfOOGv4DPaImadA4fdl6eyPgpO4LwWLvQ38/nwWOEW6yL67gM+rmbZ
X-Received: by 2002:a05:622a:243:b0:31a:1a19:7b2d with SMTP id c3-20020a05622a024300b0031a1a197b2dmr8893433qtx.564.1656431620582;
        Tue, 28 Jun 2022 08:53:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656431620; cv=none;
        d=google.com; s=arc-20160816;
        b=ficcv+fJIqlcRdLPjLTmYyUZxx5wGTngkwqUn7Jl3yvchhZyZskn6KVN/RjzHsoBGB
         pKaS7msvXOMYipfVGyvDpa5l1+0+J9q0RWwNBdwZk3PZQ009BpA+PCudnutOPQEskJ2F
         t5nt5IrDsehsVOfY6j/rmjsSYns5ynCJGvu02s5l4j9hap0WiY0kVFXGcCcJ+8cvMxUt
         xywHLs5Nxox+cup3h/x5jN0YYjal7fyMY1UPgQTxaZqD/wqeym20p66XHYovAz61IKA2
         MIMOY1Qjb0Pi2T8oWzyJb+zOSZGYd5gGMwfx+r96gfIf5Wbkq8snZYNzoMT+OW2a5J5P
         9vDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=bB6NIa/NcaJNvBdTjBIRo4gX7WPhlLDFD+Q6ZMpW/eY=;
        b=Vfnw1FZdwLngBUQU777P/KCLn2//BDTAaytuceJWgisyhsDpnKFCh4dYOAdOGkdA7c
         RYmzfYDt1OlCeEkJDYTN74F80mFbg+WaZ5yUd8Z+A40AvKsikskF7w0dt1d24513ZJnV
         DEjYlp/N86eAqELLWN+kb+/yMQVyUBMu0Xm81ZaqVIw+GBk449TSr01FJscx6vppUfzF
         urehoq4CG7vpPELrVJnzGSoV4pwijcO0ze5d70+rgfoqPYIs3+0nworm7iWInF20/Wu8
         aFUSjvUF1tN7ahgX+tUxoMtfTQ7KXtTs7f/DGLkMnrPUQL0ysWxbvpjCqv82bYSITdwx
         M0qA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sBG2m2rU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p7-20020a05620a056700b006af647be91fsi703714qkp.376.2022.06.28.08.53.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Jun 2022 08:53:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sBG2m2rU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o6DX2-0003Aa-2T
	for alex.bennee@linaro.org; Tue, 28 Jun 2022 11:53:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o6DWF-00033Z-IZ
 for qemu-arm@nongnu.org; Tue, 28 Jun 2022 11:52:51 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:45002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o6DWD-0002tO-Te
 for qemu-arm@nongnu.org; Tue, 28 Jun 2022 11:52:51 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id i7so22888694ybe.11
 for <qemu-arm@nongnu.org>; Tue, 28 Jun 2022 08:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bB6NIa/NcaJNvBdTjBIRo4gX7WPhlLDFD+Q6ZMpW/eY=;
 b=sBG2m2rUnFq8LKd8NsZs58al61Q/1rR4w4DKoOQ7vMg2KMJn2GephY+7IQCMST//u7
 QvNeA6pmYA07ASeSncXw5L8wW9gNKBongoR2l3KY3SIvztDHV0kE5sWZCj/Y4JUUBuQI
 wLtBYVrqY2PVIwOOuiExqRxZdlCPTzDFgJK+3htlioTjHjEpriWsc3bnM7qV+Preokkr
 4S37GXN2eCJuTkgAmL9v5sPNJVmAUnqt641qzp40xAEAeU3G2ynDYakUUMrt7fWU9tVN
 2P07I25ewnWlgoZu3aB7rgTNHkS6wxT8vk+f/ngwGHjoP5i0Veqow6KCS2AG46m/3Lwu
 x2bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bB6NIa/NcaJNvBdTjBIRo4gX7WPhlLDFD+Q6ZMpW/eY=;
 b=cUQKo1NvBqloiqKD5f8G7s70MfOSwnESHaJ+lcDIRhfIG42iHAjDzG86pkgn58B3+n
 fqMCdYbBf5ldBJhkdOgepYdku9+3XmtryZmZu+CkgWbeKBX+3nXIvAqLYat5612ikdCx
 AEds8HR5tYdU/oN6IwUHODCLeOo/GPCQiAx+A+nY9ylJguw3Tb+9FRDqdyoNP+5Y1HSQ
 5ydP2+DUSgT+oMSB+JZuJYIH1IrRg0QgSZAf0LoYVICjxz9AAmoUfswmXSBWswLZFiz4
 YbHwnBc+0e4LYGRmocL+HFOX5VI11Paq7ArfMnpyceoIj/W4v6puXwqC/Mi/Bn80I7cn
 Z1ng==
X-Gm-Message-State: AJIora9Q4Dc92LPlRwUBt+a3PWoheSOBpcZryLKN+Kf2CFtqaPPUFhH9
 s0s0bXj3zWEfqEeDeRZIn/V1By4CM87UKtIgdpTvrEc3RXI=
X-Received: by 2002:a5b:dd2:0:b0:668:fc4a:9403 with SMTP id
 t18-20020a5b0dd2000000b00668fc4a9403mr19599511ybr.39.1656431568542; Tue, 28
 Jun 2022 08:52:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220628154724.3297442-1-peter.maydell@linaro.org>
In-Reply-To: <20220628154724.3297442-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Jun 2022 16:52:10 +0100
Message-ID: <CAFEAcA9XdA4H50TKBw4fWskgPo5E-5DZGQatKG_yqwBKtnQUfw@mail.gmail.com>
Subject: Re: [PATCH] hw/intc/armv7m_nvic: ICPRn must not unpend an IRQ that is
 being held high
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Igor_Kotrasi=C5=84ski?= <i.kotrasinsk@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2e.google.com
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
X-TUID: /L0pq+EgSxoy

On Tue, 28 Jun 2022 at 16:47, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> In the M-profile Arm ARM, rule R_CVJS defines when an interrupt should
> be set to the Pending state:
>  A) when the input line is high and the interrupt is not Active
>  B) when the input line transitions from low to high and the interrupt
>     is Active
> (Note that the first of these is an ongoing condition, and the
> second is a point-in-time event.)
>
> This can be rephrased as:
>  1 when the line goes from low to high, set Pending
>  2 when Active goes from 1 to 0, if line is high then set Pending
>  3 ignore attempts to clear Pending when the line is high
>    and Active is 0
>
> where 1 covers both B and one of the "transition into condition A"
> cases, 2 deals with the other "transition into condition A"
> possibility, and 3 is "don't drop Pending if we're already in
> condition A".  Transitions out of condition A don't affect Pending
> state.
>
> We handle case 1 in set_irq_level(). For an interrupt (as opposed
> to other kinds of exception) the only place where we clear Active
> is in armv7m_nvic_complete_irq(), where we handle case 2 by
> checking for whether we need to re-pend the exception. For case 3,
> the only places where we clear Pending state on an interrupt are in
> armv7m_nvic_acknowledge_irq() (where we are setting Active so it
> doesn't count) and for writes to NVIC_CPSRn.

Should read "NVIC_ICPRn"...

> It is the "write to NVIC_ICPRn" case that we missed: we must ignore
> this if the input line is high and the interrupt is not Active.
> (This required behaviour is differently and perhaps more clearly
> stated in the v7M Arm ARM, which has pseudocode in section B3.4.1
> that implies it.)

-- PMM
