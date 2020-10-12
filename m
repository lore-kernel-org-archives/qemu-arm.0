Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp793348lfa;
        Sun, 11 Oct 2020 23:59:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxP85i8fj22g8E/DqlKaJ8plnDpKpybYnm00gze6fRXg2yYZabmU7doocy/pc7Uvy+giHCt
X-Received: by 2002:a5b:d44:: with SMTP id f4mr29799530ybr.153.1602485958291;
        Sun, 11 Oct 2020 23:59:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602485958; cv=none;
        d=google.com; s=arc-20160816;
        b=XEZej5dNd3Vx3doB/MmZWEV/X2sgXGomXZEWV4/WE5gWs/AsLdwmbtFNiSjVuwsc4z
         +vLOUT6eJFEZmmfPqCc+tnDAmJ+1fUygI6t6ZEGIdUp90Ka4YbOMCdKfHsrQWPQE0Bns
         n8BkBLAPcZfct9Tmu/38yUoWlM5e0tHTTOwfj2DvKJw6NsPD9NYk1H0AcOZUgs54BgA0
         ba1t0XRG/zzg2Ub549Pr7jx2mEIK3FufhdBAgTXEk7xGoGjvk3WDonruZim+ZtgEXBEC
         Z98gmHTvUzrZNw9sR8bNWXh5iQDU7s7zZB0585xAF/TlwXg8s156tzEj3jeW2Lfmlqrb
         tZ3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=in4vP4P4euyhUmh7MBEkfRMo9+vEy+KLt+Y2qxkJRGE=;
        b=ndbbj8TDDYM0cScJ67XlijOyjcLEbAQnt/GE0cQSKnKH6KqUmFqslSaEDUS/r+G+Px
         T52aTEKCk/3MTNheCZrox+bc6yc93rlxuI69dA5UhhvPc702FwLa4mTTizohIMKperO3
         9yNnxSYWu/JII8lac7x16hG6FcU4lNbTCMTldVst+8Gw2duKxYqjW15qKzkruVRCHGxB
         wdUSdqXPMkwxUPXJGbjCvKhySHVhzCvh7LOqUWOob8nOWURLkBfxia3+11elMY/eRz3z
         bX0ENsGYROTKs00PenlcXL1/IXyHHzbW2fttxsGs8SccOtbHkARkfHkqMxMIb+NWMNF0
         hEJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=fdbh3ja1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n204si1648930ybc.35.2020.10.11.23.59.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 11 Oct 2020 23:59:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=fdbh3ja1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kRrng-0005IP-4l
	for alex.bennee@linaro.org; Mon, 12 Oct 2020 02:59:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kRrnC-0005Eh-UF
 for qemu-arm@nongnu.org; Mon, 12 Oct 2020 02:58:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kRrnB-0005DA-1j
 for qemu-arm@nongnu.org; Mon, 12 Oct 2020 02:58:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602485924;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=in4vP4P4euyhUmh7MBEkfRMo9+vEy+KLt+Y2qxkJRGE=;
 b=fdbh3ja1aQgeMxcV2HCKQ5ZEN3HU7fjgfw2O0HteAvYHuU5UNp5ZZDQ2yKz5zIb4GD1/n+
 5LN3+Slz6PdKgq1rM4z4bxOHZfXa20y81hpmuRMdeKygclvRPh7DYuupWmmoOIHtrYEmGG
 9soW/WGm2Olx9mJZEGqdcrj/d2cVh+c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-236-KUhBwydHNiWAXwqOISXQqw-1; Mon, 12 Oct 2020 02:58:40 -0400
X-MC-Unique: KUhBwydHNiWAXwqOISXQqw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A159A107ACF8;
 Mon, 12 Oct 2020 06:58:38 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-113-22.ams2.redhat.com [10.36.113.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5D8825578D;
 Mon, 12 Oct 2020 06:58:28 +0000 (UTC)
Subject: Re: [PATCH 4/4] tests/qtest: Replace magic value by
 NANOSECONDS_PER_SECOND definition
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201011194918.3219195-1-f4bug@amsat.org>
 <20201011194918.3219195-5-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <7067de64-2a42-07f5-a864-74d7524bee5f@redhat.com>
Date: Mon, 12 Oct 2020 08:58:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20201011194918.3219195-5-f4bug@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/12 02:58:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SJ83cqEbBTuo

On 11/10/2020 21.49, Philippe Mathieu-Daudé wrote:
> Use self-explicit NANOSECONDS_PER_SECOND definition instead
> of a magic value.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  tests/qtest/rtc-test.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/qtest/rtc-test.c b/tests/qtest/rtc-test.c
> index c7af34f6b1b..402ce2c6090 100644
> --- a/tests/qtest/rtc-test.c
> +++ b/tests/qtest/rtc-test.c
> @@ -292,7 +292,7 @@ static void alarm_time(void)
>              break;
>          }
>  
> -        clock_step(1000000000);
> +        clock_step(NANOSECONDS_PER_SECOND);
>      }
>  
>      g_assert(get_irq(RTC_ISA_IRQ));
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>

