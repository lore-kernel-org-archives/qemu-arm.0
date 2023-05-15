Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp6640644ejq;
        Mon, 15 May 2023 09:44:20 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7fdjQ5tCPI0BUr63gQ/RWStpK5lwQwf1V6PzdonQtF08t3BQTbOWowIFe7pXtjMSYL4qNn
X-Received: by 2002:a05:6214:226d:b0:616:5a74:4574 with SMTP id gs13-20020a056214226d00b006165a744574mr57517123qvb.11.1684169059978;
        Mon, 15 May 2023 09:44:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684169059; cv=none;
        d=google.com; s=arc-20160816;
        b=iBm5GxJGrTdpvBThFSDmcAGKOdMK2D+SAz7ITHHgvJW8aI2jHbMhNCABc6igEYzhwu
         5FP7Vy10AE5MNqpnj8yqxNVQATtgP9F5ud0mOFuKKPE+q0fMjXzjyXXK4vPRha6gPS2e
         DHamVrXoRG6wsMiuZOMdti+vAlHY7ew+M+KAZJc4xA5WHEIlyhByRbiST7t6CRhm/FJ8
         YNFD9dtrqSz8jwPs6iYkRWOIaCMmZJOjsRocZrxCU7bs6a7nu7YvgMcGw0RaxoyVvlo3
         BP078JJ3dxNlyelMEBvSLGnjF4FHfS+6IXaq0hhuXOg1La7TT9tf0KsW+xomKIN9bkpy
         Rs5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=63Yb7nHAv3lSmSb76PeYAf67Cp2xqz80VbGD/4BRPZc=;
        b=dUJ9tdQ8AggMmfAujwv/CO2Q3txJtYw4J3QQWk/3tzR+zQMG/zzoCq1w7J9hmpP0ca
         OWZbQO3q1DT7SsUUzCf4mYvtvQkBHdlaQpQO7fnUaAYcGSV1GTbcp2Zh5YeGPnk1SprB
         Y8QWEOG0xDOu16PbOPEUXQBFn1irfHScrIBAP8xi/PSGonMpKcTUAWPUndpPPLWiEEjM
         cghVXTe42due82Nh0bnqY7mlRbaQ/0lKpqZe3swnEwwHn3dLgOR7Nge1ZP2DmDnQCW9g
         VN6jHHRGzHcylrlD6aLOoJy+zVrjFE8N2VSsvtHMnjlFdIBhVagoVV5b8R/un5qi4fV9
         4Qug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JcJVNUgr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 5-20020a0562140cc500b006210843fc68si10395950qvx.607.2023.05.15.09.44.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 May 2023 09:44:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JcJVNUgr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pybId-0008Od-Fv; Mon, 15 May 2023 12:43:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pybIb-0008ME-TK
 for qemu-arm@nongnu.org; Mon, 15 May 2023 12:43:49 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pybIa-0001pk-EZ
 for qemu-arm@nongnu.org; Mon, 15 May 2023 12:43:49 -0400
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-96b0235c10bso372849766b.3
 for <qemu-arm@nongnu.org>; Mon, 15 May 2023 09:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684169026; x=1686761026;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=63Yb7nHAv3lSmSb76PeYAf67Cp2xqz80VbGD/4BRPZc=;
 b=JcJVNUgrRQmOoYKpN8pCJFhIG0VOXtbtcVHsix5XTYtrVoYb+/vSCTJDAJhxyyMON3
 UOx59jfTjKDDKvncEpajh+fZJWOgyT+3YngN1hPusmuJcTXWHirHZliY7EG2scsg8BtF
 kk7ZzGpki9tUGlX1nAoausyUam4Ik6hkAljLcU2Pq6jnMDeO/rDB7XHTRhQTKJZLLSgR
 IaepEAgoCDaFAx8fUbljePA0RYAWUW6HIXBjnR4K2CxrmoTfHDQ6FvxMIsg5011zjQTV
 87epOOSP468GsesIW6w9TtTE7T1QU44dsEz/y5qJVPSGv2fFi182w0/s1g+Q6kR//FEa
 xxlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684169026; x=1686761026;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=63Yb7nHAv3lSmSb76PeYAf67Cp2xqz80VbGD/4BRPZc=;
 b=Vs5fIEym5z94dpVlqftszqsWyxc0YFh8MWOBYjDuYbvxlHCnxJI3G2lB0mTIWl2XKv
 qd2s3qlFp6rEOievXjvyxoZEcZ1tyYR9ENjUUlt9QMskaCKpYBlBJRr69UJYluOLTaMb
 /zVQox4HVkXQLOk0boYSrrYwSAEfEOPV+Jo/dOGQqr+p3fneo91lS2lsI4UxEioHR8ot
 rmIp9YitDICWsx3FpTDyI6Lg4n/FKRGhZWfpYCVB0CdkyTI21Q5326PeU7Sd0RYkNHVb
 Zb8P7krEFC8p4BX6gPw2eCabjdxxjbuON8eua0HqgzHihr5+tN31uyRHCjKTwZAzXH4z
 GV0A==
X-Gm-Message-State: AC+VfDxchPQnZDdR/xky7LStRIc4XppKuNBUhmrX4nN7X+kODUvYusum
 hA9e01r3LpBYWG1RAyU6pmqDdGIUdqNIhi9Aj1eFpg==
X-Received: by 2002:a17:907:97c8:b0:961:b0:3dfd with SMTP id
 js8-20020a17090797c800b0096100b03dfdmr33946915ejc.7.1684169026542; Mon, 15
 May 2023 09:43:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230515143313.734053-1-richard.henderson@linaro.org>
 <20230515143313.734053-3-richard.henderson@linaro.org>
In-Reply-To: <20230515143313.734053-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 May 2023 17:43:35 +0100
Message-ID: <CAFEAcA_KaYWE+Yh+vberVqk6hV=3R1Xm2V2Po+jrS54i6S1Quw@mail.gmail.com>
Subject: Re: [PATCH v5 02/54] accel/tcg: Honor atomicity of loads
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: ALwZQejIMD2o

On Mon, 15 May 2023 at 15:35, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Create ldst_atomicity.c.inc.
>
> Not required for user-only code loads, because we've ensured that
> the page is read-only before beginning to translate code.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v5: Dropped r-b because of MO_ATOM_* reorg
> ---





> +/**
> + * load_atom_2:
> + * @p: host address
> + * @memop: the full memory op
> + *
> + * Load 2 bytes from @p, honoring the atomicity of @memop.
> + */
> +static uint16_t load_atom_2(CPUArchState *env, uintptr_t ra,
> +                            void *pv, MemOp memop)
> +{
> +    uintptr_t pi = (uintptr_t)pv;
> +    int atmax;
> +
> +    if (likely((pi & 1) == 0)) {
> +        return load_atomic2(pv);
> +    }
> +    if (HAVE_al16_fast) {
> +        return load_atom_extract_al16_or_al8(pv, 2);
> +    }
> +
> +    atmax = required_atomicity(env, pi, memop);
> +    switch (atmax) {
> +    case MO_8:
> +        return lduw_he_p(pv);
> +    case MO_16:
> +        /* The only case remaining is MO_ATOM_WITHIN16. */
> +        if (!HAVE_al8_fast && (pi & 3) == 1) {
> +            /* Big or little endian, we want the middle two bytes. */
> +            return load_atomic4(pv - 1) >> 8;
> +        }
> +        if (unlikely((pi & 15) != 7)) {

Why is this the unlikely case ?

> +            return load_atom_extract_al8_or_exit(env, ra, pv, 2);
> +        }
> +        return load_atom_extract_al16_or_exit(env, ra, pv, 2);
> +    default:
> +        g_assert_not_reached();
> +    }
> +}

Either way,
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
