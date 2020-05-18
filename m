Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp3115077lfb;
        Mon, 18 May 2020 08:02:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzaRKfQ9mv+B1LsYHfVAmjUBLkoq61MHk/WJ8ScepncGTaDPbGUB/kVqOx1waqrebnA1Jsc
X-Received: by 2002:ac8:1aab:: with SMTP id x40mr17026437qtj.358.1589814131243;
        Mon, 18 May 2020 08:02:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589814131; cv=none;
        d=google.com; s=arc-20160816;
        b=Xy7Dm3Bv1LjNuaWL6kZ5VlbKxLGT3jhPgCIly2Wwb+vMGf4TTWJa7jP0I+AbWzwoyp
         KIoky5q5X4BGUdw5Ces0AVfMXL7ak++dlHKw6JeNj6uKAWR+1qZfzeZQ8/b09Y/RagTV
         q1kEsJlLQKfB1xzZJUomEWq/Bhw8ljj67QstzjIMKNIHRxOLfUBdBriJZ6VS8Boih7Wl
         +dJf/9B5sLHwCOXSXJXwv8sW7mBWLjlkrjmYu4nSA/FklVSIWVpeY7SiHaR8CVp1FOAt
         bodmSnJaBHbLYuoLyE1UwaxCVCSrIhGxxiFw8n7OeSRU6A2NGIeWP3l3hKP1QXOFdv0/
         JY8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=kAnFLR/iZLNvMTVRqFp6K8khL813q1hzXRqbt0f3Ezw=;
        b=jIZjG/FBiIihoCWAMQmUEOzU6wo/3WHBrAlgSi2LPjHh3CMM9T6VSrEZ0EVTI6D5/r
         rKC2Ptt8zS2aIr0/LzTbYBwPQnio1uijySFrOKoVleobL5rcEiGl7uneZUv0TYwHhm94
         b8f2I7V5FlavR5TAUEyyTeiT4NUaargA7zrA3YUmmPkicsAq5F5KmpC7V8fc6PtBjdhL
         ZzjT3IcZQCxHnjK/uy4kfA8QZ1K8YLfuhbtt/hUOa+M+fyarkLqQneb2cUYYv9Rho0HS
         rFzQe+bkAbCi8dYBGhdHDLqP308JtF+s2IPjQbme+81niz0xW+jCQ2U5ZQuFRAvAMbyA
         6zEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=uYyWDsHh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w22si5712796qkf.349.2020.05.18.08.02.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 May 2020 08:02:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=uYyWDsHh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jahHO-0005w3-Fp
	for alex.bennee@linaro.org; Mon, 18 May 2020 11:02:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jahH9-0005uR-S9
 for qemu-arm@nongnu.org; Mon, 18 May 2020 11:01:55 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:42073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jahH7-0002ff-Rj
 for qemu-arm@nongnu.org; Mon, 18 May 2020 11:01:55 -0400
Received: by mail-oi1-x241.google.com with SMTP id l6so3338729oic.9
 for <qemu-arm@nongnu.org>; Mon, 18 May 2020 08:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=kAnFLR/iZLNvMTVRqFp6K8khL813q1hzXRqbt0f3Ezw=;
 b=uYyWDsHhWakQ+eALy/4A5EXpFnmCnF5FKCoMDVVLaduW2BN/HETk3+JdYe+V51EtHm
 0AMbaHsz0039oarI6yDx9WTCpRjgjZQt7YW7r209kWYPIje7pY+jY2IideIHioT1FTvu
 M2FycW9lC+tRQyAsV+YOSxei7jqnwY45G/6Qakoe9rxFl0u/4L3k7x89/4qbdwxM4sTZ
 2slo4nFiNpjT+IDFlRott+wa292lujaHLW0+BjOGO316bPrmJXLdZ16SRt2IiZJ1AWVT
 g0INCzw/Im3fTJ+XuDP2z3SPUJTFDbiGtAtX8HosX6YJG7K3P5wiEZWFT10LWXKFnbCD
 JZ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kAnFLR/iZLNvMTVRqFp6K8khL813q1hzXRqbt0f3Ezw=;
 b=Z9DD2W5+PTkDEMNPNBoiuTWg18oKiUr4j8XigkKK9g6t8X3I38mrlV3U/+ILBrjYZ9
 KDqoiWAOW1F37byZx1sI76JQQ67pMyjTuA/BZe2voqDddXe+vkMzBjKDB4BTlAq7GXIM
 5yEzpX7oQmOBjvDhAwHBFEtFWSMQRUB89qgCpFUgY8iAzIKmKVSVRv6Vfn8doJAMnNV5
 Bq3Rdu66CfxVii7jGo6KF0SqkPsSmZb1GLr3uRbslDVFetUz3hjqU1xeSH/z/hl6q2bQ
 Ve5/HWm6KY8peOKAwIGOodwc2bXIPn/NjOXV07ghZ1j9+o07ujqUqEZAsWd8vuhbLtJI
 n/uA==
X-Gm-Message-State: AOAM531imdWKnfaYSCOF+ma0XP4quPlWqS4ajh+u5HKv0l4+o23QxKLA
 FxFzTK6W8dL0KhRMxfKk1nOj34jOzJ0KvD5l5NWbCg==
X-Received: by 2002:aca:895:: with SMTP id 143mr11175682oii.163.1589814111302; 
 Mon, 18 May 2020 08:01:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200514190422.23645-1-f4bug@amsat.org>
In-Reply-To: <20200514190422.23645-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 May 2020 16:01:39 +0100
Message-ID: <CAFEAcA-RFEQvAr_Zvu+z5Es6X2vpDTo9_YCmb9Hqc+iqLfeK0w@mail.gmail.com>
Subject: Re: [PATCH v3] tests/acceptance: Add a test for the canon-a1100
 machine
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::241;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x241.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Thomas Huth <thuth@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Antony Pavlov <antonynpavlov@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZwvTk++rpOij

On Thu, 14 May 2020 at 20:04, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> From: Thomas Huth <thuth@redhat.com>
>
> The canon-a1100 machine can be used with the Barebox firmware. The
> QEMU Advent Calendar 2018 features a pre-compiled image which we
> can use for testing.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> Tested-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> Message-Id: <20200129090420.13954-1-thuth@redhat.com>
> [PMD: Rebased MAINTAINERS]
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> Thomas asked me to watch for few of his patches to get merged,
> but I missed this one.
> Peter: I suppose it is flushed of your REVIEW folder, so resending.
> ---
>  MAINTAINERS                                |  1 +
>  tests/acceptance/machine_arm_canona1100.py | 35 ++++++++++++++++++++++
>  2 files changed, 36 insertions(+)
>  create mode 100644 tests/acceptance/machine_arm_canona1100.py



Applied to target-arm.next, thanks.

-- PMM
