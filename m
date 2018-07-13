Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp1151779wrq;
        Fri, 13 Jul 2018 14:54:06 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcf/OXub77zwk2bFnhqXDKEFXtKcKmAebiFc3sO/D2zxXBaIyiFHbiK/97cjKofSgZGz1wh
X-Received: by 2002:a37:1b41:: with SMTP id b62-v6mr6999245qkb.343.1531518846576;
        Fri, 13 Jul 2018 14:54:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531518846; cv=none;
        d=google.com; s=arc-20160816;
        b=Y2OKYorahevPM8bexo9RM7SfJpnfXX43dGZ8lb2GqtfRUqXYFB+6OLemAuBVD935Et
         LNJt2fpezvxEGtd4ubKJq8tW5083bbFN7bpT/CTTa8JxnE5271LF84KwSd8RozgSlU1w
         GsnvqRHPpxFBg5n7qClTYHlAbUCPB0qc7F6mnft0GfKN9vZTz25HOr2dqNDNxOfVYP4R
         JIorsr3UjFLm9KPyKv6iNID7Vc0C2cAwP83QNjhl/GGbau5QeXbX9Jhr+e0T/bTqzEtb
         hPGGivWlqQl03kBPjsABt4OkEt2eaL/AO2uYaOhGd69BnrHG90ePxm8w6SaNiTP1SnNO
         e+Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=LwjY+zqkQR6Hi8NG4m4Ukyee03SS0slYS0ZLCEuWL7w=;
        b=MPxhzrgEOIdXVtAJb9oVS5a+4j4QPPz5b/uaEXYqWIDmPM5RmB3QrkdmlpENXqwR/7
         3je2KkSWNZsRAD10KHmen0nhn9i2ziOYXIFtXVdMykqGQkRuA4kiBQvk0WbqsVhwoERJ
         FK5K50l/gIkAG0xCTR80H564S7+Qr13WITlQiKuCh3DEBUMYeGAT4PtkBMHOpO4GIqhC
         LBPzSdwoGSV9YAcXoTImp+lECS7xo3vLJYG4qJTINoL7XzK+lqSGFGjTtZ0xml1ARj8X
         U21myWJDYMATen2t+JryU8spFvNpp/hc6KriOm3vMjVomVhLRmEOLFA9a7syH7Wad8gq
         /GCg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q5-v6si10878877qkf.160.2018.07.13.14.54.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 13 Jul 2018 14:54:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39293 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fe60s-0005hp-4F
	for alex.bennee@linaro.org; Fri, 13 Jul 2018 17:54:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54397)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1fe60i-0005gV-Uz
	for qemu-arm@nongnu.org; Fri, 13 Jul 2018 17:53:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1fe60f-0002ZU-TX
	for qemu-arm@nongnu.org; Fri, 13 Jul 2018 17:53:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38348)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1fe60f-0002Z9-Mr; Fri, 13 Jul 2018 17:53:53 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CCF0630E6857;
	Fri, 13 Jul 2018 21:53:52 +0000 (UTC)
Received: from localhost (ovpn-116-12.gru2.redhat.com [10.97.116.12])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4F8D560F8A;
	Fri, 13 Jul 2018 21:53:52 +0000 (UTC)
Date: Fri, 13 Jul 2018 18:53:51 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Message-ID: <20180713215351.GA31657@localhost.localdomain>
References: <1531470464-21522-1-git-send-email-thuth@redhat.com>
	<1531470464-21522-10-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1531470464-21522-10-git-send-email-thuth@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Fri, 13 Jul 2018 21:53:52 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2 09/16] hw/cpu/a9mpcore: Fix introspection
 problems with the "a9mpcore_priv" device
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
X-TUID: WLZZcOVa04Wh

On Fri, Jul 13, 2018 at 10:27:37AM +0200, Thomas Huth wrote:
> Running QEMU with valgrind indicates a problem here:
> 
> echo "{'execute':'qmp_capabilities'} {'execute':'device-list-properties'," \
>  "'arguments':{'typename':'a9mpcore_priv'}}" \
>  "{'execute': 'human-monitor-command', " \
>  "'arguments': {'command-line': 'info qtree'}}" | \
>  valgrind -q aarch64-softmmu/qemu-system-aarch64 -M none,accel=qtest -qmp stdio
> [...]
> ==30996== Invalid read of size 8
> ==30996==    at 0x6185DA: qdev_print (qdev-monitor.c:686)
> ==30996==    by 0x6185DA: qbus_print (qdev-monitor.c:719)
> ==30996==    by 0x452B38: handle_hmp_command (monitor.c:3446)
> [...]
> 
> Use the new sysbus_init_child_obj() function to make sure that the objects
> are cleaned up correctly when the parent gets destroyed.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

-- 
Eduardo
