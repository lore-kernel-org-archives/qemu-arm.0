Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp3145751wrw;
        Thu, 8 Nov 2018 01:11:45 -0800 (PST)
X-Google-Smtp-Source: AJdET5cXZb2Ilj78CwDK1ucvqeqJzdjJQFsQFVb7h2dpFqWakRGybEsAFNZD5PkZRdHKs+j5IzBa
X-Received: by 2002:a0c:b517:: with SMTP id d23mr353249qve.221.1541668305074;
        Thu, 08 Nov 2018 01:11:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541668305; cv=none;
        d=google.com; s=arc-20160816;
        b=PCBdVrDVWo2pMvVE6nsOzjUpI3xFmMG98bG0B/XVDPdP/VdUdjKx/a5Y/JVVNWJStg
         35JifEv6d9PciXO+I4dvLrNN7wg3RMPdK8nT73CFX6ZW3TTzNHawmg5XGbnY4H0baJUc
         aQ2VD5+4LAeQpD39rpgnXhurXsFNWWxLwxwUf+5Hgk7BLNKwArS2HQ7+kE3MoCd0s4pe
         Lwv+nYJ+m0ptv/oZqs9tntb02G76M+9vCitUNE+sH3vKKB8qY0v8e/Fcte3IjZq2orIR
         PI9dNn5WvatTc5MW56XctHVsbdogYxCUu/Tr0dSs6cDygl6dJlrHS6GVWj/vF1C4PCTL
         sBpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=06irwxxbzFBz3ZSXf2GX7U8JH7rrRIkvwDztV1jUDGk=;
        b=sfKLl7S4bfG//SeaaWyVPPlIJR2DPwWlQncRIUAmPOh7Be5khNfKEQyenJFXl3Nl3w
         861tJYlYwwNl8UsTW9gNdhhsUBM92jVF0UO9KeE5bbILEJ6my8XiwbLd9/cxti23wzHC
         haLM3a//TYGKC5W0Qx4v7rtH6ZgvkrEb8K+KlFc5JWZXrg0qsRU53BchnyzCE195Z8hS
         uZUI/PvDmVlrNp168jGL51a/f74LpGnDEhMLkEpWdntzZKa+nZumu1WXG+gou1jkHPca
         xpCwLMenZE/wU3uaM5zoDLmNyXFc80tuyyq5yu9YohVH6zH2GzdXFfOGxuBxirFlxO7a
         WBtA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y11si200335qvp.98.2018.11.08.01.11.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 08 Nov 2018 01:11:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55219 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gKgLo-0007MU-EV
	for alex.bennee@linaro.org; Thu, 08 Nov 2018 04:11:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48489)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1gKgLC-0007HD-R7
	for qemu-devel@nongnu.org; Thu, 08 Nov 2018 04:11:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1gKgL9-0006M8-OY
	for qemu-devel@nongnu.org; Thu, 08 Nov 2018 04:11:06 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52280)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1gKgL0-0005f8-Vn; Thu, 08 Nov 2018 04:10:55 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C1E67C02833D;
	Thu,  8 Nov 2018 09:10:36 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E97A604D9;
	Thu,  8 Nov 2018 09:10:08 +0000 (UTC)
Date: Thu, 8 Nov 2018 10:10:05 +0100
From: Andrew Jones <drjones@redhat.com>
To: Peng Hao <peng.hao2@zte.com.cn>
Message-ID: <20181108091005.4rovcyb7sdvfxz6g@kamzik.brq.redhat.com>
References: <1540663650-106694-1-git-send-email-peng.hao2@zte.com.cn>
	<1540663650-106694-5-git-send-email-peng.hao2@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1540663650-106694-5-git-send-email-peng.hao2@zte.com.cn>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Thu, 08 Nov 2018 09:10:37 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH V5 4/5] hw/arm/virt: Use the pvpanic device
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, philmd@redhat.com,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8YSbDhoCkUZQ

On Sun, Oct 28, 2018 at 02:07:29AM +0800, Peng Hao wrote:
> add pvpanic device in aarch64 virt machine.

Why only aarch64 and not also arm?

Thanks,
drew
