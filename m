Received: by 2002:a17:504:6615:b0:1be9:327d:8ee3 with SMTP id h21csp138306njk;
        Thu, 20 Feb 2025 07:22:00 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX7D90SYSDCaBpCUx4YekyWqEAjfoWOB7CiuctaqslEtr4x6+OLdl2kM26nfS+Vgp6ldBQWox9i1rY7Lw==@linaro.org
X-Google-Smtp-Source: AGHT+IE+iO+brfsB8uXbcH+sixYmI/PHtwCXDCng5ht8PvhDoL7jRGTQ7ciVYS9gKPjp8yn5LbU2
X-Received: by 2002:a05:6122:1812:b0:520:6773:e5bf with SMTP id 71dfb90a1353d-521c43c2685mr4449146e0c.1.1740064920374;
        Thu, 20 Feb 2025 07:22:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740064920; cv=none;
        d=google.com; s=arc-20240605;
        b=jdoHibMvIqTZDrJOr9KA1wuHddxeMgFGrijm2N7MDXRLlUgSuPQ1cAGxGQvcYCkwh0
         eo/7WyJv55lDJXo6laoDkKxCWzHTJCcfp7tuGbCHKp7EkDQ82/1bclYZW6YdKRzSMMyV
         ONerjkBKiMZbv/jfD6TKxttUoI0vv1S5F08DN3bf6ToVIIiCo55No68GgWyabYtLA5gr
         8FiL5UJgDa+5aeiLlJRmu+4Z0uCfE0WWBltc3PYHexBhfcI0UZtYuc2THn/UZE8qELI9
         /ssBHc6AShXbFd5M9Y4qtcpTTkpYWW5Zo5mJM2ptmRxohSBYJUCf05wGy8gUlSigCtEO
         KfjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=/6XkVQ4ezBwaXgU6HbYM+ncvnfzjKadVi0rsVD2IzSY=;
        fh=dRWNYZ4/66DWZoWX1FMcy+GzizryTh1rKGHA61RWg8k=;
        b=il+VyBXtly6dUFxASmSwErBXECtJ4AiUoIoNXnBBvJF3xE1GnugRpf2oDJGmuf8vfv
         D8VuRZI4OzyHqu2jkKvZTcGhSZe0Vi0aUelidhzfqszaj0+JjnLz5Q/i7nRajdfrZ3dO
         WeVNvufRU6jJeknuNQmvrsD3nsyq6qm4HDKuzdeCd1JCUPDeJ/x4ewY8IOSDGDhrKaYF
         S21QryckCs2FQ7n0jZo0nk1aTkoHJvTU8HbjLKmxznp/8Kxa8SCwabF0gyhbe/e+2+MP
         ocOqPx4+RkZNgQyFb82m2vPVjyIF0/CFoJZVATV8ManmUMporOvCupCajAP9OxZNTCaV
         aHqA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="x2GZym/h";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-868e8586d84si3161596241.40.2025.02.20.07.22.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Feb 2025 07:22:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="x2GZym/h";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tl8N0-0004xA-97; Thu, 20 Feb 2025 10:21:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tl8Mx-0004wQ-Fn
 for qemu-devel@nongnu.org; Thu, 20 Feb 2025 10:21:43 -0500
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tl8Mv-0007k6-Ob
 for qemu-devel@nongnu.org; Thu, 20 Feb 2025 10:21:43 -0500
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-6fb7c373416so8215407b3.0
 for <qemu-devel@nongnu.org>; Thu, 20 Feb 2025 07:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740064900; x=1740669700; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/6XkVQ4ezBwaXgU6HbYM+ncvnfzjKadVi0rsVD2IzSY=;
 b=x2GZym/hh3TF4XZ77pSczQflbt6RfTUZ2oOHZz58YJ5GGvBEr1eWuwZbzu1ndEM9rb
 e7/iXfIUIDGJ630H6z8dgU6cDPjcAnrsTEfN6C+QSxGl6gAubO2oOl1Mgmb34DwvQAc6
 q+Isbv4sU8h11sZxpKKXcEjLOcNFYz8i1r/aqa4/dHKRW9ba/etnqGFYnT/TSoK6fhM4
 6zgYIfOS1xakG8rnQKv9KvaWSf3+qDQ4F8HaZRTCaryzIBrFGoiY7HBRz1lQGvVfQz1R
 SRneAs1ZaYI5uwU0Grqdz40DRW1a9hUO9eHgUHZ7m825UQxRYWkyoqjVmNBhsssgC+I5
 xRYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740064900; x=1740669700;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/6XkVQ4ezBwaXgU6HbYM+ncvnfzjKadVi0rsVD2IzSY=;
 b=Wj0tfOMpp0B10kZKqOP13Zk8+q/5RnlzVRjEEpQjZV17DDUAbNptipA4m0HiOQqwyx
 NGJ5sxmQieZ6gHqozlfsgztBuWXa+cJp/YUov2WHAvvcIM+BS2EEHoT1Jo0GWTyBwz6A
 pAI6tD9bIrBr3Y9K8NnNjqSoP2TUQXnCEjNVOY8REw2+6V3SRuh2CQuMVJTOI5/IzIL4
 kmQIkbRYHOqLDJvXTz25o16bDEA1qV14eNG0TXa3r0MhnZr0LsBajSq+G35aw02ZjtLy
 1xZvZ8qPwYdxHRpTaKQC00Bvw+y3or0R6NjYp3SJi9mp1tsVbYQkvT3DxaAxSKESfUax
 bMVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUftOYIpb2tnxgYkjwYkvrgkb0uilMITqRilOsvdzAUrrw1ddzLADKtPYOf75cZ5VHJ6mo9hs2d/Ul5@nongnu.org
X-Gm-Message-State: AOJu0YzIUP7Ny8hVFnEHIy51iZ0vrpOXCiQWbxWNwpq/VYVSI0C8vQgk
 XgQVkqGQMaLP/XVv48jaVanu5UYD3lCCvBEae06JxmJRLAlqDNHMwahB4xQkXENj7oITr6joNj+
 CmcKBId7UfhTewKofECF8PKqxw5/ZkucbRwAOBQ==
X-Gm-Gg: ASbGncsWkO36yTsrPVdI9g06EKaxbph5ykWKUIdzIXg/ofiPKTuDjM0T3cv3hOx7Gl+
 A6ltUX0BsSkQlaTTdvCzBk6wOIEGebuOC1w8ZtVHbxs1+xyriYIfYYFrM5xfS1dqGS9Bml8rd8A
 ==
X-Received: by 2002:a05:690c:62c3:b0:6ef:6536:bb96 with SMTP id
 00721157ae682-6fba56ba0demr82745397b3.10.1740064899848; Thu, 20 Feb 2025
 07:21:39 -0800 (PST)
MIME-Version: 1.0
References: <20250219184609.1839281-1-wuhaotsh@google.com>
 <20250219184609.1839281-4-wuhaotsh@google.com>
In-Reply-To: <20250219184609.1839281-4-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 Feb 2025 15:21:27 +0000
X-Gm-Features: AWEUYZnDUvb4Rt6qsD3pqVXAgzwvGBpV9nQeXjGCtbnKp5pp782u5ayFQ3E9Wx8
Message-ID: <CAFEAcA81OORsvepsy6BN5G3_UTaUjFtNLpp71TiukgJt4-S6LA@mail.gmail.com>
Subject: Re: [PATCH v5 03/17] hw/ssi: Make flash size a property in NPCM7XX FIU
To: Hao Wu <wuhaotsh@google.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, venture@google.com, 
 Avi.Fishman@nuvoton.com, kfting@nuvoton.com, hskinnemoen@google.com, 
 titusr@google.com, chli30@nuvoton.corp-partner.google.com, 
 pbonzini@redhat.com, jasowang@redhat.com, alistair@alistair23.me, 
 philmd@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: J9+dloQ3S/14

On Wed, 19 Feb 2025 at 18:46, Hao Wu <wuhaotsh@google.com> wrote:
>
> This allows different FIUs to have different flash sizes, useful
> in NPCM8XX which has multiple different sized FIU modules.
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> Reviewed-by: Philippe Mathieu-Daude <philmd@linaro.org>

> @@ -543,6 +554,7 @@ static const VMStateDescription vmstate_npcm7xx_fiu =
=3D {
>
>  static const Property npcm7xx_fiu_properties[] =3D {
>      DEFINE_PROP_INT32("cs-count", NPCM7xxFIUState, cs_count, 0),
> +    DEFINE_PROP_SIZE("flash-size", NPCM7xxFIUState, flash_size, 0),
>  };
>
>  static void npcm7xx_fiu_class_init(ObjectClass *klass, void *data)
> diff --git a/include/hw/ssi/npcm7xx_fiu.h b/include/hw/ssi/npcm7xx_fiu.h
> index a3a1704289..1785ea16f4 100644
> --- a/include/hw/ssi/npcm7xx_fiu.h
> +++ b/include/hw/ssi/npcm7xx_fiu.h
> @@ -60,6 +60,7 @@ struct NPCM7xxFIUState {
>      int32_t cs_count;
>      int32_t active_cs;
>      qemu_irq *cs_lines;
> +    size_t flash_size;
>      NPCM7xxFIUFlash *flash;
>
>      SSIBus *spi;

The field for a DEFINE_PROP_SIZE must be a uint64_t, or it
won't build on 32-bit hosts:

In file included from ../include/qemu/osdep.h:53,
                 from ../hw/ssi/npcm7xx_fiu.c:17:
../include/qemu/compiler.h:65:35: error: invalid operands to binary -
(have =E2=80=98uint64_t *=E2=80=99 {aka =E2=80=98long long unsigned int *=
=E2=80=99} and =E2=80=98size_t *=E2=80=99
{aka =E2=80=98unsigned int *=E2=80=99})
65 | #define type_check(t1,t2) ((t1*)0 - (t2*)0)
   |                                   ^
../include/hw/qdev-properties.h:71:15: note: in expansion of macro =E2=80=
=98type_check=E2=80=99
71 | + type_check(_type, typeof_field(_state, _field)), \
   |   ^~~~~~~~~~
../include/hw/qdev-properties.h:90:5: note: in expansion of macro =E2=80=98=
DEFINE_PROP=E2=80=99
90 | DEFINE_PROP(_name, _state, _field, _prop, _type, \
   | ^~~~~~~~~~~
../include/hw/qdev-properties.h:166:5: note: in expansion of macro
=E2=80=98DEFINE_PROP_UNSIGNED=E2=80=99
166 | DEFINE_PROP_UNSIGNED(_n, _s, _f, _d, qdev_prop_size, uint64_t)
    | ^~~~~~~~~~~~~~~~~~~~
../hw/ssi/npcm7xx_fiu.c:557:5: note: in expansion of macro =E2=80=98DEFINE_=
PROP_SIZE=E2=80=99
557 | DEFINE_PROP_SIZE("flash-size", NPCM7xxFIUState, flash_size, 0),
    | ^~~~~~~~~~~~~~~~

-- PMM
