Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp8193833lff;
        Thu, 16 Jan 2020 02:42:50 -0800 (PST)
X-Google-Smtp-Source: APXvYqxR7cW5I8ztGXPYLGXIfMmSAQa6Y3cqBmnnjDC5DH442OIo6Wy/OhP7ETLCdQtY+QiSZUzA
X-Received: by 2002:a37:4dc1:: with SMTP id a184mr32634863qkb.62.1579171370092;
        Thu, 16 Jan 2020 02:42:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579171370; cv=none;
        d=google.com; s=arc-20160816;
        b=yRIXnPRkw7yRUQRX8mxW/QBIhO1GcVXTHvxEtuF2Zzq32vQ1IWvlWb9P/NKUfq9mEB
         jNKdbq5vcty7cY+WYIasCQzbYoqXRkP4zGV6QSqeix1S9hZDR34JVzQLeWRcyQneYxH3
         OC66nO/uZq9/cGYIaQPtNIZ2mbPOSp1IrVMJvzjNDZDbr/99dXRkW0THjYg6PmABueUe
         b3rSnVPaj1+ek6+3HGzFMlziD3rem79Owh7Wxdty4CKGqT69T3BKH+r/zcE0mvotg+dv
         v8Qun24KovK9fC1YZj7j3c6eQBDhHhtKg+Ohg2Am5Fg+zQK2EEhJ70zwDmJ0Ch3ol1tb
         awlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=NLLo3ClTCfYupTw8b+mbsY6ZFKgrkR58WKCRiZyYhYc=;
        b=j6hDvsurax0x1GOfPHAnuqHBjPskMOv7FbrOSRIdiV+9gtzHyO932d1pAhQAtJHkeH
         6it7XyUHhl+Gz+n7oL2hSmZP/U8DGfKAy8Mdw2RVMQQKz+8tpvYz6iMIQMMZDy85bSVM
         RPVwsV3oRWKZMJtsqD0teOVyqFEdXKoWgRT7hbQwovQgboyoUBBGru50y3/1db0Eslhe
         rKHkEyB3V4JE6qirK3I5FWaaa3JGmzwkr2XKxcewHAxVuGlUEsbiwIHB7LDgOT92768d
         XZsW0bSaQSioa+fidnHFVFPc9zos6AXhDZ92s+EDGVar/HL9krPaUORaKHxwTAKF3L6+
         oPSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=WJI6d5Kn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z72si13175258qka.360.2020.01.16.02.42.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Jan 2020 02:42:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=WJI6d5Kn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1is2bx-0002st-HB
	for alex.bennee@linaro.org; Thu, 16 Jan 2020 05:42:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48219)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mprivozn@redhat.com>) id 1is2bZ-0002p3-BR
 for qemu-arm@nongnu.org; Thu, 16 Jan 2020 05:42:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mprivozn@redhat.com>) id 1is2bV-0005VW-VW
 for qemu-arm@nongnu.org; Thu, 16 Jan 2020 05:42:25 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:39729
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mprivozn@redhat.com>) id 1is2bV-0005Ue-RI
 for qemu-arm@nongnu.org; Thu, 16 Jan 2020 05:42:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579171341;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NLLo3ClTCfYupTw8b+mbsY6ZFKgrkR58WKCRiZyYhYc=;
 b=WJI6d5KnGV+n/TFDa8Y7awCsKxA8ZhMrezu5Z6maOFI2UnvR8gtPDtQdRvxyCUTEZtHwK+
 coVhvplGAo9sd0yqriMcbJdPK2uFWcjhKTz9UXASEvrFHWTcuBhFsqTiqZ4xv0KVF3jDn3
 DKii/kDtPozLL2B5Oz/NjzqVloVozQI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-CCspmgHUNv6FQtY0xwlLiw-1; Thu, 16 Jan 2020 05:42:20 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E6CA100550E;
 Thu, 16 Jan 2020 10:42:18 +0000 (UTC)
Received: from [10.43.2.30] (unknown [10.43.2.30])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0720C84345;
 Thu, 16 Jan 2020 10:42:10 +0000 (UTC)
Subject: Re: [libvirt] [PATCH v2 82/86] numa: forbid '-numa node, mem' for 5.0
 and newer machine types
To: Igor Mammedov <imammedo@redhat.com>, Peter Krempa <pkrempa@redhat.com>
References: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
 <1579100861-73692-83-git-send-email-imammedo@redhat.com>
 <20200115153453.GL3243410@angien.pipo.sk>
 <20200115175237.325055f3@redhat.com>
From: Michal Privoznik <mprivozn@redhat.com>
Message-ID: <8b9be103-d550-853a-86ff-1dc504daab64@redhat.com>
Date: Thu, 16 Jan 2020 11:42:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200115175237.325055f3@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: CCspmgHUNv6FQtY0xwlLiw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 libvir-list@redhat.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, marcel.apfelbaum@gmail.com, pbonzini@redhat.com,
 rth@twiddle.net, david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qmlNFgbBou0N

On 1/15/20 5:52 PM, Igor Mammedov wrote:
> On Wed, 15 Jan 2020 16:34:53 +0100
> Peter Krempa <pkrempa@redhat.com> wrote:
> 
>> On Wed, Jan 15, 2020 at 16:07:37 +0100, Igor Mammedov wrote:
>>> Deprecation period is ran out and it's a time to flip the switch
>>> introduced by cd5ff8333a.
>>> Disable legacy option for new machine types and amend documentation.
>>>
>>> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
>>> ---
>>> CC: peter.maydell@linaro.org
>>> CC: ehabkost@redhat.com
>>> CC: marcel.apfelbaum@gmail.com
>>> CC: mst@redhat.com
>>> CC: pbonzini@redhat.com
>>> CC: rth@twiddle.net
>>> CC: david@gibson.dropbear.id.au
>>> CC: libvir-list@redhat.com
>>> CC: qemu-arm@nongnu.org
>>> CC: qemu-ppc@nongnu.org
>>> ---
>>>   hw/arm/virt.c        |  2 +-
>>>   hw/core/numa.c       |  6 ++++++
>>>   hw/i386/pc.c         |  1 -
>>>   hw/i386/pc_piix.c    |  1 +
>>>   hw/i386/pc_q35.c     |  1 +
>>>   hw/ppc/spapr.c       |  2 +-
>>>   qemu-deprecated.texi | 16 ----------------
>>>   qemu-options.hx      |  8 ++++----
>>>   8 files changed, 14 insertions(+), 23 deletions(-)
>>
>> I'm afraid nobody bothered to fix it yet:
>>
>> https://bugzilla.redhat.com/show_bug.cgi?id=1783355
> 
> It's time to start working on it :)
> (looks like just deprecating stuff isn't sufficient motivation,
> maybe actual switch flipping would work out better)
> 

So how was the upgrade from older to newer version resolved? I mean, if 
the old qemu used -numa node,mem=XXX and it is migrated to a host with 
newer qemu, the cmd line can't be switched to -numa node,memdev=node0, 
can it? I'm asking because I've just started working on this.

Michal

