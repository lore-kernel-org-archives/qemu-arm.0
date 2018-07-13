Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp1134712wrq;
        Fri, 13 Jul 2018 14:31:26 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdJh/rfxwYtII2nLilRR+PzV1gEHmXkHLDsSd1A7NJQKyUzUt2+BjRcXAPXG1PBRu9uOixd
X-Received: by 2002:ac8:1a46:: with SMTP id q6-v6mr7570217qtk.5.1531517486191;
        Fri, 13 Jul 2018 14:31:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531517486; cv=none;
        d=google.com; s=arc-20160816;
        b=p+FYx0AFIIwNnoEiMd9XC7fFam6CoaNMJT8HRPEjHVx2+ive/UJtqGK3rPdC4WzTFN
         zvOWeVrZXx5sAzYFU6wpLcnycX/4XyTyRtiHsM/6S23jsLs/Bd9NXoMZYn81FqJ31QdV
         koWkUyDqanTLTNChg3+vQNjVu2S2IMci0Md6G4nCgz5jycMixfANW7ZK6Lzu4CkYEUa3
         tWzh0jf7+N0o6GCG0qKEXbu2NWfwkQ5aW7k79bWrMqxmsxRR3DniGDwTNOF4ibrAzSep
         DSzpscb77Em97sCsOMe2sLVO41vjQRKIQ9mKkM37M/EkiUxFvS9sGkMhOpwWFy9ENwoN
         FSag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=zrjl5gXOr/EXmV0OCVAPIRMRjLXCE5rjZwBrc+BeQFU=;
        b=OFPFIPjaRV/eplwBTNZeHK1p14yHrLSstEH6bZE7vS3xq8J8u4V6i+8ugbkyVO25en
         yOGT57XCrM4EdSUsU2raQ9O4HPUS4B9g4DAitqmvaGxHpRtaZoyO0x3fs9tDd8TU3xRN
         n+a1meTln59agcaJLLLy6zfGSMZFH/F8N9FkWrDPTPIeOHNTZdzXdXVAh96+VdzE0AIc
         tSIlZICtN46leY9AvH9fTrGiQSpiwVnI+O0WO1PzMgE9Al5x34xQiU5Q24AUcBp5L84i
         yq9XeHJWKQTpsAAWnZJeGlOgL5i/9y1v5DCisgdF3KGvyjM0E6Bf48TluGiiMNEH3VMX
         lDTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r185-v6si13498345qkf.310.2018.07.13.14.31.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 13 Jul 2018 14:31:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39235 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fe5ev-0000X5-Mn
	for alex.bennee@linaro.org; Fri, 13 Jul 2018 17:31:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49515)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1fe5em-0000Vj-8g
	for qemu-arm@nongnu.org; Fri, 13 Jul 2018 17:31:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1fe5eh-0008ML-CZ
	for qemu-arm@nongnu.org; Fri, 13 Jul 2018 17:31:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55830)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1fe5eh-0008KW-5j; Fri, 13 Jul 2018 17:31:11 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 48631308212A;
	Fri, 13 Jul 2018 21:31:10 +0000 (UTC)
Received: from localhost (ovpn-116-12.gru2.redhat.com [10.97.116.12])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C001860851;
	Fri, 13 Jul 2018 21:31:09 +0000 (UTC)
Date: Fri, 13 Jul 2018 18:31:08 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Message-ID: <20180713213108.GV31657@localhost.localdomain>
References: <1531470464-21522-1-git-send-email-thuth@redhat.com>
	<1531470464-21522-5-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1531470464-21522-5-git-send-email-thuth@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Fri, 13 Jul 2018 21:31:10 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2 04/16] hw/arm/armv7: Fix crash when
 introspecting the "iotkit" device
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
X-TUID: K7Drj5jKhLWg

On Fri, Jul 13, 2018 at 10:27:32AM +0200, Thomas Huth wrote:
> QEMU currently crashes when introspecting the "iotkit" device and
> runnint "info qtree" afterwards, e.g. when running QEMU like this:
> 
> echo "{'execute':'qmp_capabilities'} {'execute':'device-list-properties'," \
>  "'arguments':{'typename':'iotkit'}}" "{'execute': 'human-monitor-command', " \
>  "'arguments': {'command-line': 'info qtree'}}" | \
>  aarch64-softmmu/qemu-system-aarch64 -M none,accel=qtest -qmp stdio
> 
> Use the new functions object_initialize_child() and sysbus_init_child_obj()
> to make sure that all objects get cleaned up correctly when the instances
> are destroyed.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

-- 
Eduardo
