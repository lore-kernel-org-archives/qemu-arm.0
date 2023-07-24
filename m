Received: by 2002:a17:906:b78f:b0:98d:b2f5:1316 with SMTP id dt15csp1994173ejb;
        Mon, 24 Jul 2023 09:24:59 -0700 (PDT)
X-Google-Smtp-Source: APBJJlE/T+Gw69gnEMjkR06PFXz/vps/n6c8UvTMYTZLXf/6T9FPaZVz6ePgVCfzNJEHLZxm0bP1
X-Received: by 2002:a05:620a:4156:b0:75b:23a1:d8d8 with SMTP id k22-20020a05620a415600b0075b23a1d8d8mr251860qko.28.1690215899344;
        Mon, 24 Jul 2023 09:24:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690215899; cv=none;
        d=google.com; s=arc-20160816;
        b=MgEFWSD2MX00E9CHF66Nw5qjDc8tUtgkFMkQ+RalKxxHoEHmQEmK9NBpSIW6rZKuLP
         DVX0RskV1RIoOsN+nPfpvF7Z7A8O96ILv8SypWjfmPrIW9e3P3wkEOLSLs3CisSiLyI8
         b6zIwNMkd3VenlDDUFltQv6M9Xx+BTlPtv2lI89HnbHl9/sjxF3AV1Vh3WHry4kqLfkr
         FHB9xq5mBXPqQ6K7zwx0VVEuV4zLrPlqnO1qckN8M1Pkx/XZfu6T3YtLxU2lc0XDYeAH
         1qOO6F5PiqUe4mr7oRpMVojVl57F3Y6Y0ljUJnr6vKzpb/yLqjIctam9ZrcpsNL54ur6
         TeSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=mrqHysA4GEklMlaTflp7OUJEjqvtzGwKJfDog1L6fT0=;
        fh=XBL7wuOnmyes3GPK3AEoJ+XBo7B8JI753uFIVICnU40=;
        b=GGu3g/8O4kTlZE6nkLwVt6hjc39S0/FUpBwlcxlapHwzdv2+AqeRxVeg++KwIU9aet
         LIo/pN9h47lKj470KebHf4ex0yE/t2ynJzBxdL/FabHVwn9CMWZ+HkzuFYOCrxwYf4kr
         /UuVfQSy0PzChyiG0J4aLCQaZX2I8MkPk3F81y3uxQsfUN71wApaTmAaiWUo0+fuc0Fo
         3tD1BjWwqe8YqTqiK/iIljLGpmZQ5Stdij0lxHZ9uGZOYPCfbn/1f6VB8BzEAQjFXZW2
         UrlPswUBYSaALJrnXSkhGFYgKhJ3rGhpxMoF7eOqVQPwH5dm0YSGiWToMBv6aBqDCL0t
         MDBg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gWc7bYYt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s18-20020a05620a255200b00765b0dc5ef0si5531757qko.510.2023.07.24.09.24.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Jul 2023 09:24:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gWc7bYYt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qNyMd-0005Iu-Kp; Mon, 24 Jul 2023 12:24:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qNyMQ-0004uM-Tr
 for qemu-devel@nongnu.org; Mon, 24 Jul 2023 12:24:39 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qNyMP-0000EV-Aq
 for qemu-devel@nongnu.org; Mon, 24 Jul 2023 12:24:38 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5221cf2bb8cso3477682a12.1
 for <qemu-devel@nongnu.org>; Mon, 24 Jul 2023 09:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690215876; x=1690820676;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mrqHysA4GEklMlaTflp7OUJEjqvtzGwKJfDog1L6fT0=;
 b=gWc7bYYtycH097HcUNtEOYe8cAIDRNuJTwYkbwFeMTBOoweSDNCuS3cjF2m/fvQ2nO
 b7b65jGV9JiKfsSjCfEUNYfk3/SXm8K2Y1Y1vB9wLgnAESLaEwYM+bpYpEEsOMDjd+IS
 P94mvPFCSFL57mTahMynXNKrmw37QwVUtk6CbLZRHDY5NPIKXrYkunoEPW7WSvNbBVRa
 9nBxhdiQjz21r2YRIOU/54XCPOMO9//Y733ObwzHXYTmlxdjbKzQCFhcTFjR6Ju3iIe0
 yYjglybdyl3We+62gLOTd60JO46p7cgIxvnTuSslk9eVSmSrAKmPXK6Ks9twNzSDFgC6
 g/0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690215876; x=1690820676;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mrqHysA4GEklMlaTflp7OUJEjqvtzGwKJfDog1L6fT0=;
 b=XhMr+5xGfGnIFDTfTHw+YX3D+YzI46x1SEOcQAJbdWMvNwGLy8tlhvkIoBCxdq2Scl
 Osh/K8FyFavDG1SaNj9tAru0fz+yFKLyXMy6yZmEnNY+WtK7T0sguTN5gfrAlQj3HtNq
 tviVRQrdZ7UPLYacZwOZjo2X8zZoJXgDir0QMYRF74onYG6GKNionmsSiCcpomDIQg2P
 B/jUDt95eN6sLu/nZx28A/XimChhRQXrICy1EVZbCcU8C15gVvpD6HUW4Dr2rlkdqajg
 SS7XJLBAFC/6BYO+O08MYyoZMLus/qx1gbguCtYU/b9s63uC+dKrL/JcMXz0+7rw7dG0
 y3Kw==
X-Gm-Message-State: ABy/qLYhL+obDL2sBtuwEGX2oNFKuQECL6N+HmJ/guIHWPn0g0rxgDi1
 vv8eceVtRYkPNu6f8/CuNjVR9IidmyV4zKLFTOWrOA==
X-Received: by 2002:a05:6402:1618:b0:522:1e2f:fa36 with SMTP id
 f24-20020a056402161800b005221e2ffa36mr6303060edv.28.1690215875693; Mon, 24
 Jul 2023 09:24:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230714232659.76434-1-chris@laplante.io>
 <20230714232659.76434-7-chris@laplante.io>
In-Reply-To: <20230714232659.76434-7-chris@laplante.io>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Jul 2023 17:24:25 +0100
Message-ID: <CAFEAcA9jJAUy7zVUL79ZTahdjZG=PMuGbMUco4E=+2OaYVtEeA@mail.gmail.com>
Subject: Re: [PATCH 6/6] qtest: microbit-test: add tests for nRF51 DETECT
To: Chris Laplante <chris@laplante.io>
Cc: qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Kt06DoojkGG1

On Sat, 15 Jul 2023 at 00:28, Chris Laplante <chris@laplante.io> wrote:
>
> Exercise the DETECT mechanism of the GPIO peripheral.
>
> Signed-off-by: Chris Laplante <chris@laplante.io>

I think you want to intercept the DETECT line on the
GPIO device itself, not on the SoC (see comments on
patch 1), but otherwise

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
