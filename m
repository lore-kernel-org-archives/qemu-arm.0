Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp153733lfc;
        Wed, 26 Aug 2020 18:32:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwmUD4NORgFbhRuIi3VhhTb6vm3q0lApqWFrPbRdDy5R24I67RA+RTI5eLV6Nhg58roP4ic
X-Received: by 2002:a25:7cc2:: with SMTP id x185mr5287144ybc.9.1598491946751;
        Wed, 26 Aug 2020 18:32:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598491946; cv=none;
        d=google.com; s=arc-20160816;
        b=f3/tP8uzn5FCxxPzPktJBuxlg8W8n8PXa0oCR5oDRgiihhT5FjEeOwLGAwGAxpVnLq
         2VI2YwRcExIXwk1yYsOB+GbR1ZBvV0UuZ4SQvgKcFyaRlZrVgi0NI04Vv0Ncf6IPQ2th
         fb7LLDulY2y+WTBoCXq1qoXU/C81UX2trlfs6ZpTcg6OXAoPBKVKd1IX67qS0w06Yt5i
         0cnnMeoYm25ULVpitLmnGfdmIDscZfO52l1Ne7iyhUQoRhwKuAdf7GqOmLeXSlQl4OZ6
         irlM6HJU0PmgqEWJfuegOnSPCQgzPjzPygTusKGImQG2oYhLFz/thmEQW8GVY6yBPYe2
         Vftg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=+Vvy84qV2hOJuHQtvex0dsqMf+bkQF+w9I4U2EXKhuc=;
        b=z0DNY6r0AmPYRlzJGLk7keA5dNuubc1kFMx11KRrnR3qq+yM8t96LupGfZwXbA/rBX
         TyJCF+QJIEP0wN0/eguQ5+UCer+SHYysey6LmZerUs5rh9Gfi+YGOubxYTJTOJGJUWsK
         MPNRsHD53EIMwPEusF+/tpyAIsiuMXVnV8ynn96slHqTZmiUz471LBowIkTkR89tLh6B
         Oo8yd2SNJOGwXUCAQ5ASHptjjB8mjap13LoXW1XGaqS44gxFIbWyXzwZCMQ1gljwoWvH
         H/BoD+T32l30856MRwSw3GU9qUlpnTxAWEAzf861I9BcbZJkvs7TXpm8oh6hr5wzFrIr
         3tvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=bV3dX5A9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x200si743433ybg.212.2020.08.26.18.32.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Aug 2020 18:32:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=bV3dX5A9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:56890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kB6mA-000891-3O
	for alex.bennee@linaro.org; Wed, 26 Aug 2020 21:32:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>)
 id 1kB6m0-00086u-F7; Wed, 26 Aug 2020 21:32:16 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:45044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>)
 id 1kB6ly-0006mX-OX; Wed, 26 Aug 2020 21:32:16 -0400
Received: by mail-ot1-x341.google.com with SMTP id n23so3124596otq.11;
 Wed, 26 Aug 2020 18:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+Vvy84qV2hOJuHQtvex0dsqMf+bkQF+w9I4U2EXKhuc=;
 b=bV3dX5A980ahvZkf5Glh/ze6eyzII7LmffeQRF8yxf2HafDs4/qKX5y6tamFn6fShU
 b9Yk1UVrltN+vpuU19R/+8FdOuf/FpfXpXpDm688ZYNDr6jqkh21wilX+8jCAGvZZZsu
 4Ffaxz3uU4YAL+Xr7Ibyvf3RLaiwnvX/KgOqI4EMbO2iZ5mZWt/tmpfjtcBlY2TIOGrt
 s4eLPmDaYZ5Dger5Z4AMuZpJqpXcwJDdM2qF2fWDNMKk4zY8jURkWWfWWhr8cpay4s+A
 WafNoWgwbBFG7vEhc8+IoYvUxiaSr8KZswKD61X4lQnql5rd0MJxbsbvF73lFcNuX9cR
 f6Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+Vvy84qV2hOJuHQtvex0dsqMf+bkQF+w9I4U2EXKhuc=;
 b=dcFkmoZ1cx8AHrUbSpkO4GHyx2D0iRDFms4mOUSWMtmSPWYH66nxA+9rwjEOfKzDgq
 1GGYdypMDHl2lJmsHtbihzCzdCJwsDMsO0INEcI69OJ+sRAgo/DxTt7q3F8Z9mALt5KD
 MEcXooQPTIFbhTCbEZp8W0mWKM0s6E05w2ZEZWACe0MnceVR7SJoaMYKfrD1iG4qS9uF
 PufIKX5GuykN7oP10K/VPP8Wzl1VttHql4iEdIPjom99zrHLfArqLWqZ8r9UI0PtITmS
 sRCvsqRNn5F+UvND9XDrBYKU6hMuGBKnTJw6KjSAHLc5Ekf4n20GNInjPiRB/BpzGEAc
 8sqg==
X-Gm-Message-State: AOAM533ozIog3OlmJNLsPQd/dNMrOvM4nr2YZ6/8T0d5uqK7pR24i7GG
 qMv+jrcuOl6JzKSSe+ssXIigvxbDeEz41kxG3A4=
X-Received: by 2002:a9d:7c92:: with SMTP id q18mr8980457otn.333.1598491933254; 
 Wed, 26 Aug 2020 18:32:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200826184334.4120620-1-ehabkost@redhat.com>
 <20200826184334.4120620-6-ehabkost@redhat.com>
In-Reply-To: <20200826184334.4120620-6-ehabkost@redhat.com>
From: Li Qiang <liq3ea@gmail.com>
Date: Thu, 27 Aug 2020 09:31:37 +0800
Message-ID: <CAKXe6S++M2LOjMHG=omTr923qAVwbUOxOi9H4Qx7V=Rj=OZRCg@mail.gmail.com>
Subject: Re: [PATCH 5/8] xlnx-zcu102: Use TYPE_ZCU102_MACHINE constant
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=liq3ea@gmail.com; helo=mail-ot1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Qemu Developers <qemu-devel@nongnu.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bVIeoF27Ro8q

Eduardo Habkost <ehabkost@redhat.com> =E4=BA=8E2020=E5=B9=B48=E6=9C=8827=E6=
=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8A=E5=8D=882:47=E5=86=99=E9=81=93=EF=BC=9A
>
> This will make future conversion to use OBJECT_DECLARE* easier.
>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Reviewed-by: Li Qiang <liq3ea@gmail.com>

> ---
> Cc: Alistair Francis <alistair@alistair23.me>
> Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-arm@nongnu.org
> Cc: qemu-devel@nongnu.org
> ---
>  hw/arm/xlnx-zcu102.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/arm/xlnx-zcu102.c b/hw/arm/xlnx-zcu102.c
> index 5997262459..672d9d4bd1 100644
> --- a/hw/arm/xlnx-zcu102.c
> +++ b/hw/arm/xlnx-zcu102.c
> @@ -238,7 +238,7 @@ static void xlnx_zcu102_machine_class_init(ObjectClas=
s *oc, void *data)
>  }
>
>  static const TypeInfo xlnx_zcu102_machine_init_typeinfo =3D {
> -    .name       =3D MACHINE_TYPE_NAME("xlnx-zcu102"),
> +    .name       =3D TYPE_ZCU102_MACHINE,
>      .parent     =3D TYPE_MACHINE,
>      .class_init =3D xlnx_zcu102_machine_class_init,
>      .instance_init =3D xlnx_zcu102_machine_instance_init,
> --
> 2.26.2
>
>
