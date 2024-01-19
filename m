Received: by 2002:a17:906:2b99:b0:a2e:1324:ea5c with SMTP id m25csp1063758ejg;
        Fri, 19 Jan 2024 08:51:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFm+fP7bLguIemdFxU3IVDCrojD+mpj2xoAX8Udz/9+zYXm9dGmqEN4BWm4ADIrHlPo80PY
X-Received: by 2002:a05:622a:15cb:b0:42a:1556:8475 with SMTP id d11-20020a05622a15cb00b0042a15568475mr102232qty.117.1705683117643;
        Fri, 19 Jan 2024 08:51:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705683117; cv=none;
        d=google.com; s=arc-20160816;
        b=I/9hBXIzecx8Dtk+TrrzZkL515wxSUrXPr1L1dYZJwzsTEvBF7JWKsHlyhV6J87rgQ
         MhCCJ1/MVh5xtTjuQJXTVMGykp4kdDulQeO2ho5Nv/5WtbdKlCflRAs/8Uxbn72/Voyv
         TL3VhVgT0Ui4BQGxqK76RSxYVCm59XAqlclxHPd+CiC6HghAxzVEOgVAl8GTrssxKNQ8
         8RHc0nXHa1X8iiUcsQn4mY3sn9/L+GjfaVaAdiXd5YxGngmPzDTvbunh3RzZQ8sxg+QS
         uhwCbvNg6sXH615DV9/48UtFBXmjgunuUKY6WtWUdYUY5wn2aFW430Q4A2Az1spiZEK4
         a1LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=99GGFKJsGkqxZjzf6eaXDRk+uN38Nnj8b78hLWlyNfM=;
        fh=R0Uk93c2UowJAnA8LybPaViTSfjsv755BgrHgmmG7As=;
        b=JUJn8tW2D9AwSego7xbh2PiC3tvVS/EXVljT6hm00ihmY9MikuNuawv+Kdq8R2v0Ya
         Ifdvq/xnx9+oFQPLYA41RGA5XtKK6Sa6FIb9JeNNi8/Nm3sqxq7kztMKIqOd2bWJfW+/
         onVX7U+h2VmK48gjQND2HyhB724Dsk6VOoREVM3gg7MC87iITq0RfhY7BzOx0wXd7xST
         F4zKDoqFhC1ms5CSA8GV8vFYb4FvJCAcsuM4+/bHcU4UkhAPcj18xssZBbaCoIi+m6OG
         kDf6QIX1mf5wqZTUFIYCI8/8rW0+jL0h/9MCkmI8SPQAGe1oqUEOvG2Rkcecrcwu6nuF
         4yNA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SngrvfWJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 22-20020ac85756000000b0042a2bcbff97si361028qtx.166.2024.01.19.08.51.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jan 2024 08:51:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SngrvfWJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rQs5W-000332-Ld; Fri, 19 Jan 2024 11:51:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rQs5U-00032b-0Y
 for qemu-arm@nongnu.org; Fri, 19 Jan 2024 11:51:24 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rQs5R-0004YY-K2
 for qemu-arm@nongnu.org; Fri, 19 Jan 2024 11:51:23 -0500
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-55a684acf92so829493a12.0
 for <qemu-arm@nongnu.org>; Fri, 19 Jan 2024 08:51:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705683080; x=1706287880; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=99GGFKJsGkqxZjzf6eaXDRk+uN38Nnj8b78hLWlyNfM=;
 b=SngrvfWJ+fNNPpO37pIrkqhgruXxhpuhuSvTQlQjOsQSASPstYgKjzFrlmTW5IVTxn
 s0r+5dJ5Hj624ZCXursCHy8sKRGlIPwtcqctzfEe9yNxEQarZwJJml0d0IvfYx6vL8ZO
 XntDXETPT3AswI2+jkZNWiYsvRzM3zXTfIhJXQSd/houiyJx+EU8U3eSut1VCddnOwlN
 xEQxqTyyyq2Iy9kHpWDLve495Snk+FrmR2kEaswnx9peKhfynedM3E28OkPTWaSkbFfe
 FX5pIJLHFb+EKnb1ZlyfXGVT6slGJkNygrK8DwX+sgNCw58YQHm8KP+BHB3gpRK+mr5C
 ryKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705683080; x=1706287880;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=99GGFKJsGkqxZjzf6eaXDRk+uN38Nnj8b78hLWlyNfM=;
 b=itEicQqIGZnUFQUwhRpRcaBgg69czkkUHC6lVSfeKsl686ItGhS718yme6X3d23Ea4
 lnwB0gnVsdYVjhQToYACtlGPzUlkv3y/Ao8K7xRV5zhw1CQ2jTHf8CeCijZd1oSnPf+N
 l6RSTH7j0W8O06ZuxQ9vpsGNKrsSEX05oBTImka0uy/PHY01uOEnw884yYrq1O4IiaO4
 vxUdQsISxAXIahoOjC1PjaLMJe4KDsBY0gYoRqpXGeuF00Jpbbvvz3Vccv/ibbE1zxQb
 j1ujaGCYaKDQpx90emfQO376lfipW02y2eYXi+q3sI4HZxmpqkji7gLQuiO14jOhHuJ8
 ksFA==
X-Gm-Message-State: AOJu0YxXygwuaMeBLXASTg1EtpLRbF/5KH302lPVNMHZl57U5cFJshdP
 jtVPmo8lBHKtblvMqUj66skjPxrcgrmZYv8rBifrwI6oG1ojdLfCizS8pSdkenMtfPTMTkX1KyD
 K/CgX/zvrT4eglV1ELb+D67jU6HPCWzq4Fqc8BQ==
X-Received: by 2002:a05:6402:3582:b0:55a:6d78:75ed with SMTP id
 y2-20020a056402358200b0055a6d7875edmr29186edc.51.1705683079875; Fri, 19 Jan
 2024 08:51:19 -0800 (PST)
MIME-Version: 1.0
References: <20240115165615.78323-1-philmd@linaro.org>
In-Reply-To: <20240115165615.78323-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Jan 2024 16:51:09 +0000
Message-ID: <CAFEAcA9abVk_BvWYE6ctcsLrk0CP=aqy38ncgxNrooNroe_1mA@mail.gmail.com>
Subject: Re: [PATCH 0/2] hw/arm: Unconditionally map MMIO-based USB host
 controllers
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Beniamino Galvani <b.galvani@gmail.com>,
 qemu-arm@nongnu.org, Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: DThxclQzyXk5

On Mon, 15 Jan 2024 at 16:56, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> When a chipset contain a USB controller, we can not simply
> remove it. We could disable it, but that requires more changes
> this series isn't aiming for. For more context:
> https://lore.kernel.org/qemu-devel/56fde49f-7dc6-4f8e-9bbf-0336a20a9ebf@r=
oeck-us.net/
>
> Philippe Mathieu-Daud=C3=A9 (2):
>   hw/arm/allwinner-a10: Unconditionally map the USB Host controllers
>   hw/arm/nseries: Unconditionally map the TUSB6010 USB Host controller
>



Applied to target-arm.next, thanks.

-- PMM
