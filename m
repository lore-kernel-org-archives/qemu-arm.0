Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2892789lfg;
        Tue, 9 Mar 2021 07:09:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxLt3nnsFy679pEh4qcKjBdGJZq5OI87xocEyj0tga3W3lQHuCcW2n2tVZgL2Sz+7Uujh2R
X-Received: by 2002:ab0:1487:: with SMTP id d7mr16366779uae.78.1615302575443;
        Tue, 09 Mar 2021 07:09:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615302575; cv=none;
        d=google.com; s=arc-20160816;
        b=d1uCtDa7jZx+9xJw2dYL5UkMoiedLe/M/TC7Ew4MoUmNi3H3ch4SwyqfOmMzedIXl8
         HjypB+J90C+PsEtjTQJT5YHQZeSuEFJ3/PXdIpfXokPccqt2iM48MQQEXoztuzCC3Cqs
         awV8f9uFaK2aVayotNd+Fm2mOwEP2JN2mK+jhZIvY+HYLuD2jhMqcN80qTLHmGRRu8Fr
         Tn7WXa+XoQhUCQDOtjhr1ZSZ+FroGj0gqba6jGOHUP7utA054+cF8Y0PoEzpbMY+CmX9
         pa45yJ+Gf/0QTxVEM13Rqyh7PRCztJTgg6BfL4y70EQvmGKw8OMlWNmxPViuww0lamiE
         OQ8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:references:message-id
         :content-transfer-encoding:date:in-reply-to:from:subject
         :mime-version:dkim-signature;
        bh=RRl8ZwwGl0rjUuWYzuTyINdrAJBZTYZJDNbf5fF8KoY=;
        b=JWyjRR8Q/qf5ZRiMm/6OvIqihVm1RGEeX2tnpSNYBDKwuCMpMI8wJ6pKDyzaxkzDDC
         O67IMWSejSkGMDpkGtLGuWR8GNpoebarO2nN3hshthASAKLp19SYgtdSOLL7WH7EgdYq
         jNuj/Jx9bqttfoqN3B9dQXUkE0uhJIMcwFaVZ9nFH/lJLJuUEO3p9HTu9DYdJD9Wrzyx
         3VOYU+aLN4jkZ7gURuPccPw17XYfku9zA4fGoA7iWzc3glepSEArSAYgf0djbA6eWUVT
         C/RRleZoWERvxl/WTG6B0DKRdH0siA8JuU4wDaDQ+zKg3TEALoJyXqSItuavMxB3Okjn
         pkKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@livius-net.20150623.gappssmtp.com header.s=20150623 header.b=CoznnZ27;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o19si2205166uaj.170.2021.03.09.07.09.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Mar 2021 07:09:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@livius-net.20150623.gappssmtp.com header.s=20150623 header.b=CoznnZ27;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lJdzK-00019d-Mj
	for alex.bennee@linaro.org; Tue, 09 Mar 2021 10:09:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1lJdUZ-0008Ab-M0
 for qemu-arm@nongnu.org; Tue, 09 Mar 2021 09:37:47 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:39280)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1lJdUX-0002Xd-6D
 for qemu-arm@nongnu.org; Tue, 09 Mar 2021 09:37:47 -0500
Received: by mail-ed1-x52a.google.com with SMTP id h10so20586766edl.6
 for <qemu-arm@nongnu.org>; Tue, 09 Mar 2021 06:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=livius-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=RRl8ZwwGl0rjUuWYzuTyINdrAJBZTYZJDNbf5fF8KoY=;
 b=CoznnZ27q0i1MKxTi9Kzn0pbxM0+i8sz/AeGxchjjmU0q9HmtBbRYfchSdHaUOZxhi
 R75C88eikBDRw5x3kLNW0R5FVRMml1BmMRDmmeP3nwm7g49m5IwpUbkKfft2MvIpKaF4
 bIU4nLBma6xnfdIlNiSan2PitrLylwGHpnhsLurVhw5trXKjqCrgtquIdtfMJfBmr+oJ
 H1n8RvC2AbWziVDGJEIygH4AV4siVeCrw+VyWPkU3locEfjpc7H9qsc/CfHtulwf0I6u
 C/gTgPPVlNmdn4zC0uRmFa1n60jeG+cfVbPcW0dyvzIPSNZpkfcqK616OZcdmcJNkLl8
 p9eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=RRl8ZwwGl0rjUuWYzuTyINdrAJBZTYZJDNbf5fF8KoY=;
 b=JalYrgPNWS8+geSJTupaTf6Ee0ZcfhQ1wV+oomSoiAO6OQVJj7O2WhQ7gOUWON2Fub
 GgcPdfC4Mb7dEzXlXbDZkyNEqbvpoTy+DTsLH+I5T+7Tlyg3IXMZQqmgoUCmb374c42W
 3reRsSza327hXlOZiMEV1S11knvERulUS7CuF5UtnyxtsuE9IFxK7cntpv63fxbqLai4
 qdj7SkCY887SqNw/FNBJRRffk0I8RNksGLjfaU/kUEtvnO/9Bq24+ocx1aXFDTe/xCuW
 fV5s4pmrhmnPtsoDGT/aLfd6VdmDxDjMiQxHZvcEc632MMIAvL13AMuTC1h03Q2MGB0n
 e+JA==
X-Gm-Message-State: AOAM530Y4shfclL3dWUfWQVgIjP2TOSX5esx5h7lMXH7EwlK3Cr1CdoY
 vJCfbZ1BJ7dYY77gs5lYR9aYKA==
X-Received: by 2002:a05:6402:304b:: with SMTP id
 bu11mr4287747edb.157.1615300662793; 
 Tue, 09 Mar 2021 06:37:42 -0800 (PST)
Received: from wks.local (5-12-20-125.residential.rdsnet.ro. [5.12.20.125])
 by smtp.gmail.com with ESMTPSA id e4sm8566632ejz.4.2021.03.09.06.37.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Mar 2021 06:37:42 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: Malfunctionning qemu-system-arm ?
From: Liviu Ionescu <ilg@livius.net>
In-Reply-To: <e00943e0-b9a7-1688-b169-3650e8e4290e@trusted-objects.com>
Date: Tue, 9 Mar 2021 16:37:41 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <FBA649E1-4EFB-4409-894E-C1A5AB086BF1@livius.net>
References: <20210211141515.8755-1-peter.maydell@linaro.org>
 <14af0670-caaf-caf1-0b90-fb10c7db13b0@trusted-objects.com>
 <e00943e0-b9a7-1688-b169-3650e8e4290e@trusted-objects.com>
To: vincent Dupaquis <v.dupaquis@trusted-objects.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
Received-SPF: none client-ip=2a00:1450:4864:20::52a;
 envelope-from=ilg@livius.net; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EWDYc/JoGbSS



> On 15 Feb 2021, at 17:09, vincent Dupaquis =
<v.dupaquis@trusted-objects.com> wrote:
>=20
> ... stuck on the starting HAL_init() call.

HAL requires, amongst other things, the clock registers, since it sets =
the PLLs for the desired frequencies.

xPack QEMU Arm [1] implements these registers, and is able to properly =
run the HAL init code.


Regards,

Liviu

[1] - https://xpack.github.io/qemu-arm/

