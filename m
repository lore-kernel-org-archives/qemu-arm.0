Received: by 2002:a17:906:4a55:b0:9d0:bf65:29fa with SMTP id a21csp63665ejv;
        Mon, 6 Nov 2023 19:52:47 -0800 (PST)
X-Received: by 2002:a5b:d08:0:b0:d9a:c41c:133a with SMTP id y8-20020a5b0d08000000b00d9ac41c133amr27332246ybp.38.1699329167325;
        Mon, 06 Nov 2023 19:52:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699329167; cv=none;
        d=google.com; s=arc-20160816;
        b=Gv6qLQLc3l9+ny2RJ7dcM8GJ6RA9A41b/ywBQt69c739PD8oCA/zy6SaAL/PDq0GK6
         AMSyrNfeDMoW0NuLlXBhx+jh+Bb1lUEcxijI8BdVScx1mM+I3VxLz7L4tmN8qAbCuCFp
         Ue43QVTi6/Kj2d4TnkWcDByA9VWo8IGGS4w2fXSY1BWYeyJOiRPH5FVi31pL6T5F1URg
         UBG8QkWJH/GC+VkDtYQj8+GbRrFKNZASeMkV5xprUr/539Kx8dvmFMH+IZjvTQlTh8wE
         XoEfn1QM77liYW8efZEF8Yp2artNq8RFWB5Z3/gg3G/pwl7FoxG/TI6G6vfXZEiEdC9k
         1Edw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=MtStEl1Iuz0J/tzNrTPPgVDlQMwweqDZ+fQtAYmhbZQ=;
        fh=0IGiA4am11hlE3rG4aZff4kfWwMlx9Sb3Q18ctqEL7o=;
        b=jlgf2eXJ+mfQu14MlpuASyxSK8erxDz3DbqaNxzb1jJq3mZQJqjITxrho348FqUYf/
         emPKpvWA9WBjoRGRLofbVF4T2++5L4BA0RKRYYXknxY8CafwliKyYwyGuMm+CL/JvE/1
         mmSijX0nUF164ztZda7DGxoCwgi7HGUTKsAeoDdKH4NeWSYdk0fyn7oYyeiyCKHmTU49
         B4mvuZJiGLjlsWtnwb1GhzDTw16WPNCbvKCAGa92q11VCKuqPml1ByUa0qclE3M296+6
         R0PHpiM0y+76lRlPqe//BN+WyjbF+ui3MEdrHUwuxhTt15jrgDGTkPzjatMR1ZceZtv0
         D9eA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fgsCdnFm;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k190-20020a636fc7000000b005b872cec1b2sor498247pgc.0.2023.11.06.19.52.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 06 Nov 2023 19:52:47 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fgsCdnFm;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699329167; x=1699933967; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MtStEl1Iuz0J/tzNrTPPgVDlQMwweqDZ+fQtAYmhbZQ=;
        b=fgsCdnFmk7hhBH/t6CLA4g9rguYMWCatebRvD92QkJF5vblFyJzTO1szVG1OwTch4V
         yS9GPqS+Fq2n3lxNOPk7Ch5Cb6xXoQxe7eWue2a0ekKS1jcQnQZD+kQVQA5mSShlMxvu
         37YyYVpHzKyG/yHB+JiJiMEXEA3cYPLM3/kTMq3xA4eK0tSHM0GDSSzjxZ22T/ANsxSn
         JucmQaDcu8qywse3KqrHQDNHSh0/utsowcKSf27YdsE0L7XuRKzozeTj1WGH/X9AGT20
         OXKpApHjscferISes6G1vhZwP9NMsXEmPRUAz/IDyexWNFAfsexeJDnC1zTG7xRh/sgm
         SSVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699329167; x=1699933967;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MtStEl1Iuz0J/tzNrTPPgVDlQMwweqDZ+fQtAYmhbZQ=;
        b=MO3K95eMeZwYHt8is1KwtuDFDzqQiRkQzpDzNIDzEDsjik57XYKeLCDR9AOfNcTgUY
         mlw/DFdHJuU0+OvTv2Oc9pvk6XMhQBzeILLbpS4lCSOGN2S6CpAnIZrlgcSGuGlwS6Cu
         motIrVZ3YvZgu7MC6pKV0NY2PoqxwAfcHBBVzsOeI0d3UseLQ2hJG1K40hPOuWoVnbcH
         WSGtFZTzWaqKGJrwcpB+SL5Qx+CMOVLQcycLGLoRNrdRE9yNzeCQCK4tMIG12AEDuiim
         viJAl43cDjArR/YSl4avlkqUUcghvgzGE24rIHm89vsd8jgVwtbi4sW6e9Syh9GpyhLe
         2fKg==
X-Gm-Message-State: AOJu0YzVI08oOg4OWkDLSYJ3wl6cqxN5qqhwSWuhGYOevhobpOoJ/l60
	tQK21+E8/yGszAkvUTseWeIWXsI5JY3x72362+R1Sw==
X-Google-Smtp-Source: AGHT+IEKbiF0guNoYz/HRV65i+vKEdt4OM7H3XRFHjBS6tcHG0zq757euTnegCrI6KHpS5abRvQy6w==
X-Received: by 2002:a05:6a21:7185:b0:180:def9:20e1 with SMTP id wq5-20020a056a21718500b00180def920e1mr29010531pzb.22.1699329166799;
        Mon, 06 Nov 2023 19:52:46 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] ([71.212.149.95])
        by smtp.gmail.com with ESMTPSA id x11-20020a170902ea8b00b001c57aac6e5esm6584517plb.23.2023.11.06.19.52.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Nov 2023 19:52:46 -0800 (PST)
Message-ID: <941e40a0-b235-4c31-8e0d-6a1ac868e72a@linaro.org>
Date: Mon, 6 Nov 2023 19:52:44 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/22] target/arm: hide the 32bit version of PAR from
 gdbstub
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Peter Maydell <peter.maydell@linaro.org>
References: <20231106185112.2755262-1-alex.bennee@linaro.org>
 <20231106185112.2755262-4-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231106185112.2755262-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: eCHJhnWkc+Dz

On 11/6/23 10:50, Alex Bennée wrote:
> This is a slightly hacky way to avoid duplicate PAR's in the system
> register XML we send to gdb which causes an alias. However the other
> alternative would be to post process ARMCPRegInfo once all registers
> have been defined looking for textual duplicates. And that seems like
> overkill.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20231103195956.1998255-4-alex.bennee@linaro.org>
> ---
>   target/arm/helper.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 5dc0d20a84..104f9378b4 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -3727,7 +3727,7 @@ static const ARMCPRegInfo vapa_cp_reginfo[] = {
>         .access = PL1_RW, .resetvalue = 0,
>         .bank_fieldoffsets = { offsetoflow32(CPUARMState, cp15.par_s),
>                                offsetoflow32(CPUARMState, cp15.par_ns) },
> -      .writefn = par_write },
> +      .writefn = par_write, .type = ARM_CP_NO_GDB },
>   #ifndef CONFIG_USER_ONLY
>       /* This underdecoding is safe because the reginfo is NO_RAW. */
>       { .name = "ATS", .cp = 15, .crn = 7, .crm = 8, .opc1 = 0, .opc2 = CP_ANY,

If the implementation includes LPAE, this is an alias of the full 64-bit register (the 
"other PAR", and so type should contain ARM_CP_ALIAS.

If the implementation does not include LPAE, this should not be ARM_CP_NO_GDB because 
there is no 64-bit alternate.


r~
