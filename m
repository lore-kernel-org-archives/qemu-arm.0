Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp1252074njb;
        Tue, 10 Sep 2024 05:28:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWWfcK2WZtNsKRJ3o0SblY2iG96dItk3dsu8RmXFAoqnzjnAVvnX2ooMKdtv9QDf2weZOMo5gKxTDX9Qw==@linaro.org
X-Google-Smtp-Source: AGHT+IEaD2WFmRujQj/zdl5F1HBZMZby254Oo+f4SPbM55sCw8Kmjyg7Cfyab/LcBxiieZpC2rA8
X-Received: by 2002:a05:622a:10a:b0:458:4c86:4564 with SMTP id d75a77b69052e-4584c86477cmr1130721cf.37.1725971303330;
        Tue, 10 Sep 2024 05:28:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725971303; cv=none;
        d=google.com; s=arc-20240605;
        b=QabX/VGou0IIHwpTok2j/5L9IyEEAAvm6Sn9+PdWQMQxHBBHiEkU4rJ2wJA/tqksV6
         VVqkRolc1pOPYE4rX/zQi3c4MmCtmlx0DM9dpzbxap0xUv/Avpsl19ef6ku6buj3H0nq
         e+K/1iy7ysT6zhhFCmUWIRj6ARdF7/W7uxkCFctu5/ZlRwCFbetMzGN0JBvCe9P+1dNt
         09C3v/ezc5tcc2zgKSu//Eq1TUTkDceexozu2CJoCYU8HCR99W49Nh3drqugQbXjZfAE
         XBYZ83sxusk8KuK3UHPDPTyd5s5GHlbmlKGW7GjC6Wvedv/cvBivN7fMvpy3O2HfU8LW
         hQDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=csZbleePHxJONMX3qcR5VjzZHLLajIZJjFR8BbSwToM=;
        fh=RA1WP2YXnKv466Lcor2lYPCUAXYIwror/ZANp+JubJY=;
        b=JPGVjZ2cfzwwYVeCrU2zWiaM1+0W1lktUkyHCJWUa2vUSQAG1ilQqQBFOuT9aoZrhO
         FkaVEdv1J0cJUQqL8CHA2xJcGKcJmxzLnuq3JOqpg3J0yR5RXzizG3jtVlfeY8B7uCzD
         kmG1Ein0ASQW6XUe1lkncVaqtOD650NRKKtkKIaKDRC3EVO3q+iVrbDu6VTXyjaIq1Hy
         l7mT1HueTugYTfj+2GnGPUF5oWfjj7ZR/xqHjeSuU+8CUIkAvlLwKQKPeTcRXkFjEa30
         pBIlwRRwessNLbTjs2tSRdFz3RoCezrzGKwA0kNAokbQPoFoZvRDNpyq5rINOYZiNL6r
         Gfpg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="r19f3v/E";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45822f82eb9si75545301cf.514.2024.09.10.05.28.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Sep 2024 05:28:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="r19f3v/E";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1snzyj-0005Vg-E9; Tue, 10 Sep 2024 08:28:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1snzyR-0004ew-Aa
 for qemu-devel@nongnu.org; Tue, 10 Sep 2024 08:27:59 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1snzyO-0003jm-NC
 for qemu-devel@nongnu.org; Tue, 10 Sep 2024 08:27:59 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-42cb1758e41so26298215e9.1
 for <qemu-devel@nongnu.org>; Tue, 10 Sep 2024 05:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725971275; x=1726576075; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=csZbleePHxJONMX3qcR5VjzZHLLajIZJjFR8BbSwToM=;
 b=r19f3v/Ei4LnWUV5iF0+JrqN84c+DqofZPotWoR5BTspCfQDEHgxEdZTIRqxZo2ylr
 XhgGQrZouNu7USCqmNEyZUIZXV+XNZO5gRI1N3DaZm2OIr2AJhfvaJHYP1Rhy3Tn0uHn
 gWX5zAstCCcRGB2PXwJdpldlelDnVLMij6PLvikzEjuttALiQ/kKl/ZEG5y81PAk3HNZ
 hFl9KWPBNw7TMIW2zf/3HJxz+/bng/0mTu7GbONr1z0bR5dx1T/TQ05dAW5iz9DJrbY2
 zH0KB0MK3T3iegOHrZM9RWys8t8foQCP910zvUIbkJ5xwHYuBjk6KYW6CrjMjHgc8AMd
 JLDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725971275; x=1726576075;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=csZbleePHxJONMX3qcR5VjzZHLLajIZJjFR8BbSwToM=;
 b=uku6CNHdjRv6Y7hwh/fU1NbzW02NqLIkP9jJ5uEjvgNilw6/cHgiFM1LsS/RVsTgfC
 1WKBMtQjGKxCYnk3Ub7SOk5zvmBVQmZPTS+TcLZgjuh7QE4Wmhf0omxKTdpT+LPNGUKD
 9lrbyVZXL10asr3jmSnkD51c7uqlxMkNf8JZ7WW2MNkBLjMp0DYRtXQE4wdbIbLCFH02
 u71UFnj3j2QLIG6x01FIRkV7YoTGKyFlHqvpysOBqAveLf6/5Ck4e8zNLPpNcK9dTfWb
 UwJ0EdKaVKr9w1MQd5W7QA2+axgMfSrObQDNH51VJbhnBc5NknpOqo4VCd8QZgWuCkFc
 7UHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2wVJe84uqBONkWNRepAwPjrAn7+/gUsavnVbCpqGuzGWJ3DBMMw2kD7vNku8b52Sq2lmDQTaTG73I@nongnu.org
X-Gm-Message-State: AOJu0Yz7b8uA0kykgo6RKrT50lkbuSTOBsAe6gyXWqydfJpQAT6G5Afd
 ViYPChmSavT9dNbGmG+Km5fARahSOkvkQFZKPfOFU/srNi30x9gLh76QN/XxtksDS3jNwKR/DaA
 rTDczXBJdJOBKFQaIT/EimVAkBgoVrPFEnl8xhd4FVHLU3W/n
X-Received: by 2002:a5d:4fca:0:b0:374:c712:507a with SMTP id
 ffacd0b85a97d-37894a04c55mr5343716f8f.32.1725971274992; Tue, 10 Sep 2024
 05:27:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240909162240.647173-1-richard.henderson@linaro.org>
 <20240909162240.647173-13-richard.henderson@linaro.org>
 <678932dd-02e3-488d-8cb1-6f3d37c112ab@linaro.org>
In-Reply-To: <678932dd-02e3-488d-8cb1-6f3d37c112ab@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Sep 2024 13:27:44 +0100
Message-ID: <CAFEAcA9s1FDB_rFoo6VrcCh_bdL4-sSnzGALSv_+MKCTR9WNgA@mail.gmail.com>
Subject: Re: [PATCH v2 12/29] target/arm: Convert FMOVI (scalar,
 immediate) to decodetree
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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
X-TUID: Y6Fvds7T4MPX

On Mon, 9 Sept 2024 at 23:24, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> On 9/9/24 18:22, Richard Henderson wrote:
> > Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>
> I wonder, maybe you mispasted my previous R-b tags
> with Peter's?
> https://lore.kernel.org/qemu-devel/37096dc8-7827-4a4c-a27b-4f8343aa9c6c@l=
inaro.org/

I gave the whole of the v1 series an r-by at the
cover-letter level:
https://lore.kernel.org/qemu-devel/CAFEAcA8vJxUUHWA_nUF-810fDhYyPggtc=3DHGF=
dp0QUa5segB=3DA@mail.gmail.com/

-- PMM
