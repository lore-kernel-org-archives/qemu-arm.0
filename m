Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp7700994wrv;
        Thu, 8 Aug 2019 03:51:22 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyG6Pc+HIm8VCo08KcLgJxKhAvE3NqqL3o2GtXNwxE8MKNJMf6RupKrl8QxcSZ/M/DJBRFP
X-Received: by 2002:a0c:afac:: with SMTP id s41mr12468541qvc.184.1565261482457;
        Thu, 08 Aug 2019 03:51:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565261482; cv=none;
        d=google.com; s=arc-20160816;
        b=SfUUWgPhy5R+f6CcTALiI/QQXzBrFyPVpqLppYV4Zf1OiqA4+zzEIUXabrwfFSmUHl
         kWysQI+zarTnwI2cO6jvFWDbZv7YzzAFgarOsiEXcN894tk3zomG89mwE3NyyiElX80R
         N0c5YwyQVZb+9ANZD8O+87zaujKy4AYwxks/E+Ik82wQTzRMGOUCs6fGZCwI7uOSbufd
         5EB2Kus8b7w05vuDGLdd927jCB9+oHD0tn132LEM/3oNrqnMcnyxUw5rP2r3op5wjPd7
         AroIBsxJDfy+jLnabPxoLezZgNhmORbejxWQ9uiD09R65jRiM3RgAoaCqFmCtfpWdion
         U0iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:to:from:date;
        bh=tRP6zv5oPOUhrn9it9NbXoN5viRRa8S6pYIUp7ngLa8=;
        b=rRr0HsUQJa0kS5AgZWy5xggwTfeZDdQVcp4RNkuYRHNtHSN2twwJ7urd2oFnD52hCU
         2G9IMezahKJnro17GgmA5XGYnkhnLTFwZNczJxoJH9w29+3djXddRqcDy5W0b2hb72u/
         rYKLaI7+YVCKCEoj4g2aWbmKa++kj/N9GvgdGKFYO5sYraj/d9R/jHsg7J6Kl8BNdiQs
         qA5FTSdL9kF97g0oLCYd2mHCaqg76es4DFjxN1G4u6MVWQABVzsKcOBxM6YsQHw3ZJd9
         4VT8zFwA4dcscFea0AhVhVr2kG74er/KP/sXVU9Lv6nq3sF9752M77aV4x3Q4AM2qVmq
         Ln9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z206si33547258qka.72.2019.08.08.03.51.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Aug 2019 03:51:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hvg0v-0002zB-0V
	for alex.bennee@linaro.org; Thu, 08 Aug 2019 06:51:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37719)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <cohuck@redhat.com>) id 1hvg0q-0002z4-Bd
 for qemu-arm@nongnu.org; Thu, 08 Aug 2019 06:51:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1hvg0o-0005r7-Vo
 for qemu-arm@nongnu.org; Thu, 08 Aug 2019 06:51:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41552)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>)
 id 1hvg0o-0005ps-Q3; Thu, 08 Aug 2019 06:51:14 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D8451C0546D5;
 Thu,  8 Aug 2019 10:51:13 +0000 (UTC)
Received: from gondolin (dhcp-192-181.str.redhat.com [10.33.192.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E52E55C219;
 Thu,  8 Aug 2019 10:50:57 +0000 (UTC)
Date: Thu, 8 Aug 2019 12:50:55 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Damien Hedde <damien.hedde@greensocs.com>
Message-ID: <20190808125055.3d4b04bb.cohuck@redhat.com>
In-Reply-To: <20190729145654.14644-15-damien.hedde@greensocs.com>
References: <20190729145654.14644-1-damien.hedde@greensocs.com>
 <20190729145654.14644-15-damien.hedde@greensocs.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Thu, 08 Aug 2019 10:51:14 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
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
X-TUID: Xw5esLUkNkCQ

On Mon, 29 Jul 2019 16:56:35 +0200
Damien Hedde <damien.hedde@greensocs.com> wrote:

> Replace deprecated qdev_reset_all by device_reset_warm.
> 
> This does not impact the behavior.

Not so sure about that; see below.

> 
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
>  hw/s390x/s390-virtio-ccw.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
> index 5b6a9a4e55..1d6b966817 100644
> --- a/hw/s390x/s390-virtio-ccw.c
> +++ b/hw/s390x/s390-virtio-ccw.c
> @@ -104,7 +104,7 @@ static void subsystem_reset(void)
>      for (i = 0; i < ARRAY_SIZE(reset_dev_types); i++) {
>          dev = DEVICE(object_resolve_path_type("", reset_dev_types[i], NULL));
>          if (dev) {
> -            qdev_reset_all(dev);
> +            device_reset_warm(dev);
>          }
>      }
>  }

This resets various different devices:

- the diag288 watchdog, which does not have kids
- the flic also seems fine (both non-kvm and kvm versions)
- the sclp event facility, however, does have kids:
  - I'm a bit unsure about the sclp cpu hotplug thing; it does not have
    a ->reset function, though
  - the quiesce event does have a ->reset callback; so presumably this
    is already called in a different path
- the css bridge is basically the root of all things css; its ->reset
  function currently calls css_reset(), which resets some state of the
  css per se, but does not call down into the device tree
  - might we end up with calling some stuff twice for devices in the
    css?

Would be good if someone else from the s390 folks could take a look,
just to make sure I'm not confused here.
