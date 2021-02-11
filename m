Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp2182403lfc;
        Thu, 11 Feb 2021 03:40:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwbpYOc7G06XY+HwAfwriJXMVqw0ryDMibcueyY0PEfPPlvyZYxEmusYMXEibi54w9qL9k/
X-Received: by 2002:a25:ce51:: with SMTP id x78mr11026638ybe.198.1613043610898;
        Thu, 11 Feb 2021 03:40:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613043610; cv=none;
        d=google.com; s=arc-20160816;
        b=qd6xmrMhLx94w4nFefE1WYi6++OG0TM2jphTa8JFuBA9qPIY4rxSRmoyZt50fg2VqA
         Wi0ZdjHFa3SkEBOjq7gJA2Xj8LlZs/RRW18anGbtVcmxVrPaQyekoXbY658wNc+c93ho
         d7gpGk+sJ52XDwPZHyhr+fXjn7H82JgUuBfvbcCDDmlZfJC4vD31RgYWOx37mDRZkNVo
         JwK2jrob3LG7sUo3yjUMX2C5cDMVJoAOqtGfr7QGEcHMjwUshZtGUhSDQUBl4XwdUoVN
         3SGKujEdDk4m59jIp8mSmc5Nsb2NPRF7/8gIyYNHtVEqEpdc4DoxAzroNuzK5AmVtj9h
         4dQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=57ghFSysUM66+eyX4VVr39NE87Z0OFzTbYVug/sHOE4=;
        b=iSEyfmIHinAIz9OGUmvyKZoC0JuUVth5IvVHXPgpI2eqMvuuJADrnVG0/I8rcf76Va
         pwLhFxOFc+wSk+lJvlgWSMmMuHDTdz72L8YithFIbosnsmunSA2RNfJHy4wE8OtzGhBj
         p0ykaEXuVl5rmCMlO8tVSfrsWxjDvvhPbdi2YOFZU91OH69xsDu+a7iIQbV8R5N6y+El
         968thagV40V0yQt6x1lwpznc9Qbm60wS6+xRjnIgCXvLYe2F9SHM2Dh4r1FuR/Z3Rs8L
         fnR6OrNsWHsxpMPfa8pcp/kjf3g9HeTY76jpvIYxdH1t0sYgMWRK/PycvOa8Ff1fbPdw
         Y5Iw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="eo/vtvZO";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t16si5409672ybb.358.2021.02.11.03.40.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Feb 2021 03:40:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="eo/vtvZO";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lAAKQ-0007gp-Ae
	for alex.bennee@linaro.org; Thu, 11 Feb 2021 06:40:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lAAKI-0007gR-1J
 for qemu-arm@nongnu.org; Thu, 11 Feb 2021 06:40:02 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:39787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lAAKG-0008Uq-H5
 for qemu-arm@nongnu.org; Thu, 11 Feb 2021 06:40:01 -0500
Received: by mail-ej1-x62e.google.com with SMTP id p20so9578786ejb.6
 for <qemu-arm@nongnu.org>; Thu, 11 Feb 2021 03:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=57ghFSysUM66+eyX4VVr39NE87Z0OFzTbYVug/sHOE4=;
 b=eo/vtvZOMELpo5l3T+YQPMu5MI/VInYOUiyliueN2igFlDSV6XiwYlmC8fLK7wkmfv
 SYK4/4RGD9gJcr1q+NlH35RjAjW+PywT9yyR18R4agvALzUp9jIiZxuu75wZVWMGvnn2
 Px9NQpn7LHbXURB9X65oV7iG+lbxZ6Fal/TS2mv3jZ3ETjmpH6999W4GCBa6aU1WFryJ
 uCaYI7thbM7S/0KNwCG5eigWnqnSmcQvICjclwYSqc68tsB4SBG7CcY3x+ujixLSbt5p
 vO6SQ8ncod+TRNCJrdClWwC+SCjmk1Z/Uw+Xef9VlE+DI1MQ1Y1TYF5TuMlUdY17jgE4
 GKmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=57ghFSysUM66+eyX4VVr39NE87Z0OFzTbYVug/sHOE4=;
 b=ZkTkWqHFSNa+9G1BC3YT/5i7nU0lrXBt0qX35gIAj3JOJFlpU/HnhkkRggXFHitiEc
 b2hzzKDitL+Uocc8j+L/b8j7VSApOenu4qcJO0BVLRh1GOtNvrrLUTtEyS57503QP51L
 yN96X95tz7Gc4X7NEy7YsnPK5Z10tsZOVv/NYOvIPZNQzgCCJGns31itj/9DJC7n2GqM
 Ec/Nut41btljBDyh3ObnG7FlREzX1Ycyxc3ULAbxlO0D9FgAcIW/70vrkeeyLowZtXmQ
 zOIV4qCfpbyP9KD1NtTd2+HdPufALSPwYEL3dOTqyJxGOSBtvR9QqeBZySK4+AYuGtdp
 UMLg==
X-Gm-Message-State: AOAM533ZmRFE1IJyI/zdKK2xaBXuY1mNE4/SJw5516kltCAxTKwHsXyO
 eEzxB27/pWi3QGQOTN0hDQVdIMAMtQtW0JO40Iry3qvcnIs=
X-Received: by 2002:a17:906:2747:: with SMTP id
 a7mr8346430ejd.250.1613043598941; 
 Thu, 11 Feb 2021 03:39:58 -0800 (PST)
MIME-Version: 1.0
References: <20210210174122.410690-1-muellerd@fb.com>
In-Reply-To: <20210210174122.410690-1-muellerd@fb.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Feb 2021 11:39:47 +0000
Message-ID: <CAFEAcA9Qa_+oxEK59FF0z1QdXsBchUpx6jYZRUTAnZEBVb49Zg@mail.gmail.com>
Subject: Re: [PATCH v2] target/arm: Correctly initialize MDCR_EL2.HPMN
To: =?UTF-8?Q?Daniel_M=C3=BCller?= <muellerd@fb.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
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
X-TUID: wPdL/EapkP5e

On Wed, 10 Feb 2021 at 18:05, Daniel M=C3=BCller via <qemu-devel@nongnu.org=
> wrote:
>
> When working with performance monitoring counters, we look at
> MDCR_EL2.HPMN as part of the check whether a counter is enabled. This
> check fails, because MDCR_EL2.HPMN is reset to 0, meaning that no
> counters are "enabled" for < EL2.
> That's in violation of the Arm specification, which states that
>
> > On a Warm reset, this field [MDCR_EL2.HPMN] resets to the value in
> > PMCR_EL0.N
>
> That's also what a comment in the code acknowledges, but the necessary
> adjustment seems to have been forgotten when support for more counters
> was added.
> This change fixes the issue by setting the reset value to PMCR.N, which
> is four.
> ---
>  target/arm/helper.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>



Applied to target-arm.next, thanks.

-- PMM
