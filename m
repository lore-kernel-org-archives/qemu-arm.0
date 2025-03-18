Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp3010910njb;
        Tue, 18 Mar 2025 08:28:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXr2kEWfTGaXy8gjuPtdqGc1p0FHwemzxvdWQr2YL2D0I/Y0w9TeNVKh6GNXcbWpBxZoQJJKBJsxzOddw==@linaro.org
X-Google-Smtp-Source: AGHT+IGWURfp6p03vjsgPeDBxoX8Ry4ATTAx+o8Cr/BOk6wXAqjAdheg9D+S4E8D+pVI5JxvGbRf
X-Received: by 2002:a05:622a:56:b0:476:923a:f1cb with SMTP id d75a77b69052e-476c81c5625mr273002061cf.41.1742311731204;
        Tue, 18 Mar 2025 08:28:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742311731; cv=none;
        d=google.com; s=arc-20240605;
        b=lva4ujShva4FjXkZoizXanvk7J7B/9BbM0GN2xrxVNxjE2nR2h6V8aI1jTZQW7PTAN
         HkWK5O1k22TDK0X/A+gktuobwwgP9FAHx3gIGiXrfYoFFsM+7nmj21UB86vY7D64HJxS
         Jgd6KrGIvUwmcw/e7lQyHGad0bLwb8WxloNXpdewqHPRf3U3476qZDNW6o2sKS0B+dhH
         GwMMUN9tCTA97gkB0haiP+/VqUmyoSp/axx9mC9In0+biQ9jNeTWGFqiyY09NKrRTLnw
         VYMxh9cDYOi7sfIIRBYUO/tiEvzG1Dl9HsgSUXUD5Jf8ivyWV1ubLlOjzgZqfzQEamvg
         YoCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=v7cPFDSthr33Q6tCh7ULaY+4IQO00JywDq8ExWVq/IE=;
        fh=6La5qRJc+wNjNIsKaqdeD6N3UUX24QLlx/RgXRFtm7s=;
        b=G7uvhJB/yrrqGPBP3MK1AZuOFw7+j7UyRdd4OH3d9QJeCRyK6ercbXOR1xuxJkG0/a
         ve9YeRW7vEkLJshpDMAxIHdZNJ81tstWVAS47EItU89tq3ehctjBMnhow09mV9gHf0Tw
         ok69rkH5JYgS67jnKYhhD1DO0xVaH/JCpG+SSc0kF2oWZE7zQsih3QK2p328DE5WWsIM
         sQGeaDIo4prXTVLGq46F9uWt7P69cQSTariY8bipmcH+aFhdyfjVMIb8LpIEnON1WFSd
         QI5huBiOmq5eG3ZkalzmV/RIvLaWvh1iugP3mUJGYy8diBqsCTIS63PE0S6kXKQZWEY5
         lMng==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oGNhUIkr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-476c38a225asi105560471cf.534.2025.03.18.08.28.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Mar 2025 08:28:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oGNhUIkr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tuYrf-0003l2-Qu; Tue, 18 Mar 2025 11:28:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tuYrT-0003iT-5Q
 for qemu-arm@nongnu.org; Tue, 18 Mar 2025 11:28:12 -0400
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tuYrQ-0002Ht-DZ
 for qemu-arm@nongnu.org; Tue, 18 Mar 2025 11:28:10 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id
 3f1490d57ef6-e46ebe19489so4790082276.2
 for <qemu-arm@nongnu.org>; Tue, 18 Mar 2025 08:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742311687; x=1742916487; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=v7cPFDSthr33Q6tCh7ULaY+4IQO00JywDq8ExWVq/IE=;
 b=oGNhUIkrHjiBdtZM4D1ZqjP5eQH/8QlPsy3Q9gMd7+4AWXj/5NyPteC9cC8+OTuzKk
 ikBP7G0BxeOUddxS2QZDyRdeXoT5dKN/TYyZ4YTmn+FEsp+eHo2aTxnj5yw24x2chmWg
 P/O+Dx9rEVcngjhR5oCf2WnINTSVQWe4mgIyLWKEX8sGqBbw9/OLnBNOETgkU8SoaVoZ
 EcFseA2jYb7XVT49e6ckpbZ4mMKy3zcn1r0YFcBdH5GvK6EyaLFN6XuQ9YOyHdc151N1
 LKWEpQhpC4A40V8JOrIjUS7mW0KKjG6gnhk7aeE5Zu7joSlLp2Qb5d9Ja3ESzeUSO81B
 z9Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742311687; x=1742916487;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=v7cPFDSthr33Q6tCh7ULaY+4IQO00JywDq8ExWVq/IE=;
 b=Cx7PqwjKlJIbkwj7VndYlGLz+xnQKRhfJ4HgfsJWXwaR29E8rv3XIiHPpg07kHvT9t
 lyjogNmtzdMpKMnXX8OW++0w8GvNqrsSmxQ+cDt8lfyPVQl525SN4+m11oArTMTydGc6
 Xc/7XpBCyvr+3EiJr718K0iwiaDAR5XdMr4fjFZEULI+nKlgIA0E6OVMNxJ00s4X9Bzp
 nxsE4MRpYI8cA7HAUhei6Fg1qvECG5ObeRCKwgJglPwHMypvshzw0aZeanFHL7xz2KvB
 qMyyBiYLohkYcTqcPW/JISnBLK+jarnMvqqmyswHaneccirgIjfpHaCcjC9c+dD4gJBS
 U1yw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMxdmgVdwPUlC1FGeeap+VI9tZV/d8eAuFaCu4yi+jLTZx6k0ly9hTmjG9X1+dM2GBzC2yoDp+oA==@nongnu.org
X-Gm-Message-State: AOJu0YxtdE4LNysKXwD3PWU1w536wogORMQAEIK88t+xSTyBsJ6eb4RQ
 SUHNhXq46KTIdr2cZlM1XpMiOhxvi6x4Mwv2Il0NV6RCboEQK8P3jqk9McLZ8Y779xIC9sAokO7
 rMH/9RAAktqQA72PW1bdwWdiCeX8uu8WNCqX7uQ==
X-Gm-Gg: ASbGncuW3Ed8CV5xfhrh39TKajbw3YZTEtK2AOh03LerJM0SQmRE2UOhOSBuo93zWbb
 BlMSVo8uamZMG+9m4ir9ouy4sOQuOfcF+1OkoxgHcef3jVn6esSWXYrWyJj6/8LqcnF9JMzBbRP
 /FRtwacgs2FJh3/pB/TT973kaPtqE=
X-Received: by 2002:a05:6902:228e:b0:e63:d13e:80e3 with SMTP id
 3f1490d57ef6-e63f650e8d8mr19266542276.16.1742311687128; Tue, 18 Mar 2025
 08:28:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250314183224.21822-1-shentey@gmail.com>
 <20250314183224.21822-2-shentey@gmail.com>
In-Reply-To: <20250314183224.21822-2-shentey@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Mar 2025 15:27:55 +0000
X-Gm-Features: AQ5f1Jpc2pEfHze4iJx5dRfKEsiostFl3TcVa1Y1ouUt9gw1LWCCh3T4eVrSzNQ
Message-ID: <CAFEAcA8DPonw1+GsBJ079AfeSyO9=3B93P1yj3uLTBzF4uf0Ug@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] hw/arm/fsl-imx8mp: Derive struct FslImx8mpState
 from TYPE_SYS_BUS_DEVICE
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2f.google.com
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
X-TUID: 2dx1Zj8t9T2Y

On Fri, 14 Mar 2025 at 18:32, Bernhard Beschow <shentey@gmail.com> wrote:
>
> Deriving from TYPE_SYS_BUS_DEVICE fixes the SoC object to be reset upon machine
> reset. It also makes the SoC implementation not user-creatable which can trigger
> the following crash:
>
>   $ ./qemu-system-aarch64  -M virt -device fsl-imx8mp
>   **
>   ERROR:../../devel/qemu/tcg/tcg.c:1006:tcg_register_thread: assertion failed:
>   (n < tcg_max_ctxs)
>   Bail out! ERROR:../../devel/qemu/tcg/tcg.c:1006:tcg_register_thread:
>   assertion failed: (n < tcg_max_ctxs)
>   Aborted (core dumped)

> diff --git a/hw/arm/fsl-imx8mp.c b/hw/arm/fsl-imx8mp.c
> index c3f6da6322..82edf61082 100644
> --- a/hw/arm/fsl-imx8mp.c
> +++ b/hw/arm/fsl-imx8mp.c
> @@ -702,7 +702,7 @@ static void fsl_imx8mp_class_init(ObjectClass *oc, void *data)
>  static const TypeInfo fsl_imx8mp_types[] = {
>      {
>          .name = TYPE_FSL_IMX8MP,
> -        .parent = TYPE_DEVICE,
> +        .parent = TYPE_SYS_BUS_DEVICE,
>          .instance_size = sizeof(FslImx8mpState),
>          .instance_init = fsl_imx8mp_init,
>          .class_init = fsl_imx8mp_class_init,
> diff --git a/hw/arm/imx8mp-evk.c b/hw/arm/imx8mp-evk.c
> index e1a7892fd7..f17d5db466 100644
> --- a/hw/arm/imx8mp-evk.c
> +++ b/hw/arm/imx8mp-evk.c
> @@ -37,7 +37,7 @@ static void imx8mp_evk_init(MachineState *machine)
>      s = FSL_IMX8MP(object_new(TYPE_FSL_IMX8MP));
>      object_property_add_child(OBJECT(machine), "soc", OBJECT(s));
>      object_property_set_uint(OBJECT(s), "fec1-phy-num", 1, &error_fatal);
> -    qdev_realize(DEVICE(s), NULL, &error_fatal);
> +    sysbus_realize_and_unref(SYS_BUS_DEVICE(s), &error_fatal);

You want sysbus_realize() here, not the _and_unref() variant,
because the device was created with object_initialize_child().

The pairing is:
 * object_initialize_child() + sysbus_realize() / qdev_realize()
 * qdev_new() + sysbus_realize_and_unref() / qdev_realize_and_unref()

(See the doc comment in include/hw/qdev-core.h for
qdev_realize_and_unref() for more detail.)

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
