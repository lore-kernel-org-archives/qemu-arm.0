Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp856889lfp;
        Fri, 31 Jan 2020 08:50:49 -0800 (PST)
X-Google-Smtp-Source: APXvYqwBl09pLYq4h/OETFboqVazU/BE9iFVG65fBdtucKQ8Na9E4IdBzIOEpbLMyzDf9KLPVr4o
X-Received: by 2002:a05:6402:513:: with SMTP id m19mr1130500edv.387.1580489449075;
        Fri, 31 Jan 2020 08:50:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580489449; cv=none;
        d=google.com; s=arc-20160816;
        b=WyfQiHwLMN5cCC+kPTDlQ8Sw3Um4gOqBFN5tGWXpWi+LK+0RcPoB1yTA9wiLaqlg+8
         c0HSQiqy/BHSVb5UgeRvZFyfWXtMA9nIKE/0MImN5GkYqvPHqLVEcphug42+f+oi+0BZ
         4/vqEsu1Nqy5Yv62/UpkpQZsP6jrEdA8K3o/OjkV/G+Q4OwVbZdHC7MAruwXwSCgOJH+
         lQLgjD286+Enlhtz1OurLyAAor702Rde6ZRA1Ztlcc7MjsL/IdvsDbYNv37gvQHtqjVV
         wM/2hy0ymK5XDSCugiOjlbngu3a1Tnn8ns96R9QXlO9JMhtaotRRiNKkW3aiYTW9xcMZ
         Dfgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=IbZ8lkmxjwttVdO+ZOcvL7+Qx6mj4s8HQ7fAQ8X7O3g=;
        b=L8IS1yETYnJU8wup39AVnac5DcopxK7u2+ODmblJVj2xRMpesIzEJnPPa/BTOXmfgw
         gNHZHjarxN6q8P6dbKXSGN94TIQ7CBqi1IjK14G5Nm8siVAONsTh4YTozTCTVbMYccfU
         I0D4DHRaqV3mnyC4YuvmSTvE7sXO9Uvz1KKwAMJyZ2R2uXkOgOMsj+vqwDAEcQ5TPKw5
         rQaalVMxiAqqEjDhyqgEk6V5ACfV79C12WFOxAh5ZBNUOfzUgVzVcWhGpXogFzninuwU
         +0VJz82DWP9zCkTmGoevMHQX7uUXrQ3gjsTIlDdcuyuKfuMMNmu0WMofncMib8r1gCG+
         o8og==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LJIKEYH6;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com. [207.211.31.81])
        by mx.google.com with ESMTPS id n15si5389217ejz.389.2020.01.31.08.50.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 31 Jan 2020 08:50:49 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 207.211.31.81 as permitted sender) client-ip=207.211.31.81;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LJIKEYH6;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580489448;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IbZ8lkmxjwttVdO+ZOcvL7+Qx6mj4s8HQ7fAQ8X7O3g=;
	b=LJIKEYH6sS8OhwyBA7ngflU8raO2tyYlU3OQPkJuEFZEhQJWaxe7XVbgD7YJ2LzD4IsBtI
	cP7RSDRE4JT92e4FNrmnlRMRGdsq+B8ZrsNc90blPQBOn5qJPNuWoNfyNYg8JNJWELnYqN
	GjEBO4fDSlpdG3i7jYNUaGyaJaYevFg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-QYD7wGH0NzCUOSWpTxKCSw-1; Fri, 31 Jan 2020 11:50:45 -0500
Received: by mail-wr1-f69.google.com with SMTP id h30so3630722wrh.5
        for <alex.bennee@linaro.org>; Fri, 31 Jan 2020 08:50:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JQoe4N098i7u193ANSArP88zvLs8uh35IfTnMBeOztY=;
        b=r/mJYKEuSGeGDRDnxJvTQr1cxGqNQ0HCXo4Ua2v2Q4pKbR4GBAV/dnTGtmymATz4j/
         WL5P35wCh3AxU+BtS+BepkK1C20JLT0cMKAOOxyoMb5It+kijkvBDY28LAYy2ELXBsec
         mxSyAbw6DUYsNWybziEk61J7mC+ACKkIk4nA+pgSkGehbvw4i5t1sn0t98Rlh15YhXzs
         ebNpebv7EZ4dmM+rHrAoC0JXZMmZxwPETZeBMPnUwmhzXZ26cOeNnvqOditsKpzQGTLK
         LtEnLoeFAuMgQa20AN04T1dopRtDUIo1RYQQXZ0msZ4TunKAgEWLo+vy8YeU+GASOMQc
         l1tQ==
X-Gm-Message-State: APjAAAV4MuyBKgbzUJFsyMaFz+KYTNCUFQXIyO0HWRleJjkQp0RpfYuP
	g2D2uBDEpSDC4iTHlkQHz/MCl6o+4Qa1lB4rbmJRPP05J1X/alFe//0krMgCxCRUQbHSyyPzF5K
	fJvB9kvUSJt4abr/Z
X-Received: by 2002:a5d:5091:: with SMTP id a17mr12878447wrt.362.1580489444462;
        Fri, 31 Jan 2020 08:50:44 -0800 (PST)
X-Received: by 2002:a5d:5091:: with SMTP id a17mr12878435wrt.362.1580489444274;
        Fri, 31 Jan 2020 08:50:44 -0800 (PST)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.35] (113.red-83-57-172.dynamicip.rima-tde.net. [83.57.172.113])
        by smtp.gmail.com with ESMTPSA id t1sm12058143wma.43.2020.01.31.08.50.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2020 08:50:43 -0800 (PST)
Subject: Re: [PATCH] target/arm: fix TCG leak for fcvt half->double
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org
References: <20200131153439.26027-1-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <86de4318-8937-c228-973e-f88b41248d03@redhat.com>
Date: Fri, 31 Jan 2020 17:50:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200131153439.26027-1-alex.bennee@linaro.org>
Content-Language: en-US
X-MC-Unique: QYD7wGH0NzCUOSWpTxKCSw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TUID: zGSwQMos6TUg

On 1/31/20 4:34 PM, Alex Benn=C3=A9e wrote:
> When support for the AHP flag was added we inexplicably only freed the
> new temps in one of the two legs. Move those tcg_temp_free to the same
> level as the allocation to fix that leak.

Probably too much code refactoring :/

>=20
> Fixes: 486624fcd3eac

Maybe:
Reported-by: Peter Maydell <peter.maydell@linaro.org>

> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

> ---
>   target/arm/translate-a64.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index 96a5be2b372..766a03335bf 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -5778,8 +5778,6 @@ static void handle_fp_fcvt(DisasContext *s, int opc=
ode,
>               TCGv_i32 tcg_rd =3D tcg_temp_new_i32();
>               gen_helper_vfp_fcvt_f16_to_f32(tcg_rd, tcg_rn, tcg_fpst, tc=
g_ahp);
>               write_fp_sreg(s, rd, tcg_rd);
> -            tcg_temp_free_ptr(tcg_fpst);
> -            tcg_temp_free_i32(tcg_ahp);
>               tcg_temp_free_i32(tcg_rd);
>           } else {
>               /* Half to double */
> @@ -5789,6 +5787,8 @@ static void handle_fp_fcvt(DisasContext *s, int opc=
ode,
>               tcg_temp_free_i64(tcg_rd);
>           }
>           tcg_temp_free_i32(tcg_rn);
> +        tcg_temp_free_ptr(tcg_fpst);
> +        tcg_temp_free_i32(tcg_ahp);
>           break;
>       }
>       default:
>=20
