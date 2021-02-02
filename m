Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp196413lfo;
        Tue, 2 Feb 2021 07:09:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzqJoqc7sqU7haRcECEFXEn9Tk21XogKeaayFz4/ysYDoHZu+/FoPRQNgDhfHfucGgLf2FP
X-Received: by 2002:a25:c86:: with SMTP id 128mr32264109ybm.392.1612278560544;
        Tue, 02 Feb 2021 07:09:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612278560; cv=none;
        d=google.com; s=arc-20160816;
        b=IhrhX/S74H1BL6124GURfvjIZu0aCLWR3o5BZeiBnwqRAKsNM4dGnx35mIoCEGd+w0
         eUc0f82xgpVUHYF91WaKXMpK/lM/mosMZsDJvZeCXQOC9mNcetvIxiQy9+vSK8gmdAzq
         4Du4RGonBSqCg2FxFhr9RxHXNM3MGC0mJR0gaUPMWiDSQTHqRaGBIfhiA5Thejk74IeR
         aJNLk8x8v/oOvs7BNk+lexiJc5XjTQELvOOyIDDA3gEv50YBniPyNtOpJsj90QIlGWrR
         5MZrFUuOyhIuxeYRLr/cwfV2C+HSnftP6Z2r+kDcDrvDiTH4lk5wozxgsPokvZ0EXABB
         5uKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NhvHs1THSPQDCVxBlFl2k8oaKMQ8i4aA7YKrysQJrcc=;
        b=VXM4sv46/gwmU3FfSUOw2zx64keh4hf3pV+O9Pwy28P+EnLy/Njb9lm3UxG949Otnp
         Fp7SriCJJu40YShRvbX0jIk4ajeacQ4I1g3m2PcaWviV4MbcprMbNZBs9+v93ZXyUiUr
         oPY3xVu19OyNTg6RINyr8zKYuI5y49YBTPj9KgOq3orLFIkdcsLV9s/xhpQ4vfXsRc6K
         iHK4a1L1Z4sVbCkSMBz6Sa9lqRcJGm2EZRrGAZE7jal42kgkp8X1rDxc68U0AHOPloJF
         Ss4bF7K3mMCEAL7uz7ST0PNI58fAH2P/82AMB3l8fJ1JiuFU+XoOqA32dklystmbQg8H
         QNlg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fVrj+BC7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r19si4662587ybd.369.2021.02.02.07.09.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Feb 2021 07:09:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fVrj+BC7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l6xIt-0002mw-RU
	for alex.bennee@linaro.org; Tue, 02 Feb 2021 10:09:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6ww1-00071y-OD
 for qemu-arm@nongnu.org; Tue, 02 Feb 2021 09:45:42 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:38583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6wvu-0002rE-T0
 for qemu-arm@nongnu.org; Tue, 02 Feb 2021 09:45:40 -0500
Received: by mail-ej1-x629.google.com with SMTP id bl23so30357066ejb.5
 for <qemu-arm@nongnu.org>; Tue, 02 Feb 2021 06:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NhvHs1THSPQDCVxBlFl2k8oaKMQ8i4aA7YKrysQJrcc=;
 b=fVrj+BC7/4LHldrN5r8CK7GO1jLox3LPlzqAGaat4bOv+ATT3BT2XLFNAcZga5S2lC
 QUda3avnzYGKv1v927mwVB2rqljYDMO8BBfJRKvnVC9Fs6mqHB07RVe0Rbui4JyoMcrE
 AwztcIGrRAt3m4X77Afbh/PJkSSFU/zgVRFD/kLu0z+nudS3Y03odNb2/Df95rgKg+AJ
 xxSXf20HRjNAYPY11Ms2hxtsVaKk3SsUtA37ZDzBB0NcgY2Ditd89QB6vfhkDzsLnrPw
 D/6MKGt7urTYtaAJrAGgPd4aKn2Bmk54W5Ove0ctn++yQ98BzDk0j8rqubb4Tmo7Sb+B
 21CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NhvHs1THSPQDCVxBlFl2k8oaKMQ8i4aA7YKrysQJrcc=;
 b=UBFqb8fzcGttskI79YEsH8h4/N0c4JLbY8HuC6jG5HfbIn6oDkTMEFXt/bPv/vPOs6
 /9AE+w4lr6ryPKd+T/fImMak6OhonZ5uw6s7Emg3ZGjvPMVh0vRkfKoSIM7CYdIGFw+S
 H7uQYcNxKYoUpIKNDD8NIHRY4J9NeP/EgJJ2kt/g57G0rPZKadKuFJXLj7jomxq13Yj+
 uyiOsBmr0w/5aZh2xHVeupCXLo14sYuVA3m0asuKLp4uurwI/eCfTmvAqG9pjPkgKJtC
 XVsjZ8vLXAktNmugJ4UEyoxaQU0PEkPOPUGBcYyvwI0x86sL/rWKSKfwnIO2hYw/s3hk
 zuMQ==
X-Gm-Message-State: AOAM5316cH8VHl/OJm1qfstRw4SeTiNr23E6i+w8ChqU1mHwKfTOg9x5
 kEI6q5FhHv6zWF1w9PeGmvjx2X8qFS6V6z9g4gKCKg==
X-Received: by 2002:a17:906:4bc2:: with SMTP id
 x2mr22540063ejv.4.1612277132258; 
 Tue, 02 Feb 2021 06:45:32 -0800 (PST)
MIME-Version: 1.0
References: <20210128224141.638790-1-richard.henderson@linaro.org>
 <20210128224141.638790-20-richard.henderson@linaro.org>
In-Reply-To: <20210128224141.638790-20-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Feb 2021 14:45:21 +0000
Message-ID: <CAFEAcA-YGbEXDJB5HBHEihVL1h4bYcJ0AsHQ8LR8TOezPTYPFg@mail.gmail.com>
Subject: Re: [PATCH v4 19/23] linux-user/aarch64: Signal SEGV_MTESERR for sync
 tag check fault
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
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
X-TUID: s5IUIHHEOfrB

On Thu, 28 Jan 2021 at 22:42, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/aarch64/target_signal.h | 2 ++
>  linux-user/aarch64/cpu_loop.c      | 3 +++
>  2 files changed, 5 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
