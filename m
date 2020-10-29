Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp438757lfa;
        Thu, 29 Oct 2020 04:20:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyxdVDs+eAatHRVucn3a54KZedGelu3FcjRgQ3Pg5tyZ3c41gNKOHXB6WdnG0RdqUa7Nq5R
X-Received: by 2002:a25:7e42:: with SMTP id z63mr5612745ybc.63.1603970427851;
        Thu, 29 Oct 2020 04:20:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603970427; cv=none;
        d=google.com; s=arc-20160816;
        b=kBGGdYc9jlfPfpOM1OARqYD5lDaMZ6PbRq3MFAWNKmkAqtQufipxcd0IHZ7mCxfTU1
         hVDgB5WD2Tt0KfODJquOqVurZTiIy2hXutLz9oNoj76l61lMqCoUFXifArpn/n8WfVOW
         3n0V9qZ51WIuzyDBHpGbBLH1VnSHB7xC0Dp+4Jzrf6HyN+BOmm5Wpn+jjhrXDrlYC3Su
         K8ayxj14F04e6tEBuHNjXRLKCJpsBpifcO0abzQ1XW52Rgqo6JvPIVIcgYGSps4rLu7V
         fXdySrAxb3ct4BQIogLJC6+2+jcGfQnRejZ+bTu8lrn+EkM0sOAOf5M2LEBPapc8CyNe
         MZaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:to
         :from:date:dkim-signature;
        bh=c24jJwlsSK4vKPNtuAEW1ol9EUy1Gb3qW4lu7PIi+yI=;
        b=eSo1wq0Hb+oCui6IrruF5vPaoeTRs2joSQkEKJJMrH2ywrrrZqTJuRapZQEu/+xsOW
         JWStr4xAGE5Dc5QdTtSkInQ9OZAAJf4ENqffmEQj3tKSzgvKa4ZCiSxX4fnX62IcBxBH
         TjHl274A2LzFvIYe7a1e/ROI1Rqc5Lyo2fCGeb23BlV8G9CdjFrLtNsB2rop2Py3iqa3
         Ob5g+m68u0yDMXFem7t4a67n9/+XcSRvw0sjQrurp8uKgjLKUgrK2ACyN0JFBpacjJH+
         n9z8jjM53zzF/ix3lkvLSzDdXrjQRvmcJ+WG0YNpwdvBsc3F4UuS4dwq8yN5u+O7atO8
         IgtA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=XgNRv2a7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h5si2980562ybo.92.2020.10.29.04.20.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Oct 2020 04:20:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=XgNRv2a7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kY5yl-0003mT-67
	for alex.bennee@linaro.org; Thu, 29 Oct 2020 07:20:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kY5y9-0003km-DS
 for qemu-arm@nongnu.org; Thu, 29 Oct 2020 07:19:49 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:32881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kY5y3-0002tU-HV
 for qemu-arm@nongnu.org; Thu, 29 Oct 2020 07:19:49 -0400
Received: by mail-wr1-x442.google.com with SMTP id b8so2357520wrn.0
 for <qemu-arm@nongnu.org>; Thu, 29 Oct 2020 04:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=c24jJwlsSK4vKPNtuAEW1ol9EUy1Gb3qW4lu7PIi+yI=;
 b=XgNRv2a7FjAENjp5UjR1LHb027MBj1nn28QFxwBb6V7Duvt38QQzTj4UYV5jkKHHvt
 Wf9BhzZVb7Pn6CCP+OFsJDSGOlUqZBtismCMijtnNxQXwrHxevkNWPcm9GwDp7ItFfJj
 fQaHwKRGAAuWD7DSFsEMHPIxRru46wnpqzP6TX1WtOTIbRJRPgiQt/i9YfUtGDK3Ti4F
 WA2M67gIylef2nFkCaxVFyp0JmzReTPtlO7ShevGOvcNfAJjI8pbpFaRxtvPcFx1/bfF
 faOGOAhg7YXiSOTRNdQ1JgFj7XislWRhrvdjoInVDN8+T4WYfTetlIyOxZa6M+YZGVX6
 GAJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=c24jJwlsSK4vKPNtuAEW1ol9EUy1Gb3qW4lu7PIi+yI=;
 b=toCsBJg53pD8teemx41RDK8vHt4H9daR623slpVsGUEnVUz3YVH/9Nlu22RbK8q1+E
 hGRxU9fdMD/QLW+cZHMVe1rcTTfRJlfk3lW0CF7Ui15Si4aNc76Su2ei/T/NIuYsanmT
 Xn6L9IxIh106Yiuy6P5i6kp3fOHYuQK2BxRiYoPahyMOhdj6vMmB05nRS7Za/7n7UEsX
 A1Nvg8SLsNiSRIsicFoPuddiUWmYdo+EcI0HCOUWIG0GOknKOTKAo5u/z5eWS4dEaOu2
 zfQReBhH7qBWqNy1c2WqLPYmyyBRXXCKrShs3gNdPhu4dwFNHUvdtVYq8XBZ5mZj9qgK
 M6kA==
X-Gm-Message-State: AOAM530f9SKQ4uZbigJQJcmXZ9CZhcIIpaaRS3ZAmzMjxUWNPh7Rt/av
 WUfFehXxSeR/CFzt38kzwS6dXw==
X-Received: by 2002:a5d:60c4:: with SMTP id x4mr5197288wrt.175.1603970381598; 
 Thu, 29 Oct 2020 04:19:41 -0700 (PDT)
Received: from vanye (cpc92880-cmbg19-2-0-cust79.5-4.cable.virginm.net.
 [82.27.104.80])
 by smtp.gmail.com with ESMTPSA id z6sm3670708wmi.1.2020.10.29.04.19.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2020 04:19:41 -0700 (PDT)
Date: Thu, 29 Oct 2020 11:19:39 +0000
From: Leif Lindholm <leif@nuviainc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [RFC PATCH] hw/arm/virt: use sbsa-ec for reboot and poweroff in
 secure mode
Message-ID: <20201029111939.GI1664@vanye>
References: <20201028085918.14580-1-maxim.uvarov@linaro.org>
 <CAFEAcA8_1w=4qdE_AJxUP-uPoFL=Fsg9hy62Lw7bLDjKzL9Vvg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8_1w=4qdE_AJxUP-uPoFL=Fsg9hy62Lw7bLDjKzL9Vvg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=leif@nuviainc.com; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Graeme Gregory <graeme@nuviainc.com>,
 =?iso-8859-1?Q?Fran=E7ois?= Ozog <francois.ozog@linaro.org>,
 Maxim Uvarov <maxim.uvarov@linaro.org>, Radoslaw Biernacki <rad@semihalf.com>,
 QEMU Developers <qemu-devel@nongnu.org>, tf-a@lists.trustedfirmware.org,
 qemu-arm <qemu-arm@nongnu.org>, ard.biesheuvel@arm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 09oVSt77a+p0

Hi Peter, (+Ard)

Graeme is on holiday this week, and I would like his input.

On Wed, Oct 28, 2020 at 20:31:41 +0000, Peter Maydell wrote:
> On Wed, 28 Oct 2020 at 08:59, Maxim Uvarov <maxim.uvarov@linaro.org> wrote:
> >
> > If we're emulating EL3 then the EL3 guest firmware is responsible for
> > providing the PSCI ABI, including reboot, core power down, etc.
> > sbsa-ref machine has an embedded controller to do reboot, poweroff. Machine
> > virt,secure=on can reuse this code to do reboot inside ATF.
> >
> > Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
> 
> (I've cc'd the sbsa-ref machine maintainers.)
> 
> > ---
> >  Hello,
> >
> >  This patch implements reboot for the secure machine inside ATF firmware. I.e. current qemu
> >  patch should be used with [1] ATF patch. It looks like that Embedded Controller qemu
> >  driver (sbsa-ec) can be common and widely used for other emulated machines. While if
> >  there are plans to extend sbsa-ec then we might find some other solution.
> >
> >  So for the long term it looks like machine virt was used as an initial playground for secure
> >  firmware.  While the original intent was a runner for kvm guests. Relation between kvm guest
> >  and firmware  is not very clear now. If everyone agree it might be good solution to move secure
> >  firmware things from virt machine to bsa-ref and make this machine reference for secure boot,
> >  firmware updates  etc.
> >
> >  [1] https://github.com/muvarov/arm-trusted-firmware/commit/6d3339a0081f6f2b45d99bd7e1b67bcbce8f4e0e
> 
> 
> Thanks for this patch. It is definitely a missing
> bit of functionality that we intend to allow virt to run
> EL3 guest code but don't provide a trigger-shutdown/reboot
> device that works in that setup.
> 
> I think the key question here is whether we want to implement
> this by:
> (1) providing the sbsa-ec device in the virt board
> (2) some other mechanism, eg a secure-only pl061 GPIO
> some of whose output pins can trigger shutdown or reboot
> 
> The sbsa-ec device has the advantage of doing the
> shutdown/reboot functionality at the moment. The question
> I have for the sbsa-ref board folks is: what are your future
> plans for that device? If the idea is that it's going to end
> up stuffed full of sbsa-ref specific functionality that we
> wouldn't want to try to expose in the virt board, then we
> should probably go with the pl061 approach instead. But if
> it's not likely to grow new functionality then it might be
> simpler...
> 
> A couple of notes on this patch if we do go down that route:
>  * we would need to arrange to only add the new device for
>    new versions of the virt board (that is, the "virt-5.0"
>    machine must not have this device because it must look
>    like the version of "virt" that shipped with QEMU 5.0)
>  * the device needs to be mapped into the Secure address
>    space only, because Secure firmware wants control over
>    it and doesn't want to allow NS code to reboot the system
>    without asking the firmware
>  * it would need to be described in the DTB (and maybe also
>    ACPI tables? I forget whether we need to describe Secure-only
>   devices there)

Would it? Could it be something that goes into the virt spec?
We don't consume ACPI in firmware (but TF-A will of course have access
to the DT regardless).

For sbsa-ref, I would ideally like to move to emulating communicating
with an SCP over time, as opposed to TF-A directly controlling the EC.
I am unsure if that leaves much opportunity for code sharing with
virt.

Ard: is this a config supported/able by ArmVirtPkg?

Best Regards,

Leif

> But let's find out if that's the route we want to take first.
> 
> thanks
> -- PMM
