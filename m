Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp997038lfp;
        Thu, 16 Sep 2021 03:46:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxuORWyX4ne7nfdbbOE+sGBk9CqlOgbCAv8XUQhn9NIcHFQI6muvnSIBCeK+0AJYI2hJb87
X-Received: by 2002:a92:dc01:: with SMTP id t1mr3462885iln.267.1631789205020;
        Thu, 16 Sep 2021 03:46:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631789205; cv=none;
        d=google.com; s=arc-20160816;
        b=PV4urU3OgFKne04OUKdEZo7TkSfhdPkt9kWKn3+BYZmrf4Pc9LhA4DRKdsLARWlE4i
         gM86b9dBFl71BB9SNnZnPEgKP0Rwq/L2JGZ3MWC6I0AOjU6YOJNRAR2Z4CdfHWdTYsH/
         QS2aJTWVwIu3XHwAHljok3FLo+1qR+IepXbg/xYYO3Srk8yrzJbSKV2+pFTRuct9/VC2
         ytn7eOlXnToV5PPKBdqvMjHZBAI/YgA42cnJqlGv3F2gl9jA6XaPd3rRHS512q/a7qPA
         xqmvN9RVpUtDq5S1+iaez/ieyu1nqYhNiN4agPeCrbH205RW973NdIMGqb1Qkc0suJSY
         K2CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2q7fvYaIUiVbpbgyORmLtkXjsgAfiFfJ33FclJyfCPE=;
        b=iP6hwzsHbIWjDEOrWhm2MDSW0/C4PHwWQGSlfnLLIncKEEGZ7rgkbRRaA3rw6H87q4
         CLuiNk/CsWPNbd88yuUdcJ11oJpr18I6sTEw8atefnanM16ZScunJIGQfbAgyJcGFi8v
         9HzsAwKZGD5VkXpPGtUtNzZY6kSXjjpdbMQjpxyzo2jOJm1z35Vt54lWAFPsA/xHQHK9
         Itbeedm780p4/gpuOlxY0nBZKiCxGzQ+GNllyxxpr9kPOlb13HEKlJgvS50St0RBGzFY
         p9BLbczKTcSZINYjDGE2ETY1SwEas1/LQxhHW6MOy9w5jIObpf91veWS13K0Z+ebBV7Y
         fqgg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OrR4Rncq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g2si2587294jat.51.2021.09.16.03.46.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Sep 2021 03:46:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OrR4Rncq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mQoui-0005dh-BN
	for alex.bennee@linaro.org; Thu, 16 Sep 2021 06:46:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQou6-0005aK-OT
 for qemu-arm@nongnu.org; Thu, 16 Sep 2021 06:46:06 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:41685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQou4-0002WI-8M
 for qemu-arm@nongnu.org; Thu, 16 Sep 2021 06:46:06 -0400
Received: by mail-wr1-x434.google.com with SMTP id w29so8723813wra.8
 for <qemu-arm@nongnu.org>; Thu, 16 Sep 2021 03:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2q7fvYaIUiVbpbgyORmLtkXjsgAfiFfJ33FclJyfCPE=;
 b=OrR4RncqwJ1r3zqo1yrsbNly9XVgDVFtr/lbJAaLFsRWqhSyaXCVgz/XUxwk3vGvGP
 gff4GZxX8VW5BeAbHEzVdneAaUmvCbvuCFZzbJ07lVBFlPtsmqXBZ7W3iMmUgGs7OTYv
 hI6rvzabq5n9ZGzMFefw22NbP5tezRFxoln8P3bdu0b1nKZgEGDZgiLwgdbBdvvXRdWe
 wk0cAfuDEhJf+vJ3kIIuki2WLYfkyDRjPyt2dXm0b4OBfYdwRJBfZuAN2FYJEQkn3Eoq
 AkJF62lR78XnQNTqMqmRTP171Uwz8tS990l2H9LQUHjM27N+8QtNfPK952DYd8VH+SKu
 l3Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2q7fvYaIUiVbpbgyORmLtkXjsgAfiFfJ33FclJyfCPE=;
 b=hbgkEAQwjIPpQPxLS9cVdll/+ZPDq8WOfh91R3R9woKjLRM4mt2GoiMpyDzcq05C1i
 Vn2qTKBhrKeyr+3tLmI/e163BcXAdq+vxfOthM/ZV1zh6q+pm3yi0cscE1+5e1rt43Ei
 9aGcbwZ7XnFWL/NJ4cIDTT6cxj4BPR2s7WcZfdYS5zKW2E1RU7T7iMcq46PaHgO6IVbm
 cbH9LeLoQ77M38QuJ76ldZjonmijkQdMFBaKAM4X6pfjvHY6fxKhFzLeEt+RsilfZlE2
 W7NXRDnbbLY21Sw31X1DJnBTJ/rBZg+V0gUAkxHsJaSYszDsVzc7R+YwXXMna9u4KWSX
 4zlQ==
X-Gm-Message-State: AOAM531vWuJn6BTKdHfx5t17Ztd1Sfen2BsA/q20PR3oT52HQW185O0E
 5lJDD7AvEM3zQbDOeV7k5GceEaN7vnRqsqOkXXyKYg==
X-Received: by 2002:a5d:59a4:: with SMTP id p4mr5268325wrr.149.1631789162369; 
 Thu, 16 Sep 2021 03:46:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210915181049.27597-1-agraf@csgraf.de>
 <20210915181049.27597-4-agraf@csgraf.de>
In-Reply-To: <20210915181049.27597-4-agraf@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Sep 2021 11:45:11 +0100
Message-ID: <CAFEAcA8gOtHMOLSPKyhAMCPxtTE-JXTmUvy-HgGw+PxDrbqsdQ@mail.gmail.com>
Subject: Re: [PATCH v11 03/10] hvf: Introduce hvf_arch_init() callback
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Peter Collingbourne <pcc@google.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: X6rlKDmgReJI

On Wed, 15 Sept 2021 at 19:10, Alexander Graf <agraf@csgraf.de> wrote:
>
> We will need to install a migration helper for the ARM hvf backend.
> Let's introduce an arch callback for the overall hvf init chain to
> do so.
>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> ---
>  accel/hvf/hvf-accel-ops.c | 3 ++-
>  include/sysemu/hvf_int.h  | 1 +
>  target/i386/hvf/hvf.c     | 5 +++++
>  3 files changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
> index 71cc2fa70f..65d431868f 100644
> --- a/accel/hvf/hvf-accel-ops.c
> +++ b/accel/hvf/hvf-accel-ops.c
> @@ -324,7 +324,8 @@ static int hvf_accel_init(MachineState *ms)
>
>      hvf_state = s;
>      memory_listener_register(&hvf_memory_listener, &address_space_memory);
> -    return 0;
> +
> +    return hvf_arch_init();
>  }

If the arch-init fails this will leave various things
that hvf_accel_init() just set up not cleaned up.
But kvm's init function doesn't seem to bother to do that
cleanup either, and if we return failure vl.c is going to
call exit(), so I guess it's OK.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
