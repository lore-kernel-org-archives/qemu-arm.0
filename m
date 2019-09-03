Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp135954wrp;
        Tue, 3 Sep 2019 01:23:50 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxLIAHouYK87Vj7wPNRXMy5zNu5ZzUhvjZd469nE3WLKE+N8d2hPNbnIROpNWYL7GYmazge
X-Received: by 2002:ac8:2ae9:: with SMTP id c38mr11924607qta.311.1567499029959;
        Tue, 03 Sep 2019 01:23:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567499029; cv=none;
        d=google.com; s=arc-20160816;
        b=Mi3x7H88C2OjqJPToMm4FInZDhqsVz26JovQApG4Je08NXBlPNfZL8LaGLzz0TpCqd
         KWM068nLbLPg29xKN9TAdCp+qpYUQlPJ2qEzfvxcpGd/mDbDUgONwMQOHGtmsmBhYHmK
         KN4SAI2lsLOkk3UxYgJ0Gcdt1bWOpPcdOm1u4pOT9Dg+EoeJYfMspE4O4AUzDkO1suwe
         ySp0BAww2SmcBDKtXOv4WyaI+MgGNFnPQbfseRa1Fdqe3nOxdQs38MH98T3OAXdJirki
         3YsHAGEPqKE48YC+cObfMQXNBkCmctV3LYhgq70o4YUoqBT1DCeX/1vOhsP7SWvmIPTQ
         3lvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Pi/PZdCdGJ+rlQ9IDqkNpKakJT+tNtOHVf3SZ43tHQU=;
        b=OVWJP+0Rt4YiaeNiqw1ANENtGr3CCuBm4a6F3u0dv6HxlFcS3DeyO03SJdksqr9VWP
         sBE1/JYn9uewpONC1InWOOcYOtVnbGN/A036tGFL5KYWCbeEY6cRRfCpRTjViS0SHA4Y
         oqNsBiCil0iYlcB27MNAqBcIANRDTvBAWDJMTNlswFothS1TIQLE8DBstQIwIgpRWMPY
         8k1VcW5XIO5AZnXWUrUiUy5X9IvQiFBeCokfT5j4VOQIvg0l7TJNt8Xa9onQ9/edab1l
         dzICxaW/JZ4ToNusiWLc2SwSTIH/3gz0FBgFnCpbNng0wPdqtyqLLvKOP1bmWfbHnIva
         CE1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xTBddTOD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i14si2629819qti.277.2019.09.03.01.23.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Sep 2019 01:23:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xTBddTOD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i546P-0006by-Cy
	for alex.bennee@linaro.org; Tue, 03 Sep 2019 04:23:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49721)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i546A-0006b8-8j
 for qemu-arm@nongnu.org; Tue, 03 Sep 2019 04:23:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i5469-0007pY-7W
 for qemu-arm@nongnu.org; Tue, 03 Sep 2019 04:23:34 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:34839)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i5469-0007p1-1e
 for qemu-arm@nongnu.org; Tue, 03 Sep 2019 04:23:33 -0400
Received: by mail-ot1-x342.google.com with SMTP id 100so15925878otn.2
 for <qemu-arm@nongnu.org>; Tue, 03 Sep 2019 01:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Pi/PZdCdGJ+rlQ9IDqkNpKakJT+tNtOHVf3SZ43tHQU=;
 b=xTBddTODmCAvn1d1CsVgwM/HUlXd2LTcWzfFwMF4bMYb0CAhN1RjAPy9teIWTWyFyi
 masWI8b+SKQ4sHr8q584E8Re4cHtqsQtBd+weh9t/eiAZ653jqasLrjXxd49lnERjmWG
 GD4SLTuN25L2gcW7Kny2iKIVdRK2YR2oKgn+Nk5QxqaD8juW00xEPTSUr+fiqY34mzbT
 T0+ymrqrW3d+M3p4eeyckEccHHmW3P4rO6oWKSZLK8c7G7/eJbXJBBP66RkPdPpac/Xe
 C2ktVm9BVDGKqnXw5U+fOXu2QHKDeNqOuB2/FOlZx32aAMPZjtfJjADfRV3GPpvBvavD
 zFhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Pi/PZdCdGJ+rlQ9IDqkNpKakJT+tNtOHVf3SZ43tHQU=;
 b=UPWcFjXuOrONd3+HIvSDozg0PdouJ9MTK+DWa3zm60V+iTGaAu8wMg6hnyhxEP1OOA
 hUknNjcozypXfAzoLs8uMwttEyvT+3KaoWCqYjdqRDZeMpH220dfWX76Cf2uJgjD7zVo
 7JblgrQBKnfcH/SWpWapzxVsib8ceubLBWD7SJWTcK81FvMlBPYAzaccZIYH1WlKuoF+
 eaqEhBoSqK0diJ3Fv0ineyuFlsgiskpQK74hmS5rIFbYSkdydFuJgMI572d7xSVDDW2j
 s4yVfks5CrH46Wj5NpMJiWfJAvTnUo9z6DIfShH8RrmRI7yEhaTZ9Ws7TElXzG192GpF
 Wu1A==
X-Gm-Message-State: APjAAAWk5aym5ITVxo3liT1bGa3zMEYXJoMjiAMANHOWQWULCXxrVW/1
 1baMTTB5AMm3Pzw+/peiUofnNN61UPqHE1kLmLEimA==
X-Received: by 2002:a05:6830:1015:: with SMTP id
 a21mr28050474otp.232.1567499012188; 
 Tue, 03 Sep 2019 01:23:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-67-richard.henderson@linaro.org>
 <CAFEAcA9AbEzR97-2gvpPAbGrGHx_AxGgVhh4-BDufTQUX0gM1w@mail.gmail.com>
 <7f4eac6e-486a-3d99-b533-5fd4ac41864d@linaro.org>
In-Reply-To: <7f4eac6e-486a-3d99-b533-5fd4ac41864d@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Sep 2019 09:23:21 +0100
Message-ID: <CAFEAcA-3eqc-85tf_6BYPGDFXyOe499xc2YiV5YoEJMiOmJi1w@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-arm] [PATCH v2 66/68] target/arm: Convert T16,
 long branches
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
X-TUID: LRosgfBE+X9Z

On Wed, 28 Aug 2019 at 01:07, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 8/27/19 2:34 AM, Peter Maydell wrote:
> >> +    tcg_gen_andi_i32(tmp, tmp, -4);
> >
> > Minor nit, but can we use 0xfffffffc like the old code did,
> > to avoid the reader having to do 2s-complement arithmetic
> > in their head to figure out that we're clearing the low 2 bits?
>
> I always preferred "x & -c" for exactly the same reason:
> to avoid the reader having to do 2s compliment arithmetic
> in their head to figure out that we're aligning to c.

I guess this is mostly a personal thing -- I don't
have in my head any idea of what doing a logical
operation on a negative number does, so I always
have to convert it back to "what are the actual
bits here" before I understand it.

thanks
-- PMM
