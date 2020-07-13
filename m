Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3107564lfm;
        Mon, 13 Jul 2020 02:30:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyH4xZ0HHTMPRsYvFNgayAfUYSWlEgibPxkQmfeib2FIYNQurMoq91aPb8/O1mV6YWbpN+N
X-Received: by 2002:a25:6fc2:: with SMTP id k185mr11091497ybc.461.1594632636440;
        Mon, 13 Jul 2020 02:30:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594632636; cv=none;
        d=google.com; s=arc-20160816;
        b=qbpqeQ0ZXmjqgYBz0xHrtOaLxtXEuAWcSkb5rTqOSfwPJIVh912B6YFIAzQrqw8Auq
         2dxJWmrsZBlkzdqYuuHbMhQZ18WGTJBqhqj8bkKxbJcgZU4hrnKmdiKs2ObHrMsfLBix
         IMc8fHGHsfbUbn0n96lmvWxmgadfVF1jByEDtz0MQeFIV9YeaWDQMwuvzyLO3UmH3ofj
         ytoHel+Yf5VfnoNfq8GTYvGDIgn5eTpAkvBPebaRnJnIAl+Rhpm/jhDqvbRclcU6xAV5
         kAOqU6OL3VKv8ngOoSuxnzAzB5tNsLNFVTGpHYqTjjKB8tryFJThiZ03iMI02RGio6xf
         PSzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:dkim-signature;
        bh=FdLMU6qLkcttHLbn7Aa3Ue/IzZRdlcXARXZ7Wgx/G0k=;
        b=y+LFVV6Qn3c7Li9EjBMDzTvSKvQ7TLybbyNtGOEoibphyOlC9G4OJY3gfOc+FLTwnS
         /iqRq6xBDsz2wc7ahZyFhhsnP5/iSm76Gmq5FJfaPDJYhyD5h2ooefGej3eAQReKNmVJ
         RI1oyTvyPSospi2Rz71vgrVMbVMaPXOqR5t2TSBVlk04kK6LTX9fyEexPVdDY6/YZ26k
         sQyGznQCXJVivBDnLbktUADu3wj9dOyfh1ROdiqmz28ASyUhbL8xv/Hdd9RkQl4WPEfF
         xFiUW4BvJ+6c2+hPUypXbXCuD+08uxX98Im2o5gKu3a6eoBSvnUrGFXPT25VnEIZ47y3
         dHMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=c0WT1jaw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f18si4462082ybr.109.2020.07.13.02.30.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Jul 2020 02:30:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=c0WT1jaw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1juunD-0002cW-Ov
	for alex.bennee@linaro.org; Mon, 13 Jul 2020 05:30:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1juumz-0002XR-A3
 for qemu-arm@nongnu.org; Mon, 13 Jul 2020 05:30:21 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:22679
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1juumx-0006T6-Fk
 for qemu-arm@nongnu.org; Mon, 13 Jul 2020 05:30:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594632618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=FdLMU6qLkcttHLbn7Aa3Ue/IzZRdlcXARXZ7Wgx/G0k=;
 b=c0WT1jawZ2gh6sxhLscKYgqlULwS3hbjxhblEBLIC2NG7sORp6/P9dRYwbcTRDBs1JwfvM
 lbFn9fI9YkE875SS52yR0gIrNk64rBe6tafdszhdYOKadCnVhTpaxitmEcHhk/jz3et4Mo
 eHdTDzy7TqkWE32AFNLsMl7rh9QRMX0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-hQ6w5rsyPtmO_WMC_QJjDw-1; Mon, 13 Jul 2020 05:30:16 -0400
X-MC-Unique: hQ6w5rsyPtmO_WMC_QJjDw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5D607107ACCA;
 Mon, 13 Jul 2020 09:30:15 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-125.ams2.redhat.com [10.36.112.125])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B10D257;
 Mon, 13 Jul 2020 09:30:13 +0000 (UTC)
Subject: Re: [PATCH 01/12] target/arm/kvm: Remove superfluous break
To: Yi Wang <wang.yi59@zte.com.cn>, qemu-devel@nongnu.org
References: <1594630986-36148-1-git-send-email-wang.yi59@zte.com.cn>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <62491c40-2812-f7b3-7cb6-498bd587ff13@redhat.com>
Date: Mon, 13 Jul 2020 11:30:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1594630986-36148-1-git-send-email-wang.yi59@zte.com.cn>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=thuth@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/13 02:19:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: xue.zhihong@zte.com.cn, QEMU Trivial <qemu-trivial@nongnu.org>,
 qemu-arm@nongnu.org, wang.liang82@zte.com.cn,
 Liao Pingfang <liao.pingfang@zte.com.cn>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9DSZpV0UtOwZ

On 13/07/2020 11.03, Yi Wang wrote:
> From: Liao Pingfang <liao.pingfang@zte.com.cn>
> 
> Remove superfluous break.
> 
> Signed-off-by: Liao Pingfang <liao.pingfang@zte.com.cn>
> Signed-off-by: Yi Wang <wang.yi59@zte.com.cn>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org> 
> ---
>  target/arm/kvm64.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index 1169237..ef1e960 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -330,7 +330,6 @@ int kvm_arch_remove_hw_breakpoint(target_ulong addr,
>      switch (type) {
>      case GDB_BREAKPOINT_HW:
>          return delete_hw_breakpoint(addr);
> -        break;
>      case GDB_WATCHPOINT_READ:
>      case GDB_WATCHPOINT_WRITE:
>      case GDB_WATCHPOINT_ACCESS:
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>

