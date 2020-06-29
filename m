Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3082704lfm;
        Mon, 29 Jun 2020 08:21:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2ScCQ7dspcJhzv8nGlOP00xhQN47RKC7lJ44otkxi7MRjCFCIrzPBsu8uWhvaT5HP4Xtc
X-Received: by 2002:a25:ac45:: with SMTP id r5mr28288070ybd.138.1593444106389;
        Mon, 29 Jun 2020 08:21:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593444106; cv=none;
        d=google.com; s=arc-20160816;
        b=kQbHeaSDBuSnRz+AzbpjmNgrGA4/1PmuzvoKilwEHAy67xofpOjnKALRUvYJUKEPHQ
         eC9oIPek8b5hYa9iFqlrNdoyojClAstGUNdzcZy23ypVcEgF+n96ilwYvffO7heIJdry
         vY0BHGyZ5WsaCb6zKsBoXmxCPkp1nBjV1tGIdkD5Fw/SrQuihvWB1S2Zovw8lNQeF/UD
         0s5LCkdY2NhjtIwVMb24wXH/5Y3occl5RDVOqw7ImdbobBH3Q5Z/3G+FUrnm99wZbTPi
         io60v8DNUZzLyy8yaSvfT2Cpww7uQCcUD+uqyItoRTrqvkDbUxZ8A/acYxlv5tOO1fK/
         y6EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=4CMx1GO55ZFw157UDV5+gyoOgLVUEJkhnBwC/sFV9oc=;
        b=RhtQ9V27JhsQdUjas7XoJiErW1bzjFUt81LeeB9eGR+H8jH/6QDw4lHORf6TNJ5ybu
         o7gpVA/Y33+ZAVjQKHMN+0SON9bQ81QGpBIwVPy00ezceBEcBQUE3+4vOFJAcy4SjWUg
         EdyumumJ+VFnhItYUEpDIB/zlGKFHsuCDzlpXoW9n3uk16ZUBHvC4/i2hf1cDHbiSLgV
         J24ej2aDPJzPWnhYeNF9b1UrgtMMcolw/we5z3haHD+7exuftRR+UBMY/TzHCP7fTIZF
         dfAwz/9VMfV6YpGNODzxKP+zuJ8s5cU2lNbFYfajRPe0Ei440CSuaWgCLZC023dY2GkJ
         ZvcA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HXLQwPTW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t45si34646047ybi.478.2020.06.29.08.21.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Jun 2020 08:21:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HXLQwPTW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jpvbN-0004f3-NQ
	for alex.bennee@linaro.org; Mon, 29 Jun 2020 11:21:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jpvbE-0004dV-Gn
 for qemu-arm@nongnu.org; Mon, 29 Jun 2020 11:21:36 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:20404
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jpvbC-0001G3-Q9
 for qemu-arm@nongnu.org; Mon, 29 Jun 2020 11:21:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593444094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4CMx1GO55ZFw157UDV5+gyoOgLVUEJkhnBwC/sFV9oc=;
 b=HXLQwPTWThFWJYKPJvarBh4rKorqYiWqFK77zJ9/GkYvsZKBWsnJ+QzABk8tU5F54swKWa
 lGzWHlRZBgul7hi5ki1ufGOl+gltZGgzrGCi7X/iCjmMPdWMfygQh4xYrMh3TOsVX8LRuB
 npPX/rvakutC0f/LfToYbWs8AxT2mHM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-ZsQtj_CPMXGB60a1IeV7kg-1; Mon, 29 Jun 2020 11:21:30 -0400
X-MC-Unique: ZsQtj_CPMXGB60a1IeV7kg-1
Received: by mail-wm1-f71.google.com with SMTP id h6so18543633wmb.7
 for <qemu-arm@nongnu.org>; Mon, 29 Jun 2020 08:21:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4CMx1GO55ZFw157UDV5+gyoOgLVUEJkhnBwC/sFV9oc=;
 b=YYzC9ziLrFZWfol0c2ks+VyZMCnLaRMkK6M+/Tc8YOC2BKdE1+EULY9+WmfdDrIdJI
 xz8t0PcGNl5Hug95Ieq/StqaDEm7RExjlJaIRurXoEsbP93ag0JlsR2xCJTfS2EFHDsd
 3UXVap97PvrPMqulDrQdUM1fppm9f38RhPfMAzQJJ5KRk7K7FS31CxF2VPsdNrzqklQ3
 b3RggE/7MVgrnB6NoN211vaHxodZhaP5daCcUJKLby52WddKnU86lkNiFgItTUB2gU7M
 FRtTu7Nltp8e9Ja0NY9C+TNJpfCRnMDcVO3e6fVuBKDX9w1Vg5MQL2DM+JMpNvfCKjpP
 rpsQ==
X-Gm-Message-State: AOAM532dAsz6wW6kIbeZrrsaR1Ht9atFRKFsfcHhg76yE4q2R85tdywY
 2ySsXZtavB14Ctx1SGsJycVlTfkE6ruDphu8F7m9l/S1QIsPKitdFI2heHRTHl8NiFVQJ2nT+tN
 3iBpNHGCp3Tyz
X-Received: by 2002:a5d:6b08:: with SMTP id v8mr18258185wrw.2.1593444089321;
 Mon, 29 Jun 2020 08:21:29 -0700 (PDT)
X-Received: by 2002:a5d:6b08:: with SMTP id v8mr18258167wrw.2.1593444089160;
 Mon, 29 Jun 2020 08:21:29 -0700 (PDT)
Received: from redhat.com (bzq-79-182-31-92.red.bezeqint.net. [79.182.31.92])
 by smtp.gmail.com with ESMTPSA id
 b184sm149153wmc.20.2020.06.29.08.21.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 08:21:28 -0700 (PDT)
Date: Mon, 29 Jun 2020 11:21:25 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Andrew Jones <drjones@redhat.com>
Subject: Re: [PATCH 0/4] hw/arm/virt-acpi-build: Only expose flash on older
 machine types
Message-ID: <20200629112056-mutt-send-email-mst@kernel.org>
References: <20200629140938.17566-1-drjones@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200629140938.17566-1-drjones@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/29 01:06:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: peter.maydell@linaro.org, eric.auger@redhat.com, philmd@redhat.com,
 qemu-devel@nongnu.org, shannon.zhaosl@gmail.com, qemu-arm@nongnu.org,
 ard.biesheuvel@arm.com, imammedo@redhat.com, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dj2WVAW25QHc

On Mon, Jun 29, 2020 at 04:09:34PM +0200, Andrew Jones wrote:
> The flash device is exclusively for the host-controlled firmware, so
> we should not expose it to the OS. Exposing it risks the OS messing
> with it, which could break firmware runtime services and surprise the
> OS when all its changes disappear after reboot.
> 
> This change was suggested by Ard and Laszlo.
> 
> Patch 3/4 is the meat. The other patches deal with updating qtest.


acpi things:

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>


> Thanks,
> drew
> 
> Andrew Jones (4):
>   tests/acpi: remove stale allowed tables
>   tests/acpi: virt: allow DSDT acpi table changes
>   hw/arm/virt-acpi-build: Only expose flash on older machine types
>   tests/acpi: virt: update golden masters for DSDT
> 
>  hw/arm/virt-acpi-build.c                    |   5 ++++-
>  hw/arm/virt.c                               |   3 +++
>  include/hw/arm/virt.h                       |   1 +
>  tests/data/acpi/virt/DSDT                   | Bin 5307 -> 5205 bytes
>  tests/data/acpi/virt/DSDT.memhp             | Bin 6668 -> 6566 bytes
>  tests/data/acpi/virt/DSDT.numamem           | Bin 5307 -> 5205 bytes
>  tests/qtest/bios-tables-test-allowed-diff.h |  18 ------------------
>  7 files changed, 8 insertions(+), 19 deletions(-)
> 
> -- 
> 2.25.4

