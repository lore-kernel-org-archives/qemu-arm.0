Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2462844njk;
        Mon, 27 Jan 2025 06:10:29 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWNlRNLu2mIErhB4JYWDF/xBPl8EpsJYoQKhn6zrKMCM0h8TuhxqQdWzPiqRuJvP2ufmjcTjnOZsxk68g==@linaro.org
X-Google-Smtp-Source: AGHT+IHfgohxrk8Xzae7DpMClY+xf+y4tjRtFT6vKmeAHKv/9w67k0Q/sN8UvQs3+BuxykFl59L3
X-Received: by 2002:a05:620a:2804:b0:7b7:106a:19a0 with SMTP id af79cd13be357-7be6321c827mr5129099585a.24.1737987028989;
        Mon, 27 Jan 2025 06:10:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737987028; cv=none;
        d=google.com; s=arc-20240605;
        b=XpCZkyqj0cq1mxV2Nyg3YD7TsvmzI0/vgfYTvm0AXIcFXai0asWVXGE1x33f5Ej9mI
         q451o5TGcwwg3HEdWqRFqeR0SJPt6FivnevQV5JT+TbTDc75TMLJe2yY4gsUJZL5j3WB
         lDX5QSDoiooEhOAAXLuGZr0L1/iAj7OpV1cZW/qw7m1hTN0UFzHs8NjwoKFET8UL/3C7
         uikPjl84KGl4uooKKg6bPbXZuDXaSieJARVNG31+S0i7w7g7BPy7ad7z22cUFD+c5xNT
         kHt+F9nulC8zIzNXcFKpxE0WvfJe/HE/wUs/GbD5UYvNI/6VeYtgeETxgmos6JDlOlyU
         ZRjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=DJ7xkUQYCW6Q6JjkzKHpSAKv35gY9zQyjpYaT6M0TdY=;
        fh=gBTz3HIkpwCUoJ5CpKeMmyO+nSBQjRJcJEsjhNzd/L8=;
        b=BBYLajeeS1aYQ4yS7XU95jcccw9RDsUl0f59k71QiHQmKPduY8xFyRtAGm68nB+ELH
         Arsz20OixxcZFb5oCa1lgBQkN0sJWnnJn8rq1rknsH/F7wlqbgqS5sUR9me4NgN2OodF
         qB1wuykcfbyyuakgKiu1L4209pyXd96jqJnB+pGrVrIJ4yFh2sjqGQUzdKmNESvQUq2M
         /ZoOfgnySRyAHVqD/M0CR6rb0Mw0wG9DbuA9dZFy8xPs4Zfnk1oQU+773LYlL1bcpsdZ
         U0JzKyrNOteMOIFj9UkhTHbNsxlSh5j8+E1wKi6s3VuzswuCgXMZkyRX7Ws3AddD3LoC
         8hMQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ajIXSFKy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46e66bca13bsi111402771cf.647.2025.01.27.06.10.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jan 2025 06:10:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ajIXSFKy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tcPoU-0005yW-BC; Mon, 27 Jan 2025 09:10:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tcPoS-0005wA-Eg
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 09:10:04 -0500
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tcPoO-0001C0-6F
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 09:10:02 -0500
Received: by mail-yb1-xb2a.google.com with SMTP id
 3f1490d57ef6-e3983426f80so6674776276.1
 for <qemu-arm@nongnu.org>; Mon, 27 Jan 2025 06:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737986999; x=1738591799; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DJ7xkUQYCW6Q6JjkzKHpSAKv35gY9zQyjpYaT6M0TdY=;
 b=ajIXSFKyDo3cOxUEJlp1+8757vM5lem/q+uOtCWtqIVwzN3sutXS2UeGvNo11F6wsL
 8AaYRYAbK9yqUyTTrJOHG17nl100V6k610Ti4iFMcqqLaB/qjtWokjL7VNHT3sup8tD/
 NdC6CTA1wChA24i68/i9se6oL+4ZouRF6doU+aBHzt1Mi1thiS+ctiIUeLP2H1xDp+/y
 mYwvxKyfBhPEux5XdYkmLQXEKb3n1pEV3TkJiHLiS+9L/I0ql6KjDKF03+R0dJibmZLO
 e9jUYF97J5q+uydS40Jerei3PNApmT1pPXG4iuyPUGMZYbUjiJ0FH3HTyv/jbH7Fq4qA
 0Bng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737986999; x=1738591799;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DJ7xkUQYCW6Q6JjkzKHpSAKv35gY9zQyjpYaT6M0TdY=;
 b=eKo733gr6hENFEW2ALlBF133z/BvPybSQPajJ++SfRsG7Mz5J31K9NO7RHmFN7kGeT
 sIcd9br0VAu0rRdSlBxfvElRGEjSUNbxhb7sfctGmM5eB0jtYr3rSMQ18h8lD624mEsX
 G2uYTnVkFWbtQJx8l/tsyO8ktO50Wbu613G4RaEK8/pS4HytFkQUNSXsosuObY3yRmRM
 VBlAjMSo7Ie5Sv7zuLzCxqsHfUNfBea4MFDTU9dRYURkKLfqoCgTnA4+zwdl2s8BcuVR
 qAAmHA+yWzpRA3MGjX7Qigm3V3T0N2Xqp2UZEFqSvdOz9B+FggwcgBiPHOG0jtxxPvV9
 78hQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvxpQJk81mg4++QJDqlWUmfLWMqhYy5C4mXBU6rmy0I96elhNINd99a5a/N+xwVEWfgYiVKSddkQ==@nongnu.org
X-Gm-Message-State: AOJu0YxWCwu+qnpFycJHSYPmc3++xKERdmvpH9O4dK4ouhrrIKMwXw0b
 k5CLNxLJjWTmLBxG4aEV8hh4YXfWhDc+QDiPYFy0Dz8rqgLU/TjYoGFtEz7I6czPIw4kGppM/4x
 H73YLWIULTkKaEUhE6BMMejSt3aCOtn+rDYdMhA==
X-Gm-Gg: ASbGncubiAZX5BwfxmvEqOvkEep3hMQRhxsLJosFk26iI+0RsMyKspI1JUMoDN9W8yf
 CoWhGw+jz0NRWNL1NZHgSUh9wBQQExx0flve63A5KZdVUijn8o5qBL1NJ2UZEeYw=
X-Received: by 2002:a25:c754:0:b0:e58:a26:6d9f with SMTP id
 3f1490d57ef6-e580a266e94mr14652364276.0.1737986998856; Mon, 27 Jan 2025
 06:09:58 -0800 (PST)
MIME-Version: 1.0
References: <20250110160204.74997-1-philmd@linaro.org>
 <20250110160204.74997-8-philmd@linaro.org>
In-Reply-To: <20250110160204.74997-8-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Jan 2025 14:09:46 +0000
X-Gm-Features: AWEUYZnrxXWnUMyfwlbvG3mWgV0LXRJcJ2T_93XbKIs0Jil4q4XadyW5wZlwi6Q
Message-ID: <CAFEAcA_M88CXQXF2N+=GU=QBFmQGYgMONXBnK1npR7Fu8AUw4w@mail.gmail.com>
Subject: Re: [PATCH 7/9] hw/arm/stellaris: Only create MPU when available
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: h9PzqlAiHuKu

On Fri, 10 Jan 2025 at 16:02, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/arm/stellaris.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
> index 655bf85e89e..d87587225c2 100644
> --- a/hw/arm/stellaris.c
> +++ b/hw/arm/stellaris.c
> @@ -1128,6 +1128,9 @@ static void stellaris_init(MachineState *ms, stella=
ris_board_info *board)
>      qdev_prop_set_uint8(nvic, "num-prio-bits", NUM_PRIO_BITS);
>      qdev_prop_set_string(nvic, "cpu-type", ms->cpu_type);
>      qdev_prop_set_bit(nvic, "enable-bitband", true);
> +    if (!DEV_CAP(1, MPU)) {
> +        qdev_prop_set_uint32(nvic, "mpu-ns-regions", 0); /* Disable MPU =
*/
> +    }
>      qdev_connect_clock_in(nvic, "cpuclk",
>                            qdev_get_clock_out(ssys_dev, "SYSCLK"));
>      /* This SoC does not connect the systick reference clock */
> --

This isn't actually a behaviour change, right? Both our
boards set bit 7 in dc1 in their stellaris_board_info array.

With the commit message updated to mention that:

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
