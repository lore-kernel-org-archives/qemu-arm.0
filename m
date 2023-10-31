Received: by 2002:a17:906:70a:b0:9d0:bf65:29fa with SMTP id y10csp306763ejb;
        Tue, 31 Oct 2023 07:06:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPsgbgZtjgzHiWWb9E4gHQpGhZu/+N+2qZCMABwGlQJ/yj7xExCy22TE8dXAGSU8wijQ8j
X-Received: by 2002:a05:620a:2a04:b0:774:cd4:4a58 with SMTP id o4-20020a05620a2a0400b007740cd44a58mr14519648qkp.39.1698761190476;
        Tue, 31 Oct 2023 07:06:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698761190; cv=none;
        d=google.com; s=arc-20160816;
        b=S/APWKg7uplTkPsR8NG+iA11Uhtgp0wqdbWLn73eg9QMUqQWiCbt76+OD8B8S9aRXV
         7BaWr5AwrcKvxPXA1ows5uSPOHO5B4RnGKJ5Cu1sSa9/pjsWAfdQ+UbA/uNl4NdjuomD
         4eHWXc6Bvmj9v5mu/6tLioniG1U+1GvW+5ZrROcQPBA2eNsLv+lG08FpTI76V1CCGOF+
         hEN6JMkIeD+MQDaepABod4YG/06hVIvb5AvpZKBZkIXet/rYQUIj3jbM0ti12K8Woe6C
         uhNZjzILZtbZY7VjGBbtWjV24JXFn5pVzXwGafKYIyBh07k+E3llUT7BwTpz7NisZpMM
         6a4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=wjCMcA/rkPwrWrJSmXS+BPgdntcg4zSUfSsGxc/Pk7s=;
        fh=at3qcA7oya2MgdEBTf03GisTwzl2EcSANM6tYwvqDuA=;
        b=dGZW0KaabDZLv369zHgKq7AkF5FNqAnlMRc0MtbncN498d6KeEfhg0opvCttb4zcUZ
         mWVAtR0rEUI5l6QRkexA+vDMOhlh4CzHo/X5UxI8vyuCpmPYE/sP7SHHa19VwYpnfJt3
         WLWfRbFqUrCjwAPi8ZAbHP8m0OP8P4yJHOJQ6MMf7bMGWsr2V6q/fUQfcAJ0kbXnhsWm
         yZOC+IxIhy7g5BWhmzHby3yXR4q5R2x+cyo7qBd1B7fudFdzmqZptsOeWPLbnLmaYWW1
         c6HUM4zvG9jUrc0XzVKMx0FEgTW7UpFgZiCT1nhsUDWMbTA7DCjb1Qj/qqMHNAMoAggB
         Juyw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fwmEQpS6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m3-20020a05622a118300b0041975501022si1152694qtk.108.2023.10.31.07.06.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 Oct 2023 07:06:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fwmEQpS6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qxpNe-0004DO-5D; Tue, 31 Oct 2023 10:06:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qxpNZ-00046R-O4
 for qemu-devel@nongnu.org; Tue, 31 Oct 2023 10:06:02 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qxpNY-0002wc-5r
 for qemu-devel@nongnu.org; Tue, 31 Oct 2023 10:06:01 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-540c54944c4so11692796a12.1
 for <qemu-devel@nongnu.org>; Tue, 31 Oct 2023 07:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698761159; x=1699365959; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wjCMcA/rkPwrWrJSmXS+BPgdntcg4zSUfSsGxc/Pk7s=;
 b=fwmEQpS6B6cpZl12B6V5H52VRh3hZ4ZNcZTwEf4rBr0mIhgnfGwI9d7fwC9LxyKYv/
 BU58zRpJcOCiM7i8/VBjhRj7HQGBXKKr+HwhOuqRbnAbgL4W6Uov/DZjqOURYyFiMvF/
 xkI25oSA3rCTDLRQc9FlCNYURgguzbVXB92FBmse7F+Sulu//3jdAUk0qBE1+zPP/LK4
 OeLn9gvF1iWmh+vcKKoDxByS9rPYPuKuWgz3suRO/c9yo6GyKcL9qErx3c/lZoGe2odp
 lILQqDEbH2h+rnzLCv9kyWXPszmpLXxWivgEi/1isA0R51hleaGwKHylv+0KPy3qRemg
 KyYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698761159; x=1699365959;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wjCMcA/rkPwrWrJSmXS+BPgdntcg4zSUfSsGxc/Pk7s=;
 b=oRCTi/LCStRyUyY/zB5GDoWdaNZd1i0VOdNlKA89o7kDCBUiB98gBOiSf4sb/6gGpC
 +808L74jGnKL50z1FvpSn2bDdo2i4+wtFfbbzZ27Uiwu5dtRCAYZx7tSe3goQWVk/d7v
 9i7lJBJiOd3hlvsr1C39/2iTFbiyrHzrUgO8hUKGg8AvpbOtRgJgpBRPGHG1dng6KnCt
 pV14rObwgPSNlTXg8TzQq4ubmzwYj1Q6nckL/pjBV1UygFY6ACQxayW28kxm3FYzB1Yn
 fxepGaoUtfiKW1RvkOehx47zd72yhv9FYO8op2ibckGMMIAYA4at6+tlBiNlpEiHQSFx
 RFdg==
X-Gm-Message-State: AOJu0YyHw++ME9iUEg9mcQ6D77k1OgNyyp29Mtu1NNxlW5mNXKk+8Yfg
 HIk4AfZrchhd5T3zGHYqrUy3Qg0Lm1qvIsZonagf8DKGzQg6ZMDV
X-Received: by 2002:aa7:ce03:0:b0:543:42ac:c9f3 with SMTP id
 d3-20020aa7ce03000000b0054342acc9f3mr2376948edv.19.1698761158802; Tue, 31 Oct
 2023 07:05:58 -0700 (PDT)
MIME-Version: 1.0
References: <20231030114802.3671871-1-peter.maydell@linaro.org>
 <20231030114802.3671871-6-peter.maydell@linaro.org>
 <9ea5c9b8-d740-4cec-9896-568babeca9aa@ilande.co.uk>
 <CAFEAcA9dJnp0CVOzVWV+Q-U4ji9c8=14ggztKGktCSsDDp_F0g@mail.gmail.com>
In-Reply-To: <CAFEAcA9dJnp0CVOzVWV+Q-U4ji9c8=14ggztKGktCSsDDp_F0g@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 31 Oct 2023 14:05:47 +0000
Message-ID: <CAFEAcA_4wqP7G+gXnunJx85OTvUr-3kx6HGABGb6Kt3y=b_Nvw@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] hw/input/stellaris_input: Convert to qdev
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: MNuy+kwR560y

On Tue, 31 Oct 2023 at 13:55, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Mon, 30 Oct 2023 at 20:38, Mark Cave-Ayland
> <mark.cave-ayland@ilande.co.uk> wrote:
> >
> > On 30/10/2023 11:48, Peter Maydell wrote:
> > Is it worth converting this to use DEFINE_TYPES() during the conversion? I know Phil
> > has considered some automation to remove the type_init() boilerplate for the majority
> > of cases.
>
> I could, I guess. It seems a bit awkward that DEFINE_TYPES()
> wants you to pass it an array even when you only have one type,
> though, which is going to be a very common use case.

I'm going to squash this into this patch:
diff --git a/hw/input/stellaris_gamepad.c b/hw/input/stellaris_gamepad.c
index 6ccf0e80adc..d42ba4f0582 100644
--- a/hw/input/stellaris_gamepad.c
+++ b/hw/input/stellaris_gamepad.c
@@ -90,16 +90,13 @@ static void
stellaris_gamepad_class_init(ObjectClass *klass, void *data)
     device_class_set_props(dc, stellaris_gamepad_properties);
 }

-static const TypeInfo stellaris_gamepad_info = {
-    .name = TYPE_STELLARIS_GAMEPAD,
-    .parent = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(StellarisGamepad),
-    .class_init = stellaris_gamepad_class_init,
+static const TypeInfo stellaris_gamepad_info[] = {
+    {
+        .name = TYPE_STELLARIS_GAMEPAD,
+        .parent = TYPE_SYS_BUS_DEVICE,
+        .instance_size = sizeof(StellarisGamepad),
+        .class_init = stellaris_gamepad_class_init,
+    },
 };

-static void stellaris_gamepad_register_types(void)
-{
-    type_register_static(&stellaris_gamepad_info);
-}
-
-type_init(stellaris_gamepad_register_types);
+DEFINE_TYPES(stellaris_gamepad_info);


The array is a bit awkward, but it's overall better than having
to define the register-types function.

thanks
-- PMM
