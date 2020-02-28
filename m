Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp855721lfg;
        Fri, 28 Feb 2020 08:26:03 -0800 (PST)
X-Google-Smtp-Source: APXvYqxwK3e/lAXOYtkdLvX8qZcm65nU3PmHm5zu3TlWEVclij4kuGDhXudoI4J7tsuFqH2laeBn
X-Received: by 2002:ac8:42d7:: with SMTP id g23mr4845054qtm.206.1582907158958;
        Fri, 28 Feb 2020 08:25:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582907158; cv=none;
        d=google.com; s=arc-20160816;
        b=gumzWca9LKJlFoViIPAD7fCfoP4O5j9n5Jpv68YfJg1pbwIFWYO93quytdHNIgvcnv
         6NPVNFvoMkC1CXKPq1vUBuSzZrxMiv2brzWOPrvx9QW+sw+mylV9LVXfBYQqdJNDLvea
         kkUk9huKs/kam83C+H2CUzrH/Q38Bm/zFX0aV7iX9k278RuzI3FdHdcLiYDVtP3iRFbi
         Z4CSQComocZahkEn4Wu0Eet2bSmW7AnLoeVuepTXPv05+SYjQSfZfMMtcD8r75Ihc94G
         WyZG3xi+amA8jU0GC1i1FRTVBC27R2DCNYKWxSmcYglPq0if5vtKrg6LMJdYA8KMtx2M
         aSiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ImV9GXcTg3axtWS42bX0vZt1uE0u7nNuiWPJpxObbF0=;
        b=0m0MH2YpG8hy4crB+X4Gjo30FTrreQY6DZsRWXdUA2DBg70z7SCO+UtV4VDOqVxTWx
         PZkU+aiUQuHwmFvVugAO7usriIf5C2DIftCu1cgDWdmsvj3M+qwp1oxaUQdo+s+Odpf0
         qe7/e91fTCk66PdWd/hfaS9QkSowLq7VGpt4eOG8HzZuCFP2iqq2Jc2w+YloFfTlMcP+
         csLWF0sZj+wFYmYmMv0pV6QZczi7wpzjJqZG+nAAHszuoSW0fWD/0xab2kf4Wbg0CfcE
         klwmdE/A5N6eeQCmy9hiUa+1NUFdQWxAJI6sGJdJmOSei4V/YQ4ghKG/n7nNmrZmg0MM
         IT0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lxvWbdNp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j10si1508010qvp.104.2020.02.28.08.25.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Feb 2020 08:25:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lxvWbdNp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j7iSU-0007cG-Ck
	for alex.bennee@linaro.org; Fri, 28 Feb 2020 11:25:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54529)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j7iSM-0007Yr-FF
 for qemu-arm@nongnu.org; Fri, 28 Feb 2020 11:25:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j7iSL-0007YI-GG
 for qemu-arm@nongnu.org; Fri, 28 Feb 2020 11:25:42 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:42432)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j7iSL-0007Xy-Bv
 for qemu-arm@nongnu.org; Fri, 28 Feb 2020 11:25:41 -0500
Received: by mail-ot1-x343.google.com with SMTP id 66so3076922otd.9
 for <qemu-arm@nongnu.org>; Fri, 28 Feb 2020 08:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ImV9GXcTg3axtWS42bX0vZt1uE0u7nNuiWPJpxObbF0=;
 b=lxvWbdNpkz65y/npDOUy5Y+x6V5yMNwZgqmolcInw2MwA/yIljow/KpIek2Te1++oK
 lJzoGkppFLkMwZxIVudKbpGRzdxwe9uqDbtTuaiQxlux/R3MAMtVQtxUEx39poJrDxAQ
 pC/u3OHPORVEOxClzEheZtSRGREKjE/T09zeAj5ZopWbdhRzhfkVni0zwdIoDI9dQ0k5
 gRz2Ip0jNkPEfrnQ29AIa5pVMF9mUS//hECUri5MtCMXT06np4mAjEas/1pjqorTZV8E
 Kt+VN26ZQqOpDhLO3HPHWMhv5TWAOu5LG37z7rB3nq49IhYayPAaJ9qXIhr/UVEaWVrf
 UJWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ImV9GXcTg3axtWS42bX0vZt1uE0u7nNuiWPJpxObbF0=;
 b=oBelFfIpxTActlnVjn1kt9H0eX2hy46qgz58SgSVloT5q5Br5wLFsds1IsXeTipEtI
 FVkXsWawF3VyvJtFVMNoRs18clZaeLj+e2eK4SjFAQmHBUYU0nldIEcuWU2tY0xcil9y
 qE6klWTCa2piOwxczXEbpUAtHJvYwZcUza/Fh03H48Nedd3FeuyIrgvdOje+ISau+Chh
 YBv1EeIXRBZvuNJDj6A8WNi0+uLo+tuNSur/1gTiQRk8Cnd/or4mtTk960Hw5QrhAXYA
 uiK4IuvywdjbNRvQed6CuU9qiaLGzFXoesgw41e6TrkShEwVhJzxGVT/MKsgEC/gJr6g
 dkJA==
X-Gm-Message-State: APjAAAVPPgyDFB5ef8oUGWUjgwniOTSdmYJrr4uX+HxMx6jEhPipB1Qd
 Q97jawtmt9Q/Xcamj/9RnQMpDLkN3awzWfQBXSbMNQ==
X-Received: by 2002:a05:6830:4a4:: with SMTP id
 l4mr4054138otd.91.1582907140713; 
 Fri, 28 Feb 2020 08:25:40 -0800 (PST)
MIME-Version: 1.0
References: <20200225180831.26078-1-richard.henderson@linaro.org>
 <20200225180831.26078-6-richard.henderson@linaro.org>
In-Reply-To: <20200225180831.26078-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 28 Feb 2020 16:25:29 +0000
Message-ID: <CAFEAcA-ejGqet4iJypfZ3WbmWZaKENs+jMf0Vs2uNUngXsrxgg@mail.gmail.com>
Subject: Re: [PATCH v4 5/7] target/arm: Honor the HCR_EL2.TPCP bit
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
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
X-TUID: yI3EQfXqDg9Z

On Tue, 25 Feb 2020 at 18:08, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This bit traps EL1 access to cache maintenance insns that operate
> to the point of coherency or persistence.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v4: Fix el0 fallthru (pmm).

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
