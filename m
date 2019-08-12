Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp309442wrs;
        Mon, 12 Aug 2019 02:09:10 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwo065kKtI/Wldueish0TMJJvO6t+r8BSIPoh8PuocQLN6O+jCs+04jrCEE32DVipvGChwI
X-Received: by 2002:a17:906:af4b:: with SMTP id ly11mr7665560ejb.309.1565600950396;
        Mon, 12 Aug 2019 02:09:10 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a17si40904668edd.199.2019.08.12.02.09.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Aug 2019 02:09:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=4K7cNLFx;
       arc=fail (signature failed);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hx6KD-000491-Gy
	for alex.bennee@linaro.org; Mon, 12 Aug 2019 05:09:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39522)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <damien.hedde@greensocs.com>) id 1hx6Jx-00048f-TT
 for qemu-arm@nongnu.org; Mon, 12 Aug 2019 05:08:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <damien.hedde@greensocs.com>) id 1hx6Jw-0000ft-W6
 for qemu-arm@nongnu.org; Mon, 12 Aug 2019 05:08:53 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:35384)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <damien.hedde@greensocs.com>)
 id 1hx6Jw-0000eh-FK; Mon, 12 Aug 2019 05:08:52 -0400
Received: from [172.16.11.117] (unknown [172.16.11.117])
 by beetle.greensocs.com (Postfix) with ESMTPSA id C948A96F50;
 Mon, 12 Aug 2019 09:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1565600930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XyEyBItY9y0S0ZQQ5PR5v5yKl7fQPeEvkQSNzUZSAvQ=;
 b=4K7cNLFx4ngpjpi+tXveZ8SyF1uqTH1TiaL60UrLLOX3BVC+FraEGMxbv5bdfX1tnXboVi
 IywkQ1/9eOO7m+VJa/13jvUNOuFKy0pH3GfDhUnw3tsNjwNnh2xofjoxPGa7z4ogZ6wlZu
 189cxCx6V5nEtG/psjvt0ZXgnZkoJ1M=
To: Peter Maydell <peter.maydell@linaro.org>
References: <20190729145654.14644-1-damien.hedde@greensocs.com>
 <20190729145654.14644-5-damien.hedde@greensocs.com>
 <CAFEAcA_WEf6YKwMWbE0=Qqn1NfUN-Hwr9iMk1PKe0ZxZfVfwVA@mail.gmail.com>
From: Damien Hedde <damien.hedde@greensocs.com>
Message-ID: <08f8edda-78a2-ec08-3227-ea053d69d5be@greensocs.com>
Date: Mon, 12 Aug 2019 11:08:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_WEf6YKwMWbE0=Qqn1NfUN-Hwr9iMk1PKe0ZxZfVfwVA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
 s=mail; t=1565600930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XyEyBItY9y0S0ZQQ5PR5v5yKl7fQPeEvkQSNzUZSAvQ=;
 b=xswkgvaUKGMKfY3KAU0g4DEg4kU3PPTzhl5s4lSiORG34yUgYnxmU4AHFUn3XI6UvIaFN7
 oA467LGCtL56xMDiHBc8K6LwcwDHiSmKOG0FyeNPYHxJjLXISVJyo9UOwt9kyt7qDW0Z+Z
 MIb4tMAj1GdDYLBii8AQZDnEBg1nAkU=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1565600930; a=rsa-sha256; cv=none;
 b=dt8SZc9bXpG7URIjPL6mM5ASQp94yuFWF5CsEZVNKC11rO1DAAKR38Bxfi/ZoXHvpKaHiB
 R2Ygg9NOkN3yUKqFDvYY7lZ7qpeGIKrRE3Em3eXYRQVoD2F4ThCsRVGl+3DlYHlblSiHah
 bKa0ATfxgfM61MK9Tt51ADyU2HbbZMI=
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=damien smtp.mailfrom=damien.hedde@greensocs.com
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 5.135.226.135
Subject: Re: [Qemu-arm] [PATCH v3 04/33] make Device and Bus Resettable
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
Cc: Fam Zheng <fam@euphon.net>, Collin Walling <walling@linux.ibm.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Edgar Iglesias <edgar.iglesias@xilinx.com>, Hannes Reinecke <hare@suse.com>,
 Qemu-block <qemu-block@nongnu.org>, David Hildenbrand <david@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-s390x <qemu-s390x@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Daniel P. Berrange" <berrange@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Mark Burton <mark.burton@greensocs.com>, qemu-ppc <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Pf2NIxYINUxQ



On 8/7/19 4:41 PM, Peter Maydell wrote:
> On Mon, 29 Jul 2019 at 15:58, Damien Hedde <damien.hedde@greensocs.com> wrote:
>>
>>
>> +/**
>> + * device_reset:
>> + * Resets the device @dev, @cold tell whether to do a cold or warm reset.
>> + * Base behavior is to reset the device and its qdev/qbus subtree.
> 
> What do you mean by "base behavior" here? When would this ever
> do anything else?
> 

Oops, just noticed I missed this comment.

Since I had to use a method "foreach_child" to call reset on children,
the behavior depends on it. Default implementation in base classes
follows the qdev tree. But a specialization can change that.
That's more a side-effect than a wanted feature.
