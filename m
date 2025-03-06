Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp1161529njm;
        Wed, 5 Mar 2025 16:06:52 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWN07Xo8DHBaRMB+w7xjtsrlHrh9xBHfMLY0BIk8da6oUOWX24YKRKpwsx11miXpazZ44SaT1lHBYr7Cg==@linaro.org
X-Google-Smtp-Source: AGHT+IHzx3L6YBZ/e2ILUruWe3cNSk6OSn/TZkdoQAbycg7j1jztdfeLg3EZRqwZuyMC40uxzvBg
X-Received: by 2002:a05:622a:1489:b0:471:b8dd:6411 with SMTP id d75a77b69052e-4750b4dda86mr71777881cf.47.1741219612159;
        Wed, 05 Mar 2025 16:06:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741219612; cv=none;
        d=google.com; s=arc-20240605;
        b=X78O2Qi0wKMonoB92GFJMO8Urwp38qQGpAEjIxSuaJf/Fsmiynxdd41Sh15y2bDPbk
         iiFQci3/DSrh8ZEnTDjPy4L2vt0sZdYEBMpuThHB/ZzTNAdjhvBKvdUqBdxnzZdMUpvI
         KW8J8GQjhTMdLFmrQL1SPYHXwcv7546ZnSzwKPmPBJRfwwnhxLZHrfoMW9yAqLEFnn39
         0cbx/4yZjs8/VVT2oCYAbi15Smrajv6YsviAvI/9JVr0kItcd+i98hV7j610/VtCnzfg
         RLrzX0xQoZf9ilUbckQTdiAX1peyDzp51zNSeZDlULeyrt+AiUMoA6xloRIWRYTyNwxc
         KxQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:cc:to:subject:message-id:mime-version
         :in-reply-to:date:dkim-signature;
        bh=WUYfGT4tZgOk8vPsyLiI12zfKR9QKBadLQTRXrZflD8=;
        fh=mNuIw2+POCYS4PeAk20d8Y+yyr9+LK6hM4Ig1c6Gw+s=;
        b=ExPFIt4SAL8NPWeayiUOROqwe8yFsQKFXnk1Z/AltQRvq1fJTIrzvvXw+gp5eDbq52
         xIoPABmOdZO48Yk76KEIxp0mAd9Il5na9fX8T3pCdeEBTr7N1RMY4E4MMkiYyi268k2/
         Mn2qtmBLl6XJzZr2fXjsgZeNvte1q5i+W3mghRKucDcDu3L5yIEby94+Q+cNCUZmjHh7
         hddRfgkWpGMBTFEWwq7A2txhuYSmpqSEnqsAAhDkizwDJoq5Q0YFMjbg6wVyzfqvC8lo
         NaJpg1IJ2z5UDL1QErvrsbizRW4m9jaFyf/QOWFkQgkdrNZnyQmRPIKsFIQs1qoc3RWw
         5DJg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@google.com header.s=20230601 header.b=byQvn+Sw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org;
       dara=fail header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4751d97f0f5si1342301cf.84.2025.03.05.16.06.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Mar 2025 16:06:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@google.com header.s=20230601 header.b=byQvn+Sw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org;
       dara=fail header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tpyky-0007dM-SP; Wed, 05 Mar 2025 19:06:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3_ubIZwwKCjUeRSZYVjkVWReXffXcV.TfdhVdl-UVmVcefeXel.fiX@flex--nabihestefan.bounces.google.com>)
 id 1tpykt-0007Yi-S5
 for qemu-devel@nongnu.org; Wed, 05 Mar 2025 19:06:29 -0500
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3_ubIZwwKCjUeRSZYVjkVWReXffXcV.TfdhVdl-UVmVcefeXel.fiX@flex--nabihestefan.bounces.google.com>)
 id 1tpyks-0006uZ-D1
 for qemu-devel@nongnu.org; Wed, 05 Mar 2025 19:06:27 -0500
Received: by mail-pj1-x1049.google.com with SMTP id
 98e67ed59e1d1-2fec3e38c2dso371509a91.2
 for <qemu-devel@nongnu.org>; Wed, 05 Mar 2025 16:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1741219583; x=1741824383; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:from:subject:message-id
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=WUYfGT4tZgOk8vPsyLiI12zfKR9QKBadLQTRXrZflD8=;
 b=byQvn+Sw4k5e/6Ij7LVTR+rcnlIi7/OFhQppNDLh1YXbscbvtZNiMaJiMiKm3jDZMI
 gSxrFH/fyc1o72sihHoeDWeuzMPfeHN1+A/PbKxMF0SXixmX/uOy0/zrElxuoRd0UW9F
 fBwj4R/x5wNl8wuKQe9lzsuRvm8P13US5UHy9giDTs6JyYs4omInqCQf1eF5YxQqBQwa
 f+5S+j8H3DyLppC61G0AcUJpkBYDDYe254s6vbj4sLgOUz5iFc57IeRzXwIjNWxOb7Mo
 UypykPdGv882oEImho8kl1YsaNw//2jgF2mxjQwefDF+jjiQHor/OXNFGarrjOuCPu8N
 Ab3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741219583; x=1741824383;
 h=content-transfer-encoding:cc:to:from:subject:message-id
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=WUYfGT4tZgOk8vPsyLiI12zfKR9QKBadLQTRXrZflD8=;
 b=kfjVh2M2LO8WZC0sfcwX/U42Hzdkhr4jjY5CDzNHI5Rll/WIDQ0IjeVmes9k2664R7
 ISDWKgvdKWr4af3UVuzZCD2nTD5dPAV/k2xiDkLR4OalrtBHEP0yVMTyPb+vchJ5Ona9
 wRKkAWefFceCW/TT/rpu5kEUuVTkwDHyyRsEW35lLJstCkhHHZ87iNyT7aL/fwRKINr+
 V9+3KfWsDhDuJkS+BAtHs2DaUtOBXbXpW4R+VcVShnQInZvwh+X4k5FCgHSoio/KNcQI
 dJ/oKQ8Pyc/ETOVaue0VgyYRoZczrJtrk7OOfJ7cMuwpW9UC/O/RFVHd1owGeF2tLnZQ
 zyPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPMfSA5Vu8Yn/C7xofnl3wti6o9Begq0mpLEdDs90VaRpmlqvJkJPunPeX2Yahi+3i2F76Hv2KpEwV@nongnu.org
X-Gm-Message-State: AOJu0Yxr2fVuUzFY2cXmLwkCL9gT2Atn/KmAwyyllB9+7v30OaAQq0Q7
 HXojRFvk5narTuhiXwZAivckuyGUDrbSatuh9rrxt2uHf8+neI6/H7fH8fem0jKj4ITpGjMpAuS
 VwPZMb1RkgwFvPhc1eUOunh7Ytg==
X-Received: from pjh12.prod.google.com ([2002:a17:90b:3f8c:b0:2fc:2f33:e07d])
 (user=nabihestefan job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90a:c108:b0:2ff:52e1:c49f with SMTP id
 98e67ed59e1d1-2ff52e1c577mr4670473a91.26.1741219582818; 
 Wed, 05 Mar 2025 16:06:22 -0800 (PST)
Date: Thu,  6 Mar 2025 00:06:16 +0000
In-Reply-To: <20250304064710.2128993-4-jamin_lin@aspeedtech.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250306000619.2093315-1-nabihestefan@google.com>
Subject: Re: [v5, 3/6] hw/arm/aspeed Update HW Strap Default Values for AST2700
To: jamin_lin@aspeedtech.com
Cc: "=?utf-8?q?C=C3=A9dric_Le_Goater?=" <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Nabih Estefan <nabihestefan@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1049;
 envelope-from=3_ubIZwwKCjUeRSZYVjkVWReXffXcV.TfdhVdl-UVmVcefeXel.fiX@flex--nabihestefan.bounces.google.com;
 helo=mail-pj1-x1049.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Reply-to:  Nabih Estefan <nabihestefan@google.com>
From:  Nabih Estefan via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: N2jqfDKoEg1N

> Separate HW Strap Registers for SCU and SCUIO.
> AST2700_EVB_HW_STRAP1 is used for the SCU (CPU Die) hw-strap1.
> AST2700_EVB_HW_STRAP2 is used for the SCUIO (IO Die) hw-strap1.
>=20
> Additionally, both default values are updated based on the dump from the =
EVB.
>=20
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> Reviewed-by: C=C3=A9dric Le Goater <clg@redhat.com>

Tested-by: Nabih Estefan <nabihestefan@google.com>

Thanks,
Nabih
> ---
>  hw/arm/aspeed.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 98bf071139..c6c18596d6 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -181,8 +181,10 @@ struct AspeedMachineState {
> =20
>  #ifdef TARGET_AARCH64
>  /* AST2700 evb hardware value */
> -#define AST2700_EVB_HW_STRAP1 0x000000C0
> -#define AST2700_EVB_HW_STRAP2 0x00000003
> +/* SCU HW Strap1 */
> +#define AST2700_EVB_HW_STRAP1 0x00000800
> +/* SCUIO HW Strap1 */
> +#define AST2700_EVB_HW_STRAP2 0x00000700
>  #endif
> =20
>  /* Rainier hardware value: (QEMU prototype) */
>
