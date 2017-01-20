Received: by 10.25.77.65 with SMTP id a62csp132769lfb;
        Fri, 20 Jan 2017 11:05:06 -0800 (PST)
X-Received: by 10.237.35.84 with SMTP id i20mr14059523qtc.247.1484939106730;
        Fri, 20 Jan 2017 11:05:06 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b27si5487192qkh.32.2017.01.20.11.05.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 20 Jan 2017 11:05:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:56845 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cUeUi-0007x5-5x
	for alex.bennee@linaro.org; Fri, 20 Jan 2017 14:05:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51230)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1cUeUa-0007vN-Ny
	for qemu-arm@nongnu.org; Fri, 20 Jan 2017 14:04:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1cUeUV-0004ID-KP
	for qemu-arm@nongnu.org; Fri, 20 Jan 2017 14:04:56 -0500
Received: from mail-ot0-x243.google.com ([2607:f8b0:4003:c0f::243]:36716)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1cUeUV-0004HQ-F7; Fri, 20 Jan 2017 14:04:51 -0500
Received: by mail-ot0-x243.google.com with SMTP id 36so8466385otx.3;
	Fri, 20 Jan 2017 11:04:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7Q87FZZeBcS55iG39o9LaoHZ23OyHqgiaD6HbArEklE=;
	b=lP9ggbUcf4OrOuQ2xG7sdUs1Yq4+zpm+qG9KmPIYP0YvbJ32Xd5eXxd3KupWGwi1Ca
	/QboGFoxsp0LshoOaLkf705M8TIVqGUiE+o5VR5+aJAmkB58c2vZqDKLIIy+UVHoHfXz
	zFaz6NUL04WJHwtULaEz7JI3AaPpA7q4BQBirksOsRPqdQpNHdgrj/3gP850lfW9E51E
	kMEmdjFSAhu+XQf1B+/vbK1IszSROkC6GckJ2H15L/MyaEIWJQUHlJw2dXXGdGHExYLV
	hJ+cY89KxLrNth+Pqmlmo0C8pAYb4aFvdLE7vXIW/vMjGKatulgRegQdbjdQQW3ADLBU
	cqVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7Q87FZZeBcS55iG39o9LaoHZ23OyHqgiaD6HbArEklE=;
	b=G04oKVV9hCsomdZrzul5xmhZBLaJxdUzT73+hIOj/YPAN43eBrni/6LEiHKl1iGbHP
	kqDhwwv+qKdlzFXcblKScTpp9UwUUEPu0HSg6ywVtpniKwiXRCWKq44e0jjgO6bgIuqU
	Kv20776nN0sEClzqGZjZdHlrslsONVPUMat1u/tSP/7KO/dyTT6DME1jlF29B3CkdzoB
	/t9H91sttIsgYe9F9h2yIE+mogx2W41uyni8sRVE2OIUc2wHqXuSpCxYAurQzN9gnZpc
	a2hUzn3F2yyeEY1Rn0//CSIn90daRi6Dp92ZvaP3JsJJARik8g7BNcSzGFOck0zuvujC
	QldA==
X-Gm-Message-State: AIkVDXKOYkSZAMYOYreHntL/+Bk2xMX6aBvqz6khTELd6JdSLBcLgyZ6y3C5994AttthHex/s6vkNMJg9cdU2g==
X-Received: by 10.157.11.14 with SMTP id a14mr9010042ota.121.1484939089167;
	Fri, 20 Jan 2017 11:04:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.182.98.133 with HTTP; Fri, 20 Jan 2017 11:04:18 -0800 (PST)
In-Reply-To: <1484937883-1068-5-git-send-email-peter.maydell@linaro.org>
References: <1484937883-1068-1-git-send-email-peter.maydell@linaro.org>
	<1484937883-1068-5-git-send-email-peter.maydell@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 20 Jan 2017 11:04:18 -0800
Message-ID: <CAKmqyKOwzNj827103eSYZp6wAbsn4Ymvit-ZSOV9J7dLRgvO1A@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c0f::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 4/6] hw/registerfields.h: Pull
 FIELD etc macros out of hw/register.h
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Liviu Ionescu <ilg@livius.net>, Michael Davidsaver <mdavidsaver@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: i5hVyGUmKJ5h

On Fri, Jan 20, 2017 at 10:44 AM, Peter Maydell
<peter.maydell@linaro.org> wrote:
> hw/register.h provides macros like FIELD which make it easy to define
> shift, mask and length constants for the fields within a register.
> Unfortunately register.h also includes a lot of other things, some
> of which will only compile in the softmmu build.
>
> Pull the FIELD macro and friends out into a separate header file,
> so they can be used in places like target/arm files which also
> get built in the user-only configs.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Looks good to me, I'm glad this is being used by others :)

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Thanks,

Alistair

> ---
>  include/hw/register.h       | 47 +----------------------------------
>  include/hw/registerfields.h | 60 +++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 61 insertions(+), 46 deletions(-)
>  create mode 100644 include/hw/registerfields.h
>
> diff --git a/include/hw/register.h b/include/hw/register.h
> index 8c12233..8bff5fb 100644
> --- a/include/hw/register.h
> +++ b/include/hw/register.h
> @@ -13,6 +13,7 @@
>
>  #include "hw/qdev-core.h"
>  #include "exec/memory.h"
> +#include "hw/registerfields.h"
>
>  typedef struct RegisterInfo RegisterInfo;
>  typedef struct RegisterAccessInfo RegisterAccessInfo;
> @@ -206,50 +207,4 @@ RegisterInfoArray *register_init_block32(DeviceState *owner,
>
>  void register_finalize_block(RegisterInfoArray *r_array);
>
> -/* Define constants for a 32 bit register */
> -
> -/* This macro will define A_FOO, for the byte address of a register
> - * as well as R_FOO for the uint32_t[] register number (A_FOO / 4).
> - */
> -#define REG32(reg, addr)                                                  \
> -    enum { A_ ## reg = (addr) };                                          \
> -    enum { R_ ## reg = (addr) / 4 };
> -
> -/* Define SHIFT, LENGTH and MASK constants for a field within a register */
> -
> -/* This macro will define FOO_BAR_MASK, FOO_BAR_SHIFT and FOO_BAR_LENGTH
> - * constants for field BAR in register FOO.
> - */
> -#define FIELD(reg, field, shift, length)                                  \
> -    enum { R_ ## reg ## _ ## field ## _SHIFT = (shift)};                  \
> -    enum { R_ ## reg ## _ ## field ## _LENGTH = (length)};                \
> -    enum { R_ ## reg ## _ ## field ## _MASK =                             \
> -                                        MAKE_64BIT_MASK(shift, length)};
> -
> -/* Extract a field from a register */
> -#define FIELD_EX32(storage, reg, field)                                   \
> -    extract32((storage), R_ ## reg ## _ ## field ## _SHIFT,               \
> -              R_ ## reg ## _ ## field ## _LENGTH)
> -
> -/* Extract a field from an array of registers */
> -#define ARRAY_FIELD_EX32(regs, reg, field)                                \
> -    FIELD_EX32((regs)[R_ ## reg], reg, field)
> -
> -/* Deposit a register field.
> - * Assigning values larger then the target field will result in
> - * compilation warnings.
> - */
> -#define FIELD_DP32(storage, reg, field, val) ({                           \
> -    struct {                                                              \
> -        unsigned int v:R_ ## reg ## _ ## field ## _LENGTH;                \
> -    } v = { .v = val };                                                   \
> -    uint32_t d;                                                           \
> -    d = deposit32((storage), R_ ## reg ## _ ## field ## _SHIFT,           \
> -                  R_ ## reg ## _ ## field ## _LENGTH, v.v);               \
> -    d; })
> -
> -/* Deposit a field to array of registers.  */
> -#define ARRAY_FIELD_DP32(regs, reg, field, val)                           \
> -    (regs)[R_ ## reg] = FIELD_DP32((regs)[R_ ## reg], reg, field, val);
> -
>  #endif
> diff --git a/include/hw/registerfields.h b/include/hw/registerfields.h
> new file mode 100644
> index 0000000..af101d5
> --- /dev/null
> +++ b/include/hw/registerfields.h
> @@ -0,0 +1,60 @@
> +/*
> + * Register Definition API: field macros
> + *
> + * Copyright (c) 2016 Xilinx Inc.
> + * Copyright (c) 2013 Peter Crosthwaite <peter.crosthwaite@xilinx.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2.  See
> + * the COPYING file in the top-level directory.
> + */
> +
> +#ifndef REGISTERFIELDS_H
> +#define REGISTERFIELDS_H
> +
> +/* Define constants for a 32 bit register */
> +
> +/* This macro will define A_FOO, for the byte address of a register
> + * as well as R_FOO for the uint32_t[] register number (A_FOO / 4).
> + */
> +#define REG32(reg, addr)                                                  \
> +    enum { A_ ## reg = (addr) };                                          \
> +    enum { R_ ## reg = (addr) / 4 };
> +
> +/* Define SHIFT, LENGTH and MASK constants for a field within a register */
> +
> +/* This macro will define FOO_BAR_MASK, FOO_BAR_SHIFT and FOO_BAR_LENGTH
> + * constants for field BAR in register FOO.
> + */
> +#define FIELD(reg, field, shift, length)                                  \
> +    enum { R_ ## reg ## _ ## field ## _SHIFT = (shift)};                  \
> +    enum { R_ ## reg ## _ ## field ## _LENGTH = (length)};                \
> +    enum { R_ ## reg ## _ ## field ## _MASK =                             \
> +                                        MAKE_64BIT_MASK(shift, length)};
> +
> +/* Extract a field from a register */
> +#define FIELD_EX32(storage, reg, field)                                   \
> +    extract32((storage), R_ ## reg ## _ ## field ## _SHIFT,               \
> +              R_ ## reg ## _ ## field ## _LENGTH)
> +
> +/* Extract a field from an array of registers */
> +#define ARRAY_FIELD_EX32(regs, reg, field)                                \
> +    FIELD_EX32((regs)[R_ ## reg], reg, field)
> +
> +/* Deposit a register field.
> + * Assigning values larger then the target field will result in
> + * compilation warnings.
> + */
> +#define FIELD_DP32(storage, reg, field, val) ({                           \
> +    struct {                                                              \
> +        unsigned int v:R_ ## reg ## _ ## field ## _LENGTH;                \
> +    } v = { .v = val };                                                   \
> +    uint32_t d;                                                           \
> +    d = deposit32((storage), R_ ## reg ## _ ## field ## _SHIFT,           \
> +                  R_ ## reg ## _ ## field ## _LENGTH, v.v);               \
> +    d; })
> +
> +/* Deposit a field to array of registers.  */
> +#define ARRAY_FIELD_DP32(regs, reg, field, val)                           \
> +    (regs)[R_ ## reg] = FIELD_DP32((regs)[R_ ## reg], reg, field, val);
> +
> +#endif
> --
> 2.7.4
>
>
