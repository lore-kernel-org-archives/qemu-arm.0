Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp1735272ejb;
        Fri, 16 Dec 2022 13:59:51 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7L2GT0z1FGL87/8wB0fTRlBAgLGI2gEA8H+IJXus7mLIWWc5xoVgwBouJ1zcdBO3oGY6DI
X-Received: by 2002:a5d:4e4b:0:b0:242:67f2:9d68 with SMTP id r11-20020a5d4e4b000000b0024267f29d68mr21721816wrt.34.1671227991213;
        Fri, 16 Dec 2022 13:59:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671227991; cv=none;
        d=google.com; s=arc-20160816;
        b=deuZ2J9f6PL2lV4eaRJYmtW0Dn8Wy5vf5qZMS749f4MvimcFR8McC4NeatokmKwyyR
         SyYyFen0h6Z+8JJQ7uSk7+kiyGk0N/tAjAFqm65+Tg4pufFTMDnoHPAf/N1KMOg+q2EF
         jI7cCPubt3AIOnjKX1C1p+ZZ+Cd7Y0zAZtqwyr7oS8eJIvI8sWHhDVNGzMOo3iy2FbnJ
         68BtgyZGEyQNVrpOIvcu7uLQhGlztazMI6tzxYgV8kwM5jU4gr4giSyVvuni02MPmyaK
         vXdTOsGK/7DoTfX7aYymXuCJOtLeNrqCOKI005YF4CH4YroSd4cMrZjGNsSxwuK5O+hy
         jlxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding;
        bh=QXHJSGD3/HMjX2UHZHxyq6WUQy8yzcy36QQ17XuzmLs=;
        b=G6AN0zr32sqREspkxKrbl0iheD9uhDV3oBAxe36SiSKDB9KREY4EDNkVituxJouuZo
         7BvJ6Q1AgYI0gCa18GXUUEGHI1SJmN9QSWxMMxSfdeanRwt5QeLfqf9lLTRTedcuaJH2
         M8Jv3LMCHHWLkNGY8slFpWswgtW5XWCRPaSYzVswgRNeyfbkK2KBB+NrQZvAnK1vbS0X
         5AwItPp6BSMwSDK3AflbUIgnorMkRJDtFHhjyulbRvlf4gV4czaD81L8A9GKFneG0+dC
         QWDjmDZu+Z94peI5DtPBrsNImnsqeKRLTzlDEC05FnuExK1bm3d8UKmZY4dAyLtNotHA
         7Vdw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of agraf@csgraf.de designates 85.25.223.15 as permitted sender) smtp.mailfrom=agraf@csgraf.de
Return-Path: <agraf@csgraf.de>
Received: from zulu616.server4you.de (mail.csgraf.de. [85.25.223.15])
        by mx.google.com with ESMTP id cl6-20020a5d5f06000000b0024214e6e6d3si2368280wrb.265.2022.12.16.13.59.50;
        Fri, 16 Dec 2022 13:59:51 -0800 (PST)
Received-SPF: pass (google.com: domain of agraf@csgraf.de designates 85.25.223.15 as permitted sender) client-ip=85.25.223.15;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of agraf@csgraf.de designates 85.25.223.15 as permitted sender) smtp.mailfrom=agraf@csgraf.de
Received: from smtpclient.apple (dynamic-077-009-092-114.77.9.pool.telefonica.de [77.9.92.114])
	by csgraf.de (Postfix) with ESMTPSA id 539B26080182;
	Fri, 16 Dec 2022 22:59:50 +0100 (CET)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Alexander Graf <agraf@csgraf.de>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH 1/5] target/arm: only build psci for TCG
Date: Fri, 16 Dec 2022 22:59:39 +0100
Message-Id: <459E39B4-44F5-41B2-A595-1B0DB5AD80F3@csgraf.de>
References: <20221216212944.28229-2-farosas@suse.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>
In-Reply-To: <20221216212944.28229-2-farosas@suse.de>
To: Fabiano Rosas <farosas@suse.de>
X-Mailer: iPhone Mail (20C65)
X-TUID: e9ioGw1SjeTs

Hi Claudio,

If the PSCI implementation becomes TCG only, can we also move to a tcg accel=
 directory? It slowly gets super confusing to keep track of which files are s=
upposed to be generic target code and which ones TCG specific.

Alex

> Am 16.12.2022 um 22:37 schrieb Fabiano Rosas <farosas@suse.de>:
>=20
> =EF=BB=BFFrom: Claudio Fontana <cfontana@suse.de>
>=20
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Cc: Alexander Graf <agraf@csgraf.de>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
> Originally from:
> [RFC v14 09/80] target/arm: only build psci for TCG
> https://lore.kernel.org/r/20210416162824.25131-10-cfontana@suse.de
> ---
> target/arm/meson.build | 5 ++++-
> 1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/target/arm/meson.build b/target/arm/meson.build
> index 87e911b27f..26e425418f 100644
> --- a/target/arm/meson.build
> +++ b/target/arm/meson.build
> @@ -61,10 +61,13 @@ arm_softmmu_ss.add(files(
>   'arm-powerctl.c',
>   'machine.c',
>   'monitor.c',
> -  'psci.c',
>   'ptw.c',
> ))
>=20
> +arm_softmmu_ss.add(when: 'CONFIG_TCG', if_true: files(
> +  'psci.c',
> +))
> +
> subdir('hvf')
>=20
> target_arch +=3D {'arm': arm_ss}
> --=20
> 2.35.3
>=20
