Received: by 2002:a0c:90cc:0:0:0:0:0 with SMTP id p70csp1799224qvp;
        Fri, 8 Oct 2021 08:21:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxPfUmWzT+sGIzQ2x3g5tymm2CaG+ii/h5ZulfUmyUErN2zjgIW3jBxQF7P1DlkDfw/U8Iu
X-Received: by 2002:ac8:74d7:: with SMTP id j23mr10732082qtr.5.1633706492451;
        Fri, 08 Oct 2021 08:21:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633706492; cv=none;
        d=google.com; s=arc-20160816;
        b=AhoF9kW7EKtLoF2wwC/NfW0Dy8erWhJP2vBk6MLClgWC6vI+//a9D8wkvW47nzK7Et
         cHKlp1CiXdXc0Tgyva/HAH0OR/CJLeqP5CT4E3u3I25xWpUCwkmGZA2NSu5V0Ge/VcE5
         HNpoJgUcxL9/dg43EJuvN1ptGrmmGPWcnoezPg//w+a5ohumxYNrTbhow3pooA975ioP
         n+RL0CTNx8541+IcZ4ullEz/yqGDVivqwxe+k8txbG49IkfR2JO966aY//+I6p6KoZa5
         Ky/IVsI+lGM7n2Mj1UbfVOrOPmpUY4P1c/xE9c3c3jsvrKXWfYi3pzQA42tPAWWoKie0
         9xbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=1x64kse4Zr0c//FOG48TBDK9XBZTgCF9BcgvQ0vjh2o=;
        b=sBhO5J6iRIe6uAGWpT9h/knMaQSpVPYzGa4lnITnXrRgaaPkT/QbQsyPw0wuN7lo4S
         HxyQcIOsga5DsLfwzX/sVtYICY7B3XppstBIir/n2WYEtst+MT1dkJVcgKf4+A1yMxWW
         hPbzHlAXF2rKsCEr7HYKkNo0GPbbcab3v22n6Nk9p3RHKYup3Hcc7g6Uz7V6IYWZjgux
         w1ocMp2J80/gFxD0UrtNxBPvMQGp4qAhlq3DrBQh2NDCjUHHDKa6R4GSlrhQggODHjJ1
         pI9tatYC3uxANfayY06CwzgCVz0tq/MJhill7G3jXmc4puDwA7K0omjV2Ud1C+H8jf0/
         rUiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="HMv2Wf/C";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i1si2896728qvh.212.2021.10.08.08.21.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Oct 2021 08:21:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="HMv2Wf/C";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mYrgi-0003jh-1H
	for alex.bennee@linaro.org; Fri, 08 Oct 2021 11:21:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mYrgT-0003hX-OB
 for qemu-arm@nongnu.org; Fri, 08 Oct 2021 11:21:17 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:45675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mYrgR-00025g-AL
 for qemu-arm@nongnu.org; Fri, 08 Oct 2021 11:21:17 -0400
Received: by mail-wr1-x436.google.com with SMTP id r10so30930106wra.12
 for <qemu-arm@nongnu.org>; Fri, 08 Oct 2021 08:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=1x64kse4Zr0c//FOG48TBDK9XBZTgCF9BcgvQ0vjh2o=;
 b=HMv2Wf/CfsDaH7icTHBNG8eEyNvsU9WfasCDlntzy3+B4aMzdKR4xjsZEU4HvTYT6s
 qtOy085OHxxkWjXMwUSYs9NYg++TRTzhjB5wJFvTAyHWvbkF4DpsAg7gZ18+m4dIP9It
 /IMjt9ccgMDrM6vq7hMrv5oMD07qMch79X8+wlKOIawbMNzFPFXNlOAvH0IYGCX54Txn
 o0DTUhKHFSCx7oBOky9S/XddGacH/FV6cbQQ6Zb/H8474inojbkqT3ZyhAGxf2FbafUh
 VVg3e5Zr0pteOP1QoyqV4hxD06EXalsxos9CAJszYdNZOywUuzBrlCPUx0J5hK8bdMZO
 jtnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1x64kse4Zr0c//FOG48TBDK9XBZTgCF9BcgvQ0vjh2o=;
 b=3PY9eICzb5/aqxeXwn7pDr9cC0j7kKe22SdPKHt8uo7r7sLo3UmjGP6JZztf0Z3lZ2
 Tb66gbb8c+0IGbpqWlLgT2OsuUROeAqkkDIkUNFB2TArLtcyGKnp4dBoSf7fQNro+W/a
 bEvkoUx7vhpgxzyC1c80E1Bd+hERW3ZTphGdsf2wBMLzllJM+u8I43KHWhlkt8RHXUNO
 ffZdCBkQxgeOu7qYMoKdRlh+9YX4NqhT06mpP37wF8CX8bXeL7IF9xsgZfx2YWF9+sRV
 NyGTkDUDzBDhnp0UUFicbDnSFqKqyEsJT+FEdInEkmjF4C4S7I1Fx1mGS4QP4KOs2S0R
 KsLw==
X-Gm-Message-State: AOAM533L94aaBHebI37fkRSH+10+9OhRnITHwzjWa7zGBc810FKsTxGZ
 FCSGKc0zQB0Vg3jRZOC9Wa6Rag==
X-Received: by 2002:a1c:3b06:: with SMTP id i6mr4137708wma.172.1633706473977; 
 Fri, 08 Oct 2021 08:21:13 -0700 (PDT)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id h17sm2864488wrx.55.2021.10.08.08.21.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 08:21:13 -0700 (PDT)
Date: Fri, 8 Oct 2021 16:20:51 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v4 03/11] hw/arm/virt: Remove device tree restriction for
 virtio-iommu
Message-ID: <YWBh02zKwxJ9IGU1@myrica>
References: <20211001173358.863017-1-jean-philippe@linaro.org>
 <20211001173358.863017-4-jean-philippe@linaro.org>
 <e4732c80-d813-d16b-c91b-1884b33accb8@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e4732c80-d813-d16b-c91b-1884b33accb8@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, marcel.apfelbaum@gmail.com, pbonzini@redhat.com,
 ani@anisinha.ca, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Z4DTIkhc5iaC

On Tue, Oct 05, 2021 at 01:57:35PM +0200, Eric Auger wrote:
> > diff --git a/hw/virtio/virtio-iommu-pci.c b/hw/virtio/virtio-iommu-pci.c
> > index 770c286be7..f30eb16cbf 100644
> > --- a/hw/virtio/virtio-iommu-pci.c
> > +++ b/hw/virtio/virtio-iommu-pci.c
> > @@ -48,16 +48,9 @@ static void virtio_iommu_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
> >      VirtIOIOMMU *s = VIRTIO_IOMMU(vdev);
> >  
> >      if (!qdev_get_machine_hotplug_handler(DEVICE(vpci_dev))) {
> > -        MachineClass *mc = MACHINE_GET_CLASS(qdev_get_machine());
> > -
> > -        error_setg(errp,
> > -                   "%s machine fails to create iommu-map device tree bindings",
> > -                   mc->name);
> actually this does not work. To add a hint you need the *errp to be set.
> Otherwise when running through this path you will get
> 
> emu-system-x86_64: ../util/error.c:158: error_append_hint: Assertion
> `err && errp != &error_abort && errp != &error_fatal' failed.
> 
> replace the error_append_hint with an error_setg (without the \n)

Woops sorry, will fix

Thanks,
Jean

