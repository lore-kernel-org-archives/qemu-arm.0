Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp1228675lfp;
        Mon, 18 Jul 2022 03:48:54 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uVzmqDNcUCkqk5Qgwz56VnCuSeZVxFw8aseSLPwjOoDU85N7kP6oHqKhUj2IdnjStq+RY5
X-Received: by 2002:a37:7c4:0:b0:6b5:d6ba:3ff8 with SMTP id 187-20020a3707c4000000b006b5d6ba3ff8mr7152404qkh.98.1658141334438;
        Mon, 18 Jul 2022 03:48:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658141334; cv=none;
        d=google.com; s=arc-20160816;
        b=FLZPXI5Jg7A65qdKJODUUaS5J3WJyNZnuHs9ER67/YjFIcMzTJGhiC4ZRLT/H3YDhm
         1DryjqAV26syuoFRfw3Fh7iHbVZ7iAB+aOv/KlipMljnSF1J5iYf53HiCLtAUVjmNTqh
         I9FUrWFFGPuNPebn+IFe8WYI66TQVjevL4NJKViEpl9XrR4LvGyt9BZaVGpbNzYKi49P
         3RtkpgLSvMwzqBGXKjM4OKdBoFcEazeM/uQaEJxYeQe4LVLpOegGEMu4dN/4h2MeTGyc
         U8WlhcISk3zs3wJIv4DL0o7TKyAqBbvtaW6pYO6cFDnJiQn4HYzKmjyR75pS/0s/TwbQ
         v8+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=D8aYZR9L6JQDRX/RDGKze4HXJ5HuISh1PmJpbh59tEI=;
        b=oyLsNsFXYYttv6nguLYv6W2eFcxDhJ/R2Zx03Y0rUvO4vNlRlsSPCiLmwF1wIFjiBG
         UF+AsWWFYXN0dJfQVUqXf0+EyDihRMpZOms+0ga/PERF9PS3YDwvpk64y7Hi5tANN+hh
         izBnE2Ka1EDvek4UmO4PPrTGfS0NqiPSLkPZJY+iYcQoR6srokhfm3LS3UmL8DtAIy+u
         7oXIjtknnE1jTBCmkaptNHgxhlpChn7pkIz/MS57LyRilqVXVuDtR2IXbNxcXMFRcMZe
         uIPG5W4txjdeEakrJt4bkEF6rren8k9E/7JLRl3/SK5HeYyOvDVretQM3uikvAsH0/qt
         6Sww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bgftrLUi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gm15-20020a056214268f00b00461d25cf032si5628673qvb.491.2022.07.18.03.48.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Jul 2022 03:48:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bgftrLUi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oDOJ3-0000NM-Uf
	for alex.bennee@linaro.org; Mon, 18 Jul 2022 06:48:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDOIl-0000Is-Pe
 for qemu-arm@nongnu.org; Mon, 18 Jul 2022 06:48:35 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:46059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDOIj-0003ng-KF
 for qemu-arm@nongnu.org; Mon, 18 Jul 2022 06:48:35 -0400
Received: by mail-yb1-xb35.google.com with SMTP id 64so20008954ybt.12
 for <qemu-arm@nongnu.org>; Mon, 18 Jul 2022 03:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=D8aYZR9L6JQDRX/RDGKze4HXJ5HuISh1PmJpbh59tEI=;
 b=bgftrLUixh5bAqivf8Xz5xuVPhed60qcxCA/YmYzpNComjY+UvLW3rwERYV+4S7y7k
 LU651yc6IFh8Ya7m4nfCea83su6CHgpk/YkCDUoXkY7za2klUmG8ZpREHiqoNannQeck
 pEcPkyS4OO6Aax3ujMy5IsCzn6N6Jsh00khXewW4fwZQKwgSjsPYUqIMeqMNWSwF79US
 Oul2FCGFf4Zab3xpOFaPvwFcb1hyKna0XcfpbAkmUuCXuO1lEInxLII8eqxTO/RtlLKn
 cEL+SIiKZKiN5ddC8iL/ONGArJdShp412nIUHLJUCYX4wABEYoQg88RDzVejtfmh2moD
 fbkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D8aYZR9L6JQDRX/RDGKze4HXJ5HuISh1PmJpbh59tEI=;
 b=DdDHrX7wB9yimLzZkSO59Xjhf1DqhMocpcJF6vJ2Vu2hD86IS975pNf0wJ0n0cOKdd
 qMwkMfYIUbN9+azjfUvj8+ychmuB0ZVr2/HAplG4fIPH2MKIQItymuVUjsICaODoNRr5
 rJWuzqGY0Laa8l/Ce5i48je+IjmgW5pkozXeZKL9yjpw6bKByC2yTNG7VLd1wyqh7kV1
 0x5UH/xonxLUjWLH4vf/mhhKvzsDrrg9WHlVQKUtAHE2QHVYEq0GIixp0goOmbndgTaW
 4DhrG0mtNPBzg45ZyqlOt4B1nlcfSb2AjZYOGL+F3KCtJ522UNUkSbD6dfSTv5j+VxpC
 LDpg==
X-Gm-Message-State: AJIora/wR/2SKKuCdK0k35VwKU2DtlYVNpgNNmC0XWy6heBerULHU6vi
 uaH4SHJM2G+WJV3xWMtEUVUXBCdGJ/psms/WYmsraQ==
X-Received: by 2002:a5b:dd2:0:b0:668:fc4a:9403 with SMTP id
 t18-20020a5b0dd2000000b00668fc4a9403mr26676658ybr.39.1658141312621; Mon, 18
 Jul 2022 03:48:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220708154700.18682-1-richard.henderson@linaro.org>
 <20220708154700.18682-17-richard.henderson@linaro.org>
In-Reply-To: <20220708154700.18682-17-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Jul 2022 11:48:21 +0100
Message-ID: <CAFEAcA824kVbQHjo8U=Ymgx3s0yLmWgEJK+2uuOzG8=965CQrg@mail.gmail.com>
Subject: Re: [RISU PATCH v4 16/29] Split out recv_register_info
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb35.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +3MOj31RsrDN

On Fri, 8 Jul 2022 at 17:36, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We will want to share this code when dumping.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
