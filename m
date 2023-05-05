Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp322307ejq;
        Fri, 5 May 2023 03:46:30 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4o4cA3K6Lzw9tBKCi+DsqaT7ARcUnME4ZURTts9B5Q0bjydyBGkb8JtR0JBHqoVCPkAAXC
X-Received: by 2002:a05:6214:408:b0:5dd:b986:b44 with SMTP id z8-20020a056214040800b005ddb9860b44mr1728115qvx.6.1683283589747;
        Fri, 05 May 2023 03:46:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683283589; cv=none;
        d=google.com; s=arc-20160816;
        b=lKKQ0zfnwLHDeAaEIJ34xohTjzWiJGrBTqYAf3VeyyQj/PxpkeoumR9wZUoGQRL4he
         od4xQHm1prhtXehjmPxWWiqUYVTORij4UQtTQDPSycWq/lFp8zMZtSrv1OjrLVlxrx5r
         Xd49Og9OFbHwrsYsQCN3EgkX0N8aJh2PnoIYbDS6v6hjv++N0bjJOscAOdxRkBuLl5y2
         wbmpO3P/7FECzytp4X96wr59gQ4gQTLpoOKO/vfS2vI7sN6Tuv+fjg+EokTtN6dPueJi
         MenCFzcSpIrAW/uldY6ekl+6vADb+omT4zcT7z2h/rXMIF1J9LSg1eehq5RM+7oLayq6
         Icag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=E7xonDZGDCeV3oLF8XSfgab3ZnmrIzSTPzUuiuuyqYM=;
        b=mWvnTUUtoKxBt2TIY9grzGoYMqC/pfqNCqeGRDr28QD5FJUdjt9athGfEpNEB/Said
         vIXqaf8Ng3WoQrU4JtX8R2Fq3pflBqcBOLPY4MKXPbM+eneJyrPcSeDfCxb2bijgn7n3
         ivC5/G6qbT5Xh+4D9TdKbBQdFT279dGxu15lRpRwiXbg2+zvnzzo/ly2Tua9Awa5C3OD
         5UKTZQT1aPp7Jr42hn0HfpEx3GTzwyUq01ShVm3EyCOUV33HwzVaA5RzQU8Ws+EeuPAa
         MxyWPTgtU91odIVRsGyiNcD6O7IAQyVs9W/X61K0dKShHc/CH+dub6XmRsbdKzfSBMzU
         yV6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zu94Bxhb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b13-20020a05620a118d00b0074e11d2a024si555515qkk.338.2023.05.05.03.46.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 May 2023 03:46:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zu94Bxhb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1puswo-0004AE-0y; Fri, 05 May 2023 06:45:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puswm-000496-4h
 for qemu-arm@nongnu.org; Fri, 05 May 2023 06:45:56 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puswj-00083W-DW
 for qemu-arm@nongnu.org; Fri, 05 May 2023 06:45:55 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-50bc0117683so2865644a12.1
 for <qemu-arm@nongnu.org>; Fri, 05 May 2023 03:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683283551; x=1685875551;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E7xonDZGDCeV3oLF8XSfgab3ZnmrIzSTPzUuiuuyqYM=;
 b=zu94BxhbU3+mUH/3bX0rj42w5l+H0JyLnTrAh7man231kBQsDRDWj7/gwluGyI0Ssf
 6jhMSpAVZYNmj/DkAt1s/kcWDjVnbPnUG7of+dMy5VGaF3MdGnj7tgFtLdpmfNcmOaBH
 NxkO18ZCwaxkdq30/vaC5oyJopeZZxNiqGtkMT1yBf/YCIKKHgG09SK5/4J82dLFfMKL
 lBkOHzRE3dm85NKNkcKhLuBrE9aeVz2bO6svPXWGvJHqMROPvQzqqmxHlOn5iTCLpgRZ
 rByTvf7bx3RC415MUJybWKyHDClLrOC/XzvIJ4SjNvwSHLHnqLBU/0Tmd5rHbSQLdXUD
 TXkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683283551; x=1685875551;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E7xonDZGDCeV3oLF8XSfgab3ZnmrIzSTPzUuiuuyqYM=;
 b=RQZbxkQ8JsNLG+kRwQb58ro7iRsYatSRS/v1g9g1s/PNBOHGY9lpRZNes/jZwDcgzp
 W6qyexuPocfN74i0GX/8ipzDJQOyeY/OG/qctNHyERDarLL7oKWYdxZ7uG+GCC1EGhmH
 5BmntU1qsDN0oi/mZZdatZRaq3f6ObA352rdd+wrz8/wgSXxieA3HIGBwnGr6G4bWzh8
 26rf7xYt9cx9uX22nY8BDpP4DmgP2IshoBtHSsYjLybnldoQSMKCh0K9E1Aa+ZdAPaUR
 9RqAjYdYAs5ykTDMiG2p8a8wUCZbf3bFZsngGol3QC/bHJ3Z6Xr9qUdyqeIxbe2fqOqy
 c+sw==
X-Gm-Message-State: AC+VfDyB3zhvziCQaq3DUeCEAmYDyhmHiZmz3V9S2NfHFdD9X4W3f1a9
 IgjFhweAtx99cn06URCFAlOeHjWZ2LpVnWSfnIHieg==
X-Received: by 2002:aa7:d355:0:b0:50b:d5d1:7409 with SMTP id
 m21-20020aa7d355000000b0050bd5d17409mr911227edr.23.1683283551476; Fri, 05 May
 2023 03:45:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-21-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-21-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 11:45:40 +0100
Message-ID: <CAFEAcA9finDiFy5c3iZvUNuBdc=3GSp7jAUk6_gfk7=0dVFUsA@mail.gmail.com>
Subject: Re: [PATCH v4 20/57] tcg: Introduce TCG_OPF_TYPE_MASK
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
X-TUID: 5U6SANfcOOBC

On Wed, 3 May 2023 at 08:09, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Reorg TCG_OPF_64BIT and TCG_OPF_VECTOR into a two-bit field so
> that we can add TCG_OPF_128BIT without requiring another bit.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
