Received: by 10.28.173.206 with SMTP id w197csp2967544wme;
        Mon, 15 Jan 2018 09:22:00 -0800 (PST)
X-Google-Smtp-Source: ACJfBosZRCJSG0cuzZ7Ih1X8asNXxbJszGrumYOyLR4cG3xNp2Y4mCwB9zf9IG9xY6074ozOqr88
X-Received: by 10.37.54.32 with SMTP id d32mr2204120yba.389.1516036920638;
        Mon, 15 Jan 2018 09:22:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516036920; cv=none;
        d=google.com; s=arc-20160816;
        b=ukAd/4jOKXLx+R7EvdDSSGLMOFnTDv1cjHahAKNac4lMPE/VdkXjT749AaR0nCY5zs
         28XNhJK4aESGVk94nJeTNDZJevrSGnLISJJNtoLMuVtDUIvRK8lbKdw3lxjgIMhZYcHM
         rVK0zwOQD65mgk0w+/h5V96GSmhpeMise1dtAg3nYgI21/sBjwqjlLKSCGHQOOy2a1/9
         fbczF0qGgzCwlMxGvgqvrD696Mac/wN8Zk5AHzzEDysvHiG9sH9tF4afJYQHu7qI3qDX
         akvmsg73rdKxXd4F6s3B9YFeZltypAOWWVwUr4g5rlK/GcpwQECvaWy2TJWpa1GtvHau
         s1Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=rgTtrlAqoHSGtxUZjZVU/4FmHOOrPBk280yYNWBKZNc=;
        b=lYBaihaZIYBxJ1GtpBwX1DQtdgv4VpnQFVTrQqUlhK3FYj2/SPUQrPGtmWlGKusy3R
         Soua9ImGYAKgqLKT7jouulYLXAm81wRsdawdQqIQFyk3wMLcUP15EqXtlaTzuh/Tdt+N
         5uwLZaDi3orL5nUh7cS8R7M7oLhAzfPtjEUXyO0gVzF7ak3pW+T4V5MiNWKTJgRyRrug
         6S3GGFbF0PkvwF1BUXxAymDx8K9SqRgvSEeRRAY7LHB0pfg33qfSB44EzE0hl0vRZtfK
         ac50+oo+gs6DO7vGUlsSMRO8aVn1x4/HnOQGO+0b1p3aetIWF8/HaYwTyF93/sYlfE+T
         D1Qg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iuf9jQUs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a12si21987ybn.607.2018.01.15.09.22.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Jan 2018 09:22:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iuf9jQUs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49041 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eb8SN-0006L5-VN
	for alex.bennee@linaro.org; Mon, 15 Jan 2018 12:22:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41046)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eb8S9-0006Ic-L0
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 12:21:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eb8S8-0002Wu-SO
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 12:21:45 -0500
Received: from mail-ot0-x244.google.com ([2607:f8b0:4003:c0f::244]:33981)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eb8S8-0002WO-NV
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 12:21:44 -0500
Received: by mail-ot0-x244.google.com with SMTP id p16so11254094otf.1
	for <qemu-arm@nongnu.org>; Mon, 15 Jan 2018 09:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=rgTtrlAqoHSGtxUZjZVU/4FmHOOrPBk280yYNWBKZNc=;
	b=iuf9jQUsXxLnzKWzLdhQvz1unkpnenEhguYbDkFA9UuSrp0TQkDMOt5da6OWZSRiho
	Vp/BolQFwGHlzKXdNV6pbfhJE/u7l6Eb9910XaNnC7y+SzLrOlp8AM4zOL6S6pYKc++8
	J5gdIKz6Yv9Gcl12wlxf0FBVAD4DGnmqbu8v8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=rgTtrlAqoHSGtxUZjZVU/4FmHOOrPBk280yYNWBKZNc=;
	b=mWzNYh7W3a/ZsTYUBSVqpe4OuISMBh/DXxmMKkuV6sVcKpAGMkuSZ2gaq9o+JscOxK
	3QW0rNChw6g33k3W6L+ohrATzPUGWk162AMOj3eoTkR5MXByBw0OLTKr9S5Kegr396pY
	t7I857+dQAyQhv/F+SkUik9HczJND8UE7Z3Ldna+zcdttH9taUbMSt+wPRiuQsStwnA2
	lQsoXf7HY7coaVB7R+k25t7q1T9cGs4NX28S0p8YbV5atDtOutLIeFJW5KwjHQHbH9Tt
	WBvOElM/kWfLj/6fs6h85xn2b5i4//6dANcjNo7UQ44bRjmm8zhFPnNqoUtf7ZCQNYo4
	WZLw==
X-Gm-Message-State: AKwxytfTzTuBueMfu8dRrXIbNBWZMx7HhXtACCjja0h1AxlzP6vn7bZy
	7c/hp4wqUFzLN8LvUFR5VJfVDlOYpDaes6JOFiC28A==
X-Received: by 10.157.51.76 with SMTP id u12mr11447775otd.197.1516036903979;
	Mon, 15 Jan 2018 09:21:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.15.71 with HTTP; Mon, 15 Jan 2018 09:21:23 -0800 (PST)
In-Reply-To: <20171218172425.18200-2-richard.henderson@linaro.org>
References: <20171218172425.18200-1-richard.henderson@linaro.org>
	<20171218172425.18200-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Jan 2018 17:21:23 +0000
Message-ID: <CAFEAcA_MEhgNCQf9MvfPxLdhpNUMYFB9-rKKy=X7_p-tXkCD1Q@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::244
Subject: Re: [Qemu-arm] [PATCH v2 01/11] target/arm: Add
 ARM_FEATURE_V8_1_SIMD
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7UfsrVXfixTj

On 18 December 2017 at 17:24, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Enable it for the "any" CPU used by *-linux-user.
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h     | 1 +
>  linux-user/elfload.c | 9 +++++++++
>  target/arm/cpu.c     | 1 +
>  target/arm/cpu64.c   | 1 +
>  4 files changed, 12 insertions(+)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 715ec6a476..e047756b80 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1351,6 +1351,7 @@ enum arm_features {
>      ARM_FEATURE_VBAR, /* has cp15 VBAR */
>      ARM_FEATURE_M_SECURITY, /* M profile Security Extension */
>      ARM_FEATURE_JAZELLE, /* has (trivial) Jazelle implementation */
> +    ARM_FEATURE_V8_1_SIMD, /* has ARMv8.1-SIMD */
>      ARM_FEATURE_V8_FP16, /* implements v8.2 half-precision float */
>  };

I kind of prefer the kernel's choice of ASIMDRDM rather than
V8_1_SIMD, but the latter is the official architectural feature
name, so oh well.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
