Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1925727wru;
        Mon, 16 Jul 2018 14:07:34 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpe/KbvngZ80J/Scyln7YMur79pHE6IGULJDk75d/rf0P+ykypR0CKjxuExlekW9qc8LkEB+
X-Received: by 2002:a0c:e053:: with SMTP id y19-v6mr19779438qvk.230.1531775254037;
        Mon, 16 Jul 2018 14:07:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531775254; cv=none;
        d=google.com; s=arc-20160816;
        b=kpguOV3lQgSg+Jh/nX3f7EFcUFe/16Pn65hy9AWRbJQIQTP8bPU+VcndBFOI7MiBgJ
         9s6T4iwVLzBn7ZqrP0xVyw98vVbxVnQa97uF/+Rh2+1wS89F4AJWKdGt6PXoca0KZMNz
         fkFw1hzzYAuaRAH0nXshoghf+cyq1jnmXcN0RT2tqRizzW4f19BrHq60Dr5CIzpBWjid
         G/MKwoAxJeCVb17Lbv+2Ti5lGYk1SNSen7B+clHFxuHO3oI7/2RjHWJLPo3LVdlqOMU4
         fGRGD5VdUwcFvKgVN8BUsb/ynDM5HM81dTPhFzk2CCOWIk3EpJ5NXUzMH6pwtN3jUOXS
         rLRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=BcPbgBbKgtrVJE08hHYDwD/8yM0qLJDSgjWPbOoE3gM=;
        b=dIHRJlWhuq/w5Y52HM3J3dqrExx3ZBV2l4mpij+q8poY/1G2/ZbsOlix8DbXjKJXMC
         bJTcWXJPmYaZq+a+CvJpxfJyCkp/7T9jKJLLVdaBvIaqgKEMYTUiKF2pAxZYNvTQhK4C
         Avj6obxMKLARkjMyOggN5DZwrF29oVM93jYQo9P+8bignZbamTrXFCksddPlpE8ob4pf
         EI1p9QlcyO9QdujlvhYEs3Y3HJyya30+6/em+bQl5SZw0VHeo7TK3LvuLeZF0s13TCBn
         mK3F4mvdSUlVf4mL+gXh3f4ipnMj78bCvxgcI+Q0bTWX2UZaSyXz9VRwD+lvbGgZYrWK
         wBcw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r25-v6si543038qve.261.2018.07.16.14.07.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 Jul 2018 14:07:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53951 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ffAiT-0002ii-H0
	for alex.bennee@linaro.org; Mon, 16 Jul 2018 17:07:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48157)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1ffAiH-0002fk-Oa
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 17:07:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1ffAiE-0005W7-KU
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 17:07:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39578)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1ffAiE-0005Vd-Ds; Mon, 16 Jul 2018 17:07:18 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9D201307CF31;
	Mon, 16 Jul 2018 21:07:17 +0000 (UTC)
Received: from localhost (ovpn-116-6.gru2.redhat.com [10.97.116.6])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 216B84522;
	Mon, 16 Jul 2018 21:07:16 +0000 (UTC)
Date: Mon, 16 Jul 2018 18:07:15 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Message-ID: <20180716210715.GT31657@localhost.localdomain>
References: <1531745974-17187-1-git-send-email-thuth@redhat.com>
	<1531745974-17187-16-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1531745974-17187-16-git-send-email-thuth@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Mon, 16 Jul 2018 21:07:17 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v3 15/17] hw/arm/stm32f205_soc: Fix
 introspection problem with 'stm32f205-soc' device
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
X-TUID: L/s0H1YD9ORc

On Mon, Jul 16, 2018 at 02:59:32PM +0200, Thomas Huth wrote:
> Valgrind complains:
> 
> echo "{'execute':'qmp_capabilities'} {'execute':'device-list-properties'," \
>  "'arguments':{'typename':'stm32f205-soc'}}" \
>  "{'execute': 'human-monitor-command', " \
>  "'arguments': {'command-line': 'info qtree'}}" | \
>  valgrind -q aarch64-softmmu/qemu-system-aarch64 -M none,accel=qtest -qmp stdio
> [...]
> ==28531== Invalid read of size 8
> ==28531==    at 0x6185BA: qdev_print (qdev-monitor.c:686)
> ==28531==    by 0x6185BA: qbus_print (qdev-monitor.c:719)
> ==28531==    by 0x452B38: handle_hmp_command (monitor.c:3446)
> [...]
> 
> Fix it with the new sysbus_init_child_obj() function.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

-- 
Eduardo
