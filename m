Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp3695350ejx;
        Mon, 5 Dec 2022 09:10:22 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4v+aJOl593bL9pN92ReSkx13Pg3VrUqJhNAOgOlzMWNrT/EKHLQOUiWlJw3cio3osv+W8t
X-Received: by 2002:a05:620a:1384:b0:6fa:1e46:291b with SMTP id k4-20020a05620a138400b006fa1e46291bmr62176565qki.494.1670260222293;
        Mon, 05 Dec 2022 09:10:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670260222; cv=none;
        d=google.com; s=arc-20160816;
        b=yGPAyCKwvGQ2JfiCy0jfaVo1/1ZtzPz9zFh/Nr/gpYa/piJW6o5rtdnBXeyUWPsIeU
         k3toPsOkUYuZiuvqSeCCKlUa9VbMyFztQ1+d4bcoJE2MbsefeOh84o3+7pVLctmZvlLz
         asTOgVNDwRMFJJZP2L+jYiWzt00mjGkVC4EIH4zbj9qzmRX6uhr/EoyDT8ZEScx3BImf
         YE9RJvmv2ap9Mi184zeWMxfR39vSePBiwutmIqALii+JuFFEn/OnYSFbzRiQ2IPEpP6M
         H4xL8gZmfIbTZhJAnZ66tn3rUEwuc2FxAeYFCP4TX3m/xlfjmYlYbJn7IJ7M7DHxCdFg
         5k9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=MwByMuLrmF8YMdq4KZXXjR0AyOvR3boTcNRCXu5Qxyk=;
        b=cWCPGFDFo4UhVjiKGSKw2koy2V4xDv7L8VG6kn5BMis58hDKuDeYgyVmEjEpjFycsY
         V53zy3uXyDqTKQOoiAYGymv6/Sz6ME5w1T36md1InIteuhYp3ycT9wWbBVjjor5vfVRH
         CPtUbnfQ9T/9HGBS67trHIKQx4988zvkbYD2IWBlKyKYlT6ZTHgMrGSFE/C/5jBN8xgH
         0JT14thT/33DtDnke5fBeO6C/OHmS9z7rA7EzpSRW9iM4B0/SCnVHKALUfwiEdZgdns6
         Lgcv+LUq1zHgubDxrYFLrTTIWRB9QOEQYpbRdThisF6E7hrBPFh+5M3QOE9fYJsW5DD6
         SEKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=t7tvGwNf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f4-20020ac84704000000b0039a8656c815si8118936qtp.426.2022.12.05.09.10.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Dec 2022 09:10:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=t7tvGwNf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p2EyO-0005Zx-8Z; Mon, 05 Dec 2022 12:09:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p2EyM-0005V2-6q
 for qemu-arm@nongnu.org; Mon, 05 Dec 2022 12:09:42 -0500
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p2EyJ-0003aG-Si
 for qemu-arm@nongnu.org; Mon, 05 Dec 2022 12:09:41 -0500
Received: by mail-pg1-x533.google.com with SMTP id h193so11015596pgc.10
 for <qemu-arm@nongnu.org>; Mon, 05 Dec 2022 09:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MwByMuLrmF8YMdq4KZXXjR0AyOvR3boTcNRCXu5Qxyk=;
 b=t7tvGwNfkj7s5LyQ4qUYdgmC3e6iEDzHOfYII7iMaZSdicvUjmgo5KndaV+3DWSgMO
 iSJUzb1lM6WlZXI2RtWfM7ry5FyGs+iAkgThBzwumeUSViCDCKzag6/Q3tobwlbLxZRm
 ROuVIJgIRQ4SSn0N/Qq9FVabPoSw2UG4RVeNDatTx90aJA4clccjMj5ShKCjH92ZKJMi
 DhaZjtd0t7KQDIzDqxQSMmAhoTEmSsKJb6leoq2FNVk3V8OLeG2KLTyqGcZj9ieePSH/
 dFZyfgea2PW3PcZz2JFpUNcGVMwm5KfzrTuFmiDWMuplS0nhyE7kFVHDHJVF7elxjybG
 cjpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MwByMuLrmF8YMdq4KZXXjR0AyOvR3boTcNRCXu5Qxyk=;
 b=efFmcZo+C4c5PilXjn40ZzXNrw6xbSTzDLpOih3WdzMWt2N1CisQSwtpOUrjQu6j9H
 RKQSAMLK4YtQ8RFrt4M1DHhGRAQ89nx8evk4H2FTPTskncyyXAP15ZmX49vahb3yMOV9
 n8kv7/LDyuo4BYtLhWO5QbgiGIfKyv84GOoSSNB8pNp6FLf20rZjWtOBWv/W45K+KJo3
 oReg0WSjrQ8rDI6fCQB7Wcz1f0fKG0Umfe8jMjP7h1GBc/zmTX+iYKtYpfPZyhJEOT3r
 teh+tJClKB+8SHd+NjrIHlHRO7y9xnaAeexCiChtvbulpK5aD9VFdIsmfolEP+Kr3t5M
 37nQ==
X-Gm-Message-State: ANoB5pnC1asTprJUIGC1/DPGRueNbY7ra9iMhFk1d0Z1zdLV+rrPobX1
 +qPf3doV6ejP201qAEiY48aRYFXF7+1rtwW6Bw2EbBIr9i7uaw==
X-Received: by 2002:a63:5146:0:b0:477:86c1:640f with SMTP id
 r6-20020a635146000000b0047786c1640fmr58021632pgl.231.1670260178541; Mon, 05
 Dec 2022 09:09:38 -0800 (PST)
MIME-Version: 1.0
References: <20221202154023.293614-1-thuth@redhat.com>
 <7681b7e1-2c03-cf98-3d73-e2b9f3dd0a72@linaro.org>
In-Reply-To: <7681b7e1-2c03-cf98-3d73-e2b9f3dd0a72@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Dec 2022 17:09:26 +0000
Message-ID: <CAFEAcA8_Y2bgi-uSzt7z36LYOVjibb-57zGKiW8_2rhSJ70=aw@mail.gmail.com>
Subject: Re: [PATCH v2 for-8.0] hw/misc: Move some arm-related files from
 specific_ss into softmmu_ss
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair@alistair23.me>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: +6siHcyDdGfT

On Fri, 2 Dec 2022 at 16:32, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> On 2/12/22 16:40, Thomas Huth wrote:
> > The header arget/arm/kvm-consts.h checks CONFIG_KVM which is marked as
>
> typo "target"
>
> > poisoned in common code, so the files that include this header have to
> > be added to specific_ss and recompiled for each, qemu-system-arm and
> > qemu-system-aarch64. However, since the kvm headers are only optionally
> > used in kvm-constants.h for some sanity checks, we can additionally
> > check the NEED_CPU_H macro first to avoid the poisoned CONFIG_KVM macro=
,
> > so kvm-constants.h can also be used from "common" files (without the
> > sanity checks - which should be OK since they are still done from other
> > target-specific files instead). This way, and by adjusting some other
> > include statements in the related files here and there, we can move som=
e
> > files from specific_ss into softmmu_ss, so that they only need to be
> > compiled once during the build process.
>
> Cool!
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Applied to target-arm-for-8.0 with the commit message
typo fixed.

thanks
-- PMM
