Received: by 10.25.77.65 with SMTP id a62csp1338964lfb;
        Mon, 30 Jan 2017 01:16:09 -0800 (PST)
X-Received: by 10.55.160.206 with SMTP id j197mr20507182qke.249.1485767769762;
        Mon, 30 Jan 2017 01:16:09 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p33si9132987qtb.68.2017.01.30.01.16.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 30 Jan 2017 01:16:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58742 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cY84F-0007ad-3v
	for alex.bennee@linaro.org; Mon, 30 Jan 2017 04:16:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59008)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <quintela@redhat.com>) id 1cY83j-0007aC-5b
	for qemu-devel@nongnu.org; Mon, 30 Jan 2017 04:15:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <quintela@redhat.com>) id 1cY83i-0005VB-B9
	for qemu-devel@nongnu.org; Mon, 30 Jan 2017 04:15:35 -0500
Received: from mx1.redhat.com ([209.132.183.28]:59586)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <quintela@redhat.com>)
	id 1cY83b-0005La-MU; Mon, 30 Jan 2017 04:15:27 -0500
Received: from smtp.corp.redhat.com (int-mx16.intmail.prod.int.phx2.redhat.com
	[10.5.11.28])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CF3887E9DC;
	Mon, 30 Jan 2017 09:15:26 +0000 (UTC)
Received: from localhost (ovpn-116-156.ams2.redhat.com [10.36.116.156])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 47DDCBEDAE;
	Mon, 30 Jan 2017 09:15:26 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <1485422381-29019-4-git-send-email-eric.auger@redhat.com> (Eric
	Auger's message of "Thu, 26 Jan 2017 10:19:40 +0100")
References: <1485422381-29019-1-git-send-email-eric.auger@redhat.com>
	<1485422381-29019-4-git-send-email-eric.auger@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.1 (gnu/linux)
Date: Mon, 30 Jan 2017 10:15:13 +0100
Message-ID: <87vasw29jy.fsf@emacs.mitica>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.74 on 10.5.11.28
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Mon, 30 Jan 2017 09:15:26 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [RFC 3/4] hw/intc/arm_gicv3_its: Implement state
 save/restore
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: quintela@redhat.com
Cc: peter.maydell@linaro.org, drjones@redhat.com, vijay.kilari@gmail.com,
	qemu-devel@nongnu.org, peterx@redhat.com,
	Vijaya.Kumar@cavium.com, qemu-arm@nongnu.org,
	shannon.zhao@linaro.org, dgilbert@redhat.com,
	christoffer.dall@linaro.org, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nItSYjbzgPZ0

Eric Auger <eric.auger@redhat.com> wrote:
> We need to handle both registers and ITS tables. While
> register handling is standard, ITS table handling is more
> challenging since the kernel API is devised so that the
> tables are flushed into guest RAM and not in vmstate buffers.
>
> Flushing the ITS tables on device pre_save() is too late
> since the guest RAM had already been saved at this point.
>
> Table flushing needs to happen when we are sure the vcpus
> are stopped and before the last dirty page saving. The
> right point is RUN_STATE_FINISH_MIGRATE but sometimes the
> VM gets stopped before migration launch so let's simply
> flush the tables each time the VM gets stopped.
>
> For regular ITS registers we just can use vmstate pre_save
> and post_load callbacks.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

Hi


> + * vm_change_state_handler - VM change state callback aiming at flushing
> + * ITS tables into guest RAM
> + *
> + * The tables get flushed to guest RAM whenever the VM gets stopped.
> + */
> +static void vm_change_state_handler(void *opaque, int running,
> +                                    RunState state)
> +{
> +    GICv3ITSState *s = (GICv3ITSState *)opaque;

Cast is unneeded.

> +
> +    if (running) {
> +        return;
> +    }
> +    kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_ITS_TABLES,
> +                      0, NULL, false);

As you are adding it to do everytime that we stop the guest, how
expensive/slow is that?

Thanks, Juan.
