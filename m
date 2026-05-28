Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4205DCD5BD1
	for <qemu-arm@archiver.kernel.org>; Thu, 28 May 2026 06:12:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wSTyY-0004NV-3b; Thu, 28 May 2026 02:12:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1wSTyN-00047B-Mk
 for qemu-arm@nongnu.org; Thu, 28 May 2026 02:12:04 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1wSTyK-0004VT-3r
 for qemu-arm@nongnu.org; Thu, 28 May 2026 02:12:02 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-45e6a4d0be0so5532892f8f.1
 for <qemu-arm@nongnu.org>; Wed, 27 May 2026 23:11:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779948718; cv=none;
 d=google.com; s=arc-20240605;
 b=I/mdadfJazc0T4/yHQho5l8bZHj+nKkUHO7wQorpano8yVofFDxCeE+Ej3aS2fHA7h
 MSnDEq/ucgIr22pIX5pPUKi4d9+NyP5CvjigU8Hqri5LSAnGKpXBp4BFGeOq9woDzMR7
 2PQ5TgzVTvfdv8fo89nFv+4SbbSOK6TLg1gWm0Z+xF8V0zrPAehF2AgZ1VznfizcvJdd
 NVJSK2fC80bfvCv82XUOc84n/P8y7Z8yIs+hln+7siYEWqdFlJJaq1CzXmlq9Yaglfq9
 As/EaWQe6+R0I/7iq23qww1OS1i2jpv3fnjsbxvZPsNYQ5QIQgYCny79sPU9W7hh/ZlB
 4URg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=nWJR1mFWqJeDyXtxshoXxGQrOxpYQAsGxvjy+YZyY0k=;
 fh=wZlQM/ae6ora3aZ2Lzh+RPjtzmblPm22pnQ92jMnorI=;
 b=Z1ktQM8Glftev5CIgk9l/ZnZRnwxbrxJhpHNynYAuvMDkkWE8FqpgcRjLkcZJo+Wv3
 gAfiyDtnV1T6fI5TmR6ZiLRajub2LDt+Z5gOhzgilXPa4KkrT1AN1DckCP+Q1EQ/lqnN
 mgQ8HdF5WiAEO5Jn6+IWdYleVkwe8VLBacYjKyYKLuaTmRVjHa0ffcsZmz9cUQ575e2U
 XI9y2VqaiUn2RGP18493AtS3J1hzvkBSkhemDYENU0i2R+I1/Vm0knhRuxoxiqnKcPpA
 pWyw9/vOvlqofJJYdXDAEExbXYQHSvVxGVW2B/t61T2RMQDLB/7x1WwbC88d0gRfMm3z
 bRmA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779948718; x=1780553518; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nWJR1mFWqJeDyXtxshoXxGQrOxpYQAsGxvjy+YZyY0k=;
 b=VI6ubiH4psojojHraq3UAjB6GRyawDeVrNQl5PnJgxe8jwbyT5sUFrQ0iL/xShhx4S
 W9HTFUCUW4JnsBDLo3qJGztJDgMCzevMtotuBtGUEUjb7/eizmthE6Re3tCdhb534MyM
 Ua3Jy3ZzwHzn7FKRZQffc2j2UBx0GBrQqJcrVzN8RU0O/EXGn+CPTSLpwYG9bXZcqAR3
 RGB2wElPiLNwpbZlXW7mhe6KzdcHxEdIQTs3HG4giVnp8Dpg260bTwGtFNeM48mtflvy
 6luV0sk043QcqUQ4uZYlQu5fC/5VuWADDcE3MZXegBxbZWJbVQB+NZ5MtxWIDDXnnw1T
 Ktxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779948718; x=1780553518;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=nWJR1mFWqJeDyXtxshoXxGQrOxpYQAsGxvjy+YZyY0k=;
 b=Yi9TI475o1tZ96XpsXBaNkOYyG5d2dv20dqQHlhvElylPfBf2ht1kZ7QHnFOfQKcn1
 0jVDzUtteA/9iuQh5meaDFHUY+UBqExF/KoiFTshvHxEnSzcjtAyd4XFNPQ3QVslmR5k
 crHjdNmTRI9rU7A3+BmIA0oSEcIdClTYdPWtRFRIkD23F3RFdnXVMIH+jGFQ9sQfkNb9
 v8WYIhCxF/Cs3EM+Cx4fBSCg5r65ehSui7jTvYlDJdy9B/XyZ9LhEuQZCn5V+t6U8FhG
 8+nYJEXUFGEiNSdvZeEhqJJTlIm+4XY8P8/viOri5TuveQ58ZchsDC071Eo4zkF1Ju2b
 1rvg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/LbnJqYJmkCRJhY9qr0tSp2yd8FvYWfKdSU350AE0mvNaK8DW6JvwJHh1nocJqKzrgtRt7Wg6INQ==@nongnu.org
X-Gm-Message-State: AOJu0YwBvWHu9UKGlD3GETIrllt2OTlirBYaNV7cs+Mxx4EqMsv2zHZu
 nzN2Uo91jcPwfMx9KTdNjtmsmAu0JjORO4nHz90B1dh6Qj7zvlOsanu4iDQVMUj3noS1aIr06ix
 A1pkwWxg5vfjFfXxCNP9DSM+o1sDKH+dacM+cP5Tjbw==
X-Gm-Gg: Acq92OEGj6uztfYVGVM47cgQG4akrfJJxyH59RpVvMQNALEOARumi3ddXLNoC7Hleze
 tP2HIHVYYsuzxtUG58IlUA3T9nDAbH5veTUPMnpsQB70N1G55imCzbOmHEmF+Qomv6X17iN0c+u
 t/4vN9qLk3SVWNzQTzvCRB+VfEWxlnXFIYXkdsqffB2UtSHfmiGiPDW2iJ2nzc9hTlQDQvxkE+z
 cIw6yM1GaXmEVB/JUr2eaaWzo+nk2k+9IBXNM9x/KRoQJs12jlscRJ6toRTG/emvYhlfSqwjps2
 vsVJlWVT1AGDYKsXzULboQXOgU4wb2YWLlv47U00LU2Lb5Qav3IEDwEyRs1C
X-Received: by 2002:a05:6000:610:b0:45e:739e:499 with SMTP id
 ffacd0b85a97d-45eb3690838mr47401039f8f.13.1779948718329; Wed, 27 May 2026
 23:11:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260528051642.115721-1-pierrick.bouvier@oss.qualcomm.com>
 <20260528051642.115721-2-pierrick.bouvier@oss.qualcomm.com>
In-Reply-To: <20260528051642.115721-2-pierrick.bouvier@oss.qualcomm.com>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Thu, 28 May 2026 09:11:32 +0300
X-Gm-Features: AVHnY4IicJF0awCuwWI625F07b2UbZojXl-1f5k2gfheLZgVQwHOzrRbzB4BIVE
Message-ID: <CAAjaMXZdNBV=4ECRQz74MgKZE_WSBDrCZz-ZTQ6SynFW_ZtabA@mail.gmail.com>
Subject: Re: [PATCH 01/10] target/arm/meson: move kvm-stub to arm_stubs_ss
To: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, 
 Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, 
 Eric Farman <farman@linux.ibm.com>, Weiwei Li <liwei1518@gmail.com>,
 Helge Deller <deller@gmx.de>, 
 Michael Rolnik <mrolnik@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-arm@nongnu.org, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, 
 Laurent Vivier <laurent@vivier.eu>, Glenn Miles <milesg@linux.ibm.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Artyom Tarasenko <atar4qemu@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-s390x@nongnu.org, 
 Zhao Liu <zhao1.liu@intel.com>, Alex Williamson <alex@shazbot.org>, 
 Brian Cain <brian.cain@oss.qualcomm.com>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-ppc@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>, Jason Wang <jasowang@redhat.com>, 
 Stafford Horne <shorne@gmail.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Max Filippov <jcmvbkbc@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Cornelia Huck <cohuck@redhat.com>, Song Gao <gaosong@loongson.cn>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Yoshinori Sato <yoshinori.sato@nifty.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>, 
 Peter Xu <peterx@redhat.com>, Pedro Barbuda <pbarbuda@microsoft.com>, 
 Chinmay Rath <rathc@linux.ibm.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 qemu-riscv@nongnu.org, David Hildenbrand <david@kernel.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@mailo.com>, 
 Nicholas Piggin <npiggin@gmail.com>, Aleksandar Rikalo <arikalo@gmail.com>,
 Fabiano Rosas <farosas@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wr1-x436.google.com
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

On Thu, May 28, 2026 at 8:19=E2=80=AFAM Pierrick Bouvier
<pierrick.bouvier@oss.qualcomm.com> wrote:
>
> This eliminates symbol conflicts for kvm symbols on linux-aarch64 host.
>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
> ---

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

>  target/arm/meson.build | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/target/arm/meson.build b/target/arm/meson.build
> index 9408131d178..4412fde065f 100644
> --- a/target/arm/meson.build
> +++ b/target/arm/meson.build
> @@ -35,7 +35,10 @@ arm_system_ss.add(when: 'CONFIG_KVM', if_true: files('=
hyp_gdbstub.c', 'kvm.c'))
>  arm_system_ss.add(when: 'CONFIG_HVF', if_true: files('hyp_gdbstub.c'))
>
>  arm_user_ss.add(files('cpu.c'))
> -arm_stubs_ss.add(files('cpu32-stubs.c'))
> +arm_stubs_ss.add(files(
> +  'cpu32-stubs.c',
> +  'kvm-stub.c'
> +))
>  arm_user_ss.add(files(
>    'el2-stubs.c',
>    'cpregs-omap-stub.c',
> @@ -44,7 +47,6 @@ arm_user_ss.add(when: 'CONFIG_ARM_COMPATIBLE_SEMIHOSTIN=
G',
>                         if_true: files('common-semi-target.c'))
>
>  arm_common_system_ss.add(files('cpu.c'))
> -arm_common_system_ss.add(when: 'CONFIG_KVM', if_false: files('kvm-stub.c=
'))
>  arm_common_system_ss.add(when: 'CONFIG_ARM_COMPATIBLE_SEMIHOSTING',
>                                  if_true: files('common-semi-target.c'))
>  arm_common_system_ss.add(files(
> --
> 2.47.3
>
>

