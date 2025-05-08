Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp373105njb;
        Thu, 8 May 2025 05:12:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWLxjpR89Cxga4ZiyFHBa/HZZaflqPZBMSTuXKgm0dw9fOIUQQqBGUvFCUXd+7grvBwqYcFBGxEMrsvXw==@linaro.org
X-Google-Smtp-Source: AGHT+IHFKiYYk4Q5oC4GrOoFm5mvod5GjhqoAlnETSwR+P7ga6tIrIdPGwa5IRQbU5jXpg4Ovkq8
X-Received: by 2002:a05:6214:e49:b0:6f2:b094:430e with SMTP id 6a1803df08f44-6f542a39715mr120412556d6.25.1746706373775;
        Thu, 08 May 2025 05:12:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746706373; cv=none;
        d=google.com; s=arc-20240605;
        b=i7K+uGLWnJZKrvhAUyNIuPvxfybd/JWvufgAba5fKmQk0F3nCqrmFcNxa/TpDcnGlv
         +wz5SW4d0cyqt6xctl12olMYIDz7fziQZ1otMBl2B2jh3B7K4UGJWGMHQaw9TAJawWZY
         OoJukxWLbRCJH/VyDZoX6ZnbJAbpt8u7r/SvhXQpjJNjdoIrZnry2/GAVawCuARa1pwO
         XyRCs2xFc2vonH6reqf/J3ZsDa31aYJbtZAxRPS8pDH7KATLdUeeBMkWCakXRdIzk1x3
         XdVK257LkNOQF33o3Cv524sR5bgoBC4AlXpnbd3pauJNDRZtHliJaN8ofKSwSy9LYh/w
         tMLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=j9InaV9C4mor4R6wswAao6ZgQcS8hcvClikRpaEBLCA=;
        fh=klmhCoaRITS4S/EBXWTPI/SzFXKXcw+gGSmPM9bMVrY=;
        b=Om37xDDar4brBHslke5rTvX4tUTUi/x29mxTjWsPZ1KKWfagz0DJQRg7hh3Lhv7E7b
         ewgva08QTcr/Yf0+v8LFcrjM9ch2Rf4msP1KhRdAnPJe1cS5aF12PV/QjJfxEL4UK2Xn
         OG59IUVogO7Y+ClDEs2Jn/+4lj1VZzU0hXmy8YUeYwbsSKF424qCPwNiRd0naZVxXbfL
         17/v+g8kPAMPh2C6FaQrEUhi901YT/jHzc4+krwAjDmMR+qK/IopoDIjKjBrciYcJ7Ty
         aZf0YhAI7HyMBn3q50Y4r1aENjQuysXi9xN62zc5RsaaUCGk4eexioKHVAzR7wTgY2YH
         5dmQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EXKK95Ni;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f54278b7ccsi42662676d6.230.2025.05.08.05.12.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 May 2025 05:12:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EXKK95Ni;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uD07H-0002ji-Tn; Thu, 08 May 2025 08:12:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uD07G-0002jS-O9
 for qemu-arm@nongnu.org; Thu, 08 May 2025 08:12:42 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uD07E-00018m-Uw
 for qemu-arm@nongnu.org; Thu, 08 May 2025 08:12:42 -0400
Received: by mail-yb1-xb29.google.com with SMTP id
 3f1490d57ef6-e78e13d7fa7so874317276.3
 for <qemu-arm@nongnu.org>; Thu, 08 May 2025 05:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746706359; x=1747311159; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=j9InaV9C4mor4R6wswAao6ZgQcS8hcvClikRpaEBLCA=;
 b=EXKK95Nirysx7yopqLsV8V1b52WFBKU/qZHIkTYo/UqoC0dVjF0DViwkHwIGtIaQNI
 xP6aKB5X+kGns4nMv4DihpNb7qN1uxnjNzALK/hZgjfJ8f2bk87zI7Go9GSB0mt7SrYj
 zPZVTNUfQxEhdRAppunOiHhcEWk2bvq8s5QL6f15Xp0I5nw+LVcE3hMTKOPaHHn6b4f6
 JiNYuqArBI40ylP1WoF1LFZPU3jFqa42I4swpFZSihpVuuuYJ4EPreaWZNXcYwUtBaey
 Ezr/qGcG8LQeoXZGPjlEwybcj0wwamqFD3wOKg77FJw9lw+/V6YsOLIbjI6ir8D6AX3k
 Ypsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746706359; x=1747311159;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=j9InaV9C4mor4R6wswAao6ZgQcS8hcvClikRpaEBLCA=;
 b=eyQ4r2/RmWjHTSaz22T4TqELVwVj7gUcZMjdd4jEqlYRTjCQWvPtM5iG71pBJwxMBN
 pkhJhWxCTy/toMDz1uwcyWDUIZ9fat/VsR88qtD62yevq1AcmBzyL405qnWGQPyfa8Bo
 5Xpw/z3jPlfaRw+boFGdnBrwRlksw6lvHN+yAygihmDnSSXHKZ+zfCSgn3b8Hv7nrCt7
 4kQxt0lm+Q8zTAx8a+gZp8pr51heio4ZtJJw9yILPDVWDTiSCfh2vfriF8X2jYwxmTJ2
 J0Iyh3W/ZHEw/HnhfNZMcahzhTOT0JYQWTM32AzSurKRiBFC4nGMHe/eupAtsiHsADrn
 k+cg==
X-Gm-Message-State: AOJu0YxbbnwpJiDyaxDjg7XFS6yK4pqWZZ8qUl+m4MSTlUnQdLbTQ/cv
 eyk1SdG3SczeLwIta3WUqreKiDSGqPMRrjwWR5d+nYceQSUzthxfCAmIBiR73Lfu6Aw5qe9pzqb
 +M4+IeOYbEVc/L+aYBRDsN0TmS54VuoFSL2jVfw==
X-Gm-Gg: ASbGncv7k1ckThv2hZetCVIJxH/plyhI8YAgVyPOTj0va6JEDXROMeswGfbv0aLb5Gs
 pnRJXjv+Vqq7jQ6G2R7jQUtyjSBCsN1xcZmilSrKK79FA2wN0IVoEprL2V3WideJIWZJe0xDh6o
 FIGzJ0sLra1VXGcSL0BqBaRhA=
X-Received: by 2002:a05:6902:1ac1:b0:e63:199a:efd5 with SMTP id
 3f1490d57ef6-e7880fc5804mr8918994276.24.1746706358865; Thu, 08 May 2025
 05:12:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250508093519.144004-1-thuth@redhat.com>
In-Reply-To: <20250508093519.144004-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 May 2025 13:12:27 +0100
X-Gm-Features: ATxdqUH6xuAfo_qiANNfpymwiedveyqWttsnPgHpF7uG64eAjAGoRaLXviE30Y8
Message-ID: <CAFEAcA_T7ebsG2xYbtoLFDmF9g-gQjHW2FiBJ4Coq_4Rvw7srg@mail.gmail.com>
Subject: Re: [PATCH 0/5] Fix dependencies in arm machines and update OpenBSD
 to 7.7
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-arm@nongnu.org, Brad Smith <brad@comstyle.com>,
 Warner Losh <imp@bsdimp.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb29.google.com
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
X-TUID: rfmdgkNG77Dh

On Thu, 8 May 2025 at 10:35, Thomas Huth <thuth@redhat.com> wrote:
>
> At the end of April, OpenBSD 7.7 has been released, so we could update
> our test VM to that version now. However, I noticed that some arm machines
> now fail to compile since they fail to include the <epoxy/gl.h> header.
> This header resides in /usr/X11R6/include instead of /usr/include in
> OpenBSD, so we have to make sure that the machines are compiled with the
> right CFLAGS (or don't include the header at all if it is not really
> necessary). Thus the first patches of this series clean up this first
> before we can finally switch to OpenBSD 7.7. The last patch then
> also reverts a hack for OpenBSD in the main meson.build file since the
> related problem has finally been fixed there.

It looks like you forgot to cc qemu-devel; would you mind
reposting so the series gets picked up by patchew etc
and gets seen by people who only read -devel?

thanks
-- PMM
