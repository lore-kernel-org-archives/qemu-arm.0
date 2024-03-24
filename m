Received: by 2002:a17:906:f85:b0:a47:c39e:cbe with SMTP id q5csp103273ejj;
        Sun, 24 Mar 2024 02:45:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWgUf/n2MbgwBRf26LW2L80ZTqNE6UyD9cU6k8hVtka4KMIrKyIrx4PFF1tDt4jL3JVwGI4zNr6AZ8EtgnTmKfmAu1qn/VV
X-Google-Smtp-Source: AGHT+IGCRYII3os7ABM8gQOFerc2873dQwa+AQkWJi34ErM8Z7HYNpQdBMXneduFjXFcGwIeddXJ
X-Received: by 2002:ac8:5a8c:0:b0:430:ed56:cb1b with SMTP id c12-20020ac85a8c000000b00430ed56cb1bmr4956264qtc.37.1711273507605;
        Sun, 24 Mar 2024 02:45:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711273507; cv=none;
        d=google.com; s=arc-20160816;
        b=EdkzqTF/dJbjScm1NTWC7AhR5w4W3pYdHO7dsSbTJalyoKM8tW7ug59zLDXijgMR6j
         /EVHoom9TnLQqx/HsbbgXZqwVGRQDxI0IEa4icSxwniI0Hlj9UagP5OLXXPHC6gexYKb
         29ISvOX2Pz4mPy2VBMTsgsbW07hhK+f5RX9KhOvhenZOqPcX5Nu2H+KQGd+QnW1bCqN/
         zzf8ti60tW9S67+HFFvWf52pALrI7Jk6DubekYRw4dbVQCyx6cy7qrP0I973PRxOSFA+
         hL1xl0RK66OzPXuSzmST701yJIOMAtsGSpGvJLtfe74nsj51LUg0P/6DKvNMV2AOfaho
         lEdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=YewijLU+TrbF4ce0hnwwHWP1g2DhzE8v1fnV4OZbtj0=;
        fh=vrEf+FtfgIouo2mmex+OnOtdaxv8XSryoCwIVLFzei4=;
        b=WcD5S8aMinbRbRjCsTsfl5JNjrrIyFJc1dZCVH4dyThYsmTcmHavikdyqmeQxZs+EH
         ghdI5WooimJ5pHXyGIVK02KIRQ2o7hZjivOlDH/Dn8SCzm0DmL0je7R29knBuuWz+3p1
         /s4qySB4Z2KcReWO15KDe+TgAImw48R6oHD1cE9PPwkazbmR0Up1YWdaFH4+UyGHn2/M
         gdoI+3wDPoT41H0F8eK4HLSJE/8/xucuI/LKkFeSYJlz//lAbOfjnsAmnxcAaJentmIs
         vexqrUfYI26y3WIWooQvWek5qhbukHynm6ZQraPaY6MRdRh2a+J+LlCBJJB4yY6hHtZk
         y9yg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@mail.uni-paderborn.de header.s=20170601 header.b=PsgHL45w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=uni-paderborn.de
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fg12-20020a05622a580c00b0043140520905si2759779qtb.363.2024.03.24.02.45.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 24 Mar 2024 02:45:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@mail.uni-paderborn.de header.s=20170601 header.b=PsgHL45w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=uni-paderborn.de
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1roKPO-0006FB-17; Sun, 24 Mar 2024 05:44:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1roKPK-0006DW-Mx; Sun, 24 Mar 2024 05:44:50 -0400
Received: from shirlock.uni-paderborn.de ([2001:638:502:c003::15])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1roKPI-0006lf-VF; Sun, 24 Mar 2024 05:44:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mail.uni-paderborn.de; s=20170601; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YewijLU+TrbF4ce0hnwwHWP1g2DhzE8v1fnV4OZbtj0=; b=PsgHL45whyT9ykx1huJZnoCEw7
 VXPgOIUzCr/lat/Y4K/HKymN87q/0p0HgX0az69o00lOD6znPpW8BAeP42pDg9BTwmdAqX2tq/fBQ
 dNsTZMz/vEFUgeoA0CAGZL28hQirCVdnHyNQU533It3gUtkkrZvsFcXgb6j3a2ocwxGQ=;
Date: Sun, 24 Mar 2024 10:44:41 +0100
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, Anton Johansson <anjo@rev.ng>
Subject: Re: [PATCH-for-9.1 25/27] target/tricore: Convert to
 TCGCPUOps::get_cpu_state()
Message-ID: <bqsi6kbga52jrllbqzgipknruhkeypbyelxa4kpmz72iukqqry@ubjt2rpwm325>
References: <20240319154258.71206-1-philmd@linaro.org>
 <20240319154258.71206-26-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240319154258.71206-26-philmd@linaro.org>
X-IMT-rspamd-score: -10
X-IMT-Spam-Score: 0.0 ()
X-PMX-Version: 6.4.9.2830568, Antispam-Engine: 2.7.2.2107409,
 Antispam-Data: 2024.1.27.235115, AntiVirus-Engine: 6.0.2,
 AntiVirus-Data: 2024.1.26.602001
X-Sophos-SenderHistory: ip=79.202.220.76, fs=67, da=198882548, mc=1, sc=0, hc=1,
 sp=0, fso=67, re=0, sd=0, hd=0
X-IMT-Authenticated-Sender: kbastian@UNI-PADERBORN.DE
Received-SPF: pass client-ip=2001:638:502:c003::15;
 envelope-from=kbastian@mail.uni-paderborn.de; helo=shirlock.uni-paderborn.de
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: TpTLrx5p8SlW

On Tue, Mar 19, 2024 at 04:42:54PM +0100, Philippe Mathieu-Daudé wrote:
> Convert cpu_get_tb_cpu_state() to TCGCPUOps::get_cpu_state().
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  target/tricore/cpu.h | 12 ------------
>  target/tricore/cpu.c | 13 +++++++++++++
>  2 files changed, 13 insertions(+), 12 deletions(-)

Reviewed-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

Cheers,
Bastian
