Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp5331903lfm;
        Tue, 28 Apr 2020 03:43:52 -0700 (PDT)
X-Google-Smtp-Source: APiQypJVwuZCjk82Fs840YH64WQqnVRRka3gf19KgbRspaUsVQ2q7w6ak9lpUqhvwYbMzb0dXsGy
X-Received: by 2002:ac8:1c35:: with SMTP id a50mr27481922qtk.286.1588070632262;
        Tue, 28 Apr 2020 03:43:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588070632; cv=none;
        d=google.com; s=arc-20160816;
        b=tGbD1R0/GVmKnBygXXcCEZUDjSgtXEmknKd05R+H3nXb6zSX1YpLUnqa1iyZitxoit
         VPOUzxULK7PyKiGK000Vv+VOj6iO85I8F1MoPCqHGya5PFB81uO9yAOaLvgxKtNAM6Js
         0w8Gqu9G/3fye/+hccat3AhvliN73U/lqcabPGe8H6/LnbCJ+abmDZHGhJus3e1aJ2Ua
         mYmu+/2hIo0YL6nGvSWL0C5NBmP2ndc3Ze4fIHgJalRn4WMukWbs/L3SlggtNJib1FLE
         xsIDFBFTHwXJmPH/1L9HnQ6KHRDZMeP4hhoEFwrk63hYJ5+nHb7EG9TkpDw4RWCoJ55W
         bNSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:organization:references:in-reply-to:message-id:subject
         :to:from:date:dkim-signature;
        bh=/7NAWnNaoUlS7P4lX/0IlMVjObOSLq35HG7C8D10PDI=;
        b=j+pZfALb9Bs+dqrd5TFjgESVt4KWsEFGUehgbPM6Upua/7otcb3e1oCx7V2pwl+7WN
         PAFd9z/baASisOCmZQSLv13efWyyrJsc4cyTh/1QIXmpeWHmjAsX3Fl00w2MhVAr42YP
         CGGIL1rY1f+dLt6LjHgfSCMCUssOZtCo8Kozu+WbhmG4wMYAtBPMgl0blVaCf4chDZEr
         8A29y5T5di2fi9cKT/4TRwyj/8RAqcqtF1R0PNsoJSI/BRNl7dPEVnKKWJw+arCFv8yg
         CmNH4z1HBDANNp8Cz/kChC108DrLDgtRO638aVW7ijND0H9HSxzcGFEWDSV0FWPR+HKH
         6bAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=cjRusXZu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x14si10205647qtp.111.2020.04.28.03.43.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Apr 2020 03:43:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=cjRusXZu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jTNiR-0000mV-Ik
	for alex.bennee@linaro.org; Tue, 28 Apr 2020 06:43:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45540)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1jTNh4-0007yc-BV
 for qemu-arm@nongnu.org; Tue, 28 Apr 2020 06:43:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1jTNde-0004ZA-Oh
 for qemu-arm@nongnu.org; Tue, 28 Apr 2020 06:42:26 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:44798
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1jTNde-0004Z2-Bu
 for qemu-arm@nongnu.org; Tue, 28 Apr 2020 06:38:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588070333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/7NAWnNaoUlS7P4lX/0IlMVjObOSLq35HG7C8D10PDI=;
 b=cjRusXZukSU4sJxbi7h72qvx9As/6BJShZA0UGCkdXVxstIVNEoeurB6g5pLJBtZsdghrg
 RNdIbbHiMAlzo7gYZj0p2IyHA9on8FSUIdnx3HB3kOITXdYZsdSTd/hpnwYau3SbKQx+jm
 OPgpsk9rtDitOjA9yVDPq8HLRb84Ep8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-327-9jAzkI02P-WUWyIWSwXQLw-1; Tue, 28 Apr 2020 06:38:50 -0400
X-MC-Unique: 9jAzkI02P-WUWyIWSwXQLw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74A8280058A;
 Tue, 28 Apr 2020 10:38:48 +0000 (UTC)
Received: from gondolin (ovpn-112-178.ams2.redhat.com [10.36.112.178])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A982E600D2;
 Tue, 28 Apr 2020 10:38:43 +0000 (UTC)
Date: Tue, 28 Apr 2020 12:38:26 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH 0/2] virt: Set tpm-tis-device ppi property to off by
 default
Message-ID: <20200428123826.1ec68e6c.cohuck@redhat.com>
In-Reply-To: <20200427143145.16251-1-eric.auger@redhat.com>
References: <20200427143145.16251-1-eric.auger@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/28 04:11:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, eric.auger.pro@gmail.com, stefanb@linux.ibm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: E38n1XWnHehz

On Mon, 27 Apr 2020 16:31:43 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> Instead of using a compat in the mach-virt machine to force
> PPI off for all virt machines (PPI not supported by the
> tpm-tis-device device), let's simply change the default value
> in the sysbus device.
> 
> Best Regards
> 
> Eric
> 
> Eric Auger (2):
>   tpm: tpm-tis-device: set PPI to false by default
>   hw/arm/virt: Remove the compat forcing tpm-tis-device PPI to off
> 
>  hw/arm/virt.c           | 5 -----
>  hw/tpm/tpm_tis_sysbus.c | 2 +-
>  2 files changed, 1 insertion(+), 6 deletions(-)
> 

I think we can apply the compat machines patch on top of these two
patches.

Q: Who will queue this and the machine types patch? It feels a bit
weird taking arm patches through the s390 tree :)

