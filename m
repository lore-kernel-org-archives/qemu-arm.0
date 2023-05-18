Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp371221ejq;
        Thu, 18 May 2023 03:09:14 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7KsROJUr1PNGlrtQTy8HFzRRqNlnP7WD/2xq52WVRIWIgRLpfX3AxW/9I2Kl3kPhedxNSy
X-Received: by 2002:ad4:4ee6:0:b0:5ef:8c79:fe92 with SMTP id dv6-20020ad44ee6000000b005ef8c79fe92mr3963369qvb.3.1684404554063;
        Thu, 18 May 2023 03:09:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684404554; cv=none;
        d=google.com; s=arc-20160816;
        b=E2nFEaYqDRdqln+lUfF6cmbHrz5uIvnatf9U/ZU1muneYORVFdFeJ5vGu91fyfIjjE
         GUTcNpLj/6Zk6pZcOqGycuHTjwefzVLWQsYhfykI+u3VyD/dASrKSpxByYiv4qXW4mW9
         wh42q3XSt0qTJSXC0r/P64eAgMwZO/xA14acaPmWqibh79cGXkpgioZ04E58Eq/hEfMI
         at7YFqL72QGV2FcS3V1YNXU383/MBisM5OL8XMnzm+fl+NakRO3oAYxHnbfhhlo1+oHk
         xtqnAmMLmNfdQebTVaGsmkWt0TjmK3qfPIm13MsKlUbFx+Wv0PGLQC99lBj6ILXoHwud
         IRrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=JM/Te4zeKkA1WovpJmHGh4bMjFSCsf1ZEe8BHG9lYaY=;
        b=oZ43+gjVlGLHBbgQd9FBJS0dJj6Wzqg0e5ao/YmCl7czgdoAdTbvHX3aMySp1jiM6Q
         l2WV1tOXDPrWRb5gGiAQCpnaYXBdam9TsxLBGuztXV+89C6Dz4MqEIHM1jaaSc7nYoon
         hBEWiIRflUiJEjVaEtQR/irNQN9KWHFmXPKjYoviyb4jxGMGYjl7YheWLPkP4f+DEdLQ
         GpnM3yFtFZI+uY8JSSZ2J3xg48ymLQdCl2zG6aI55tjW0hQ2cFKu2ABxXcnVeluP/M28
         DvuaWIGIlnKdABaNjnuJpNRjdGEtI6znGTi8Ry4wEaxE/5k3i2XFHDKB8xUV4LcGLyXx
         1uow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xgr5RxUL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l24-20020ae9f018000000b007463cdd2a59si612072qkg.675.2023.05.18.03.09.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 May 2023 03:09:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xgr5RxUL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pzaYp-0001YS-SC; Thu, 18 May 2023 06:08:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pzaYl-0001XX-GB
 for qemu-arm@nongnu.org; Thu, 18 May 2023 06:08:35 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pzaYk-0002nI-4G
 for qemu-arm@nongnu.org; Thu, 18 May 2023 06:08:35 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-510dabb3989so2207565a12.0
 for <qemu-arm@nongnu.org>; Thu, 18 May 2023 03:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684404512; x=1686996512;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JM/Te4zeKkA1WovpJmHGh4bMjFSCsf1ZEe8BHG9lYaY=;
 b=xgr5RxULpU1g3f0V6h6nGIqbJQu3mwic4R4Vf9fliGw/w46SNy6WQToEG8qOnR5myi
 1ZBJwSzFZtHNUWvtHEZaDt3q/kqdY1bKfNxVym0UsDr9Z5ikjyNbhu6Gk94M9bk0HSUV
 FxLboadsqZ6LPcSdgdwQAyamXcbjeeebwlklHLIuZVLhdNy2aBV4W1AteyutKUsH0jE6
 HYXnvLURIU/wk4OtW8C9yHRyA8cJ0jodIPhbrYdO1xLigt1vKzjan7LfFtDG1wXBEEVF
 ShuPeO4gvloGZaQXuQd/nJfkXompmMRVjjKNFfg8YndO3WJVKgAqjpxGUJM7F/pmj6kr
 lVUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684404512; x=1686996512;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JM/Te4zeKkA1WovpJmHGh4bMjFSCsf1ZEe8BHG9lYaY=;
 b=dKECzv8P3Qx9D0TqzpWJsxdjtGP6Eo8rtEFGwvXYBHToZSeZI4pFqWU+cWzL1sviG8
 NUmCy910IK7hFEHhZN+Oyi4OUinLGC8/oZ+lxWuaH9Ux0uECZxzysr1PH4up7BATH67i
 WJBMrkD7FMzrBUDjadzgiGGH5feB0KhGwLeBSJwBtA/fXUnlfczYILOJKklibmjlNkPh
 PKzk04RYOvYUUVzFhZEdRyqFaKi1e5AjOu4uwOfjTUkyqM1E9EKsduvT345P7y2+3w1M
 EHWFxiofGCREP+exq2Lnj+SlDMeZDpPdeklpZ8f4jFen/H8PoHRB+1Pf9ihhcaoRY2+c
 92ag==
X-Gm-Message-State: AC+VfDzpqfQb6TRIyS5r4lQpWBCn/8dpMvN4g7kcWIVVPZZuP9yDSOTV
 W6sbOZHJJ4yRbMQqBbf4mQuJJt5u56dckqWr6qi8Kw==
X-Received: by 2002:a05:6402:31ef:b0:50b:f999:9dee with SMTP id
 dy15-20020a05640231ef00b0050bf9999deemr4386914edb.8.1684404511971; Thu, 18
 May 2023 03:08:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230515143753.365591-1-marcin.juszkiewicz@linaro.org>
In-Reply-To: <20230515143753.365591-1-marcin.juszkiewicz@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 May 2023 11:08:21 +0100
Message-ID: <CAFEAcA9fkBUfOMfz9yDa2nH=ouCZRDSczfgsMW3-Yr3r7okFug@mail.gmail.com>
Subject: Re: [PATCH] Maintainers: add myself as reviewer for sbsa-ref
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Leif Lindholm <quic_llindhol@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: RnJUi63kX5gj

On Mon, 15 May 2023 at 15:37, Marcin Juszkiewicz
<marcin.juszkiewicz@linaro.org> wrote:
>
> At Linaro I work on sbsa-ref, know direction it goes.
>
> May not get code details each time.
>
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---



Applied to target-arm.next, thanks.

-- PMM
