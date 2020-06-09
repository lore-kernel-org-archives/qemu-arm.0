Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp379376lfc;
        Tue, 9 Jun 2020 04:08:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxVhhafm6D+V1KfBQ5jurqcmlRHe3AXF6il5bx/xNAM/yqg6PTnXDpZO4++JW2u2y7qNOPF
X-Received: by 2002:a25:2e48:: with SMTP id b8mr5622435ybn.521.1591700909676;
        Tue, 09 Jun 2020 04:08:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591700909; cv=none;
        d=google.com; s=arc-20160816;
        b=tfwUwfJIcSEt4+qKAz+xPA0hRVl4GjhdTfYcdgX3yWXiFeWDwcHStpKreimyvVKrtw
         1NZw+ax/JtF5eNcZFsi6t2JtcU2kMS9LRa0BBmGnjJKDBAUZaHYEVfXsvkxxyS6fRCv/
         izyWQ90NZ1cA/16d6mYaGrupFlnSH49W0AlmIlbxVTNaDggFW2egBJ889wQir5RIzQuq
         ROtStAubmGiMKyxjE6DEBKcx51kf1foKZD0gnFiD64hM+zgoGF6jz7U2UhEXUFOKmv8j
         aAv2tPnjcAOxc2xurJlwwhGSeMaYrP8je0koNIuCsUm40+/WPucToRlAyh/hqgMxNaKE
         H2PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=nzIR+3VysZFR+NGFD1AmGomUUyfUE6amVvn/ew5M7nY=;
        b=ahJG4pluU8zwuMVdEv11qGzqmc41I5gpmJ2r4/8YJ9MWQQth1IS8hGs4PdtfOjMbAL
         q8BTij3sr1+kXuSScUhxPkKlKKG5BtVrQIvPCVK+/lFRct7xQiaeujQkzDSbNday48gS
         uSBAAZ5MRrq6YuyAaEQZA2ibYzzseDGrRDEOf8jkYOWLoXzTP0Tt8tN4Qc9glJ1P+9ws
         RxADE63rjemFGzKRK2Hg9miomhU4Zt3Kc7wG4HRYTC4R2BKPkbhPKhL49qrGECTsw/1X
         UpruIinrYDrcECKkI/1MDjIPpy1hn4gu6+Leraf9k4IPuFUMHJ7qrnBveVTcmr4bE/D+
         23nw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=g94os9zo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w185si2192664yba.153.2020.06.09.04.08.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jun 2020 04:08:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=g94os9zo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jic7I-0001vV-Up
	for alex.bennee@linaro.org; Tue, 09 Jun 2020 07:08:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jic79-0001pk-7Y
 for qemu-arm@nongnu.org; Tue, 09 Jun 2020 07:08:19 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:22263
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jic78-0001Ev-HS
 for qemu-arm@nongnu.org; Tue, 09 Jun 2020 07:08:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591700897;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nzIR+3VysZFR+NGFD1AmGomUUyfUE6amVvn/ew5M7nY=;
 b=g94os9zoQJ1t3lz5T5scYdH1LEuO0uOI9xygd8EHVV+n7phOhELSNG/jZE4exKc2TJtUT3
 hMEnalcopFNR3h3HlyaDK6mZh4/1kh11rbp3DHTK800QHnVguBfJVs9SzmC7dgMCiWL31G
 63XxI3kzf2TRXNGazuau+YpyhJOdAYI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205-FvKhPrxTOs-oIqFlokksfw-1; Tue, 09 Jun 2020 07:08:14 -0400
X-MC-Unique: FvKhPrxTOs-oIqFlokksfw-1
Received: by mail-wr1-f71.google.com with SMTP id l1so8459074wrc.8
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2020 04:08:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nzIR+3VysZFR+NGFD1AmGomUUyfUE6amVvn/ew5M7nY=;
 b=rGIo7qw2HjS5bz6WnBzfn+fnT3Ev+YnoJjAUP86x0XLHk4yXIFV77J1vZOKjxuRR0/
 u7HqKThNO2dwcQV4UwucjAJ31EL7SJ2lhJFc4kGRr9HhpoRT6iDb/2p0NcOCTx4+YqAP
 8gQA1uOtI1EkppWcF11ih3yd7YliI1wJxz0W5P+D/oNMWc1zYMbH9fXB98l0cM/rxOre
 F+PnqpxEFhhWhJN/zA5aFJUewtf8XGLNKb4pFNjRlEgV414XuCQUpvWY7OzHgz75YIKa
 CaPtU5rzCgJjcVNygXU/M9H+JqMZqUk2BfHpbcoDkj9JxeeXb7pLVOX6+ixrBPpoied/
 snEQ==
X-Gm-Message-State: AOAM531T8F0+TYkSk5iHrXVVXGMe3r3n6ZgZAm4rCV5dyugz8ccbP9rX
 omwb29xhvZhFGTCzpih3UZSC2NibfviYv//Ml1vqTbKt1B75lDNpAzxMhjsGHt9Th9mYgnyg9eB
 2q4Iuaj99mY6Q
X-Received: by 2002:a1c:7215:: with SMTP id n21mr3428438wmc.10.1591700893213; 
 Tue, 09 Jun 2020 04:08:13 -0700 (PDT)
X-Received: by 2002:a1c:7215:: with SMTP id n21mr3428413wmc.10.1591700892989; 
 Tue, 09 Jun 2020 04:08:12 -0700 (PDT)
Received: from [192.168.178.58] ([151.21.172.168])
 by smtp.gmail.com with ESMTPSA id r11sm3060354wre.25.2020.06.09.04.08.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jun 2020 04:08:12 -0700 (PDT)
Subject: Re: [RFC PATCH 14/35] hw/i386/pc: Emit warning when old code is used
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200608160044.15531-1-philmd@redhat.com>
 <20200608160044.15531-15-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <99a85bad-3197-6a74-5218-86f2326cd381@redhat.com>
Date: Tue, 9 Jun 2020 13:08:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200608160044.15531-15-philmd@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/09 01:38:49
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
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Paul Durrant <paul@xen.org>, Magnus Damm <magnus.damm@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Andrzej Zaborowski <balrogg@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 xen-devel@lists.xenproject.org, qemu-riscv@nongnu.org,
 Stafford Horne <shorne@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <rth@twiddle.net>,
 "Daniel P . Berrange" <berrange@redhat.com>, Thomas Huth <huth@tuxfamily.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KwSjqOXmHVKP

On 08/06/20 18:00, Philippe Mathieu-Daudé wrote:
> This code hasn't been QOM'ified yet. Warn the user.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/i386/pc.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 2128f3d6fe..c71809fd28 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -94,6 +94,7 @@
>  #include "vmport.h"
>  #include "fw_cfg.h"
>  #include "trace.h"
> +#include "hw/qdev-deprecated.h"
>  
>  GlobalProperty pc_compat_5_0[] = {};
>  const size_t pc_compat_5_0_len = G_N_ELEMENTS(pc_compat_5_0);
> @@ -348,6 +349,8 @@ GSIState *pc_gsi_create(qemu_irq **irqs, bool pci_enabled)
>  {
>      GSIState *s;
>  
> +    qdev_warn_deprecated_function_used();
> +
>      s = g_new0(GSIState, 1);
>      if (kvm_ioapic_in_kernel()) {
>          kvm_pc_setup_irq_routing(pci_enabled);
> 

This one is okay, GSIState is just an array of qemu_irqs.

Paolo

