Received: by 2002:a17:907:60c:b0:a6f:8e2c:4d9d with SMTP id wp12csp1323914ejb;
        Wed, 19 Jun 2024 04:08:17 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWL4bYGxal78VEgZIRteJpiRuhT9Euv6PVucjkVPJaZ1XBqBs4NQ27nrVOYo3eUjV83TnV66yEXb5/nkB8kCnCd1oJjnsu5
X-Google-Smtp-Source: AGHT+IH3UsFv2h1CLSV20eej5a8EWoUiSxJ8ARtAumvl0gh+TKpF+Mk7a/wljiG703kL/OwkxL7F
X-Received: by 2002:a05:622a:4b0f:b0:444:b132:bd8d with SMTP id d75a77b69052e-444b132be9emr3697911cf.49.1718795297155;
        Wed, 19 Jun 2024 04:08:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718795297; cv=none;
        d=google.com; s=arc-20160816;
        b=h2eCJ8wNco8Of/WUj41NF7ci8Mv7uK6hrAOv3piulGxeihOtuIjIHodGtPeXYjEY3w
         wYn3c4tj+A35rX1OAu96RVx+Z7xOIICrVoNgziv4fyUZ2cZXH8962Pe6WX1MUgyN3HmQ
         ixiZ2HNJ12jBOkSV6zoWG1v7n2Z5fZBxShZFJ/Tzz70S9Tc4r7ZBCR6SYzoCZbwjzcPv
         ZXr0JCQ5/Im9fcycXm8ufQ5ey/iN9a1LG3KLE081y5gOvyQZm4IXbe30xq63Z7GAZ8aT
         NT1uaTXDdnDEZRZjvieBrckEmervle89SjOOtXIgtHdf2b5pGqiCIjIAj4t/ByZfNB3F
         K7wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=FQtYhlDbANKAafkDXec+KSnQ3Vof1TGRu3LR91CGins=;
        fh=BhnLEJEq6ajk2BkWltYMAeoxl97MV2RE5lxrEpFIdUM=;
        b=xiNUJMti0JKQq8TdsrsrYPVZrA4Fd/tXEnWjXBlYfEITmMp9tf9XaFYTeN222EgeIY
         +SpXONNLBKwmevmEZKdFwe6kCTX5F6g+uZXA5vHkoqHRcbcu9gesq5lgCiQYxq4z6tuj
         t6DBoFKHsQNYH0Nl8EQK7VLTVw2axrruhWKFQ9cCQik1sVy8+hRg3Byy5wrwSLQAQPM7
         gNRx7NUNlis23zP3Oh1B59ONWAy+OHU3UrwCJXoBxMABaNVbKKPL/GaFrHDk2/PQQeH+
         ZnnxjWQvoEJdD061CbaOWhM2ePNqHhuy7kzAlbrJiXg6A/AWK+3NEtQN0A8XgTd+IzKI
         Fqqg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FmpcPCm6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-441f2fb757asi138882851cf.417.2024.06.19.04.08.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Jun 2024 04:08:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FmpcPCm6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sJtAQ-0000zp-Cg; Wed, 19 Jun 2024 07:07:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sJtAP-0000yb-14
 for qemu-arm@nongnu.org; Wed, 19 Jun 2024 07:07:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sJtAL-00067Z-RP
 for qemu-arm@nongnu.org; Wed, 19 Jun 2024 07:07:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718795268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FQtYhlDbANKAafkDXec+KSnQ3Vof1TGRu3LR91CGins=;
 b=FmpcPCm6zXxWwhoLwyQTO/a3sLndgN3HruNwn0VLPPxY+Sxea+Em9tteEtxpq+IRY8xpep
 hWDWROASub4gZnxUWcUR+8M4ZvG2yuJAqYfwJRV5OFjToqOQyPCnbiCdrkZGCod+p8oiv5
 lnzJjmEV0o+s0PEphsT5kWfa41I68j8=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-56-q-a9i563PZuvEZe-w11usw-1; Wed, 19 Jun 2024 07:07:47 -0400
X-MC-Unique: q-a9i563PZuvEZe-w11usw-1
Received: by mail-lj1-f200.google.com with SMTP id
 38308e7fff4ca-2eaec29f8e3so50557791fa.1
 for <qemu-arm@nongnu.org>; Wed, 19 Jun 2024 04:07:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718795265; x=1719400065;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FQtYhlDbANKAafkDXec+KSnQ3Vof1TGRu3LR91CGins=;
 b=qC+/QAgeGoeF3xoUx8ZipvU2tuSX7cyowd+qPcdgsMrurFHjzA7nUf/F0WMoFe200t
 xCv5qtIbqUswdWAFXploFBJLMhP6LBwfILD7V0Pnn4SxGoqTFah4INVp3M1D/LH1e5U6
 gPmUbfUVfK46LA9wk0dFRl2ACwLYnq3ufSw4z/joN4372v7pNYFZgLnVGWuy7DmWowG5
 sdDw7UpdZcG5HwZ6vIzKJfPKJnGWU5YN53ButtrGiMLfkGHru4PxunHq6kTt8YnsbYfD
 rYnt1O6WcIka+yrbAykeXnF8L5OyoqAeaxN/fncqWlXRm5er/zE8/wi9bpKfuUQw91WU
 PzsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8byh4UDM8wk+iXHqlZiI+jPvjpMHEzEM6scQzvwvjYcJC0RGJAauH9DYbFXTkziZ9+/Q3quwz/R5OtyuQpvD4AocP
X-Gm-Message-State: AOJu0YztTn/aPWu0VUh39oKNkq/v7jHlywoFLOBelozIQQ/o0BFyeuML
 qtvjhkYeLxw33QmrGn3MYU/Gf8Ppdy9Tn4Ph39vN8sWYF80NTgv5z66sX+NEtkAU3ARfIZYREJy
 WLpiNQzT00DtHItLQpgE3tDe5UF/9ve7/8cHvRnpQcDq4POJzxg==
X-Received: by 2002:a2e:a26c:0:b0:2ec:3daa:f0af with SMTP id
 38308e7fff4ca-2ec3daaf202mr11367321fa.12.1718795265562; 
 Wed, 19 Jun 2024 04:07:45 -0700 (PDT)
X-Received: by 2002:a2e:a26c:0:b0:2ec:3daa:f0af with SMTP id
 38308e7fff4ca-2ec3daaf202mr11367001fa.12.1718795265125; 
 Wed, 19 Jun 2024 04:07:45 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42286fe92c6sm262983865e9.18.2024.06.19.04.07.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jun 2024 04:07:44 -0700 (PDT)
Date: Wed, 19 Jun 2024 13:07:42 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, Paolo
 Bonzini <pbonzini@redhat.com>, =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau
 <marcandre.lureau@redhat.com>, "Daniel P . =?UTF-8?B?QmVycmFuZ8Op?="
 <berrange@redhat.com>, Thomas Huth <thuth@redhat.com>, Philippe
 =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>, "Michael S . Tsirkin"
 <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, Alistair Francis
 <alistair23@gmail.com>, Sia Jee Heng <jeeheng.sia@starfivetech.com>, Haibo1
 Xu <haibo1.xu@intel.com>, Anup Patel <apatel@ventanamicro.com>, Andrew
 Jones <ajones@ventanamicro.com>, Daniel Henrique Barboza
 <dbarboza@ventanamicro.com>, Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>, Weiwei
 Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: Re: [PATCH v2 12/12] tests/qtest/bios-tables-test: Add expected
 ACPI data files for RISC-V
Message-ID: <20240619130742.69c635ed@imammedo.users.ipa.redhat.com>
In-Reply-To: <20240524061411.341599-13-sunilvl@ventanamicro.com>
References: <20240524061411.341599-1-sunilvl@ventanamicro.com>
 <20240524061411.341599-13-sunilvl@ventanamicro.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.42; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.144,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: 5siybO6SFK7B

On Fri, 24 May 2024 11:44:11 +0530
Sunil V L <sunilvl@ventanamicro.com> wrote:

> As per the step 5 in the process documented in bios-tables-test.c,
> generate the expected ACPI AML data files for RISC-V using the
> rebuild-expected-aml.sh script and update the
> bios-tables-test-allowed-diff.h.
> 
> These are all new files being added for the first time. Hence, iASL diff
> output is not added.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>

Acked-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  tests/data/acpi/virt/riscv64/APIC           | Bin 0 -> 116 bytes
>  tests/data/acpi/virt/riscv64/DSDT           | Bin 0 -> 3518 bytes
>  tests/data/acpi/virt/riscv64/FACP           | Bin 0 -> 276 bytes
>  tests/data/acpi/virt/riscv64/MCFG           | Bin 0 -> 60 bytes
>  tests/data/acpi/virt/riscv64/RHCT           | Bin 0 -> 314 bytes
>  tests/data/acpi/virt/riscv64/SPCR           | Bin 0 -> 80 bytes
>  tests/qtest/bios-tables-test-allowed-diff.h |   6 ------
>  7 files changed, 6 deletions(-)
> 
> diff --git a/tests/data/acpi/virt/riscv64/APIC b/tests/data/acpi/virt/riscv64/APIC
> index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..66a25dfd2d6ea2b607c024722b2eab95873a01e9 100644
> GIT binary patch
> literal 116
> zcmZ<^@N_O=U|?X|;^gn_5v<@85#X!<1dKp25F13pfP@Mo12P{Zj?R|`s)2!c7=s}J
> I#NvT*0o0BN0RR91
> 
> literal 0
> HcmV?d00001
> 
> diff --git a/tests/data/acpi/virt/riscv64/DSDT b/tests/data/acpi/virt/riscv64/DSDT
> index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..0fb2d5e0e389541209b765d5092d0706f40298f6 100644
> GIT binary patch
> literal 3518
> zcmZvf%WvaU6vnR;w@IBxlQexl(t(j!ppl%0(ryq<oOYV3X-%9`q=14{b;M9K6c~^O
> zgcx<fqhd2ti4B_~D)B!c1W2sdvE#L7!#}_>eCJ*}oI`D?w!iChKA+$9t$orAn%(bn
> zN+n)t?0eh6a^of6TgGN7rRbcFh1Tyc_k%{iceZVNuIr}z+pT7<?)fc<HI?okw3^tr
> z>)qm0&dr&dmZB`a{a^Ra*0&D5Eo1b;X8Qm}E3gQ<btjYVdtTkbz7rISPX6ODvMUs3
> zVE91w&KfCiza7@#@A>YkTOF1_DRa)WNl^t#{A^TNmZNji{btZCtt5&QPNDqU;E!+b  
> zecnEQ^xc;~?0jvN=B?69B6sx0n@1<N?!0~c*1N~|jvlD2+E~Xu>-LMCh<kUhvyXCD
> z|GVk1+UV8=+`16nn$W3iZBaGE(t=R0Su8V)L_|(iti)M3i8v3Jc_g_<E!HC$=dr;&
> zZ0_+)tcM-v;WLjB?y(x{F%swTD)SiS9?!;ljK+DKGLIDZSc~;Y#d$nr9_i3y=NsQ^
> zu@zZ&*ReP}{EyK3th+T@*_*eqZ#4FX%O>b{iWO(USDtFAW3{YY{55g*p1P}!a8zWX
> z7lz;IPVBzpJS=7G%wV8y2Q62ba|`EHRm#%1lYm%>L=vK=N;x|_7+?*WxKL3R0`umY
> z&O>M<DHHxW7E8~>hKe$y(1g;N2-TU8l!<C|EEb%J4HacZp-Gd8P@M@$nW#v|VwsuP  
> zP=$;-)Haz>@sOMoiwl`i1tW@cj+o4-cu3BPCB-VhD+4MD9hIDroD&Pl#Oi8OIy2%-
> zNlr-4iRFXLXr|LTGn$gL<b>p$V}cX!M^n3=p)tt`$vN>NG_kr`M{qil6Owag1ZPHY
> zW+W#h=gbPutl-Q_PDsv)?-Htwo@Y*Q<|HR1=gbSvyx`1BPDsu<E;z>p=eXpA<eYfp
> zv*(GAkEvZhm4f7i<eWvpSrnW_$qC6hOM<f`I7^Zfl5<W7&I!ReAvqyAXIXHT1!q}u
> zLUPVY!8s{7CnYB&=bRFpQ-X6!azb*>X~8)yIHx5iB<DoK!Jg-g;GB`1keqW?aLx+O
> zS;+~>Ip+lDoZy_3oRFMzUU1F}&UwiR$vGDU=Yrr|kera5b5U?E3eH8z3CTH^1m}|A  
> zT#}rSoU<Z0D}u8kIUx;a@2q9hqcop+`Y3zu*6>5@qiM`L8Qmx@>rXnqyVu6bqy3;0
> zSfN$e$O$X-aop-gjFlN1TJ2C(VM8aZsGs9rPsDhcG3gaHcG3%d9rt=N#><R_Ugd1x
> zYt+>h-rEXOMpLn!a_)bcQwbVUYCt>d6Z~go(OKwiV=x$e6rJOWm8FJLZ)jL(gSOQ9  
> z(=101Q%{N90rg{iGreXyIPiUy_PU*2Ro)uw?+2cJexkhQVfAu5b@3W?^1b$-wSOuL
> z8($pWumAYmuXoN*92)^EIHqx|osu9QI;oM>2efl4w7)DozPM|Bh$~ecUA>%od=bT&  
> z;R0PerC=JrI{7MZ#_1;2tCR9A{Hkc%mp4o`zpVZISFrki`_c5@?b)Ba_T|{c>*}hQ  
> pv@F`;cR<_jYzAT_(hnb+<eKANn;)0v1k>|8pBtRxTSGr9{slF`>K_0A
> 
> literal 0
> HcmV?d00001
> 
> diff --git a/tests/data/acpi/virt/riscv64/FACP b/tests/data/acpi/virt/riscv64/FACP
> index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..a5276b65ea8ce46cc9b40d96d98f0669c9089ed4 100644
> GIT binary patch
> literal 276
> zcmZ>BbPf<<WME(ucJg=j2v%^42yj*a0-z8Bhz+8t3k1-OV?`GjD1M-;Zz#xa0OIBc  
> A0RR91
> 
> literal 0
> HcmV?d00001
> 
> diff --git a/tests/data/acpi/virt/riscv64/MCFG b/tests/data/acpi/virt/riscv64/MCFG
> index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..37eb923a9320f5573c0c2cdb90bd98409cc7eb6f 100644
> GIT binary patch
> literal 60
> rcmeZuc5}C3U|?Y6aq@Te2v%^42yj*a0!E-1hz+8VfB}^KA4CHH3`GY4
> 
> literal 0
> HcmV?d00001
> 
> diff --git a/tests/data/acpi/virt/riscv64/RHCT b/tests/data/acpi/virt/riscv64/RHCT
> index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..beaa961bbf0f0486c0dee25f543377c928354f84 100644
> GIT binary patch
> literal 314
> zcmXAlu}%Xq42FGxD#XNyI`tt=C&buWx`A2-wkXNvbP-K1O46&8iKjrk6)SI3ey5h~
> z@3-SPa`wCa{iPvl)b_RC9X8vKw|)adiC8n)zP^7d?+~A>`lE(^DK1@Wog4=(iq&1K
> z7;1J`gewX|OE=3Z>{xM3wM)ljIQKa+635YaZ7jrOeGc+eJEnks*|jl=GEUBVQ8WhX  
> zK@<flJgso_nMF!k2aE&flg}m^e@2oQd6bm~m(n5!gJ?a<U{EgOALs#2D_Y&qJuA9g
> Pp1|9>GjINg;u`)Bd);9H  
> 
> literal 0
> HcmV?d00001
> 
> diff --git a/tests/data/acpi/virt/riscv64/SPCR b/tests/data/acpi/virt/riscv64/SPCR
> index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..4da9daf65f71a13ac2b488d4e9728f194b569a43 100644
> GIT binary patch
> literal 80
> zcmWFza1IJ!U|?X{>E!S15v<@85#X!<1dKp25F12;fdT`FDF9*%FmM4$c8~z`e;@#f  
> G!2kgKJqrN<
> 
> literal 0
> HcmV?d00001
> 
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index d8610c8d72..dfb8523c8b 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1,7 +1 @@
>  /* List of comma-separated changed AML files to ignore */
> -"tests/data/acpi/virt/riscv64/APIC",
> -"tests/data/acpi/virt/riscv64/DSDT",
> -"tests/data/acpi/virt/riscv64/FACP",
> -"tests/data/acpi/virt/riscv64/MCFG",
> -"tests/data/acpi/virt/riscv64/RHCT",
> -"tests/data/acpi/virt/riscv64/SPCR",

