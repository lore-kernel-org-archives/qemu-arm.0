Received: by 2002:a05:6512:1086:0:0:0:0 with SMTP id j6csp2432225lfg;
        Mon, 1 Aug 2022 04:31:15 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uPftU93/F03XK291Tuwjp8L2C1JQGlSEoYje0cMEihZSnMc8c3tRzPZHFbErbEwMFPJgZI
X-Received: by 2002:a05:622a:211:b0:31e:da24:f1dc with SMTP id b17-20020a05622a021100b0031eda24f1dcmr13469942qtx.551.1659353475361;
        Mon, 01 Aug 2022 04:31:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1659353475; cv=none;
        d=google.com; s=arc-20160816;
        b=Z+jCeRkO/eFYqlPS0mKqRiLY6W0fdKZXpFOSUQ8zT26k917sSbaaHknn1EVeZB85Y2
         u7z+Jdd+SXpMNV7AoSmCcG/Fuxe0H7VcoNWbQkpROvPNHM3B4l1vEgpegEqoGf4JyYT8
         QXU6K4qZCW+KGxsnxHCrOswZugrMn8f91b09SATKLr+XTavV1Ep7+IQJZEfbNiEHenMo
         OZREQKzh1TisZMuuSqBphit/fWpkGeuy26VU2WKdErb+BkAFf6Iui9ZrlaC6OBbsbcZJ
         R8IR8g8WOSqv5U2xN68+6fdqBczeyib7vfb5tPlIVIwM6INOChV/fFuLKLJRQUOuS9pb
         Y+4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=/L1qr9Ix5S1as0QZJQfgkZUpxnGlzUboUyuGZUd6m8A=;
        b=GW3XmNA7WO+jaGcYPfKeRO5dBJNioYTtT4jla5zaIr7pIrGPguxw9k3AKa+bW21P7i
         7/K/oVEFaF2zMDAac8djuJgr270v1teQCW385YEadz+NbRP4W1rSrXTKs+c3cGPJEdij
         4+bJ6IZcZSG7y+QnulJz4VbMnjBPhmXFmaFBf4zdZeAXNhRT3DCRZtqDZjNaLCI3CKLx
         yVmgIBMnhn2l4W0PGG3GngUy7fBrogZLMMvzi8JL5ib1eakgmi4j5QDuGGkh0B5KJeYh
         f5BpeM/5aTr5iUx4Q+UmcZClqK/kfRbPYB/BH5nR2PpDqxdGcx0jrpAtLfOPrxspMibz
         BdtA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Arhx7VRs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u30-20020a37ab1e000000b006b56aa5e42bsi6491902qke.753.2022.08.01.04.31.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Aug 2022 04:31:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Arhx7VRs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oITdi-0002pT-S7
	for alex.bennee@linaro.org; Mon, 01 Aug 2022 07:31:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oITd5-0002oq-Vb
 for qemu-arm@nongnu.org; Mon, 01 Aug 2022 07:30:36 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134]:40709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oITd4-000685-Cg
 for qemu-arm@nongnu.org; Mon, 01 Aug 2022 07:30:35 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-324ec5a9e97so21541487b3.7
 for <qemu-arm@nongnu.org>; Mon, 01 Aug 2022 04:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=/L1qr9Ix5S1as0QZJQfgkZUpxnGlzUboUyuGZUd6m8A=;
 b=Arhx7VRslJnvU5jxnFKxvvTKsX/7R4EyGD1fANcgrMwJSwavG2HxKd4tSz2mF7j7mq
 2XKLd2Nr+2mtYyC0d4oUONkKIXlT9gVLPHQyjFgz+oRtDtUaMPdsyd9l0wLbkeDgHylE
 FTkmSHq2xusFXMi8EilrkcU9boKdW6XNfsS1q7Hg9QZS2xVeDzUHF4ZgG3YCzeE+PgMl
 42U4odnfxxPP5uC5+/+ApPNT4P3tC5hPiUAesk8zN4zcAwlqECVLTKa6emPan1f4gGwo
 d9pgLQjy/StaKSLLbhIfltKa9FpakzSoYO375eIL1Cuy5tpK7NT23kiRWdKp6AwOwtwQ
 cpiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=/L1qr9Ix5S1as0QZJQfgkZUpxnGlzUboUyuGZUd6m8A=;
 b=POOTdEiHcG1QQYqxnIoKkEMeSfAFz+KPJjcXr9rLGjn0cvDRbXu9OeRmIxv70y1jAz
 Ukrun6jgekVQNBcMH1ROStzemfx7puElACK4mVu89nezwHsVyKaXeWvLAL2Bq5p9tEU6
 2KFGfJmgpb48brmOPCCJ9APfAyGqbHsJPAUcrS71Z73KXOEFPGSlsfLvT9M6CkB24NDV
 zzdHdVMHpwc8B6D7Q6C6iRPBBXecM0aiJaYYnsB1teBmWAjzqfnRiMw1oXKmEDPHk1pZ
 lxdU4p5Bv+4zFzvI4cdKTYErogcox6EZjhZZ29wsJQwkaDiaX22OqOMtwPssqyHjk8OI
 CYhQ==
X-Gm-Message-State: ACgBeo3pc92xzOOnAvA/XxJ82B6XuZtG4eDvU4SVEiwBYuq5iedC5SYb
 rCEqKLWbAEzt2B27xjnAhed3obM8aMPUcoVKMkNWsQ==
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr12686674ywb.257.1659353433230; Mon, 01
 Aug 2022 04:30:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220727223905.624285-1-qemu@ben.fluff.org>
 <20220727223905.624285-4-qemu@ben.fluff.org>
In-Reply-To: <20220727223905.624285-4-qemu@ben.fluff.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Aug 2022 12:30:22 +0100
Message-ID: <CAFEAcA9QxwtyB1muGCJh9THdGCu3gEvFAqemvYMUHca6Z1PvAg@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] hw/core: use qemu_fdt_setprop_strings()
To: Ben Dooks <qemu@ben.fluff.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Alistair Francis <Alistair.Francis@wdc.com>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Cx0MrICpOfhr

On Wed, 27 Jul 2022 at 23:39, Ben Dooks <qemu@ben.fluff.org> wrote:
>
> Change to using the qemu_fdt_setprop_strings() helper in
> hw/core code.
>
> Signed-off-by: Ben Dooks <qemu@ben.fluff.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
