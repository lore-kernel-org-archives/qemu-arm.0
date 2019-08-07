Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6680999wrv;
        Wed, 7 Aug 2019 08:21:14 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxnf5LnheTyZSg6Etz6ApkG7vg3KMOdsvggKzY9X64z59jNnSE1Nc2kMoVzj35mORzDapr4
X-Received: by 2002:a17:906:82c4:: with SMTP id a4mr9048621ejy.178.1565191274344;
        Wed, 07 Aug 2019 08:21:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565191274; cv=none;
        d=google.com; s=arc-20160816;
        b=NoxAVWqLd5G9Wf+ZzrwGbwv0E+EPchppZk8BvSp8kZGWiMSNq7i/K8A89gYEwNkquj
         O/YilLVYV7YzgjAcxxEq18nUT8y5MDhn8WrhdMiSc9JcJS8FcVJODPQqx4GM7tStKPuj
         G/WTfdCzf0m3yuU3ZLAEW4bCi/V1kXGJ4/UEPVp1BimhtW8v4F7SdRR1fpqeBxxKwfQs
         hugnotnptCgDVSrTA0DeQRAYnV8Qq8ZR2/3RzLSOCFePcKq+9uWPv7Gf/WRtEaeen6Ns
         o644NuxSeIlwl4LXGMnd0I+i6Ik/D7LJlVnaXZp0WjTTAv6dkH22UiOkCsDYlt1Mjn2S
         GAWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wMCZbVGi32cLcaIU8X3prpRc8h3j08xiAQ7zMlrbE5Y=;
        b=AykuciPzje+lm4El9ug7VVfj9msv8t12uA+m/o3CLdkB7isoi4z5eP4o8HD3aj4FJ9
         NasUIWWA88biTcrBvqC0PqPFAwkdoKQ4sqv8of+SBgbFtbeTmFmMKPlwCATeFg2q2ge+
         QJkTcozc50Goc6vBSc86jZkiILKe+I0bc0BuKbhg0PAYUh+zLDJrWQwnNaFY1WMif/15
         /85nk6ZCaGWURnCWyU0NOa57QInJNTjNnazmkAK3+rkw4hnQXbwYENBYAPyW3jeXKeRm
         r/R5Cs+qJvUrVK8wqu3gy4095FAh2CHJjaAzdiOYJz3DYb3bANMPB8+w9aw+n3FwKlID
         EbvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Xs8waVsU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id oq6si30000775ejb.160.2019.08.07.08.21.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Aug 2019 08:21:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Xs8waVsU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hvNkX-0008VO-CL
	for alex.bennee@linaro.org; Wed, 07 Aug 2019 11:21:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52331)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hvNkQ-0008Tl-Mv
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 11:21:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hvNkP-0008PK-JI
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 11:21:06 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:44790)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hvNkP-0008Ok-Ew
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 11:21:05 -0400
Received: by mail-ot1-x341.google.com with SMTP id b7so55586007otl.11
 for <qemu-arm@nongnu.org>; Wed, 07 Aug 2019 08:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wMCZbVGi32cLcaIU8X3prpRc8h3j08xiAQ7zMlrbE5Y=;
 b=Xs8waVsUIH9jcHFuq5XEc/S+F28sJjvMFQWWCCIbIbEZzb3QpFGXMOeqynFvZBL+8c
 THhtkyLDHo93i9+r7RkLLjTlPm57K6ei5q7HIH9QHjYD+3vXh9kYXQ+lqMqlUCn6971r
 OSBaJpxTXA4L4prEC5cqkpxMrelHHQ/aNeU7lTVJLdRgR3m1PkUrnMgsLOG9iDT8oF62
 y+Hwyb1kSA0vIinkE3eyNZim3VanWj1xEJPonrVbdyleaX7wPn4BiwAS/8yUkc9ojgct
 UjGXVMe2YyfWFxsSXZjvm3OX27/69IKhLyXdNpFSf632n+wljFVlIvjTUU2sWqByyW+c
 2wrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wMCZbVGi32cLcaIU8X3prpRc8h3j08xiAQ7zMlrbE5Y=;
 b=RfZy8TpknK7Ley9oe9hMN+4SipjVx8gaq8zvuatrdwSeLeQfMne4ig6immMHfuq89M
 eTi+Ju471FgROkwYqOcIDZ4/CZgDUZdgcIZVzv7qtanfjfB+aCls267IenxK1Me/sH1+
 lysBZ+/TqyMGDbbbg7ssXwEpeLRfz6pKaLUhWSdMabw89L+bJ8Y5wmH71GLVen4Jj2pz
 0cS0eT9yLBNQjGeDsBvd7FP3sHxAn1xYAANFSSKP8+S70jfCB/0owfWS6qpenkcBjh1/
 lylKI0ajSKQFc77DIZx0AbYIG7ZerIoa10poC/CYUoibhI2UYQNqlooiVCQmJmR45OVy
 AudQ==
X-Gm-Message-State: APjAAAWo1/lQltnEUcrmXthyGd/cLgpcnLjvGiKS+CBgn78FddStkSv4
 5OZ6lj/Z6tUo7Xx7Elf0Sii64npKUHDmb+RoIQiwYA==
X-Received: by 2002:a5e:db0a:: with SMTP id q10mr708925iop.168.1565191264638; 
 Wed, 07 Aug 2019 08:21:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190729145654.14644-1-damien.hedde@greensocs.com>
 <20190729145654.14644-11-damien.hedde@greensocs.com>
In-Reply-To: <20190729145654.14644-11-damien.hedde@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 7 Aug 2019 16:20:53 +0100
Message-ID: <CAFEAcA_uKg7iBJ-9yANEaHyS4zqNaESUG0F0Fg20T-DKZ2bofQ@mail.gmail.com>
To: Damien Hedde <damien.hedde@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-arm] [PATCH v3 10/33] vl.c: remove qbus_reset_all
 registration
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
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-s390x <qemu-s390x@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Daniel P. Berrange" <berrange@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Mark Burton <mark.burton@greensocs.com>, qemu-ppc <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: u7Nir6fU0/rc

On Mon, 29 Jul 2019 at 15:59, Damien Hedde <damien.hedde@greensocs.com> wrote:
>
> Replace deprecated qbus_reset_all by resettable_reset_cold_fn for
> the sysbus reset registration.
> This does not impact the behavior.
>
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
>  vl.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/vl.c b/vl.c
> index b426b32134..5a465c8236 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -4421,7 +4421,11 @@ int main(int argc, char **argv, char **envp)
>
>      /* TODO: once all bus devices are qdevified, this should be done
>       * when bus is created by qdev.c */
> -    qemu_register_reset(qbus_reset_all_fn, sysbus_get_default());
> +    /*
> +     * TODO: when we have a main reset container/domain object, use
> +     * it to fully benefit from multi-phase reset
> +     */

Let's be a bit more specific with the todo comment while the
detail is fresh in our minds:

/*
 * TODO: If we had a main 'reset container' that the whole system
 * lived in, we could reset that using the multi-phase reset
 * APIs. For the moment, we just reset the sysbus, which will cause
 * all devices hanging off it (and all their child buses, recursively)
 * to be reset. Note that this will *not* reset any Device objects
 * which are not attached to some part of the qbus tree!
 */

> +    qemu_register_reset(resettable_reset_cold_fn, sysbus_get_default());
>      qemu_run_machine_init_done_notifiers();
>
>      if (rom_check_and_register_reset() != 0) {
> --
> 2.22.0

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
