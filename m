Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp422347ejs;
        Tue, 9 Jan 2024 06:34:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEb334xE6SAS00/4J9yNl7aXCODlRnbmrQwM8lLpQKRbwHk2ALKLlkOBwhzAbcxZzIDJwjv
X-Received: by 2002:a05:6122:310a:b0:4b6:bbb9:82bc with SMTP id cg10-20020a056122310a00b004b6bbb982bcmr2051906vkb.19.1704810877179;
        Tue, 09 Jan 2024 06:34:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704810877; cv=none;
        d=google.com; s=arc-20160816;
        b=zNnkc0djdb+OJqsnPgmP0hTV8nkbp5BAalDpRGQa4vkjiV0RxIyRlmtsiQOAczFsRK
         QOuOuHsvN/Hfg1rqhtCp+U6s/qJNO7/OeHH5trJm/OGi4A695SUMjhtrXiKZZaLxmIti
         hYFu2yKr7KjqLHUdkOBHgxTHIbHOdDMEQw+zRN2fXWgTjBcfBcRjDfhqA9ysbXZGEYQe
         zB4/xKBADs9Ph+r64oV2zpSg5QtnCJl+xqLDFmbB3OoGhDUS1emXXWxDS6fw8OmtNvCh
         AbwlRu9NDeQSJrNzs+0NV1ecP9WCGv/C4h3ME7CVFA4cvuP0suA+iwaPj/jACsPGlBdR
         Tq9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=cKpiQmUug1k+ONhUsi7k1absNM74ek0qI+Tl6MsSYKc=;
        fh=OnVs1XLuvvbjynOi+v1iMHdd2+ZbxlF9Ks65B91rRZk=;
        b=GMG9IUGBd1MndDcibO65yc27tyA5YjG/vL8iih+G0LGBUujjuRFKT3RfmwLTYHl7Sy
         zcdsTXcczdUKQGGu6ys+J+hZoWMvuGk2Le6GroljuNjQA3FdsOSeVHQ+Xw5Q6XScHWBG
         j5rlXajulpL2DYI5Y2GSuvP3VOYTL2Hav3g+Uk7+JRlNTHX7vWAIOw3t+Zs676U0HIWs
         qVo+z2oUcHJDX+FWZopk4i87GPpeqQCxXdRE3Gpv86qZvQVGcswLK+D8CK1ZttHlE6XN
         8vVem/AfbMeh4LZSHGov4+Pwidud5fsSz2EOIQDdODxTjYFD/K8egxYP0uZbWesp8rVK
         KMRA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uF2CD7CV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w10-20020ac5cc6a000000b004b7545f10casi323350vkm.166.2024.01.09.06.34.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jan 2024 06:34:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uF2CD7CV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rNDBL-0005t6-L3; Tue, 09 Jan 2024 09:34:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rNDAz-0005l3-Kr
 for qemu-arm@nongnu.org; Tue, 09 Jan 2024 09:33:57 -0500
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rNDAv-0003gI-Rc
 for qemu-arm@nongnu.org; Tue, 09 Jan 2024 09:33:55 -0500
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-50e835800adso2921254e87.0
 for <qemu-arm@nongnu.org>; Tue, 09 Jan 2024 06:33:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704810832; x=1705415632; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cKpiQmUug1k+ONhUsi7k1absNM74ek0qI+Tl6MsSYKc=;
 b=uF2CD7CViqoXDZ25UxO31jeg9gqv0z1uIyZWqge/lhS55umEp05Cqa/N7PsK55EOOl
 KEg+H19UVrUSRtHXCi9LOUacMxLhokNaGOUn6L+2p29L8Idr0bSNp+vY981h/tRGTXmR
 1gk5MEmZxpl8JifsJ9UHcLw3sCdXhQdBQfewpJunXCI1+N7dW+VJSUztVRt6y8uyMga2
 B4C9DfNx8MGcftzvWaphbADzdCTqHPDSqO5H57ur9nKygCH07t0Rt3zmRmoiH4QAJpJx
 wJCO8ro3ydRz8XXZafb2cr0s+xusLIfJVdbQ/0oVc4Zb9jPq6eZ4yxPgvekionCJUdkI
 AU9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704810832; x=1705415632;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cKpiQmUug1k+ONhUsi7k1absNM74ek0qI+Tl6MsSYKc=;
 b=avImiHZGHETJgNmcn96J/V6NlYT84fVDkfu3I/PrKB+y+Mw1zKXOuvMapI9cwrpAHH
 pW3g0ABV0ZCeJ46Qnyt0wT919UOxWIm2tyG0utrbGz98Dw9tg5HLsBiYGlH69cmjw30j
 S6kjX1bSzq/jMnxySE2cmXlaDjm1MDtaVrSiig94EBjvTBjaxopvAbHhxGAmEid0vbGq
 NEm2ZdajySmhLjLTfIpW5IyUlbumUdB0JXPK5x7V5MUcmTZ2TbxvwRi0B6l9u21ft9sM
 AZeJrxC5WPD+dtVpfdLw+rwfTEAK3mm8yczJEjT7xGXKDsdyxxKXnuqvyFgPXne9wo1y
 twlg==
X-Gm-Message-State: AOJu0YztJgeK8U//JOGdL+jWoTuszvjFypE/AmYJ/l6BufixDGSUa3fs
 IlXWBY95YyrVCo++Br+QbwPqQXdYBsucFPcSHXsTVjOriMEudWW195ZSzGZm
X-Received: by 2002:a05:6512:b9d:b0:50e:6c1d:5dec with SMTP id
 b29-20020a0565120b9d00b0050e6c1d5decmr1962461lfv.23.1704810832007; Tue, 09
 Jan 2024 06:33:52 -0800 (PST)
MIME-Version: 1.0
References: <20240105154307.21385-1-philmd@linaro.org>
 <20240105154307.21385-30-philmd@linaro.org>
In-Reply-To: <20240105154307.21385-30-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Jan 2024 14:33:41 +0000
Message-ID: <CAFEAcA8P+kDHv_crqDmrbzzJHDpy1fe4T_tXsu8+nWggmjymgQ@mail.gmail.com>
Subject: Re: [PULL 29/71] hw/arm/virt: Check CPU type in
 machine_run_board_init()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org, 
 qemu-riscv@nongnu.org, Gavin Shan <gshan@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x12f.google.com
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
X-TUID: 73glWAxSMZdN

On Fri, 5 Jan 2024 at 15:46, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> From: Gavin Shan <gshan@redhat.com>
>
> Set mc->valid_cpu_types so that the user specified CPU type can be
> validated in machine_run_board_init(). We needn't to do the check
> by ourselves.

Hi; after this change if you try to use the 'virt' board from
qemu-system-arm with an invalid CPU type you get an odd
error message full of "(null)"s:

$ ./build/x86/qemu-system-arm -machine virt -cpu cortex-a9
qemu-system-arm: Invalid CPU model: cortex-a9
The valid models are: cortex-a7, cortex-a15, (null), (null), (null),
(null), (null), (null), (null), (null), (null), (null), (null), max

This seems to be because we print a "(null)" for every 64-bit
only CPU in the list, instead of either ignoring them or not
compiling them into the list in the first place.

https://gitlab.com/qemu-project/qemu/-/issues/2084

thanks
-- PMM
