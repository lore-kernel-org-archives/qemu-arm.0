Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp81572njk;
        Tue, 16 Jul 2024 03:36:28 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWgEexoXR+YWP3+cwC+EMflcH7FRXSvnBlMf/AEILSPG+MylnSWytm4tIkVnbeUlbxjyghwHZBO6tVec8l5cNubYJhv3w3y
X-Google-Smtp-Source: AGHT+IGvdGM1pQ82fiFdAFCpG++7ZHck9aPsPS/5S78uBR0NlSqz0Ou2o1GOcNHzkY4z/sOnogDS
X-Received: by 2002:a05:6902:2081:b0:e02:6e1e:209b with SMTP id 3f1490d57ef6-e05d5eb7b34mr2283643276.38.1721126187780;
        Tue, 16 Jul 2024 03:36:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721126187; cv=none;
        d=google.com; s=arc-20160816;
        b=IH/xyPY/vXkxChNCnlnQsuBPtGX7Ir/UTh5J3UJPOuHNRoDpWTF6kO3PIHEjaSDhFg
         w9igMRVakKMvu4BsCdq+3Y16E0bzHN2vLk3GD67BTHENRDgzVU8rZtDUxLe2fgIjSgjt
         YW9EyTz1qDokl39IrafDR8Afj1pfbNcROFa1ypvMFmKDrS5Ogbv+EDDoImGKxoXC7PUC
         DwyF6tUSN8GZTyLQQnkLMe7BTSfYav8hxRh4M1VoWl9Cz+mlKmvzhQW40K4EjwP/nIlX
         ZZ5i1Cp0G7cPnxwm2fMSw9J7P25RllxaHL7dw2RGwuzy7e0AWGvs+qOhUpzNg2SX6u13
         cdZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=V56vDIqVAmmofi4MPaP03VMccsDzzQeV+azCpJzQJvU=;
        fh=ISsprPQkCDikQxsVX/vff8ZsuRV8RLaI3HuA6yQZ228=;
        b=CdUOqU+/PLdSX9Kusaq2dnWCQBZEzq4QZjnhOZXMAO6BAeWodHW9JatThdFRFXO8Ng
         5P7As1k5JKD3HfNMTOLN06gPYTGM7GuF2P0svA/D9qmkg8atTzENDvsjeZu5JsIX6wbO
         jm3sup2sEyPuVmeXcls68je/pbt0FD131unlzNWSQGM2B+Y3/kb1mYmLZg0xiRX/9Gqq
         LHZDN1sY0j0fZ+TcN1UTzCU727uIuMCWS6QAqcM9A7qR9O2Ls0vrU68mBiTiDsJ8AGiQ
         VTZ/E6klKwKx0+xQY6RC5rLxH9unC/EDnx7DyUIcYnnKz2G6/4Q8mkwemgMZalqPLmYJ
         fGBQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lGmylZVk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b761a1e278si70660416d6.402.2024.07.16.03.36.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jul 2024 03:36:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lGmylZVk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sTfXC-0006qr-NB; Tue, 16 Jul 2024 06:35:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sTfXA-0006p7-Hp
 for qemu-arm@nongnu.org; Tue, 16 Jul 2024 06:35:48 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sTfX7-0001ct-Uy
 for qemu-arm@nongnu.org; Tue, 16 Jul 2024 06:35:47 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-58bac81f419so6354698a12.0
 for <qemu-arm@nongnu.org>; Tue, 16 Jul 2024 03:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721126144; x=1721730944; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=V56vDIqVAmmofi4MPaP03VMccsDzzQeV+azCpJzQJvU=;
 b=lGmylZVk3CaKMHaLmG1JYwQRQJqcdLkSLPkhGzZnasmgr/m/dsGNszTA2SJWxApVab
 5ieOfcMBzEVleviHWoF0yfDCFwXVtKniZZ5hB+brt9phFZMDZr8owSM6Y+wIIQlVFjIv
 fV5iVJJTlGTB4VF0fElBP/y7XtrfAoZXghsCIVNxzr/y8rbdKcAYv8bC/t8UqptysXty
 E86UrnfXxKNoIdVHZQtFFUIZis52SY7FAHYiKYSusJeZORb5f76x+nCCugzKH2g4HdsK
 YC6nU/D6fWPpKSzCBkPr7aETp1QMLf9QItP5fc9H9KkpJlCBbQ+myBPiPDgFWm4vsK7K
 bOwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721126144; x=1721730944;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=V56vDIqVAmmofi4MPaP03VMccsDzzQeV+azCpJzQJvU=;
 b=VQCKYci6XMbWBmpt5RUiG74c75FYVkHctyu/ymlaL+hvbYrthrHJK7ItyosyebwVci
 Y1ji8kNh1pZlmVEF21JFslPWKWBrKXQPWfBsKJYmnOIKuW40TlN9FZIkb2lmEPs9lVjW
 LfC20mfP7zZJDD0OIeWEkViO2WASi56h6F31ucuYVBQzCzYONhuA9hAWoUXv4558rr7s
 3ad+Z4bVxkssszvu3eqHPVj8HS9dSn1YqPPSVdH6AQvd9oBkKAbIVJ2Gc7/pOyW7idVl
 nMXK2Wx4WaEEf3K5VQx8cNdLnviXKuGgs5s5NiaXZffvZnOtYWmCrxBSYdz1J1CLUbGu
 E1ug==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6GTfYwbKuQcaeS2BYdu6oLsENCBGkVDBFmnQm/TJ7JrQGOBpgPr7nf4BXXWB2Wk/RpDTOqDklH/QEmpclcNAXPzgS
X-Gm-Message-State: AOJu0YyflNEKCFm/0dUZeSIJb5dMFFYYzDb6rLs83gA0vNXhvQ+mfEY5
 TZDYVdSufvbsTQkY6KTGeYcAbIfL4pgy7S3KJqemdPb94SbMRa1pDdN2rI6cyw8z5oSvAO4O3Bo
 FZMPRW8ls467pxWrwMX8zqZLqNDrmPVk9O8HHIlKZ8AyAw1Oc
X-Received: by 2002:a05:6402:4581:b0:58b:9e7c:bcbf with SMTP id
 4fb4d7f45d1cf-59ef0ad1232mr1083461a12.36.1721126143538; Tue, 16 Jul 2024
 03:35:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240713160353.62410-1-me@samjakob.com>
In-Reply-To: <20240713160353.62410-1-me@samjakob.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Jul 2024 11:35:32 +0100
Message-ID: <CAFEAcA82m+8K8rWDMBehPp=NGUezHZPn1LVoyU3DJ3LWq+ZnAw@mail.gmail.com>
Subject: Re: [PATCH] hw/display/bcm2835_fb: fix fb_use_offsets condition
To: SamJakob <me@samjakob.com>
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 "open list:Raspberry Pi" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: jiM3ONYUBkr9

On Sat, 13 Jul 2024 at 17:04, SamJakob <me@samjakob.com> wrote:
>
>         It is common practice when implementing double-buffering
>         on VideoCore to do so by multiplying the height of the
>         virtual buffer by the number of virtual screens desired
>         (i.e., two - in the case of double-bufferring).
>
>         At present, this won't work in QEMU because the logic in
>         fb_use_offsets require that both the virtual width and
>         height exceed their physical counterparts.
>
>         This appears to be unintentional/a typo and indeed the
>         comment states; "Experimentally, the hardware seems to
>         do this only if the viewport size is larger than the
>         physical screen". The viewport/virtual size would be
>         larger than the physical size if either virtual dimension
>         were larger than their physical counterparts and not
>         necessarily both.
>
> Signed-off-by: SamJakob <me@samjakob.com>

Thanks for this bugfix; I've applied it to my target-arm.next
queue and it should get upstream within a week or so.

-- PMM
