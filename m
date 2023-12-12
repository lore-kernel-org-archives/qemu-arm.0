Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp1048393ejo;
        Tue, 12 Dec 2023 09:04:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEAJZFq5qRBWe+cCwAz0hkabpbFXuxuKD2RF2Hdixcwxbf8PtVjQmepIAfs1DA35Ii60lhX
X-Received: by 2002:ad4:4426:0:b0:67a:c700:c9d0 with SMTP id e6-20020ad44426000000b0067ac700c9d0mr9773930qvt.108.1702400675012;
        Tue, 12 Dec 2023 09:04:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702400674; cv=none;
        d=google.com; s=arc-20160816;
        b=wGUk4VHDitbniBlMdAXGiCEscc/1uoIXgdH7Hjw6YrCIwYugWyVG6Ra7dEUJYNQHuC
         VfhLInroSKIZiRzbAMArcpNjLHlOcsbUQU3MRkqV3K1zQgkLaYo27dKwMkOj3idEHNlV
         NfgxzUzcbd5djhOSboHnVenPT19sBdR1VOn4DYl0516kEhJg+VZ+fl/8mhR6j42n+5sQ
         NsWROfOxEmmlndniRHOIdxHKol3bQZx7PV/IGdQ4ZNn96whndlV3S10vw/JZjydSymYv
         YZIK0TRWwR7blOZBLCVHFyGvCkDfLUdcx8XIf9rHCN5oVJuruk7oSwMAWdNMl5kCZF57
         TC3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=Phr6MYUzkA8BOaldnWrA90ueBDuHxuNyYy/7GkyshtY=;
        fh=oSak0SfGtiLsfNmzdEAK2zLhe/BB9IXTK0i2wATuAS4=;
        b=I7SS84iGfvrkX1ZnCxulZs6piMMTVbEpGUKRC1ZE/Z1er18t/g6raEz8enoTfi5nWG
         6mW9wKb5fjf5dcP39ftGF4q1gxUwqWHFIh4DEqx8cwWsZNJI+smKlVp+zelxcpbsZOfI
         y9uNyhWrFQySSHHVrfG+PCkczA/ClIx+WcUS6Z0rvshRiC1TOrVNYQQJ34Xp12HRShlL
         0mDb6F92PG47F7XF4cQU57HT6I7JEP+KixowV9ztmndDqV7DuMfeOY0Tv1wnmuGMzJsy
         pISKMrPmqCdaU9ZCi4CdH8zFwZaMPfPSpUK60J9ph27PKGvVp/g1w9CTcPaZ4naciuKc
         Dslg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aPxKle1L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d17-20020a05620a241100b0077efe3927easi11146294qkn.157.2023.12.12.09.04.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Dec 2023 09:04:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aPxKle1L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rD6AW-00066X-43; Tue, 12 Dec 2023 12:03:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rD6AG-0005le-Qc
 for qemu-arm@nongnu.org; Tue, 12 Dec 2023 12:03:26 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rD6AE-0005w3-6h
 for qemu-arm@nongnu.org; Tue, 12 Dec 2023 12:03:24 -0500
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-551d5cd1c5fso697108a12.0
 for <qemu-arm@nongnu.org>; Tue, 12 Dec 2023 09:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702400601; x=1703005401; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Phr6MYUzkA8BOaldnWrA90ueBDuHxuNyYy/7GkyshtY=;
 b=aPxKle1Lga156W3K1CDSuHxQFc+wodIYoaG9lznDHCPzYsaL4rE9hbHLUHQbd+qstp
 gUEWC2oJDwdnAWAcl/iAmrabzFG7wDHrHDSBAN16kZHQ9AWyMV1NG5CLcPr87NVPPAwu
 QN/fE7E94yh9zr10lszmeKD27TQV9oaC0Y3k8rEyjQuTgmK0Wx+5tFRLfZVsJxPVzCrV
 GStXWGRhORt3oxG/49Lh1EcUCr4OVCPBAOwf4W66DBevf7oE2YJ2Sm0jYGXnfWKkgr0L
 3s4t7VbuQ9g2qye+r3qNkIB1r+Kd8bhz5Pyh+qpYclNM0PFViuqy1VjSO9wmANOL3X7T
 Dxhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702400601; x=1703005401;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Phr6MYUzkA8BOaldnWrA90ueBDuHxuNyYy/7GkyshtY=;
 b=JjcvE+iyqWdkLP9naVpAtafiP3eaGtvdg6djitVGqAmUJ+x5PdMT9zAOz/GSg7HoSI
 HVY/VIlVGNZ9YMP7YZ6semzd7HZ+k2eya9QY4aMvPJR4O0R1lu06rhs4n+/u2TpC/diz
 PFgMmLXFPX2vMjHhJtaw2EaQ3Xo6aJKa0w47MhRhtTrokauXAclTh6LDdk9p+jcpMPS7
 orUZVuUHIO3CGQJdfIfK64J2juxJQHmULocQaCArSH7ZhYQfuMJKwSLxAbyRdYYYJKkH
 RnprLaT7r4ZC1s5qizY6q2Pkg4hiJgcMlAIL7axh8ezgiSLz0XMobRFVSNCt4bEBZQW4
 /NJA==
X-Gm-Message-State: AOJu0Yybv4d9K7zJumM4BA64GrMDUQJnKJiMiOpjtZ+UO4z4EIDq0vJ3
 vG2vEyb8VW7zdQI64ZNaatmUpureVT88wsxMNtU8kQ==
X-Received: by 2002:a50:d541:0:b0:54c:73be:dd98 with SMTP id
 f1-20020a50d541000000b0054c73bedd98mr6936470edj.14.1702400600790; Tue, 12 Dec
 2023 09:03:20 -0800 (PST)
MIME-Version: 1.0
References: <20231123143813.42632-1-philmd@linaro.org>
 <20231123143813.42632-9-philmd@linaro.org>
In-Reply-To: <20231123143813.42632-9-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 Dec 2023 17:03:09 +0000
Message-ID: <CAFEAcA8EegdW0YFsCF1YhypuSMtfRKpJP1HbA6TTJ_OxoLrE=Q@mail.gmail.com>
Subject: Re: [PATCH-for-9.0 v2 8/8] hw/arm/bcm2836: Add local variable to
 remove various DEVICE() casts
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, 
 Alistair Francis <alistair@alistair23.me>, Joel Stanley <joel@jms.id.au>, 
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 Ani Sinha <anisinha@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, 
 David Gibson <david@gibson.dropbear.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, 
 Andrey Smirnov <andrew.smirnov@gmail.com>, Tyrone Ting <kfting@nuvoton.com>, 
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>, 
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Aurelien Jarno <aurelien@aurel32.net>, Igor Mammedov <imammedo@redhat.com>,
 qemu-ppc@nongnu.org, 
 Hao Wu <wuhaotsh@google.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Beniamino Galvani <b.galvani@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Nicholas Piggin <npiggin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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
X-TUID: iByxDZamcU48

On Thu, 23 Nov 2023 at 14:39, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Cast the CPU to DeviceState once.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
