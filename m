Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1390896lfb;
        Thu, 21 May 2020 02:30:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxRAEabEgZ/sd7qhhqVbAJEozpR5tFFoH+d5AX/RFzSCcBqbRlXhodOfuuZmTSa5qRLmpDf
X-Received: by 2002:a05:6214:18ec:: with SMTP id ep12mr9050462qvb.216.1590053424429;
        Thu, 21 May 2020 02:30:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590053424; cv=none;
        d=google.com; s=arc-20160816;
        b=mV7+qk9xp00MJM7hptFe5JBLPrxGqxspyNWZhWQlBmJJN5j1TU/PE00caG67JT7m4L
         tLz56ZxKufVqWEOlvYjSeULo6ua5GMahQFgmdW5muJKnTGrOljrxT/yc1Z540wN3rrsv
         z1ohEmD9zM+OCPStAUbXps2+E5DX+/cO5iCUP9ozImh248cQP0pIdY5g4hq12ir9HV3O
         jYZDwYZwQSZBKDPE5BR18zPzx2yqE37/TYE3QO0O/05XHI62fDWbJ1MTb386LCvrsF+S
         ZoqG2gwzKpqRLoN5irTO8k8V7Tg08DdGkqar+5ceXhgyBcS2tTgZ6bjdpfjK4rVTNhXW
         qjFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=kRZr8uWaR23o4JQjTsLqMa/HlO+Ckw1tCxizbVtVWxw=;
        b=U0goD1FVxf5GDCqQ8EqaTqlMx8UjwzzJDIglgiYYhjz9od2unq5apopH/fs6QYD6Nx
         EhEAF20DBQ4TbazrfCF0nvaCTUWCMVuLiM6rsP/5RtJqEPshaFTRRrePkFheqF4lSR91
         SnAADYyGNmoEvWXWq4HG4F4iclaVOkNYEJLexHeexWSi2+x9dOGhJYG9a2aGQkFZKyOU
         f63KO2tEzMuUmSvsUHfqNN7hxGblJqt9V2QUSDQF0DfnEeEalqsl2sZQlLvn7+OJF/oR
         WZiM/PzpOL73LPcsTiaQMh1mJRFFz08bfjLziInez18klc7lxaTfMDOB/aI06LzMezwx
         5a8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=XLTb0Z1h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g53si3174530qtc.190.2020.05.21.02.30.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 May 2020 02:30:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=XLTb0Z1h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jbhWx-0006ON-RL
	for alex.bennee@linaro.org; Thu, 21 May 2020 05:30:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jbhWo-0006Nn-U4
 for qemu-arm@nongnu.org; Thu, 21 May 2020 05:30:14 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:48013
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jbhWn-0000Kp-QR
 for qemu-arm@nongnu.org; Thu, 21 May 2020 05:30:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590053412;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kRZr8uWaR23o4JQjTsLqMa/HlO+Ckw1tCxizbVtVWxw=;
 b=XLTb0Z1hgAlWHJ29rGHJplAaBxEs9LHcc9HgnkeQCth3sEhcnwQhCZjYaoCA7dM1EWwNBH
 qzn+vCjf2k9PL4iTY98UZgyP8H/yW2QegPHuyliHsakHympRoGfwT81ZAd7CSN0OfoVWiu
 bRenuXajDcw9Eg4mXBYLeKkllX5sQM0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215-nTdUkN_7PlaWl6ITYZMkyQ-1; Thu, 21 May 2020 05:30:08 -0400
X-MC-Unique: nTdUkN_7PlaWl6ITYZMkyQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE1321923429;
 Thu, 21 May 2020 09:29:54 +0000 (UTC)
Received: from localhost (unknown [10.40.208.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D0EBDA394E;
 Thu, 21 May 2020 09:29:23 +0000 (UTC)
Date: Thu, 21 May 2020 11:29:21 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3 14/22] microvm: use 2G split unconditionally
Message-ID: <20200521112921.641f12bb@redhat.com>
In-Reply-To: <20200520132003.9492-15-kraxel@redhat.com>
References: <20200520132003.9492-1-kraxel@redhat.com>
 <20200520132003.9492-15-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=imammedo@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/21 01:44:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pNhAgJpJGQQt

On Wed, 20 May 2020 15:19:55 +0200
Gerd Hoffmann <kraxel@redhat.com> wrote:

> Looks like the logiv was copied over from q35.
> 
> q35 does this for backward compatibility, there is no reason to do this
> on microvm though.  So split @ 2G unconditionally.

not related to your ACPI rework, but just an idea for future of microvm

I wonder if we should carry over all this fixed RAM layout legacy from pc/q35
with a bunch of knobs to tweak it (along with complicated logic).

Can we just re-use pc-dimms for main RAM and let user specify RAM layout the way they wish?


> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  hw/i386/microvm.c | 16 +---------------
>  1 file changed, 1 insertion(+), 15 deletions(-)
> 
> diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
> index 867d3d652145..b8f0d3283758 100644
> --- a/hw/i386/microvm.c
> +++ b/hw/i386/microvm.c
> @@ -170,23 +170,9 @@ static void microvm_memory_init(MicrovmMachineState *mms)
>      MemoryRegion *ram_below_4g, *ram_above_4g;
>      MemoryRegion *system_memory = get_system_memory();
>      FWCfgState *fw_cfg;
> -    ram_addr_t lowmem;
> +    ram_addr_t lowmem = 0x80000000; /* 2G */
>      int i;
>  
> -    /*
> -     * Check whether RAM fits below 4G (leaving 1/2 GByte for IO memory
> -     * and 256 Mbytes for PCI Express Enhanced Configuration Access Mapping
> -     * also known as MMCFG).
> -     * If it doesn't, we need to split it in chunks below and above 4G.
> -     * In any case, try to make sure that guest addresses aligned at
> -     * 1G boundaries get mapped to host addresses aligned at 1G boundaries.
> -     */
> -    if (machine->ram_size >= 0xb0000000) {
> -        lowmem = 0x80000000;
> -    } else {
> -        lowmem = 0xb0000000;
> -    }
> -
>      /*
>       * Handle the machine opt max-ram-below-4g.  It is basically doing
>       * min(qemu limit, user limit).

