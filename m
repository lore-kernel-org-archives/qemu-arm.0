Received: by 10.28.173.206 with SMTP id w197csp3160243wme;
        Mon, 8 Jan 2018 18:03:47 -0800 (PST)
X-Google-Smtp-Source: ACJfBouypGeiJfov68yhuluSLbnQhBPW+0Hmt+UL4qjYumDx0VjlArX0UggbnCnzTFZ0C5bfz+iW
X-Received: by 10.37.164.137 with SMTP id g9mr1983423ybi.401.1515463427787;
        Mon, 08 Jan 2018 18:03:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515463427; cv=none;
        d=google.com; s=arc-20160816;
        b=OP+nw3knSHzqLZaUWfjajL19TdBNgge8EGFtjuAfZpRm4tazyL41OuqhtPwmR9rD2w
         SR+wH0dls/3ffO82uZG3cxFQ+LoBDnmEChN1/wqPauLCE+7sPKPImGedXcigkMT6dgTt
         6NmAbDMTO3JprryiaYxZZ/vt5BB1oUJRaISFn+EjpBveLM9KAhzBYlmO/6XoS1jNvAZZ
         8JVUISyKKQFW4KKOMhoXfpweBcd1BlDCuWX+pel91SbCjqEQ6yEkFVjhK7KlOC39Sfs4
         Klfff+Apd+9BTD9ybX2RwHOdMUexNunA4CU6LzDXjik0F0pxHxGlyNA0TjnbdPU/8is8
         JX+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=t6ruiIsuZsASYC5isOLE/fGowGmIRviFRdZn64K7Xpk=;
        b=K8b915OmcNq6eLk7V8nsI1ZVryTRV9WK8MSzoSdSkQ9Fis/+T86rIBLIlkSOkdcvkb
         epf9QPSh/H4s20goRPlAnl04qbgbveMlzzsh3ZiEMONqO7IfB27HUDn5ZUCQCZOzaJN9
         HgxnarWvowMUgLV8Y8+u8sp1dYsLHoJCffk+FRyXalhWeToG3SFpnekNMc/510yW13HR
         iCM3AXStXOaNdkNeKf5gyT8ittTtIGnqqVFKFtbXeN3GBPACR+47vJhcwUbQYmbYm0P+
         KY0J2/PfHALymzfkFrAudEnDFLkTma6SDwV7B+f6ra3GZA7tsHa/cV9mH3HhNN0x/DvT
         mYeA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UZAIwhtQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u17si344946ybm.365.2018.01.08.18.03.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Jan 2018 18:03:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UZAIwhtQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45769 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYjGV-00030Y-63
	for alex.bennee@linaro.org; Mon, 08 Jan 2018 21:03:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36721)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYjE9-0001nW-SU
	for qemu-devel@nongnu.org; Mon, 08 Jan 2018 21:01:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYjE5-0001zs-Tj
	for qemu-devel@nongnu.org; Mon, 08 Jan 2018 21:01:21 -0500
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:42014)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYjE5-0001zi-PA; Mon, 08 Jan 2018 21:01:17 -0500
Received: by mail-qt0-x244.google.com with SMTP id g9so16079646qth.9;
	Mon, 08 Jan 2018 18:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=t6ruiIsuZsASYC5isOLE/fGowGmIRviFRdZn64K7Xpk=;
	b=UZAIwhtQW7s9LFVbKJbQhAuzgiGCseJLgDCWJj6inv7DiT115zhBP2vAOqNSWu1/pE
	a9kQla6LKRFRAjWUWocwmLBSbOpJP3EMM2Rd7sSfkbIFvMRjBiKU06xwZSygkC4HnZIl
	ouUG1sjwybYLfUq/TA8NMmzezvaklxa9q8qDksmB924PK130QHeRpicGSbFYiPFTzELc
	LIMEz9DyfWXiEr4zKrslW6/YADktB8raF1Rt7RmY6BMwjtTp8QqT5v+DgjdcTvWT1F7U
	FBQsu+rrq9UKhTYnkmrdhqRU5CEfXTpzobSeKBOusNkqjeCwfHUqr0puVlf25Do/0VOa
	p3eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=t6ruiIsuZsASYC5isOLE/fGowGmIRviFRdZn64K7Xpk=;
	b=bLNuor4+H7EusM4obvgJFe48Wo7xISlbvVxnnlflPsHfg0FxpYTJ0jmfLqGLFtQNtm
	h+4R1DlMrO+kVe+KPo1dswM0Mamx3hLn1GIh5TERx6Z7HYJn4eoaURvgd7H6qv+32WjM
	PkWE5ODSscUo4aqS+3SMNQarmbU4h0iSY4+uosLV3XHizUAhBvLsUccTG6U/i59mw8T3
	tO4gacQk8drRR0fmQsv3Q6PL94sokOMKU5h1YDYEUPfcLqBEi/AQ20RxYotViTRGLphv
	MHSHoAGQAy57SkOxaalwXwdK/bLF/L2F5NvZiP4SZ3SQKSlWnEmIkPb6Gnttk16Gkqqr
	2JBg==
X-Gm-Message-State: AKwxytdBW9oeBuLzyWlsWqD7GU/uEZcwo0l3HF7mq5rXfGePoaYTdowi
	OZL/rzGipVGAv4MNVaLN3nI=
X-Received: by 10.200.48.55 with SMTP id f52mr18021204qte.248.1515463277068;
	Mon, 08 Jan 2018 18:01:17 -0800 (PST)
Received: from x1.local ([138.117.48.219]) by smtp.gmail.com with ESMTPSA id
	r22sm8605027qtc.71.2018.01.08.18.01.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Jan 2018 18:01:16 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	"Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
Date: Mon,  8 Jan 2018 23:00:45 -0300
Message-Id: <20180109020054.32553-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-devel] [RFC PATCH v2 0/9] resolv device by Flattened Device
 Tree alias name
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
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ASSRLzmiFuNp

Hi,

This RFC series is intended to simplify Flattened Device Tree support,
in particular the 'compatible' FDT entry, when Linux names mismatches
QEMU ones, but this is the same device modelled.

So far this is only a 'proof of concept'.

To see how the qtests perform, I only modified the Xilinx ZynqMP machine.

This is only the 6th generic alias compatibility API in QEMU   ¯\_(ツ)_/¯

Since v2:

- Follow Eduardo advice:
"If aliases exist only for compatibility, they should be restricted to
the places where compatibility is really needed."

- Do not modify QOM/qobject, use a specific GHashTable for FDT alias resolv.

- The aliases aren't display in HMP / -device help

If a machine is expected to use FDT, it needs to explicitely resolv any
device name with the type_resolve_fdt_alias() function.

Regards,

Phil.

Philippe Mathieu-Daudé (9):
  hw/sysbus: add helpers to register FDT aliases
  hw/char/cadence_uart: add FDT aliases
  hw/net/cadence_gem: add FDT aliases
  hw/timer/cadence_ttc: add FDT aliases
  hw/dma/axidma: add 'xlnx,eth-dma' FDT alias
  hw/usb/hcd-ehci: add 'xlnx,ps7-usb' FDT aliases
  hw/ssi/xlnx-spips: add 'xlnx.zynq-qspi' FDT alias
  hw/dma/xlnx_dpdma: add 'xlnx,axi-dpdma-1.0' FDT alias
  hw/arm/xlnx-zynqmp: use Linux FDT names

 include/hw/sysbus-fdt.h  | 18 ++++++++++++++++++
 hw/arm/xlnx-zynqmp.c     | 14 ++++++++++----
 hw/char/cadence_uart.c   | 12 ++++++++++++
 hw/core/sysbus-fdt.c     | 30 ++++++++++++++++++++++++++++++
 hw/dma/xilinx_axidma.c   |  2 ++
 hw/dma/xlnx_dpdma.c      |  2 ++
 hw/net/cadence_gem.c     | 10 ++++++++++
 hw/ssi/xilinx_spips.c    |  2 ++
 hw/timer/cadence_ttc.c   |  8 ++++++++
 hw/usb/hcd-ehci-sysbus.c |  8 ++++++++
 hw/core/Makefile.objs    |  1 +
 11 files changed, 103 insertions(+), 4 deletions(-)
 create mode 100644 include/hw/sysbus-fdt.h
 create mode 100644 hw/core/sysbus-fdt.c

-- 
2.15.1

