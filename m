Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp92323wrp;
        Thu, 3 Oct 2019 16:27:35 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwQZDQJ+vfjoCpDLyJxZhPbp6ysIG8lfkmIbShBDTLSSB3P+1cQoYXyv9NpbqHynWp8n3Rs
X-Received: by 2002:a50:9625:: with SMTP id y34mr12143882eda.72.1570145255927;
        Thu, 03 Oct 2019 16:27:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570145255; cv=none;
        d=google.com; s=arc-20160816;
        b=GMlS6H2iz0dHRFn5SXfokXc3CM8gwy+9nNB96Npiv7jahY3KqwVv27T42bO2f1DlQJ
         6WW+a7LsJk86ZMefunofimUn0EIZ+JxEPY7OrVZVvAjT1L1+I0AtREwfvzEzjOKg2xfG
         8Yb9YoW2chlJw3G21ZvIxC0TZ6Abixwwr5/7hQuOSlbHRxo4SXsPDEEUNKZFZCplVfVK
         XmA3d0RQUTq/4xEQqxS4McG0mEyiea+mmkfCqZKmnEaR8JysVYeojtZ7+HbRch8CyCZm
         5CfkjWukJlob9fHxGjIHGoWisc2XiC9JLTLpashyJItDuDze4AE6rB9Q+bi2Nciv2Kxp
         XssQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=8ZjAxt4cP4IRJPHO7T1aBscLO1IaHI6oOKh+GLrbAAI=;
        b=Hi7LdoRbjHAwsYgkV1sh26yR6ZSN8rhlRtngYI9HObhGT0SyWh4gCGF1skWTdwf7m3
         JbWr2uoAmh4+mymyUV4xZ0vjG3zxJvJDEXypAo6JveKuJbheCTLFtzFmD0qYn5rQM+lt
         KmLuY5nTDIXHMK8KuwBUz/sFkVoXKk2quRlVHVrcUvSRMwmnXsCPgN30IaY12dhZOHUk
         gs2N7Tv61BLHBIrsaijphS63AWYODrq8QWwUwugzm+fmrZR1JgdoW5YtE2i9eIy9sDTE
         TuHR4uRaWZzOej2f8EQY5Ne+2REL4N56lDtrwTHCdsWD1UAOq/hs7rhr9FPdADGgXTx3
         8Ozw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ba3Sj1PB;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id a2si2422061edc.321.2019.10.03.16.27.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Oct 2019 16:27:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) client-ip=207.211.31.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ba3Sj1PB;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1570145254;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8ZjAxt4cP4IRJPHO7T1aBscLO1IaHI6oOKh+GLrbAAI=;
	b=Ba3Sj1PB4TA0zmvtHsv6JRXsY4A8rqeNrZIeHRgEo+2lW/DtJQcK9oZ+uw0s4MAVdvo2JY
	b2w29uwjMQ3UlH/nQ7oQULHv7MGRDVwbrQ82twZUA9ZvG7dNFcFuW4o61H0BfMsUI+L1bz
	GwCaRyB6p6OVi4csI4X9YMKi56CgELc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-P_t2LNFeOdegQ7iUYYh-sQ-1; Thu, 03 Oct 2019 19:27:33 -0400
Received: by mail-wr1-f71.google.com with SMTP id w10so1823992wrl.5
        for <alex.bennee@linaro.org>; Thu, 03 Oct 2019 16:27:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0ForYoJMzBgOc+AT5Ml/lQK+m86Hmnd8hRSvmswKqu8=;
        b=IDAzxvYPHTNZ/MIELstR51ffo2uuoo8NKNi+md5o1MsFiPy6u4qhsXWl5O9jXP74zA
         HJfuMYwdsbjWBqCbgMORIvau58tdw3+styf+bjSBRh6LlhKlGIZA0iqL6F70dBnt+TIG
         HBnlDvwUoFzkGioVfsQo0hbdoegWOfiilLjkpGCo4mcD+YG6ct8TaQs9S9aNP0IYFgsH
         EwD6Ukb6LGqhY5Gro2f/et078TS9vifk2N1h+XOj68TEFiDmssET7ZaNY8RNpyFZMia7
         2rInqpLmS8AoMxloNeeyfpgePe0hfvhOPS7+bcXhG9/0nPVNxAVWkkVbDF1ZaBetP+om
         GsvQ==
X-Gm-Message-State: APjAAAUBqBr5kO+N9dUPwbFqImo3UCdzJnp4HJpvvpBcNepplG/iHcwQ
	rHxfvxOTCEyaPQDqxk14NbwSxoz5gxlnZ+sbr3Ox4AWu+kgN/8lI2fZvMIj0MmyAYAUrS9wQc6x
	zTLJ+px4i0DdfUM6J
X-Received: by 2002:a05:600c:252:: with SMTP id 18mr7984474wmj.4.1570145251809;
        Thu, 03 Oct 2019 16:27:31 -0700 (PDT)
X-Received: by 2002:a05:600c:252:: with SMTP id 18mr7984467wmj.4.1570145251558;
        Thu, 03 Oct 2019 16:27:31 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.35] (240.red-88-21-68.staticip.rima-tde.net. [88.21.68.240])
        by smtp.gmail.com with ESMTPSA id g3sm8224865wro.14.2019.10.03.16.27.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Oct 2019 16:27:31 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v2 02/15] target/arm/arm-semi: Always set
 some kind of errno for failed calls
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20190916141544.17540-1-peter.maydell@linaro.org>
 <20190916141544.17540-3-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <0c3b2796-b7e9-ecfd-0b63-a466ee03cdbf@redhat.com>
Date: Fri, 4 Oct 2019 01:27:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20190916141544.17540-3-peter.maydell@linaro.org>
Content-Language: en-US
X-MC-Unique: P_t2LNFeOdegQ7iUYYh-sQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TUID: 9YJFRKI4wQlN

On 9/16/19 4:15 PM, Peter Maydell wrote:
> If we fail a semihosting call we should always set the
> semihosting errno to something; we were failing to do
> this for some of the "check inputs for sanity" cases.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

> ---
>   target/arm/arm-semi.c | 45 ++++++++++++++++++++++++++-----------------
>   1 file changed, 27 insertions(+), 18 deletions(-)
>=20
> diff --git a/target/arm/arm-semi.c b/target/arm/arm-semi.c
> index 03e60105c05..51b55816faf 100644
> --- a/target/arm/arm-semi.c
> +++ b/target/arm/arm-semi.c
> @@ -232,11 +232,13 @@ static target_ulong arm_gdb_syscall(ARMCPU *cpu, gd=
b_syscall_complete_cb cb,
>   #define GET_ARG(n) do {                                 \
>       if (is_a64(env)) {                                  \
>           if (get_user_u64(arg ## n, args + (n) * 8)) {   \
> -            return -1;                                  \
> +            errno =3D EFAULT;                             \
> +            return set_swi_errno(ts, -1);               \
>           }                                               \
>       } else {                                            \
>           if (get_user_u32(arg ## n, args + (n) * 4)) {   \
> -            return -1;                                  \
> +            errno =3D EFAULT;                             \
> +            return set_swi_errno(ts, -1);               \
>           }                                               \
>       }                                                   \
>   } while (0)
> @@ -287,12 +289,13 @@ target_ulong do_arm_semihosting(CPUARMState *env)
>           GET_ARG(2);
>           s =3D lock_user_string(arg0);
>           if (!s) {
> -            /* FIXME - should this error code be -TARGET_EFAULT ? */
> -            return (uint32_t)-1;
> +            errno =3D EFAULT;
> +            return set_swi_errno(ts, -1);
>           }
>           if (arg1 >=3D 12) {
>               unlock_user(s, arg0, 0);
> -            return (uint32_t)-1;
> +            errno =3D EINVAL;
> +            return set_swi_errno(ts, -1);
>           }
>           if (strcmp(s, ":tt") =3D=3D 0) {
>               int result_fileno =3D arg1 < 4 ? STDIN_FILENO : STDOUT_FILE=
NO;
> @@ -413,8 +416,8 @@ target_ulong do_arm_semihosting(CPUARMState *env)
>           } else {
>               s =3D lock_user_string(arg0);
>               if (!s) {
> -                /* FIXME - should this error code be -TARGET_EFAULT ? */
> -                return (uint32_t)-1;
> +                errno =3D EFAULT;
> +                return set_swi_errno(ts, -1);
>               }
>               ret =3D  set_swi_errno(ts, remove(s));
>               unlock_user(s, arg0, 0);
> @@ -432,11 +435,12 @@ target_ulong do_arm_semihosting(CPUARMState *env)
>               char *s2;
>               s =3D lock_user_string(arg0);
>               s2 =3D lock_user_string(arg2);
> -            if (!s || !s2)
> -                /* FIXME - should this error code be -TARGET_EFAULT ? */
> -                ret =3D (uint32_t)-1;
> -            else
> +            if (!s || !s2) {
> +                errno =3D EFAULT;
> +                ret =3D set_swi_errno(ts, -1);
> +            } else {
>                   ret =3D set_swi_errno(ts, rename(s, s2));
> +            }
>               if (s2)
>                   unlock_user(s2, arg2, 0);
>               if (s)
> @@ -456,8 +460,8 @@ target_ulong do_arm_semihosting(CPUARMState *env)
>           } else {
>               s =3D lock_user_string(arg0);
>               if (!s) {
> -                /* FIXME - should this error code be -TARGET_EFAULT ? */
> -                return (uint32_t)-1;
> +                errno =3D EFAULT;
> +                return set_swi_errno(ts, -1);
>               }
>               ret =3D set_swi_errno(ts, system(s));
>               unlock_user(s, arg0, 0);
> @@ -517,19 +521,22 @@ target_ulong do_arm_semihosting(CPUARMState *env)
>  =20
>               if (output_size > input_size) {
>                   /* Not enough space to store command-line arguments.  *=
/
> -                return -1;
> +                errno =3D E2BIG;
> +                return set_swi_errno(ts, -1);
>               }
>  =20
>               /* Adjust the command-line length.  */
>               if (SET_ARG(1, output_size - 1)) {
>                   /* Couldn't write back to argument block */
> -                return -1;
> +                errno =3D EFAULT;
> +                return set_swi_errno(ts, -1);
>               }
>  =20
>               /* Lock the buffer on the ARM side.  */
>               output_buffer =3D lock_user(VERIFY_WRITE, arg0, output_size=
, 0);
>               if (!output_buffer) {
> -                return -1;
> +                errno =3D EFAULT;
> +                return set_swi_errno(ts, -1);
>               }
>  =20
>               /* Copy the command-line arguments.  */
> @@ -544,7 +551,8 @@ target_ulong do_arm_semihosting(CPUARMState *env)
>  =20
>               if (copy_from_user(output_buffer, ts->info->arg_start,
>                                  output_size)) {
> -                status =3D -1;
> +                errno =3D EFAULT;
> +                status =3D set_swi_errno(ts, -1);
>                   goto out;
>               }
>  =20
> @@ -614,7 +622,8 @@ target_ulong do_arm_semihosting(CPUARMState *env)
>  =20
>                   if (fail) {
>                       /* Couldn't write back to argument block */
> -                    return -1;
> +                    errno =3D EFAULT;
> +                    return set_swi_errno(ts, -1);
>                   }
>               }
>               return 0;
>=20
