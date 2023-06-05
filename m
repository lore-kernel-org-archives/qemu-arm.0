Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp2883471ejb;
        Mon, 5 Jun 2023 08:50:53 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7vpfEL6I7YFWljclif8yukYbYx5/6N0VqXC+qarLNEihAOyvblFEeWNhaNTRVbsGNn2Ytt
X-Received: by 2002:ad4:5dcd:0:b0:5ef:8b6e:583c with SMTP id m13-20020ad45dcd000000b005ef8b6e583cmr8132641qvh.5.1685980253687;
        Mon, 05 Jun 2023 08:50:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685980253; cv=none;
        d=google.com; s=arc-20160816;
        b=gPAesS3dEP/EG1U3sYLWOsjaHPG6XdgVMM8DE2Jwt2aHXv96VBXvvnGzBrOyRxlyrA
         0rzJQc2erCAYX+YkXLaO4ccA8fx982Pr1qGqa6JYkwfUMMnvtPsoxeS/N0qZmYyB+RPe
         ZzUrDUVRtfQQ9C0BsZF4Wa8Z3lC38Aoap/h3c574bDc+C8PBNuqPGMi8uhncuVPkov5S
         TS4rSiZ1ysd/rzA4KEgieJm/Rk0P5jRNI4pkdq0lBQ8Gv3jtgowLC2SKoeNF2/8kG8OO
         +tH/2AmWGBW5rD947Cru5xRM5+4Cs5HJOkqw3zf/hBABDg2TbyaL8bY1DeoTUqfQCZyF
         +2rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=FZVt8oPOn3vFo3bMACFuIrwbjp9WHYCHWspt/wLwGro=;
        b=VAW1VCJGlaVaLXUT91UbEZ8d3KG27rTJJCHf5TVtxpl4K1kyFMbM83/ZhIhHWO2mwA
         g4cJlyOIfxKHnbe3s7RdFPPksnYB1HTs3QkY9K8ZpIzE3qYhN2N6Sc0jR5BL8utlDkbM
         4f7qwMlZw4KRSAS4eea242ZQCGke1aVJrtxflslXIy7IZKMz6Prsc8Gd8eUvkbAbRJCs
         qmRopotMN1gbq396gLquyXlT517fEJlLGUDckyPe1EVrlkLiyvsHGVOSEL3Zdck42UqC
         4mMxkuUrOwTAlGU73cQaMOzi3cEA9AS9kKK80W8m8oea3dtdnFjbqzMPns5/YQC/BDki
         A9xA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Qlf986o6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gi13-20020a056214248d00b006211ad6e707si4944724qvb.532.2023.06.05.08.50.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Jun 2023 08:50:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Qlf986o6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q6CTp-0003x9-R7; Mon, 05 Jun 2023 11:50:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q6CTo-0003wA-0Y
 for qemu-arm@nongnu.org; Mon, 05 Jun 2023 11:50:48 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q6CTm-0002pa-H7
 for qemu-arm@nongnu.org; Mon, 05 Jun 2023 11:50:47 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-51491b87565so7635317a12.1
 for <qemu-arm@nongnu.org>; Mon, 05 Jun 2023 08:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685980244; x=1688572244;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=FZVt8oPOn3vFo3bMACFuIrwbjp9WHYCHWspt/wLwGro=;
 b=Qlf986o6Lrt9C7JfZ7Pgn2GPuNOiVoRWs7wGFn/aXbZctpsYS9S4n6toOjbwNuE/Zz
 4OkWVvW03pLkfHsb213gSK4vxCDkq47fcj0WbyBLVaOqFcNDLTf0HO5tmwJDTRM5Spyx
 1EOToadNLSPt9reRUATNSmvLj4aT0UOEer7t0y2/lrPbJjH/PruUmz1wMC7otA/yqgZW
 l+6AcFSuSzUg/abTLhUUQGr/YRjZb6OdePxnK/46LEWdbk89khVRF7Wz1k9D+h+rac3T
 kkdPMZvrZtEjo4xF/rJXSeTgN5vVZDjxQM/UN5DW6vKgxnEz06K4DLn7y1011DHJOw37
 xQGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685980244; x=1688572244;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FZVt8oPOn3vFo3bMACFuIrwbjp9WHYCHWspt/wLwGro=;
 b=AarYwrtwgAZsqA5chkRTPwPJqMNAMaa9gXjLY38jGx1YDsLSFxqgKmfxoOE+8fDRgK
 8jqO2MDYabC1Ulh3oFp+SHV7X+tgQv6nb4ddjhqogClQ0wTT3yjoKawLe5nv0Eb7/ruW
 4kFAwScIVdMIzj+4TvXcQzHLgO9MQVPxa0hwNiuO9Y7bwK7xDlLRRz95uZ0uveoa00Mw
 +KNGqlncqmTgUly6erqqs8jHZ6Bar1LgGJwD6yDiTcP7nHKamWCC/ds94OLATHnw1A4Z
 8MBajpjGqEgUeR5eJf3ksS32TG3c6TAfjbTbWcFJcfWS4pbUlXv5jwfI9PM4azsTaUr9
 zp1w==
X-Gm-Message-State: AC+VfDya0P32KZ9p7Vs8Fe7aWj327eV7kduy32HBI9tEcDHWGfSgb17q
 Zmx1avas1z9kGxEp7qB+BwPLk4SFb+Ir5y4sbIqZHw==
X-Received: by 2002:a50:ee98:0:b0:516:416b:f736 with SMTP id
 f24-20020a50ee98000000b00516416bf736mr5830147edr.35.1685980244168; Mon, 05
 Jun 2023 08:50:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230523100555.32718-1-qianfanguijin@163.com>
In-Reply-To: <20230523100555.32718-1-qianfanguijin@163.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Jun 2023 16:50:10 +0100
Message-ID: <CAFEAcA-muuRms2Js2-Q-PeLGV3KqM6ysdTt+hnmnisdM_NZkew@mail.gmail.com>
Subject: Re: [PATCH v5 11/11] docs: system: arm: Introduce bananapi_m2u
To: qianfanguijin@163.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Beniamino Galvani <b.galvani@gmail.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Niek Linnenbank <nieklinnenbank@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 WEIRD_QUOTING=0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: cdX82L0nouR5

On Tue, 23 May 2023 at 11:06, <qianfanguijin@163.com> wrote:
>
> From: qianfan Zhao <qianfanguijin@163.com>
>
> Add documents for Banana Pi M2U
>
> Signed-off-by: qianfan Zhao <qianfanguijin@163.com>
> Reviewed-by: Niek Linnenbank <nieklinnenbank@gmail.com>

The docs here turned out to have a couple of minor formatting
issues which meant they didn't build. I've fixed them up
with this extra change:

diff --git a/docs/system/arm/bananapi_m2u.rst b/docs/system/arm/bananapi_m2u.rst
index ae7194a9df4..b09ba5c5486 100644
--- a/docs/system/arm/bananapi_m2u.rst
+++ b/docs/system/arm/bananapi_m2u.rst
@@ -121,10 +121,11 @@ Let's create an bootable disk image:
 And then boot it.

 .. code-block:: bash
+
   $ qemu-system-arm -M bpim2u -nographic -sd sd.img

 Banana Pi M2U integration tests
-""""""""""""""""""""""""""""""
+"""""""""""""""""""""""""""""""

 The Banana Pi M2U machine has several integration tests included.
 To run the whole set of tests, build QEMU from source and simply
diff --git a/docs/system/target-arm.rst b/docs/system/target-arm.rst
index 91ebc26c6db..a12b6bca051 100644
--- a/docs/system/target-arm.rst
+++ b/docs/system/target-arm.rst
@@ -83,6 +83,7 @@ undocumented; you can get a complete list by running
    arm/versatile
    arm/vexpress
    arm/aspeed
+   arm/bananapi_m2u.rst
    arm/sabrelite
    arm/digic
    arm/cubieboard


thanks
-- PMM
