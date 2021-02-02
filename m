Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp194955lfo;
        Tue, 2 Feb 2021 07:07:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyCgdDHoESHl0ZxLQS372vEHQb+0O0e8Apne41EE7xCWuGNFe8gU+f1RQzghWw57CkqQIIR
X-Received: by 2002:a25:abae:: with SMTP id v43mr21054800ybi.188.1612278463376;
        Tue, 02 Feb 2021 07:07:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612278463; cv=none;
        d=google.com; s=arc-20160816;
        b=BdPHl44kmSqatvCUrTExp0fs/iAM4RiwkTfI8yA1AYTbG7WqMhH3D0P2ae0dxks582
         mUmTJyBVd5C5mheAJaKJtdR0N3Obc7D1tFL5jvvV3FBzYP5PmUEcdyeNkKtoVqSYBnpA
         FTPUrseO35QsriHox9C4yNBMtQEOlJH6inSlC+x5+JxXNNm0X7QDpcQA5kl+IARaTqU/
         Ta1tr5hAPrXbuWesXveCnawcR5eo3yB18mlybRYCZKl08II6S4E7o6X+yF+2MC6ClVtV
         Taq/Pxwi4uRibZxedqwUsr0nD+Li0sHbqm+tl9hQcUucE5ma0PacyypuKvGIJ9EoxMeo
         lSnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=l7gnJI2u7UQBh0yMSxKGhPpaXLuDAZ3+xXiodVd4Zoc=;
        b=lUqLm1qN8dBtwJL7NFpHlINZINg/CT1SBBbTeHdTKE9LYr8irUgBPVWZvVUehHaZsR
         g+U61rGETMAOpN2u8DVyFjGj/EbkldfrxQMC4jZ654Q/o8pc0SJo21zp9AReV1eUbb28
         vH+LMr4/LMfF3AD8jlqbLaVQobB1ihE7QIFsGNe3Gv4DmXKC1iZJwgKZPakdvDpSE915
         hbRG1IjkXzvSzZkiXgKZvcP/hx1ahbMK83sSPqEywIo7F0xvr1bQoxnJhe4OE/IJjg/e
         Jg2VRUx7cYHmvcRfcaakDSyDQBaWXRHReOP+mrQpra6Ihd8Ss1SyepDDrw2XK+V32vvD
         N0qg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MMxH0Q4a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q82si22547378ybb.349.2021.02.02.07.07.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Feb 2021 07:07:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MMxH0Q4a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l6xHK-0008HJ-K5
	for alex.bennee@linaro.org; Tue, 02 Feb 2021 10:07:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6wxi-0008Lj-9M
 for qemu-arm@nongnu.org; Tue, 02 Feb 2021 09:47:29 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:45742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6wxS-0003WD-Nm
 for qemu-arm@nongnu.org; Tue, 02 Feb 2021 09:47:22 -0500
Received: by mail-ed1-x535.google.com with SMTP id t5so2126283eds.12
 for <qemu-arm@nongnu.org>; Tue, 02 Feb 2021 06:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l7gnJI2u7UQBh0yMSxKGhPpaXLuDAZ3+xXiodVd4Zoc=;
 b=MMxH0Q4a5cHGXQ7ToXpvb7ILVVCz+0Xl09hmCLZmHHFGdDfvybWeEWpeuTvOIecw5F
 RlF7++tmpMLAcWj1upZF9Ty7aSPVT44fAY3LTJac8KsFX2/xpBhIBwfMeC1sDmWqzhn6
 qnAJ1o2ZxmjxzEO6UAXPk29FmLIaFg8QOBYtDKohv7AtiqnOcTy77FE5XnOvmOpCCn/I
 Fm0S3mHUoWFk0gT8qcphyu6C4a7Bs4/T52Zm9WMdCbV3XorsWprtikcJIWB0pBmXItBv
 id2POZM8pdoZrEUI+crCDFKboPpZS2ZuIa8Xtb9jn2Y+IEvgnixVENjh8OJDdELDy2oN
 NhTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l7gnJI2u7UQBh0yMSxKGhPpaXLuDAZ3+xXiodVd4Zoc=;
 b=hLZKrhtXxK+wEoHz7lT4QYu4bq+nPnoxkgefYEYMJZQ2AqLkB3iLRpq8D4RjgG+NzD
 HaWbXsb0bySDL2Kij0kOoTyfTJnwZxbYpXKsQ/1uKvQ855HcmNBfiy/ARKB8HHRBCq0Y
 RHpUrrVu4BRD9XBUrE/8riHAcPO7oU4boktSBfWC76WvM30ueZaq4Czi9sNg3X8BhWB9
 VysIo8xo8lX6vnl0xa+gx8paztizTpT0BHq0FjSUUnmxQWByi6ZAmLkC9icVfVSdVci4
 ov4kxrZJR0dPAK81Vim3EjEQOlpKQiefpqbaOkSU6KYDBtVtqoBpWBXy2nsxwqEALKWZ
 2bWw==
X-Gm-Message-State: AOAM532l8+LjBeiJxjjpwj/MDZOQRORRUNly5Oo+19IHtOpziHvl2dwm
 y3DQ43elg5U4tVIB2TNKrgBV22vy9nC5HSSoE/ncAw==
X-Received: by 2002:a05:6402:5107:: with SMTP id
 m7mr23751781edd.52.1612277227985; 
 Tue, 02 Feb 2021 06:47:07 -0800 (PST)
MIME-Version: 1.0
References: <20210128224141.638790-1-richard.henderson@linaro.org>
 <20210128224141.638790-22-richard.henderson@linaro.org>
In-Reply-To: <20210128224141.638790-22-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Feb 2021 14:46:56 +0000
Message-ID: <CAFEAcA9wWVa163O49FbYdNae8MN4rhdpSbLdFNELpUHZDuTyrA@mail.gmail.com>
Subject: Re: [PATCH v4 21/23] target/arm: Add allocation tag storage for user
 mode
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: w1ZL2bBIJUdh

On Thu, 28 Jan 2021 at 22:42, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use the now-saved PAGE_ANON and PAGE_MTE bits,
> and the per-page saved data.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
