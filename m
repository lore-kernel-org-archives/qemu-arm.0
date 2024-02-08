Received: by 2002:a17:906:c945:b0:a38:6d10:c5dd with SMTP id fw5csp218697ejb;
        Thu, 8 Feb 2024 08:27:40 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU/sT1IFrY+4Pvq4Nox/Qjg/Z2gWZqvsxsGSk0VOWplP6MjKmbdnMsihFBEVRfCVu6/qljMPHwQ60gjDOy+YIeGDAeA6uDU
X-Google-Smtp-Source: AGHT+IEFBM5tkIN8cIrgcTsCiYVej9LgcuD6sl2qq4CvNbXYDorIeMvF2hem1PNr5wS/KEzZS+gD
X-Received: by 2002:a05:620a:468a:b0:785:ae64:2ad5 with SMTP id bq10-20020a05620a468a00b00785ae642ad5mr1163223qkb.52.1707409660695;
        Thu, 08 Feb 2024 08:27:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707409660; cv=none;
        d=google.com; s=arc-20160816;
        b=EOFm+feFMdQMyLKJ42Tb6FBFUXnQX8pr43ZdF9jEtV+0KggQq0zePgM3tYp980pWUa
         /tlzCpRd9piVHIAXBYKtG3uzWzUdGKL09VJYv2HRDW4OlajXKL5BEpjkPuu90Wpaymwu
         6fbKRFUinfQQZMKkiLDS1KcoblBiTJ0zL6GJPDxNdZUExnSS6a5zUCQ83X5KkGJcXQgJ
         Zu/GJpxAfnvql7ZCP2DmDtZ+r6n0iBoc9FqH6qdb1d1U3ud7OVkCZECgbiVSmp3RUIl+
         5F/F0uB2RXI2Zv7d4yOnC5+w6h4BxBffzwglb6zQlGFhclGiIRmNRfnchNxwlZy9fnQ2
         5yGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=ib0zpQvZqce9hgQ2qOlvF0FSGeNVQok9J1UbRHD0HBc=;
        fh=nQBJVXCAOjcZ2JITcLPnOSPhP+yGw6ideMF+cKf2gbI=;
        b=TVyMZk8BmT8Qkpho9xDP44owzkRmZGr8gazDV8eV7I2jIMogAuhW6FT33tf5c/QMRT
         EQ4muMdujOSrEb567DRfhUu09fDaqOfK2vBBVgXJ7FIK8K6T0nY5d5koP+cJZ1F7qlK9
         pGD2bd8fgr5YWb1f/2/G04UIJljHYfLPBpDcimC1vermA30AAIM7rEXVe8nM3WTubUEy
         B9fxEyrB047kOG3Bu+pYKlTmFMnlNGWjRwGXNGnGBBXFNelD98T7iayhl1tvokx3q9gH
         i7IFgkt6mdwoqHLAMLkZC3V9H5dqgsxKfdDBu78QrRAY9HqE+xP4oE2fOi2+PinTKFCQ
         MEIg==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e8PdnSxR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=1; AJvYcCVMfKToSosJ55UBXnXo7i76C0zbsnJbXh1rlz5YCYZ/Yh7aJhh1PzCHKTbEEGurEkc6/maMZPRF80mZbzt7CbXIP5KXnwUH
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y17-20020a05620a44d100b007858abfed78si358859qkp.18.2024.02.08.08.27.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Feb 2024 08:27:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e8PdnSxR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rY7FS-0007S3-J1; Thu, 08 Feb 2024 11:27:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rY7FR-0007Ri-KU
 for qemu-arm@nongnu.org; Thu, 08 Feb 2024 11:27:37 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rY7FQ-0004pD-3i
 for qemu-arm@nongnu.org; Thu, 08 Feb 2024 11:27:37 -0500
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5601eb97b29so107688a12.0
 for <qemu-arm@nongnu.org>; Thu, 08 Feb 2024 08:27:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707409654; x=1708014454; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ib0zpQvZqce9hgQ2qOlvF0FSGeNVQok9J1UbRHD0HBc=;
 b=e8PdnSxRjY3SVVBMpcTqcD2Aaqccs3rcMagxnArEWOdKsI83Q+Us9b23QkXJ1c2k0v
 wHxIRM2yBaxN4dZbeCvJ2vI9zwNl2rbmzxq2AIQJekO8mnD/zTanG6PdEYjLFRfW7Sr9
 SommZE8lsC4SZjJhCZ6miWr/fyGEoQlWhH6INgiM27WafEom/sysKE71LZRFFr59GVQv
 M6AwQ2QBQZFt82oecr1FKBXOC6rmE9GmAGEDPzbMuL7kYvErXHzCaIlT0StCCZzAgX9I
 xtZoMSvYB3qsSSrae5f++RAcOuYk3UiLvcgsHE/yz7EoP5uaXAvcMxvjgcwaZTfabGF/
 li8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707409654; x=1708014454;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ib0zpQvZqce9hgQ2qOlvF0FSGeNVQok9J1UbRHD0HBc=;
 b=LlpdQrYdMqTWBZT92LQXzf3aRiXIVMuaOHxLAS020+JriPnKTLZu4R+FAfMYSpcuDo
 m2XddaEywAY7QPLDVD7TKoBLRG0uo9rnZsrVbvG1ykSN4UVprPp6NYcmXV2g4FEHmJ8p
 dGMktc/S9IPrj9NWIs/nQN8doIXfaObR/YvDXqLi13nDXt7+uQD/5jvI5i9apC5Tx/yV
 JuuQAe7Oj5/V7Rv7UIgdNVZwd2jl9H65ANnjkhkBCQRcHC8vFL26141jFNA5Us6nfWW/
 CvfqDey/CguG2llXtjNbceVtDVzX9nzrQSyQGJaubQvyoelatIac/iUa7ifD4k4vFPl5
 EgKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/wDiAYXQ3mxOYT9kO0Ga+QWjaB7AlUDDRCV6Re2at2OtIUZ2ldonZig6kd/n8uu1O/t7HyNslXzjKdAiiGmXUtk9C
X-Gm-Message-State: AOJu0YyO8YhmwNyZ7/MCskpzJNLIuF4yegH3fGs8BruAm9t08I/dyk6Z
 YCtvni60Jjsbn/dCB49dmU1SGIRdaKK/MbzdqQOdBOrXcyWr84EIrPNlCdtGnZKYeP4nO1zZlYc
 EKlzsxdUnjIKZSu+ZelfG7K0e2rMdHqiSUrvoEg==
X-Received: by 2002:aa7:d982:0:b0:560:2c15:38b9 with SMTP id
 u2-20020aa7d982000000b005602c1538b9mr65546eds.4.1707409654589; Thu, 08 Feb
 2024 08:27:34 -0800 (PST)
MIME-Version: 1.0
References: <20240207025210.8837-1-richard.henderson@linaro.org>
In-Reply-To: <20240207025210.8837-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Feb 2024 16:27:23 +0000
Message-ID: <CAFEAcA-ogsfj7+3Xft4k-0YmAuTqO0qpC5FWqdGE3ZdXuo4z1g@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] target/arm: assorted mte fixes
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, gustavo.romero@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
X-TUID: SENgSSt0j3v6

On Wed, 7 Feb 2024 at 02:52, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Changes for v3:
>   - As if /sys/devices/system/cpu/cpu<N>/mte_tcf_preferred is "sync".
>   - Fix do_st_zpa as well as do_ld_zpa.  Oops.
>
> Because of the above, I dropped Gustavo's t-b.
>
>
> r~
>
>
> Richard Henderson (6):
>   linux-user/aarch64: Choose SYNC as the preferred MTE mode
>   target/arm: Fix nregs computation in do_{ld,st}_zpa
>   target/arm: Adjust and validate mtedesc sizem1
>   target/arm: Split out make_svemte_desc
>   target/arm: Handle mte in do_ldrq, do_ldro
>   target/arm: Fix SVE/SME gross MTE suppression checks



Applied to target-arm.next, thanks.

-- PMM
