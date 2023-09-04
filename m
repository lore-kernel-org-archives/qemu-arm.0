Received: by 2002:a17:906:cc96:b0:9a1:fa4e:495e with SMTP id oq22csp1455253ejb;
        Mon, 4 Sep 2023 09:33:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxJOVseJEYOBbg82+bdV3McC5TfDlDfiag+f04Ds/INNImMTDuLB/N+rDdBAHGsURn2G5n
X-Received: by 2002:a0c:f390:0:b0:64f:92dc:3de2 with SMTP id i16-20020a0cf390000000b0064f92dc3de2mr11053332qvk.53.1693845226595;
        Mon, 04 Sep 2023 09:33:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693845226; cv=none;
        d=google.com; s=arc-20160816;
        b=PfY9fHGwnXnozoBEc0nbsM4U+6j9+j+zsfNRIbdegmUAnga6k44hnT2oaetXlDNWQ7
         c+/1ckneueIJCir/k5Pde8lRQe42F8V8SS+EgloYDleL4XjOmYZUkS2k/t/+6tqKW5ER
         +dTGbyg7c5LCcmI1o3kYxQFmv3MDFqqN5lZ2YIuaEv0LRpkMhVlSp7MPBwwFtT5jHz+f
         XLIqtIiSNaKL2Y7D062JK43lo9WpnZqcIxhY7co1GHSczr1T/4g2QsHIu9yiGTZxxfSn
         b6pWpe8TYwQcIY5gDnzusOvlWePFLhZOR7cxKm/ClBGwxYlh3UaCo4sGrRFQLUm/YICE
         esCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=+xycqdc9Ymk7oe+LUm8seOyH13Zq99UAqZnrpB2/jxM=;
        fh=bubqp9m74sAKImezVyVBO1FKnc+UGZvzYKdz59crUxY=;
        b=oh+msVImusKyx4nZ+lL+nqCLHrsLEZrNSpF07mDnvCHmxblaHDAApHcDOVVLO/AZgC
         aJ6OEPuWniefRmuovb6db6hY8SfymqIU8dYxXGIvje1rRS98hMpnTHsrehj93opMfK25
         /Ggps92MMbD9TTIF9ZTDOj5MlL3DqlYK03GKxPY7rRyAD7kYoyMZ88plpPDV11S3INEi
         ZsN52zPLJS538lx430FHtZ2LM+E9OBrPrzEnKGGj7nXB1dYyni2kZ4Lx6xBnmw80fOlB
         Ut4CgvmRgU/dQjtO2klYiog/MEUlHL0xkU0W9TVrEpHep8vKdjdqIQodPh1+AzXQfQKW
         mDVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fhWDpKzO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z1-20020a0cf001000000b0064b7f0617ecsi6680237qvk.206.2023.09.04.09.33.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Sep 2023 09:33:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fhWDpKzO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qdCW3-0001ap-69; Mon, 04 Sep 2023 12:33:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qdCVz-0001Zo-Ow
 for qemu-arm@nongnu.org; Mon, 04 Sep 2023 12:33:28 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qdCVv-0003Xl-V5
 for qemu-arm@nongnu.org; Mon, 04 Sep 2023 12:33:27 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-52bcd4db4c0so3539069a12.0
 for <qemu-arm@nongnu.org>; Mon, 04 Sep 2023 09:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693845202; x=1694450002; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+xycqdc9Ymk7oe+LUm8seOyH13Zq99UAqZnrpB2/jxM=;
 b=fhWDpKzOMbeQN/gvNJLBhhBc0O7m/pqefvhyMrGrv0CXVAzEbjd3P65hou9HIaN2gd
 2XezmaKw9jjw9zx69Lt6pLNVz1D0/v1q+d6SAM3LYs1mGXlknnLKb7oKQk/fjOT4kv45
 1Klto5U9bNpM/1kto7rLwBXH50Qy3cx7ansGklFZPsC5B/MsWYw/aq+KCKiWudk61NQi
 ngnFEXltJvdjhJE5abKGfF08tQwxkompyStcT+iwg+/fk13jJmdVyQ6stA2vmC6l/BUN
 ZsinWsgzOtJYo07pi4MdYumsgjJgcYC4PgfWvM+WWbiYSTV8ffPVpxQ39xv/EO8/Gfib
 X1mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693845202; x=1694450002;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+xycqdc9Ymk7oe+LUm8seOyH13Zq99UAqZnrpB2/jxM=;
 b=di4Gvk+wHm0UMG4D9txaLANTZTLHaFKlT8ifgtWtXIC0NnVpNZG3z5Y/XkZ91GGvAA
 DopdpMLgXdCh+cWsej1fdLDNLYyCF+Uxa/XIv3MQ/ui2nxEuHI2p/FcFnasSkZxEx0UG
 8k9BvG8MDxHSWtTuf17Q3gk9vgydKnxM+JdILoRHSqks85F7UIWzVp7LYhMqhME6DUef
 VWD+3VV56hKQfGsf/Sob2x8zMO/eMPbFdy1WlXY3d1N1qlXg41p6Ls1VJEpFKn/t7cJ8
 LXD91IGwDUfXOSM83drcufH9LfgXjpzWnkduam54r6hkYDcZB7bUZE10I1HrvzJicnWu
 Xwtg==
X-Gm-Message-State: AOJu0YzyKOj6CNUtoWi+rHInnCNbYzNqHG9nn3PdsY4jeGrKUhEow4hj
 4lWmVPKlKth7gXgHPeV52+FokkSMK/57QBOfLsC3vQ==
X-Received: by 2002:a05:6402:51d0:b0:529:d147:e9f3 with SMTP id
 r16-20020a05640251d000b00529d147e9f3mr14848201edd.5.1693845202418; Mon, 04
 Sep 2023 09:33:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230904162824.85385-1-philmd@linaro.org>
 <20230904162824.85385-3-philmd@linaro.org>
In-Reply-To: <20230904162824.85385-3-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Sep 2023 17:33:11 +0100
Message-ID: <CAFEAcA8jO5Ktqf4ND79=Di=BnuOPjp+Hw+TM9fN6UNj-M8-POw@mail.gmail.com>
Subject: Re: [PATCH 2/3] hw/intc/openpic: Clean up local variable shadowing
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 qemu-block@nongnu.org, 
 qemu-arm@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: MWdAfVUdRyeu

On Mon, 4 Sept 2023 at 17:28, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Fix:
>
>   hw/intc/openpic.c: In function =E2=80=98openpic_gbl_write=E2=80=99:
>   hw/intc/openpic.c:614:17: warning: declaration of =E2=80=98idx=E2=80=99=
 shadows a previous local [-Wshadow=3Dcompatible-local]
>     614 |             int idx;
>         |                 ^~~
>   hw/intc/openpic.c:568:9: note: shadowed declaration is here
>     568 |     int idx;
>         |         ^~~
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
