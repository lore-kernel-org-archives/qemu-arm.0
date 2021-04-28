Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp776943lfb;
        Wed, 28 Apr 2021 09:24:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzEpvXf7Vx+4BBtAAooxaXDj16h/cvJfKpUYBgfKT9SH5aGVhVQc4maTsLSczKb6zMk6OdX
X-Received: by 2002:a05:6512:3987:: with SMTP id j7mr20771601lfu.635.1619627082238;
        Wed, 28 Apr 2021 09:24:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619627082; cv=none;
        d=google.com; s=arc-20160816;
        b=Y5NObH7hzjABCxIHr1Czx1otgnRLfVx8DNwpgwkXNey6BKr2/qJNzmMieP79Gbo5Oi
         JW3EJ1vJ0lM2IWWc1viKMKmcq4tvsfJklz+2jh6cQZk/TOk5l4eCrroRoyHoGYmH1jBg
         issSjAzZHRTDPxmVlvU02ocquL97O++IT/Sd90wZESTWrmTXpO19VlXhcaP8ajWDnFVl
         Rt4imrd6PuczIy7B48O7eqa9rGAhFS6B2oT9WPRMJxGwybSZGKFDvX105Pa7sZ6mta9q
         mJup/cbhEBI+SCRM6OaQD1gTJWCH6N2y6A4vuFWIcQuXWHSk5alficW1RyT/M8nx0c/r
         oj5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:date:message-id:from
         :references:to:subject:dkim-signature;
        bh=jrQj5h1DairF3Ia2cOF4g3e0ThUC2C4VniGShJFOPY8=;
        b=pjVDx34PkeZqjVv/AEYkBopd1GrLZUIqbmZPFiTz/2Wve7Hg2qc2DkIrFWRm3u4VcQ
         T0DC8IkjvV0WSObTw4n7z/72eLX8Qrew7sE/g+BNhxWMV+2ugf6fuQaaVfCWBFO3KJo5
         o1wk7TidyznyHFUefcYpTlx6XPNdgnBHmq01beAc3grswnv1D7gaN/2JD1CzrmT2y0gM
         zhzAzgVM/6KnxadUgsjzIaI4M1VUfO/zaAe9cCdshgDnLrZXew0uI5NWodCEXSpUu8gP
         38LaWIktkT5WmAZ8xQv27zj4OwxXdaKjPEUlv6/4mVfs7j3vBCq0TkMUGoI2uykI8ZIS
         kHng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BUTW9TLU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l17si326717ljn.285.2021.04.28.09.24.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Apr 2021 09:24:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BUTW9TLU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lbmzQ-0000da-JR
	for alex.bennee@linaro.org; Wed, 28 Apr 2021 12:24:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1lbmyi-0008LR-7s
 for qemu-arm@nongnu.org; Wed, 28 Apr 2021 12:23:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1lbmyc-00035c-Gh
 for qemu-arm@nongnu.org; Wed, 28 Apr 2021 12:23:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619627029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jrQj5h1DairF3Ia2cOF4g3e0ThUC2C4VniGShJFOPY8=;
 b=BUTW9TLU+9ATRVTYRlLWZca3abkWjRscMmSdNMuow3/KtLMAzROHvVy4rF4n02WPflmmgH
 oZmylEpGrOXJyNcyqFu5KE8TadV5D+NDvO8yu+qluVmcxsX8/qBYqLAyF9+/XLpf1l5vgJ
 R1AACOr9/ZwkVC1+IpqMgkTl7bZ7fY4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-37-ZdCHUeXiPSmxbVVakMKK4A-1; Wed, 28 Apr 2021 12:23:45 -0400
X-MC-Unique: ZdCHUeXiPSmxbVVakMKK4A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7EF246D246;
 Wed, 28 Apr 2021 16:23:43 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-114-188.ams2.redhat.com
 [10.36.114.188])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A558619CAC;
 Wed, 28 Apr 2021 16:23:41 +0000 (UTC)
Subject: Re: [PATCH 1/7] stubs: Restrict fw_cfg stubs to sysemu
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210426193520.4115528-1-philmd@redhat.com>
 <20210426193520.4115528-2-philmd@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <6c3f66ef-03f6-f883-a7fc-1e16f4fce371@redhat.com>
Date: Wed, 28 Apr 2021 18:23:40 +0200
MIME-Version: 1.0
In-Reply-To: <20210426193520.4115528-2-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TEcIEsWP4joY

On 04/26/21 21:35, Philippe Mathieu-Daudé wrote:
> User emulation or tools don't use / require the fw_cfg device.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  stubs/meson.build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/stubs/meson.build b/stubs/meson.build
> index be6f6d609e5..4ff36401cf9 100644
> --- a/stubs/meson.build
> +++ b/stubs/meson.build
> @@ -12,7 +12,6 @@
>  stub_ss.add(files('dump.c'))
>  stub_ss.add(files('error-printf.c'))
>  stub_ss.add(files('fdset.c'))
> -stub_ss.add(files('fw_cfg.c'))
>  stub_ss.add(files('gdbstub.c'))
>  stub_ss.add(files('get-vm-name.c'))
>  stub_ss.add(when: 'CONFIG_LINUX_IO_URING', if_true: files('io_uring.c'))
> @@ -49,6 +48,7 @@
>    stub_ss.add(files('replay-tools.c'))
>  endif
>  if have_system
> +  stub_ss.add(files('fw_cfg.c'))
>    stub_ss.add(files('semihost.c'))
>    stub_ss.add(files('xen-hw-stub.c'))
>  else
> 

The intent is valid and the implementation looks plausible.

Acked-by: Laszlo Ersek <lersek@redhat.com>

