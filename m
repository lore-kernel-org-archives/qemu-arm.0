Received: by 2002:a17:505:2e08:b0:1bd8:8c49:4f6d with SMTP id ya8csp150997njc;
        Fri, 21 Jun 2024 05:02:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUa1h4SzIysVAX5eH9+mQMdBf9jtlmZS6qoKw5B3q0FfZC15Z5QTOGQacOJtDTNiA0T2r+3UPtCda6kOKn5UHtBSIPG9u4H
X-Google-Smtp-Source: AGHT+IH1h9WzHX3MfK/lXLt8iHGa7WwaQ8BLHonpsUDwPp183+hKL5Dp/TD3CcJjKIB4mKuQLsB1
X-Received: by 2002:a05:620a:244b:b0:792:b9d5:d3b3 with SMTP id af79cd13be357-79bb3e2c89fmr809391985a.20.1718971340756;
        Fri, 21 Jun 2024 05:02:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718971340; cv=none;
        d=google.com; s=arc-20160816;
        b=J9zX1hMLFMHQhnkp9hybXSUt2lBohQWl8l0/qq+xPntpL1fZBQVYAStmUvlE5k+zK3
         ErbZAqdfHqAqPb6yY/5CQON88n/z5tubrCAC4iuZxMgZpMxLI8ZTM5roZLilZrMifqAi
         FPNsAvTqrvO5qwoDcvSImoJC3/O4YbWm2nXIRCHrsH+lM1DvRk9Ka+I1c19NcmvpAD3o
         mk2NKkHVzayd1eb//BVVb9TqX8gQthZQNmUXijX/1q9dxnmRhh8O4SoPQlXTCH9bi4N9
         UjlLHWtwxJ8JH7O68eeIhkIrlkh7/kK9Sb/nhjdrXVW783IHOZpoHYc/EjhFMMwtAo21
         Su+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=toFVRucUa3SM8/iiInrV6QnGLV2tSBYSyZQLP37K55o=;
        fh=C2QtNYd7GpPoPiCl3EEuWIRrR179lBYVcnt7qlbBMi0=;
        b=iwIxBR2OmNcjaThFxVZoFjHVPZQM9sbSND1dgak7boJPp8391oGKcdkYeSYSxX37Oo
         nqr8VokcDV9AgtGr2gRabwwgs2pYaZSiwRsgW80dpNV3H9jey/jub4DrNUcOqqdBnM0q
         qWZy6u8a+NhTYQJFvbRjIMI7e+pgqM21tGTujtg+SYWVqlBGnRYBTJTHhbgvpboMcmxZ
         XS+0SxCTfhp4IhgSoCJYRZrCIF6+fsr2aFHxT7VejKnz2UGwB07qsfg9lw5ywlLLUPuE
         6TdonYmLTi1vyb8HEs1Apbk/mqIzgsmnVcbhEv85szAXOwzCdZE8G3S9KJ6d9S4nVhNJ
         mjXw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b="faFe1mJ/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79bce94377esi161447785a.654.2024.06.21.05.02.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Jun 2024 05:02:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b="faFe1mJ/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sKcx0-0006td-T8; Fri, 21 Jun 2024 08:01:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sKcwe-0005v5-Ut
 for qemu-arm@nongnu.org; Fri, 21 Jun 2024 08:00:46 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sKcwc-0003lS-EJ
 for qemu-arm@nongnu.org; Fri, 21 Jun 2024 08:00:44 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1f9cd92b146so14416805ad.3
 for <qemu-arm@nongnu.org>; Fri, 21 Jun 2024 05:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1718971241; x=1719576041; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=toFVRucUa3SM8/iiInrV6QnGLV2tSBYSyZQLP37K55o=;
 b=faFe1mJ/2FWKmyKgzjAmQYlnNgjJhBlvgPFSjzKJ+acu3esdug9qITzHT2oIjcCYaJ
 Dn4xPQW7l0Wy9GWL3zi75SZMl9jh+PYGaEswZUdjxKHSEx+KckKVl4SU6wSgtfUSH4pW
 A2MZVt749M+7aFjafNWoSTJNgRXU4USCWZ4OvKUSNMFlAd/QfgQU4bNNmuqDuUTwZElp
 fcYmKmoYe3zIoNE78AElwyib4xmaqVkGYFQ9m/Bad6HL05FilXcr2Cfo0rh3w8igWtGf
 76nL3WOu/Vse/dGSD0+QUBES1C6VH5nqp+YAOHP9shEgGUh1SHX/UsteosOjP2C0ci8/
 v9sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718971241; x=1719576041;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=toFVRucUa3SM8/iiInrV6QnGLV2tSBYSyZQLP37K55o=;
 b=eiUo1s3Q9x4r0VwkO7sldDLlddKBh9VU6cvE/UORxg661KeIticY/mcU+NDYWvGtYo
 QvUvF1a5ChZ4+VqebRr26VWcB+ffX1Ux/AwDeHi9JJzoma/xc5v9YqHLomT6fvTQjcIj
 JR+ALofSOZhu9kJJ5/WhzArXh9yNjz9yVIun2aOKPOID46ZC84f5DltP/DwrRRti+sNK
 /bpwj7UlECdBALiY85GMZT4tf85hDWnPokqx2NSTAalBS5PyLRnZXdZynrIYg5sh6BA0
 aqG3cBM/NnOFQvfW4eOMaSgHcAO6rbjhylM3Efq5+B2A8e8A+8tecyNqIRk/LAPDA+Au
 FXuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3/V3EY4vKCpAP/YgB5TAqur0NNuudC0AOU19CBzfeHcVLARMCY2bVaNhKe4Ea8aJSZJvVwSlv5s4Xe7ebTuNehsAB
X-Gm-Message-State: AOJu0YyG/TY2bRPWffTAtQ33fGQ4njkJ6Xj0/J8IF9jZXrI+xd7uMu0W
 dqfN19LbTdWC7Ks2yvFHQuDWPCvi+2rTQ3Yk2OOWnu7dxDhIPJATVZ61jD0Y+zs=
X-Received: by 2002:a17:903:22c6:b0:1f9:f1e1:da72 with SMTP id
 d9443c01a7336-1f9f1e1e286mr14034075ad.63.1718971241050; 
 Fri, 21 Jun 2024 05:00:41 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.187.237])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f9ebbb606dsm12422995ad.270.2024.06.21.05.00.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 05:00:40 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Sia Jee Heng <jeeheng.sia@starfivetech.com>,
 Alistair Francis <alistair23@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Sunil V L <sunilvl@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v3 15/15] tests/qtest/bios-tables-test: Add expected ACPI data
 files for RISC-V
Date: Fri, 21 Jun 2024 17:29:06 +0530
Message-Id: <20240621115906.1049832-16-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240621115906.1049832-1-sunilvl@ventanamicro.com>
References: <20240621115906.1049832-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: NCRE/2ahQPOl

As per the step 5 in the process documented in bios-tables-test.c,
generate the expected ACPI AML data files for RISC-V using the
rebuild-expected-aml.sh script and update the
bios-tables-test-allowed-diff.h.

These are all new files being added for the first time. Hence, iASL diff
output is not added.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Acked-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/data/acpi/riscv64/virt/APIC           | Bin 0 -> 116 bytes
 tests/data/acpi/riscv64/virt/DSDT           | Bin 0 -> 3518 bytes
 tests/data/acpi/riscv64/virt/FACP           | Bin 0 -> 276 bytes
 tests/data/acpi/riscv64/virt/MCFG           | Bin 0 -> 60 bytes
 tests/data/acpi/riscv64/virt/RHCT           | Bin 0 -> 314 bytes
 tests/data/acpi/riscv64/virt/SPCR           | Bin 0 -> 80 bytes
 tests/qtest/bios-tables-test-allowed-diff.h |   6 ------
 7 files changed, 6 deletions(-)

diff --git a/tests/data/acpi/riscv64/virt/APIC b/tests/data/acpi/riscv64/virt/APIC
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..66a25dfd2d6ea2b607c024722b2eab95873a01e9 100644
GIT binary patch
literal 116
zcmZ<^@N_O=U|?X|;^gn_5v<@85#X!<1dKp25F13pfP@Mo12P{Zj?R|`s)2!c7=s}J
I#NvT*0o0BN0RR91

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/riscv64/virt/DSDT b/tests/data/acpi/riscv64/virt/DSDT
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..0fb2d5e0e389541209b765d5092d0706f40298f6 100644
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

diff --git a/tests/data/acpi/riscv64/virt/FACP b/tests/data/acpi/riscv64/virt/FACP
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..a5276b65ea8ce46cc9b40d96d98f0669c9089ed4 100644
GIT binary patch
literal 276
zcmZ>BbPf<<WME(ucJg=j2v%^42yj*a0-z8Bhz+8t3k1-OV?`GjD1M-;Zz#xa0OIBc
A0RR91

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/riscv64/virt/MCFG b/tests/data/acpi/riscv64/virt/MCFG
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..37eb923a9320f5573c0c2cdb90bd98409cc7eb6f 100644
GIT binary patch
literal 60
rcmeZuc5}C3U|?Y6aq@Te2v%^42yj*a0!E-1hz+8VfB}^KA4CHH3`GY4

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/riscv64/virt/RHCT b/tests/data/acpi/riscv64/virt/RHCT
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..beaa961bbf0f0486c0dee25f543377c928354f84 100644
GIT binary patch
literal 314
zcmXAlu}%Xq42FGxD#XNyI`tt=C&buWx`A2-wkXNvbP-K1O46&8iKjrk6)SI3ey5h~
z@3-SPa`wCa{iPvl)b_RC9X8vKw|)adiC8n)zP^7d?+~A>`lE(^DK1@Wog4=(iq&1K
z7;1J`gewX|OE=3Z>{xM3wM)ljIQKa+635YaZ7jrOeGc+eJEnks*|jl=GEUBVQ8WhX
zK@<flJgso_nMF!k2aE&flg}m^e@2oQd6bm~m(n5!gJ?a<U{EgOALs#2D_Y&qJuA9g
Pp1|9>GjINg;u`)Bd);9H

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/riscv64/virt/SPCR b/tests/data/acpi/riscv64/virt/SPCR
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..4da9daf65f71a13ac2b488d4e9728f194b569a43 100644
GIT binary patch
literal 80
zcmWFza1IJ!U|?X{>E!S15v<@85#X!<1dKp25F12;fdT`FDF9*%FmM4$c8~z`e;@#f
G!2kgKJqrN<

literal 0
HcmV?d00001

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 70474a097f..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,7 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/riscv64/virt/APIC",
-"tests/data/acpi/riscv64/virt/DSDT",
-"tests/data/acpi/riscv64/virt/FACP",
-"tests/data/acpi/riscv64/virt/MCFG",
-"tests/data/acpi/riscv64/virt/RHCT",
-"tests/data/acpi/riscv64/virt/SPCR",
-- 
2.40.1

