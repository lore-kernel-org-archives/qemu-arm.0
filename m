Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp2957885ejn;
        Tue, 18 Oct 2022 00:52:50 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM491sFTFD2mV3ZaTIVSw/AIo0K656F5NHpozeTeF2a/pcWGnEzCrOyOnl1uJs01YsFSP1cf
X-Received: by 2002:a05:6214:2a83:b0:4b1:cdc6:821d with SMTP id jr3-20020a0562142a8300b004b1cdc6821dmr1135011qvb.36.1666079570460;
        Tue, 18 Oct 2022 00:52:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666079570; cv=none;
        d=google.com; s=arc-20160816;
        b=0LnYMAYuA5Zk4udEOAy6IJLPxsYA9vVRIl9t/RoxPkKKhq8uZ7DMvZL4c0nmyZU0R4
         jZy4yycwb6GYJNVKnW5AhGroCNGz5QC2hD5om6FVn4rzwIih5UX221WPMIgUUV7/sC1f
         tWQNmbanqB3Bo/k3OMnYuj/0c2d9i07gDNOWWjHYADANGz0DHFXZhan3oldypMKHqazK
         LKlJRBwE34+3LMUcCMh3j0rdUllpsfbQeqNKLUP/EsjRMvxYJQL0RAGwfZ6CeOs2vqUb
         LPwO5jYMOvN5WspONFOkoWJl7cTR129LGrdTLYPnW87PwSKr3MZPMDqzW26TtBHuymm2
         TLUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=Ma/MLkhbX9hpTmFa1X4y5wOO4+vbQDsXX/ZpvW31WZ8=;
        b=SUaAyX/TKOlu70ILGDknzri9bcQT1zkNgE3ZgVMF+NODvS9+388APVLg4McTPMjUaA
         +lh083hCA2fEteajeV9jBl1NIlkm8kfPGSw4370jYBDhROQRqX/NLK1vLqx3DHLt6rlk
         nkNGjlhNRVSBxEuu8ASnKRdCxns1yDMINPXLvv4t1ummQuda3Vz2iEQTsPAFnsOOAktY
         0jOWZectZ3+EXBxxm/o0sFtiUKYtDfB05O/6koFwwQ5dTCO9nPcK8wL1FDEfhW+FcSDP
         KiJhP7Vbqh4H5AYNsoCFnxZ8S3FGO3pTEUswMLY5WBS88rn7iSW6kd3+1B5ic8F/c7e4
         sFDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b="Lkr0f/Ee";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u17-20020a05620a0c5100b006e05feff6e5si6875445qki.678.2022.10.18.00.52.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Oct 2022 00:52:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b="Lkr0f/Ee";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:40720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1okhP5-0000zB-Pv
	for alex.bennee@linaro.org; Tue, 18 Oct 2022 03:52:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1okhL0-0000pN-37; Tue, 18 Oct 2022 03:48:35 -0400
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34]:43791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1okhKy-0004aX-73; Tue, 18 Oct 2022 03:48:33 -0400
Received: by mail-qv1-xf34.google.com with SMTP id mg6so8822388qvb.10;
 Tue, 18 Oct 2022 00:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ma/MLkhbX9hpTmFa1X4y5wOO4+vbQDsXX/ZpvW31WZ8=;
 b=Lkr0f/EeSE+3rnmf07cBKfnFJ2Oiy9RCr5/vmb0l2A56uY4D39uISeLaOdout0A0Ct
 wYm1YMLurWK4SdKqDbEcaUP9e8TaXCKxLoQTt2uGI+Bt+eYnssExBj5z3i/sdGmSD65h
 2x1sWmJBMBatp6+XhN1ybrAEv/9vwFbq2VVf5OhtZaAcJFuBfri3bGoMdsIZCMyuV0TH
 KnoYWK7kttDq+1DqbYKV88P8YMdWlVS+zCDAANIGC9FAUcbPg8oToXFHmca4/gIB9j2D
 18qz5lmsTFEL60pt/4IdqvYHA5VFM3ebHlet9okk3EybKgLbxuXYoQFJbYEEE4wbo45V
 cpNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ma/MLkhbX9hpTmFa1X4y5wOO4+vbQDsXX/ZpvW31WZ8=;
 b=wS5Kw5I5jjYQqhGxUTHE/GftWHDchwnEWgJF9jRojQwZTg2iIphrYbYvTZbNcOFWCj
 5J8pXWNZC6vUHfmEr3DivxBO/LYD+znP39aaA9P8VpK+Ha0IXWoYr+z1JeaYJuLHkg4F
 mtkpPf398tTJOebMF1W4fveuh/Ulx1gL9rTpZJV4akjpU7P5uZbsq/n6LpmWXBRNOGD1
 xpFomJcVDLRMvjp8ZoyFvo1kkAY7cT3ct/TIL6pywXXbe7CsT0OSZGTyCT1WAAcS1HQ/
 cpB3onRytW1Km9idwSbGKhUrZORl+puAo+wqeswW3eu5S3J+pTaFOGX0QDbHuYvXrf69
 0D5g==
X-Gm-Message-State: ACrzQf0e12sV9E9P9tTGgalq3dcfFvJ0FEjGmRFi+iRSTidL+zXt8//x
 MNfBQJrrIVTBrS9EyOFYmtpZiyuEus6r68RLsZY=
X-Received: by 2002:a0c:810f:0:b0:47b:299a:56d7 with SMTP id
 15-20020a0c810f000000b0047b299a56d7mr1325230qvc.12.1666079309796; Tue, 18 Oct
 2022 00:48:29 -0700 (PDT)
MIME-Version: 1.0
References: <20221016122737.93755-1-shentey@gmail.com>
 <20221016122737.93755-8-shentey@gmail.com>
 <2d634687-bdf7-a59b-76e1-60de81142a4a@eik.bme.hu>
 <2C1D5CD8-9EBA-47A4-8AE9-6464BAB6CC68@gmail.com>
In-Reply-To: <2C1D5CD8-9EBA-47A4-8AE9-6464BAB6CC68@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 18 Oct 2022 15:48:18 +0800
Message-ID: <CAEUhbmWb_H_hTToGzb1ioZtZJxNgwPsjTaiUfBBnNF+1g+5PBg@mail.gmail.com>
Subject: Re: [PATCH v3 7/9] hw/ppc/e500: Implement pflash handling
To: Bernhard Beschow <shentey@gmail.com>
Cc: BALATON Zoltan <balaton@eik.bme.hu>, Bin Meng <bin.meng@windriver.com>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 qemu-arm@nongnu.org, Alistair Francis <alistair@alistair23.me>, 
 Jan Kiszka <jan.kiszka@web.de>, Magnus Damm <magnus.damm@gmail.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, 
 Aurelien Jarno <aurelien@aurel32.net>, qemu-ppc@nongnu.org, 
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Antony Pavlov <antonynpavlov@gmail.com>, Hanna Reitz <hreitz@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::f34;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qv1-xf34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ysp6RWWbN3l+

On Tue, Oct 18, 2022 at 3:46 PM Bernhard Beschow <shentey@gmail.com> wrote:
>
> Am 16. Oktober 2022 14:15:09 UTC schrieb BALATON Zoltan <balaton@eik.bme.=
hu>:
> >On Sun, 16 Oct 2022, Bernhard Beschow wrote:
> >> Allows e500 boards to have their root file system reside on flash usin=
g
> >> only builtin devices located in the eLBC memory region.
> >>
> >> Note that the flash memory area is only created when a -pflash argumen=
t is
> >> given, and that the size is determined by the given file. The idea is =
to
> >> put users into control.
> >>
> >> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> >> ---
> >> docs/system/ppc/ppce500.rst | 16 ++++++++++
> >> hw/ppc/Kconfig              |  1 +
> >> hw/ppc/e500.c               | 62 +++++++++++++++++++++++++++++++++++++
> >> 3 files changed, 79 insertions(+)
> >>
> >> diff --git a/docs/system/ppc/ppce500.rst b/docs/system/ppc/ppce500.rst
> >> index ba6bcb7314..99d2c680d6 100644
> >> --- a/docs/system/ppc/ppce500.rst
> >> +++ b/docs/system/ppc/ppce500.rst
> >> @@ -165,3 +165,19 @@ if =E2=80=9C-device eTSEC=E2=80=9D is given to QE=
MU:
> >> .. code-block:: bash
> >>
> >>   -netdev tap,ifname=3Dtap0,script=3Dno,downscript=3Dno,id=3Dnet0 -dev=
ice eTSEC,netdev=3Dnet0
> >> +
> >> +Root file system on flash drive
> >> +-------------------------------
> >> +
> >> +Rather than using a root file system on ram disk, it is possible to h=
ave it on
> >> +CFI flash. Given an ext2 image whose size must be a power of two, it =
can be used
> >> +as follows:
> >> +
> >> +.. code-block:: bash
> >> +
> >> +  $ qemu-system-ppc{64|32} -M ppce500 -cpu e500mc -smp 4 -m 2G \
> >
> >We have qemu-system-ppc and qemu-system-ppc64 not qemu-system-ppc32 so m=
aybe qemu-system-ppc[64] even though that looks odd so maybe just qemu-syst=
em-ppc and then people should know that ppc64 includes ppc config as well.
>
> True. This naming is used elsewhere in this document, so we kept it consi=
stent. I think that users will get it either way.
>
> @Bin: Any thoughts?
>

How about a separate patch to remove the {64 | 32} suffix, and just
use qemu-system-ppc64 consistently since the *ppc64 executable can run
32-bit ppc codes too?

Regards,
Bin
