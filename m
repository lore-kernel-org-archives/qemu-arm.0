Received: by 2002:a17:907:7006:b0:a35:eedd:80b0 with SMTP id wr6csp350107ejb;
        Thu, 1 Feb 2024 08:28:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG5FmohTqLBAV36HhueXBFFcjZrwkIz21YYr1SOEWsEG9OI75xPLOjk9vP6dfOs2hCcU57h
X-Received: by 2002:a05:6808:114c:b0:3bf:1a8c:75b3 with SMTP id u12-20020a056808114c00b003bf1a8c75b3mr3108689oiu.26.1706804921182;
        Thu, 01 Feb 2024 08:28:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706804921; cv=none;
        d=google.com; s=arc-20160816;
        b=GZPzl9Jf8+9Szho/W7Hrpy7Pb9eJQOAAv9i7c+bKMLIkv3aykcjKI21EkBGCNrOz7b
         nll2O5Onzu6ifbA84p5M+VVvIyaw3zCczFH+o9p/BAJXu6xlV51a4pT7sB2dlo94HR/E
         2Hs3e35nV0BkRq7OUoUMi4wp+Y1YOuXpP9kqiFF3Q/aqgbm9if6do7fQT86ITQ5sCSQY
         9lFAXhyJJ+bCdxXD1CHTzWo4+ISAWJ0nrKBljeZbPQFaNct5QV88vLrOHGH8W6FKU9gV
         Dn8vBpzw091V98CP64upRr+HOAt0ectGmVVJ3sTU7TmkoUA+PCU1pzFWDMU1pUFr1uAI
         ppjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=GdRWbu5FXaABeFEoDyxusWA9wF0lQKWgC0yG9ay+aEg=;
        fh=NipFx5ksSuZy0KO9B6X0BR36J4oM+EjmhkIh1mnLKFs=;
        b=NFMDgHiBqNe/Bmu56NxzLfSqDh1/ACstHImui0pOISgN5g681IFeIUY72Q8NpBn5uN
         JIrkWVf0Ph+3YtPbA7fAUG5el7/Z7kFqQ1/fLb4ZmxHMYrIIbR3o63Qc0t68o2JwRS8u
         fghmdDisZ7H9lMKy71MOs8y8UvbUR9XTx9x6w9O3CjBpfcTPOOopviqtOFZrHL0piQ/r
         QEK8lWuUIlVOjNcspjEhVK41cDoKWkalwysnlGHQmZWbYzqXsR/yrdwDjg4JIHejIRza
         J/NAVWsAaAni0uMsmEVcow7S88ITRIkIhXIPrOaAC7LbsvMPTHem6U+SrE2fcQEFWKhG
         xfEw==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="wbAd4qT/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=0; AJvYcCVmUlCmsKrDqG8/wkBD3USvTYlmEeayYTbEWmemlxXSdN/7bb8XdngDi7oNcj8fmvjHUHtQaf4n6hSCTSD+LrxSmrO0e/Q6
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id vw14-20020a05620a564e00b007848e1c5f2csi5374976qkn.129.2024.02.01.08.28.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Feb 2024 08:28:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="wbAd4qT/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rVZvU-000200-M2; Thu, 01 Feb 2024 11:28:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rVZvT-0001zh-FE
 for qemu-arm@nongnu.org; Thu, 01 Feb 2024 11:28:31 -0500
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rVZvR-0005XT-3M
 for qemu-arm@nongnu.org; Thu, 01 Feb 2024 11:28:30 -0500
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2d061f1e2feso14655121fa.1
 for <qemu-arm@nongnu.org>; Thu, 01 Feb 2024 08:28:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706804907; x=1707409707; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GdRWbu5FXaABeFEoDyxusWA9wF0lQKWgC0yG9ay+aEg=;
 b=wbAd4qT/UIpcVVOM/Gv3RtWwDmZK0eYybvWx99lvFuakn98xI+T3hqEmx0Cwx0u5zz
 HBkQ4BFXEnqH05C/aJ3LA7VYuVrNSxyobyflrKWV04NOw3ZXrFtw8a1DZUQmXZu4P+iq
 9Ijt6OlCT72sVzrbGYn2S5fotQN5Ti1uf1aXbcyJILE/x5wOfMw2JulJ2I3VIO1Nz/25
 ISsX4f3Xc91Cq0rGMobq0EuLJoIoRly8O4ySR2/LsgCJM8NoLmA0CfzPVQ9YEctdwTuT
 jmrqFWKbzUY6pD3ljYZNP16eHEC3d20SvbxwdgFLWpI2cmzMIac4uoG39Ekb/b7wnha7
 vFVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706804907; x=1707409707;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GdRWbu5FXaABeFEoDyxusWA9wF0lQKWgC0yG9ay+aEg=;
 b=VYqolZ7Dh0ON21NwD+HVbEjR1rdCS6AFd/upk2wXc2jtd++d8dhMI52pvOXLN7u/Z3
 Vmo+55rHmKAFh+Xm7nSI3HuSOeJMLzBboFieABHn9cuN/N3ErcwUatAITv1OfVHGdi0B
 s/dZeOCowCALWhsnoO1CptFYuX0gY+BI+8I1qrPfmHSYnwGZcSBhGmLTlBw5+SE7aOP1
 ofEtEMSf6Zo3j6YBS0oLUV838n1lrnaU5KG4lvScHyReVNxo2fCO0UHMBSwJU0zGrjfu
 s0mU7okxGe15EF7MjsEkxg958fd8iXbNPoxIDNgQ2okNWZ8KrewvqyIdhZqvpR+3J7M5
 uWHQ==
X-Gm-Message-State: AOJu0YxHRWn+rmeAXCqrZUloF6TaTfInN4rztADrKVC4ij/MM7azVPJG
 bepb0hULS7daBCUX+je7P8CufdTc7YrOunnjJXsh8xCa5SOZNUF3/rJU+9aniF6ZtV70VFbp7XT
 Qi3C4oAb5rP96IDjZVItTtPngEMQ5S0hwWULRPQ==
X-Received: by 2002:a2e:b5a8:0:b0:2d0:6d69:7d25 with SMTP id
 f8-20020a2eb5a8000000b002d06d697d25mr2730187ljn.11.1706804907040; Thu, 01 Feb
 2024 08:28:27 -0800 (PST)
MIME-Version: 1.0
References: <20240130190317.25692-1-philmd@linaro.org>
 <20240130190317.25692-4-philmd@linaro.org>
In-Reply-To: <20240130190317.25692-4-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 1 Feb 2024 16:28:16 +0000
Message-ID: <CAFEAcA-w+=dy3_oiz63eg2AcS-vu93ZFrV1ZKF7iTC3eSYRHTQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] hw/arm/stellaris: Add missing QOM 'machine' parent
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, 
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, 
 Gustavo Romero <gustavo.romero@linaro.org>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::231;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x231.google.com
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
X-TUID: XkbgsOv0BCvV

On Tue, 30 Jan 2024 at 19:03, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> QDev objects created with qdev_new() need to manually add
> their parent relationship with object_property_add_child().
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/arm/stellaris.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
> index 284b95005f..bb88b3ebde 100644
> --- a/hw/arm/stellaris.c
> +++ b/hw/arm/stellaris.c
> @@ -1247,10 +1247,13 @@ static void stellaris_init(MachineState *ms, stel=
laris_board_info *board)
>                                     &error_fatal);
>
>              ssddev =3D qdev_new("ssd0323");
> +            object_property_add_child(OBJECT(ms), "oled", OBJECT(ssddev)=
);
>              qdev_prop_set_uint8(ssddev, "cs", 1);
>              qdev_realize_and_unref(ssddev, bus, &error_fatal);
>
>              gpio_d_splitter =3D qdev_new(TYPE_SPLIT_IRQ);
> +            object_property_add_child(OBJECT(ms), "splitter",
> +                                      OBJECT(gpio_d_splitter));
>              qdev_prop_set_uint32(gpio_d_splitter, "num-lines", 2);
>              qdev_realize_and_unref(gpio_d_splitter, NULL, &error_fatal);
>              qdev_connect_gpio_out(
> @@ -1287,6 +1290,7 @@ static void stellaris_init(MachineState *ms, stella=
ris_board_info *board)
>          DeviceState *gpad;
>
>          gpad =3D qdev_new(TYPE_STELLARIS_GAMEPAD);
> +        object_property_add_child(OBJECT(ms), "gamepad", OBJECT(gpad));
>          for (i =3D 0; i < ARRAY_SIZE(gpad_keycode); i++) {
>              qlist_append_int(gpad_keycode_list, gpad_keycode[i]);
>          }
> --

We create almost all the devices in this board with
qdev_new(), and we don't use object_property_add_child()
on any of them. What is it about these three devices in
particular that means we need to call that function?

thanks
-- PMM
