Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp1161861njm;
        Wed, 5 Mar 2025 16:07:35 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW9LMdrP7yH11P0egPWaQXvcIPYtVXWzlxDm9Cj8b2gorT/+/AePgq/hLmeA/ri5oh0M404ltr0gr7bpg==@linaro.org
X-Google-Smtp-Source: AGHT+IEkW86/54ygV56TFkrTrEVqwRWG806RffCppbDAp4NYiC1PqAYW+tTseAZtBFSU2JDjK/ld
X-Received: by 2002:a05:620a:4387:b0:7c3:cfa6:d1db with SMTP id af79cd13be357-7c3d8e46738mr746985885a.11.1741219654856;
        Wed, 05 Mar 2025 16:07:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741219654; cv=none;
        d=google.com; s=arc-20240605;
        b=apNtqPR5XPpjx4+Boz3v2fy4OkF0jlL5ZzxPgeVW9ZyvgfND5E9ipmL7sOquOyXeKN
         Knp/zrxdlwo5gj2OYibsqxISASTZVTNY5SIAbVBM/u88qRAFIckd8E8vPC+LXOVUQn9m
         ZcWNRTmnaCAC8EAUXx1UbDhRU+jcQwwK2tFrPDb82LWKvkY3vv2yUlKS2V+4Ki51ugFu
         pg+aZici2A/ltAa7mRAVNGFRqFE9MmlhuTWeXHRiqucRa0v/ljwMFKXk7KsbZkGSbP2s
         W2V1AcZovxaDWonoAfWjsVhulr0XzO8j5mKGVtAbCx3YVHcJFUtAzRfRxOT1PNHQ0EZo
         2WxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :from:subject:message-id:mime-version:in-reply-to:date
         :dkim-signature;
        bh=H/6NaOVcyKytl+LFcDmVZ36hJJIaYUM/Z3RV+7IsZII=;
        fh=OtWpAz3BqddOW3O7spxJE1OoKderGyL+ZgvOMDm5GDc=;
        b=E1hGqMt+BqwEA0GmZDjYZVqRJOXUPYZHcvouIUB+k3bx/inlTD8aqFDGH1UYVbH75S
         TmxH01O7P6oDPoB3xjbRoilARARHbU3mGhXGmQhwALkuxZzOfTuxe6FrnbnR2ARhLXCK
         zxHFl5GZfo7tavkqnSeI971WmfFBFFn19jKdwcUnBwDnBChwf1jb763JNULWZquJ/Z+L
         Y3GTf0QfoNt415/4sH/P0ahHckidVasauoYvwtAUZLhzoOZMlpXCux8e9VChfKaY4e9o
         ChLQOvGHs31m0GLlD2U1fGdPSiueDeIaKok3/HoJ3P0O3WBRqngPYi3GsgoZ8avQk1jv
         Ajlw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=PUecQS2t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4751d980aedsi1272231cf.18.2025.03.05.16.07.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Mar 2025 16:07:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=PUecQS2t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tpylx-0000Kj-7A; Wed, 05 Mar 2025 19:07:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3POfIZwwKCHMeRSZYVjkVWReXffXcV.TfdhVdl-RidefeXel.fiX@flex--nabihestefan.bounces.google.com>)
 id 1tpyls-0000K9-Uh
 for qemu-arm@nongnu.org; Wed, 05 Mar 2025 19:07:29 -0500
Received: from mail-ot1-x349.google.com ([2607:f8b0:4864:20::349])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3POfIZwwKCHMeRSZYVjkVWReXffXcV.TfdhVdl-RidefeXel.fiX@flex--nabihestefan.bounces.google.com>)
 id 1tpylr-0006zP-Be
 for qemu-arm@nongnu.org; Wed, 05 Mar 2025 19:07:28 -0500
Received: by mail-ot1-x349.google.com with SMTP id
 46e09a7af769-72a2bc82facso35940a34.3
 for <qemu-arm@nongnu.org>; Wed, 05 Mar 2025 16:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1741219645; x=1741824445; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:from:subject:message-id
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=H/6NaOVcyKytl+LFcDmVZ36hJJIaYUM/Z3RV+7IsZII=;
 b=PUecQS2tTP4ydWC97DObL8d6100h4vFkVsq5VjNofhuTS29yYD+VoAH7l7r7Bab44K
 qLuHy3WxtOtqT6KHnba05uYX498WJCDNHv9u83JYEOJJLsnkioXn3mMQb2tfk98Bgssp
 TMbDPs/8iMWEFDtDZJvqbpO0+wYXjJJ9YuRcGVP8Zq5nTYKWjPsC1t8h45TgVKweXQKO
 rYd1g1sTGkDW8DXCDS5RqGc8Wtydcnt6mwwrZkZ0Ovcia2FKpYgV4+enzBIsgbrfC90z
 eo2IuvLYrtYn79x8QraVybYl92CLuuwqwtplrOhJA0mJCrD1rh8mPwk1IcCs7i/1CakI
 qYbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741219645; x=1741824445;
 h=content-transfer-encoding:cc:to:from:subject:message-id
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=H/6NaOVcyKytl+LFcDmVZ36hJJIaYUM/Z3RV+7IsZII=;
 b=Rey9NWThy379jYmV0gJyLH6QzZdcwGK5o3kxrPAL6fyu3XYVPohUnXssvLycrNumwN
 IG81wo/wPb23G8As31olI+wodSbt9b8LNUTp+lCBgG24/83TSfEuMZkZmrcIXxSVaqEI
 aBPqJ4oMNlqCXKEl6xnZdUFy/a9dI5uM8UjBHlHxjbyrMT+JM1MeSkY/44nMEiTodT8B
 GKmGsNIvL0BaOXnMLiNAT2jdlSvVx7HLbjWibvtefdgKSGlCrDoN6HrNvdNNd3QgSxUW
 lv/XZBuJn7B2h8STQew7DwnGBlBfmEdel54EqsjJJv1X2OZU++BQREsZ3tTeZlCQPKrJ
 sagw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwVPNYMEwkGXtlXk2al3spDipdFexI2SeRP61pPR/KgGWymZd1TIoQG8rg3Gml5Em9Pk/5RiTgCQ==@nongnu.org
X-Gm-Message-State: AOJu0YzzDm5HWMXE7VIogBtjM9mjLdH4vaissG3nZfVxkYq22/CwhQZc
 PinqJJ78f6CMD4CSPYg+0Yxgs4uF3haNHZC2rtLZ0WoP8wmZj3SEP1S1Zy5oy3bgZmysxcVaSQz
 Ij5txDclDcuyzptVDt0k2tNZDZg==
X-Received: from oabnd22.prod.google.com
 ([2002:a05:6871:4416:b0:2b8:4bc1:4e4b])
 (user=nabihestefan job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6830:2649:b0:727:2a5:b1fa with SMTP id
 46e09a7af769-72a1fc22167mr2434675a34.13.1741219644551; 
 Wed, 05 Mar 2025 16:07:24 -0800 (PST)
Date: Thu,  6 Mar 2025 00:07:13 +0000
In-Reply-To: <20250304064710.2128993-5-jamin_lin@aspeedtech.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250306000715.2095554-1-nabihestefan@google.com>
Subject: Re: [v5,4/6] hw/misc/aspeed_scu: Fix the hw-strap1 cannot be set in
 the SOC layer for AST2700
From: Nabih Estefan <nabihestefan@google.com>
To: jamin_lin@aspeedtech.com
Cc: "=?utf-8?q?C=C3=A9dric_Le_Goater?=" <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Nabih Estefan <nabihestefan@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::349;
 envelope-from=3POfIZwwKCHMeRSZYVjkVWReXffXcV.TfdhVdl-RidefeXel.fiX@flex--nabihestefan.bounces.google.com;
 helo=mail-ot1-x349.google.com
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
X-TUID: 4VehEE8l6N7a

> There is one hw_strap1 register in the SCU (CPU DIE) and another hw_strap=
1
> register in the SCUIO (IO DIE).
>=20
> In the "ast2700_a0_resets" function, the hardcoded value "0x00000800" is =
set in
> SCU hw-strap1 (CPU DIE), and in "ast2700_a0_resets_io" the hardcoded valu=
e
> "0x00000504" is set in SCUIO hw-strap1 (IO DIE). Both values cannot be se=
t via
> the SOC layer.
>=20
> The value of "s->hw_strap1" is set by the SOC layer via the "hw-strap1" p=
roperty.
> Update the "aspeed_ast2700_scu_reset" function to set the value of "s->hw=
_strap1"
> in both the SCU and SCUIO hw-strap1 registers.
>=20
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> Reviewed-by: C=C3=A9dric Le Goater <clg@redhat.com>

Tested-by: Nabih Estefan <nabihestefan@google.com>

Thanks,
Nabih

> ---
>  hw/misc/aspeed_scu.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
> index 545d004749..0581c744f1 100644
> --- a/hw/misc/aspeed_scu.c
> +++ b/hw/misc/aspeed_scu.c
> @@ -910,7 +910,6 @@ static const MemoryRegionOps aspeed_ast2700_scu_ops =
=3D {
>  };
> =20
>  static const uint32_t ast2700_a0_resets[ASPEED_AST2700_SCU_NR_REGS] =3D =
{
> -    [AST2700_HW_STRAP1]             =3D 0x00000800,
>      [AST2700_HW_STRAP1_CLR]         =3D 0xFFF0FFF0,
>      [AST2700_HW_STRAP1_LOCK]        =3D 0x00000FFF,
>      [AST2700_HW_STRAP1_SEC1]        =3D 0x000000FF,
> @@ -940,6 +939,7 @@ static void aspeed_ast2700_scu_reset(DeviceState *dev=
)
> =20
>      memcpy(s->regs, asc->resets, asc->nr_regs * 4);
>      s->regs[AST2700_SILICON_REV] =3D s->silicon_rev;
> +    s->regs[AST2700_HW_STRAP1] =3D s->hw_strap1;
>  }
> =20
>  static void aspeed_2700_scu_class_init(ObjectClass *klass, void *data)
> @@ -1032,7 +1032,6 @@ static const MemoryRegionOps aspeed_ast2700_scuio_o=
ps =3D {
>  };
> =20
>  static const uint32_t ast2700_a0_resets_io[ASPEED_AST2700_SCU_NR_REGS] =
=3D {
> -    [AST2700_HW_STRAP1]                 =3D 0x00000504,
>      [AST2700_HW_STRAP1_CLR]             =3D 0xFFF0FFF0,
>      [AST2700_HW_STRAP1_LOCK]            =3D 0x00000FFF,
>      [AST2700_HW_STRAP1_SEC1]            =3D 0x000000FF,
>
