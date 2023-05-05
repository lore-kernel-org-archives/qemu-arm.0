Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp320290ejq;
        Fri, 5 May 2023 03:41:38 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5v7ArP+z/bHlrljI/VH4ZLcdf6wIPQ6ZFnFzdv+MGi2DvJYDCTKPLviZqnjquAYMG3cTCH
X-Received: by 2002:ac8:4e4c:0:b0:3f0:b56b:f397 with SMTP id e12-20020ac84e4c000000b003f0b56bf397mr1420621qtw.27.1683283298064;
        Fri, 05 May 2023 03:41:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683283298; cv=none;
        d=google.com; s=arc-20160816;
        b=OceGF3xqzxCHrGKfkqpo35F/cujrOAf8KbzmjJzcgbpVksXictziw9OYpnCXHiKr1l
         0LYpEyWfCAg1hmJaDEKRU08LFtvfjxAmZdl5S3beJ5FEqXTyreTacxLXNfq3aqi7zhVW
         9fyAH0J9DF+rjXJEVyAuNmPcjo3/YNMsq07hOxLtkxKTYPQ+FvMb7Jb2LqVeKGuPEoqI
         9jtfQc/N28r20ymODZ9859bqB44a1jeAINSX0ZUMVS5cD042r6DXP66P40BssINs/+ZU
         lr0UiA33wGgxBIxfnX5Awf0KJnHTK+Pi6HHFw9+3hJXf4+qO5qTjKaTIXqyL0rg1auZf
         +LxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=GGUYB/K0rHbygF7dcBo384KEw+1cPVilG6zEPPYTpr8=;
        b=xLUlFufDO60s6tr5r4bxF/wPt/RZjWfu4Tni9PMAVRqQ/lZZG5dZcm2so0JhuX8HbT
         cLWtq9FzLKWZCXOQux0wTV9xC3z9sTLTxrtdP3/OrEJd3ICjRLMvM0pSyB+Kqm/NfBqW
         kolpkTrXdDttc2FzQV6xB9/IcxSMhfT/l0XYwNctEdgMOxsdQJNWG/WTKVc1NaUb2W2h
         N0oAGX4s7lZiS+/sAIyXiKMcy85rSmMUqw3UYiqCGjrzqAQKOJ1jEYfXwvcWCC8HHZsM
         +262wsjdK4gAgEgj3kdTlIhf0HfUOc4/ojyvfj06nHIb//nZPL0PAImHDiL377IkEUfE
         vpPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QpUPdjya;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n15-20020ac85a0f000000b003ef41417024si464320qta.562.2023.05.05.03.41.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 May 2023 03:41:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QpUPdjya;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pussM-0001Qh-JW; Fri, 05 May 2023 06:41:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pussK-0001OQ-TK
 for qemu-arm@nongnu.org; Fri, 05 May 2023 06:41:20 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pussJ-0006bo-Eu
 for qemu-arm@nongnu.org; Fri, 05 May 2023 06:41:20 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-50bcb00a4c2so2518136a12.1
 for <qemu-arm@nongnu.org>; Fri, 05 May 2023 03:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683283278; x=1685875278;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GGUYB/K0rHbygF7dcBo384KEw+1cPVilG6zEPPYTpr8=;
 b=QpUPdjyaGWJusiYMY0cklVM/t1EabdSRoPAcVGgdV5t9vWqHm0brbvxrxvMXaRuVma
 lvwi3IHbR8hEscm/GX5RqZGSxvl93wbv7lJ9QkaDasbS7vgerBzvULq+B6PX8UYYZW1p
 5eFxpBM4R9YXQrewF56f0Bzuw1NcMdQhDDbIWupt3RvvxdmYMIr9EQOg8FgE71/9sKf9
 T5xUxUSFn8dwY+ryd31rS5zkMllICaEJoBGtJmpdqIDc6NalwGlc9ISL7JC6neR6XkB5
 yWVUK1fXygLYgweM32wQC5sA1tYr+EgVgIrm39LTJiLdmSUVhsDjJkbG2G5e8PYVNi4j
 W11w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683283278; x=1685875278;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GGUYB/K0rHbygF7dcBo384KEw+1cPVilG6zEPPYTpr8=;
 b=MF4J4xtyZj0/qlTSZrQ1s7zjLupUUQKrwYdRhtLeZ3XHcXT2TMi84H3vPyWS0AMJo4
 to2pREE19QqaXb5zqH0rjrQiNDHdIe0+lMeeZtaWhWIQ7AXOpn7duR9X7gRmp0K0SMn1
 o+M1l1yNZpcp7NXzO7JWF12+hW0+ObQHJwDK7zq3ssiM3STo09O+MfNMH6yjA66ddKJP
 FG3N6F8E9LYuOXILhKlLFnQVPGCpV/nAs6DAOetRr64N6QxnwnIQ0STsGeP8xkvrsxXB
 F6AOl62+RCQNyKzTbhubWYz44orjhZdTv3V1pByX3P6gV8TV3qqnPyeyz0Jcn4uypj0a
 yXoQ==
X-Gm-Message-State: AC+VfDwCfDrkCFfho6BJi+X5RXG6XVmeLjSnS5AJimRsozl/OmkbKcPN
 BKC2envsKh33sbGMFNouxAf6LmhUh1JbSkFwoyOWFg==
X-Received: by 2002:aa7:c589:0:b0:50b:c9d4:8804 with SMTP id
 g9-20020aa7c589000000b0050bc9d48804mr1018611edq.4.1683283277804; Fri, 05 May
 2023 03:41:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-18-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-18-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 11:41:06 +0100
Message-ID: <CAFEAcA9MZtk33geq=8-1vwM2W-fDHa8p1gcUf4h2ztPG7HGWfA@mail.gmail.com>
Subject: Re: [PATCH v4 17/57] tcg/aarch64: Detect have_lse, have_lse2 for linux
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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
X-TUID: ugyEAeizU2j4

On Wed, 3 May 2023 at 08:08, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Notice when the host has additional atomic instructions.
> The new variables will also be used in generated code.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
