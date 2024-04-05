Received: by 2002:a17:906:4f0b:b0:a47:c39e:cbe with SMTP id t11csp1018037eju;
        Fri, 5 Apr 2024 07:24:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVcB+XOuVpZUwAqiugPVHZ7IrRQjPuyBN/ZQnAE8ov+s0ztgKpvQTCO9wX3K6woQQOmxBmUDP17R+l5Acu+ds9Nei8vKwhs
X-Google-Smtp-Source: AGHT+IFGYlb+zx9ZPFXQAs/K4KdH7nz9Vh+SWWoR5lho5WMmK5jmFb7jUwx9/hyzDJcxYMEGvIXe
X-Received: by 2002:ad4:5f8f:0:b0:699:2293:92ba with SMTP id jp15-20020ad45f8f000000b00699229392bamr1704872qvb.61.1712327050906;
        Fri, 05 Apr 2024 07:24:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712327050; cv=none;
        d=google.com; s=arc-20160816;
        b=O41CKAELPNRRZNY3I9hohEL47GfNf0QIcyE9PP5Wi5bza8TcEhkNLmbsFE6hngNpzZ
         cAcSKdJINgGcvELvjiJcKl154S5OWUonxx9uPHDigC5p9l52G4E0+IA/uanZpDzRRQaG
         K0OPd7vWXRpHHJW5yXGNexmk94ntSleJdaeJgLglTrOEx7v9m+jc8j6h4dszlNVcKGx8
         nTJrw2S5eQ3hruK36BL6WPl4sbIr+KJWDymWLBl4BZMbhNMG/TPWB5ob4nWcCLY/zhRb
         fMEx38GL7JqFPmXQgYGvEgcih0y1X0aOriNjb2oCEdIrBMungYBZeRixU1Amgj0/Yfvt
         lz2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=leLUkpbDgWbW3ocN/hoowLLoCf31KDYVEwQ9wDkrUIk=;
        fh=Ora7/9kiTSBT06IfVYAObxs+i8WhTjpBigESBlVHdis=;
        b=auWgh4Whik1nS6R7apulb0EHZhzZfyHifucmVElfL+6o0ymKjZbfBNMkkT0rXJPRFt
         9OciXXLXEWr0TrPc0RJeGxRXSQe35vvkMyE05RskroMrtxWJo3BgFgybRQJ+zPhCxkUK
         iTqqU4NKyXXvZWgfa65zm/i4fD1axmZpJYGkGvAjT67dRRf8Y6ufPKxGY8WWcb3IU8sO
         qFrSCwYafYIMOGopiPOE9Jvm0juimy2oK90hmOL5o/k7AzuJO+aph+cSAb1jP0689kOm
         JCgHdyURBNpBVnBU0Sh9crQW/E+yFzznIxjW2XhPVouyFuXKcUlZ5keQjEmPxdhdkxl7
         hcIQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=szSbM9qD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ec14-20020ad44e6e000000b0069680e143b3si1846925qvb.556.2024.04.05.07.24.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Apr 2024 07:24:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=szSbM9qD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rskTy-00045r-Ks; Fri, 05 Apr 2024 10:23:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rskTx-00041G-8n
 for qemu-arm@nongnu.org; Fri, 05 Apr 2024 10:23:53 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rskTv-0006BG-CX
 for qemu-arm@nongnu.org; Fri, 05 Apr 2024 10:23:53 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-56e2b41187aso1730778a12.1
 for <qemu-arm@nongnu.org>; Fri, 05 Apr 2024 07:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712327029; x=1712931829; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=leLUkpbDgWbW3ocN/hoowLLoCf31KDYVEwQ9wDkrUIk=;
 b=szSbM9qDLYY++vRjBmJzby0FqlphxCOraMpYYpVgryJkF7UtFGWebBdlXlXZU+Jj5I
 h1336oYdDAZ5oV+Z7xOGjDHKv5maSZqlDHeu3HPCJy9J9zr+PLtuLSsEjVQHywxy6t+8
 9c99y6PGGfQse9UqnpYBpSe4RXSTP/6T8Z1eJEEZBvDw3ad/8/UXn56Bices+rWGwDr+
 ysTgIWSDkkYCRpw00hN2HZBYh1bK3OOX05hQHsSVOxi75OoOTWcj+5yXgtHK7k+uH0/5
 CuG7VUIckMZ/Ru9U6Z8dYrgAKIfLDpqEOzmZu8fKhciOeD0tK3gk/uK8wzbV0fp3sWsu
 8G/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712327029; x=1712931829;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=leLUkpbDgWbW3ocN/hoowLLoCf31KDYVEwQ9wDkrUIk=;
 b=gG2aK49tFxrs3QG3AvN1wh9f+zKdt0N6qWkXU5yTH5tnw2vxHqLII/QLyBBmFKefNA
 Cl5yLm4q/jDyi0QXQ/t3RVSO0vvVHxpHkRn/wIzqHmt1OLzHsXwGJe3EBKClxoSvbmqW
 +N4luY5Zlb+R5Dg5cOP22FiHGypU12zIEIgCfNTU4vlUeYugRpuXYA7kPIX76kXTD5UO
 UfHHshACZEaoKhcqGGVIR6KXPkZHLXy68XFkGljIalwKYigNrEgUP5R+xykYcfj405LY
 idsyg3qxATQMXXzTNo0Edd0U2HdKwyRktIUhsN9pXHXWoTrkDDMl0d2fRqbOa8ih6cHC
 n1CA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8ukBIDFGQigFuVO2lM95sMy+oNBBlz2jArQsxKDw12ufmyVz9ctc9p2HxykFaMCR4mJxCV1352pEdoTEvlDjydq3d
X-Gm-Message-State: AOJu0Ywjdqq773QtVMRsSVjyO/AYxREa9ZOdYiofSmGawDbS35IxQWsq
 9MK/KoRiqBxwAFX/BnIR6JZqZj5Zu1SSagX3A1A0Px8yf7KiWjRuFdALS2lCHulbkd6rIyhGER4
 4cYWv372LX0H0qFqR0iOxeyEtwMviFFPIp0/bo/C1Z6tCaf3q
X-Received: by 2002:a50:bb29:0:b0:56d:c85a:7893 with SMTP id
 y38-20020a50bb29000000b0056dc85a7893mr46547ede.8.1712327029265; Fri, 05 Apr
 2024 07:23:49 -0700 (PDT)
MIME-Version: 1.0
References: <m3al6amhdkmsiy2f62w72ufth6dzn45xg5cz6xljceyibphnf4@ezmmpwk4tnhl>
In-Reply-To: <m3al6amhdkmsiy2f62w72ufth6dzn45xg5cz6xljceyibphnf4@ezmmpwk4tnhl>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Apr 2024 15:23:37 +0100
Message-ID: <CAFEAcA_nfWXKEkbqn3BKkq9Rh-hHN=xBV7XWFEBpOfbdP+SwtA@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Fix CNTPOFF_EL2 trap to missing EL3
To: =?UTF-8?Q?Pierre=2DCl=C3=A9ment_Tosi?= <ptosi@google.com>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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
X-TUID: WR9Dr2wjG31T

On Thu, 4 Apr 2024 at 17:36, Pierre-Cl=C3=A9ment Tosi <ptosi@google.com> wr=
ote:
>
> EL2 accesses to CNTPOFF_EL2 should only ever trap to EL3 if EL3 is
> present, as described by the reference manual (for MRS):
>
>   /* ... */
>   elsif PSTATE.EL =3D=3D EL2 then
>       if Halted() && HaveEL(EL3) && /*...*/ then
>           UNDEFINED;
>       elsif HaveEL(EL3) && SCR_EL3.ECVEn =3D=3D '0' then
>           /* ... */
>       else
>           X[t, 64] =3D CNTPOFF_EL2;
>
> However, the existing implementation of gt_cntpoff_access() always
> returns CP_ACCESS_TRAP_EL3 for EL2 accesses with SCR_EL3.ECVEn unset. In
> pseudo-code terminology, this corresponds to assuming that HaveEL(EL3)
> is always true, which is wrong. As a result, QEMU panics in
> access_check_cp_reg() when started without EL3 and running EL2 code
> accessing the register (e.g. any recent KVM booting a guest).
>
> Therefore, add the HaveEL(EL3) check to gt_cntpoff_access().
>
> Cc: qemu-stable@nongnu.org
> Fixes: 2808d3b38a52 ("target/arm: Implement FEAT_ECV CNTPOFF_EL2 handling=
")
> Signed-off-by: Pierre-Cl=C3=A9ment Tosi <ptosi@google.com>

Oops, thanks for the fix. I'll get this in for the 9.0
release, so we won't need to backport it to stable branches
(the commit breaking this only went in in this cycle).



Applied to target-arm.next, thanks.

-- PMM
