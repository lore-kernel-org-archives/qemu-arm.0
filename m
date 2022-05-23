Received: by 2002:a19:ef07:0:0:0:0:0 with SMTP id n7csp3379564lfh;
        Mon, 23 May 2022 03:15:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzmYKv+6N4YDzonXy/E5Hz32Rkx7pUn3WVNeGScKOugJ/ZYkLapCs1pPwFncn6znHwc1ANs
X-Received: by 2002:a05:620a:28c3:b0:6a2:f6b8:d7a with SMTP id l3-20020a05620a28c300b006a2f6b80d7amr12997006qkp.440.1653300921352;
        Mon, 23 May 2022 03:15:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653300921; cv=none;
        d=google.com; s=arc-20160816;
        b=xIaBNUmyx3jyAW9vV/BRCf7LcRm1WI9FdoibxOyLVubQhmwsg5pj5MIoyhRaUAF/qo
         7yeinSkWLbMjh92sWXDqgjRBG6aGQYtNfBlCGJCm7xqrtg6KT+RNO7oMlxlIbA26mJaj
         ZN5eG327rlLC4StkNa1kKKu7vVAFeLG9wahtPnPBI/r9cmh2L9Ma8YlhACG5TP6ET5Cd
         w6xBaOmw7JWzz2c3hlS1Lz/O4gEKlMz3As3wHJy2LThgadI/9jAsTaxM2wojg1HNspUX
         82KjU0fIEJWar53Pzf3OhOReWI8WzD18VsypCx68smKM2eGDo6NwfsnTrI/8/oWxwXpH
         WXQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=Lyong23qMXke11z2iOQ99G1vZJsupYuz8uSmXiTt+Yk=;
        b=AQPUYwaB0gI+o7skJraBwQp3zBzGe7R37INsexCZbaZFQ9f7wb/lICjvxjsQzeMY+v
         D+vluR4oZmqK0CDjCrpsv98FePq1Q2YLEGlbaALKgWx4bxkzunKyg0n2/+WqLRxlqZ6r
         BK14wrkLoIaIDtz2u+4m2n/KA4RvlGpVuAxy+39ARrUrOuk8dIMYtyI6zLIdQyDcTL8e
         +XcohQnokF526QfJAcaom9ETpoMOepIl155ShxEVZTkcLEHl1bKx9X90B4YStCYiNwXa
         K8Z/uEM1hWt7ek/7I1BbgNof4amkxDViIRuDsGSeDVEiRWi8y5s2GcdPEhG6G7U5k1kG
         /xHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TcEnmpja;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k8-20020ac85fc8000000b002f9102e5b0dsi2849585qta.513.2022.05.23.03.15.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 May 2022 03:15:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TcEnmpja;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nt55r-0006ZZ-Vl
	for alex.bennee@linaro.org; Mon, 23 May 2022 06:15:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nt53Z-0004x1-Ci
 for qemu-devel@nongnu.org; Mon, 23 May 2022 06:12:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nt53X-00058Q-19
 for qemu-devel@nongnu.org; Mon, 23 May 2022 06:12:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653300774;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lyong23qMXke11z2iOQ99G1vZJsupYuz8uSmXiTt+Yk=;
 b=TcEnmpjaa5QFS4SayrAXhgCd//Tjz3xjBowYoFxxflS3XpyLn/r0EXF1Q38Sw2q+tgliYJ
 tOvlQQhSmuGXceHRONCoPnEmAxYL8tDkn4YwnxHpL7+aoB7iNj+G95FkoI1IXsOuNw0tpt
 BvO/GvdrV/i3PIPtD6Snrix4Z/58OZ4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-122-RDU_a9sqOFqPVCPi0qyHXw-1; Mon, 23 May 2022 06:12:51 -0400
X-MC-Unique: RDU_a9sqOFqPVCPi0qyHXw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9EE4F29ABA1C;
 Mon, 23 May 2022 10:12:50 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6194E7AE4;
 Mon, 23 May 2022 10:12:49 +0000 (UTC)
Date: Mon, 23 May 2022 11:12:47 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, laurent@vivier.eu,
 mjt@tls.msk.ru, danielhb413@gmail.com, clg@kaod.org, mst@redhat.com,
 qemu-arm@nongnu.org
Subject: Re: [PATCH] Trivial: 3 char repeat typos
Message-ID: <YoteH7Ise8EXDGrE@redhat.com>
References: <20220523095629.144441-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220523095629.144441-1-dgilbert@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3NDg5zZh/v7v

On Mon, May 23, 2022 at 10:56:29AM +0100, Dr. David Alan Gilbert (git) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> Inspired by Julia Lawall's fixing of Linux
> kernel comments, I looked at qemu, although I did it manually.
> 
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  hw/intc/openpic.c                | 2 +-
>  hw/net/imx_fec.c                 | 2 +-
>  hw/pci/pcie_aer.c                | 2 +-
>  hw/pci/shpc.c                    | 2 +-
>  hw/ppc/spapr_caps.c              | 2 +-
>  hw/scsi/spapr_vscsi.c            | 2 +-
>  qapi/net.json                    | 2 +-
>  target/arm/cpu64.c               | 2 +-
>  tools/virtiofsd/passthrough_ll.c | 2 +-
>  ui/input.c                       | 2 +-
>  10 files changed, 10 insertions(+), 10 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

