Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp1151541wrq;
        Fri, 13 Jul 2018 14:53:44 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfHJVGahF6iyvZxkIt6gYuR4RrQL2fe5r6oGpwUD4+cUvRLJ+qgietbTxTdi42n993I684P
X-Received: by 2002:a37:8b06:: with SMTP id n6-v6mr7205398qkd.166.1531518824801;
        Fri, 13 Jul 2018 14:53:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531518824; cv=none;
        d=google.com; s=arc-20160816;
        b=A+ZHaeMBxFiANcPlC5vCHpY47UqYbFN1Bu75v0qLL+2JJgsxX7XkFwhs4yJ1sf/wn9
         UUFxPPZj0IotNWY6jtKtaJql3XckXeZqioHmTsaZ8w/xVMOZKxsLufqzf9rXFX7Fc3A0
         5Jp9IMlolPZslBRkJutcCs2nTNDyc2xS7AWrz+2iHNAJ960ExshwBmDki35nRWeDLUJv
         qbuCy4+jb0LpPYyeFHYuDR+lEVzb7HxJl83EJt094Pe/GCgPCH0HynlzGGTQz2te1XL2
         TG9S1ffnSYufMBQy5VYIWJN7t4BP/0am9BNjH+05nd7F9Aq5K8UfGB8PDBOMuU4Vr1G2
         OavQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=T/fY1iuJgvtdV7dxem/i01EgyJbusP0Tvcs6iOvfzVg=;
        b=UHj7oaAwxCFvfHb/wrpPag2D9HCER81EA8jRoZqeyJT7mTjgJXwANTTuAzfqDa/73I
         zOT34W4316k9E5GMy/vA+ENGGC21ZTIcxOX5a6fg+bCO1aH0JmuC40Y3hdxlDojKxVYs
         ePx3JEnZqaLAG4YrrR+7Bm2VNPgYodrY6XJ0DkE97tfaL0Wy3iCEG35sJeVLsmu5iaRw
         mRLloRgevfCuZWwUsTYTW74sXPvF8UvHi6hvNPbAsBYEfrOO1AbzSH2dZXPf/lf2ZlkY
         5uxoAshG17YHV6h2cqjq0HtlJt4u2lE7HP5dloA3/HZ6UWb2vnWFRrFq9YwhCVaeZLKN
         IFBg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l190-v6si1615555qkf.218.2018.07.13.14.53.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 13 Jul 2018 14:53:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39291 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fe60W-0005YK-Ck
	for alex.bennee@linaro.org; Fri, 13 Jul 2018 17:53:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54327)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1fe60O-0005Xx-Gg
	for qemu-arm@nongnu.org; Fri, 13 Jul 2018 17:53:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1fe60L-0002NS-F7
	for qemu-arm@nongnu.org; Fri, 13 Jul 2018 17:53:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50554)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1fe60L-0002N9-8i; Fri, 13 Jul 2018 17:53:33 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0331E32B677;
	Fri, 13 Jul 2018 21:53:32 +0000 (UTC)
Received: from localhost (ovpn-116-12.gru2.redhat.com [10.97.116.12])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 56B105C25C;
	Fri, 13 Jul 2018 21:53:31 +0000 (UTC)
Date: Fri, 13 Jul 2018 18:53:29 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Message-ID: <20180713215329.GZ31657@localhost.localdomain>
References: <1531470464-21522-1-git-send-email-thuth@redhat.com>
	<1531470464-21522-9-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1531470464-21522-9-git-send-email-thuth@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Fri, 13 Jul 2018 21:53:32 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2 08/16] hw/arm/msf2-soc: Fix introspection
 problem with the "msf2-soc" device
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Jo8YHvYMf31V

On Fri, Jul 13, 2018 at 10:27:36AM +0200, Thomas Huth wrote:
> Valgrind currently reports a problem when running QEMU like this:
> 
> echo "{'execute':'qmp_capabilities'} {'execute':'device-list-properties'," \
>  "'arguments':{'typename':'msf2-soc'}}" \
>  "{'execute': 'human-monitor-command', " \
>  "'arguments': {'command-line': 'info qtree'}}" | \
>  valgrind -q aarch64-softmmu/qemu-system-aarch64 -M none,accel=qtest -qmp stdio
> [...]
> ==23097== Invalid read of size 8
> ==23097==    at 0x6192AA: qdev_print (qdev-monitor.c:686)
> ==23097==    by 0x6192AA: qbus_print (qdev-monitor.c:719)
> [...]
> 
> Use the new sysbus_init_child_obj() function to make sure that the child
> objects are cleaned up correctly when the parent gets destroyed.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

-- 
Eduardo
