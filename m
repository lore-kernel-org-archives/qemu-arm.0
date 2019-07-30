Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp4404009wrv;
        Tue, 30 Jul 2019 06:42:37 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw0oqWqRqfoVp9hL4yimnfZtc4ciwg4cUVUvFMSh+NNSvbQOUNBshf0CpA0beXq6wHIoOaV
X-Received: by 2002:a50:f98a:: with SMTP id q10mr101699529edn.267.1564494157856;
        Tue, 30 Jul 2019 06:42:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564494157; cv=none;
        d=google.com; s=arc-20160816;
        b=IMbn2AUbyu0ZR3KRjW5mfVFcOdIhfB/VtQ12bqxNC2bJWPC3wluDK8o3JW1g6Qk2NG
         OMgaT+pz3UV+WBRPuE/eV2kFbMEFa242fd18ZZlWBoDQdoadgDPlQcwa73N1cPYgy4TR
         iIzhN/cVw3lbfPJIVWAY0UGenAsavBo8PRcOgLVhxJpm1yc9GT5xClSi7tS6hRWfH7Lj
         ClVG2180hZUQqz7DWE0rc+qkl9LUMDMrkPNR6hCDNzYXTWv/5oMLUL3qpDrFBSBSflX9
         odtRQoOaGiM+qHb8ktcUDYN06vY1qCeH3SKzJyyR/7vQSirR11BEyxLPYUYB7hKGy1hR
         fm9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:to:from:date;
        bh=JrXjWDzHHsfyNgtx4wrpkgzcHajMHsjbFV+SFA71UGQ=;
        b=cCM8+SnMw8s62bzfkcp1in6hmPjWOBBSSWvDkBK+P3XJtoRTdZRS1WhcLynzf1fixZ
         YeivRwshp/Jx11y01QkQdYyQY9R9DITuB832mdyFt5ewR/NTKQpJ+JRH9c+rrJFLCMf9
         2no4IgIQVUtDKvoC8qrRTUj7/IKrD6+6fu42QZwrPY/tcNZUDQA0tB9b81GKPo0mkRIi
         xQ5JbE2eJ3FeY7K5/L/3CUXWwLw4ALXck+0TaoYRhj76KB3R5NFw3XS0pFeXfgjKEevD
         xgzxvpdy/XeFid5/XXynKFYITsqZx/mMoeLk+FfqdHLAN5ef2I2is4VH7GdSiMVdmqTh
         N6lA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s45si20021681edd.112.2019.07.30.06.42.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jul 2019 06:42:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hsSOi-0007HZ-VH
	for alex.bennee@linaro.org; Tue, 30 Jul 2019 09:42:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51539)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <cohuck@redhat.com>) id 1hsSOd-0007E5-23
 for qemu-arm@nongnu.org; Tue, 30 Jul 2019 09:42:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1hsSOc-0007sa-0c
 for qemu-arm@nongnu.org; Tue, 30 Jul 2019 09:42:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38420)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>)
 id 1hsSOb-0007sD-RS; Tue, 30 Jul 2019 09:42:29 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3D27F3092647;
 Tue, 30 Jul 2019 13:42:28 +0000 (UTC)
Received: from gondolin (dhcp-192-232.str.redhat.com [10.33.192.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ABFF25D9E2;
 Tue, 30 Jul 2019 13:42:11 +0000 (UTC)
Date: Tue, 30 Jul 2019 15:42:09 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Damien Hedde <damien.hedde@greensocs.com>
Message-ID: <20190730154209.2049f10a.cohuck@redhat.com>
In-Reply-To: <20190729145654.14644-2-damien.hedde@greensocs.com>
References: <20190729145654.14644-1-damien.hedde@greensocs.com>
 <20190729145654.14644-2-damien.hedde@greensocs.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Tue, 30 Jul 2019 13:42:28 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v3 01/33] Create Resettable QOM interface
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
X-TUID: fIdgBooSTAM5

On Mon, 29 Jul 2019 16:56:22 +0200
Damien Hedde <damien.hedde@greensocs.com> wrote:

(...)

> +/*
> + * ResettableClass:
> + * Interface for resettable objects.
> + *
> + * The reset operation is divided in several phases each represented by a
> + * method.
> + *
> + * Each Ressetable must maintain a reset counter in its state, 3 methods allows
> + * to interact with it.
> + *
> + * @phases.init: should reset local state only. Takes a bool @cold argument
> + * specifying whether the reset is cold or warm. It must not do side-effect
> + * on others objects.

I'm having a hard time figuring out what a 'cold' or a 'warm' reset is
supposed to be... can you add a definition/guideline somewhere?

> + *
> + * @phases.hold: side-effects action on others objects due to staying in a
> + * resetting state.
> + *
> + * @phases.exit: leave the reset state, may do side-effects action on others
> + * objects.
> + *
> + * @set_cold: Set whether the current reset is cold or warm. Return the
> + * previous flag value. Return value has no meaning if @get_count returns
> + * a zero value.

Same here.

> + *
> + * @set_hold_needed: Set hold_needed flag. Return the previous flag value.
> + *
> + * @get_count: Get the current reset count
> + * @increment_count: Increment the reset count, returns the new count
> + * @decrement_count: decrement the reset count, returns the new count
> + *
> + * @foreach_child: Executes a given function on every Resettable child.
> + * A child is not a QOM child, but a child a reset meaning.
> + */

(...)
