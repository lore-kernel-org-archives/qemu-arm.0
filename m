Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2861907njj;
        Mon, 5 May 2025 20:23:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXSpGDM+Is6xUIC/Sfici217S7GEi6E+BBp9oQu8ASd5UVkan3ufp7j4punh56sJVcSdFV4DLGsYWhFBg==@linaro.org
X-Google-Smtp-Source: AGHT+IETACbgxIbvWIOPjO/OyXbaHyjd/ygD+vBe2N0RJUclKrg3fp91LPPOvHHExnotW4C1/n7Z
X-Received: by 2002:ad4:5c83:0:b0:6e4:2e12:3a0c with SMTP id 6a1803df08f44-6f535421f81mr32454636d6.39.1746501817312;
        Mon, 05 May 2025 20:23:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746501817; cv=none;
        d=google.com; s=arc-20240605;
        b=PIS1eeeh29rz+94zfTNf/MWi/ih54c+H+YLey3pI/YSNxePi01+YmAEu/aHDhdKxi0
         1Q4KomeALoV0OjrYyL7RJG7AY2sh5adE2P9FrKbxsKCFPFwUu2QXHyZpHHiFixslC32A
         0REPr3wXYpNJyUcBDLMxUFcE0pFq7iLCEjyMSzyaXkmI9RLOVMnh4jMwh/KdHx8/GYa/
         CFW0lIYvhbFCWUrsShbxbmJMrUzxiAIJD1ql0ZE7T7GlHsSRlvjTRMKsTzBZBY2+zMX4
         rBnnDQ3GzZNtS1Nwfer4X+Kxccs72Im4dx06bHeNEZ/qyfFWjNfD0EhbGM/XFBIIugsE
         t3wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=njb47W0vhAtLje8FjaPe1bsO5O4v0DdC04nQs7Mwt3I=;
        fh=X/TPn3MXazBJ3xOzesHpdKNStcfk1mouZS4gnEQc2N4=;
        b=LeWGyvFdUkGn+bZevBTnRYBaaSF//u/Prf/9AmR2xMd4zoPIE/ypD1Ob1NzKf1O2Vs
         u/DgF+xZKPBYI2LUQDAZg31d5BioO6/IJ+vv5dKMN45cnKRZp+A5+dqm58EL/JJGCrg7
         LWpx09ABKL/WsFHcg11P/IMNEtuzjhPqOnW9DJfHBa7kW8OIBhzZk7JX6qGA1BHP+bk8
         P9bY6g7aNZb/MBQYR6jCdHbXkSCpX9aYJ8/pFBaIj+o/IkpH9A99MpKFjlYIklIBIByQ
         jmalk+6yruJde1aBqKO/GqYn6TQt9IbAljRuTRDAzKj+FITuqv/yG6uUSvsmXO6CGL9h
         w3ig==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=DUFJhMSY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f537cb42c0si6035596d6.144.2025.05.05.20.23.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 May 2025 20:23:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=DUFJhMSY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uC8u2-0001fy-Lq; Mon, 05 May 2025 23:23:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <timlee660101@gmail.com>)
 id 1uC8u1-0001fN-D2
 for qemu-arm@nongnu.org; Mon, 05 May 2025 23:23:29 -0400
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <timlee660101@gmail.com>)
 id 1uC8tz-0002qv-Kk
 for qemu-arm@nongnu.org; Mon, 05 May 2025 23:23:29 -0400
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-2d9b61e02d1so1213172fac.2
 for <qemu-arm@nongnu.org>; Mon, 05 May 2025 20:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746501806; x=1747106606; darn=nongnu.org;
 h=cc:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=njb47W0vhAtLje8FjaPe1bsO5O4v0DdC04nQs7Mwt3I=;
 b=DUFJhMSYhS7E7J6dMcqIMobAJvzQMavMwKpm3Fa7Vb18MWFGaIuVoURL7S87tKiOJj
 Ft0d01K1Vj6vQ9T7OF4o4PdvvENLhOLL7HkM1WMQhhKZB6OgEEtbPBuOE4Vw323uis8+
 gDphZRbd3em5nQsmD0b2ZNqHkkrmb4/h14/24Q+F9G9JvzmFHsHkfzsFmOtMWwVeT4rC
 sTIzpuVfMDEXIiuc2MZMzNkGXKWEojJHp6PHUb/uQHnvKVQiVN9F6Ai0yDBOsfHBIcve
 wlIjPU2PIRWJ/T5am6+F3b42kE6YAodrFSg7/ZqUmQU6KPrKi5ccq5J4iQ9ilW5DM3ph
 zbmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746501806; x=1747106606;
 h=cc:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=njb47W0vhAtLje8FjaPe1bsO5O4v0DdC04nQs7Mwt3I=;
 b=GvKMARQSjbSuZHVW8tvbIo2Y12M9iGZbuwMAz9TV/dZkAx7j0/Wx5yInioADTO6MHv
 4jxD0OTBAvqMyuadQtZgqn3xOMRzz8HtAKB0IB7OAqczPiFFByHbqlHW8Iwb+CtuYLwx
 Oi7JZCFCDki1fbU3Lwgm1V/DJIPnfAcm22ss82F6z8vlokcVR36TuBolF2roPBDsBWTM
 12bY9V35ziPJAEVW4q7XfQGB7UySZAG/w/+Laxr6ssc6i8GpXSkU4fEw3vjLykc6S6tN
 F8eBoh7Q0l7S/NLGkAN76NgG8rDJzgAsLgvPiMKw8B/iRv1HIcAAz+aXDT+tJFkx8MfJ
 XMrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyqjNM6L5H4kRCyxV2VwzqIgvoagqHJX2rV+gMl1pBQd203P/lTj5EhKp2YJkFhQXbwBZgoPLIoQ==@nongnu.org
X-Gm-Message-State: AOJu0YxwKa3ulyT5ne130U0KxtbKtzmdyy4pwymz36h8enFJok/08RC/
 JFHV1/l51WVIOgiN3CuWExo6Llxgwt2/YPEeHpevCT99DTCKWfkn5k3PTSWKJxJxv0eWt4Ww9AH
 WG0aLDFqKPakpaK5CVk/vhxJH8qI=
X-Gm-Gg: ASbGncuAyEFmhG7JfL8tVsXlPY+3+yVqqFYA4d+f1vxwSSrzRkJQnHz7XgmA2Z1GWNw
 RGs8MlhaSenuyk6lG2lsubtLRdyBCdjd0OeV5R49G7+JNNkT8/SkTgpMM3MgjTTBDcdScn1FbZs
 WueLgKLn8mahZrUehFcCbUbfE=
X-Received: by 2002:a05:6870:8909:b0:2b7:7abf:df6b with SMTP id
 586e51a60fabf-2db39103e68mt1185136fac.26.1746501805955; Mon, 05 May 2025
 20:23:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250401085903.224787-1-timlee660101@gmail.com>
 <2d3d33c3-21a6-4432-9d9e-7332c5de63bb@linaro.org>
In-Reply-To: <2d3d33c3-21a6-4432-9d9e-7332c5de63bb@linaro.org>
From: Tim Lee <timlee660101@gmail.com>
Date: Tue, 6 May 2025 11:23:14 +0800
X-Gm-Features: ATxdqUGUlAjHysGZeSKEjqPxD0jy5rzwGuXZsAMYVmt4WUYo3scqFwv_PYcZf-s
Message-ID: <CAJG6D+gBjd=1Xzk=OcsZWuMGqtPz2KhaQSVBYpZ-2LPhXFecFA@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/npcm8xx_boards: Add auto zero flash image and
 device part number
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 wuhaotsh@google.com, chli30@nuvoton.com, kfting@nuvoton.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=timlee660101@gmail.com; helo=mail-oa1-x31.google.com
X-Spam_score_int: 13
X-Spam_score: 1.3
X-Spam_bar: +
X-Spam_report: (1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, MALFORMED_FREEMAIL=2.16, MISSING_HEADERS=1.021,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: d0Tzk0VNXL/d

> This won't work on read-only storage.
>
> > +        }
> >       }
> >       qdev_realize_and_unref(flash, BUS(fiu->spi), &error_fatal);
> >
> > @@ -194,7 +206,8 @@ static void npcm845_evb_init(MachineState *machine)
> >       qdev_realize(DEVICE(soc), NULL, &error_fatal);
> >
> >       npcm8xx_load_bootrom(machine, soc);
> > -    npcm8xx_connect_flash(&soc->fiu[0], 0, "w25q256", drive_get(IF_MTD, 0, 0));
> > +    npcm8xx_connect_flash(&soc->fiu[0], 0, "mx66l1g45g",
> > +                          drive_get(IF_MTD, 0, 0));
> >       npcm845_evb_i2c_init(soc);
> >       npcm845_evb_fan_init(NPCM8XX_MACHINE(machine), soc);
> >       npcm8xx_load_kernel(machine, soc);
>
Indeed, we didn't consider the read-only storage case. Should we add
bdrv_is_read_only() to check as shown in the code below? Thanks.

if (bdrv_is_read_only(bs)) {
     // Handle read-only storage
    if (blk_size < fiu->flash_size) {
        error_report("Read-only storage is too small for flash device");
        return;
    }
} else {
    // Handle writable storage
    if (blk_size < fiu->flash_size) {
        blk_get_perm(blk, &perm, &shared_perm);
        blk_set_perm(blk, BLK_PERM_ALL, BLK_PERM_ALL, &error_abort);
        blk_truncate(blk, fiu->flash_size, true, PREALLOC_MODE_OFF,
                     BDRV_REQ_ZERO_WRITE, &error_abort);
        blk_set_perm(blk, perm, shared_perm, &error_abort);
    }
}
-- 
Best regards,
Tim Lee
