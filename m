Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp515167lfm;
        Fri, 26 Jun 2020 07:46:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzofBCNrTU+2S2oWaPAEId+3OtLZO0ytM8lx3Zs4FdjWhtaNVdINQQDZZGZx9yl2c+m/d5w
X-Received: by 2002:a25:6b42:: with SMTP id o2mr6128146ybm.269.1593182788123;
        Fri, 26 Jun 2020 07:46:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593182788; cv=none;
        d=google.com; s=arc-20160816;
        b=bbOGXUGcVeBBTqKQa71lbsJA7mf/pp6+PPPk7sX/2WJv2EtifFiiFBPpkqyclLNn2H
         qk/yuX8clszbmXdEMozyLEyNFXIu+CXR/PCWUX+nRhnjBTcAezrYns3/BnbfZtpAg0H6
         6p6pDOwzM9s0fWog7cyq05mnUL4FzIravum848dN+4+jqiUHkHCQtTX0q/kgyWWShqFH
         nZsdzPm/aIUsdTPwMHNKGr/71EkWiE0+h5WFEIusRvGW3iOjy3nUu8hbtKsZLMylwUCR
         /52XG37MM/triGBhKelwQfEI78JQ2JFP9LmYfSd57yrC04Ec0C3cebWEM3iiXpQFx/yi
         BcaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=lylTJONNiF+05lqI3v4IFl6XREX96gJa5ntCGs3wMhg=;
        b=kSkinhAr2CELgUmighPb74knjRU2gTkYwbVJ5/wdur/j/yW1f3exb7muQUEORyK3+z
         lNVJMbnK9q/zkZ201mpb+sycqmz4ENaWeaPnhrcqMbQos43xPGo52FBLFW+Dj58y2hRF
         1GCcqK+84hn7wc9PhZBTkXL+9c6rSaxhO633w/1DeZyRnqDmD2/kXFT3UAzV2mIxPuGu
         6y3OOa2RGXFiDQTLCKHVNhriagoOViLoNyXT1IyUsCexxA9dCtiFqeqE5LQeIHNIdAfK
         hd+nhWVAfvJAujLBmQDRFyZmCGuAwqlgwKHFq/8alaD1O1NmtIHOv+/8v5Az/zvpln8z
         LE5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ml8qn6Qg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l7si25480448ybb.38.2020.06.26.07.46.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jun 2020 07:46:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ml8qn6Qg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jopcZ-0001Jb-Id
	for alex.bennee@linaro.org; Fri, 26 Jun 2020 10:46:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jopcS-0001J0-NS
 for qemu-arm@nongnu.org; Fri, 26 Jun 2020 10:46:20 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:40549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jopcQ-0002Sd-Uu
 for qemu-arm@nongnu.org; Fri, 26 Jun 2020 10:46:20 -0400
Received: by mail-ot1-x341.google.com with SMTP id q21so1297691otc.7
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2020 07:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=lylTJONNiF+05lqI3v4IFl6XREX96gJa5ntCGs3wMhg=;
 b=ml8qn6QgjyIEG7aKySM17/4U2F/msKUdBWoyCerSkwyU6dN7PqfB0T/c3RnoFP7v+r
 Puyy5hvmdWLFjZNlFg/6ebnwRZVExwFLJvr3Ho6pgbRSI3ZqkqS87hyNDT6AFaCUej3L
 zWvDf9jkrUaI+pgVfaw2SHy3XmLX8SnOP3qWVv1OYtps8MP4/p2qp+J4rRBYISolPADk
 /R3z6CXF4RSIehyM8vYkaZgV+vY0TpTVkNtq/Ly6NewEnM1AKH/82avV8voZdMK75TAF
 Y0i6QOKgOpdePlKOeiiYVxso8h0OcFDfxWk1fsvMOLS+UbXR1vtYTw6m0303uLiNioLG
 UojA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lylTJONNiF+05lqI3v4IFl6XREX96gJa5ntCGs3wMhg=;
 b=FqfYjmAQX86KkNnmJDB7GikToMSHkH7A9XQ3bQLMqM3xbWIwsa5Qlq/3LsVl/p22qv
 9+RQ0yFk924vhk2QTxLKckJ0JLnlSTZ9YsNy7nxvOMOj2s4SsfCJtfLl6oFzAiFlA/eo
 M+Ndy3B/KQ/GUz6qiXS1gaFQ3fuaFugf4ehVtuOBfLqrC7DNdzdeDLDK64tgYk05+T70
 kRMlyWugru1Nm1udbpIoAzUhvtNfd0ABCHTjXNi0GxCiLXzI60ypyVHDsBGKP7HP5yFR
 fEaAQaf4He1/Yii0gBzDu1hI2T9CR0NXjeEmSsf1hlFwjWTMVNoyMuD7YZLLlPNI2Mfj
 H0vw==
X-Gm-Message-State: AOAM5309tGfpagEBvisPb+t6K9ZmwIbA9/YHtfeIWgzhQexorq+xkMvQ
 PKvDjE+wRkE3v0pUCz555CEV4ARlh7Q5EXI9RprK4w==
X-Received: by 2002:a05:6830:1bd3:: with SMTP id
 v19mr83072ota.91.1593182777472; 
 Fri, 26 Jun 2020 07:46:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200610084551.28222-1-vav@sysgo.com>
 <CAFEAcA9uF01LnFy6o4Yy=aeuy9ixyGWZFVGtR66ah3w1458O5g@mail.gmail.com>
 <583c6e8e-fe52-881d-1a61-f02ce7b16d23@sysgo.com>
In-Reply-To: <583c6e8e-fe52-881d-1a61-f02ce7b16d23@sysgo.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Jun 2020 15:46:06 +0100
Message-ID: <CAFEAcA8XLnUWQP9BgYfN_Q5Kg8nEMfEynFiRMx8NOS2roE+V1A@mail.gmail.com>
Subject: Re: [PATCH] hw/timer/a9gtimer: Clear pending interrupt, after the
 clear of Event flag
To: =?UTF-8?B?VsOhY2xhdiBWYW5j?= <vav@sysgo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: "open list:ARM cores" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QEhRO0QJwjN6

On Tue, 16 Jun 2020 at 08:04, V=C3=A1clav Vanc <vav@sysgo.com> wrote:
>
> On 6/15/20 1:04 PM, Peter Maydell wrote:
> We must distinguish between two cases:
> 1, Auto-increment is disabled.
> I just run some test on SABRE Lite (i.MX6) board.
> I had auto-increment disabled, I verified, that GIC is configured for
> Edge interrupts. Once count went past the compare value I got the
> interrupt. I did not touch Timer registers, just signal EOI to GIC and
> surprisingly, I got a another interrupt. If I stopped the timer
> interrupts stopped coming (Status was still set to 1).
>
>  From this behavior I assume, that every time the Timer is incremented
> (and Timer value is past the compare value) an EDGE interrupt (that
> means actual X->0->1 transition) is asserted. This is really interesting
> from HW point of view. This would mean, that a9_gtimer_update function
> should generate the pulse and not level on compare event.

That's interesting. Which version of the Cortex-A9 does this
board have? The TRM documents that the comparator behaviour
changed in r2p0...

thanks
-- PMM
