Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp8972677wrv;
        Fri, 9 Aug 2019 02:47:38 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx4qtv25JQuB2qa0ZQLpWF5tW1mpSWmooJwTI4DK2F63lZgnXECfA6bcHoGxQCmN1UKUgq3
X-Received: by 2002:a05:6214:1191:: with SMTP id t17mr16548000qvv.98.1565344058203;
        Fri, 09 Aug 2019 02:47:38 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w8si5738880qta.357.2019.08.09.02.47.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Aug 2019 02:47:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=bhbsPiBO;
       arc=fail (signature failed);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hw1Un-0004V2-Oe
	for alex.bennee@linaro.org; Fri, 09 Aug 2019 05:47:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52705)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <damien.hedde@greensocs.com>) id 1hw1Uj-0004Ti-Cr
 for qemu-arm@nongnu.org; Fri, 09 Aug 2019 05:47:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <damien.hedde@greensocs.com>) id 1hw1Uh-0002J1-Gn
 for qemu-arm@nongnu.org; Fri, 09 Aug 2019 05:47:33 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:50342)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <damien.hedde@greensocs.com>)
 id 1hw1Ue-0002Fp-OD; Fri, 09 Aug 2019 05:47:29 -0400
Received: from [172.16.11.117] (unknown [172.16.11.117])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 84A1996F50;
 Fri,  9 Aug 2019 09:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1565344044;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t9M1Nz6sxUlKbZ1HX+3au/ichE/NEuolDV2QNeNMOGI=;
 b=bhbsPiBOb5JJx67zFgJcpUPc7IpmkDXLLVHtEf3X2mFvaFcMnrpj9kd70dDTGLYI5n8Mfs
 eHHDtauS68u4r0oMFZ9BHpP/VXQ3Gx15FmXBBy7Re7m2/btNQd2/YPa7VXt1smvI0+nuKP
 1KaE79OdSGsixzJQxhcBXCHa+IM8g5w=
To: Peter Maydell <peter.maydell@linaro.org>
References: <20190729145654.14644-1-damien.hedde@greensocs.com>
 <20190729145654.14644-13-damien.hedde@greensocs.com>
 <CAFEAcA95fPLh=KgYFgtCxrXR5Vm89-=2fPq-psYYiiJ84j4qvQ@mail.gmail.com>
From: Damien Hedde <damien.hedde@greensocs.com>
Message-ID: <6ae5b161-46b4-9587-773b-62485b4b32d1@greensocs.com>
Date: Fri, 9 Aug 2019 11:47:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA95fPLh=KgYFgtCxrXR5Vm89-=2fPq-psYYiiJ84j4qvQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
 s=mail; t=1565344044;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t9M1Nz6sxUlKbZ1HX+3au/ichE/NEuolDV2QNeNMOGI=;
 b=LPnbzZ5kXxChttQ540gN9i/wfcIucjUXhsBAji+Qzsgm0qkXn9BcMJGGYTQ3MKVj83ZL25
 jrYy6ZJ1ohkPWnpQRlqZjApTmIJCw/i0bpc5UlS7s7IHxUbEdd13yUEdOO+XKruB7skhxG
 rO8HOiTq3UJWl/MDENxp9T3MytdPdtw=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1565344044; a=rsa-sha256; cv=none;
 b=TXC5ixYIOu5VjsIyqvXroq70LAYWLs3HG6/Tz9oJu7S7PUPsC3EtZggJiqZDe5yY0ewX+i
 vgs+LAPkQwDjAcrww/rrXWIhiUQP4iA5X3VTKoMgXulg+CUVLdHMere/oMvfAWK3yG/dt0
 p2vStFJ/vJFlOj0IXUGxw5bBKUExRsE=
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=damien smtp.mailfrom=damien.hedde@greensocs.com
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 5.135.226.135
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 12/33] hw/pci/: remove
 qdev/qbus_reset_all call
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
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-s390x <qemu-s390x@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>,
 "Daniel P. Berrange" <berrange@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Mark Burton <mark.burton@greensocs.com>, qemu-ppc <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: j77R2Voz9W7r



On 8/7/19 5:31 PM, Peter Maydell wrote:
> On Mon, 29 Jul 2019 at 15:59, Damien Hedde <damien.hedde@greensocs.com> wrote:
>>
>> Replace deprecated qdev/bus_reset_all by device/bus_reset_warm.
>>
>> This does not impact the behavior.
>>
>> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> 
> I'll come back to patches 12-28 later. They're all ok
> in principle, we just need to check that in each individual
> case:
>  * we've made the right choice of cold vs warm reset
>  * we're ok to switch to 'reset including children' from
>    the legacy 'reset not including children' semantics

I'm working on a patch reroll to fix what's been reviewed so far. Should
I put aside the patches 12-28 for now ? They could be part of 1 or 2
separate following series or I can re-add them later on when we agree on
the api.

--
Damien
