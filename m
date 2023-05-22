Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp1119099ejb;
        Mon, 22 May 2023 03:59:19 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4YF0e0BUg7JXs6YVAX5Ppk+5R1FwY7IkFRZ8EkS+oHQRbaSw26VX5awU4cDJkxIzPNY7E1
X-Received: by 2002:ac8:5c4e:0:b0:3ef:2f92:464d with SMTP id j14-20020ac85c4e000000b003ef2f92464dmr17073322qtj.28.1684753159260;
        Mon, 22 May 2023 03:59:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684753159; cv=none;
        d=google.com; s=arc-20160816;
        b=bKuXmCYqd37pnEKRARTeo7R9cVrI4EqwMv4OAgXRm2ZiEaMsMTJSiFPpZyN537/kOB
         gX4V7X8O0R7oGjPkhgbnA5NujvYN7zmALwb5wzhJY52nYTij49VwxwQSafJE3KCiFhMs
         XVhftIrztGyLg6uqkmqD2sWtcOFJ/RX1vWb5hFzartUu/bJyPfU8KVP4oP7Rx42/F+IO
         mForEJf8/FCgGTP8gedUnNb5gRhi34vIKCSZdpLdIecaGvoSGiUhtZaCB13cNqvIM3Dh
         q74PGDR7l+DhOVesOYUO9zHRjjszh3Ym2xdNdlDadqT24PjbNuVVSExfalz+I4/V7J7T
         Mbbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=e14g96qyKM5XSqTsWdjMT6CNA9NJ//g+fNN1V8Pidto=;
        b=gFbKU+XlpC+q7hKg1Sc93LhBVU4XF7Dxt2kHvh3C34be9Qyw2biVtDWzk6q9WUlQn6
         GEsaAOUYre4yzJAUZJyLtEVztVGen51AuvcR59LHxoPl5BKrdzpeY41LXqeXq4vHrQ6V
         afn3dTfDoY9ohMzPC0Gl+RNOphRpS7mEpiM3532uOquOJ87cE5JwjcwFKKVx7pG3h/aS
         9LJWh1JAN+QjMv+YSwPYMZMWbAOvivjdXEP3cquRJF5kByi/dbh9vWYAoZGlgPNWcL9M
         uToSyIWAe1rxUGm8bMGlfyoatEO53/nnAUPZc+EBnum3b+Yr5DYDcIa2sMOYTEOaGb1L
         7GsA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tqs1VgZj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b6-20020a05622a020600b003f6b22bfe94si716149qtx.461.2023.05.22.03.59.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 May 2023 03:59:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tqs1VgZj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q13Fi-0003jy-G0; Mon, 22 May 2023 06:58:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q13Fh-0003jh-4g
 for qemu-arm@nongnu.org; Mon, 22 May 2023 06:58:57 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q13Ff-00041p-K6
 for qemu-arm@nongnu.org; Mon, 22 May 2023 06:58:56 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-51144dddd4cso5149978a12.1
 for <qemu-arm@nongnu.org>; Mon, 22 May 2023 03:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684753134; x=1687345134;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=e14g96qyKM5XSqTsWdjMT6CNA9NJ//g+fNN1V8Pidto=;
 b=tqs1VgZjQJD8lWkqrZe6xcko21QGBbL63zC237SGdq4ONAOwyMnk8tZVFJWFCXZeqG
 p7PT92/fzmcg9cLViRFVhY+dwhfvqCmI6B2nnf/f3dE7Yxz5o/lsRiDxM1oMXO+RN4fc
 N+4PauzA7EWNGHu5dFkyFZINcNIA81IlPUnX7ZoIVBBJMVhFld+IFxbNDikFFNvJWJd7
 zbTBcjqk2tw25/qKUMwXTVAu98D5EELVta2iQYfxMFV4X5GD3ZuN5Do8layKz7aBEBaN
 UtjEMBCiY6pNi4f1eDW/P/fUjCb/Zv+lscypYUlzsnI2fqX3rNs9TkHzi2OYlUX1PiXa
 LDsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684753134; x=1687345134;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=e14g96qyKM5XSqTsWdjMT6CNA9NJ//g+fNN1V8Pidto=;
 b=hpA6BoHQL2E1zO3VhkwEGftMAxpY7+C3uCMZVodqCAFLqdjOvT3h0/yfxy8dF0FDqk
 kkz2yH/jXZrkMVpzCFHr8b9C1uR2lhmktDkT4uLXvlwUPGFxsAVebMZXsPoJtQenJ05N
 GIzgGnGYYZibUEeCHXks1HfZ+arb6Eojh4jhwjt9UllqtzPFAs3IR+BHzYWcP9eUo1Oq
 NqWBmNgH9vim0FAlVfjBLiNp6ECyiIkN4IWNEZ+8EddedtUrB1I4sIO9RG5MNTy+IUqY
 Zvcprwai5eJm31PKf7S9vzgQHqv5YxfHYiLA4q9a0nJWuQzucRrUAxWphQiTL2NdYtWn
 3eLw==
X-Gm-Message-State: AC+VfDwfKBm0Sd4r0Aw8vKPWXMhteuqHCzM931PTJ6sdl9/SI585sRgd
 TdkAqnGmBZI5Ayka5mHQQaJOl2O63b9fnv6uceJMJQ==
X-Received: by 2002:a05:6402:514e:b0:50b:d0a1:f737 with SMTP id
 n14-20020a056402514e00b0050bd0a1f737mr7699722edd.7.1684753133951; Mon, 22 May
 2023 03:58:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230522102910.20942-1-sergey.kambalin@auriga.com>
 <CAFEAcA_aV0DvL3DgqU9SKKRsqCoMrvwbPoomx+NA8fkXKkTytA@mail.gmail.com>
 <e5f053c126a24a62a4e1e8d309d939ce@auriga.com>
In-Reply-To: <e5f053c126a24a62a4e1e8d309d939ce@auriga.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 22 May 2023 11:58:42 +0100
Message-ID: <CAFEAcA8bLr+_raHie4JxoEJAQ7cuj5nJKTYt5+7r6T0w8FFNsg@mail.gmail.com>
Subject: Re: [PATCH] [rpi4b] Make bootable rpi4b model
To: "Kambalin, Sergey" <sergey.kambalin@auriga.com>
Cc: Sergey Kambalin <serg.oker@gmail.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, 
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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
X-TUID: d5SP8VgTw9dl

On Mon, 22 May 2023 at 11:42, Kambalin, Sergey
<sergey.kambalin@auriga.com> wrote:
>
> Hi!
>
> Unfortunately it can't be split without losing a functionality. It is a minimal amount of code to make it able to boot the kernel (and therefore confirm that it works).

No, it absolutely can. Each individual patch should be a
coherent chunk of work, and needs to compile cleanly,
but it doesn't have to be immediately useful on its own.
The usual setup is that a patchseries adding a new board
gradually adds pieces like new devices or bugfixes to
existing code, and it's only in a patch fairly late in the
series that the new board proper is added and enabled.

In a 5 minute scan of this patch I saw at least one cleanup
patch that should be separate (changing hard-coded numbers
in the switch cases in the bcm2835_property.c file). Anything
where you're touching the existing bcm2835/2836 code because
you need to refactor it to be a better base for the bcm2838
work should be a separate patch (this is particularly
important so we can review that the changes don't break the
existing boards). And the usual approach with a new board is
that you have a patch per new device being added (you have
several here) and then a patch at the end for the board changes.
New test cases can be their own patch. Documentation (which
seems to be missing here) can be its own patch.

I would estimate that this will end up being at least 6 patches,
probably more.

thanks
-- PMM
