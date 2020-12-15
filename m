Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3447204lfq;
        Tue, 15 Dec 2020 04:26:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz+AgEDStt/X58VZ7xguKTrD1XNn4sRqP/qMUqWpp68Kh7SaIaICT3VXpDPX2dD2wX/V7tF
X-Received: by 2002:a25:75d6:: with SMTP id q205mr26548028ybc.383.1608035161419;
        Tue, 15 Dec 2020 04:26:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608035161; cv=none;
        d=google.com; s=arc-20160816;
        b=w5WgP/d4lrfj9d+InxJAvTf03QB0UWVC65toGp5zOT8w4Ox3FczZtOyYSP3/ZWE8iE
         5AkiwkC5dZVhsYu0bISeR6tFArZvqMZfg1xftxN1CfTuAsB/hAPaNHRhGm4YKdYYeZcu
         tNpyu5QiBUv/T2sSld3F58FWN1jp+ulhyW2lXMVfgGwS5w3p6NZWj6MG2/qiDZwIlga+
         Py1kOPLmdDU+Xxi4467u7uh+rhcfdr3IP7h+oJQmqAGU53CkRTx5Ff09rRipERUrj59I
         UDkCqFnhHqt5d4rA0pMed0koAMuEBfHyI/9/QdsZeqF6wPTKETNBZLRip0uhg2G4qlNh
         oSsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oIAn7TCQOJd4p+Rj0/rF8caD+uzLdYdGPIQVtFyq424=;
        b=cWkAgQBvL+Fz1uQvGo0BjqUEB1rPbEDVHP1X+TnfMEuHvnZgfI90TLdiM+PCn+lQFc
         m3Cfmb+nDUdgEhoN/2ERHhLhZzcBzjoUji/avx/SkZAQfMF0I7uM0SaEzEUP8j50VNpn
         gqiWGO21/piEE6Czigp2U2CuwNkOMY2Bj1wNrOMnrx13IGCCmM/zH9xkpUMcHSfWhdtU
         MkgFZOZgyT+Lds1PrbQ4ZCqfTedbW1gzwOkE4ZpA0oVNkmVMR/piM6ZAQlKxumm5NQi9
         E0PgvyQwtUwu7+3Gr1rJ6V1XP23p8XNlcLAbjkJYbjEYHh04J4LqZC0jkikBgY26XuU3
         w9UQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="Mm+wDI/R";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p187si19526337yba.163.2020.12.15.04.26.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Dec 2020 04:26:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="Mm+wDI/R";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:50516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kp9Oy-0004QU-Oo
	for alex.bennee@linaro.org; Tue, 15 Dec 2020 07:26:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent.desnogues@gmail.com>)
 id 1kp9Oa-0004Oq-Hp; Tue, 15 Dec 2020 07:25:36 -0500
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144]:42094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <laurent.desnogues@gmail.com>)
 id 1kp9OK-0004sa-77; Tue, 15 Dec 2020 07:25:36 -0500
Received: by mail-il1-x144.google.com with SMTP id 2so19005570ilg.9;
 Tue, 15 Dec 2020 04:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oIAn7TCQOJd4p+Rj0/rF8caD+uzLdYdGPIQVtFyq424=;
 b=Mm+wDI/RSWBpUd/dOT3nlVxdkmc+ZQ1pRnj3lalFRpockUY2tZDSYOEqfZrrlDEA+J
 R5quHGi5UmHuI4zKKasVrYE6T6/nCZuis8xCe7LI1a1SL0078XoOg03e9EELQWtXlSSd
 Ba220GEf+0wjLs/qbJImeZtM5IxGcbxNvp2YJD+lDJXC7zeqZAVdIltAHc+P7cK0Uv38
 FmYBmM3J4cx994e0JU4kXrwsPtqHALAGswJ3iZvThE+pp0EaRh/gPqBo88jRVSdbEydP
 McHMHiiX35Z7U239h1XRJxvBs9t3HVXbx/vrAAoVj0viPc7/pqKOt6HLuRckBeZLyLgT
 xdyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oIAn7TCQOJd4p+Rj0/rF8caD+uzLdYdGPIQVtFyq424=;
 b=gf8nVk12VEgqlP/mIrrJP/iqRqrH3BmIH3xDN/6TbU8fzoQfiDk8QGNsnYj0rRJPTy
 skRwsHhwYAKYqRCtI0+0rxVaO2B1ckNOLGMtPyh8qMKY7sliArkWDF7I56QdOMQEQ/MY
 orU2Gy/IpPfF66vXW0zoiMwhfvN4F0zpY8obQVaOJvMRTeesl1PqSKLghFJMhsxksjxF
 I0IX0wF/mU0x+QScpeD+4Bm5foIqzTkuEjlOhMCHLUkzBhoqeLO2dTNClAGZK9bSSlht
 NpCRc2rdAOo/59sn2WwhfQ7LiEE8/aS8BL+x71lo62e2jKlXZdiUynJDVIVT4RvO1WHI
 kcPg==
X-Gm-Message-State: AOAM532hM4aD6iDYdyPb0+40xElSwUMk0+DYldDMl+/ND1Tg/93Jie3r
 /JpQ0o+GMn/sFdNa52jeaveZSF+awkBt9/rjQAZBehLeSzGAIw==
X-Received: by 2002:a92:b510:: with SMTP id f16mr40766476ile.22.1608035117652; 
 Tue, 15 Dec 2020 04:25:17 -0800 (PST)
MIME-Version: 1.0
References: <20201215114828.18076-1-leif@nuviainc.com>
 <20201215114828.18076-2-leif@nuviainc.com>
In-Reply-To: <20201215114828.18076-2-leif@nuviainc.com>
From: Laurent Desnogues <laurent.desnogues@gmail.com>
Date: Tue, 15 Dec 2020 13:25:07 +0100
Message-ID: <CABoDooMxYZN52KekxL1zxywqiXK4B2zhRGyuqdj6vppqLQa5fA@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] target/arm: fix typo in cpu.h ID_AA64PFR1 field
 name
To: Leif Lindholm <leif@nuviainc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::144;
 envelope-from=laurent.desnogues@gmail.com; helo=mail-il1-x144.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 T_SPF_HELO_TEMPERROR=0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6/2D3+MxEAZa

On Tue, Dec 15, 2020 at 12:51 PM Leif Lindholm <leif@nuviainc.com> wrote:
>
> SBSS -> SSBS
>
> Signed-off-by: Leif Lindholm <leif@nuviainc.com>

Reviewed-by: Laurent Desnogues <laurent.desnogues@gmail.com>

Thanks,

Laurent

> ---
>  target/arm/cpu.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 7e6c881a7e..5e3cf77ec7 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1883,7 +1883,7 @@ FIELD(ID_AA64PFR0, RAS, 28, 4)
>  FIELD(ID_AA64PFR0, SVE, 32, 4)
>
>  FIELD(ID_AA64PFR1, BT, 0, 4)
> -FIELD(ID_AA64PFR1, SBSS, 4, 4)
> +FIELD(ID_AA64PFR1, SSBS, 4, 4)
>  FIELD(ID_AA64PFR1, MTE, 8, 4)
>  FIELD(ID_AA64PFR1, RAS_FRAC, 12, 4)
>
> --
> 2.20.1
>
>
