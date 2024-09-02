Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp1125128njf;
        Mon, 2 Sep 2024 07:29:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXXb098yF8B/7UBy+KLA/k4goRst1PwcOgTthgXzReYS8V8EAUmEItaOo+3pxfA3g8nktipz//PxNZ4Ww==@linaro.org
X-Google-Smtp-Source: AGHT+IG7kWzky+ygZkY/EnKRvGVN5OcdNJbjV8K5UtImLvFPpA5ugpeRYH4cDGmVJP+bGCQVdNGv
X-Received: by 2002:a05:622a:428e:b0:457:cd70:85c3 with SMTP id d75a77b69052e-457cd708be1mr51021321cf.7.1725287399353;
        Mon, 02 Sep 2024 07:29:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725287399; cv=none;
        d=google.com; s=arc-20160816;
        b=e+QLdXnO7CYFBqsgOHZnY0DIxPYQ8tmRPuhz9hsEf3VrTZJYNra2wSIAkmNSawdAw9
         69eoekpxd7xemlV6a5k7YeOttbTJ2mHKIkp9N6qdqJx/xAsv7rTEP2N6Xwk3g1n6qBrV
         OY0yLgp1kBjaRXWVV1tVI4dIfgkzX2wAPaA6OXXD3xqWt9Xly7DDB+XvgifdtpkeGRxI
         ScATJAeCfZqS8eEr5aRumJvbOtTT0LIDD1GTbxxb53Hse9VKdK8m+on5lqs1WCr/8V5Q
         +L8UszqyGwxRmcn8vF36DW9hStP/P+TUXL1iBvnQkbvyP59aTtDYa+eVYRtp3L7rFywd
         qxCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=SxxpxVs/6tl3HpTrMkuGd3JgXjHJgUQ2iDROWDPLnNQ=;
        fh=ZIOo1ydTIqyR0HDEKDyEuB/atUwVAXlG5H1OBbUlDZs=;
        b=IyGRXj0qO/6MnU/unx7/MFqx0pDeVA0Ercl8twP8AvZN0K/9CS6PXurMTTcn5ldaU4
         ieLpe7MimK4F+fQpxKrWM39JXNDtz+FKFNblQCKVaZj22tKGlBsNV337wkTU03Qb/AHm
         tuMTc6VwN3/04UzJceYAVvSMO84BDa0zBD8y2uTFu405850kvsFvr4SoYsQK+mYPgjYy
         mSxyfz0MukVaElW608WjLoD3XJiMvIbTWym9MCsfMlHcKdvQbbp5hUYREFOhX9AaBRUC
         KM843zTYXw/zIiXCcJTf5OBiT7Vc3gk+v/J19o+pBJaynmWc2fxJfFdEMQ440WGfelzW
         c+/A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="w4/xAGqo";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-456855bb351si100811851cf.509.2024.09.02.07.29.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Sep 2024 07:29:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="w4/xAGqo";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sl840-0005ti-Qv; Mon, 02 Sep 2024 10:29:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sl83w-0005ab-A5
 for qemu-arm@nongnu.org; Mon, 02 Sep 2024 10:29:50 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sl83t-0005Rh-EE
 for qemu-arm@nongnu.org; Mon, 02 Sep 2024 10:29:47 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5bef295a45bso1843728a12.0
 for <qemu-arm@nongnu.org>; Mon, 02 Sep 2024 07:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725287383; x=1725892183; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SxxpxVs/6tl3HpTrMkuGd3JgXjHJgUQ2iDROWDPLnNQ=;
 b=w4/xAGqosY67KQXYXc58AmGEGQM/QZI+Q3HMV3DeVOFmFw5kxMQxtbB9Nwk5IZH/DL
 Vq5D2iWkzJZpm3B+y+ZP/ew4qdVvd219lw2Q8kpcmbU88A2DhfsKiCpiw0UDjxUVM1z0
 O23nlm1udEV9Oh8nbb+/N/1H5O4Upn+nbeRnOt9dMNXSOfTJf2TFl7JlmCwKGs13KF/z
 eH6cyvvAbouhV+Qn/Tm3xavvBdDopSy4/UQ3ekOGoJihi0g88qOGF8kq0vOQzlp8frX+
 drmiMrqQtRR+hPdLil5hV2Y8XqG+FnECVx5tWDhT9M1cExJhudBQqyQTftPM6WsOC5kl
 OM9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725287383; x=1725892183;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SxxpxVs/6tl3HpTrMkuGd3JgXjHJgUQ2iDROWDPLnNQ=;
 b=K8X2Xv1+mfSYozw0ARcqUrez3Ko3RyVSAO745pI6p1gfOJ1iYyBCrl0Y4YC6Nr6vqJ
 Nj8Y3xB6lT13suKfzLzG1CPqMonKkMvsu+gjnZkoB8XG0biR7orG6IgsQqe+gD/F2uc7
 jbDAUWUb++66hvc5GWlAAoGY56976rdnyzqSCvV35LHLewjq2phcnGmKtHeRyq1WZj/H
 8WoVVoTMjLjjWkk0cp5+4NSoC0iNX9qhJhHbnWFUfugPZU8V/XE0iNwDrF3Ma3yJuBPb
 cWnCeyiYhULeBYAKNkaSsJr32o7BxTJmOrbEbNKHo35SFONyuNdUiHs1yNq3nGBXCtvp
 qbCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWchWheofQcOnML8n+UjRuGL+uvO7yPOMokQb7KHnZWWWOKwqMNgEnArltIk+Z2gg8ksNYgEx3jJQ==@nongnu.org
X-Gm-Message-State: AOJu0YyOKN4qO0gkYcC5O0PHLwk0d3NmKiyOrC//lz79dWnvMrDNCOO3
 O/sLLWUoP3snfFH0AKMDJ8H9wTdE1BgqVcMUL/tRomLoneVXsEWEfwQQyJI32PBYhHtjEj4c1kj
 0X7s5aXsafLdmbL13KSaEyjlcDO7UoZ9G+CO8p/y22ZFkBZrp
X-Received: by 2002:a50:cc47:0:b0:5be:f295:a192 with SMTP id
 4fb4d7f45d1cf-5c21ed401f3mr11717653a12.16.1725287383036; Mon, 02 Sep 2024
 07:29:43 -0700 (PDT)
MIME-Version: 1.0
References: <CA+1FSiirzpq4wjcKTLSexiOWtv26sgD37h=wA2qxv8Qh5MW_-w@mail.gmail.com>
 <CAFEAcA81xDEubwm7ZYHZWtp_9nZh_gd9o=SZK3WOOm0-9Ja3rQ@mail.gmail.com>
 <CA+1FSiiuThJXkgXOnzuw7U26kXaNuHBrJkmh2EXbtOcH00rKhA@mail.gmail.com>
In-Reply-To: <CA+1FSiiuThJXkgXOnzuw7U26kXaNuHBrJkmh2EXbtOcH00rKhA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Sep 2024 15:29:31 +0100
Message-ID: <CAFEAcA-8tWc7i2OqQTWJvup0QztOK7XeuBzUohT9eNoEADFKuQ@mail.gmail.com>
Subject: Re: Error : init: partition(s) not found in /sys, waiting for their
 uevent(s): mmcblk0p2, mmcblk0p3 while trying to emulate Android 14 on Ubuntu
 24.04 X64 bit using qemu-system-aarch64.
To: Mario Marietto <marietto2008@gmail.com>
Cc: qemu-discuss@nongnu.org, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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
X-TUID: 9MHm8Fry8LEi

On Mon, 2 Sept 2024 at 15:06, Mario Marietto <marietto2008@gmail.com> wrote:
>
> ---> I think it would be better to fix the guest
>
> I have no idea what to do. Please elaborate more.

I know very little about Android -- you'd need to talk to
somebody who does to find out about how to configure what kind
of disk it is expecting.

But the broad-outline summary is that to run a guest on QEMU
then both the guest and QEMU need to agree about what the
hardware it's running on is. If they disagree, you can fix that
by changing what QEMU provides, or by changing what the
guest is expecting. I'm suggesting that you'll get a
long-term better result here by changing the guest.

-- PMM
