Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp1160492njm;
        Wed, 5 Mar 2025 16:04:56 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXCkM62yAQ9Eldu1AWAaB2CJk+wh7TxdXGoKHZ9JJLHaATRruXAKLajQoVZuFQ2ixNkpSEy9Kn5alHMYw==@linaro.org
X-Google-Smtp-Source: AGHT+IETQ0bnOMFC03lekOxhB+Rydv9Q/IoKRdNjP/MtnCko5FmJZnSxCkxzTohQrIVw2ju8vJY3
X-Received: by 2002:a05:620a:8018:b0:7c3:cf3c:6fc4 with SMTP id af79cd13be357-7c3d8ee49fdmr922729385a.35.1741219496224;
        Wed, 05 Mar 2025 16:04:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741219496; cv=none;
        d=google.com; s=arc-20240605;
        b=TzWyYsYNUDVbJLm4hTTJuNzb9vK3HOvo2j2vFzbuhDZpZyMkpKETXdP5R3dADV6otM
         MFWBzWTgJmQxyJh2mo2zKw8zHgTNdZ8bt5JUdoIWv3EJGFkw+K8HO5md0GRpvfLtyNdo
         4Y1GL/WkfOPHpC+WWKzqJtu1uzYK8N3vLAbQXQ61MBKFvzmt5O7/Ysnv6+ATjI6z2830
         RlV9uo8KVP7eMT6H4AVncwhdvGgwHeAOslzR/XBWW5BMNQeifgRbUk6pRkoMyjqWPiBR
         f1UwIBa1agLbradOwTuMGSxncuLGpTeriCCHLH80hMDOpA1BY6GcepDY6hj1ExNJChh5
         BO8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :from:subject:message-id:mime-version:in-reply-to:date
         :dkim-signature;
        bh=u4FPgBDeNgIVnuSeJEm4bRvq4c3lMQnGzsPghs6/QjQ=;
        fh=Nuperd8c7oJQFcjAq7F97UrBdSXJgbOfmXerpwCgxPQ=;
        b=XT50UKH6UI/wp5Z/z9ULIIboIKyuiZWOz+e9nC6IeD4lE+wkMyJURlUYDaf1yoSS5w
         WtcMvgwVSiDktyWBI9Mw+rNXGxy0TgRDvH5wBKcjY/K2jjq4ZCQ7+8JsodtatlECm/Wv
         aYll7VYitbsIitvPAGHQfaGwuBUg3V0/cvfTzCe44RX0JtDa+eBOjp8suUG1hWh9+lYu
         TQaSgisIMvRhIsfFbzGZ7eiG1EveVn0J4BK7nETrZzZXja8NbU4p72c7nPK/qhPVO/C6
         DBTfhSg8D6kkWfctZ+IN1SKndGL5uFclHWg5tz7Qz3lwpHmAhtnD3mFKgdAq0T3Rl/K/
         Djvg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="3iRHX/+9";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c3e536ace4si17043185a.185.2025.03.05.16.04.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Mar 2025 16:04:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="3iRHX/+9";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tpyj0-0006g0-3B; Wed, 05 Mar 2025 19:04:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3g-bIZwwKCLglYZgfcqrcdYlemmejc.amkocks-Ypklmlels.mpe@flex--nabihestefan.bounces.google.com>)
 id 1tpyiv-0006fh-Tq
 for qemu-arm@nongnu.org; Wed, 05 Mar 2025 19:04:25 -0500
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3g-bIZwwKCLglYZgfcqrcdYlemmejc.amkocks-Ypklmlels.mpe@flex--nabihestefan.bounces.google.com>)
 id 1tpyit-0006Zb-Uy
 for qemu-arm@nongnu.org; Wed, 05 Mar 2025 19:04:25 -0500
Received: by mail-pl1-x649.google.com with SMTP id
 d9443c01a7336-223f63b450eso863905ad.2
 for <qemu-arm@nongnu.org>; Wed, 05 Mar 2025 16:04:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1741219459; x=1741824259; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:from:subject:message-id
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=u4FPgBDeNgIVnuSeJEm4bRvq4c3lMQnGzsPghs6/QjQ=;
 b=3iRHX/+9D4ACqVViUJIx7B5EkDMJCEeBTq45iUSqc2PjjcnQQzCb8bfJ9sIVUS6QEG
 f3rXOorUS5jctN2Ls/6E23Hmqc434NwovkBbP+ZbPmLAe4EZTzZJdMlNAPgJUAYe2R8D
 YQIYNpeyMnK98ZV4YX5CcN0icSiZHvFIzmKpeG6q8XcoRcakccCaLOGoL1VxkOI5eyz6
 MVeaewUOGWKoH/F41aUmhKpuwvpOIG6a2BBEO2Rsr+dBW69ISKNgTerR0qarjg5D/gIy
 7I7mI5q5kdoBaxPHLhwTCPg5O+iZ3Lla7DExt7WEW8sNfm4wCyXjbBjuRdWmESYEyf1X
 BtRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741219459; x=1741824259;
 h=content-transfer-encoding:cc:to:from:subject:message-id
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=u4FPgBDeNgIVnuSeJEm4bRvq4c3lMQnGzsPghs6/QjQ=;
 b=EtdIfCzGbQPPeK2EDRe2svH0C/T2SYUayJgu6uNXVyVKUVFWzOQ9IafDiDJJ6cQ2Ut
 373KzvWFM8XL7hBr+O0XkHtOJb6oeI4oShbgd4ZSvngZr00KYfWJP2g/C6+/FPETDEKw
 wtV4vBtxTWSCtyYaiVxfYnp8bxY6KbcxM35s0b8m/D1o7I8/nN/XZiAt/FdtT/Wbzfh2
 bJXsqc61Nb9CDBU3Zl1I18Qtccfuay9n48Ht1JvCSa1229NAVAnkoq3rmRhUBfYgldBB
 oXeNVPX/Q0vmJZ8JdTA4wRYZEULumFu4EFqf99qe23UjtM3d/K0/XRIhj1eFzzm4JA3u
 b2Nw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzoleGp9HCo24989cZyQuvg/lA8+ncgGb4EH7QoaADI0oj3Nt8GdzIpNLcXWQXl0B/hwS8+ORt/A==@nongnu.org
X-Gm-Message-State: AOJu0YyjdqHvvQhhyDE4W27C9/zCkPfLyjZkeDl+RcJpWJQSQ8rZuMW+
 yrbsuOMbWVnVTJ9srAZJJ6OGEWcjKyOhEqrrMQra8ur1L1/ANdUuliV73WrLXnyrrnJg/vZ7RS5
 QsLJCtHDhh64hcU5JJXLjWGFpzA==
X-Received: from plbkz11.prod.google.com ([2002:a17:902:f9cb:b0:220:d28d:8218])
 (user=nabihestefan job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:f54c:b0:220:e156:63e0 with SMTP id
 d9443c01a7336-223f1c66badmr60288055ad.8.1741219459287; 
 Wed, 05 Mar 2025 16:04:19 -0800 (PST)
Date: Thu,  6 Mar 2025 00:04:04 +0000
In-Reply-To: <20250304064710.2128993-2-jamin_lin@aspeedtech.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250306000408.2088020-1-nabihestefan@google.com>
Subject: Re: [v5,1/6] hw/misc/aspeed_scu: Skipping dram_init in u-boot
From: Nabih Estefan <nabihestefan@google.com>
To: jamin_lin@aspeedtech.com
Cc: "=?utf-8?q?C=C3=A9dric_Le_Goater?=" <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Nabih Estefan <nabihestefan@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::649;
 envelope-from=3g-bIZwwKCLglYZgfcqrcdYlemmejc.amkocks-Ypklmlels.mpe@flex--nabihestefan.bounces.google.com;
 helo=mail-pl1-x649.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: +4ZGQlqsU2Xl

> Setting BIT6 in VGA0 SCRATCH register will indicate that the ddr traning
> is done, therefore skipping the u-boot-spl dram_init() process.
>=20
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
> Reviewed-by: C=C3=A9dric Le Goater <clg@redhat.com>

Tested-by: Nabih Estefan <nabihestefan@google.com>

Thanks,
Nabih

> ---
>  hw/misc/aspeed_scu.c | 2 ++
>  1 file changed, 2 insertions(+)
> diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
> index bac1441b06..50f74fbabd 100644
> --- a/hw/misc/aspeed_scu.c
> +++ b/hw/misc/aspeed_scu.c
> @@ -157,6 +157,7 @@
>  #define AST2700_SCU_FREQ_CNTR       TO_REG(0x3b0)
>  #define AST2700_SCU_CPU_SCRATCH_0   TO_REG(0x780)
>  #define AST2700_SCU_CPU_SCRATCH_1   TO_REG(0x784)
> +#define AST2700_SCU_VGA_SCRATCH_0   TO_REG(0x900)
> =20
>  #define AST2700_SCUIO_CLK_STOP_CTL_1    TO_REG(0x240)
>  #define AST2700_SCUIO_CLK_STOP_CLR_1    TO_REG(0x244)
> @@ -930,6 +931,7 @@ static const uint32_t ast2700_a0_resets[ASPEED_AST270=
0_SCU_NR_REGS] =3D {
>      [AST2700_SCU_FREQ_CNTR]         =3D 0x000375eb,
>      [AST2700_SCU_CPU_SCRATCH_0]     =3D 0x00000000,
>      [AST2700_SCU_CPU_SCRATCH_1]     =3D 0x00000004,
> +    [AST2700_SCU_VGA_SCRATCH_0]     =3D 0x00000040,
>  };
> =20
>  static void aspeed_ast2700_scu_reset(DeviceState *dev)
>
