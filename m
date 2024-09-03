Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp1486249njf;
        Tue, 3 Sep 2024 08:32:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWu1ubuyOcDi4CabsJ8GPl3SUO6ebkvbA1u1sP/nyyQmgbOe5M4uZDAO2kZYoH/uydBgSTAVqHRZKjWQA==@linaro.org
X-Google-Smtp-Source: AGHT+IFxiVKh2Ykoc56RlOzOTzUkrR3xZeaGbndoIZ+KBV+9vODnI9T6iicI6CMt6m3U47dW8AvJ
X-Received: by 2002:a05:6214:3d9a:b0:6c3:6bfa:536a with SMTP id 6a1803df08f44-6c36bfa540emr61460696d6.21.1725377563635;
        Tue, 03 Sep 2024 08:32:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725377563; cv=none;
        d=google.com; s=arc-20160816;
        b=ZreHTXyKVK3Y08r0/hSn9XZV1MVIoujp8KNrgfFu7KjD745QJkEou6oIZtce5eYBwr
         IVN2rbIW3cWZfsXe0u3rqGvK7sj6BJqVJho1/+4ud5Mr89O1a57SBij2qlCVgdgGj7+H
         1P/Wak3tdZGU8vnKB/YeAGSmdtA0qZ//eQN/Q2+zj9emF/SoFEQWDGE5uFJNLW82aRBK
         doLzn4DRbt5gIiJQGx1IXnxsXi26kt4dcJrc6WA5M6Bsgg2TNR3Qn2SEiOyGWar8GUTD
         uJnOm8ElaaS/JtDAHEM+aeq5y4H082U7kLDwMToHIbaYICOjjCcvYrXu/N19Mtpbgd96
         Kumw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=9J+H767L9jNoeYIkPNIgbuSTmnuTWDYuZtyPYqZXxls=;
        fh=SNTfT3DYkrUmh+o9yHe7P9wtiT0arXeVOA4SB3XWKgo=;
        b=LNfsaZVr7Oq9kfzOnrHcEyLhpXsU74jPe6HZ8GnCxtix100jmDLSVKMnftAi0YnhE2
         fs4FqDpVKeVjapdpWcZVdyX5EoAIDLOEKVFpQQoBRhkuzVv8ZlYzJ9xY2ThrGKOJGgfF
         Omh9VCHnSgfwk93H98TcQmD98d3OoRPR7w/KWcjgXtj5WlhygbRTp4X/Jh5fSVdRahS2
         1KAbbwPj2L4PbebXYj5bWC8A7rk8BJAKek+7iChZSgzZnvD9vUegLlNMMm08ifPkVGQc
         6Hb3T2N1fn3xFhn1M28SE4Ti1+Qv/5RQ6SNhpm80JR3KfPYU1tDGhlLubnVVCyqZuv9s
         vqgg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xqeUTShe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c35091d6e2si98871976d6.474.2024.09.03.08.32.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Sep 2024 08:32:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xqeUTShe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1slVWG-0003iU-EW; Tue, 03 Sep 2024 11:32:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1slVW9-0003ce-Bd
 for qemu-arm@nongnu.org; Tue, 03 Sep 2024 11:32:29 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1slVW7-000543-99
 for qemu-arm@nongnu.org; Tue, 03 Sep 2024 11:32:28 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-42c2e50ec6aso19405915e9.0
 for <qemu-arm@nongnu.org>; Tue, 03 Sep 2024 08:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725377544; x=1725982344; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9J+H767L9jNoeYIkPNIgbuSTmnuTWDYuZtyPYqZXxls=;
 b=xqeUTShe+omjMTijBfwcXPk34pMSo5/pWN8Gds4uokfs72s9Ux1IVQ3hphvkvkAurS
 3wW6kvV+jLGdQSSQuuZ+qQTX/8ET5qdtHx/8kysRkX8yKrFypQEXRl/fxsgHYFUSmF7Z
 nTaxuW0cXqghojNDx2If1bkMgmAkILGZdEucrxddCMk6diLUj2FBC1RmKYBdb+cR305Y
 RR2vYl8ES9KElokJhjX5OxMKaRKQvng+37/78WON78Dem+f4t7TCQirTQfcN37cfTvZf
 PYF/SixiE6kDBD2PAfPLxvnd20+JYBv45V6chjaVrJ8WD1zSR5jfTo/5JW7QbBVYo6WQ
 GEfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725377544; x=1725982344;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9J+H767L9jNoeYIkPNIgbuSTmnuTWDYuZtyPYqZXxls=;
 b=GSVPKtnj6V5AdMnxtnsJGdOzEPxI9l8RV7g2L6Edng7kq/7NDFqC8l7wHYXD8I07xh
 +EbIs+jLgCIGMuUlNP3xVzfsRnvGuzVyOqwK0IBBjfRYjZh8L9+MBAeM/JUf7H6jlekx
 J+3guHHwm+Kv1+345+qVgXIBrrZdJ72HL1X+GvGQM4fSN3Tw20B5cJ/ZVSwA94Ai3rdM
 c+MJqnvz7bs8UPuui3rk8yBnjAOHcz4dXG7TvO1BM3418VdPknzxb9TwOwns8A9JWzZI
 emE+EloXVmTEYbSq5wp9DtFPWLsvUur8ytDGRhEJmoI37A+TamSNAxo0L3m4y4B/5vnf
 66bg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhL3rTkHS3XJfbaBRnJzcvmP05cPkgGI8wolXCYNALvA+8lcLqkAMnftg6XJEteSu3kceOv0tXGw==@nongnu.org
X-Gm-Message-State: AOJu0YxpcYd4Z4vckAye1np+ICSBHnIYx8fcUF3PCMciPlUCzlt1IxBs
 SIN79GKBV/lP2IW7T3vVkbBCuVsZNZqrOHTswV8XZniObRZymrWak1g+UCbxVu0EK4Usiyw8T9v
 MWIlI+Q6do4qNwYFWLlPqpvdSGLXDS55Vv0oaFA==
X-Received: by 2002:a05:600c:1914:b0:424:8743:86b4 with SMTP id
 5b1f17b1804b1-42bb4c4cbefmr107117485e9.6.1725377543851; Tue, 03 Sep 2024
 08:32:23 -0700 (PDT)
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
In-Reply-To: <CA+1FSijfe+5V4RHs-1ow2JwAeiKcmW31V2Ddx9a9zxb_kybDFg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Sep 2024 16:32:02 +0100
Message-ID: <CAFEAcA-U5DpXysVoVQLAJzEKQ17TL82UiRXHH=q+chxwcubOJA@mail.gmail.com>
Subject: Re: Error : init: partition(s) not found in /sys, waiting for their
 uevent(s): mmcblk0p2, mmcblk0p3 while trying to emulate Android 14 on Ubuntu
 24.04 X64 bit using qemu-system-aarch64.
To: Mario Marietto <marietto2008@gmail.com>
Cc: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-discuss@nongnu.org, 
 qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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
X-TUID: wNWL34vP9LSW

On Tue, 3 Sept 2024 at 16:25, Mario Marietto <marietto2008@gmail.com> wrote=
:
>
> Hello.
>
> Actually I'm using my Jetson Nano and I'm trying to emulate Android 10 by=
 antmicro. I'm trying to use the same parameters used several years ago,whe=
n it worked. What I want to try now is to enable virtio-blk-pci on qemu. Pr=
obably in addition to using qemu 5.0,I had configured qemu with virtio-blk-=
pci enabled,because I used these parameters and they worked great :
>
> -drive index=3D0,if=3Dnone,id=3Dsystem,file=3D/home/aresuser/Desktop/antm=
icro/aosp-img/system-rw.img \
>         -device virtio-blk-pci,drive=3Dsystem \
>         -drive index=3D1,if=3Dnone,id=3Dvendor,file=3D/home/aresuser/Desk=
top/antmicro/aosp-img/vendor-rw.img \
>         -device virtio-blk-pci,drive=3Dvendor \
>         -drive index=3D2,if=3Dnone,id=3Duserdata,file=3D/home/aresuser/De=
sktop/antmicro/aosp-img/userdata.img \
>         -device virtio-blk-pci,drive=3Duserdata \
>
> Can someone tell me how to enable the "VirtFS support" in qemu 5.0 ? beca=
use at the moment it is configured to "no" :

VirtFS is 9pfs, not virtio, so unless you really want 9pfs
you can ignore it. If you do need it, the requirements as
of current QEMU are:
 * Linux or macos host
 * libattr-devel (for Linux)
and I suspect they'll be similar for older QEMU.

Passing configure "--enable-virtfs" should make it error out
(possibly with a helpful error message) if it can't enable the
feature.

-- PMM
