Received: by 2002:a17:505:3f8c:b0:1be9:327d:8ee3 with SMTP id bm12csp465783njb;
        Wed, 31 Jul 2024 09:27:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWQ02SR2fxloWlHH+GNK8R41ZYuYr2ziRdnHpEhj2MMeILniw02157pxIsOcItxbHGbX9Z/Y86PASj7TDA4MIA2iYMMq5BH
X-Google-Smtp-Source: AGHT+IFfFU7AQZ8qIMqkl6ByVzW2vAsdjf0P1qtJdgYcpXBYCNxL7Xc96aK68u8Q7yzSefjZxp0w
X-Received: by 2002:a05:6358:2828:b0:1a2:5c3a:f0f4 with SMTP id e5c5f4694b2df-1adbeba30f9mr1658927655d.10.1722443244184;
        Wed, 31 Jul 2024 09:27:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722443244; cv=none;
        d=google.com; s=arc-20160816;
        b=ZOoRoI/HMmYPADSxfc4c/LpHsCAvpwVJcOw/N5P4Y6ysr1iKmFGY9KgdtqlOWXIke7
         f2r3m4AE+b8UuOL5cMVB7Ni8Eozm+oAg5UxJdoWim2OS9uG4QYjWpbnKlU2vZ1ugTlHf
         I2Irm7Hdk29ZewzDzy7kEVj+HDIgMStJ3pWrNtbKzGgTxJtBn/S36wDo12/ugPYb8qDk
         eXHamt7CfpM+es8ADcJ0rGrLizM7K/l/I8FcrloBRzg8tWt1P6Y4iV2DZlisfVesEmTd
         XMYZgmiNVhC0HCTDBpTlJueFefolx4/aAKfn+zT3MHnvnMPVe3XLWn3CWJ5nQqzfLycb
         8aHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=dTgzw8LbRLQQ+Ao5I6BNPM2fyUclgXHfYs/zqJ9BFA4=;
        fh=spbD1uAOw2hCQBb83uSlqZAKTOl6wvNX+k1rxl9UBCg=;
        b=HWHOZMOt/8yTGV1hZCzWZc7k1qqRfYwhsppULHJskHY9iyxpS/63ocCw8GeYtZ+1Z7
         oRxsDfH76GgtbhJBSD1x3aBUXB5DQAi7KR0t7fsaogoP/3e8DWVGH0x2ng5gW9XXEKjf
         KMylCLBf/um+wcR0VmIvDXC0HAgP+Aswf6bzaATCSavB8HQAkTAvUW5w3ubodmAOiLxV
         EB+If84JeDUk7GVXBubBr9sEn97IFNAaE35r9i2hKAWWg/TBABJsF5ehekHy0qb8F25N
         TiIzI3S4Z/T6VoXmVLuIE44vZkKFeczSofH7igCqtlnfV4i9QaqIM2FvhnR31H64CtUV
         Xaaw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aMa4o6rF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6bb3fb019fbsi154241956d6.507.2024.07.31.09.27.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 Jul 2024 09:27:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aMa4o6rF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sZCA8-0001PM-8w; Wed, 31 Jul 2024 12:26:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sZCA6-0001NT-GD
 for qemu-arm@nongnu.org; Wed, 31 Jul 2024 12:26:50 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sZCA4-0003YW-UI
 for qemu-arm@nongnu.org; Wed, 31 Jul 2024 12:26:50 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5a2a90243c9so7217473a12.0
 for <qemu-arm@nongnu.org>; Wed, 31 Jul 2024 09:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722443207; x=1723048007; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dTgzw8LbRLQQ+Ao5I6BNPM2fyUclgXHfYs/zqJ9BFA4=;
 b=aMa4o6rFEVjjSZj+NX9XoXWRT0FH5HXmjButlx/XmminlPeFL+JsKAy2sRsKIyyvHb
 vDKcMeCFEfer4ZH5Qi5K4ZwI77HydJPTOeRc7puFagfjalEHNKPKvSg1sbhz7Wd5wC4H
 INX0IcUTlSraeB4woLwnxsgncu7D5HPeGSOBAXV9zWuZUXF2AzE23RsTUS8pjx01StFn
 Fm8VKM6je2ewTOwTbkxNxcNox0xueHi6FBZNdmTLMgEt6SPCm3pQfMAwXEylOKnP+QoD
 WJ27Gb3Zeg0sk+0A3Yr9TvrEcqlaPr5VBnZNRFwFwd3GMCtPpIKQ2HwEdOzJlOaCKV+B
 8xZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722443207; x=1723048007;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dTgzw8LbRLQQ+Ao5I6BNPM2fyUclgXHfYs/zqJ9BFA4=;
 b=Tp8epuKTTL0ISPxcqWeqvGFDSVV9m5gQk0oCsZsz3yZrvbWSphAWax3OAaIKeg3qmY
 mN/bosuTPU+uALrquWeZ9fvnchqgTn+emiW+GVu1xXsa3C1jk+Lp8RNDaIMYyjfDzP28
 YHW04k1mBbv1IUKCKk5zz1G0jV6uaQUG8J3qa3NkB7vbyPwEbRxgXpOlo0oSHcdX3f6V
 qE6gUcvF+nGDWEL0lpswFJMNSXk3Qq+3W/8JHJQD1U3ahjB4U8b8JTtKf0O3MWHJe/tX
 E3IZFz+4bo9n8emKrrZEJolcDgq39x1Vqs0Wms4y5YfVF2bY4jO2xspbleVrNUHzp1qc
 N5yg==
X-Gm-Message-State: AOJu0Yzf9wLhybBB3dXnPhZwZZQ7XOOw68eecVDA1Xq/LCsqfQ3LAo6b
 0WMSfw4PfP5svhV3uyaJ1xZ6ZE5NDp45MmnYx3lEk61MNVexf7ZuS2AymyJqp50gozniv/BHrXV
 xpxIje3uIupNn/y7W5NrCCjGlEBATC7ay7iAsQWfY3nmEMu1p
X-Received: by 2002:a50:cd5b:0:b0:5a1:3b03:d0cb with SMTP id
 4fb4d7f45d1cf-5b0221f08aamr11163380a12.32.1722443206919; Wed, 31 Jul 2024
 09:26:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240730155819.2958924-1-peter.maydell@linaro.org>
In-Reply-To: <20240730155819.2958924-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 31 Jul 2024 17:26:35 +0100
Message-ID: <CAFEAcA8xiaKYm1KZt_GU8jwkRqv7ZbO+QdtQgj_oTj9G=XZJAA@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Handle denormals correctly for FMOPA
 (widening)
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
X-TUID: Cro3nSPywOJI

On Tue, 30 Jul 2024 at 16:58, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> The FMOPA (widening) SME instruction takes pairs of half-precision
> floating point values, widens them to single-precision, does a
> two-way dot product and accumulates the results into a
> single-precision destination.  We don't quite correctly handle the
> FPCR bits FZ and FZ16 which control flushing of denormal inputs and
> outputs.  This is because at the moment we pass a single float_status
> value to the helper function, which then uses that configuration for
> all the fp operations it does.  However, because the inputs to this
> operation are float16 and the outputs are float32 we need to use the
> fp_status_f16 for the float16 input widening but the normal fp_status
> for everything else.  Otherwise we will apply the flushing control
> FPCR.FZ16 to the 32-bit output rather than the FPCR.FZ control, and
> incorrectly flush a denormal output to zero when we should not (or
> vice-versa).
>
> Pass the CPU env to the sme_fmopa_h helper instead of an fp_status
> pointer, and have the helper pass an extra fp_status into the
> f16_dotadd() function so that we can use the right status for the
> right parts of this operation.
>
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

I just noticed that there's an associated bug in gitlab
and that we had a go at fixing the denormal-flushing of this
insn in commit 207d30b5fdb5 recently. So I'm adding a note

 (In commit 207d30b5fdb5b we tried to fix the FZ handling but
 didn't get it right, switching from "use FPCR.FZ for everything" to
 "use FPCR.FZ16 for everything".)

and

Fixes: 207d30b5fdb5 ("target/arm: Use FPST_F16 for SME FMOPA (widening)")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2373

to the commit message for this. (I've taken it into target-arm.next.)

thanks
-- PMM
