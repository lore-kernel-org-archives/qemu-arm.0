Received: by 10.223.188.70 with SMTP id a6csp1107275wrh;
        Fri, 1 Sep 2017 07:46:07 -0700 (PDT)
X-Received: by 10.200.51.230 with SMTP id d35mr3339422qtb.44.1504277167116;
        Fri, 01 Sep 2017 07:46:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504277167; cv=none;
        d=google.com; s=arc-20160816;
        b=Z+Vnxas1MmWGzdLVLTMlrqj832A3GuJ8EluGKsmtwqEQDxWTFLcpLOA5rcQ1W7eB4K
         tk1YtkfEQY974adOCj8OA0EVF3sDCEN8wIGoXMjKJa1MwXPkJM15yt71qkleSvNIKC1A
         HsfT+4NASIOARDZueYhwDRhCoX5wX02PwE1tTreHxvLd1f0lFYLzS+7+bKUJuHZMeu1A
         Vm0iCdOPCBo3o4X93V2Oorm4a6s7+OtFUOEbnmminbbYcS2zrxIktkRM3XrjtkEaR4sK
         rNVegVdFGrYwN/cVBzAdH3o9+atJBb//ATAcuG6RE5/iVN37vHSICWgzVQ85sJSy1sad
         JE7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:from:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:subject
         :to:message-id:date:references:in-reply-to:mime-version
         :dkim-signature:arc-authentication-results;
        bh=GjvQQR2ZrVieKpWbJ9PpoJOfRL9NKN9jX2W9Rzx1jVc=;
        b=0pe6C4Kx0j+Tkg5L2SoHCRbhbG/LXB7gYgL1WGX5QV926LuoMjDTK6Er6uXAbZ2XGR
         HG4344GzfCCshhq7JKGK7JAxy2/+rUuLyMsO5+PebdrdBd1hPXK1Qgjb5TNJCd3Fj/OO
         oXSFbKklgKhfd89Nq27bQ0GexKeHRAkhJf+mNzOyoOhKUX+4jbHSfEDXOikfgNy4LKt2
         fLeahBpqD5dNKX1WBrgyx6bw/pi0XyybV1CxlapKdBzbfTzSRS5X4E0Nrr1QewKv9ecg
         O1VO2ME/mZJvyI5mo3pwFf/BPnrvSzrrKa7Dh7wR1Zf2n3l5hj/Q3fSalW7aSv5TOAFB
         6m/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@apm.com header.s=apm header.b=so5GV7DX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f123si7598237qkd.60.2017.09.01.07.46.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Sep 2017 07:46:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@apm.com header.s=apm header.b=so5GV7DX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44315 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dnnCu-0001rz-TZ
	for alex.bennee@linaro.org; Fri, 01 Sep 2017 10:46:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37454)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <fkan@apm.com>) id 1dnnC1-0001Ne-Gd
	for qemu-devel@nongnu.org; Fri, 01 Sep 2017 10:45:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <fkan@apm.com>) id 1dnnBw-00088M-6M
	for qemu-devel@nongnu.org; Fri, 01 Sep 2017 10:45:09 -0400
Received: from mail-wr0-x22d.google.com ([2a00:1450:400c:c0c::22d]:33967)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <fkan@apm.com>) id 1dnnBv-00087E-S0
	for qemu-devel@nongnu.org; Fri, 01 Sep 2017 10:45:04 -0400
Received: by mail-wr0-x22d.google.com with SMTP id z91so1189477wrc.1
	for <qemu-devel@nongnu.org>; Fri, 01 Sep 2017 07:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=apm.com; s=apm;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=pJOq8lzS7XfvOxCcpbKTxz0kMk/dqIzbuEfxnADOIaE=;
	b=so5GV7DXQ9x1pCv7LKTZjj7ELkryPcJhLJrZVCI+PQlPn0+usJo/1+kfn9pgIOxDaR
	rYV3Tg9spTrAYKjWP4mXqi3u8sWxPq0IifwEugw7k99dOxwF00ZGkHXxQlAldzt54s/i
	zijtVxfdj77GVvFZzNk/2icThb9gx8kglg8iY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=pJOq8lzS7XfvOxCcpbKTxz0kMk/dqIzbuEfxnADOIaE=;
	b=Tm/6lEA6GzzDBKZF36gMmRNE78kC+1JfXeW3xaEozSNhIL5aLdLyV4GwaHv+m26emu
	4hVmqjXw2zboSkhtzrAo+KSxCGURwQmBHHUVi3FhHrkcN76lJ5zaGL91AKEY23PCc7rY
	/vpMBqoCdYeLnRGfTc9yXFoXEy6qxbktTjZoTnNKaFCLU0Y6PpCkJbxw5MMv7jySGVoh
	ZVc6+gmsaSttzBb2L3Iw1r1ehvJemGnI1faIygBcYlQRZE0vMHrYQ+P24BCGsweWpxJS
	UrQmY/W6/eZGjDrRojWz97+BUUpD/vfUC5Gois50qLhbYJ0OFwUl+KDhlpdQDnlng75n
	8pcw==
X-Gm-Message-State: AHPjjUhY8gIm848LFZWfQEkAW0HeyMRLDXPKOE6yLcENsBx7QykSt6VD
	ZNIqVTaVseTbnlo6gPjefkvp0ARrKMgE
X-Google-Smtp-Source: ADKCNb6MhoyPDQglIWruiWrkYNsIZLuceOyTLB/MHB1SWMHToXVlYFr4Z0IQpE7MrNYDqRAYDtDsnJMCqev8XB8Xo2M=
X-Received: by 10.223.171.29 with SMTP id q29mr1276285wrc.30.1504277101266;
	Fri, 01 Sep 2017 07:45:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.236.210 with HTTP; Fri, 1 Sep 2017 07:45:00 -0700 (PDT)
Received: by 10.28.236.210 with HTTP; Fri, 1 Sep 2017 07:45:00 -0700 (PDT)
In-Reply-To: <1499634139-20399-1-git-send-email-eric.auger@redhat.com>
References: <1499634139-20399-1-git-send-email-eric.auger@redhat.com>
Date: Fri, 1 Sep 2017 07:45:00 -0700
Message-ID: <CAL85gmARf+Mz5-PFHvPXV290umodKD8_6yFABSxc+ghm2iCsGQ@mail.gmail.com>
To: Auger Eric <eric.auger@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22d
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] [PATCH RESEND v3 0/3] Generic PCIe host bridge
 INTx determination for INTx routing
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
From: Feng Kan via Qemu-devel <qemu-devel@nongnu.org>
Reply-To: Feng Kan <fkan@apm.com>
Cc: wei@redhat.com, peter.maydell@linaro.org, drjones@redhat.com, agraf@suse.de,
	qemu-devel@nongnu.org, Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm@nongnu.org, eric.auger.pro@gmail.com,
	christoffer.dall@linaro.org, pranavkumar@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hldCxIj9lLBr

On Jul 9, 2017 2:04 PM, "Eric Auger" <eric.auger@redhat.com> wrote:

This series implements INTx to gsi routing for ARM VIRT/Gpex. This is
a respin of [1] which was lost in limbo.

ARM virt uses GPEX PCIe bridge. This latter does not implement INTx
to GSI routing. PCIe/INTx assignment works but the consequence is
irqfd is not used along with INTx interrupts and VFIO INTx handlers
are executed on userspace leading to an important performance degradation.

This issue is witnessed by the following messages;

qemu-system-aarch64: -device vfio-pci,host=0006:90:00.0: PCI: Bug -
unimplemented PCI INTx routing (gpex-pcihost)
qemu-system-aarch64: PCI: Bug - unimplemented PCI INTx routing
(gpex-pcihost)
qemu-system-aarch64: PCI: Bug - unimplemented PCI INTx routing
(gpex-pcihost)

So with this series, irqfd is set up for PCIe/INTx passthrough and we get
the optimal performance. Also we get rid of the above messages.

This series can be found at:
https://github.com/eauger/qemu/tree/v2.9-gpex-intx-v3

References:
[1] Generic PCIe host bridge INTx determination for INTx routing
   https://lists.gnu.org/archive/html/qemu-devel/2015-09/msg04975.html


Pranavkumar Sawargaonkar (3):
  hw/pci-host/gpex: Set INTx index/gsi mapping
  hw/arm/virt: Set INTx/gsi mapping
  hw/pci-host/gpex: Implement PCI INTx routing

 hw/arm/virt.c              |  4 ++++
 hw/pci-host/gpex.c         | 22 ++++++++++++++++++++++
 include/hw/pci-host/gpex.h |  3 +++
 3 files changed, 29 insertions(+)

--
2.5.5

Tested-by: Feng Kan <fkan@apm.com>

Works for APM XGene systems.
Thanks!
