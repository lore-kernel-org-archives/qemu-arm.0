Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4441624ejc;
        Mon, 27 Feb 2023 01:22:55 -0800 (PST)
X-Google-Smtp-Source: AK7set94Wi6Z1u3dqVRnPPeh7379Kj+4cRWORx76xlUXJzH7/7pAki9axk3VWNrc51stO+dakXo3
X-Received: by 2002:ac8:5801:0:b0:3b9:a4c8:d57a with SMTP id g1-20020ac85801000000b003b9a4c8d57amr30628045qtg.32.1677489774868;
        Mon, 27 Feb 2023 01:22:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677489774; cv=none;
        d=google.com; s=arc-20160816;
        b=gwsrIB2RetGq8R3RQwTd/gpFNep9CRjB5IBfVtrgeXNBiZ/3dREwbMuop/CqdvifcB
         7LMi5//P6TLn6GO8WbCAzLUBYYppQrHx+nX2loyReOUpMZCnBMl9ADS9/lzbBMhrAj83
         IBikRuczHPkheqiTg7uZHzQdTeECdMweT55qJwh0AOwo7DQtr+S1Fr5ifmj7PmtxscFl
         Jrs0Eu6zmJnrFPsZmIUDfHA4xJyyIUyxhoymMc8dY538lQoXI/12WXM7e1zuy/sPNby7
         wp5ULhQsgUVjUgS/ThF0ZXp76FzDH8fLba1JCu2sfxwNwvTowmqcXXhx6F0fmwpgibed
         zSiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=UpyPaI0Bk3rfGe1RIKSbR32dt1ABynKKclL5PoVpIDA=;
        b=DwjmwQiDtsaIW+723qlOD3C/jtCLuRxaigTNKA+3rIj8AaPLzSA3tDAFlXYYVv3782
         hIVJKI0maOnswttCrAHUY8JYIuFuH/i0vBSyxL6+NJjSiZf+6b+lj2n/hQkDTzn2pkW9
         TPijk/5NWGWvnfqloJ+TdSbOPgvpVw9H59smgypXoKPr0TUKNXfhyfa045ff9G6mHQ++
         lA9J2cLbEPp0jsToF/wvwR0B9uRwbP7ZIBysfqXv76vcGMvGYn6+wgWyyaGan/yv+cjH
         kAOi3cDHX7n2duy3vjmfW6Y27OjItLESgNcaQwwl4IeHmjEj5o+aCDdykCQetxY/ftHh
         9qqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=Z0tGmntn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k13-20020ac85fcd000000b003ba137af908si5930201qta.372.2023.02.27.01.22.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Feb 2023 01:22:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=Z0tGmntn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWZiD-0006EG-5o; Mon, 27 Feb 2023 04:22:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1pWZi6-0006A6-7u; Mon, 27 Feb 2023 04:22:18 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1pWZi4-0005Bc-Q3; Mon, 27 Feb 2023 04:22:17 -0500
Received: by mail-pl1-x62b.google.com with SMTP id i10so6015764plr.9;
 Mon, 27 Feb 2023 01:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UpyPaI0Bk3rfGe1RIKSbR32dt1ABynKKclL5PoVpIDA=;
 b=Z0tGmntnWAt7IZ31QkzpfGubFF2vkJfZD1Wh5CcLocn8dxNwREMhJ5ng+3Dw1VNpo6
 aUv06drcwR1DLs81qHjx52pHz/iT1GyTUjLbfKsYrNuvICsBY7r3/xc7hwtzcSxC4HvF
 NO+QGewR74AayyXD3iDDLNrWlheK5EMctIaphDarQMSuEJC1rn7rqGNfcsujIWCKCpws
 UznqSQmDJFVXTvC5DARGpFhqwRug2kIEjCWvppcPwTIPMqmCBuHNnj6jUBWk7mGkEmfU
 yOQU+nbNzmov2KPNeskY/QNS+Gq9el7BxmrMbezPupjM/nxry5q3lggpsYjia7iUd8HG
 WYgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UpyPaI0Bk3rfGe1RIKSbR32dt1ABynKKclL5PoVpIDA=;
 b=ZYVhEx8uP86CNcCarEOI+qVP2Y/66m5eDiTxQ3Ppir2NmFdQB4qMXJ5d57f/w7Zod/
 MMQ0SN/Il19NhtK4cI78CAFF7I1gqW9yUzuoEoTiLT+KmFVRDoSKFf+0Yzx/WEPBs/91
 V9JUmGtEX2pzeoU9ZKNroMxLlsgLrolKnOsEMv61+FR0MfZ3O3esscp8Bxzky9EcOZDZ
 WpxTiFKd77fXbrj7uZXaPZ5lBEW+No/I8hcBIOElPRfgI4Ba6xSMhXmXg1BLvToHT7jR
 JQoVT2vkwJWXPxLR4qjFCCYMaTHaly+NHwp7P4G/kaXe6ooqVVQf5L0pAeHbF16idvOC
 NeCA==
X-Gm-Message-State: AO0yUKWB2Al7zUmyrRP2dy7oFS37HH/xuUoJfBhsrPecTWYnT7pz/xPK
 cC9Mv7teixj7yqefqVVqaOSpfUMi4bUEAx3mZJM=
X-Received: by 2002:a17:90a:9c2:b0:233:caec:5710 with SMTP id
 60-20020a17090a09c200b00233caec5710mr4310663pjo.3.1677489733982; Mon, 27 Feb
 2023 01:22:13 -0800 (PST)
MIME-Version: 1.0
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-64-richard.henderson@linaro.org>
In-Reply-To: <20230227054233.390271-64-richard.henderson@linaro.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Mon, 27 Feb 2023 01:22:02 -0800
Message-ID: <CAMo8BfJtfDJ_XSVmfk+0W5KUAKOFCwMEngyuD=eaaspe3MjkUQ@mail.gmail.com>
Subject: Re: [PATCH 63/70] target/xtensa: Tidy translate_clamps
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, kbastian@mail.uni-paderborn.de, 
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com, 
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-pl1-x62b.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=0.999,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: JnmA0gfHvnrt

On Sun, Feb 26, 2023 at 9:48=E2=80=AFPM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> All writes to arg[0].out; use tcg_constant_i32.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/xtensa/translate.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>

--=20
Thanks.
-- Max
