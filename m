Received: by 2002:a17:906:494e:b0:982:8c08:340e with SMTP id f14csp2811812ejt;
        Mon, 19 Jun 2023 06:30:59 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5B4susG2I5/HWnC2qyDN+4QX6pWq95PnSyS5txmGQlcuXuANaLDBEz936iIQq0NNDpgpYV
X-Received: by 2002:a05:622a:148e:b0:3f9:d266:7be0 with SMTP id t14-20020a05622a148e00b003f9d2667be0mr12159193qtx.23.1687181459389;
        Mon, 19 Jun 2023 06:30:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687181459; cv=none;
        d=google.com; s=arc-20160816;
        b=OswRH1qVjipSqNloe3c+3w6wrE4pAcl+KpAdD4b7wuo3Hj1WkDi6M/w/YgT/qpNnt9
         qCabteXHiCqs0nORS7hTmnHv4xATm9M9lwFKUVkLmxFkctIr90UexyftTzMDYJAsfm46
         C2mAjcSglys04wG1qGtTNFUbVHACX6iEfhY6Q3i7VY5SPyATn27jFfEt3tHbTusFSARA
         UGk/lwsgS2VFjNa8Cauk9ZCYp6Bady6+f8LNZ23Nh8g2E5tRmP9C9lUXFDf8VxoZxSaS
         uTBFK/RtqfpuHckbVDuQaIdL3kXDJiGRt0eXaUWGYOAGu13QGQufG6webkdsVN01J0Bu
         m3rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=AZupHGQB0s4VQQIw/O1fdK78rXvz8PP/sVJ/YPb0+Eo=;
        b=CsvAcEw/wDemsSR+y9OfxJ4rMDSrecUuIBI/w3oKBu3YjQUTm2pCyxa023vlAwvenG
         u3Daq87/L/xo0HcEHVBjjTJsh22o51nz9cQIvXOUEg2efnnDPQBb3mw2jncsO9HHsslk
         IrAPZaMdZvWzB4vDaTvNWq/pQ8DTaCtqHyIKQuy6z8kvc0c3MHE1Ydj/9bJSiTvAOSYv
         M8fWnl2w0Ey6UXUfNUPiL1O5bDmrcBuv7pNWstAdeKroz3m6oE6ekCyPzO9GZ/2dlhTK
         Y0A/3AXhPjp/ApFO/d2Jp4HYg+Ec12dgI5+uKFa1wq1fjOSJrJjv6Yif+I7o/k35GwQC
         dS0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KPQXULVO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t10-20020a05622a180a00b003f6b3fed3e8si13308194qtc.416.2023.06.19.06.30.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Jun 2023 06:30:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KPQXULVO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qBEy5-0003lp-O6; Mon, 19 Jun 2023 09:30:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qBEy0-0003ii-Ke
 for qemu-arm@nongnu.org; Mon, 19 Jun 2023 09:30:48 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qBExy-0001Xk-8k
 for qemu-arm@nongnu.org; Mon, 19 Jun 2023 09:30:48 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-518b69d5b5dso5016111a12.1
 for <qemu-arm@nongnu.org>; Mon, 19 Jun 2023 06:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687181444; x=1689773444;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AZupHGQB0s4VQQIw/O1fdK78rXvz8PP/sVJ/YPb0+Eo=;
 b=KPQXULVOrbgQ78lJpiyTOnDojuKcOOmNcnly4X0iRAChVhMzgurD9h8hy6X38yykog
 /NbFJ03D373z4aT8kvlv6JV3ZAn0RixuMvX6sFamwkSaH1En+5AgDYHogBtjkjBUL7kO
 2wvki7rWAej58frlLy5QIa0vT9qesesho0sY86b5ldBdalfWVhUj7J120lxCLO2kb17s
 wMRmIS491icBVjzRD7Ua1tCWC8VoxEpSYgLWJGrXe86a8SRf+zvMmk2M43Twxfnq8wmn
 Yp97ncq1fDo9NpWOoN34w3Z9oX8GQBZEcrV+q8BFzh5xnwp/jswLvQlg9E8IPZqgbX9B
 VUxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687181444; x=1689773444;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AZupHGQB0s4VQQIw/O1fdK78rXvz8PP/sVJ/YPb0+Eo=;
 b=jKCIuQiZGcDzC3b8LRVUEWzt1dTV5TwvACDi1SznWSwWrd1WsuYY1NcoKX4yL6SVIu
 lnqYlPlQgS1tXDlqzXSJzMYuhH2NQUFccqcOISQfLWD2lAyoTtpuNH4T5z/dmeXXmml1
 F31cBqYFxXBUDQkFk9UmR6fdAeKTtIQEMLML5hnxHDEOeysWbQGM/jgauPk4OjevVXFB
 gjbEl7dHS6A5Hxw92jonoOm8touX+y7mCYbO4IJ51yrVg4OwL1TaLOnARn+YL1pUV/EO
 7QJVo6KPJOcqxZf9Tung6K36RoiPIa3U7SNF7FaCGLXmRs90QEFANWLgLfEpwB1MDfp6
 svfw==
X-Gm-Message-State: AC+VfDyzfXaMqxgI66T6FrbpOwE39DPQJwxdob2SBlv5zdReHqby/hQM
 /d1Gv0vj1RS3JZpegw050lx7YfjIwbyhECOxyR50KBUKnEShuF8x
X-Received: by 2002:aa7:d65a:0:b0:51a:2ca4:5758 with SMTP id
 v26-20020aa7d65a000000b0051a2ca45758mr6557733edr.8.1687181444351; Mon, 19 Jun
 2023 06:30:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230612223456.33824-1-philmd@linaro.org>
 <20230612223456.33824-5-philmd@linaro.org>
In-Reply-To: <20230612223456.33824-5-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Jun 2023 14:30:33 +0100
Message-ID: <CAFEAcA8_uZ7kLbHP_Lm755RwJYWurQez5fhRiFL_=7s+JzrrKA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 4/4] hw/misc/bcm2835_property: Handle CORE_CLK_ID
 firmware property
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Sergey Kambalin <sergey.kambalin@auriga.com>,
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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
X-TUID: 8T0yK87pOVql

On Mon, 12 Jun 2023 at 23:35, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> From: Sergey Kambalin <sergey.kambalin@auriga.com>
>
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
> Message-Id: <20230531155258.8361-1-sergey.kambalin@auriga.com>
> [PMD: Split from bigger patch: 3/4]
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
> TOCHECK: seems raspi3-specific freq. Use a per-soc freq? Good enough for =
now?

Seems like 'good enough for now' to me. We can add a comment:

+/*
+ * TODO: this is really SoC-specific; we might want to
+ * set it per-SoC if it turns out any guests care.
+ */

-- PMM
