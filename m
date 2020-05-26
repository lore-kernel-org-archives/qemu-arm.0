Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp20934lfc;
        Tue, 26 May 2020 03:57:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzZ1XQbT2iSY87sI1ghwgGdcKXVmSbk9sPGEVcIw1xTUX3zZkVwNVYj2+RZoWPgSvzppbLC
X-Received: by 2002:a25:4f44:: with SMTP id d65mr636978ybb.149.1590490627056;
        Tue, 26 May 2020 03:57:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590490627; cv=none;
        d=google.com; s=arc-20160816;
        b=hpFbtjsgw1k771GnTzsoiTZ0fkVSsH9UAAoRJPqLneocvT2q244aGPWDbmhL3GMaih
         svHqgWwmg01ddrlw6X/ZgY/58jtvc77XKZIuillY6eZgXnoVI/wJ0sXtSTUOcZ2WCqji
         gotdc69E0TiFGPHVVA96ouier6QiT1N8ppV6kSwKSoVOJnEFFQ39pJo/AivH5bN9Syio
         2luX/vJ/WaXUl4Es7AwuVlDv+mULaYdElQ+SUGJpT2lB7IcfOfj2reYyGnygT5kDptC7
         EvFQi3MEMt+UHUe9RBa1H02MiC8MOhuZXw97K5Mu5oN69wNWlfA2qmgx6xBGyeFij4dl
         p7xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=9ElR8/TiWTLU4MenHCo/KuQT+CrmA8r6BBjyiu48rJs=;
        b=li0jWloWf2UJdJfLOsCU4P1z7rDVvzjKBCe1qnYI/NLuxxbrsbzKWx/UxwGLVygRyy
         g/bfk064MhHsEbqxyGBx+mnKBed0UOb1aBcLwG0QFPMH+w841WP7jG5eIsFrVkuAzuM5
         h0f+37f4KliuWhvgpTC2WhORUOHx2rIGli27djY5SiGYsJ1veMoTzHtu3BEd2rdiGdiQ
         ZYqA7iQgk4pXTOCQzR3DhEpClPwOmQHDEPIJXX9n/+MUS+2nJlYPZDlRc5egd6xDijpM
         WvhYZ/X7ETUFYROB6WO9spDbQArz7YL5IWnW7UdqVCfB++hWKhgGXVyW3ODgZDyxcxAL
         xLdg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SCFN2Gvz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z187si18365625ybz.309.2020.05.26.03.57.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 May 2020 03:57:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SCFN2Gvz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jdXGc-0006MR-G6
	for alex.bennee@linaro.org; Tue, 26 May 2020 06:57:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jdX7l-0007IC-UZ
 for qemu-arm@nongnu.org; Tue, 26 May 2020 06:47:57 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:52606
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jdX7l-0002Cn-08
 for qemu-arm@nongnu.org; Tue, 26 May 2020 06:47:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590490075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9ElR8/TiWTLU4MenHCo/KuQT+CrmA8r6BBjyiu48rJs=;
 b=SCFN2GvzDjhCH9VDdhJNDAr1DC+7g/EYd1mE/+ZTZmAt9+/xhl7QXHrmY+h31EUcmR0o8T
 0DdTmgJydI5UT6kpVG9xKrdEvdZkY7OSvgxcZX2/PwBq8oXuKfcWXN0TDJPmZruO/7FWjP
 MIWdUkwt22ykaDQvyNIu8M0mp+Zd5gQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-372-isFpXgsrP2287zNLfysvtg-1; Tue, 26 May 2020 06:47:52 -0400
X-MC-Unique: isFpXgsrP2287zNLfysvtg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 986AF19057A6;
 Tue, 26 May 2020 10:47:50 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-50.ams2.redhat.com
 [10.36.113.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2376B60C47;
 Tue, 26 May 2020 10:47:50 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3810F16E2C; Tue, 26 May 2020 12:47:48 +0200 (CEST)
Date: Tue, 26 May 2020 12:47:48 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 11/14] hw/display/vmware_vga: Let the PCI device own its
 I/O MemoryRegion
Message-ID: <20200526104748.wayie5aovk5omz3t@sirius.home.kraxel.org>
References: <20200526062252.19852-1-f4bug@amsat.org>
 <20200526062252.19852-12-f4bug@amsat.org>
 <20200526080123.ul5r4abphqfi7lkq@sirius.home.kraxel.org>
 <4a6478f2-6b70-40df-093f-e81d2437bfa7@amsat.org>
MIME-Version: 1.0
In-Reply-To: <4a6478f2-6b70-40df-093f-e81d2437bfa7@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/26 01:14:47
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 Alistair Francis <alistair@alistair23.me>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm@nongnu.org,
 Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RBdLfeALkRFX

On Tue, May 26, 2020 at 10:16:19AM +0200, Philippe Mathieu-Daudé wrote:
> On 5/26/20 10:01 AM, Gerd Hoffmann wrote:
> > On Tue, May 26, 2020 at 08:22:49AM +0200, Philippe Mathieu-DaudÃƒÆ’Ã‚Â© wrote:
> >> To avoid the orphan I/O memory region being added in the /unattached
> >> QOM container, register the PCI device as its owner.
> >>
> >> Signed-off-by: Philippe Mathieu-DaudÃƒÆ’Ã‚Â© <f4bug@amsat.org>
> >> ---
> >> RFC: This might break migration
> > 
> > --verbose please.  This doesn't touch the live migration data stream?
> 
> Oops, this is an I/O region... I was confused by this warning form Peter:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg681970.html
> 
> But it is restricted to RAM regions, so this patch is harmless.

Yes, for ram regions this is a problem, this is why vga has
global_vmstate.  No problem for io.  Series looks fine then.

take care,
  Gerd

