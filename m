Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp4200663wrv;
        Tue, 30 Jul 2019 03:14:36 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzowNsApLgRS/7undK7i897y1YeENlR+ngwuN8c0Jqk4okgbTtbcLbj1KPJbAMEU+5Fg7t4
X-Received: by 2002:a05:620a:533:: with SMTP id h19mr75738026qkh.325.1564481676095;
        Tue, 30 Jul 2019 03:14:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564481676; cv=none;
        d=google.com; s=arc-20160816;
        b=GzkMEm4SPApZizR7gA7TBqhaZ8+EStS4d1w7VvfjZUMon+ylTDTf98g6VfSaeRO3m7
         QyQ2bVOjR4aRZRNRiHlUYtYpFcu0DBqGE5bkQelP45M2WCVgJpKfz8aGITmjcHKkS7SE
         raTJp3hNY1lufelEwNER1RfgztpA3DzbRDVZCxE68lt7dtM6OTSmYB0EjCxq/+fWOPH3
         BjglXTkYdkQnWvnQ/O2hlJSnDPYUMXS1VDOZtwe/pjw/W+OTt3ugCw9uUJVpIfHRe5gY
         lPtqmbTFgjRL76+6C0LVClVRR1nd7F3chnRVF8paDk6/ifQi85i8WyLe1HwWZ7cH179Z
         mvsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:to:from:date;
        bh=64JsCrSzJVyGly0HuDb+JAaO8UxhvYq6LddWXi+eEP0=;
        b=MYjFdpjQjJGQyjqunR0Dm/eA8SUjYTwuWLFOD//Lj9x6LjRjbwC7bgjaOXD+blOD2R
         xnRKETfT9vFIBMH76VVrmkmYYHhrWuNg/M4dIDMiBRyDXYcReXUP2CbBrjMsCzz9CI5T
         TCihCZM5mqv9kwBwvIwiIUYlr6FHryfk0Qo3QBAs6SfR1bQrKKqf29pRKVPi2gAJkF48
         fQ0Us7+Ryyz8FPuBmRHCHdSekFchv0MHsnMMgIcqNMGWI/+VHw0SVcQGnmePG2EmG4pn
         RcPJg19/N7U8WwIp/0yG8eXSL8dKlEE/WDnEZ6P/qC1pAIptlp31cgkSmeWQ25sZbySR
         eBIA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v54si40397058qtv.88.2019.07.30.03.14.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jul 2019 03:14:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hsP9P-0003ik-Ki
	for alex.bennee@linaro.org; Tue, 30 Jul 2019 06:14:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40399)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <cohuck@redhat.com>) id 1hsP9K-0003h7-Jl
 for qemu-arm@nongnu.org; Tue, 30 Jul 2019 06:14:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1hsP9J-0006Ui-O5
 for qemu-arm@nongnu.org; Tue, 30 Jul 2019 06:14:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55366)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>)
 id 1hsP9I-0006UM-M2; Tue, 30 Jul 2019 06:14:29 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D136230BD1B5;
 Tue, 30 Jul 2019 10:14:26 +0000 (UTC)
Received: from gondolin (dhcp-192-232.str.redhat.com [10.33.192.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A9F3A19C70;
 Tue, 30 Jul 2019 10:14:10 +0000 (UTC)
Date: Tue, 30 Jul 2019 12:14:08 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Damien Hedde <damien.hedde@greensocs.com>
Message-ID: <20190730121408.2e27f74f.cohuck@redhat.com>
In-Reply-To: <20190729145654.14644-1-damien.hedde@greensocs.com>
References: <20190729145654.14644-1-damien.hedde@greensocs.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Tue, 30 Jul 2019 10:14:27 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v3 00/33] Multi-phase reset mechanism
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
Cc: fam@euphon.net, peter.maydell@linaro.org, walling@linux.ibm.com,
 dmitry.fleytman@gmail.com, mst@redhat.com, mark.cave-ayland@ilande.co.uk,
 qemu-devel@nongnu.org, kraxel@redhat.com, edgar.iglesias@xilinx.com,
 hare@suse.com, qemu-block@nongnu.org, david@redhat.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, marcel.apfelbaum@gmail.com,
 marcandre.lureau@redhat.com, rth@twiddle.net, thuth@redhat.com,
 ehabkost@redhat.com, alistair@alistair23.me, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, clg@kaod.org, jsnow@redhat.com,
 david@gibson.dropbear.id.au, berrange@redhat.com, mark.burton@greensocs.com,
 qemu-ppc@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QOt+t15UEmQu

On Mon, 29 Jul 2019 16:56:21 +0200
Damien Hedde <damien.hedde@greensocs.com> wrote:

(...)

> 2. old's device_reset
> 
> There was a few call to this function, I renamed it *device_legacy_reset* to
> handle the transition. This function allowed to reset only a given device 
> (and not its eventual qbus subtree). This behavior is not possible with
> the Resettable interface. I changed existing calls. Most of the time there is
> no change of behavior because devices have no sub-buses.
> Here the summary after checking each one (I've reproduced the list made by
> Peter with some additional commentary of myself):

(...)

>  hw/s390x/s390-pci-inst.c
>   -- resets the S390PCIBusDevice Needs S390 expertise, but probably
>      either no child buses or failure to reset them is a bug.

That's the 'zpci' device, which holds additional architecture
information for each pci device. Looks fine to me, but additional
confirmation from Collin would be good.
