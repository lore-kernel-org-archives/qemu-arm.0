Received: by 2002:a17:906:2484:b0:98d:b2f5:1316 with SMTP id e4csp1404932ejb;
        Thu, 27 Jul 2023 09:14:34 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHEpUtnXTEBP9pza9O7yuxQYxIBhG3Hv3OXK7UhS0vv9os06h7Cz+fggUGk9WOsU1M3Xx2B
X-Received: by 2002:a05:620a:284d:b0:767:1f3d:5d15 with SMTP id h13-20020a05620a284d00b007671f3d5d15mr474316qkp.23.1690474473774;
        Thu, 27 Jul 2023 09:14:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690474473; cv=none;
        d=google.com; s=arc-20160816;
        b=L+zt7jQTWxLPtT0Tp+5fSgcQhb/+mCN8JbRQUCv/gP0OmpvnPUH8U6MfLxq4j4B/cD
         LW2CycLUdeHS/v+gPHSW4nBdXYuLr2euJ1OLu5++xZSsvgYmG/b2hLdmVXuIMbwtZkfw
         d6qdsYxh8bvObeh9FzSk28meS7ZcYzpFpe09bQ/5kUub33nbg/fg/6b7yFG9SQBA+C57
         6yc3fyMdawdhXmFeFEqSVmxdsrwEuFj+Ezon4dx+Tkf6q2Qe6QQVvI8Lk66xhj5xT0H9
         DsfdOh9Moc8tzyg24ZT8HrKrdJa98lswRHCz9SkVjlVEhyHpLXT5UnmNlrwBdL/clmst
         nEsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=SqEb7fDLtdXCQ0FEVkKZ1JfH1sE3u+bGhNdu3epiPzs=;
        fh=XBL7wuOnmyes3GPK3AEoJ+XBo7B8JI753uFIVICnU40=;
        b=kDFnAXLubQgavPfruvjgM01WhoShOd0fdoiAPjCNFusHViHBAU1kRC46f3X61KqNZp
         HnkkRkdAMkF9VqHondGBlVlqLjRgqRMbEAoqtFzNJ3RijNplZ24+xioGIjBi9IK5jxs9
         VJFuKuZguvsJbGvPNByn+uzNB76mTZOEDI/6LMMzpvDqjix44KTHrHyNdiJTQbwow03a
         R6psa1LO3IHbEpJtVISoQT3/G57Ko4DQBNe6GwuufWAqtYCzYZsJ7D5EN+LRmsEQDtnW
         9W68yGibKPiD+QYl8Dg7Mkkl0TYYheoBKb/URpFgekPStEtyPz5l5kk4c/UZ8TRXkiqm
         7YeA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U0gykGZu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bi29-20020a05620a319d00b00767cd8d1659si950084qkb.548.2023.07.27.09.14.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Jul 2023 09:14:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U0gykGZu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qP3aM-0000AW-VA; Thu, 27 Jul 2023 12:11:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qP3aL-0000AB-64
 for qemu-arm@nongnu.org; Thu, 27 Jul 2023 12:11:29 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qP3aI-0003g8-RZ
 for qemu-arm@nongnu.org; Thu, 27 Jul 2023 12:11:28 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-31765aee31bso1225292f8f.1
 for <qemu-arm@nongnu.org>; Thu, 27 Jul 2023 09:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690474285; x=1691079085;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SqEb7fDLtdXCQ0FEVkKZ1JfH1sE3u+bGhNdu3epiPzs=;
 b=U0gykGZuXn2GSSOogo/sU45GBVa8ew5WcA3m1Yuqpga2Tjv0rguRV4wQxQxKFDf/4I
 iQx4217p4Ui0U+9XHu+M+sdzLgn6u2fWvtMa0QQE0L2fn8cSvUXqicppZhN1k8YBvrJ/
 IvyuuJj8SAMgC6/yMJwXSk3BV+Mxts/fWZ/vVLOn27V5akslOYFLz0i8KkQgXaGrRhtB
 hidg7ILlfcjR0kKn2p0PQMhSR0FJJQocxCfz/0msl4vaKwJePtmCRUXKsxAf/eeNViqL
 daNtWAbujqRG0K14iTDI3Hmtw9Q1pSJyCY31omUPi4J3h/eHyU7HwdvJrzs2L/yuT9qG
 L+Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690474285; x=1691079085;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SqEb7fDLtdXCQ0FEVkKZ1JfH1sE3u+bGhNdu3epiPzs=;
 b=hh7BpSwI0FsLEvAuGB2NQOiF0odu8alft/ndA/Bg/R6CfVJWmY8nhwOIsvpgHXWW+g
 cS4LMV53i4IAitrU5Pk2sUDFVPJ0r8aXz3xYIc0Fn/jPMapF5UDpWx9zCwLza26e3nX1
 vDw2aCNJggqM//BzGFMrDyYpM6JJBpKwTCwWzPjLNIcHeLudPtGRNg+c5NlcH6NRyb0w
 EVaUe8RWri2/RZ3eWFVk8mjqSH6f0G+c+AI0+7iCSabH4pL5NgA+trC9XNck8MEv86lY
 Y6naUr8TEO0luOHthfMRarANPMWHLyki7XAxyszHDzyjMtxx2OCRZF1BdaqCjHhewC2M
 RzKw==
X-Gm-Message-State: ABy/qLYKfsVGcPQLeku75JGmeq1pYyMSl78aXmdoKBDka7AOUSuwR56f
 /JooYjyib9/+CSLj6seDhAyW4tYncSzJBAAFodDmqg==
X-Received: by 2002:a5d:4405:0:b0:317:70cb:4f58 with SMTP id
 z5-20020a5d4405000000b0031770cb4f58mr1917570wrq.63.1690474285235; Thu, 27 Jul
 2023 09:11:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230726030450.757462-1-chris@laplante.io>
 <20230726030450.757462-3-chris@laplante.io>
In-Reply-To: <20230726030450.757462-3-chris@laplante.io>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 Jul 2023 17:11:14 +0100
Message-ID: <CAFEAcA_Js28L0bLwexp9s1CCB5_CU3+cVymq64awriXjf3td2Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] qtest: factor out qtest_install_gpio_out_intercept
To: Chris Laplante <chris@laplante.io>
Cc: qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: b1PdcSaBKd9c

On Wed, 26 Jul 2023 at 04:32, Chris Laplante <chris@laplante.io> wrote:
>
> Signed-off-by: Chris Laplante <chris@laplante.io>
> ---
>  softmmu/qtest.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
>
> diff --git a/softmmu/qtest.c b/softmmu/qtest.c
> index f8d764b719..1c92e5a6a3 100644
> --- a/softmmu/qtest.c
> +++ b/softmmu/qtest.c
> @@ -365,6 +365,15 @@ void qtest_set_command_cb(bool (*pc_cb)(CharBackend *chr, gchar **words))
>      process_command_cb = pc_cb;
>  }
>
> +static void qtest_install_gpio_out_intercept(DeviceState *dev, const char *name, int n)
> +{
> +    qemu_irq *disconnected = g_new0(qemu_irq, 1);
> +    qemu_irq icpt = qemu_allocate_irq(qtest_irq_handler,
> +                                      disconnected, n);
> +
> +    *disconnected = qdev_intercept_gpio_out(dev, icpt,name, n);

Missing space after comma.
Otherwise

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

(If this is the only issue with the series I'll fix it
when I pick it up, no need for a respin.)

thanks
-- PMM
