Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp3508956ejx;
        Tue, 15 Nov 2022 02:49:31 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7MyboXrNHiQOTYZOKS5cgHI3MLxUq4sIneZrkSJHqTHYY1p0pWJxJqrHhmacDKrToVakKs
X-Received: by 2002:a05:620a:1455:b0:6ee:80b5:32d3 with SMTP id i21-20020a05620a145500b006ee80b532d3mr14859720qkl.237.1668509371225;
        Tue, 15 Nov 2022 02:49:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668509371; cv=none;
        d=google.com; s=arc-20160816;
        b=DFMiPxt9aqsXtebBHKKk/cSfRmIT9hNNM7/3r6lekNlZYBWz3tUgpFCxiaxmiJglSg
         NoVRraB+ABDdCcIDoyBvioROcQxA9j7M5lR/pqviFRViOJu/zvGcW3yOd2HqMsYBfqnU
         yn3QlZs6waxyS8CGsnQ7n/xXoshUhCbf+RUR9BE8I9X2mMOxK4M2J56zOXUUHpOf59Aw
         t+rTmVOHgCEMjAh2DXB/4Lcbbf1mPQvAXuQLKsSNVg/svtASr3uG1VHVM2aznAlmMt0N
         Vdh5V0W4wJDFxJUsnRkcNrCqAT8tjNXPRRYNQTqGxL8RUsMJ1GYDBKux3JavJ5FQ6ZtD
         djDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=BOo7tIQW1jJVU3f8wXs7fkjVNUba58r/CytY7zMfiP8=;
        b=aw6EiSfzjDVlMdEK085nqwtTsNcCIwAIvpvW8Z5hkw665QWpZqI0Qr7q4c8RwX/TZu
         3PU0nasziypDVrdemVq7Wf8QXS+V4slm9DBRsFjwMEwfk19IWXdxBSZ0eFw9iPWrooV1
         7vkaz4M56jljHQTjda26nIwNWc/pBpmQyiebJuNkp2W7znMYWGBEmZV8oxdJrPOSqe2o
         +SwbZactTOfl9OnONKVd9hXFJ9dfKVolEervw8GKMB1jsuXyGy5yJepaYus6kL119XMU
         8JNtcH9iuEIqIlehQLA5DfZwGTbvsPpvWMD/c4EfK3R81bu3rHBRb229i4eFIv3rTqKw
         k+MQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=B3JRgU8D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z126-20020a379784000000b006ce2d5bf389si6769462qkd.271.2022.11.15.02.49.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Nov 2022 02:49:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=B3JRgU8D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1outUv-0005Ld-1O; Tue, 15 Nov 2022 05:48:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1outUt-0005LV-CH
 for qemu-arm@nongnu.org; Tue, 15 Nov 2022 05:48:55 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1outUr-0005tR-By
 for qemu-arm@nongnu.org; Tue, 15 Nov 2022 05:48:55 -0500
Received: by mail-pf1-x429.google.com with SMTP id d192so628273pfd.0
 for <qemu-arm@nongnu.org>; Tue, 15 Nov 2022 02:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=BOo7tIQW1jJVU3f8wXs7fkjVNUba58r/CytY7zMfiP8=;
 b=B3JRgU8D6xf3f1AWEb1lr4e7o6NGJsXF3eLZ6g3FSoeYex7D2cgEKX0mngZE3JwpF3
 LAKqRTOUyd+rV9zXYGcvE8S6CrXN0z5CTiwMjkIIU/9eTCEMqKPXqAZsf5gQHiV78U/X
 busvY3DnDZ7YzSRcJHrtlmdNEaOfXqgXJWJbo6Plby6QoR7bnAF7nsM6wmBOUYtc8jAe
 pbe3C3r7OgJVRBl/p8mSo3lBXLWv2+iXilEQ9TFZAji0LnOLV7x5rapHdSSproaFDnDe
 Up2jx/c7A/3iBI6eHddZhQoQ62bmt+mxtptyhe+jA5r26/zSndAj/yl/fFH+Q3F7knnN
 JJAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BOo7tIQW1jJVU3f8wXs7fkjVNUba58r/CytY7zMfiP8=;
 b=NL8ON17sfUBTVAGFO0TaQ8PMX3HuPnDAXqMMggHsGUbtFF/1qo/5OdowVi0GxOAevq
 y4uAKSsCJxxnypYOl5DXMbHYN6jLAKw5tuV+SxA+iUGama2al688VcNNf9YHWcwEbttk
 T/MNek/ItxtISPYGIhgoyIDTDm5LVkiAqiL2BLDaik8uyo+djCxPtQTy260QDkEwwhjU
 knsGfjvP3NnQuttmzT4CJkhPeZb19hxRgQBC822IJF3Dq53DlrD5yHrwXsGcwIbcqwdW
 7PRqpmiBMqIj1obIUetnQPL8lpWucjTAhvTIRTu0K3MfG3pbg0fhbdjmRgafq75yUryq
 y01Q==
X-Gm-Message-State: ANoB5pltRXruTKbIoRBuOaPBLuKeIxygrT+3M/fqj2/W/Bn3lBgsGphX
 3NKgkUxfDkCl4tcrNu5DAs5aA8e9glSOgMf6u2a9qQ==
X-Received: by 2002:a62:6001:0:b0:571:8549:89c3 with SMTP id
 u1-20020a626001000000b00571854989c3mr17692749pfb.26.1668509331563; Tue, 15
 Nov 2022 02:48:51 -0800 (PST)
MIME-Version: 1.0
References: <20221114190823.1888691-1-peter@pjd.dev>
In-Reply-To: <20221114190823.1888691-1-peter@pjd.dev>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Nov 2022 10:48:40 +0000
Message-ID: <CAFEAcA9itEDTrznX1KRVEza__Dch95aBpPzbdTJ0-tuxwiHtoQ@mail.gmail.com>
Subject: Re: [PATCH 0/1] hw/arm/aspeed: Automatically zero-extend flash images
To: Peter Delevoryas <peter@pjd.dev>
Cc: clg@kaod.org, andrew@aj.id.au, joel@jms.id.au, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org, patrick@stwcx.xyz, 
 Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: AQ2zOPQBr/WT

On Mon, 14 Nov 2022 at 19:08, Peter Delevoryas <peter@pjd.dev> wrote:
>
> I've been using this patch for a long time so that I don't have to use
> dd to zero-extend stuff all the time. It's just doing what people are
> doing already, right? I hope it's not controversial.

We just had a thread about this kind of thing for one of the
riscv boards (although there the attempted approach was to
change the size of the flash device to match the provided
file, rather than changing the file to match the flash device):
https://lore.kernel.org/qemu-devel/20221107130217.2243815-1-sunilvl@ventanamicro.com/

The short summary is (a) yes, it's controversial and
(b) if we do something for this we need to have a standard
approach that we do on all boards, not "some boards do
some weird magic in different ways from everything else"...

thanks
-- PMM
