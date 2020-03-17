Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp1316004lfe;
        Tue, 17 Mar 2020 02:49:02 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vu0T9O9wwQQpr1pzH2e+hJIpURUZHnXfv599Fam9+cp29aYW6VdBfLhxXuvQZa9yPD/UNLN
X-Received: by 2002:a25:3413:: with SMTP id b19mr6254103yba.354.1584438541995;
        Tue, 17 Mar 2020 02:49:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584438541; cv=none;
        d=google.com; s=arc-20160816;
        b=dG6+C6LFXHxc9yS+o2kFvKlaQjiJYMCXx7AiEDq/0/DNfT7lF2GMdZ+xTnG6h1cyNM
         bSYP08nMG+cwLKyFSk27XLDhuQ1Ug0lAtHgbSxSTlfqJ+P8eN9WY2TkZZWFPCrArgYU0
         +HbQV3kGRjpQ6ZqbuRMEgofb+G9veGqAVgn3XDi2JkdINoQdrJYEz4NWc3SIWfnUCe0n
         CuVIGhsIubQvWdJXedW/5mREBNPskYAjY5+8jAIYct7Om+4E0USRgmfYdw+Kkpeg22oN
         k8pgJotgHpDDjZn7H9KRrd3+pUchvkE4e2lbv4pl/4BRPwsfY/lq9D2iQLLI/c2A4oWw
         xTWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=DlgwK29XXoJ79V2xw4GiTbSH4TCd0TAC3A21hE+Ta8I=;
        b=D28pG2QITDXnIT/DmYXxD5a5PXeZswgF3rOA6bofhNC/a+pS51bhfY7gOwufLz73W5
         9oLmHjlAe41HGBFHLlQVngdSrzdO0EM29aB9dq0ZCTt4Fj+qXM8MUvAzJbn06e/sglND
         5Ss+zj5W9DKQrKdUfh4y26q9+CJzkSxOfrim04Ipre7VvFAN992pCx/yD4TOLSv2jo76
         630SSUbbG/vC5zRX3JBC8gbNkuZKVe1d56J2/qZtss0z+o2DWF9iNBlO6xoCdpgHhd+L
         EY03Ctt4UFcC1VMpybWiWnvP6NBvE68XA7DJzDukPwZKzbmLZpg9ZlF0uf7peHFJmm/x
         /aIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IkEIutR5;
       spf=pass (google.com: domain of philmd@redhat.com designates 63.128.21.74 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com. [63.128.21.74])
        by mx.google.com with ESMTPS id n83si2666286ybc.25.2020.03.17.02.49.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Mar 2020 02:49:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 63.128.21.74 as permitted sender) client-ip=63.128.21.74;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IkEIutR5;
       spf=pass (google.com: domain of philmd@redhat.com designates 63.128.21.74 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584438541;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DlgwK29XXoJ79V2xw4GiTbSH4TCd0TAC3A21hE+Ta8I=;
	b=IkEIutR5m6jD+U5iwtkOE+2I9awLjfnizwb503eNGB4GVAMTUFXDZkjFC86HHtFzh713n1
	9Ebk3HP/O5Zf7Fyn0564GzM9H4g2lOwAPmq490YNZufiPdpFjAQ5ZmrB+RnKThNnTMMy4R
	H5JYSi+CoykR47zIsGhrwcWjm4qz/2E=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-16-9t3Yj8bMOYGZqQnC2RD7wQ-1; Tue, 17 Mar 2020 05:48:59 -0400
X-MC-Unique: 9t3Yj8bMOYGZqQnC2RD7wQ-1
Received: by mail-wm1-f69.google.com with SMTP id m4so6919713wmi.5
        for <alex.bennee@linaro.org>; Tue, 17 Mar 2020 02:48:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5oEq67vHO1jUy45Gr+tbnqd9Mz1dLzUQLrRT/T1z1d8=;
        b=mJ1NllLwZvoW2w3JYH8GICLtvPFoxkLxSBX0bvrEgcumXWDO16kjhm3lpNsmyR0iS2
         ryALbtgBxon+MR/OL2SKPVPHDMfTYjb6n/qz5RRlY6SEcNo3VCfSfmPznkFq0M8l3n4b
         ppWjVwahX7zKEeGCP5n/kzDJQcNfToRhhCr+4mNvDg3n8Ji9phTntzMxcRVT0MFeLIem
         kkfOy2OJ/fMeZcU6JnHwPqBo0816pOcbbmDtuAwdjr4yuFFjkk0weNWKDfjmYI9rIPD8
         aSnMjcerctGPBnqo4Ldkzu9X4/wytgaLdXF0jF3fycRZ4H5tD6Jr6/RRzkciK/9+UoM/
         zncw==
X-Gm-Message-State: ANhLgQ1j5KjQj4xHaWJ4D0anAgHM15J5CVWeCf2H+1MlTzhl6Ih+zTE7
	gUfNSyjqoVxOUBhv9AiDH14wDrzXuic6gxT1wICSQ/pihgi6kiwIWFYTWpR9fs9G36C5h4DQ7HA
	5QQ4XTo58+EVXZ21v
X-Received: by 2002:a7b:c115:: with SMTP id w21mr4398703wmi.158.1584438538440;
        Tue, 17 Mar 2020 02:48:58 -0700 (PDT)
X-Received: by 2002:a7b:c115:: with SMTP id w21mr4398684wmi.158.1584438538249;
        Tue, 17 Mar 2020 02:48:58 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.34] (96.red-83-59-163.dynamicip.rima-tde.net. [83.59.163.96])
        by smtp.gmail.com with ESMTPSA id f187sm3372663wme.31.2020.03.17.02.48.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2020 02:48:57 -0700 (PDT)
Subject: Re: [PATCH v1 12/28] target/m68k: use gdb_get_reg helpers
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>
References: <20200316172155.971-1-alex.bennee@linaro.org>
 <20200316172155.971-13-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <3003316c-d52c-b720-8176-3e74e9836ff2@redhat.com>
Date: Tue, 17 Mar 2020 10:48:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200316172155.971-13-alex.bennee@linaro.org>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TUID: h00H5oxWiz7Y

On 3/16/20 6:21 PM, Alex Benn=C3=A9e wrote:
> This is cleaner than poking memory directly and will make later
> clean-ups easier.
>=20
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
>=20
> ---
> v3
>    - fix mem_buf references
>    - fix mem_buf + len cases
> ---
>   target/m68k/helper.c | 29 +++++++++++------------------
>   1 file changed, 11 insertions(+), 18 deletions(-)
>=20
> diff --git a/target/m68k/helper.c b/target/m68k/helper.c
> index baf7729af00..c23b70f854d 100644
> --- a/target/m68k/helper.c
> +++ b/target/m68k/helper.c
> @@ -72,19 +72,15 @@ static int cf_fpu_gdb_get_reg(CPUM68KState *env, uint=
8_t *mem_buf, int n)
>   {
>       if (n < 8) {
>           float_status s;
> -        stfq_p(mem_buf, floatx80_to_float64(env->fregs[n].d, &s));
> -        return 8;
> +        return gdb_get_reg64(mem_buf, floatx80_to_float64(env->fregs[n].=
d, &s));
>       }
>       switch (n) {
>       case 8: /* fpcontrol */
> -        stl_be_p(mem_buf, env->fpcr);
> -        return 4;
> +        return gdb_get_reg32(mem_buf, env->fpcr);
>       case 9: /* fpstatus */
> -        stl_be_p(mem_buf, env->fpsr);
> -        return 4;
> +        return gdb_get_reg32(mem_buf, env->fpsr);
>       case 10: /* fpiar, not implemented */
> -        memset(mem_buf, 0, 4);
> -        return 4;
> +        return gdb_get_reg32(mem_buf, 0);
>       }
>       return 0;
>   }
> @@ -112,21 +108,18 @@ static int cf_fpu_gdb_set_reg(CPUM68KState *env, ui=
nt8_t *mem_buf, int n)
>   static int m68k_fpu_gdb_get_reg(CPUM68KState *env, uint8_t *mem_buf, in=
t n)
>   {
>       if (n < 8) {
> -        stw_be_p(mem_buf, env->fregs[n].l.upper);
> -        memset(mem_buf + 2, 0, 2);
> -        stq_be_p(mem_buf + 4, env->fregs[n].l.lower);
> -        return 12;
> +        int len =3D gdb_get_reg16(mem_buf, env->fregs[n].l.upper);
> +        len +=3D gdb_get_reg16(mem_buf + len, 0);
> +        len +=3D gdb_get_reg64(mem_buf + len, env->fregs[n].l.lower);

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

> +        return len;
>       }
>       switch (n) {
>       case 8: /* fpcontrol */
> -        stl_be_p(mem_buf, env->fpcr);
> -        return 4;
> +        return gdb_get_reg32(mem_buf, env->fpcr);
>       case 9: /* fpstatus */
> -        stl_be_p(mem_buf, env->fpsr);
> -        return 4;
> +        return gdb_get_reg32(mem_buf, env->fpsr);
>       case 10: /* fpiar, not implemented */
> -        memset(mem_buf, 0, 4);
> -        return 4;
> +        return gdb_get_reg32(mem_buf, 0);
>       }
>       return 0;
>   }
>=20
