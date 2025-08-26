Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83166CA0FED
	for <qemu-arm@archiver.kernel.org>; Tue, 26 Aug 2025 19:23:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uqzGj-0003n3-PY; Tue, 26 Aug 2025 15:23:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1uqzGi-0003lc-CX
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 15:23:44 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1uqzGf-0005UR-Mr
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 15:23:43 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-61caa266828so772086a12.1
 for <qemu-arm@nongnu.org>; Tue, 26 Aug 2025 12:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756236219; x=1756841019; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HYAHuXQeWb9PJcaarK1sVyv92dGvQ9jxwjXzb/f+/Ac=;
 b=Nm5GZTn+B7qQMUyOj4s2eRkdMJPR4Z7y591OfOydOTcmCQxHK/UbzmYjOKzzLDOYYz
 BcjipxDhvc7HmoB7LFmqlQ/4b80Jud3BZ29qyk9pGE3OJ5lLZzliGQsEO/sA5ydKkuDy
 hRFZmQK049CO2PRXYm8NsfHN/5JUHNdFYmHev7uPYgliGAmfdcKiTCxA7bXvqihSEZ6W
 U82q3d83QfEqiy13bWv5rkOTdlfPAlp7pZ8ZbGY3xHJSiLxokkAU55Wgz2zKxVhI9pCG
 N5jhuwqxM/Qhe6hyQtYSgaWWqF0qBBl06NBIc9j+7ag7QXorFeF9buntRYQ74K5uvjA9
 vJ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756236219; x=1756841019;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HYAHuXQeWb9PJcaarK1sVyv92dGvQ9jxwjXzb/f+/Ac=;
 b=MG/1i+Zj9DW+kH0xb9c2HcFjxczjekm5XrSeurfxWLIl6D+6QYZUoXhxT9rVa5wFO1
 IDF1kuJU+Py3TiVce2hBMOodDHxwSn8w082fXv/CxRK6e6GkoooxLBd+hy+GyKckSw+x
 2pv2FIWAMWPv22kQ5U0r8586Oxbzy962Yem01i6hw190QS4bMUKLut/qoyrrqpHfYp/V
 JFkwGhBDpoTzvJk4hBJZr0ZzyELLF6IfLNZIZrTJRUUP1pjuO4NLUAy8mKG1iMao99Q0
 NEIt6rpWfqJ0jRdK16PEoN36Pw5ihfeiKCKmiQ4djBpKJKRbWlX/cCb4KmXHXrlVdBne
 wswg==
X-Gm-Message-State: AOJu0YyvCqcAbDXW4s0y3JhSoYEZjWpI8wXjXbDBxyDBiEw4Kw55BJUf
 aaFye0sMtNJN/ZAXYcyQ51XgN1ttTUmF7I/AdDRjNdteSe9FahlCIDl+BPsBYlwyKeD26SJVXQm
 /TVZZRAwcRyvw+sSzZpxpeZ6dUvIP3xWIOF5E23JnMg==
X-Gm-Gg: ASbGncvgAsLFXeDlr2OLe4RrMZaiAVrmnGc4RFYv9LDLztPjGuJ5tE7yLIwuzxayOPw
 Hec/0JANLjSyyB8fJxPjInwS0PwJ/PtwHy+3xTVSgXcVdCi9LjORvxzqQ6dgABFQA3MfLxMAYYs
 mBGP9/qTvOaFDvG+l2BqMFn5K6pN/yWC/C0P7MfQt7yejLke0RcffERvme1R/A4CpmlpMvWRaZU
 00OD1ot
X-Google-Smtp-Source: AGHT+IG506O8hNeW+RUiUczwU92/o9n2LOqlJK5nHlx1E+bWqq2wvQUo6VM44AUHkrNuuZjRVjNlUNWvxvQ7/GzLWnU=
X-Received: by 2002:a05:6402:3506:b0:61c:8d7a:9162 with SMTP id
 4fb4d7f45d1cf-61c8d7aa1afmr2898071a12.1.1756236219092; Tue, 26 Aug 2025
 12:23:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250826174956.3010274-1-peter.maydell@linaro.org>
 <20250826174956.3010274-2-peter.maydell@linaro.org>
In-Reply-To: <20250826174956.3010274-2-peter.maydell@linaro.org>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Tue, 26 Aug 2025 22:23:10 +0300
X-Gm-Features: Ac12FXzvhwi_OparO92ULZ82LFf2ObafznlYfI4SO9R9eL5pF0BaSCwckP6R4C8
Message-ID: <CAAjaMXahGMuwUA1BPQ=eiejanwtSN=sHZ7b2uG8y+efD8Dd=Xw@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw/misc/xlnx-versal-cframe-reg: Free FIFO,
 g_tree on deinit
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Francisco Iglesias <francisco.iglesias@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-ed1-x530.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Tue, Aug 26, 2025 at 8:51=E2=80=AFPM Peter Maydell <peter.maydell@linaro=
.org> wrote:
>
> In the xlnx-versal-cframe-reg device we create a FIFO in
> instance_init but don't destroy it on deinit, causing ASAN
> to report a leak in the device-introspect-test:
>
> Direct leak of 400 byte(s) in 1 object(s) allocated from:
>     #0 0x5aded4d54e23 in malloc (/mnt/nvmedisk/linaro/qemu-from-laptop/qe=
mu/build/arm-asan/qemu-system-aarch64+0x24ffe23) (BuildId: 9f1e6c53fecd904b=
a5fc1f521d7da080a0e4103b)
>     #1 0x71fbfac9bb09 in g_malloc (/lib/x86_64-linux-gnu/libglib-2.0.so.0=
+0x62b09) (BuildId: 1eb6131419edb83b2178b682829a6913cf682d75)
>     #2 0x5aded850059d in fifo8_create /mnt/nvmedisk/linaro/qemu-from-lapt=
op/qemu/build/arm-asan/../../util/fifo8.c:27:18
>     #3 0x5aded582b9e4 in fifo32_create /mnt/nvmedisk/linaro/qemu-from-lap=
top/qemu/include/qemu/fifo32.h:35:5
>     #4 0x5aded582b326 in cframe_reg_init /mnt/nvmedisk/linaro/qemu-from-l=
aptop/qemu/build/arm-asan/../../hw/misc/xlnx-versal-cframe-reg.c:693:5
>
> Similarly, we don't clean up the g_tree we create:
> Direct leak of 48 byte(s) in 1 object(s) allocated from:
>     #0 0x5aded4d54e23 in malloc (/mnt/nvmedisk/linaro/qemu-from-laptop/qe=
mu/build/arm-asan/qemu-system-aarch64+0x24ffe23) (BuildId: 9f1e6c5
> 3fecd904ba5fc1f521d7da080a0e4103b)
>     #1 0x71fbfac9bb09 in g_malloc (/lib/x86_64-linux-gnu/libglib-2.0.so.0=
+0x62b09) (BuildId: 1eb6131419edb83b2178b682829a6913cf682d75)
>     #2 0x71fbfaccc799 in g_tree_new_full (/lib/x86_64-linux-gnu/libglib-2=
.0.so.0+0x93799) (BuildId: 1eb6131419edb83b2178b682829a6913cf682d7
> 5)
>     #3 0x5aded582b21a in cframe_reg_init /mnt/nvmedisk/linaro/qemu-from-l=
aptop/qemu/build/arm-asan/../../hw/misc/xlnx-versal-cframe-reg.c:691:18
>
> Add an instance_finalize method to clean up what we
> allocated in instance_init.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/misc/xlnx-versal-cframe-reg.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/hw/misc/xlnx-versal-cframe-reg.c b/hw/misc/xlnx-versal-cfram=
e-reg.c
> index 1ce083e2409..95e167b9213 100644
> --- a/hw/misc/xlnx-versal-cframe-reg.c
> +++ b/hw/misc/xlnx-versal-cframe-reg.c
> @@ -693,6 +693,14 @@ static void cframe_reg_init(Object *obj)
>      fifo32_create(&s->new_f_data, FRAME_NUM_WORDS);
>  }
>
> +static void cframe_reg_finalize(Object *obj)
> +{
> +    XlnxVersalCFrameReg *s =3D XLNX_VERSAL_CFRAME_REG(obj);
> +
> +    fifo32_destroy(&s->new_f_data);
> +    g_tree_destroy(s->cframes);
> +}
> +
>  static const VMStateDescription vmstate_cframe =3D {
>      .name =3D "cframe",
>      .version_id =3D 1,
> @@ -833,6 +841,7 @@ static const TypeInfo cframe_reg_info =3D {
>      .instance_size =3D sizeof(XlnxVersalCFrameReg),
>      .class_init    =3D cframe_reg_class_init,
>      .instance_init =3D cframe_reg_init,
> +    .instance_finalize =3D cframe_reg_finalize,
>      .interfaces =3D (const InterfaceInfo[]) {
>          { TYPE_XLNX_CFI_IF },
>          { }
> --
> 2.43.0
>
>

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

