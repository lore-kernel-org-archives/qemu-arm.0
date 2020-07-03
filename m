Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2534996lfm;
        Fri, 3 Jul 2020 07:41:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyucOhsoIC4OmahOl6BlJ8qlMsQ2CPHxtx1XQNWNSlbvWJLrYVCEKrY1Nxz6UUZdEPmZwBx
X-Received: by 2002:a5b:90d:: with SMTP id a13mr60663499ybq.336.1593787291124;
        Fri, 03 Jul 2020 07:41:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593787291; cv=none;
        d=google.com; s=arc-20160816;
        b=coGOAccnAOo2IOsJSOzsP7QOfxUu3hhbW4ONv/j1VDDsHZ7LW0Ab1H3lj+z9JExSig
         W3jew81aBVCwJ3xOUEX8M01hHR4gjAWLrI3/HPfTM6s4sOUQS7NLIPgg0LbiLZ2TpgQD
         w0RXg5ESjalwDSjTEAhlyrL02rK8APSELY2eRpur9U8j4W1aDKdOOIfulW3va7ve7UQb
         FSZLiCZJSiPjrLs63gd/+IJkSounTn0v+V51eErMuYB7vgt5Rwc2xPtIq+rm1tBwxH0z
         SCEZJUuGbiLofOY7NUNcURcn0TxBUepx7YHm6qdiajc/AgFaJ+5PZ9FnOHBl7uYc+VOZ
         0UrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=MODZTho7lM7VCZfH3ZtdvINP1atOX3dIVsfme62NZT4=;
        b=uOzrnj8/c5FEvc+zjCdkMznkAfG4xVtxoZj/6ouE61Dky8hVgY3Gz8YblZzQcbZ9/I
         gxqDJP3Kovov9DJpP3b3SkN0DwE9jQzESgSDACijZyoEgCJyXdRkcA1QTLseeNm5ulOS
         LIY/mkHmZpnpbBrghJMVF2G6F2Lo6cy/KABftYhoe47bnqDnQTjcY9Z6/PpO2TH3J7Bj
         7jgoCeyZx+xcBX0/40xwRhd10CyQ8Pql4BffobgQTthpgBQ0AeT+Gh7o80GD/0b6rM9o
         IcRF0Pxpv77qJ8lLMRAtG/lqGi0QW08Uspiur+pCkPmMZ18pGWEcfJtQLInAF7Qz8Dk5
         rj8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NzoWvtGl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c81si1697107ybb.362.2020.07.03.07.41.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Jul 2020 07:41:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NzoWvtGl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jrMsc-0006W7-H0
	for alex.bennee@linaro.org; Fri, 03 Jul 2020 10:41:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jrMsU-0006VC-WC
 for qemu-arm@nongnu.org; Fri, 03 Jul 2020 10:41:23 -0400
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235]:34650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jrMsP-0002e4-91
 for qemu-arm@nongnu.org; Fri, 03 Jul 2020 10:41:18 -0400
Received: by mail-oi1-x235.google.com with SMTP id e4so18539785oib.1
 for <qemu-arm@nongnu.org>; Fri, 03 Jul 2020 07:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=MODZTho7lM7VCZfH3ZtdvINP1atOX3dIVsfme62NZT4=;
 b=NzoWvtGlURn5vwFsLZreq+dud7/Fjj/MtbU4D2U1xCc3AGl6Z/SyRksi8kdQiotsR/
 YHAAIK3hR94qjJCG++YRmT6pFMrDkeT9Uwj2l7dz9fgFZ5rk4s63Oiot/QsanNEBmviA
 uTnZh1QEdHi2FUWr8E1X0b3O7xUJCG3srfD6nYN7LtVRwlUFcNsMMsUY+5THbh+HHGXL
 ODalsCD2qmZO+q9CUkCyL0OMXGrE++54dFxm4y43gqIs+VFIMrvxyZFanhRO4LGwz1x0
 jy47f4nPBkDVXg6x9sb1fpbYWp6GlY4F1Dtf6Y+b+twG95S8SvveL4XG2XQEEG5zOvg3
 zU+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MODZTho7lM7VCZfH3ZtdvINP1atOX3dIVsfme62NZT4=;
 b=FD36Mac7GrnOoX/tp8WUbGvaJSYSZ2HYeNApj5SR8+/lnraiiL7uGrdhmdKp0TiCMy
 A23YYQoOK09sy8qbVNM8s+pM2YU4num2d9Anj9PNC0Wfv5Vz1qs4dPnk1pLou/SWs3tC
 Pn5SBAlUp4ex/waWBe5Q4GvUeYGgHHhzr2iFrzE6BFEC0m3qgo5eP+Mn51Ix322AO/u3
 Ukf2z3aQU1L3HwiObrZBgMC7ZAgqhR24nWPYLYugaRGnrvaFXEbr3yswQPKI+2TfqKst
 eFKMYB50v49tR99PFa2exFXf8ps20CfX6qdOK2azBxi47qhLBDmK+yRl72s6b1d77ogK
 dzIQ==
X-Gm-Message-State: AOAM5339LdmTWE+wdTv/TpFCyA/5WUPNvLHAMDyEoNNVV/PpJnSej4Pf
 XUzExuPGGl7Nhi2/58tHpLhL4O67Gi5NqDcgIyHxpg==
X-Received: by 2002:aca:1706:: with SMTP id j6mr764434oii.146.1593787276078;
 Fri, 03 Jul 2020 07:41:16 -0700 (PDT)
MIME-Version: 1.0
References: <1593769409-13534-1-git-send-email-guoheyi@linux.alibaba.com>
 <CAFEAcA8RU6fS8PX7LMhn4U33nKoRvcO_mnyBFcmW3iOpA40sCQ@mail.gmail.com>
 <00016872-f1ca-5989-8ad6-28cf05ea0c57@linux.alibaba.com>
In-Reply-To: <00016872-f1ca-5989-8ad6-28cf05ea0c57@linux.alibaba.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Jul 2020 15:41:05 +0100
Message-ID: <CAFEAcA-eyudHSQhEaM-G5hpVOqEG4G_kZpT=vjraciux-7P7Bw@mail.gmail.com>
Subject: Re: [RFC] virt/acpi: set PSCI flag even when psci_conduit is disabled
To: Heyi Guo <guoheyi@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x235.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Andrew Jones <drjones@redhat.com>, yitian.ly@alibaba-inc.com,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fIGK3Y2yqmHy

On Fri, 3 Jul 2020 at 15:36, Heyi Guo <guoheyi@linux.alibaba.com> wrote:
>
>
> =E5=9C=A8 2020/7/3 =E4=B8=8B=E5=8D=886:37, Peter Maydell =E5=86=99=E9=81=
=93:
> > On Fri, 3 Jul 2020 at 10:44, Heyi Guo <guoheyi@linux.alibaba.com> wrote=
:
> >> vms->psci_conduit being disabled only means PSCI is not implemented by
> >> qemu; it doesn't mean PSCI is not supported on this virtual machine.
> >> Actually vms->psci_conduit is set to disabled when vms->secure and
> >> firmware_loaded are both set, which means we will run ARM trusted
> >> firmware, which will definitely provide PSCI.
> >>
> >> The issue can be reproduced when running qemu in TCG mode with secure
> >> enabled, while using ARM trusted firmware + qemu virt UEFI as firmware
> >> binaries, and we can see secondary cores will not be waken up.
> > If you're using a real EL3 guest firmware then it's the job of
> > the guest firmware to provide a DTB to the guest EL2/EL1 that says
> > "and I support PSCI" if it supports PSCI, surely? QEMU can't tell
> > whether the EL3 code does or doesn't do that...
>
> Thanks, Peter. Does that mean the ACPI tables generated in qemu are only
> templates and firmware should update them if necessary?

I don't really know enough about ACPI to say. I hadn't noticed
that this patch only updated the ACPI tables, sorry. Perhaps it
is correct; Andrew will probably know better than me.

thanks
-- PMM
