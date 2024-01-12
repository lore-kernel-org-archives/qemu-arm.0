Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp2540524ejs;
        Fri, 12 Jan 2024 10:14:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IElDIrz6nrYIqHuVUNN/gu07HKrzXQDFWWpkKgdX37sS/dz4F/GGFx2cgskWS+d0Tl0ZZiK
X-Received: by 2002:ac8:5993:0:b0:429:d291:5396 with SMTP id e19-20020ac85993000000b00429d2915396mr896675qte.80.1705083250621;
        Fri, 12 Jan 2024 10:14:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705083250; cv=none;
        d=google.com; s=arc-20160816;
        b=PhZ8fTAr20cP5JkUNQQetKw4oFleadLIe7OZaSysf691cMncAkOMlIq0KVV2wJLkOD
         hatFv8Dl3AdMVt4zpwmgFKy5WifA6tZ/EzBSGFkvk794UgDoVzoGtGLYzg5sqEusfKfN
         RjppzI77Me2BzJ9Thrd5LGFB0TCV6niqOnUiNXHmv0wKsv7KR8Yr4LK7KqxyuUfnLBDP
         6D8ahc3lg1dyBitenZ+00GX5fALIOfE1AMWcOIDt5Fk2nbgolsVWLiKp7pkBkxTwdqoa
         jDzGXccCWKUejfczY6r0/k1Eh06MQ8RlsGRxvkotZ7R+J+lsF16V3+f1J23OzPH4ROpJ
         poAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=SekbX91ewW9O1O5kfjeQJCVRZEAQ+BEcbYLDhGhP1/g=;
        fh=T9ekBJ7/CNtRFfqYTMlXPokWYqzz1KxERJNnCtN+Dzc=;
        b=FOhgeOxGD+6ubbw0pIFAH2FlnQ30GSra97QESrIyxXrSO9XICtdBjSdy0/ObGX4ndC
         OviAXv7zQd4b+ortJxjmQha/6C1eAcRb/bXAAcrd97JoBNrlu3d4CCY//XofRUvR0+k8
         LvEK9xJ+g0YjWPSuQBVJvBuEnV3Jy+gODP0sCP6TyEMkQErOXf/bG5pb4xeXMF7NNF3o
         WaDIywcaXYQFYzJg0Yd7QTQ9BwYoQ7cOroP0HUIAM+uN4Ws27UW/jiONGBScRRw2uanX
         VFW6FH9hcVYjhhUpABdzyxpW8dJDudIMUnA0nwj2z0Lr7UsQ6ouQz7TquPz8RYm/JjIw
         zfnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rf9zMIdE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v11-20020a05622a144b00b00429be06351fsi3348518qtx.247.2024.01.12.10.14.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 Jan 2024 10:14:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rf9zMIdE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rOM2e-000116-RI; Fri, 12 Jan 2024 13:14:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rOM2c-0000vz-AZ
 for qemu-arm@nongnu.org; Fri, 12 Jan 2024 13:14:02 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rOM2W-0001g6-W2
 for qemu-arm@nongnu.org; Fri, 12 Jan 2024 13:14:01 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40e63bc90f2so11539545e9.2
 for <qemu-arm@nongnu.org>; Fri, 12 Jan 2024 10:13:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705083234; x=1705688034; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SekbX91ewW9O1O5kfjeQJCVRZEAQ+BEcbYLDhGhP1/g=;
 b=rf9zMIdEkXfo9gb7mYGftaUlgqMVX1iMafuAWEnimvABiuhOtWTkCFwMqzV+I3PHA3
 BsIxtjEe8OTZMHTi8XgXhlu7NkzaEXMmyjYvnQVzadMl7iMbDBe6yFZYNkMsA8pSGhoL
 m7o9+raQ0TRAiwIKXRuXUe2TcaDDMQKGW3aepXaZUCq9La7S0eUXuxm5LcWYzCqclLDI
 mLeCVVAVA6CaLQTRm/vOwD22gSUrH6KnrQVhCOvFqJBtj8jyg/Gc3jNyGHbxkfGcvWts
 ZncJKampGDVlCDMCT6AKonGFTyJtaxHxtYPyVzfw5UbE7oQRl3sMcKBQEXOM1QtZA3yD
 mZ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705083234; x=1705688034;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SekbX91ewW9O1O5kfjeQJCVRZEAQ+BEcbYLDhGhP1/g=;
 b=MDjfHmyHjf7V+sIhtfuCrFldEpUINThMi/SSO7LfBuPOdky/DbF6NMS+cbizratXDh
 5Ni0BoFmH++LFhcuMnDNzSAVldh/SQ5QlLMffl7lCR4K/KUZOVNiB7Z4mVDaSgkp8Cpb
 /IyYeblEBCzkRqlvWoKe/EcsV4bFE/3x6oeRvM6X4QKfkQGgd8VKyysEiMOw6KhmQNyM
 j5ozJ95oeLDNTej8xMNqQH+Z/JsBb6Bz2YNuzs2iigGAMqvJG074OR468NykdXzCjtxk
 NOUdfCQqXlVLMeBeLEv1XZC+/plvx4cMzoA/GQG55IcFvFDZgkIMEo9OYKETQmQP9yzy
 bDQQ==
X-Gm-Message-State: AOJu0YxBCEb/ooB3M8yMJYgHQHWEDfhOwmqAWEB8Nzhd82rXDVFHkJWl
 TSRSuF17SluupghUgRm0syibge1VBc4vuj8BO3c/OllH1LQs+A==
X-Received: by 2002:a05:600c:21d4:b0:40d:3112:a2d7 with SMTP id
 x20-20020a05600c21d400b0040d3112a2d7mr846789wmj.187.1705083234394; Fri, 12
 Jan 2024 10:13:54 -0800 (PST)
MIME-Version: 1.0
References: <20240109194438.70934-1-ines.varhol@telecom-paris.fr>
In-Reply-To: <20240109194438.70934-1-ines.varhol@telecom-paris.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Jan 2024 18:13:43 +0000
Message-ID: <CAFEAcA_HR+PfavrUf9bVLk8biZKLxkNV3M6gtpofk3_6wfR4zg@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] Add device STM32L4x5 SYSCFG
To: =?UTF-8?B?SW7DqHMgVmFyaG9s?= <ines.varhol@telecom-paris.fr>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, 
 Alistair Francis <alistair@alistair23.me>,
 Samuel Tardieu <samuel.tardieu@telecom-paris.fr>, 
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 Arnaud Minier <arnaud.minier@telecom-paris.fr>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Laurent Vivier <lvivier@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
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
X-TUID: wc4hxu8PYBtR

On Tue, 9 Jan 2024 at 19:44, In=C3=A8s Varhol <ines.varhol@telecom-paris.fr=
> wrote:
>
> This patch adds a new device STM32L4x5 SYSCFG device and is part
> of a series implementing the STM32L4x5 with a few peripherals.
>



Applied to target-arm.next, thanks.

-- PMM
