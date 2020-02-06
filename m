Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1544398lfp;
        Thu, 6 Feb 2020 06:59:02 -0800 (PST)
X-Received: by 2002:adf:ee0c:: with SMTP id y12mr4248314wrn.341.1581001142706;
        Thu, 06 Feb 2020 06:59:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581001142; cv=none;
        d=google.com; s=arc-20160816;
        b=b9hPX+EgXNbQb0VxaHRNtWsqKlG/KxrEOoBlMp7cOSAegKjNRb2gno+BSCKA9Ts2vO
         xmd8xj2jzIkM6KCqJu3jQ8+0YM30syXNsBspkDvT2N8lsbmaKqBPy2maBsX1AAMHCTUX
         fN5lv/9dW5A+DYg1A+0mrOGoaVOh8OLLMnW0SjFjjWvufif3SPiuJl6pYhIIpW83zSel
         pen0qNuvwblXrasF+YnfaNSajeLo2P3oXBgrLzJEkwyDVQ0AkT8OInzepS7MSBpaFb/f
         oBNV2NnZljy+Ej1X8rCYecjkiQMCcSRt/BBEYNjQES0I1nZaSIzrmfx6e2KMrsW186UK
         OcsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:dkim-signature;
        bh=6I00GwZYAl6sngkyZeXJM/STNSu1vVyMIbjK3EDhpOE=;
        b=VqBWIAEuvFnzgzzuczIQYqzUcSIWJRkX1dQQ84sl5M46i8BsamHIoIBlCBE2QQ/eHH
         T1RmBVFnOLqC5OZbaXpeWxstFrKPx5O0NJcZeBvfbcG/NOaGicqKGr678BAOT11eK+HR
         mhuGOfoeolfI1ztnLVfH4ql604Ru+/atSpOTFz04wECmZde6ZWxLPwVIyVkJgwYKTvUj
         GH0bRguTvIHfc48LAwxEgm9lcrTF8FApkO/FIk2x5LS3AUZmZfzwcd27+6M1S01ymQik
         JaYGFlMq4x89txpx1b6hq3sm5Dnk4Y5DqwqpZYN61vPW9UsPpyDT1zPMH0mvYRqGibhf
         bOvA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@livius-net.20150623.gappssmtp.com header.s=20150623 header.b=0rx1M44U;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of ilg@livius.net) smtp.mailfrom=ilg@livius.net
Return-Path: <ilg@livius.net>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id n66sor2102394wma.4.2020.02.06.06.59.02
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 06 Feb 2020 06:59:02 -0800 (PST)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of ilg@livius.net) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@livius-net.20150623.gappssmtp.com header.s=20150623 header.b=0rx1M44U;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of ilg@livius.net) smtp.mailfrom=ilg@livius.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=livius-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=6I00GwZYAl6sngkyZeXJM/STNSu1vVyMIbjK3EDhpOE=;
        b=0rx1M44U+i9dcC+UVRD2hUjrvS7wwPL3c6QKIZOTOS2sumHwb5WJ8ayuHDhv835Oiw
         qBckh1B+v48icBmZNNN0CbdlW8WYxdq5eQLCJeofvL1aly+30bF8/zsnAOH3LSNdcArl
         dslPvbCSrkg6vyEk35NEX/sUW8cGdr/Jfg8SK8itSxy3eUpDKdpIX6YfG+X8RSEnNAIE
         xHsUOmIPxT6MIPZAtVh1JaDkDYooeaknVfByojvyjMNX2OGHNnM1nwGRaUCzgIa41cnR
         tqWCjjq1hT9mCzg2X6tnrjBhh00S3yQJxeHhCbvfmXCnHmLbKFkJnSa8O+hdbybq5qQL
         16Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=6I00GwZYAl6sngkyZeXJM/STNSu1vVyMIbjK3EDhpOE=;
        b=CT/bs4+LlbCTmfXKmqjkaZ7MQySNchsq8fFUIpAFO1H3ILv3ar2No+rrY4rTmeKQLE
         ClUyp4E+iL3cyDRnVZjq4g06VkSgmQ5pgj67lKLTWRT56JxSgjPC34Qw1QS2nY45Lq77
         Bbrj6nLJBIgNol1Qwaz3miO+C8z0JMurJaebQZePXaKFPn7PHtu1mH/tbL9BrUAfurO6
         KjuY+mhywQhNAVKwLkSAOloLcSGmhSBFcgW4Hls19YPH4P8vjP6+scyl4R4syjLaW8c8
         of9jSr4U7njwwguLiEvBFbWbPNzQP084TTEIe9RaqofNPtXeajZW9GFLhytVNF/eN4u0
         J7DA==
X-Gm-Message-State: APjAAAW1xUL4+5KPlcF1H0WXijYsXbp6Lf/09UWFOxsfiyiCvrJljrwR
	dwNHf3RuzTK/FnJHnnD/VRcMIQ==
X-Google-Smtp-Source: APXvYqwGs1sVWTfQfRL+azruEU+U9/vYEKVkVtifHRWcZpzjkPdm2E1rV9doelg/S2kTiaNjc7zxvA==
X-Received: by 2002:a1c:e2c3:: with SMTP id z186mr5110587wmg.70.1581001142390;
        Thu, 06 Feb 2020 06:59:02 -0800 (PST)
Return-Path: <ilg@livius.net>
Received: from wks.local ([84.232.200.227])
        by smtp.gmail.com with ESMTPSA id a9sm3826332wmm.15.2020.02.06.06.59.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Feb 2020 06:59:01 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: Is STM32f429 discovery board fully supported on qemu?
From: Liviu Ionescu <ilg@livius.net>
In-Reply-To: <513AE0E1-BCEB-47DF-B256-2460665ECBD8@livius.net>
Date: Thu, 6 Feb 2020 16:59:00 +0200
Cc: Mohannad Maklad <msala.work@gmail.com>,
 qemu-discuss@nongnu.org,
 =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 qemu-arm <qemu-arm@nongnu.org>
Content-Transfer-Encoding: 7bit
Message-Id: <AFC9B5F0-6561-4F75-8F18-AF702B420163@livius.net>
References: <CADxp150RUQXjDFjrQcrJCfoWto=ERaGVd=neo9s_2=3XsyS9XA@mail.gmail.com>
 <07187FD3-2C54-4F19-8D2A-386FD3F360AD@livius.net>
 <aa9a6e4e-70bd-2abf-9b75-8200990a1c57@redhat.com>
 <513AE0E1-BCEB-47DF-B256-2460665ECBD8@livius.net>
To: =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@redhat.com>
X-Mailer: Apple Mail (2.3608.60.0.2.5)
X-TUID: jHv5gECFGcHI



> On 6 Feb 2020, at 16:53, Liviu Ionescu <ilg@livius.net> wrote:
> 
> start a new thread

I mean in qemu-dev.

Regards,

Liviu
