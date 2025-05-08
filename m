Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp372573njb;
        Thu, 8 May 2025 05:12:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUq8iPgbtO+YwWzpRXq15Gpbf6eK8xN+U77aotu3JVW8etvQ7mqMaN10hO+THthnJ1AmhhgmnK+ANWb4g==@linaro.org
X-Google-Smtp-Source: AGHT+IH2U58vUzky6N7XdQ8yi3K3gtRPSGV9/ZFlJ5/fHt+mrpHBrX6yUWB4g9OhOwQxZgxDd7av
X-Received: by 2002:a05:622a:1114:b0:48d:3c79:5de8 with SMTP id d75a77b69052e-4922574dc66mr88860341cf.2.1746706327629;
        Thu, 08 May 2025 05:12:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746706327; cv=none;
        d=google.com; s=arc-20240605;
        b=FTxx+FkC9c0KnwsIs7fSfSghFBA+GBDS2yWraGMLO4PBoE4gAGzNQGThPlRvRMVjPC
         sqri/H3UO6S4386k4rKoH6Aoy7yGWrAmlghjqQLlr8tdWvRZjGBq1050m3jtllAh765n
         Qnv4U78iUfoh++lw1cRXPRnEMMuRLNKldUCGdx7A55u2zSgDRaINBYH3xX9OFa0suPgX
         C5xqhh5FGhksZNHGfOKhXUD4UG7N/W0XXNilmtxQq2zs+nGPIOqa1H33546ktP0is+mG
         Y59bS37fGxBMgfRAPNjyNxlFC119w4urCyEJSnsin2+1e7j5MdpQBzygTP8wFgoF11O+
         GVSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=lbUBbUfpjkmAl6pIY8jysy2QgOY/+fCW0cbA/ezza3o=;
        fh=klmhCoaRITS4S/EBXWTPI/SzFXKXcw+gGSmPM9bMVrY=;
        b=gyYTlbjoNhHGadg+2uDaAplX0H01mJdJhk53/UkEp4PuUiopM8O3myIdj0BMhDkIFi
         l+djqQMXwBBn8BAi4UI/pgI4wuPFqJLOXUJAvYi4upOITsQGM2kGMm68nFLoUoN1BjYU
         CL9T5cSGhaAgyLXvyi5pw6RvXixFC/kyvVTgtFYVO5cAw/WnKiQ68ZrZ7XFFvFQUdBZc
         bMccinuUhP05tTVoJ753IsUTLdVhLNr5lhJEkWtxBYYXGbK8CmcTwtzp9QEanxZw/2xF
         7O/hJOmyRY/UYKMpzrPcoyVek/CNq3mP0YDvD407CujEWuAc05KqNEvAJvLD26R3waA6
         8wBQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=izAHJUBC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-49220f8199asi44935431cf.14.2025.05.08.05.12.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 May 2025 05:12:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=izAHJUBC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uD06O-0002cI-95; Thu, 08 May 2025 08:11:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uD06I-0002bs-R2
 for qemu-arm@nongnu.org; Thu, 08 May 2025 08:11:43 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uD06G-00014R-TU
 for qemu-arm@nongnu.org; Thu, 08 May 2025 08:11:42 -0400
Received: by mail-yb1-xb33.google.com with SMTP id
 3f1490d57ef6-e78e6396d36so691617276.3
 for <qemu-arm@nongnu.org>; Thu, 08 May 2025 05:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746706298; x=1747311098; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lbUBbUfpjkmAl6pIY8jysy2QgOY/+fCW0cbA/ezza3o=;
 b=izAHJUBCuc8g425NbEvOCfGIeFUKyTaBAm+toSEYOoWqtSp03CflrvYnzzLgOM/tmy
 BCZjYvhjzcJKJDIRoX/IniFMnf9133LGOiD8AeuljrdM0pDu2Pa4e2HagUwHeNo5WExD
 lhsRpboWXqWYaxGdfdyQ5Qd93o7oaz4m9fy0DeyDTSP9EoaxBVHtdNHfFgrFO+xlFv6p
 hRQ2quB6smPJ0t6gwBSutEdNI2m1OijOwrcz7yyscWeNGeCBkFNesf3qePwdqJnu3/yn
 6K29S3/5RHaQPFqkAZooiH+1rFaahaAxum/tLtQXySntRJYVIibUAB5TY8k2hE3MRHTS
 4reQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746706298; x=1747311098;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lbUBbUfpjkmAl6pIY8jysy2QgOY/+fCW0cbA/ezza3o=;
 b=vwW0musnio92DXK0wdp0RHHP2nPRcnyslethJNymW/4W2xTkKE22vOBqf6lmqkGiat
 pF0UOJSOiBKvhiYLFwMVB3OAcXK4N02TvBZQu4WU9JqaRFDbnKQKikYgOhC5V0Gz0IIR
 yBOOQ11uL5YdFifYvKPGBGnTfxTHZftkdXkDJYBP9M6DGXtQJavmfvuIFffBJ+P5d95R
 Cmfd0QYMRTih0W6c2Y9n4TRoWNWjRK7dj6g306jgIb3ciRz6TqMn1CgYE9J8Y9KJ8nXK
 b1abjOKZVGK8vr1Xe1bmkSR58LdeVm0yYcv13XTRkemqy9maxRUPM41OoGomb+a2ksML
 8SRw==
X-Gm-Message-State: AOJu0Yx61OfLVQ/OYAw3QJucO6OUnUPWRAiXLKlamRxmcMYk3uhi3AsD
 DEcVnhGA2AWysrKL/zRwa+fzNCk7g+clLFBRC9dj5cDaXUhJM7T5CuhHPuamKt1wUY3paPSkXNj
 RUQGW/QPvisHZDIo59xAym9J3ohiXvT+ceXs/zw==
X-Gm-Gg: ASbGncvzvvG/NJlEinBDuyJLgJSpTklEHf6w6OLDuOmiM+yn427P3vfWhP9VJf13Udv
 UfdAS1ZGJT8/2BrFXQnndccbrdXRNqOqsC7W8cAgTtSg7huyucrGuanAxvTc3W5dbnFrBe9Y9Y1
 N/wbVPuY3k/pwWPmSljDbQ7bk=
X-Received: by 2002:a05:6902:1b88:b0:e6b:7216:43d3 with SMTP id
 3f1490d57ef6-e787e22a91fmr9238021276.0.1746706297912; Thu, 08 May 2025
 05:11:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250508093519.144004-1-thuth@redhat.com>
 <20250508093519.144004-4-thuth@redhat.com>
In-Reply-To: <20250508093519.144004-4-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 May 2025 13:11:24 +0100
X-Gm-Features: ATxdqUE2ZCTohnDk-2R_sNo4SiQUNwaogsy_gXdl9XsbSJJXtfDzsQMZ_Fqil-E
Message-ID: <CAFEAcA82UF1Cp48VPs6Bgd5Yoe=BgDrXGSJWi=72pS+j_UJGFg@mail.gmail.com>
Subject: Re: [PATCH 3/5] hw/arm: Compile musicpal and the xlnx machines with
 the right CFLAGS
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-arm@nongnu.org, Brad Smith <brad@comstyle.com>,
 Warner Losh <imp@bsdimp.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb33.google.com
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
X-TUID: XHnQ3vR+AqLx

On Thu, 8 May 2025 at 10:35, Thomas Huth <thuth@redhat.com> wrote:
>
> From: Thomas Huth <thuth@redhat.com>
>
> These machines include ui/console.h, which in turn includes the
> pixman headers and <epoxy/gl.h> via ui/surface.h. If these library
> headers are located outside of /usr/include (like gl.h on OpenBSD 7.7),
> we must make sure to compile this code with the right CFLAGS so that
> the headers can be found.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/arm/meson.build | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/meson.build b/hw/arm/meson.build
> index 5098795f61d..51d0c055abf 100644
> --- a/hw/arm/meson.build
> +++ b/hw/arm/meson.build
> @@ -8,7 +8,7 @@ arm_common_ss.add(when: 'CONFIG_HIGHBANK', if_true: files('highbank.c'))
>  arm_common_ss.add(when: 'CONFIG_INTEGRATOR', if_true: files('integratorcp.c'))
>  arm_common_ss.add(when: 'CONFIG_MICROBIT', if_true: files('microbit.c'))
>  arm_common_ss.add(when: 'CONFIG_MPS3R', if_true: files('mps3r.c'))
> -arm_common_ss.add(when: 'CONFIG_MUSICPAL', if_true: [pixman, files('musicpal.c')])
> +arm_common_ss.add(when: 'CONFIG_MUSICPAL', if_true: [files('musicpal.c'), pixman, opengl])

Is there not some better way to do this with Meson?
If we're building with the opengl dependency then the
header files should go on the include path for all the
compilation objects, not just ones where we explicitly
ask for it. Otherwise you get bugs like this because there's
nothing that will check that you only used header X in
C files which say they're using the dependency.

I think that either:
 * the build system should ensure it gets the headers right
   when it's building things
 * there should be some check such that "use header X without
   declaring dependency on it" is a build failure everywhere,
   not just on the oddball hosts where X isn't in the default
   include path

thanks
-- PMM
