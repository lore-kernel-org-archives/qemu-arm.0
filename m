Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp5365538wrx;
        Tue, 9 Apr 2019 17:26:33 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxnHGsYFOKmDyOvm+fDLxgTtR/1Z8kv2mhf9VQ92ThJcA9GLWJVDGOTH+oQuYk9O8Oqyk1j
X-Received: by 2002:a1c:988d:: with SMTP id a135mr712924wme.24.1554855993341;
        Tue, 09 Apr 2019 17:26:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554855993; cv=none;
        d=google.com; s=arc-20160816;
        b=O5FB+nwc0qds+a81O8ZDdgA/nXGaJ0VUTbdLP1t3zXFb3dQgTHaHrCp45vcq6TobkG
         dR+WPTICFIhBpExo6bB4rdPrNBG2xVDmLqE8feDcK1spfuF+b4NMmVj2Zxn0SPGFw7Hw
         BbAv7bFinezsQzZEe3eFStZwWA/PeIHOJVAbHc9BQzZgiJx+C3WpKZkk5zvtANO3Aq2i
         vITv45KeogNg68SF7Uvnjy8LUvzwvZLuIA88U1N5wUCpN9tadjHfCmy/4pVU1R1VPd7M
         QJET+aTOaPrBRrwbpjTh1mS7AI7GLKW2eEyuSXidviV84VGC4z49ubplRoH/8B46HIz8
         GsPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=oNqqlDUWp/YRWYWgpR5kZsK0CnXF8MoWTONszy7N1oo=;
        b=ckjS1GmuwVx8SYsYdZJMZfBjzE8uavarenSuBOiJo0l6yaA/8H7UnbsDoGrCwa9S12
         4CSKmf9TB11/fRTW4/OSB2iSrssv+uM2sO+Bfr6rNchgO6aMzAB0nvNShxVgqAuVcn5+
         gim7hOQdCnTpeJAiCKvbpdcWi6o7aaQhA2FpDz64gESSSAJCfN6GhCEzGlSlgvlHfdzl
         2Ga1WMyYdqY98Jed0+0o2kFrKKiEHENaTg9JHVqwi0DvD4bFNcM9dF7RWS91ieavecsf
         72DyY0PoyHDGuMXZBALbBlALaIEvt6zISR0qgTQraJtOdAykKms+BL2+YKdouLHt86cf
         3Z9A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b15si22110365wrq.75.2019.04.09.17.26.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 09 Apr 2019 17:26:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:51088 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hE14S-00054U-Fg
	for alex.bennee@linaro.org; Tue, 09 Apr 2019 20:26:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35219)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1hE14L-00054D-NL
	for qemu-arm@nongnu.org; Tue, 09 Apr 2019 20:26:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1hE14K-0005RR-7d
	for qemu-arm@nongnu.org; Tue, 09 Apr 2019 20:26:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47816)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peterx@redhat.com>)
	id 1hE14I-0005M4-Ak; Tue, 09 Apr 2019 20:26:23 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F041C58E22;
	Wed, 10 Apr 2019 00:16:47 +0000 (UTC)
Received: from xz-x1 (ovpn-12-79.pek2.redhat.com [10.72.12.79])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C01A118255;
	Wed, 10 Apr 2019 00:16:43 +0000 (UTC)
Date: Wed, 10 Apr 2019 08:16:40 +0800
From: Peter Xu <peterx@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20190410001640.GA25214@xz-x1>
References: <20190409160219.19026-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190409160219.19026-1-eric.auger@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Wed, 10 Apr 2019 00:16:48 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH for-4.1] hw/arm/smmuv3: Remove
 SMMUNotifierNode
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CTxi95CeglpH

On Tue, Apr 09, 2019 at 06:02:19PM +0200, Eric Auger wrote:
> The SMMUNotifierNode struct is not necessary and brings extra
> complexity so let's remove it. We now directly track the SMMUDevices
> which have registered IOMMU MR notifiers.
> 
> This is inspired from the same transformation on intel-iommu
> done in commit b4a4ba0d68f50f218ee3957b6638dbee32a5eeef
> ("intel-iommu: remove IntelIOMMUNotifierNode")
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu
