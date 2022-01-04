Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp11311025lfb;
        Tue, 4 Jan 2022 15:44:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJysd5UZlUxQEH2R1w3unCZWF1RIfC6+6giyhgoeuMtFl8K5G+t3IcFIsw1za6AZgwHnfKOa
X-Received: by 2002:a17:90b:4a51:: with SMTP id lb17mr889595pjb.101.1641339879416;
        Tue, 04 Jan 2022 15:44:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1641339879; cv=none;
        d=google.com; s=arc-20160816;
        b=Tna0vOWhcW13UDknrLKxlo7ITPeXyD/PDkOGetF0cup9JoqSzLSl3q/FzFFpq8QDcy
         rnmwNNBzTiypHkwLyGBN9jchwhnW/0AVWWHyv4Os46AO2UDFEXcxpGicXzVy+MeiwViP
         7my8Y95CzXaZitfR/KHO/sYeqmIgf2iDgcfM2zqZ8kZB/AHK/E7DkaDZzNpMUUEqvoUr
         lx62edkODp+g7FouXb4SnFF317JNgdRw+70BY3K6okGbquBhaLSwwNO7zDcR3j45azpd
         pXJEVj7uuuAKsICejrcPxBuXmX93VO8ra+gSxF16ANTVUUfvib/Cg2l5VrSUnJGyAqfD
         VmUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:content-transfer-encoding:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=baPPzIl4djY8IL24yUI8dZx1AJMef+TChjeDi+UnWMQ=;
        b=N0zaJff3QRxO8nEWDAV+K/MEnKOZUkEicut41bdI3ZXfRQBavnSGxlGn4Nm9yJ4mzW
         VPJeQ+PfSWpUG8YBlaF8jwboAHpLBHu3NfnUxiS4EgHhIPPPf1eJYtD0pUffD5UvTCI2
         Yvg1J/dt+IQFh3QMOIYDbZ1Sgvll5w0HIK98ZwfHSvZ6xVSqFVTHuF+zX6rhgf9XK3aj
         h8PlZCMVtnPG6OwHQNfw4whHR7MVnuu+bTz/q6btDZTTyffLd5H081JtBHABTXIInL4M
         7GLBJ9+VzAxNRBgL/IEMlq2/vL0/eLDY0OuJr/MM2AP2i1akhTC5gzPUIAwlj5IlFds4
         7DCg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=i8DvgvHy;
       spf=pass (google.com: domain of linux-kernel-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=linux-kernel-owner@vger.kernel.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmx.com
Return-Path: <linux-kernel-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [23.128.96.18])
        by mx.google.com with ESMTP id q13si21892641pfj.320.2022.01.04.15.44.39;
        Tue, 04 Jan 2022 15:44:39 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) client-ip=23.128.96.18;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=i8DvgvHy;
       spf=pass (google.com: domain of linux-kernel-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=linux-kernel-owner@vger.kernel.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmx.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236571AbiADXoh (ORCPT <rfc822;semen.protsenko@linaro.org>
        + 13 others); Tue, 4 Jan 2022 18:44:37 -0500
Received: from mout.gmx.net ([212.227.17.21]:58711 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236566AbiADXog (ORCPT <rfc822;linux-kernel@vger.kernel.org>);
        Tue, 4 Jan 2022 18:44:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1641339866;
        bh=jT+NxJxf8VSRyUueNQtfD57jwx7pXR/D+stko6aTkws=;
        h=X-UI-Sender-Class:Date:To:From:Subject;
        b=i8DvgvHyBElxYKe+zkLbCQ35WC/6aO1+Sc6x/XYt+a3Vdezq0ZSwrIrWr5J+AeHrV
         7ROOHedN4wsfePgETPz+XPHbhMMn+8IS7Hgx7nOlwLkjpYdtjBwWd4u0Z4wSsifha2
         ZJU9QQJmDOeJ1gv3297I0P6unfoveRJfb/aRiLpE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [0.0.0.0] ([149.28.201.231]) by mail.gmx.net (mrgmx104
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MDysm-1nCdFl0wTs-009yYC; Wed, 05
 Jan 2022 00:44:26 +0100
Message-ID: <9405dfb2-01ea-d11c-5e8a-f0db5db73204@gmx.com>
Date:   Wed, 5 Jan 2022 07:44:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Content-Language: en-US
To:     qemu-arm@nongnu.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
From:   Qu Wenruo <quwenruo.btrfs@gmx.com>
Subject: How to get the supported page sizes of aarch64? (and possible other
 architectures)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:cxxHVmxBbl17iguVsnk7s5dwMvxT5PcivQOJGdHPtU4dqGLpHaa
 +5QNOYoqR2nJs0xAHRex2auffYTwv/JggMyIhcltRw+XHKKu0/3J50PGcfOuMBRsnd6Sv+J
 lmdIlJFxqK0cWQuht9lI3K/+gtSakqT61wle43N9VK/0a/WeyxzsEf5Hs3OBXk5Ku9f86eB
 yZt+fALsGFkw2BdTZu8cA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:+wHPM84uVPM=:l9R5Jx952fV2aYjFknq5SR
 fpApzLmnb8I5m9IDUKWUQSyz0nE0z8P5nCTpmqSw102eOoOSNfrATFsQS7Eiu7NnzHkA2kU9U
 62AOWF+qqwa2jeFP3xcfde2ECoGf/p1+gUuPm1Fd0JD35ltxRYFsoa/ZOrrqhG7k5IEh0homs
 JQJzc9j5xwAAFphKP8gJO3TnyeqxyKylC9VRDUfYItLp3pSqaJsaKFSRCTPwleic2b/P44SNg
 FeRnr56FrDZJfvFiT/9q2OadNaFqm2DZjPRw5NyDr0z5u9NUPJWoUdnfsyYsPXa/0xw8YCcKv
 xNMYZ4uDV2DfTuPE9KoOvtXI5dvEpYRpf7gJQLCXejOPoD2vuTG7bKNxpUkmxLJ2oJXNeSQBC
 uloq5G8Fh8Ud9iBcBprj+3RVHICiebyaCeCwri12Ob91HKhItBJrz1rm/OxGjjun9LpTBKr6T
 DLBnDVNtHV01nkQIk4S33pq7LYe9AdMSX+Zq8yo8lXDqRhvP3pLRH/5CdVXZk34//JlyzRGmV
 5eG9Rx23QsrTG6yVjYh86EqlPBYY9N2xeDeJFVSQAmz+If1BntSliY2J7CKQnbcJKjYT71Atu
 RLcw/yJ69MA0r0lVMwAFw7NssP42nyAtJKiZsGCKccUC1X4KGsqqT5XP1tq/uqFd7hqn1nYix
 9w3V4wMSBqK9I1qo1mwoanaoPB9mo6RPKo6Ls8wQxfbaoxI6SroYGdw9h2JemqBfdezkdiqsA
 W/RE6/eLd3bWay8Pjfj8uo4hLFu5sKvfAwOwORMPTCYaezHytui7wN0HpX4bI+8nhG7Qc4f32
 7YD6G/gM6a2zbXsmKhK4ilYqGjPsRafaTmt4X7q2y37hjCF2Unz38oAvuptqlmCQyLRn4AEEq
 ltOdtEejZlQpNqT/aKzMU95t+mW3RyraURlOU6nYBkIWkTmpMk6Orn1QZmrKHURwl0KHdrLad
 rh3u2Yn0cgxy92meh2ju/sCZYNKVLq+9UWH67tQCfPfIWZgqIPlEbPHoefLdhHgdz9lgzK6Hp
 UwDwLws3NyCqoatRWeoiESiBOxnXHlDHbx5qbhWSNLJWzLUOXURgdFMhIWoKOGxofvZZhYAvH
 E8fj2KCK0A06Q0=
Precedence: bulk
List-ID: <linux-kernel.vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
X-TUID: 6yElbJLSaAFY

Hi,

Recently I'm trying to boot a kernel with 16K page size, but edk2
firmware failed to load the kernel on my CM4, with unsupported message:

  Failed to execute Archlinux ARM (\Image-custom): Unsupported

While 4K and 64K page sized kernels are fine to boot.

A quick search shows that Cortex A processors support 4K and 64K page
size, and 16K page size is not a mandatory requirement.

On the other hand, other aarch64 processors, like Apple M1 only supports
4K and 16K page size, no 64K page size support.


Although ARM documents show ID_AA64MMFR0_EL1 would report such info, is
there any user space tool or kernel messages to show an
end-user-friendly output about what page sizes are support?

Thanks,
Qu
