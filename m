Received: by 2002:ac2:4942:0:0:0:0:0 with SMTP id o2csp2581828lfi;
        Wed, 4 Mar 2020 23:34:42 -0800 (PST)
X-Google-Smtp-Source: ADFU+vtMvg9VB74efwYVeDvG25Ro6a2nV/SH88IvkxoF+MIdauMSHCw/vhiTyywYAJ851NGmAFXi
X-Received: by 2002:aed:2ee5:: with SMTP id k92mr5928624qtd.373.1583393682528;
        Wed, 04 Mar 2020 23:34:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583393682; cv=none;
        d=google.com; s=arc-20160816;
        b=bdmwOdMhTpVim/7Al+3SiugY/sizKsjiW1vMLCgjUs4DWSiqiidm/8GYvbb+MlpXYS
         M2foNJN6Co3CYBZEWpFuARIiV8ZaBTHqSo9Jp3KonB9pejGwHVq8mbq2anCoH+vpWCQB
         53kNS6uT96oLdm535IKMlhmX3VOipJVK7H00DGyigDbAwaRnOUrFKO/jEVMzsRd8W8HQ
         VoHgQs2sF1ojvPiolOIoArm1RyuaIkmQoCLVKhknsExcHUMvzv/pmCbeC67+xzqXyxw8
         c3eeV8UdF2izgaj7roXnwOmQwbkMjVZUwWl3Zno/p4f3XNAcy6+C5cWh40altRHuUCVn
         W8Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=+pDy9FnIci/486fRFg3zNv+7rl2N5+6KSvJjal3zpd0=;
        b=GIjPs+wLmWQgUS7TVHVDtFFNyEPskDHN+rbh1KrMe67MV3/fQlsrM1xovXaVFl7Hwv
         gLHobxUjqkQdIa0s28QTu4eZ4mZH+5m5KDHMdXKwRUdKqZxyxKyn9E9VlI5WpSpdnHZM
         gammWeZvPT/g8Pg7PL7MkFIaL4Nif8n4XnQEnFQNJ3D3LMgIhuzJj8cWlk62KOAn7MT8
         ziCmRu7H3NqW6uXKXaT7E0Ogosdsi78td9DBHZmYXF7Ht/Hx17SrSM+yWFdSfd1j6sIo
         Z0wdm04k+1eq0lbHM9laVcivUb9MfnOPMJ8sW9rHMbq6T6hhA+pqBMfj/C1BNO4EDbED
         WOdg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LF33uuEc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w13si2581146qtt.376.2020.03.04.23.34.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Mar 2020 23:34:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LF33uuEc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j9l1k-0000vM-W9
	for alex.bennee@linaro.org; Thu, 05 Mar 2020 02:34:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39389)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jean-philippe@linaro.org>) id 1j9l1Z-0000u8-2F
 for qemu-arm@nongnu.org; Thu, 05 Mar 2020 02:34:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jean-philippe@linaro.org>) id 1j9l1Y-0000Uz-2v
 for qemu-arm@nongnu.org; Thu, 05 Mar 2020 02:34:29 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:39698)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jean-philippe@linaro.org>)
 id 1j9l1X-0000Su-TS
 for qemu-arm@nongnu.org; Thu, 05 Mar 2020 02:34:28 -0500
Received: by mail-wm1-x341.google.com with SMTP id j1so4527592wmi.4
 for <qemu-arm@nongnu.org>; Wed, 04 Mar 2020 23:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=+pDy9FnIci/486fRFg3zNv+7rl2N5+6KSvJjal3zpd0=;
 b=LF33uuEcHbXStInwCscULzeg/nQ8rvs8HWq6u4U7eNxy27xg/qXa5NNUiVNATRypW0
 TScVGqIUzghxr8unsZuhhmk+5+ErBmEJus362zVc04HKvSSHYoKTvyV3G03sV5R3Ajhf
 QcD8u9L8WYsIbrqFTkBTkxF4xAHafVXpWjqAtuZO6XB4WDkLRNnIMkR0L60sCbuC9JTs
 haMoGdUJ4dlpoC/L9n5442HCix0y4MLGncD5MkR4AqvVXOoIL7fJEjm7QCDRzX6MRBPK
 598NZFtjNz8drgSV8INTQ284tgatEWfeaz9uQP0Qg+jkxgrYr80EE1EbDouxfr3J8qlK
 KFTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+pDy9FnIci/486fRFg3zNv+7rl2N5+6KSvJjal3zpd0=;
 b=uAujzyzvSmQqdjhStQy8LLFUS5E5G/pUPrfau8gCidkh+06R8eDi9WlrzyOqL6nlLz
 Qgbdlq9b446QKm/0L6GNlQFlPrr3HiaOn2GqMAu05vjyH9zJO5A09XjYPzOR0uzTogAK
 oRoKunmqhxD1DxHOP+LcR8vRz+1TnN9twCER5WwAg6/+f088u4jZV7aRvD2+wK6waQLS
 uK2L/Jz/3DcYbR8s2vhcHFuGHN7TkIhyYRlapwGAOXZb0yLeedMaJ+zg3NQ7pJ+KvpfL
 eVyEYanV1YB4MP+M+xLUf8d3aBYCKXVRfNNZNYiZU8LTBZNZ4h4utIsSdSvqfHxqdZVR
 6rXA==
X-Gm-Message-State: ANhLgQ2Qg4DcDwaatVU7+Ur9fOZVrxV0lY9+l6lJyexiXzdDBGgH6AdB
 VpxkJFajt7xkExj0lbRN4+ktww==
X-Received: by 2002:a05:600c:217:: with SMTP id
 23mr8161293wmi.32.1583393665441; 
 Wed, 04 Mar 2020 23:34:25 -0800 (PST)
Received: from myrica ([2001:171b:c9a8:fbc0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id c9sm9720274wmc.3.2020.03.04.23.34.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2020 23:34:24 -0800 (PST)
Date: Thu, 5 Mar 2020 08:34:17 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH v16 00/10] VIRTIO-IOMMU device
Message-ID: <20200305073417.GA717767@myrica>
References: <20200214132745.23392-1-eric.auger@redhat.com>
 <20200227111717.GG1645630@redhat.com>
 <431cb39d-833c-6d02-d7b3-02b3e90446e2@redhat.com>
 <CAMj5Bkib3CTzCB02ScueFR84r28LGowF7uxYO8Ygmnj9X7oNOg@mail.gmail.com>
 <fea625f1-b58e-6da6-8e2a-f32fc9391fc8@redhat.com>
 <CAMj5Bkgm1LKbN3E2qTTxmrGhpmdL9NWarSfX-mYCWF0yt5E9eg@mail.gmail.com>
 <88e3b669-2998-41c0-83f7-de42a72a73e7@redhat.com>
 <20200304164717.GF646000@myrica>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D7BDFBB@SHSMSX104.ccr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D19D7BDFBB@SHSMSX104.ccr.corp.intel.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 "kenneth-lee-2012@foxmail.com" <kenneth-lee-2012@foxmail.com>,
 "tnowicki@marvell.com" <tnowicki@marvell.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 "zhangfei.gao@foxmail.com" <zhangfei.gao@foxmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "peterx@redhat.com" <peterx@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 Auger Eric <eric.auger@redhat.com>,
 "bharatb.linux@gmail.com" <bharatb.linux@gmail.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "Wangzhou \(B\)" <wangzhou1@hisilicon.com>,
 Zhangfei Gao <zhangfei.gao@gmail.com>,
 "eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SWeLY1ILnEp+

On Thu, Mar 05, 2020 at 02:56:20AM +0000, Tian, Kevin wrote:
> > From: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > Sent: Thursday, March 5, 2020 12:47 AM
> >
> [...]
> > > >
> > > > * We can't use DVM in nested mode unless the VMID is shared with the
> > > > CPU. For that we'll need the host SMMU driver to hook into the KVM
> > VMID
> > > > allocator, just like we do for the ASID allocator. I haven't yet
> > > > investigated how to do that. It's possible to do vSVA without DVM
> > > > though, by sending all TLB invalidations through the SMMU command
> > queue.
> > > > "
> > 
> > Hm we're already mandating DVM for host SVA, so I'd say mandate it for
> > vSVA as well. We'd avoid a ton of context switches, especially for the zip
> > accelerator which doesn't require ATC invalidations. The host needs to pin
> > the VMID allocated by KVM and write it in the endpoint's STE.
> > 
> 
> Curious... what is DVM and how is it related to SVA? Is it SMMU specific?

Yes it stands for "Distributed Virtual Memory", an Arm interconnect
protocol. When sharing a process address space, TLB invalidations from the
CPU are broadcasted to the SMMU, so we don't have to send commands through
the SMMU queue to invalidate IOTLBs. However ATCs from PCIe endpoints do
not participate in DVM and still have to be invalidated by hand.

Thanks,
Jean
