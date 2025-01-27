Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2606195njk;
        Mon, 27 Jan 2025 09:46:50 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVTMKgKg2VxpV4YsIUqmyadaBL+EVSXEPC1D4GymI59bsvmmCUrn21HznCf5X3lMLnY75ZpcoExmTVtsA==@linaro.org
X-Google-Smtp-Source: AGHT+IGkMlot4R59Q2dZeIBCVJjyk/mPxcGBzYxy1ZeNa39puhqqB12aTvSgW5X0yxoY3lspZTR5
X-Received: by 2002:a05:6214:3d0a:b0:6d8:9124:8799 with SMTP id 6a1803df08f44-6e1b2134485mr636530476d6.5.1738000010076;
        Mon, 27 Jan 2025 09:46:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738000010; cv=none;
        d=google.com; s=arc-20240605;
        b=cGHZNNMb8UmnAkPL0WxD64xAbJ5QDzEJqRuPUC71hv0ILA72fybnAD33/w4ZXiOiNP
         OAisu5mFjGgXtWBZpfq1suKcQopg5IQxE+6xB/a/ARDX2wJ2eEuPpZobGUzjqS6WkO4H
         c+6MIYr2TygDu4oVXmDlwqIoraiwwgnb0KHvhsMr1t8dAqAvDKkPP6zCwbhpUpBKUkZU
         gSZEu9ArOs4k9bNvhEZ4HW1se9BHWZZ5cOeqHBY/GuMkZr3/DYZffSH6/h1ImVJqx93T
         58GmRqn6u4UmVfmowpz+ItQOI5/MBEVsuAyu88ffgH5LDl6dn5KGmnxJXiWDvDzII6D+
         RenA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=h7KuWQeQiyQZs8vKz+HO7IJDBNknrbKCj4huQPcEDTw=;
        fh=TfkJASJQZEi1u82yrjG4XvOEeKalzEvweFsBg5QB0FQ=;
        b=RpG1q/8qgBtvQ37vY55vcHz/I7DP46xNHubeRhW/buAH62YoKQ9Faqe5vdWmAusIF5
         o5n8gxdvWDG7y3TDfydzx3AsQxDpAKw8zyqnknH1bKG7t8hEGL/xOPldpyNGuFAbotDo
         b3Nel+1CN8POVhfwspNbBzXj9OOyi1ZjxXd+x63tqmghrQXA68TPe/G6cX6ybm18AWYx
         3WaqbKHfQCyJqSQi1hN8ldm1z+15OsDKuv8yRhiiMUSGy6niP3PCbbrhCqpKOh4fZwIq
         qxb23EjmZ0qgMskNtwppLvDQ9M4d/C2RRWJ60I8164RXhHvgCQoItC9TEjd0GwjgnmkA
         5hzg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="gj/wxJlb";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e20525c2bbsi114420966d6.84.2025.01.27.09.46.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jan 2025 09:46:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="gj/wxJlb";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tcTBw-0007LV-5h; Mon, 27 Jan 2025 12:46:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tcTBm-0007KB-EB
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 12:46:22 -0500
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tcTBj-0007H5-3q
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 12:46:21 -0500
Received: by mail-yb1-xb34.google.com with SMTP id
 3f1490d57ef6-e580d6211c8so7743166276.1
 for <qemu-arm@nongnu.org>; Mon, 27 Jan 2025 09:46:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737999978; x=1738604778; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h7KuWQeQiyQZs8vKz+HO7IJDBNknrbKCj4huQPcEDTw=;
 b=gj/wxJlbwtoBkrI1kIBa5fBDeejJaJwBQoNcBroc3YzgovkjgA5KrB5G7715jZoxSP
 oLdrclEujOB2Mp9WRZa6bub6NRtau7zqYMAiISfTThx3YxbujK31wH5xw/as2V9E/dnK
 1P4zROTupNru/Gvq1MCIhMY8QANVIpO8d7hvYgd89Q04En0F/mjd6gr12b7ZDI6pBs8W
 wYvTQuKoUhRLAD7F/AeNvojWCSRvATQY2RlKLx9pW2yAGA44jzoGpKw1POt2iYQrRd2W
 Sshm4qYxVlEicATInsQRBuI1Xu9dDoi+pULCIJl3i5EE6BMomhCGGzsViDDkf1SJHzPx
 SEGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737999978; x=1738604778;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h7KuWQeQiyQZs8vKz+HO7IJDBNknrbKCj4huQPcEDTw=;
 b=Zy0qExJ7Wb6zirI9NV0Q+EFDEXcSxTkoFQHCT4vGk1h8ZE8mFKIHqVkOjZG7FUmPh1
 TKYZEhc7WFJ6GBEA+WUPFYpxEObM1UeNx5W9NjYpXlrd0HOxA6evD1BwH9rXT/km5Hmq
 SHImdztZwdXnMZ1IhY9agg+ynWVpOBqiLJuF66PEX0AZVyWph479dYPoozIwJgbSM+0t
 4nfdXA1zUoPqDzwHqGleN9Mlwvdzk422/eM/jCfQtBJVkAEP0a4Aanx/7XuAmHm9OMOy
 mN0PZ1dIbS46X84DxZc0ZqWioD0Svt4p0OlxTxeS9H4/K708QqoD5Z2q4H/Z5FszR9eo
 dyjQ==
X-Gm-Message-State: AOJu0Yw1ZTrBSYn+qUcbXM5wvVUbXtEE82B1or0ULqcbA5V2eSWTi2lD
 ZXF2wBJArSr8bZM3rnazF0kKrse66SCX0jEgriVRKGQ1R02fGlORaxBmamT5g0K1ifnHNZiOlk3
 dC/+ss+9m6PTgWbvaPv5G0s0pxPSIb1G58dBFxg==
X-Gm-Gg: ASbGncsYoSDxajsPerbakmBWT4/kUFFJNF93gLszgnpcwm0DHHKfriA4RRFxnkRvwG7
 EfNLmN/qRtkQ8pq+lHKinGLwxOOf6Ih5ZgZNW9HHPys+yHeELVvYcKaoYwe1bXFo=
X-Received: by 2002:a05:6902:15ca:b0:e58:dbf:ed09 with SMTP id
 3f1490d57ef6-e580dbfeff2mr19792783276.3.1737999977918; Mon, 27 Jan 2025
 09:46:17 -0800 (PST)
MIME-Version: 1.0
References: <20250127112715.2936555-1-peter.maydell@linaro.org>
 <44f75f64-4480-4cd2-a907-cf0638568e55@linaro.org>
In-Reply-To: <44f75f64-4480-4cd2-a907-cf0638568e55@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Jan 2025 17:46:06 +0000
X-Gm-Features: AWEUYZm8sMG5unPcPpbt3OKYYOFqyQez0DHE4xsldHB5reLwWiyQNNtCODjhQoY
Message-ID: <CAFEAcA_BF_b8r8cOJVsk13qEQZg0BS5F16s9M6NFLQVHZBfq4Q@mail.gmail.com>
Subject: Re: [PATCH 0/2] target/arm: Deprecate iwMMXt emulation and associated
 CPUs
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb34.google.com
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
X-TUID: banGUXpZX/aI

On Mon, 27 Jan 2025 at 17:27, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
> On 27/1/25 12:27, Peter Maydell wrote:
> > We have one test case in check-tcg which purports to be checking
> > iwMMXt. In fact it is doing no such thing: it runs the test without
> > selecting an iwMMXt CPU, which means the iwMMXt insns are interpreted
> > as FPA11 insns by the linux-user emulate_arm_fpa11() code. So the test
> > prints garbage and then succeeds anyway.
>
> Uh...

It had me confused for a while, because I'd convinced myself
by code inspection that we only enabled iwMMXt if you
manually asked for a pxa2xx CPU and not in the default 'max'
CPU, and then I found this test case that we were running
with the default CPU type and which was apparently passing :-)

-- PMM
