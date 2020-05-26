Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp2734274lfc;
        Tue, 26 May 2020 01:04:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxaRi6aCqLCLu7/+PimoE3G+6KE4kFZHgrOdzN7WQrdb3wa9Q6xr49kSI73EGz+xVzViF0E
X-Received: by 2002:a05:6214:1422:: with SMTP id o2mr19224295qvx.13.1590480274191;
        Tue, 26 May 2020 01:04:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590480274; cv=none;
        d=google.com; s=arc-20160816;
        b=ryhZtdPxnGGp0ytDisabmRk5uppAyuInddXmQLPfX06OZH5mo7oUlpTAEcA6VtIKEp
         Yf7/7Tk7PXBRxfGtyyYUqBBLcUcLn+C1nOzm3YqOuMqp4VmMBsyrdy6rJDEYlXbByyaT
         wNtOeas8dmgJGmJ2WAOnKpwpKtqLYWfC2pOfqvBd5zRRQTG8KsXLExjeTTF+N2lXxoZS
         WLfBXwNQU0P43+1w4MI3KektZGnBgTFVD3YDKqEK2kotySEFYCoitqeuF4nyFb51swri
         lcEdPp81hYSsHIjfp9WPEylg2bhzgW8jxvVln31cHpWGRdIGK49vACbQXBZvJiprdkil
         WtKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=l7HV+Hw3Wg1qeveGO5ZlG2NKJFmWm+QhSpEpFqo5DR4=;
        b=YSalhIy85bJoaf8eW4PdHvXcvfN7Wg7BTlTpX0qZsJxSeFu7cuhbYe3FDo9QyVuRSO
         ff1D6vbACvLlbb0a+n129oatW7pk1weUWOz7wG8Mq2CFgFv7huH4gsgYgK9MhD4yp7wN
         MN+sDEM2I0x2/l5ivpeo0feec1Z+R8+CZ+ppteLILTHp0+Rk2kpSvJhweIHh6Fyf5V/r
         6XUjREW0IgpEq8GXMsrby8OiRKDlmOD5hQQnaYCCsSoCrQLLYvWQmgi2kYnxONeTi6BR
         9Yb+kWA0B8ZGyuUGyGc/NiqEArZ1ZHy7lSJM17T7XFAXzJdf9aG7312h0aG4IfnP7wh3
         KSUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HRkGXIrl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 17si11176812qkd.20.2020.05.26.01.04.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 May 2020 01:04:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HRkGXIrl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jdUZd-0008El-KQ
	for alex.bennee@linaro.org; Tue, 26 May 2020 04:04:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jdUWh-0003o3-3i
 for qemu-arm@nongnu.org; Tue, 26 May 2020 04:01:31 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:58282
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jdUWg-0003r1-3j
 for qemu-arm@nongnu.org; Tue, 26 May 2020 04:01:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590480089;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l7HV+Hw3Wg1qeveGO5ZlG2NKJFmWm+QhSpEpFqo5DR4=;
 b=HRkGXIrl4QBozyWIIcXpsR1BHtDihOpbRJZZh36XPJWo9ghn6BJFwsdUNOCKfmtZK2OJr0
 6IQsQqDlj3osQZoHuLGNjKSWaN8T/fBk9xOv1ez+IBc6VNyMhqT0PVw0jK5QZ3KlUt+ubO
 SzhR82EVCO/sFpUKZAYlnEiKT+VdP2Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-17-6-uz1ULHMfKz0o1ZHVbHmg-1; Tue, 26 May 2020 04:01:27 -0400
X-MC-Unique: 6-uz1ULHMfKz0o1ZHVbHmg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 92440107ACCA;
 Tue, 26 May 2020 08:01:25 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-50.ams2.redhat.com
 [10.36.113.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 179425D9E5;
 Tue, 26 May 2020 08:01:24 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id CCDAA9D54; Tue, 26 May 2020 10:01:23 +0200 (CEST)
Date: Tue, 26 May 2020 10:01:23 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 11/14] hw/display/vmware_vga: Let the PCI device own its
 I/O MemoryRegion
Message-ID: <20200526080123.ul5r4abphqfi7lkq@sirius.home.kraxel.org>
References: <20200526062252.19852-1-f4bug@amsat.org>
 <20200526062252.19852-12-f4bug@amsat.org>
MIME-Version: 1.0
In-Reply-To: <20200526062252.19852-12-f4bug@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/26 00:48:49
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-TUID: QMHROEGq+yYf

On Tue, May 26, 2020 at 08:22:49AM +0200, Philippe Mathieu-Daudé wrote:
> To avoid the orphan I/O memory region being added in the /unattached
> QOM container, register the PCI device as its owner.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> RFC: This might break migration

--verbose please.  This doesn't touch the live migration data stream?

take care,
  Gerd

