Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp420146lfq;
        Thu, 7 Jan 2021 08:14:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyAy5GpvF0VvokK2ciqk3AQUNZksF4Mn04Jn8g2U35DIXf80+rlw1qazWcDTu0lhEAkLc4f
X-Received: by 2002:a25:3587:: with SMTP id c129mr14118467yba.223.1610036052480;
        Thu, 07 Jan 2021 08:14:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610036052; cv=none;
        d=google.com; s=arc-20160816;
        b=KF1gIPL4y/iMeht3C5y+O+R+skVnllyL27RBxHoeSl+eYGE5uYJ4MmHY5dcMemIS54
         ml3SjrDYSABkb1+zlW4OFFkdlqKdULP+gy2mOLuxrP2g5f7Xm4iHZto+cxw6Jv+7E7D/
         N72fe+ZCwcBtPu6JKqZGCyadH9aAz54nJsAt3F2wx8tNKb5WciU2Q9CncHvQG6F3YrFi
         TuL6ETzXDLMrvclXxyLXfnw+oxCSaNitlfCtU1p1bZI+YhfFSfDkZopnlni7LUl12Vxe
         sYUqqI6XofFRm9wjP88ONyN1GTHz7wxty/eCTsbH5c4WnO4v5HIoo7Pw8sVYl7ymUrSr
         TTLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AEboNhhmoWOnJWz6M0/5CIQ6xxo5Rj8KOVpbivYh7i8=;
        b=HCYIZIwwzynAxaO43/JKeAxs9YhT8nRHRcfO5mPoY+gXNQtq8EyrSehS31uZmcwoUG
         7EBxEP96FZvomsJi2TCA1jtu0A6LaGp6BJU6P8ryR8FDB0eLZEGVuopmydSmbw8Bhgq6
         yCfKh/dJTDkDKef5nOmzdaPc/VMRpX+S8+A/JSdEGNu4C4f8obW7i/LJ1BAFNLBKz6/p
         G+wO1q4uBv1X6g+tcgpC0PVSTcwqcsYpCJb/2QEk+e3tyP3lqt5x9NHYl9i5s0Z9DcPl
         NZlmegZIsEUkUEe3fhtz72nFYWfGapPb9gms8HCS5oEpgNdIXKFk8iEssqHuceYdXW/E
         iX5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dkFemps9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w14si6522319ybq.60.2021.01.07.08.14.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Jan 2021 08:14:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dkFemps9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kxXvP-0002xN-TQ
	for alex.bennee@linaro.org; Thu, 07 Jan 2021 11:14:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxXvG-0002td-Oj
 for qemu-arm@nongnu.org; Thu, 07 Jan 2021 11:14:02 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:39811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxXvF-0003R6-7x
 for qemu-arm@nongnu.org; Thu, 07 Jan 2021 11:14:02 -0500
Received: by mail-ej1-x62b.google.com with SMTP id n26so10436650eju.6
 for <qemu-arm@nongnu.org>; Thu, 07 Jan 2021 08:14:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AEboNhhmoWOnJWz6M0/5CIQ6xxo5Rj8KOVpbivYh7i8=;
 b=dkFemps9mfTXazMr1b80vjlFpisucCauR6m3jwTpmqjHbxPoTlKo1NbMSV7tHZDi2s
 pk8cIxhdx5tikeQS6ZmyBv1kbJ9RD/lka4WOmEHbfM2XU2v7TmhWyArZwhnFqnGYiQg+
 KBDjEwASSdxuRx+6at+FDEgot+9r1CpB9+CCHIoTtB1XCBdoQizJkxmFiSDa4B3Lhdby
 Vx+DOh5ecpA1kBD4RGiuSvNmaX2gFRPKVzpwhRZQQygBmGRYyEHN9aI8j3rU6TAMwU0J
 fjlF8NZHiLpGvq7AUiEUyXyYcEbN29jgs1gHTNPWR2x2XHGrrQz/Py+L/bV7GM/qOqei
 4C1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AEboNhhmoWOnJWz6M0/5CIQ6xxo5Rj8KOVpbivYh7i8=;
 b=OiiQ2xZWOEyzMoZVW8xQABJBEzb/IQkqG56qXdFDXbmhQ+ZBDahrMEypb3Kp0p7cKt
 ZfjXORMsxClX0nw0si/XZjb6fFWCITsGNmVILz7eKSmL1pqgN/1XgbpBNdcxzxWvUt8Z
 j2K1NIqdMBLwSIoLmRvj1LX6bSAXwSLp9AT5BQPd5IQyVi1VjifvYn/BSojwogOyZQ73
 J/drrhEKx9jYo312Ti5T6OrhqqploIqSYR3QsXrsbCVGt4GeiNEaBJ7WJBb6UIC9fA3Z
 Ttsp6LF8DgIgJxDa5HnAemrw6QYTky1dICzws2uCU+/4D3gkU5OWjtP9MBZ7lp9NS7+0
 6llw==
X-Gm-Message-State: AOAM533cOLO7r8XabAywZQLdMcAw4A/wqdEAovYb+v8QueRS0PUKnctY
 NtTaXXLG+AkpxiByL8n5n9OERTQKDV714xfNu0VX+A==
X-Received: by 2002:a17:906:31d2:: with SMTP id
 f18mr6745818ejf.407.1610036039732; 
 Thu, 07 Jan 2021 08:13:59 -0800 (PST)
MIME-Version: 1.0
References: <20201208180118.157911-1-richard.henderson@linaro.org>
 <20201208180118.157911-13-richard.henderson@linaro.org>
In-Reply-To: <20201208180118.157911-13-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jan 2021 16:13:48 +0000
Message-ID: <CAFEAcA-krGGkfCnC9ufhOCAYYASY=v-YFqgaJfc5K34U_fiVTQ@mail.gmail.com>
Subject: Re: [PATCH v2 12/24] target/arm: Enforce alignment for VLDM/VSTM
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: np8B89UykXu+

On Tue, 8 Dec 2020 at 18:01, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-vfp.c.inc | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
