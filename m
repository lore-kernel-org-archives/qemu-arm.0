Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp314968lfp;
        Tue, 28 Jan 2020 02:47:33 -0800 (PST)
X-Google-Smtp-Source: APXvYqxo3BlpPlVcBPoh4nn1cOn4LdlUlvHkM5anYcJIq+A7sJYwpisYXZy9CvU79OLoIJSHCWt9
X-Received: by 2002:ac8:5388:: with SMTP id x8mr5300701qtp.199.1580208452596;
        Tue, 28 Jan 2020 02:47:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580208452; cv=none;
        d=google.com; s=arc-20160816;
        b=L/nfqDFbJkpMFs9SFMWmESJIvmrg3sgzyx9i+j+o/Yvsl0EKDwQ2+sAolBR8t8hF1P
         a3Ug+NtdrtaVABYnQ7bMsWVqdPAkXrQFBlEO7AVD3zHi4oszHJ7S4JP0LYUCObsjVEMc
         fSnrhTPPgm2erfsCHQN48S4+sYw28ioAZGeH+kKFigp1rkZ7/+VTASjRFKUEGypWhi/x
         KCDsz6d98WzQUqnZI1CO+VVqcz4DfMOeuojp0vGebOjMwJHtxJIPDcG359IKn8ANEKQG
         c1dOv29zBl77A+qncYTRomlvvMPP4NTmmbdtfSveeLAjCpi1/cbWAn29CyTh13X5rTOL
         o21g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:mime-version:user-agent:date:message-id:subject
         :from:to:dkim-signature;
        bh=z43FRblCwedOjRZvSZiB/yhTk6UmQiFMUw8swuZX8Wo=;
        b=Rh5ndfmcAlCgy2wGuZKys0JlSETLuYHPGWdj4bRw+BtB6q9FTTK89QkxEXtF2BRx2I
         xkIeiU9knjajdXKsc+d5IK33wP5rFNkKx5wQl6J/KHeyUm++lNZIriOD/0I9/y5Hldq8
         9Pxx6rf9mjtE97Fjzxx4eyjwjUzuTumP4HmREf1ThgxUAh4bmLmAo4oKbu8oszzP4lL/
         NVFubdc1nY/5ZZdGIC9VVU0pdAvTrtpo2W1FQEdbGjHQ3vC3ZszerJ7GT/+PenwL1FZ9
         a9kcDQn95gfF8HWXk95YMa3MafkBVC4vHxv6a2j+8pzNx/TZLiA5tqxf3YVc/JGeZHxh
         Bjzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FJYjNrud;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v19si11753261qkf.212.2020.01.28.02.47.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Jan 2020 02:47:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FJYjNrud;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iwOP6-00073p-1S
	for alex.bennee@linaro.org; Tue, 28 Jan 2020 05:47:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51224)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1iwOOt-00072Y-Rn
 for qemu-arm@nongnu.org; Tue, 28 Jan 2020 05:47:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1iwOOs-0001JB-Bp
 for qemu-arm@nongnu.org; Tue, 28 Jan 2020 05:47:19 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:32472
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1iwOOs-0001IT-87
 for qemu-arm@nongnu.org; Tue, 28 Jan 2020 05:47:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580208437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=z43FRblCwedOjRZvSZiB/yhTk6UmQiFMUw8swuZX8Wo=;
 b=FJYjNrudIruZNQwd8Q4/giTiJqbqr5g2cmF/Yi3XZtHF6Y41PIktGKQ4oNmd2EdUQdF3Er
 Yc6qKfq2YtQevj1BEu8AGw9MhdcEQDQzQT5AoD04tJGmWx/Jvp5S36tJ5kJ1SyE/3Nos97
 Yk4ucHeEzBOaUQjC0x5I02RWdmISTOo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-2W3dnW85NyWrDNwJwjlzmQ-1; Tue, 28 Jan 2020 05:47:15 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9181813E1;
 Tue, 28 Jan 2020 10:47:14 +0000 (UTC)
Received: from [10.36.116.37] (ovpn-116-37.ams2.redhat.com [10.36.116.37])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E0AE1001B08;
 Tue, 28 Jan 2020 10:47:12 +0000 (UTC)
To: qemu list <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>
From: Auger Eric <eric.auger@redhat.com>
Subject: [question] hw/arm/virt: about the default gic-version in accelerated
 mode
Message-ID: <df1d6ae5-b734-ef64-4ef9-c661e8f797e8@redhat.com>
Date: Tue, 28 Jan 2020 11:47:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: 2W3dnW85NyWrDNwJwjlzmQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 207.211.31.81
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
Cc: Andrew Jones <drjones@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RTYTgEdPsdDf

Hi Peter,

When arm virt machine is run in accelerated mode with "-cpu host
-machine virt", the default gic version is 2.

I understand the rationale with TCG where we don't have MSI ITS
emulation along with GICv3 so we need to choose GICv2 to get GICv2M
functionality.

However in KVM mode, I would have expected to see the host GIC probed to
set the same version on guest. Indeed most of our HW now have GICv3
without GICv2 compat mode so our default values lead to weird traces:

"
qemu-system-aarch64: PMU: KVM_SET_DEVICE_ATTR: Invalid argument
qemu-system-aarch64: failed to set irq for PMU
"

I would like to propose a patch to improve those errors and also suggest
a hint. But I also wanted to know whether you would accept to change the
default value with KVM and choose the host version instead of 2. For TCG
we would keep v2.

Thanks

Eric

