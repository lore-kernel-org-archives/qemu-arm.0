Received: by 2002:a17:906:4a55:b0:9d0:bf65:29fa with SMTP id a21csp240809ejv;
        Tue, 7 Nov 2023 03:22:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHLLb62ZSuGKOF04dyHZAl+iOW2RffCpWIu5shFsv8DrvShA8NXOjdJNFR1n5cYPPRyGC8U
X-Received: by 2002:a81:4e13:0:b0:5a8:d86b:7469 with SMTP id c19-20020a814e13000000b005a8d86b7469mr14746169ywb.8.1699356134228;
        Tue, 07 Nov 2023 03:22:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699356134; cv=none;
        d=google.com; s=arc-20160816;
        b=k7zmxtJk2L/VOgZD+78TYJFx6ax3rphXncs16tgeNTs6z6Iypvaj8wZ1IqeE2Izl8f
         7itIqCrImjkIXbt7lv2MVmuunBenoD37iJgoK9jPYYEh/fZkbx32y57By4OfOvHv5LoS
         X0DZ122/RjtHyW/vewNkxNhM/81S+CgWzE5spMHc4/PCifbZAFnfemp5/HtlcDFMjCWO
         AmRkNL5u1rLfEWKpHQ64nsDPQb5s1Xoq9D5q7FPOGQg9oZoEQ5QYTVyMbMnlR+lVT5Wt
         VJwDZuk7UTsa6RUo98wjYMss7ql8hd3WSvdvYVH+3/23xznjSfWToadgjjKjtdwplhG9
         ZAJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=NHgkZlKlE2QznWzNPrPJrsZvkIQBijBjKSAPLZvKlJk=;
        fh=6hblrBvBi7rG1faX3zh9xMJSpVgzaTtBBn4+gASQ0lc=;
        b=qX8ptYqQCpbGK457sHpJGEeT1QUOGmJo/Ly870DCmqEqbbkveUT00/mHZDVvFIGFUS
         +wAMi/fTdjjjrRSk0vUfxKekfuU4IfF6QrIZ5ywskYPawlgyDqk0I3EWdQ2r6rrhugeZ
         4B2wFES4rKOm6JxHgvgalU5PzzhGEZ5+trfGX9c/1fckPbqMXMngC9nsabq8A1UsLeax
         Qpj2PjRdYtIECkjdWMIgVU352FpFj+6+P1dnrhtvomgdx+p0EphqE/VQvctUVVFaukhR
         /CEHwfRi2+F16LY1rCameExSOk+ABuElT0biCEijSrMx5GvBJsJb9tiGutGejdyexP+u
         ykxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JG+u0gHx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t1-20020ad45bc1000000b0066d296fd731si7620397qvt.113.2023.11.07.03.22.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Nov 2023 03:22:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JG+u0gHx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r0K9l-000575-B0; Tue, 07 Nov 2023 06:22:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r0K9b-00052V-7v
 for qemu-arm@nongnu.org; Tue, 07 Nov 2023 06:21:57 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r0K9Z-0007kU-0k
 for qemu-arm@nongnu.org; Tue, 07 Nov 2023 06:21:54 -0500
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-9e213f198dfso109261066b.2
 for <qemu-arm@nongnu.org>; Tue, 07 Nov 2023 03:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699356110; x=1699960910; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NHgkZlKlE2QznWzNPrPJrsZvkIQBijBjKSAPLZvKlJk=;
 b=JG+u0gHxGP8yUBJ3ixLiZ83zux2AzTas/wuYBjSEvtIZZJBMM2VEwu980H+l4eqDj6
 zaO5/79a4iaabbrN70tVoojzh/QJONfx9IEamnCgIOW5DBwxqudEgjro+i8tgdakoafn
 QTuRc6bVa7PoBu1gUea28g/qFwgflEeo0LCSE6SY0LsSLnB7dXZmSyQSeO8w1Dt623Bi
 0bfz4f0TIQlO4BzldRzZKon+6DaJG19+epL4hhzdOUIAaqcPfdiWJNACP1P/zNpMh1LR
 Frs97pkAJcH6VtjNMXkpqRVfoxB32pYtT5dQls08RoYYXyAEVQ9EH1/iG1TjJjFkiTk6
 roQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699356110; x=1699960910;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NHgkZlKlE2QznWzNPrPJrsZvkIQBijBjKSAPLZvKlJk=;
 b=t/2KA4NbXI0jyz0UzSI8DMwgFjhbf5GU6+NouLxTQZjM15MRVGvnXm3Ic2EEjvman4
 q5V0tpBirVtYpES33xFQXR+MJgaYr0I3wjcW8T2Pyxnl2zVdW8/DhzxOAznvv5UDHEWT
 gV6/eCeO2QLCK1oqEYrML7Tm13RpwofzEmJ/VD7kUVEH9Ed7bGGCgjm/A5CmtJTsrIKg
 MMy08yKDxbTImHr/Gk7Uv6Dx6cv+L3ioFiWaeHfNGYmj0WZYa5ZtlQTHygjNVMJGgXAD
 6P3ahaMJoU58B6oez6Zb7EPl5yMBo3JiVs26dwr0Lvmv3VaPb+UOkuMLKZdokoQ/NLFL
 raBQ==
X-Gm-Message-State: AOJu0YzFr80dTcHf6ym74/Zx5WmO3UPeUeabuxWgmoQ0on10cHXZrue+
 TwC0PMqtS3IGjMn/Sl93Wf41tA==
X-Received: by 2002:a17:907:9726:b0:9de:725:927 with SMTP id
 jg38-20020a170907972600b009de07250927mr9331223ejc.76.1699356109986; 
 Tue, 07 Nov 2023 03:21:49 -0800 (PST)
Received: from [192.168.69.115] ([176.187.216.69])
 by smtp.gmail.com with ESMTPSA id
 i11-20020a170906a28b00b0098669cc16b2sm920338ejz.83.2023.11.07.03.21.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Nov 2023 03:21:49 -0800 (PST)
Message-ID: <d6afb794-41ca-4bc9-a7cb-3970cd91de24@linaro.org>
Date: Tue, 7 Nov 2023 12:21:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] MAINTAINERS: Add include/hw/input/pl050.h to the
 PrimeCell/CMSDK section
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20231020060936.524988-1-thuth@redhat.com>
 <20231020060936.524988-2-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231020060936.524988-2-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: n71h900cXJ9U

On 20/10/23 08:09, Thomas Huth wrote:
> The corresponding pl050.c file is already listed here, so we should
> mention the header here, too.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


