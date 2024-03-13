Received: by 2002:a17:907:991a:b0:a45:b507:d90a with SMTP id ka26csp2682939ejc;
        Wed, 13 Mar 2024 12:41:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWrHLVJ2O+nSNNhXIdNxVxvzLB7GmxK3d9krXZ1hxpf32fUDS0GT7Lqst9sK8dUX3m2ak+6YJGBIhOtll6PbeKqrxybKuIr
X-Google-Smtp-Source: AGHT+IE+PZCkqQPRpyWwIdAxfyRfQR5a2G1lhYNiccz7d/7Xaz5bO9HjDL2gIWGgqS48i1GTxf0K
X-Received: by 2002:ac8:578b:0:b0:42e:db67:fea7 with SMTP id v11-20020ac8578b000000b0042edb67fea7mr17159270qta.0.1710358879242;
        Wed, 13 Mar 2024 12:41:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710358879; cv=none;
        d=google.com; s=arc-20160816;
        b=nlRZ8gm9bGYIoXNGhlQ0zkQLOJ4fp1VD2b2EM9v0Fx8nvH8MP7jGJcyy6ON238wsE8
         accSrq2at2PYNJ8yXSvjvoN4XHCjAgxz9Ef6DXCY9pFNEnuSHP1L7jrkwKb6+A09JP65
         OgEwmoMfT8Wv4j/f+1IcDHTycTuTOkB0RSa/a8sVVHqGcfxpvVOuhESnggIo9X1+QUFt
         zB5NdaYaODgy8tYruQhJ/Ndidv5NF93f4AITmr40vhUUpP5MYBOZXj51qb+GVY2bLGfV
         b1koJzv8SPR/o43joYJGywiWzv/6bDonE59R3C+CAFMwNRJ89nvnOxiGjqf5b651qZii
         Pavg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=Wv6PR31IpeRCrdiWV9ppttAHnl6/2+vuVtyTTu0/Kpw=;
        fh=As/M8wMu2pSZ6ZOqhhcGzI2igSLMIvtQ6Wm5/yRLyG4=;
        b=Iqca1Xu2qw1pGhZ+dbJpZOMFvsV03whNdkhbX6MjxUYFE1nZY5WqYVfH4W69Qr2FA+
         r/dOvK65WKvwwqjlN7kGidk1dY6r/ZHNoCXJQy6yNCaY7dz+u5C6+DS3YhbZozSfVqII
         pdU3077yERQtM3lmNopyEAhp7hEK2NpMVZno74ktna8YpTbGr6G3lxFo/6imTr+W/l4s
         wXPbRvVAWF75QDM01weZlz33coYVMLkMpXkIHIOzroEhia2JM756LMF6y7/4nIttpUqj
         Q4js9YKh4jgxQmwNeGrlvLlI1fCcu7nSlwzQLBRTq916eZqMqAGXjopklLvtU/lpm/oO
         zLQw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="BAyJAP/s";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z20-20020ac87f94000000b0042eec512246si10853026qtj.349.2024.03.13.12.41.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Mar 2024 12:41:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="BAyJAP/s";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rkUSu-0005yj-07; Wed, 13 Mar 2024 15:40:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rkUSs-0005y7-EF
 for qemu-arm@nongnu.org; Wed, 13 Mar 2024 15:40:38 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rkUSq-0004Av-Vf
 for qemu-arm@nongnu.org; Wed, 13 Mar 2024 15:40:38 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-56899d9bf52so259778a12.2
 for <qemu-arm@nongnu.org>; Wed, 13 Mar 2024 12:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710358835; x=1710963635; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wv6PR31IpeRCrdiWV9ppttAHnl6/2+vuVtyTTu0/Kpw=;
 b=BAyJAP/sovCD0ieAYGcmicAKqPhmzJiIXzvT6w6x8ypAYHMYrrtciAwjfbUeUDAP5h
 owKEpQ7dHIlIik7BOGX2BjFkWu+F4FOfp/QmUf0XyToERgixkUXu0uJCl2xan9vIn1uC
 +gh+CC/Hf7QKQe3riLAu9buZa5+zbWzYX+KG2b3BERq3i3+HAki3tjqzvXdWZ9hGXjYS
 /l1y/fHMs5WzJU2AvQScf6090T0W+djMD9/8U+fPdYHiKZ/kd5cWWzUlot3k1zcnrP/T
 fgKxCDCggEsFwH+E1Tn6dJpmY648PqYZWEdVHf4dIIH+fksMJvmpArVjNSjME90hPLUE
 ALOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710358835; x=1710963635;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wv6PR31IpeRCrdiWV9ppttAHnl6/2+vuVtyTTu0/Kpw=;
 b=oPveMxd9ZUYNXHkOpkAW3UOju07l+sS/i0WYawVtJDXXZn+/22GqIoN93vhLmqrazP
 s8Lt0xnmKhTKNN4JhsYXpGQqyggD8h8P3J/eUhU9+rQORUPrPcIHCtpT4coZp55ExtNO
 o/u7vEvDysyVIZFwGWGWYFKbcDK+wFozBoTp41ujpdIHqI+guOY5xrx+X+yc/FCwhYWX
 3bbNNA9oQIObrI5lkBaPL1Xyi62o+pglCBmvyMt54hdgfb2BJRAn4Rf956Nl8C3JsIQJ
 BzTeQrLm0fKi73+uRhoNR8/RK/KmcfT4rUdyHqSzzpdOedUV4SxG5CiZnw/OtIjYAb4a
 A3Pw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrCeFFVzDsFSyblbJO2MWRpe8l8fAhGbwT1RjwpxfyyV/IN1C5sQGDue1KXsRyV0yNPZgo9Nf9C2mtHtLzVV9dwiyY
X-Gm-Message-State: AOJu0YwgPl2EfgpNZNsSX/ruedYqbQCPUmE5UQsIm2lnZpYn6TxPG7dr
 SDZuKpzEbdf2k/ay55JbjY3H5oWWufe44Nk1wY28Wea2Szp7QOK0hiUSwv8CAsgs17jSY1c7uBN
 GRTTVBrMnJIBAb+oAayjeU42Q1JnH9ysAznnSHw==
X-Received: by 2002:a50:934a:0:b0:568:1882:651f with SMTP id
 n10-20020a50934a000000b005681882651fmr9461639eda.25.1710358835488; Wed, 13
 Mar 2024 12:40:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240313184954.42513-1-philmd@linaro.org>
 <20240313184954.42513-3-philmd@linaro.org>
In-Reply-To: <20240313184954.42513-3-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 13 Mar 2024 19:40:24 +0000
Message-ID: <CAFEAcA8KhyikEOusdJwFR5JbuDMnx_rnzm5w=U-OVcpDaSy9fw@mail.gmail.com>
Subject: Re: [PATCH-for-9.0 2/4] accel/hvf: Un-inline
 hvf_arch_supports_guest_debug()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, John Snow <jsnow@redhat.com>,
 Alexander Graf <agraf@csgraf.de>, 
 Eric Auger <eric.auger@redhat.com>, qemu-block@nongnu.org, 
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <rbolshakov@ddn.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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
X-TUID: LjU3NqtrdVqk

On Wed, 13 Mar 2024 at 18:50, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> See previous commit and commit 9de9fa5cf2 ("Avoid using inlined
> functions with external linkage") for rationale.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
