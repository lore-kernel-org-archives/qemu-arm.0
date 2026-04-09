Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0A70E98FDD
	for <qemu-arm@archiver.kernel.org>; Thu,  9 Apr 2026 09:43:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wAlvG-0004O1-A5; Thu, 09 Apr 2026 05:43:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wAlvC-0004HP-KT
 for qemu-arm@nongnu.org; Thu, 09 Apr 2026 05:43:36 -0400
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wAlvA-0002oW-87
 for qemu-arm@nongnu.org; Thu, 09 Apr 2026 05:43:33 -0400
Received: by mail-yx1-xb132.google.com with SMTP id
 956f58d0204a3-6501e465a8eso704884d50.1
 for <qemu-arm@nongnu.org>; Thu, 09 Apr 2026 02:43:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775727810; cv=none;
 d=google.com; s=arc-20240605;
 b=CmKBg1XR0XELjZeJYruZ78ZIQHhIksoLeg4ZYQRCZXtnMj0WnvD2DjT92eCnX+a2W7
 IKXIJC+TYUYUOrCYXhQcmCMXHMBeKzFou4ReNtAsJ+L53DzbZvINNy9KCHGX1D+pleFz
 VK1KGuLTO7GK7G3VjAp8SdzRLePXtU/nruWZh0FOqqm68zxEY7hX4sjOXr532yDSGWn/
 ZwBWoGurcnLDK/slJG6EH0sd/J59ilowHKJqzaELAT8FYY4mlsiZYvrSYN9aAhcaSKp5
 W3FE//MXfD0fgDXW3pZzhxpbG4VCVd8tbpQIb/VjcQICht74Bqo/z7+qKVi7iMn0a2d8
 ksqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=7DY5vgoK0OPxe5ysWxdHMOOyaxoUFNwyCJ8ueUu29KM=;
 fh=x/GR7kZshWgdrXkeMRz6+zmgheBp7B8AhLgyNptH5vs=;
 b=gqNbLiGTI8+RlHQdHvMiYD5JMi7NlanXPYiIau/5w8lhW5FV6Bx34zAB1UCUPauDMu
 Xq8XNFM44YcLgjI0GfP+ggCRYKNrsY6KULy4bhVT2X7SfKtjwkTnbB6yDYBRpfPpjHZ+
 RyVPJCMoiS1mAmxyQrdTrPwS+cAPlNuiX05OIriZntp2VScCaT9chb3GtmgvW5rFv+hV
 ugT3kygY66kfUvvvStb2+CXGAuRhYQPrZyG0kirn/iE1fBnFQRIlEvMAeWEtIkKCCLbN
 o3HCle5bJltCLePgIIwRkJB7V98WT0odJdOljMNNwxWKtxtrPliMz3uE1qbdD2bxkmg3
 LFAQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775727810; x=1776332610; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7DY5vgoK0OPxe5ysWxdHMOOyaxoUFNwyCJ8ueUu29KM=;
 b=l19sUWUiIP70LX6Q7jIhe5B0YGKWALm3Ya9u7DwqIXB9WGaB75RPVGONuiYXtFsKn/
 GXxuA5LoLXsrTS8WATbB+3w9CjLr1cbbqNJ/3aDsmuEldq8e12Q60c9DJgJrPEgNTbx+
 +SZndGgp7t6OpzdGsJsWGgGkuEsVHab+Z3RL4lD4pyJYaO10HSpYdBQvoaGjeQTNIExZ
 u5JJVgKognB6kr4GxVgy3fuGchgVTnEoBS8JcXrUyrYCf5qGoxd7+rUpq0G6RdkvnBa6
 IeohjhJTb+E3d9zDPHh6JvsNuMqKvup5N2X9upIuRiZxC9pT+TTtTaPAhFDo7h86rL/M
 9OPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775727810; x=1776332610;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7DY5vgoK0OPxe5ysWxdHMOOyaxoUFNwyCJ8ueUu29KM=;
 b=X71V2Wtccbx/BZ3sG0oWCeceqQtBiVhmplONQaFyglruhy/XW2MKBKzAV6Nh0ugqTu
 FLmOGf4JYMCAYDLe6G+WnFim4PWZVX6kKjrxsKvMiKm6LzWeZPurtY/DrB4DbhXmWEcZ
 enK7tUIwRxGG0+MSW5OS4ipUKTNDkThIYty9Bxt0QGaRlBn7iE4hi6xMEOpFhld/RDmI
 jkLr+tCu7cOBqvCe8TT5fN2o4rITyRy+Y16k/z7u7Js1r0vYaqUBQndXlXGgpZL2YF1+
 scsjjbsmNPNwNuJbLgCp6iESaxpXUQ9chBBFxSjIRTVTPC/UvgCwUZVrJcThBZHyoBg3
 S3nA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXn2UNmUSWfvx9fhOhK4VSW4m1gZgh6uSrajFuv1A2hy9zRsPD4XPtXLz8qzckXkqtp2aor9pUvQ==@nongnu.org
X-Gm-Message-State: AOJu0YwSRWzxLrIQxeBVcjtGEc884Fx4GkrIt/y0+75skUO2RAPXoBns
 BuLbgakVo6jR4O/dMGDxNu7zCHI998qTZUsgQv6IJeN81PlPOx7WbqUKWwFlHOQXCTWFUb7CTdH
 D2pB+RPMZYNtuRkYR9xGeN75p4imqKcNnONxkTNd/yQ==
X-Gm-Gg: AeBDietG55wYZdxAMqDi8pl1uc10Z8pOjKj8LOskViKtI8wDEtIU55TDTh/cCYsyRar
 /Pn8qrJS0Hc6bm0CGMr+zL4vqhbksRe7dJp2Y14iJsex/XfoSYWj3R37UNIDdLkgMHs9SwGFRpE
 cO5JpLlpzfXj70MUoQiCVAw4hFVmGirH/rl6IHX+jZ1p5M4FycplHAF4/bSj1XHzgoILSBRVcuN
 m9/42rPOnvMut2ZeRj3GOekvgG2aoU+ppUH0xsOQt+84du6cUFIJ9or6w7zWYO3y+Sn3zYyR/gk
 OGIupUXtyvn94DZPacXwYTkDbSyvEVklBRxOKQoC8gmjQkKPRwfgAyR1WC00f2JOcvg=
X-Received: by 2002:a05:690e:1502:b0:650:26c1:ee84 with SMTP id
 956f58d0204a3-6518714b9f5mr2069174d50.11.1775727809775; Thu, 09 Apr 2026
 02:43:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260409-fix-unit-address-v1-0-946840930af2@iscas.ac.cn>
 <20260409-fix-unit-address-v1-1-946840930af2@iscas.ac.cn>
 <b7273509-0161-4b2e-bf4d-28b648f71209@linaro.org>
In-Reply-To: <b7273509-0161-4b2e-bf4d-28b648f71209@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Apr 2026 10:43:17 +0100
X-Gm-Features: AQROBzBTK_KqKGLcQvAFpVWYtJwjO6_0s710KQOQJSWNSOEWuGi3cV-mbZlTYvY
Message-ID: <CAFEAcA-z1GywU7qaoWQSDCndSzkT1ZqZiKL47Wi05d430qDyMg@mail.gmail.com>
Subject: Re: [PATCH 1/5] hw/arm: Fix unit addresses of FDT CPU nodes
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Vivian Wang <wangruikang@iscas.ac.cn>, qemu-devel@nongnu.org, 
 Leif Lindholm <leif.lindholm@oss.qualcomm.com>, qemu-arm@nongnu.org, 
 Song Gao <gaosong@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Paul Burton <paulburton@kernel.org>, 
 Aleksandar Rikalo <arikalo@gmail.com>, Jia Liu <proljc@gmail.com>,
 Stafford Horne <shorne@gmail.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Chao Liu <chao.liu.zevorn@gmail.com>, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb132.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Thu, 9 Apr 2026 at 10:39, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> On 9/4/26 08:40, Vivian Wang wrote:
> > The node unit addresses should be based on the reg value (which is in
> > turn based on MPIDR), rather than some arbitrary number [1]. Also, they
> > should have been in hex, not decimal, as per de facto convention [2].
> > Fix them.
> >
>
> Maybe worth to add:
>
>      Cc: qemu-stable@nongnu.org

Why? What bug is this fixing?

-- PMM

