Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp8905218wrv;
        Fri, 9 Aug 2019 01:31:57 -0700 (PDT)
X-Google-Smtp-Source: APXvYqycZ+aNb4bJm4og1D8YhFKuNxjiaWlytPKyex8ALyApeH2Ut/krPTYU7RAqdQlc51/G1z9L
X-Received: by 2002:a0c:983b:: with SMTP id c56mr17251149qvd.131.1565339517109;
        Fri, 09 Aug 2019 01:31:57 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a30si2429452qvh.197.2019.08.09.01.31.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Aug 2019 01:31:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=kI0P18Ow;
       arc=fail (signature failed);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hw0JY-0004jt-Lh
	for alex.bennee@linaro.org; Fri, 09 Aug 2019 04:31:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38459)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <damien.hedde@greensocs.com>) id 1hw0JN-0004jX-Eu
 for qemu-arm@nongnu.org; Fri, 09 Aug 2019 04:31:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <damien.hedde@greensocs.com>) id 1hw0JM-0002Gw-Fl
 for qemu-arm@nongnu.org; Fri, 09 Aug 2019 04:31:45 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:47842)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <damien.hedde@greensocs.com>)
 id 1hw0JL-0002FZ-V1; Fri, 09 Aug 2019 04:31:44 -0400
Received: from [172.16.11.117] (unknown [172.16.11.117])
 by beetle.greensocs.com (Postfix) with ESMTPSA id E56C296F50;
 Fri,  9 Aug 2019 08:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1565339501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d89/MwLkkDE59gX8BiGwIUD9xyE3bWVMZLThelBrqw0=;
 b=kI0P18Ow3AsrDNENGsNbKjsOWiAR3EAvCOgctgAdcXCFVCPjkOnZ5lMvkgDHBh2UYbL8uC
 v5gi5OjESI3FLTRExcBfsw0DhkSlFFYztUxPakPoqqHmRY97Kse7DPFYaWpZ59HuW7KpAB
 S7eGb0LPG7IptpRkJ+8DmNhCiCjDBZU=
To: Cornelia Huck <cohuck@redhat.com>
References: <20190729145654.14644-1-damien.hedde@greensocs.com>
 <20190729145654.14644-15-damien.hedde@greensocs.com>
 <20190808125055.3d4b04bb.cohuck@redhat.com>
From: Damien Hedde <damien.hedde@greensocs.com>
Message-ID: <83b94864-c901-a1e1-3bee-aed842250588@greensocs.com>
Date: Fri, 9 Aug 2019 10:31:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190808125055.3d4b04bb.cohuck@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
 s=mail; t=1565339501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d89/MwLkkDE59gX8BiGwIUD9xyE3bWVMZLThelBrqw0=;
 b=MgE0lhUPM6BPh6i+QclPJOX8JiT7PJJnGLsVKvEqbEW5JlFVEKOiKX+yTQkDOtIRpNrwys
 XWGh+nEZ+roublx0m2Su10ucOJVFN6FfStgCyd+yzMPuqdk87bkc0jaluKbvxVxAphLPgG
 yYhUECiQeirQ3oMPhiIZj4Ns09V8FIk=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1565339501; a=rsa-sha256; cv=none;
 b=3KI6cyl+k4O2gRW9vves9pdAAIoJOj4SEpDbO09Y5mkP/HZH4tYtI3l2WwPs0WJ6pyBs9+
 TZJK5ncKO4HcHWVocrkYZujLhmmOVrUjRJNv1Yb/7A6b+c0ibvk5LjYd9W43BZrQvbXpgm
 zWxZFR2b2dpjFrhm3ag0H+NFDbQNFxs=
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=damien smtp.mailfrom=damien.hedde@greensocs.com
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 5.135.226.135
Subject: Re: [Qemu-arm] [PATCH v3 14/33] hw/s390x/s390-virtio-ccw.c: remove
 qdev_reset_all call
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
X-TUID: S3QHdHxZUF9H



On 8/8/19 12:50 PM, Cornelia Huck wrote:
> On Mon, 29 Jul 2019 16:56:35 +0200
> Damien Hedde <damien.hedde@greensocs.com> wrote:
> 
>> Replace deprecated qdev_reset_all by device_reset_warm.
>>
>> This does not impact the behavior.
> 
> Not so sure about that; see below.

In this case, qdev_reset_all is used. The qdev subtree is already reset.
device_reset_* does keep the same children-then-parent call order for
the legacy reset method. This is why the behavior is unchanged.

I will add this point in the commit message of this patch (and also in
other qdev/qbus_reset_all replacement patches) so it will be more clear.

--
Damien
