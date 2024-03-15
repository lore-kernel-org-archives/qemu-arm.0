Received: by 2002:a17:906:4a0b:b0:a45:b507:d90a with SMTP id w11csp990455eju;
        Fri, 15 Mar 2024 06:11:28 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUFpk85O8Dxh5d/a3/ORYkKUmUXlJ9CA8NVitoOKSVn5TbWESE6Y5Nsz/KknMAOoFz6cCm4KMuH4d21R4kzUDKNHy+igXHC
X-Google-Smtp-Source: AGHT+IH8/Gt+1xhx0LKjjyYSAQ9Ux1ErBFzS4koRhJXpg/jcjS/mVBg6477iS5jP3UiztTyN8cgw
X-Received: by 2002:a05:622a:11c2:b0:42e:f863:a6ec with SMTP id n2-20020a05622a11c200b0042ef863a6ecmr4351045qtk.20.1710508288561;
        Fri, 15 Mar 2024 06:11:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710508288; cv=none;
        d=google.com; s=arc-20160816;
        b=uaHFusA3Anj0jt5FDjtR2KBcT8ph1gphg+t5Vv6U7IHa60a1Csh03aglSrJg4OSwsD
         C9VVHIZpeiSFnie2PRkzs6UBHq8PKsvsR94Zep6TvHeJMeJbSEWfdFGqUrLUlQRbuDxl
         rLIxks9EZ2GoQ13IgmyxruDUSSRJy9kzxSONKZv2m9Hy6RU7tqSrLkgH86lK3M9ZzB4I
         4q/MCy/4NJEQ3WxPsG1SPP38tbn5vZK2pXQbnAbyO8oePr/9uGDHja7R5/qyevZcn6iL
         bENEdRlSw09ZJkiXTWT1XPiFfOIl4d1vWzon16s8zAHG+WkGjsyBMBc+XVbF7bJTDeu/
         ug2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=KQl+6L0VcZgA50SWnKjH1hfXBn+0RZFkMJcMmqNHbzY=;
        fh=+wkaoswtNQBj99FKi/45qOloBxHFNVcoC6MkOm/EmFc=;
        b=JFW4lsd3Hw+Lf0BMm1j4cBSJiPfbD8SsPABMEIn8lsn2lKhTvVlOWhZ1SP9/6WT1Ug
         cmrxC1kGfoyuNuh4R8v+tSS8K6omEoJg9XUZgFfSMGJQC6nizNLD2cP15D7LywC7yOYT
         IMCO9GmvYaIiSRzqzga7kZGLP6x1iua4P2mGZatUpUo2MN+Mu/3yWd26ViQNowra4Kup
         HX3JuERiYuvB2n6JMxZNeyuzOFCrUWd9pbhtUxMtd7A2IcY1agE7t9NYjeOiAynQ5+co
         foDQcoXWNyZTPXdkOskG1yDcY3uBiy/+qHMj5XK6k1Qu3fPk6zseeAb2Fb8O54W8s8zl
         9GQA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=bGhwBJU3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q12-20020a05622a04cc00b0042eef656654si3716622qtx.724.2024.03.15.06.11.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Mar 2024 06:11:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=bGhwBJU3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rl7LC-0000sp-Dv; Fri, 15 Mar 2024 09:11:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1rl7KQ-00072J-SL
 for qemu-arm@nongnu.org; Fri, 15 Mar 2024 09:10:31 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1rl7KF-0007yh-3j
 for qemu-arm@nongnu.org; Fri, 15 Mar 2024 09:10:30 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-6e6cadfffdbso1802693b3a.3
 for <qemu-arm@nongnu.org>; Fri, 15 Mar 2024 06:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1710508214; x=1711113014; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KQl+6L0VcZgA50SWnKjH1hfXBn+0RZFkMJcMmqNHbzY=;
 b=bGhwBJU39FhBORB3ee4x8oRehmigoew1trmAmy6206AE9Tc5lR+B3vGAYaMIQvpFh2
 4x/tXsbYpgw4j1c/iWF+Umni5OkvOK+RGpLa9q47NxMgKwJQVTITFKdOsJw1IyZcJiuk
 4X6elRqVqg2qc+GxXudl9DarK5PFsf2eKxXD+niUb9V0c5Vs0TN5w5jkvUW4K53L9AWP
 CgAav51tdTZ5LZTFl1MRJOPu8P3pH5w4Yor/F1x0birqDqCTAXD+TwAWKHf6FkBGisv5
 rpN49a1W+85QwV2BKEQEZDX+d5nHOVC5uxu04enDmEjRHMHuP3xGiV8xQVkNymC8iNkw
 7uzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710508214; x=1711113014;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KQl+6L0VcZgA50SWnKjH1hfXBn+0RZFkMJcMmqNHbzY=;
 b=hNJV83HvexCwr4jhVtTZbXmiET331O1/iZgCUZ3Ih+rtWsrkcIiuSKFEc8z0ttAH+G
 kqx5BIZ/rNrxh502/Qzlc4gVZB1zKetlEGBWQVm7wkespQKafobot20nXioHYEylH3ta
 nwx/CfpC6v4eL9IElOaAihXG5EgfO/iY1AAT+WJEChp8DCUwtlrozYaRVQZe+xxmt5Wa
 35NVBRxx0DaWrLO5+MjzAjKdA5wJqM3Xx94ZgCBLuR5avm0wYNvpq/5FjSjprOXZhVBB
 EfLmH0Kfsg+crRkwC/eV6BknG+zaUpPnWn0ovkWXci2uf3o4IUOfigLimb4MXEBf7KxD
 VdCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgsO7fsVLz+rSrnTnaytIpjXD6M76eE+EmqplI2NvBGOUFrq34pA1fuO44jfdQMoDYnGdsOXrsa+8CirZH0lqPzMbf
X-Gm-Message-State: AOJu0YwGfbRkuhdwaVdZUIs/WNAqmzwmfu8kR8BhffaP3JxSu4FF9d16
 694JK1Tq7fNo2/1RY7Y/1tUD45vlo77P19ww0TyJBqsqu3vLz4yVE1mfz+lkFaM=
X-Received: by 2002:a05:6a20:8f24:b0:1a3:502d:cb1 with SMTP id
 b36-20020a056a208f2400b001a3502d0cb1mr1429088pzk.1.1710508214724; 
 Fri, 15 Mar 2024 06:10:14 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.184.12])
 by smtp.gmail.com with ESMTPSA id
 r3-20020a17090ad40300b0029c68206e2bsm2886663pju.0.2024.03.15.06.10.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Mar 2024 06:10:14 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alistair Francis <alistair23@gmail.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>, Haibo1 Xu <haibo1.xu@intel.com>,
 Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH 11/12] tests/data/acpi/virt/riscv64: Add expected ACPI tables
 for RISC-V
Date: Fri, 15 Mar 2024 18:39:23 +0530
Message-Id: <20240315130924.2378849-9-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240315130924.2378849-1-sunilvl@ventanamicro.com>
References: <20240315130924.2378849-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pf1-x435.google.com
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
X-TUID: gDPIQ5YOo2AI

Add expected ACPI tables for RISC-V so that bios-table-test can be
enabled for RISC-V.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 tests/data/acpi/virt/riscv64/APIC | Bin 0 -> 116 bytes
 tests/data/acpi/virt/riscv64/BGRT | Bin 0 -> 56 bytes
 tests/data/acpi/virt/riscv64/DSDT | Bin 0 -> 3518 bytes
 tests/data/acpi/virt/riscv64/FACP | Bin 0 -> 276 bytes
 tests/data/acpi/virt/riscv64/MCFG | Bin 0 -> 60 bytes
 tests/data/acpi/virt/riscv64/RHCT | Bin 0 -> 314 bytes
 tests/data/acpi/virt/riscv64/RSDP | Bin 0 -> 36 bytes
 tests/data/acpi/virt/riscv64/SPCR | Bin 0 -> 80 bytes
 tests/data/acpi/virt/riscv64/XSDT | Bin 0 -> 84 bytes
 9 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100755 tests/data/acpi/virt/riscv64/APIC
 create mode 100755 tests/data/acpi/virt/riscv64/BGRT
 create mode 100755 tests/data/acpi/virt/riscv64/DSDT
 create mode 100755 tests/data/acpi/virt/riscv64/FACP
 create mode 100755 tests/data/acpi/virt/riscv64/MCFG
 create mode 100755 tests/data/acpi/virt/riscv64/RHCT
 create mode 100755 tests/data/acpi/virt/riscv64/RSDP
 create mode 100755 tests/data/acpi/virt/riscv64/SPCR
 create mode 100755 tests/data/acpi/virt/riscv64/XSDT

diff --git a/tests/data/acpi/virt/riscv64/APIC b/tests/data/acpi/virt/riscv64/APIC
new file mode 100755
index 0000000000000000000000000000000000000000..66a25dfd2d6ea2b607c024722b2eab95873a01e9
GIT binary patch
literal 116
zcmZ<^@N_O=U|?X|;^gn_5v<@85#X!<1dKp25F13pfP@Mo12P{Zj?R|`s)2!c7=s}J
I#NvT*0o0BN0RR91

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/virt/riscv64/BGRT b/tests/data/acpi/virt/riscv64/BGRT
new file mode 100755
index 0000000000000000000000000000000000000000..dccf14cce4063dbfe18cd8a459aaa8b206d3b3f0
GIT binary patch
literal 56
zcmZ>A4+^nhU|?XZ_Vf#J^-*wj@itNb0w$msh!zG)F#_2V3gY!3S{^7-3}gTR|5yhB

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/virt/riscv64/DSDT b/tests/data/acpi/virt/riscv64/DSDT
new file mode 100755
index 0000000000000000000000000000000000000000..0fb2d5e0e389541209b765d5092d0706f40298f6
GIT binary patch
literal 3518
zcmZvf%WvaU6vnR;w@IBxlQexl(t(j!ppl%0(ryq<oOYV3X-%9`q=14{b;M9K6c~^O
zgcx<fqhd2ti4B_~D)B!c1W2sdvE#L7!#}_>eCJ*}oI`D?w!iChKA+$9t$orAn%(bn
zN+n)t?0eh6a^of6TgGN7rRbcFh1Tyc_k%{iceZVNuIr}z+pT7<?)fc<HI?okw3^tr
z>)qm0&dr&dmZB`a{a^Ra*0&D5Eo1b;X8Qm}E3gQ<btjYVdtTkbz7rISPX6ODvMUs3
zVE91w&KfCiza7@#@A>YkTOF1_DRa)WNl^t#{A^TNmZNji{btZCtt5&QPNDqU;E!+b
zecnEQ^xc;~?0jvN=B?69B6sx0n@1<N?!0~c*1N~|jvlD2+E~Xu>-LMCh<kUhvyXCD
z|GVk1+UV8=+`16nn$W3iZBaGE(t=R0Su8V)L_|(iti)M3i8v3Jc_g_<E!HC$=dr;&
zZ0_+)tcM-v;WLjB?y(x{F%swTD)SiS9?!;ljK+DKGLIDZSc~;Y#d$nr9_i3y=NsQ^
zu@zZ&*ReP}{EyK3th+T@*_*eqZ#4FX%O>b{iWO(USDtFAW3{YY{55g*p1P}!a8zWX
z7lz;IPVBzpJS=7G%wV8y2Q62ba|`EHRm#%1lYm%>L=vK=N;x|_7+?*WxKL3R0`umY
z&O>M<DHHxW7E8~>hKe$y(1g;N2-TU8l!<C|EEb%J4HacZp-Gd8P@M@$nW#v|VwsuP
zP=$;-)Haz>@sOMoiwl`i1tW@cj+o4-cu3BPCB-VhD+4MD9hIDroD&Pl#Oi8OIy2%-
zNlr-4iRFXLXr|LTGn$gL<b>p$V}cX!M^n3=p)tt`$vN>NG_kr`M{qil6Owag1ZPHY
zW+W#h=gbPutl-Q_PDsv)?-Htwo@Y*Q<|HR1=gbSvyx`1BPDsu<E;z>p=eXpA<eYfp
zv*(GAkEvZhm4f7i<eWvpSrnW_$qC6hOM<f`I7^Zfl5<W7&I!ReAvqyAXIXHT1!q}u
zLUPVY!8s{7CnYB&=bRFpQ-X6!azb*>X~8)yIHx5iB<DoK!Jg-g;GB`1keqW?aLx+O
zS;+~>Ip+lDoZy_3oRFMzUU1F}&UwiR$vGDU=Yrr|kera5b5U?E3eH8z3CTH^1m}|A
zT#}rSoU<Z0D}u8kIUx;a@2q9hqcop+`Y3zu*6>5@qiM`L8Qmx@>rXnqyVu6bqy3;0
zSfN$e$O$X-aop-gjFlN1TJ2C(VM8aZsGs9rPsDhcG3gaHcG3%d9rt=N#><R_Ugd1x
zYt+>h-rEXOMpLn!a_)bcQwbVUYCt>d6Z~go(OKwiV=x$e6rJOWm8FJLZ)jL(gSOQ9
z(=101Q%{N90rg{iGreXyIPiUy_PU*2Ro)uw?+2cJexkhQVfAu5b@3W?^1b$-wSOuL
z8($pWumAYmuXoN*92)^EIHqx|osu9QI;oM>2efl4w7)DozPM|Bh$~ecUA>%od=bT&
z;R0PerC=JrI{7MZ#_1;2tCR9A{Hkc%mp4o`zpVZISFrki`_c5@?b)Ba_T|{c>*}hQ
pv@F`;cR<_jYzAT_(hnb+<eKANn;)0v1k>|8pBtRxTSGr9{slF`>K_0A

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/virt/riscv64/FACP b/tests/data/acpi/virt/riscv64/FACP
new file mode 100755
index 0000000000000000000000000000000000000000..a5276b65ea8ce46cc9b40d96d98f0669c9089ed4
GIT binary patch
literal 276
zcmZ>BbPf<<WME(ucJg=j2v%^42yj*a0-z8Bhz+8t3k1-OV?`GjD1M-;Zz#xa0OIBc
A0RR91

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/virt/riscv64/MCFG b/tests/data/acpi/virt/riscv64/MCFG
new file mode 100755
index 0000000000000000000000000000000000000000..37eb923a9320f5573c0c2cdb90bd98409cc7eb6f
GIT binary patch
literal 60
rcmeZuc5}C3U|?Y6aq@Te2v%^42yj*a0!E-1hz+8VfB}^KA4CHH3`GY4

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/virt/riscv64/RHCT b/tests/data/acpi/virt/riscv64/RHCT
new file mode 100755
index 0000000000000000000000000000000000000000..beaa961bbf0f0486c0dee25f543377c928354f84
GIT binary patch
literal 314
zcmXAlu}%Xq42FGxD#XNyI`tt=C&buWx`A2-wkXNvbP-K1O46&8iKjrk6)SI3ey5h~
z@3-SPa`wCa{iPvl)b_RC9X8vKw|)adiC8n)zP^7d?+~A>`lE(^DK1@Wog4=(iq&1K
z7;1J`gewX|OE=3Z>{xM3wM)ljIQKa+635YaZ7jrOeGc+eJEnks*|jl=GEUBVQ8WhX
zK@<flJgso_nMF!k2aE&flg}m^e@2oQd6bm~m(n5!gJ?a<U{EgOALs#2D_Y&qJuA9g
Pp1|9>GjINg;u`)Bd);9H

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/virt/riscv64/RSDP b/tests/data/acpi/virt/riscv64/RSDP
new file mode 100755
index 0000000000000000000000000000000000000000..55054f8730c389d0d7eba90c24a1dae6d1283b90
GIT binary patch
literal 36
ncmWFvc2Nij2~zmy<nQbetiV+A;QxOW1_p)~KpIFfhygJG?v)Gy

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/virt/riscv64/SPCR b/tests/data/acpi/virt/riscv64/SPCR
new file mode 100755
index 0000000000000000000000000000000000000000..4da9daf65f71a13ac2b488d4e9728f194b569a43
GIT binary patch
literal 80
zcmWFza1IJ!U|?X{>E!S15v<@85#X!<1dKp25F12;fdT`FDF9*%FmM4$c8~z`e;@#f
G!2kgKJqrN<

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/virt/riscv64/XSDT b/tests/data/acpi/virt/riscv64/XSDT
new file mode 100755
index 0000000000000000000000000000000000000000..c69474889664d72d075419c0a1dcf1d82ec44268
GIT binary patch
literal 84
zcmazDb_oe#U|?VrcJg=j2v%^42yj*a0!E-1h!zG)F&y~+AIN23*Z`#$K<Nokx&cZT
GKxhCTIu!u`

literal 0
HcmV?d00001

-- 
2.40.1

