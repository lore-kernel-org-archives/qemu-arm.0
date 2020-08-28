Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp1403680lfc;
        Fri, 28 Aug 2020 05:13:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9F3d4KOYu+lv9M2mVDdYihTuvI/HvaOPEVTbvVAhmjGWdkyxnBuW5drAmDN2hjsDR1lFf
X-Received: by 2002:a25:e688:: with SMTP id d130mr1855338ybh.509.1598616780344;
        Fri, 28 Aug 2020 05:13:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598616780; cv=none;
        d=google.com; s=arc-20160816;
        b=iAHcBo+1f4KNb2cNWmo9FQwP+pDLjKoc1KxicHNqdINmFYzuvVARwxswrR6xCHjc1f
         MiHTTBdygISoyz4i46gEd33GfJz/fj6Mn+ezPO+PwAFrQ/AUwUwY/fpUcFnd5KWGUCv7
         h/4vjHn1HFj2yg8f5Vr5IzVc1Pka3WSm9HdlN54QvbB8pkgbyv4tUlYgsPALVHH4UZXg
         ry/G7cPzPohId8aF6/LnPZYCZ74wTxH2/PKVUmr5D1G++Vxa9ln7mJkrJGDTUsfxfeYs
         W6tX/hN8V7yanc/UTC/s+OAFWRIs8iGRkJmb/IWe/70N6AeEy48Xc7fn06q3K2YF6bbi
         V44g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=h5caQ6mUFMZIR6yPXUO1B+BFnqsBds86KLoX/jGg1Go=;
        b=GYF0peRUn0ZoCfBpbTtssAdzQc/SbAlKuqdqYVLKU5sqlvlWNUhZLNulzAAsSVMJhz
         NQyo5jHRoysoLpgtcspTcdyZPXGSLGnAJmC8848WGeUMGZFApnv7ki70wnCWIdeZXBzW
         e8C6IuDjVpjfpxMto+rCcP7Hsu6MCfe27ACqxe59xptwHoO5vexq9UkJudQq9rkpk05X
         TcMi0hIprFGsOPsqcYuVGn5ZOhkra/HZxIbxS1dD5RpfmVMZ8FXgsBFlWOwQTP+P2nsJ
         oRnr2fL+JsG7SLxu2Z6SOmaOFSsAKlZdC9pRVStSFIcQUso26IAqLPhIeUconzJdXgYc
         pBSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="V2FHEW/e";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m13si823030ybt.372.2020.08.28.05.13.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Aug 2020 05:13:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="V2FHEW/e";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kBdFb-0001vp-Nu
	for alex.bennee@linaro.org; Fri, 28 Aug 2020 08:12:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kBdFU-0001vc-2H
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 08:12:52 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:26626
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kBdFR-0008JG-OQ
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 08:12:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598616768;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=h5caQ6mUFMZIR6yPXUO1B+BFnqsBds86KLoX/jGg1Go=;
 b=V2FHEW/e7NSsafM4nr/q61my8VDVD7nhS3eUlCwl9F02K0IkmUM+yuObBARcACg7Bet0no
 S8yzKNKuRkL1gzuSyEpPVxY5EOFQMStM3cOx9siIS8xD6WRXMNKw5QH8B8Yyp8R3x2/LvW
 d8no6hCJxrijBCiTrvPFh9xnXVMkabA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-220-NT7fNU73OBC_elFQjeMyTw-1; Fri, 28 Aug 2020 08:12:46 -0400
X-MC-Unique: NT7fNU73OBC_elFQjeMyTw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7D07F1DDE2;
 Fri, 28 Aug 2020 12:12:45 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-54.ams2.redhat.com
 [10.36.112.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8150060BA7;
 Fri, 28 Aug 2020 12:12:39 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8ECB89C87; Fri, 28 Aug 2020 14:12:38 +0200 (CEST)
Date: Fri, 28 Aug 2020 14:12:38 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Sergio Lopez <slp@redhat.com>
Subject: Re: [PATCH v6 03/20] seabios: add bios-microvm.bin binary
Message-ID: <20200828121238.rf2zbph23rv4gp4v@sirius.home.kraxel.org>
References: <20200826105254.28496-1-kraxel@redhat.com>
 <20200826105254.28496-4-kraxel@redhat.com>
 <20200827144854.vz7yhakvks5xoh63@mhamilton>
 <20200828050232.jykyjztkwaplkhsu@sirius.home.kraxel.org>
 <20200828105719.tax5x5youqm3laki@mhamilton>
MIME-Version: 1.0
In-Reply-To: <20200828105719.tax5x5youqm3laki@mhamilton>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/28 04:08:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.959,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Y0/WRipJmCC8

> > We have roms/Makefile for firmware builds.  "make -C roms bios" will
> > build seabios binaries (you need the seabios submodule initialized for
> > this).
> > 
> > And, yes, seabios builds are reproducible.  If you build with the same
> > compiler (rhel-7 gcc 4.8.5) you should end up with the same binary.
> 
> Which version exactly? I'm still getting a different binary with this
> one:
> 
> gcc (GCC) 4.8.5 20150623 (Red Hat 4.8.5-39)

Exactly this one.

Hmm, when rebuilding now I see the binaries change too.  A few days ago
when I've rebuilt the microvm binary git didn't flag the other two
seabios binaries as changed even though they have been rebuilt.  So this
apparently was just luck.

take care,
  Gerd

