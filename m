Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp1494807njf;
        Tue, 3 Sep 2024 08:57:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWvbFW5sgnB6+EQq8JFfc0GmMQnCxKLnlSejsVc6xnlxOnAOMxSKi8g4TN9xf5vt9xN+Yz6OASlPvYpCA==@linaro.org
X-Google-Smtp-Source: AGHT+IEJ+TChjh6Sl3F4yW7ywcdGHpU7QOEOJkMfRzKKNF/C0bLBaXoPRRBKhBseUY/C47+g5/YR
X-Received: by 2002:a05:6122:1312:b0:4f6:b320:d3ee with SMTP id 71dfb90a1353d-50084a803a8mr10714758e0c.2.1725379025354;
        Tue, 03 Sep 2024 08:57:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725379025; cv=none;
        d=google.com; s=arc-20160816;
        b=mvaoZJsGlvv4qV994jlg/f0/IvhXQhVL7yoHHpoFuctQ/3TIOChZLeqfmRZq74rR56
         rwrvqt1WG43XYarU6tyzsdK1sPQnRA+692FvWklMsUhY2LfOj5JNQ4ZIym1hzj3TqUr0
         6FQpf4QJ9hBvU2xBnS0u8NI6X/6jInwuNtoT6kXJ5algbBBJc+wEzrtAAKoD/ZIuaeeR
         cqjuF4SxxUM/sw3uTJi9YOtguWYtz7LniG8kp955EqvfaF0qvK73G5/NL88THGAyXexJ
         ZxZnC8jyD2gnJXVnNWSf8o8+aLFRGFtAP+t3NmVVR1ReRhB7HIXnpQ4ES908P7Gq8UQg
         na5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=bqa1CDeIRVZqsjFO/tctUbiQ4eOvTcz/vQ4hi7emskQ=;
        fh=XXqTYUi2a0aNDpVZxR3dZ/aNIris9tjXpCMcoiX9i6E=;
        b=lioqj3Iwxo4uM+mwp3c3bJiSV51SaROY2e5LrxRaWCIA06cmC8RyReeJx+1WPY+uhO
         sIVbAI4ioT0mmyblfhftxQDEB16sAvArHDxblNoB+5/HOuoljkee2qgDZ218QdsCgvs5
         IwzlSBygzUWr539Fq+c/4R8W9Js6NndAfLg/jX24NGLW1JiypgFH+qI260tePfa6JvGr
         jTWmAEwDHW2P1HIAkBvJknujlf4JvA+le/6sSSlDsMp97FGNc2amagtzTXiatmze+MLT
         3OXQm9Nj2NOc2BG4nFP3ZaAjNOvMBOZuRJKYM6yWKgkSA/zJo4ku9Od/m4bAmUcOmh7P
         gFhg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wXCxkY7w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-5007127c648si3258129e0c.99.2024.09.03.08.57.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Sep 2024 08:57:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wXCxkY7w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1slVtp-0003F3-7Y; Tue, 03 Sep 2024 11:56:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1slVto-0003Du-D6
 for qemu-arm@nongnu.org; Tue, 03 Sep 2024 11:56:56 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1slVtm-0000yY-Ms
 for qemu-arm@nongnu.org; Tue, 03 Sep 2024 11:56:56 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-42bbdf7f860so37544385e9.3
 for <qemu-arm@nongnu.org>; Tue, 03 Sep 2024 08:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725379013; x=1725983813; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bqa1CDeIRVZqsjFO/tctUbiQ4eOvTcz/vQ4hi7emskQ=;
 b=wXCxkY7wrw38xLrnYj60cBt4RzPLJ/fkHeAGxtQYNYxarZKzrbJvGs02Asrd/kcvtc
 nlWa6r9XgD6DBg3OavihztuIpP1oU9nSEydr7ZTJPk8c0BOVfOKuTb+Lm6pG2tYH829F
 RXmQvO31tFlKo1yrQtMDuTXKt8P3zqu4iQ2SXMIjc7d8koY2ef9G2D8b3OMpgvRD+e2a
 1D5Hss41yF5+bI110m5rr0lFTsoXXKA2KPKDl6+LmAHJo8RRzEBz1sY1MukeGDC44Z4V
 Q7KbPUdlkoH1J8wdMvhstrfRdVALE6ApF9f3IX1ce8WDAVnDQzMnXxr8o1HjZbPRm1Zi
 uCnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725379013; x=1725983813;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bqa1CDeIRVZqsjFO/tctUbiQ4eOvTcz/vQ4hi7emskQ=;
 b=q5Cz9h1DxzUIVugVwJfvls1id3NHVujsqtG1PFmyUCeCvP2PSz7jCl3zwalXsEWl6E
 8iql6rltx4rOZYwbT79bsISDb+LLOhV9rNedHkk1nlB0kAAA7qKCtMFcVR8/wCTk0MG5
 DADWlslNV0Kr422pZhRXKvWLW9XMgwgv1RocWfJNPBQutjzweLd0PRIFTRo4nKW2QRpx
 cs/4V0XYgf7tv/dx9U25li4jBG77VdpbUL6RHsHJjMUEHqtIfnn4dBW4MwsM+U8lek1i
 fujKHGtJH40q9HFb/lvIvXO5BBUvxke79k7DNbP+BwNFQZpvti7YUx+EKg6kdy/XsdCX
 rD6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVF1bTI0CZCsbKrF3R+81dl5fVKTyG1/uYmLcd8fDOmCuXqfOh6iFjO+qgfkLJseIf+kuS0usjM2w==@nongnu.org
X-Gm-Message-State: AOJu0YyeYKvKoxB14yBhxVOrKu76wy/VunNnF8ngYPhfMcHWCrWh4D8F
 CokMxLqPLwMlJscAoZnmb0kprI+f48tupDBGHEiS+VpZEPpINOfEToQT5kZUIR8WbARuXFdAuMW
 TduJn7/dRNtRtY6ncdTbgCFbmEd4zct1NHF1pfw==
X-Received: by 2002:adf:e5ce:0:b0:374:c712:507a with SMTP id
 ffacd0b85a97d-374c71250b6mr4918940f8f.32.1725379012560; Tue, 03 Sep 2024
 08:56:52 -0700 (PDT)
MIME-Version: 1.0
References: <CA+1FSiirzpq4wjcKTLSexiOWtv26sgD37h=wA2qxv8Qh5MW_-w@mail.gmail.com>
 <23d60255-614a-4a06-b449-644f215555d0@linaro.org>
 <CA+1FSiitcSBa3JZaAZMGkdB356d2M0rPqscwFnNXGML5HghVCQ@mail.gmail.com>
 <c80e855a-ac1c-40b6-8a76-966e53c0b7d7@linaro.org>
 <4cbc21b0-0634-445d-8a67-7705a4e186d8@linaro.org>
 <CA+1FSigiu8xXF1OPs1oSPS7LiGe23gsN73RwPpJUYH=X5EkTRQ@mail.gmail.com>
 <CA+1FSiiH9LP-7UupNLjDyZJGqJAHAjN2nSLFm9fCx=ZNphxGoQ@mail.gmail.com>
 <CA+1FSih6t-Ccnxh1GvOFMf9pMjcfV1V+yyJHV=ZH0c2RY0Kjng@mail.gmail.com>
 <268989a3-cd5c-41fc-ba0d-5eb71bc6e9dc@linaro.org>
 <CA+1FSijygoVZmTkYR8Xoob4yQQdf9o3CZ2-LmzDrBh2e0VaerQ@mail.gmail.com>
 <CA+1FSigOmKen0QPKSEQqt15Zzrx4UFSCpj+5DJMCJtGnFcE+Hw@mail.gmail.com>
 <CA+1FSijfe+5V4RHs-1ow2JwAeiKcmW31V2Ddx9a9zxb_kybDFg@mail.gmail.com>
 <CAFEAcA-U5DpXysVoVQLAJzEKQ17TL82UiRXHH=q+chxwcubOJA@mail.gmail.com>
 <CA+1FSij0=6Zn_3HHq1njZgwjYDbopGe5ReUvjXkfHaD2_dCYzA@mail.gmail.com>
In-Reply-To: <CA+1FSij0=6Zn_3HHq1njZgwjYDbopGe5ReUvjXkfHaD2_dCYzA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Sep 2024 16:56:36 +0100
Message-ID: <CAFEAcA_dprs9NhEZBd=BhMYwm4Aah7kRA_hhrbbh7Num4dH94A@mail.gmail.com>
Subject: Re: Error : init: partition(s) not found in /sys, waiting for their
 uevent(s): mmcblk0p2, mmcblk0p3 while trying to emulate Android 14 on Ubuntu
 24.04 X64 bit using qemu-system-aarch64.
To: Mario Marietto <marietto2008@gmail.com>
Cc: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-discuss@nongnu.org, 
 qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: xFEeUWWeEA8Y

On Tue, 3 Sept 2024 at 16:46, Mario Marietto <marietto2008@gmail.com> wrote=
:
>
> Nope,I don't need 9pfs. I'm trying to understand what parameter I had ena=
bled when it worked. Is there a parameter to pass to enable the support for=
 "virtio-blk-pci" ? (as I said,I'm on the Jetson Nano now). Is virtio-blk-p=
ci enabled by default ? If I should not enable anything related to that,the=
 last chance I have is to try qemu 5.1.0 instead of 5.0.

virtio-blk-pci should be being built by default, and you seem
to have multiple examples of commandlines and logs in this
thread where it was working. So I'm confused about
in what way you think it isn't working or isn't enabled.
What error message are you getting?

-- PMM
