Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1381129lfb;
        Thu, 21 May 2020 02:15:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx0UFCx9UepwFsyqk93RfafcWQXiqoe+ZqV28pWHCh3eIUI6XWaMM8TyaMFOyAYtS1EufMm
X-Received: by 2002:a05:620a:a93:: with SMTP id v19mr8866449qkg.416.1590052516612;
        Thu, 21 May 2020 02:15:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590052516; cv=none;
        d=google.com; s=arc-20160816;
        b=PNjiC78zjAvcY9CvsSNr2dx0edQkmrS1NRmcKId9Q2TgTLtGKJW3a5WUhWSgM75Kus
         BBo3ifQ/X8SeNL9N4wC/oi+ibB7gi2Lo9RL7qWU39lyIS1X4MkDzO5WNA4HJB4gfI2WB
         Mk7x8IQicA8gkvK2zRzq/1MUYscpS8oCS5mgal2ob9uxqMU4kG47EO8OGuIdnrd5HqyJ
         dzQ3BlXEK2RWJat35BZVPzQwU0ErqaysdwahLJ7bnIeIHEix0D0+TWCCJ1IX4cQa/eUk
         88hw/kgLOvJ9Yk5YTT/rdRz6Ht52mq2+OGlB6+vNl+G+OGFs9dGVU/sn/VcwNmKY63nW
         a/vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=pAQcFfvmbFo2T0FcP6sN6SJ7IPjBqdn/kotVhvFayU4=;
        b=cEXbkwuHP8ayqoAXFJyM4s0qEqYNic41uRxYAG4dm+xRJLWSWQMsd9qUKIFb2Iyrhy
         NYkuBNZVBqKlRhgmApzQmc18LF0DiRiIw9j5Hjob94euCy3paGx2DhfHrhzDXcmwM4pU
         38TOSwZWmRvJrt2nIU65hGQmT5/W0PkS7JFQBr9wxGP1J78HU0R0cEZVM7KiIgNHz5/a
         uReY+ojJUp4TKhbxcc5zqeR2ow6013IUpbe5zX1se4KtpaZL5fOzy/dgStqc0wfAbSDl
         E5QDri5Synk4CXJ5swyNpkWjcz8tB+1bZu4DTEHc/FmJWVWlJFVB4h2UvhtrWPZvFaK9
         ez1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=LnVRPjA1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p19si2981138qvm.142.2020.05.21.02.15.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 May 2020 02:15:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=LnVRPjA1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jbhIK-0002G7-1x
	for alex.bennee@linaro.org; Thu, 21 May 2020 05:15:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jbhHy-0002Dp-00
 for qemu-arm@nongnu.org; Thu, 21 May 2020 05:14:54 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:42976
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jbhHx-0005do-7G
 for qemu-arm@nongnu.org; Thu, 21 May 2020 05:14:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590052492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pAQcFfvmbFo2T0FcP6sN6SJ7IPjBqdn/kotVhvFayU4=;
 b=LnVRPjA1/Zr5XsH+D2Y6sAKaooENzjcUesffWn8YWcbzWPfi9W63oy5nmIU8Pz6a1UFKDi
 pccEAjGSw6KsoOTzl2Ccg2dz3BiBKd3/BJ5V/duatZkppYnGme8WyNvseSpbQYXtNn97m1
 oNt6dYLEZCCSgklYRSNAqms68j9ySb4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-327-YjhYg8QNNbG64tldmum13Q-1; Thu, 21 May 2020 05:14:50 -0400
X-MC-Unique: YjhYg8QNNbG64tldmum13Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 83DD58018A2;
 Thu, 21 May 2020 09:14:49 +0000 (UTC)
Received: from localhost (unknown [10.40.208.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6A4EC6E71B;
 Thu, 21 May 2020 09:14:37 +0000 (UTC)
Date: Thu, 21 May 2020 11:14:36 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3 14/22] microvm: use 2G split unconditionally
Message-ID: <20200521111436.5c742fde@redhat.com>
In-Reply-To: <20200520132003.9492-15-kraxel@redhat.com>
References: <20200520132003.9492-1-kraxel@redhat.com>
 <20200520132003.9492-15-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
X-TUID: Oe9e+4Ja3pvA

On Wed, 20 May 2020 15:19:55 +0200
Gerd Hoffmann <kraxel@redhat.com> wrote:

> Looks like the logiv was copied over from q35.
> 
> q35 does this for backward compatibility, there is no reason to do this
> on microvm though.  So split @ 2G unconditionally.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

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

