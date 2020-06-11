Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp1274727lfc;
        Thu, 11 Jun 2020 02:38:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxYug1w3fHV6udM6HIirWPBuy7yis+hbOwOzlXDDUjJSpZR7Bs9wu8FiuE3ZZ9jcJ58Cu42
X-Received: by 2002:a25:d90:: with SMTP id 138mr12633451ybn.19.1591868328774;
        Thu, 11 Jun 2020 02:38:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591868328; cv=none;
        d=google.com; s=arc-20160816;
        b=IhNidCIToENqlHiLcKG7LqqQcRnaLdPsX6LvAkYlfP3lPSZHQbZeCVKfPG0UG3Ao8G
         jT4SebbTKMuHCBrONXdcJZEmV0zXCnk7jp6RSpg3fk8NeDHtswIJgwtlvbElNl6eABJZ
         qNrfZxNIzQRjxXofT95vULfoILmaJg+QI19YuG32QiRq8T6+0QomPLlAzceogwZAyVui
         JJij71yzLl8iQ9f9TdbLgEU7MMfQofUBQ0Gq36IUjA5hIf1+g8Gom8LRR+drXWuVZma5
         SxJ+LY5Hu8UN+ki7CNgnCw5KcFbxruSrVqg+RZct3XApoG4Ymzk8BvaFvRsILgfqaVRq
         EVYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=o2VvQfxFAehKBrNRW46ubZGSOcLPQ4INwX5PdjGMNqQ=;
        b=j2icMRh53v8c/6bhs9qLdiZ1fm025cgfENMuYKx5H41+/kqmpC+jZoPoq/wiztuh4d
         mzWVqDwQ6+0VQv2l999++ESfmfAL7/0P+yFqD8GzAY7Tt4u+oZvtAC7yCeVyvdj2eBoQ
         EwtwSU8TkJenog+4wUKPUeuK9rlwVsJB44szD1tnCUqPlVzLBXuXJ5WFpG28pdlTTF5T
         wk0scSbgHyBQMEwOMCcge/lMyBBUcV5a11xEP42zdi1+mofwk5KUC8odpwXQRKMdSEpw
         NIeSGRSiur153Bvx5C9Mgg3lL3wYwBnsPh2AH08s9j1N5Zvf5krx5WTUmrn3KonKBTMh
         lpUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=h50EN9bk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j9si2054567ybp.406.2020.06.11.02.38.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Jun 2020 02:38:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=h50EN9bk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jjJfc-0008AY-5A
	for alex.bennee@linaro.org; Thu, 11 Jun 2020 05:38:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jjJfR-0008AD-Lr
 for qemu-arm@nongnu.org; Thu, 11 Jun 2020 05:38:37 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:42241)
 by eggs.gnu.org with esmtps (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jjJfQ-00063s-Oa
 for qemu-arm@nongnu.org; Thu, 11 Jun 2020 05:38:37 -0400
Received: by mail-ot1-x343.google.com with SMTP id t6so4048693otk.9
 for <qemu-arm@nongnu.org>; Thu, 11 Jun 2020 02:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=o2VvQfxFAehKBrNRW46ubZGSOcLPQ4INwX5PdjGMNqQ=;
 b=h50EN9bk7jGbvfQB2FHAe9qcTZA7iiH0sj08SfaO4Usg60N5T3KrGmW540wQQfLebP
 FZ5fzn8jk4TWrVZeNVGnqGBfaKVRf/ktmiXixnAMyrkDn4CvTsmJkneOeM1guEp+AdQf
 OrbPptzjKXnQ13AE1Gpa0jkwi+p02aMtC3Q0hIC+lPCYqFVnvirGFwb0xekQ5QraaZ+S
 JZIbfUJJ5Y7t19L8E07cUZACmFA9OmuaCT2BJWzx0gyHJUgAAOO4oMe+KIpDlWUL42rq
 WruSWjSEm0Ye/KEqnyIYKytHmxCYe+M8GcW7gsfXG4KA6JnbBD6R0REwrnYhk358PdpH
 fNPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=o2VvQfxFAehKBrNRW46ubZGSOcLPQ4INwX5PdjGMNqQ=;
 b=MoSuxMBg/NlamILpVwmG4YEZlAH0L7/wvdY6Ar92fOMDM77A8c2JVpkPJeOHE/xWfl
 NT8ZDcK85Kj0P5V2aR8qJetLgT+eX/cfuCPPLigZWnjVItVZndwVAIBayrtOOcZJ6MQ9
 SRZWtaGO8wLiMLK9YoR3zmThKOCb0eAsjU0Jc56EjGv/u8MBkpDL/osv2FKSNyjNJjvX
 NI/s8Te/xiy8CuGKF0kzVq4MAwa1Yp3JquGCm2Kg8Md5wsKm6pjcEx4Ek1MHcfKrD3gs
 CNs+V2wcO4kETQjvj1LBght/0+q8OEStj8AaytKGKft0XPEbjb1Ct8oo8cO9uaWqvKiq
 F/Bw==
X-Gm-Message-State: AOAM533qkWhmq20xwB7qtTqhS6wpiv4nxgPh3nytcqsWlB+BPbZPsAIB
 ESGZFhlxjOV6Spb0UXrPllmLwz6iPCzaA/eeicHaIQ==
X-Received: by 2002:a05:6830:18da:: with SMTP id
 v26mr6103830ote.135.1591868309193; 
 Thu, 11 Jun 2020 02:38:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200521192133.127559-1-hskinnemoen@google.com>
 <20200521192133.127559-6-hskinnemoen@google.com>
 <18fa4025-0a2a-4427-b74f-2b1b678e0661@kaod.org>
 <CAFQmdRY9f6tV7VoDOFpRJ0x0hr_0EAaGqZwmXnkJpbvmbF4FVQ@mail.gmail.com>
 <5f0864e4-5e63-4819-1f30-68a5f207e275@kaod.org>
In-Reply-To: <5f0864e4-5e63-4819-1f30-68a5f207e275@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Jun 2020 10:38:17 +0100
Message-ID: <CAFEAcA86vzp7hTYzk54+Qu+WQDzB-gLbUsqbB409f9F3ONdekQ@mail.gmail.com>
Subject: Re: [PATCH 5/6] hw/arm: Add NPCM730 and NPCM750 SoC models
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::343;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: CS20 KFTing <kfting@nuvoton.com>, qemu-arm <qemu-arm@nongnu.org>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 IS20 Avi Fishman <Avi.Fishman@nuvoton.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UKrVG4FCWQrY

On Thu, 11 Jun 2020 at 07:12, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> Some don't some do. This is a bit confusing.

Probably the usual thing of people not noticing that they
need to do something for big-endian hosts and nobody testing
the minor platforms there.

> Peter, should we fix the boards not doing the tswap in the secondary
> bootloader ?

Yes, we should -- it's an actual bug as well as just not being
very consistent.

> I still have access to a PP64 BE host to test.

In an ideal world the bugs would cause "make check" and/or
"make check-acceptance" to fail on BE hosts :-)

thanks
-- PMM
