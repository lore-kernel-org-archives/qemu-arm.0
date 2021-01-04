Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp15425853lfq;
        Mon, 4 Jan 2021 01:33:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwh0ByXXPGySE/L4rrdWkXWr+dOeurlfIq1jnBjnEK2QbpKEv3F44xV8iaLgEzypgV2HIui
X-Received: by 2002:a25:5d1:: with SMTP id 200mr102264600ybf.397.1609752796342;
        Mon, 04 Jan 2021 01:33:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1609752796; cv=none;
        d=google.com; s=arc-20160816;
        b=aMOyQ+hdfTxvmNJvk+yN0mdzee0qOJY3lTiRDtfJiLiBD/uIxSHwiYvOxie3LxKWV8
         vzxT38Uke+OL6mT01HAWEgwKpF7aW458QVLPdpAHwr3eIatk6zRYs2DkPly/xSzsq+V4
         e5NsQemqikdoegH6nFsfnbOmA/yZn5/vuH+QAJYHcgmEZZB3MX9GMvZFOXWbjEy7ATLI
         tB7CUHlONRGC7MKvq5/I3wxhydmcG4OCZP4rHTgylPEhjVsjgXvQquG3Pw0IetPZotnd
         BXy7ML9CzDpk4pwoO28xlOyilEL9CP0VhTdH28x4AAalZjNBbKFhJyscbu4EfvdESAO9
         GwBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:to:from:date:dkim-signature;
        bh=HxTr71QZaT90y8c2vL2GVs5Sp2A5X0ewvCwxjpolVVQ=;
        b=Bil3E3Pc4RFzbHYOuvpJDPQ1TMsVL4WhJzgJLKe2dwPVSEVuVF8lKNJZ393zWfgwnu
         L6gdl0j6z7CpybnqplBZHEewx8vcQHDIt7WNJkEePbbckWwBdVZglfGZHyevapg/X7yx
         soi4rybwmKhy/Wyxw5dt2IWs9B81V5lr3ktPrUdssQUgZrgtUR4wuMXqYPjoknDfaxZx
         e9cwWH9087vabqgH3ku8VaB9H+1dW5eZjmO9Mh5KVEjPL0634Up05zjhpugOFDVMrD+p
         hbsXz39FShVdqCwWT2Nlocu6miBMiPJjmcHhyyCJo82crQHxVvb+1FoFM+m/d83LFsDr
         Z0Bw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=NHK+gnlr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e66si53787834yba.279.2021.01.04.01.33.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jan 2021 01:33:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=NHK+gnlr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kwMEl-0008Os-JW
	for alex.bennee@linaro.org; Mon, 04 Jan 2021 04:33:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kwMEA-00089M-0j
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 04:32:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kwME6-0000d9-Bo
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 04:32:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609752752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HxTr71QZaT90y8c2vL2GVs5Sp2A5X0ewvCwxjpolVVQ=;
 b=NHK+gnlrU8EKoI41UYBKe5QrUiHgBVPTSxUAMMVwelG/Epygvbi5U8ydwZDREQ1zhqsqt3
 RFyp/aeUkxc2v7O2L0/pFWJi+LHkovUbSJwLoqdHcPaOGlzp+bPf5FOVotu7f44w7Y+sja
 h7fJcE/iQvKfwFJ1c81LMPKp2n4U1EM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-484-9Uq7xHMtNTWSbqcs2QKCEw-1; Mon, 04 Jan 2021 04:32:31 -0500
X-MC-Unique: 9Uq7xHMtNTWSbqcs2QKCEw-1
Received: by mail-wr1-f71.google.com with SMTP id g17so12932804wrr.11
 for <qemu-devel@nongnu.org>; Mon, 04 Jan 2021 01:32:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=tn7hDzxpKrM1swuwnw3aSgEMZIORK6hhOk9QF/UxR54=;
 b=PWxGPIe8eOv7EaYzn9BKyP+Px2dHkf6VTB5+Dwavd1p8EVvJoMbrFb7MbmfgTLf3cZ
 BE0ZjPb3zUWPXBJmD1Je/fYiiT0CGgwYLip9X1Q3mYD9hSK0kHJOrK7zTovcbmW2w5JE
 JMnfugPsJHF71VetkAPREdlA9iZjYL0Q7rgOupI0+s0rrvhYVx2kCIGmGtAJ+laY2WJp
 uqTsDeVOm2Qq3JDF6HRhlI+7WXHzoOxsm+KrX/4sQmaV7nKONy5UYBlG01pjMn34ML3W
 lE+VAW58Gz++pIL1K+xxU0J3QnmT+ZzWsZo6uvBiTLk2Yg47um2HNmswEYyhbNERltva
 7Xew==
X-Gm-Message-State: AOAM532GQn3nWA+339PYpw7cdbUkr7adZSjswU250IWTATCtAoMWwlq1
 DPyebYGABT6oqid6s7knjrPRgUifKecx2sys8HoaCOnlzoL6rz47YImkZup791Gl/orfSuCiChD
 FwSL4SVT46Dok9SI=
X-Received: by 2002:a05:6000:10c4:: with SMTP id
 b4mr80539860wrx.170.1609752749938; 
 Mon, 04 Jan 2021 01:32:29 -0800 (PST)
X-Received: by 2002:a05:6000:10c4:: with SMTP id
 b4mr80539832wrx.170.1609752749696; 
 Mon, 04 Jan 2021 01:32:29 -0800 (PST)
Received: from redhat.com (bzq-79-178-32-166.red.bezeqint.net. [79.178.32.166])
 by smtp.gmail.com with ESMTPSA id n9sm88912868wrq.41.2021.01.04.01.32.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jan 2021 01:32:28 -0800 (PST)
Date: Mon, 4 Jan 2021 04:32:25 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH 0/5] hw: Use PCI macros from 'hw/pci/pci.h'
Message-ID: <20210104043218-mutt-send-email-mst@kernel.org>
References: <20201012124506.3406909-1-philmd@redhat.com>
 <04b12adf-39ad-dc19-0458-74b0db809a95@amsat.org>
MIME-Version: 1.0
In-Reply-To: <04b12adf-39ad-dc19-0458-74b0db809a95@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Paul Durrant <paul@xen.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Huacai Chen <chenhc@lemote.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, qemu-trivial@nongnu.org,
 Helge Deller <deller@gmx.de>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-arm@nongnu.org,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Richard Henderson <rth@twiddle.net>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5e9EtY27pMVz

On Sun, Jan 03, 2021 at 02:04:53PM +0100, Philippe Mathieu-Daudé wrote:
> On 10/12/20 2:45 PM, Philippe Mathieu-Daudé wrote:
> > Trivial patches using the generic PCI macros from "hw/pci/pci.h".
> > 
> > Philippe Mathieu-Daudé (5):
> >   hw/pci-host/bonito: Make PCI_ADDR() macro more readable
> >   hw/pci-host: Use the PCI_BUILD_BDF() macro from 'hw/pci/pci.h'
> >   hw/pci-host/uninorth: Use the PCI_FUNC() macro from 'hw/pci/pci.h'
> >   hw: Use the PCI_SLOT() macro from 'hw/pci/pci.h'
> >   hw: Use the PCI_DEVFN() macro from 'hw/pci/pci.h'
> 
> As this series are trivial and Acked, I'm going to queue
> it via the mips-tree, as other reviewed patches depend
> on it.
> 
> Thanks,
> 
> Phil.

Fine.
Acked-by: Michael S. Tsirkin <mst@redhat.com>

