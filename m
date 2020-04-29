Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp190110lfm;
        Tue, 28 Apr 2020 23:15:32 -0700 (PDT)
X-Google-Smtp-Source: APiQypJ3jFXevpGv9qTQBQg/qKCg31tLymgTaNRvD0xTVmKmh5QRElGehAe5o3ScWOeJUzLRCpM7
X-Received: by 2002:a0c:aadc:: with SMTP id g28mr32404400qvb.0.1588140932050;
        Tue, 28 Apr 2020 23:15:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588140932; cv=none;
        d=google.com; s=arc-20160816;
        b=bKXOSoixhCZvHzkoEc83WJ+EkiWZQFnVu7uT/8M5PHWUEB2B5bb5lSiFjGQ3Rv+9eG
         /1UCY/YPEOfRPtRwQXhVuj3z9lOcv8azYpYwAtzV+PW38/p4Y7DBD65WPn1M8lJH7i0D
         eL8NVYY98qt93JpBJm5ArsCDLrTfUT18F7GgoRTTdGcBq91KxtyDn8YdPT0z1HtI0jpa
         k+TWZrt4VRKIW8oNI9mh6yBIBjufOk73WAXmWkBTOfZp1JUp4StNpTv1o8zxIwq6vgm1
         wCvHfJjVGJ5O7yeGvv/WgRyHJctCKNTaFeogWziY76nSDWxkDXZ/DaZdu3d2utiGYU4M
         /CSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:organization:references:in-reply-to:message-id:subject
         :to:from:date:dkim-signature;
        bh=UwldEiI0ZwLDLmWUgP1MXicIGX0GdoVJ5V5QMz1Z668=;
        b=ybQGBq1NkD92IAhyTeBHCdkvHb9rhz5fdGwNomfQ0vHgfi+jYiEF/Ow6DCLqWOIuSP
         P0Yu6Y1g0uR9WHAyphnrgI3t9c5zXmqMHoyWrTaL3MSVbHG8iSAAYiCumVX/31NJXKS7
         ODzNyF619klEvmUSKTQudpf7Y5DxhxFwazhi/UQmHGQAT/qMEOZnNnkpIs1eXUG9xGM1
         Cw5sEv39O052hDiQRuy6mieaLxCyF+SK/lSUGzqSC4s7YYceayFXkzetK4sxVZXzMeno
         Vf+Su6XeAkbiZ1UqF6w3HxM1zrnq6p+peQlZs1eNiQ+u7gpwCaxEi2vitHGvC3KuYwUT
         Se8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=MWoFtJa3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id p13si12003964qkg.357.2020.04.28.23.15.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Apr 2020 23:15:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=MWoFtJa3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jTg0J-0004uX-FY
	for alex.bennee@linaro.org; Wed, 29 Apr 2020 02:15:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39390)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1jTfwg-0006bh-DY
 for qemu-arm@nongnu.org; Wed, 29 Apr 2020 02:11:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1jTfwf-00033K-49
 for qemu-arm@nongnu.org; Wed, 29 Apr 2020 02:11:45 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:48618
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1jTfwe-000339-My
 for qemu-arm@nongnu.org; Wed, 29 Apr 2020 02:11:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588140703;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UwldEiI0ZwLDLmWUgP1MXicIGX0GdoVJ5V5QMz1Z668=;
 b=MWoFtJa33qY7ugNNhYt0YaSifEMVvtBGxP33Mdgkq1O0e+esNZcHw9G5NlxVABloL6YjdJ
 3cpDlaVVHgbQfb8iVR/yUdlbkxszI4J0Pe8RnWvCSUuuUYzEZYML3mtzXwGu6nvEWlBpjF
 51glVb/cVeiSlXN0eWs+z8q1iDJiM+8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-184-LlLx03WvO4CDg-s_UNKLHQ-1; Wed, 29 Apr 2020 02:11:37 -0400
X-MC-Unique: LlLx03WvO4CDg-s_UNKLHQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3BC4F107ACF2;
 Wed, 29 Apr 2020 06:11:36 +0000 (UTC)
Received: from gondolin (ovpn-112-87.ams2.redhat.com [10.36.112.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 051835D76A;
 Wed, 29 Apr 2020 06:11:31 +0000 (UTC)
Date: Wed, 29 Apr 2020 08:11:29 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Stefan Berger <stefanb@linux.ibm.com>
Subject: Re: [PATCH 0/2] virt: Set tpm-tis-device ppi property to off by
 default
Message-ID: <20200429081129.18e9760a.cohuck@redhat.com>
In-Reply-To: <0257ca1e-2323-e437-4e19-d8a4dfa6d792@linux.ibm.com>
References: <20200427143145.16251-1-eric.auger@redhat.com>
 <20200428123826.1ec68e6c.cohuck@redhat.com>
 <0257ca1e-2323-e437-4e19-d8a4dfa6d792@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/29 00:53:13
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
 Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org,
 eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ngEfwcsW2OrK

On Tue, 28 Apr 2020 16:13:05 -0400
Stefan Berger <stefanb@linux.ibm.com> wrote:

> On 4/28/20 6:38 AM, Cornelia Huck wrote:
> > On Mon, 27 Apr 2020 16:31:43 +0200
> > Eric Auger <eric.auger@redhat.com> wrote:
> >  
> >> Instead of using a compat in the mach-virt machine to force
> >> PPI off for all virt machines (PPI not supported by the
> >> tpm-tis-device device), let's simply change the default value
> >> in the sysbus device.
> >>
> >> Best Regards
> >>
> >> Eric
> >>
> >> Eric Auger (2):
> >>    tpm: tpm-tis-device: set PPI to false by default
> >>    hw/arm/virt: Remove the compat forcing tpm-tis-device PPI to off
> >>
> >>   hw/arm/virt.c           | 5 -----
> >>   hw/tpm/tpm_tis_sysbus.c | 2 +-
> >>   2 files changed, 1 insertion(+), 6 deletions(-)
> >>  
> > I think we can apply the compat machines patch on top of these two
> > patches.
> >
> > Q: Who will queue this and the machine types patch? It feels a bit
> > weird taking arm patches through the s390 tree :)
> >  
> I can queue them and would send the PR soon. I am also fine with someone 
> else doing it.

Would be great if you could queue these together with
https://patchew.org/QEMU/20200424090314.544-1-cohuck@redhat.com/
(hopefully should still apply cleanly, let me know if a respin is
needed).

