Received: by 2002:a17:505:790d:b0:1cc9:4ad0:aa2 with SMTP id xu13csp2805820njc;
        Wed, 11 Jun 2025 06:01:17 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU0JBuMem0j5vtZ+zxWmN2ZcMVsd0cSmq8H2yGPtkkeFVPMboXM+QbfARDbce+53ShUM4Dpe4fTH+uESw==@linaro.org
X-Google-Smtp-Source: AGHT+IHCV6mFA0RNc/NyB0doJf7qvwxKpmRXz9L7IETLVeWfoEdfwValT806BTwf3RpetgI7/non
X-Received: by 2002:a05:600c:1d89:b0:43b:cc42:c54f with SMTP id 5b1f17b1804b1-453248c267amr32719995e9.14.1749646877303;
        Wed, 11 Jun 2025 06:01:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749646877; cv=none;
        d=google.com; s=arc-20240605;
        b=GsE2oaPWX9a9Ai79pGgPmWHfmAMVmRv2a9qKWlUqU0J3DEUIHe1j3h61P16htr8Zg+
         G97RvTFuHxSrlnPS4vKFp8Eyu+y732YrYy9RgzwEcx/MZ2O20NDVGP0zzovzgxNeGN8c
         cGGwMnRmD/OT1e/8kYpVRZ3Senx8GZTReKANWB5HuQi0gjQqUNpbKiYRx9m8PjH4I4EY
         ou8aET3So3ADcKyU3ECgMnCxNNseZ4Zv7Q/RmE+GiwOBYSApfTfUIzsDTI3jvwHVF3it
         WMzXfrM7Ux4juVpuUiKGTRh1rM+52Xxg6DAmBia+6zpwub9R7BDKEU5QggGOkt+d+ltE
         J3lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=jf6tMngBWOppBmsTO8G8rEDGlplT+20Nq8g2MEOpmr8=;
        fh=9DchOhpVc+HHCslLkklQEduljsIsL/5cZ3csQglF74o=;
        b=SGaDLmVzOgeE7oZKZ9lk456dn/YR2jqOcqSnKHKp3ZedxFxxc3WvLLt2Oyx2syfN1c
         VUQghDgql619K+lgbrrJ7o87BTsX1OF2dwtIjX9CgrxF+ueC4Uc9jJt1OGNk55NJzJLj
         0VZLr1qEVlzaFShTjkgtpbtOSxUURNHip1pEM/Mh/Dxc+oLW4hom1slFjCCNKZhbUdy/
         rlYWOKJgixFeOfCGzZItQXF89qR80uy49kjU4GFO+qcB8KpsnGcz7SBFRnrmmYidRhzC
         NGx6Sr97GQcrvSKbrswuweL8tdbQTKmyDFpcwtwz4Ic5B+AMkb/c3+FCyhPW6Z210+vc
         GFcQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="eN1QJQ/y";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-453251a975csi13329585e9.118.2025.06.11.06.01.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Jun 2025 06:01:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="eN1QJQ/y";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uPL47-0003w3-T2; Wed, 11 Jun 2025 09:00:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ktokunaga.mail@gmail.com>)
 id 1uPL43-0003ps-3f; Wed, 11 Jun 2025 09:00:23 -0400
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ktokunaga.mail@gmail.com>)
 id 1uPL40-0004jZ-UI; Wed, 11 Jun 2025 09:00:22 -0400
Received: by mail-qt1-x834.google.com with SMTP id
 d75a77b69052e-4a442a3a2bfso116827791cf.1; 
 Wed, 11 Jun 2025 06:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749646816; x=1750251616; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jf6tMngBWOppBmsTO8G8rEDGlplT+20Nq8g2MEOpmr8=;
 b=eN1QJQ/yyjRIFvmM/FHP3vmzYveR7DAPBuGJjbt8DX5/TWjZMR4089RllUdvUx/6ZB
 2N0cqNzRMZaMuAHKSzOmv7++6MAdFWuXdD7WAbU6AJ0res8zTshp5iUG+hCVT4UqkAJO
 ZQlgA3g0yDkiNJ/EsVBU48l04Bi15BllIgLwvR0obofzId6rVVkahATZnDmOPUiiKQyQ
 vFFVwFY0JtOf6sphQy4AH+/JHzm/sBbCvNcAEWcDysZUrz3d5EZrsIdseOh0FkGAdHAj
 x7aJeVtDPn5Cc3E2q1vemEEzUdSAQtmVhH1PKzYMP/M+wUKE8ITOR3ICiueaFWY1X+2u
 Zs7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749646816; x=1750251616;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jf6tMngBWOppBmsTO8G8rEDGlplT+20Nq8g2MEOpmr8=;
 b=j6cU0kTzJJOw4xtU44jsKpGFcSGvTBdrGjcjCgpugUMDWd6Bf3ZQHpCevGR5L+wclY
 ocXbY3Rfp40hIX5ZgzQmzOyXEubdoqHDbvKMS7wDxXvF8jVYB1y+XOyRtibfTcRSGDcy
 RagbbLM2GQE+nEnz7JdXUkQ0qFZazjqVVxAK7FAuHxLzAh3Ck9fQ3GijZXqgoC4aESr7
 +s14lTnNr4lvxvSaAUAipwGffGpI962KFqDCWS5CLBxL8H7BtUQsOPJHKYkOGpGyIypd
 IEM/mGJuAkcHikcH8dV3i1amkEXZiQPFlmZg6bEn7rZtKN5Ht0gkuux3MpEMQx3clxHH
 1S4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWT/apyg6G6QjneXqC7v0+Etmhsw2A6ldL6VdasoAFOYRmuMtGKTK3G/CyxFBxGryBO1+6lTNPJM6Y=@nongnu.org,
 AJvYcCWWBg6/J6zik+p9lrA0Rb1jZ7EPy+PUS0CzB81DNP0ygBlSX6J7BzvsiQyAjTMZlgjo8smw6aKuq8FQ@nongnu.org
X-Gm-Message-State: AOJu0YwvdJh6Iu0+EkUFZLrgtSe92Ndzj/2ZPi7gGX8g5Ti/4UW6H6gT
 yIO7ex5RCmdOVf9ZA7g1uwvf3cX5oxI6YY6cG0WZoQZz9FVIJ/6ho79ze7Nu8ImCa1Ppmn1h6NT
 pLXHOfRxohaslLHcf4ib/j1abFiYUHqErWYjd
X-Gm-Gg: ASbGnctFs4upL2kZfhSrygdaUVc0AJBk3IjyBFRm0K/betEd6G6jxPId5GKCI1nbfBm
 Yf2uzPAmnhMV2oHoeJIuO8QxW7Gd0dR1aOY/dv9vL8coYhqSlrdcGwJ1mIO0JgZAhtPGQzCo/UH
 Jg1X6VIFOc5VmoRdfjTZQ53tX614ywofjJWe6NEGfTOT1PJSW2ILJV4pWmXLaR3DRSj0GufwaX
X-Received: by 2002:a17:90b:54c3:b0:2ff:6167:e92d with SMTP id
 98e67ed59e1d1-313b200de9cmr3245116a91.32.1749646805176; Wed, 11 Jun 2025
 06:00:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250610204131.2862-1-shentey@gmail.com>
 <20250610204131.2862-4-shentey@gmail.com>
 <32a05613-7606-495b-8b2b-fb64b31885c4@redhat.com>
In-Reply-To: <32a05613-7606-495b-8b2b-fb64b31885c4@redhat.com>
From: Kohei Tokunaga <ktokunaga.mail@gmail.com>
Date: Wed, 11 Jun 2025 21:59:53 +0900
X-Gm-Features: AX0GCFvEQQIsEJPjWiVPODjyYS17LYLxJkVINVAbwoiJEX4Er78g_COisy_PVDY
Message-ID: <CAEDrbUY2=bs9oFc=vF_ZZhScCpZqKn+iEmCNH0zfYuKnjLM6yQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] scripts/meson-buildoptions: Sort coroutine_backend
 choices lexicographically
To: Bernhard Beschow <shentey@gmail.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-ppc@nongnu.org, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000004e162b06374b6406"
Received-SPF: pass client-ip=2607:f8b0:4864:20::834;
 envelope-from=ktokunaga.mail@gmail.com; helo=mail-qt1-x834.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Bpa4EDQ4X3cf

--0000000000004e162b06374b6406
Content-Type: text/plain; charset="UTF-8"

I should've made sure to run the tool, sorry. Thanks for spotting and fixing
this issue.

Reviewed-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>

--0000000000004e162b06374b6406
Content-Type: text/html; charset="UTF-8"

<div dir="ltr"><div dir="ltr">I should&#39;ve made sure to run the tool, sorry. Thanks for spotting and fixing<br>this issue.<br><br>Reviewed-by: Kohei Tokunaga &lt;<a href="mailto:ktokunaga.mail@gmail.com">ktokunaga.mail@gmail.com</a>&gt;</div></div>

--0000000000004e162b06374b6406--
