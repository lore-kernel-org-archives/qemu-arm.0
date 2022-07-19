Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp1875546lfp;
        Tue, 19 Jul 2022 05:09:11 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tkSYxL/ONZwRvPd9BT+YOtfpGCQRSI0xeHhwMYyP23XKjXOCRXerVxDOyabo7py99EF1Z4
X-Received: by 2002:a05:622a:86:b0:31e:9b00:68ba with SMTP id o6-20020a05622a008600b0031e9b0068bamr25184056qtw.390.1658232551336;
        Tue, 19 Jul 2022 05:09:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658232551; cv=none;
        d=google.com; s=arc-20160816;
        b=Mv37IjZb/LZZ/9YJjKyXesPylBcOhbI3TFrvbD+ZXbpwkI7hCt4mAeO6V32nT3rJGx
         en5GChWn5VvQn2+8mQFwNYfgdgVGp5pUuyah1XqYSqy3Zpy4/nneajOAbOM9wlS1vNgP
         gCT4KsAOoB1T4DUWBoJuZQ0iailkRJPUX9XVAs+ZI6PDWwhA6W6/mUD7oZUfM0EDPWaD
         7coHdVfcBqbhAAunC0DyHurwMbcD9ljHsMDlXOstLot4bIur5Tbs7LbHlqLPybp7aKir
         q1tcX5eJWcgNhhyjJ4nAVnI6vsFnwiO8EB7IspgDzC++j2idvMq9NY19s+UQ3iTICmXn
         fr3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=zzAbzje7F66/zQC8ppEuS2hK76mCtOQ1q5D/yTvxNoo=;
        b=qtebssdh0fJKHCW22RNepX1zislPCk9cqFppOdbPPzQ9IbalUDRLJIzpeFAYCjHGlJ
         xeuTFsnzfRWJoprAFBvuqBjhx057CtnXv/v1uv+zRDEJzDyONC6yw8liAjLydw0BdMeV
         trtt6kwoI2A5WSIerqbiD1whTgwsYkcvM3bjskdPbgL8XHvggq1DJTJObc/vU7P0Cx6Q
         YD0Pvlnq6CFwYII788Yym0egSCLC8ZqZ/ygJGi4XSRHDgGn8mjFgnZuVL948033JZwZi
         zEy+Wh71tbU7HSWDBkeTNRbvlIsQe85A8q+0pJchxbPOn9jw5qqWfYA9L6JVvIbro5R5
         rXPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rrTOpM14;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bc7-20020a05622a1cc700b0031eb00172bcsi2982686qtb.333.2022.07.19.05.09.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Jul 2022 05:09:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rrTOpM14;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oDm2H-0003Cj-RR
	for alex.bennee@linaro.org; Tue, 19 Jul 2022 08:09:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDm25-0003CM-SN
 for qemu-arm@nongnu.org; Tue, 19 Jul 2022 08:08:57 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:33301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDm22-0001F0-TN
 for qemu-arm@nongnu.org; Tue, 19 Jul 2022 08:08:57 -0400
Received: by mail-yb1-xb31.google.com with SMTP id 7so8500355ybw.0
 for <qemu-arm@nongnu.org>; Tue, 19 Jul 2022 05:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zzAbzje7F66/zQC8ppEuS2hK76mCtOQ1q5D/yTvxNoo=;
 b=rrTOpM14DeecJ5jR1deuTongc+xGLFn5hdHoWWd/EhR8GQr17c87Nsxk33qulScePb
 mWfH1nf9FSMzSYCmAKqsFSjW/JR84hfPPy6uOj2w0VAKm/X+bgEoGW/3tP12SArHmjkN
 Lf9SZ3flp9KVlGF3haskFYFbPtrPGXuDKZQk7QB+4J2vgIsgiHlGvqaNvd+gYfToOQxF
 IOpMqkqpwmSz4kexZN53mr1lbTsF8hm+5WjLQyV7JiVwiPTHkQV2PDbyPcIsdmlw7v2D
 xWJZr5r3mFpcVQv5XzGKIz/BxVNAqp7mF9d1862An2wQR1heNupRhn4tCfwUHYdoFrW1
 pD/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zzAbzje7F66/zQC8ppEuS2hK76mCtOQ1q5D/yTvxNoo=;
 b=RNQwZGYIRho63huOaR1WAnztltLA/7eGII7uJM4wJ1P4MDSwLZ4ZRW4Mv3Yr0Fq8OR
 P2lW7OiV04wD/63qS2kJWHsdihJFwLSTOdZ8aKFd59KGTDUmzaCyFW+ET7kMjnuhtSG4
 2QsJ6d0GGnlLXNWgxKrTIPuQzUAPV8AI+4e76GX3jOATNTbDyOvt3EIXE1pWvg+/1IjZ
 SeVDACF83nk2h0g841FPFjSfCnzibvbO3wpSD42ZdK2bZoio+O7vMfoyr6Q0J+nZ++kW
 SiIU7gXG3yigDOQCyr0L7UD+2uDyD0Dilix5nDfeE3tzTKIUbN1O3PFw1M5Ajjd0iAI4
 Eaog==
X-Gm-Message-State: AJIora9EK/2/HKTRZfh2e5qWYOvqvSoEIaJ46sFeyspfIxu365Gl+7UQ
 9YjfXUFmSM1XkXl2o0ZQin0hy0L/CdDP8oQDMTUmGw==
X-Received: by 2002:a25:bfc7:0:b0:66f:563c:d2e7 with SMTP id
 q7-20020a25bfc7000000b0066f563cd2e7mr30844485ybm.288.1658232533725; Tue, 19
 Jul 2022 05:08:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAL7npF9T0148jkgTigVfE7cSzH2HKqy0NG0VQtAH2HMXjdBOOg@mail.gmail.com>
 <CAFEAcA8RHhRcrMSO_3MK0hSH=zWzde7S0DHHaLPZf4jOv48RLQ@mail.gmail.com>
 <CAL7npF9hKFsQF18Udi9QFnRZSH-G8cafXHBSBQcrs7jpJmPd7Q@mail.gmail.com>
 <CAFEAcA92=ne8weVYDnLLzNk0+z+aMFJgOJvW_7hSYcY1TimyHw@mail.gmail.com>
 <CAL7npF8Hg7hJBxw9j-1_7GRV_E52KS+hP1WXKfD3+r05C=CBgg@mail.gmail.com>
In-Reply-To: <CAL7npF8Hg7hJBxw9j-1_7GRV_E52KS+hP1WXKfD3+r05C=CBgg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jul 2022 13:08:42 +0100
Message-ID: <CAFEAcA8tGiaXq+y40-BtdG3jiBJpP=L6x9tsPL_5dF6dr=afEA@mail.gmail.com>
Subject: Re: [qemu-arm-static] timer_delete issue from Qemu 5.0.0 onwards
To: Jon Alduan <jon.alduan@gmail.com>
Cc: qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb31.google.com
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
X-TUID: y+OVYiXSZlik

On Tue, 19 Jul 2022 at 12:58, Jon Alduan <jon.alduan@gmail.com> wrote:
>
> Hello Peter,
>
> this is not what I expected. I did the same as you again to be sure I was not missing something. but I get the same bad result (see below)
> Are you using qemu-arm as static bin or qemu-arm as dynamic bin?

My qemu-arm is a dynamic binary, and the guest binary I compile
static so I don't have to mess around with guest libraries or the
QEMU -L option.

-- PMM
