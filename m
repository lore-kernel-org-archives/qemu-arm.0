Received: by 2002:a17:906:1c87:0:0:0:0 with SMTP id g7csp3389003ejh;
        Wed, 7 Sep 2022 00:11:11 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6xj7u2TuCetbHpC3PVIYTu16BHh8Lg8nVgwS3lwg+FuIIdYtJ9JHn7iQFb5H2AO08rhQNY
X-Received: by 2002:ae9:e30f:0:b0:6bb:868:c7d8 with SMTP id v15-20020ae9e30f000000b006bb0868c7d8mr1718591qkf.25.1662534670928;
        Wed, 07 Sep 2022 00:11:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1662534670; cv=none;
        d=google.com; s=arc-20160816;
        b=YQN4yvfSD4wV4iAflEmIevCOmk8pIMkfe3QZO4ZrD3TngrPAmWfIG3Dffu513EVuwa
         2yFJABkK984+484y59Rv/N7hoRBu6nWRr90/LAv4veQwcnkbFmFvvkDK/XaGRH9eDBnP
         1BK8i+7+Sx7xtXBTrNfeKynCSRJ4mUYZ0cBFR6nDD6xlnUBauHx6FL49G4q8ZNkC37Zi
         6URwQ9tphhGPHE2Pup18+NnLV2r+fWOXSVA6xbkra/RnA6yfsx1VuA3sWEJZenKesK5d
         nL/N4+gA2583ydeuNipAe3urDxYviTncZlXPK5WLyZFmL7ts5WRLKplP05Wu0jPurlGg
         gDyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=ye84sSO4TJJGNbJlw+HOZp0V+DuC21ZtM5EaaO1Apb0=;
        b=Yjri0OaGCIWsq/wrNliT3SSdTLbpQarYV/pHEdNS8kl+RfX9JbkdOPDcnXyk7Z0QOx
         XoNugTZhralHg6oWI9sm9VTy6MCXuM9W7P9vTEkz/CrAKPyS1cL5vVGPG9kOITrch27R
         NdlsbMcvRbPMxiHf4BL2oMFE9mbY0+W5crfbEplJg9YEzodB3ZQKmR6JsHXGajtyLGju
         em+0nWd4iRZplAyxFurn7CRfhS8pQ6kZG825Dyw4C/jfJvOQFwuouen3wqxBX8NBP6oW
         OLoF3S2stOgrVIbTh2U9TONBbSVYgvLWYxioPOFzSuucTrL87cTnhtPgk/T1bjQWoZPO
         c1Cw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cm3Q0sL+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l3-20020ae9f003000000b006bc65379d9fsi7363156qkg.144.2022.09.07.00.11.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Sep 2022 00:11:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cm3Q0sL+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oVpDK-0002vk-FZ
	for alex.bennee@linaro.org; Wed, 07 Sep 2022 03:11:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oVpCx-0002tB-Vb
 for qemu-arm@nongnu.org; Wed, 07 Sep 2022 03:10:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oVpCw-00050f-AX
 for qemu-arm@nongnu.org; Wed, 07 Sep 2022 03:10:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662534645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ye84sSO4TJJGNbJlw+HOZp0V+DuC21ZtM5EaaO1Apb0=;
 b=cm3Q0sL+N3FZUkVYrO0kI8qmrj05ihTv5oolV2qcwQk8C6GSALSUIdfzuiC/8YsPpGXLI7
 ZuXmQz+Ka7sXJLRoimEwr+TIqOQbfIsMAMC/KPXMnYTZBkuZddP3NsIbocMQZedyuFeKDR
 X8eCvpOLRX0HDomndva8jkL5OEKFAjA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-554-x_8PSx0POoqBkZY72XfdGA-1; Wed, 07 Sep 2022 03:10:40 -0400
X-MC-Unique: x_8PSx0POoqBkZY72XfdGA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6EC202999B4E;
 Wed,  7 Sep 2022 07:10:39 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.195.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9DA7F1121314;
 Wed,  7 Sep 2022 07:10:38 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2FA23180039B; Wed,  7 Sep 2022 09:10:37 +0200 (CEST)
Date: Wed, 7 Sep 2022 09:10:37 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Song Gao <gaosong@loongson.cn>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Pawel Polawski <ppolawsk@redhat.com>
Subject: Re: [PATCH V4 0/3] hw/riscv: virt: Enable booting S-mode firmware
 from pflash
Message-ID: <20220907071037.tnnewqhi5v2xmiln@sirius.home.kraxel.org>
References: <20220906090219.412517-1-sunilvl@ventanamicro.com>
 <20220906104128.zlwzvbbswlzyplkc@sirius.home.kraxel.org>
 <20220906123200.GA237800@sunil-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220906123200.GA237800@sunil-laptop>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PWtmnwcyzd46

On Tue, Sep 06, 2022 at 06:02:00PM +0530, Sunil V L wrote:
> Hi Gerd,
> 
> On Tue, Sep 06, 2022 at 12:41:28PM +0200, Gerd Hoffmann wrote:
> >   Hi,
> > 
> > > 3)Make the EDK2 image size to match with what qemu flash expects
> > > truncate -s 32M Build/RiscVVirt/DEBUG_GCC5/FV/RISCV_VIRT.fd
> > 
> > Hmm, we have that kind of padding on arm too (64M for code and 64M for
> > vars) and only a fraction of the space is actually used, which isn't
> > exactly ideal.  So not sure it is a good plan to repeat that on riscv.
> 
> Yeah.. but it looks like limitation from qemu flash emulation. Do you mean
> this limitation exists for arm in general on real flash also?

Well, at least on x86 flash devices can have odd sizes.  I don't think
the qemu pflash emulation dictates anything here.

I think the underlying problem we actually have in qemu is that the
flash size indirectly dictates the memory layout.  We pack the flash
devices next to each other, on x86 downwards from 4G, on arm upwards
from zero, not sure what risc-v is dong here.

edk2 arm code expects the variable store being mapped at 64m.  So
QEMU_EFI.fd (which is actually 2M in size) gets padded to 64m, which
has the desired effect that the next flash device (the varstore) is
mapped at 64m.  But also has the side effect that we map 62m of zeros
into the guest address space ...

The vars file is padded to 64m for consistency with the code.  Not
padding the vars file should have no bad side effects I think, except
for live migration where the flash size change might cause
compatibility problems.

Not padding the code file needs some alternative way to specify the
memory layout, to make sure the vars flash continues to be mapped at
64m even when the code flash is smaller.  Cc'ed Pawel who investigates
that right now.

One possible option is to just hard-code the flash memory layout per
machine type or per architecture.  Another option would be to add
some way to configure that on the command line.

take care,
  Gerd

