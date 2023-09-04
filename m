Received: by 2002:a17:906:cc96:b0:9a1:fa4e:495e with SMTP id oq22csp1454822ejb;
        Mon, 4 Sep 2023 09:32:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJsLE7yPT7jD1eQKHHkF1f8/V9xTpe3pwTZeUi3xc0Byjgnqh9YRmPOt2LuKpmku+jv+WS
X-Received: by 2002:a05:6870:311f:b0:1bf:df47:7b5e with SMTP id v31-20020a056870311f00b001bfdf477b5emr14108149oaa.16.1693845176697;
        Mon, 04 Sep 2023 09:32:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693845176; cv=none;
        d=google.com; s=arc-20160816;
        b=Y3reGi+efaeEeNoYoHCQOisc1yFCZAJY9gZBRFr2HsC8N/0ibm4eg+wm2iv80rltDn
         fxIVGxHeqdm83a7u2hURugi2L6ZmWv5hBrZFy3Fq9DAAhamwFa2ea4Hoe78JCG/1dQ1m
         I2qPWTq4Jet+bAfzp3jkFIr2Axbow0NFC1jjJV3RTgpNt6+z4neuzkCkb404tE1EGNtm
         5kXxvicmCEKnfMFRlSvt20QnA6MNNy0GkGfFvDYyQ01CoLjzPHuaCwMBNB4Rjtw9lHbG
         DMeFVaGOegcXRJvuDgUm6AxCAn48IBIwJj7S0HfWXf/NIRfpT8DFdKO79BUh6IzpV+J9
         WYUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=+NPNHy6NEshjFV43jeFrEa3Ef5CXI6N8BOgdWbuM8wA=;
        fh=xdRLxFB60lKXcYjfuNugg34EsoaJQ1aOJhpcyTGvqFw=;
        b=SV6eO6462OKXTEVwl7DdELzuLZjVNuxFfzP0MSCQx9/fduqzk+BKJXehNScCEc1WrL
         Yjb16ySbAB+FAd8dIh1H+VOonOCeJL0+CGJHjy/ehkDmhTZWpQZtIUluGc4H0Kr6Gn78
         5uGVw0yxEOVRp4ZQYF5YxqIGy+29FPanrUyMv8Or+1jZDeUzYUIxs9Iz6fEMG1mHo8za
         +bJUNAhUBOuQ68pi0GngonURzln17FyPXlDpjDjiWGxCfe2M9B15EckUeFeoUsberY2v
         G/Zvs/ccPaPjhSSwBd+U9G1YMuVha9OLKIxIUx8CyBzoW13jgUBK9NVHJCRvW3uJ0keN
         V0lw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fwKV7yYF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i25-20020a0cab59000000b0064f8e143802si6427761qvb.581.2023.09.04.09.32.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Sep 2023 09:32:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fwKV7yYF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qdCVL-0000jd-2o; Mon, 04 Sep 2023 12:32:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qdCVJ-0000gl-7B
 for qemu-arm@nongnu.org; Mon, 04 Sep 2023 12:32:45 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qdCVG-0003Ko-UV
 for qemu-arm@nongnu.org; Mon, 04 Sep 2023 12:32:44 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-522bd411679so2255854a12.0
 for <qemu-arm@nongnu.org>; Mon, 04 Sep 2023 09:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693845160; x=1694449960; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+NPNHy6NEshjFV43jeFrEa3Ef5CXI6N8BOgdWbuM8wA=;
 b=fwKV7yYFPit63AcQ+FaQw2fpxNsk9OiMAiDD5pbjf97QZ6iMIuELl5Fm73WHGcHioN
 FDhHh9M/eFCS26wm4OUmyObqcAUQQuIKp7jswaj1VQqXRPJXeUV7y3aavmYAzWgBMA1/
 4ZKY02qbiYF4PgfDd8Ua8ERbCaTi6r8VONU/B/BmGhnKDsupGAZFKysxZIOfEmrNk77g
 jEnz6OKsDy2vgBDXi7t4NIKUI21zovauz35P1x+vcM+yJ/m1OBeqNpg8bguCbFUoT33j
 bibnEoclb5CHaBN7DrlG5JnxeIqH8VasbuplUvVG7mBIZPeJm5vapwnKlj5VZvy2QctB
 PRNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693845160; x=1694449960;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+NPNHy6NEshjFV43jeFrEa3Ef5CXI6N8BOgdWbuM8wA=;
 b=lUBmddbC448FLhIh0Uf2sKhjyfUZR5pESr28yZWFKqGlPu8uAzyUTjblX4oBpTjzD7
 pTzTSAsEL+7vjcjTNpRSIPZbLU4wSvAJKv9sFcSqlHBGAU/B+0cK8ZRrUUv3GJxN6L23
 /oFZpQGGFSCecJHRWxtSkh7aDA1rJW8Fn+oloewH99q8W2Tv7/Mncb1FmAft/m+Ay9bE
 ce4BhYlaUQK7MFXxpfLZvtgQh8oih0/f6g6F0e3yJcea/KxcAtugmsKZdDSzUIFDdkrC
 ESxiHAMfXuDBNAxkMcv7MqHXW62t5IhqIejcRDSWaHyx60XrIv3VEAGk1Gtp/viCfY9o
 303Q==
X-Gm-Message-State: AOJu0YwUynkPtLJiCFowTshn5NW4M3/XddJhleyBm41f2aRr8iiGdPzE
 axLhMCyOPaZivmWBZRsgSSJFaprFX6fPV5uVrLee5Q==
X-Received: by 2002:aa7:c1c6:0:b0:52a:1d54:2534 with SMTP id
 d6-20020aa7c1c6000000b0052a1d542534mr7568484edp.25.1693845159773; Mon, 04 Sep
 2023 09:32:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230904162824.85385-1-philmd@linaro.org>
 <20230904162824.85385-2-philmd@linaro.org>
In-Reply-To: <20230904162824.85385-2-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Sep 2023 17:32:28 +0100
Message-ID: <CAFEAcA9O3CuXNXc2_VT+v8E+okDwdsNbKa_kqqzsk4W6EmV=Rw@mail.gmail.com>
Subject: Re: [PATCH 1/3] hw/core/machine: Clean up local variable shadowing
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 qemu-block@nongnu.org, 
 qemu-arm@nongnu.org, Eduardo Habkost <eduardo@habkost.net>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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
X-TUID: dMb9rQhsly0l

On Mon, 4 Sept 2023 at 17:28, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Fix:
>
>   hw/core/machine.c: In function =E2=80=98machine_initfn=E2=80=99:
>   hw/core/machine.c:1081:17: warning: declaration of =E2=80=98obj=E2=80=
=99 shadows a parameter [-Wshadow=3Dcompatible-local]
>    1081 |         Object *obj =3D OBJECT(ms);
>         |                 ^~~
>   hw/core/machine.c:1065:36: note: shadowed declaration is here
>    1065 | static void machine_initfn(Object *obj)
>         |                            ~~~~~~~~^~~
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
