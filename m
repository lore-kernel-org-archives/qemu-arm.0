Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66FEDCA0FFD
	for <qemu-arm@archiver.kernel.org>; Mon,  1 Sep 2025 10:25:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ut1hr-0001lJ-Gr; Mon, 01 Sep 2025 06:24:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1ut1hq-0001l2-Ka
 for qemu-arm@nongnu.org; Mon, 01 Sep 2025 06:24:10 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1ut1hh-0004Ys-MB
 for qemu-arm@nongnu.org; Mon, 01 Sep 2025 06:24:09 -0400
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-afcb7ae6ed0so611329866b.3
 for <qemu-arm@nongnu.org>; Mon, 01 Sep 2025 03:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756722239; x=1757327039; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FmZph1RVlIckYsUtSQ1kRyrwHKO66MXhKOVe8f3dlYU=;
 b=iChANKMHcfMooy9szlScX4ttzzpfG4x8dBxoWQldaZXMt27fn7GHycgVBk8CSODgik
 1egU3eA6WUGb5CrWiOxwqpW7SvpvoV2zpjaPuuarrKPV1yM/T6PznJ0jIpVc6LzvDvmb
 nsAkf9WPAtr9X8m14BK9rQwf13tf/l5lMV2pbkDu0AY7AqiQaayxWbuB30l02/aspqvk
 a7Q/LG014pIaTAYXN63NF760ZghIoeqLW7D+DlIkBOZ2T5XPAl7rSu0nJYmne0nhTTN1
 gHrONy4aN/uqQ8yYwLaxeWEbDr3tdkfQB5t4Jrbn0Aq5xcpSidGEqXmMGZlSiHbuvE6F
 +XBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756722239; x=1757327039;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FmZph1RVlIckYsUtSQ1kRyrwHKO66MXhKOVe8f3dlYU=;
 b=w/IvkxL4Je1ixA3I52y8q1HctI7HeJLPIySWFON3VCyfRr2ZszmLakiCNXyEy7m/FE
 V5/+kRRI06u9+kxbqPgoz2du99kUPgW8cGg3GSKksp4btfXBGgTrIQGg8zWHiv8my8Tn
 UcLnJQuyNZFhi366bTP2z8WEw3l4Uppdp1IgBXuftminwA3G9c04KCLgi2w54IEyUjzd
 Bwm+lb5/F4mErcVqrExUeHDjG9KcVGKKPsnMzVHo5vtbKryrifJMZ7stSUlO/ZUXo/RF
 VtOQtXgxt0L8y5JLH+4ya6ya3tChlnCrOB3yFOlSZUhSSiLCtjfrq0lbEn24z/ST1+Q4
 KD0g==
X-Gm-Message-State: AOJu0YwLiNrdluJRLHinuQR+T9hjEwvCuTqOaA//ifiiihAjQIeYUk+s
 DnxUFxwy1lBAVFQYAh48q6mpdA28SPXdmb+xuCqbK2M+CZbDGA9/sxyo6Z6Xtp9dzbT2tT64Zzn
 irkhqIDGDRpz7iEPOrn2kIdTh0gRyYZme6Qendyej3A==
X-Gm-Gg: ASbGncuUFS1n4EKzZa+SLhRuM+m4IGQL6s0kyELapV3IWotRrU7dai53s6IEsuFkSuK
 kxq7uSn/ExjGigs8PFZputlxVC9lbeaWNkqVjTAU1g3RZzBgY0pSZzr3VGNTxlbIQM6aHXwxsDv
 xlfH71gEK0S4B06B6bfdw981CyqL0Tz5L0GX2O7dfhVT/KqooHBnD+w8UA+UWBIJ7nRt4e2w30c
 tCY8g0h
X-Google-Smtp-Source: AGHT+IEjMtgAI856oBdkpRPUG6G/3DjavL3E5L1+Whkd/Q6cX9Ej62cdVnUb1GsMzPfwmBGQpnfWYj32GipbEG+/xUU=
X-Received: by 2002:a17:907:7f1f:b0:afe:97eb:4327 with SMTP id
 a640c23a62f3a-b01d8c749admr728626166b.20.1756722239246; Mon, 01 Sep 2025
 03:23:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250901102214.3748011-1-peter.maydell@linaro.org>
In-Reply-To: <20250901102214.3748011-1-peter.maydell@linaro.org>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Mon, 1 Sep 2025 13:23:33 +0300
X-Gm-Features: Ac12FXyMDh1tCYB-M5ItDsuaaJJ1dTyUH4Pi830LZAZnwbbHsVpYFPwCMTid1k4
Message-ID: <CAAjaMXauWTbVhNVKpLgtbaz5qtorAZRBFM2-Rp+V5Z1GOmknnw@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/boot: Correctly free the MemoryDeviceInfoList
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-ej1-x635.google.com
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

On Mon, Sep 1, 2025 at 1:22=E2=80=AFPM Peter Maydell <peter.maydell@linaro.=
org> wrote:
>
> When running the bios-tables-test under ASAN we see leaks like this:
>
> Direct leak of 16 byte(s) in 1 object(s) allocated from:
>     #0 0x5bc58579b00d in calloc (/mnt/nvmedisk/linaro/qemu-from-laptop/qe=
mu/build/arm-asan/qemu-system-aarch64+0x250400d) (BuildId: 2e27b63dc9ac45f5=
22ced40a17c2a60cc32f1d38)
>     #1 0x7b4ad90337b1 in g_malloc0 (/lib/x86_64-linux-gnu/libglib-2.0.so.=
0+0x637b1) (BuildId: 1eb6131419edb83b2178b682829a6913cf682d75)
>     #2 0x5bc5861826db in qmp_memory_device_list /mnt/nvmedisk/linaro/qemu=
-from-laptop/qemu/build/arm-asan/../../hw/mem/memory-device.c:307:34
>     #3 0x5bc587a9edb6 in arm_load_dtb /mnt/nvmedisk/linaro/qemu-from-lapt=
op/qemu/build/arm-asan/../../hw/arm/boot.c:656:15
>
> Indirect leak of 28 byte(s) in 2 object(s) allocated from:
>     #0 0x5bc58579ae23 in malloc (/mnt/nvmedisk/linaro/qemu-from-laptop/qe=
mu/build/arm-asan/qemu-system-aarch64+0x2503e23) (BuildId: 2e27b63dc9ac45f5=
22ced40a17c2a60cc32f1d38)
>     #1 0x7b4ad6c8f947 in __vasprintf_internal libio/vasprintf.c:116:16
>     #2 0x7b4ad9080a52 in g_vasprintf (/lib/x86_64-linux-gnu/libglib-2.0.s=
o.0+0xb0a52) (BuildId: 1eb6131419edb83b2178b682829a6913cf682d75)
>     #3 0x7b4ad90515e4 in g_strdup_vprintf (/lib/x86_64-linux-gnu/libglib-=
2.0.so.0+0x815e4) (BuildId: 1eb6131419edb83b2178b682829a6913cf682d75)
>     #4 0x7b4ad9051940 in g_strdup_printf (/lib/x86_64-linux-gnu/libglib-2=
.0.so.0+0x81940) (BuildId: 1eb6131419edb83b2178b682829a6913cf682d75)
>     #5 0x5bc5885eb739 in object_get_canonical_path /mnt/nvmedisk/linaro/q=
emu-from-laptop/qemu/build/arm-asan/../../qom/object.c:2123:19
>     #6 0x5bc58618dca8 in pc_dimm_md_fill_device_info /mnt/nvmedisk/linaro=
/qemu-from-laptop/qemu/build/arm-asan/../../hw/mem/pc-dimm.c:268:18
>     #7 0x5bc586182792 in qmp_memory_device_list /mnt/nvmedisk/linaro/qemu=
-from-laptop/qemu/build/arm-asan/../../hw/mem/memory-device.c:310:9
>
> This happens because we declared the MemoryDeviceInfoList *md_list
> with g_autofree, which will free the direct memory with g_free() but
> doesn't free all the other data structures referenced by it.  Instead
> what we want is to declare the pointer with g_autoptr(), which will
> automatically call the qapi_free_MemoryDeviceInfoList() cleanup
> function when the variable goes out of scope.
>
> Fixes: 36bc78aca83cfd ("hw/arm: add static NVDIMMs in device tree")
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

Thanks,

>  hw/arm/boot.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index 1e57c4ab9ee..d0840308f5a 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -549,7 +549,7 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_i=
nfo *binfo,
>      unsigned int i;
>      hwaddr mem_base, mem_len;
>      char **node_path;
> -    g_autofree MemoryDeviceInfoList *md_list =3D NULL;
> +    g_autoptr(MemoryDeviceInfoList) md_list =3D NULL;
>      Error *err =3D NULL;
>
>      if (binfo->dtb_filename) {
> --
> 2.43.0
>

