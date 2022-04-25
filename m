Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp2426507lfk;
        Mon, 25 Apr 2022 07:29:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzb7rLiZknA3Yj78qpZmayNZlG6P/+cIgPJ1d9KxBr3LZ0MlfDWF7lQFLG8iM02WJ/MmXu8
X-Received: by 2002:a81:4705:0:b0:2f0:150b:37b6 with SMTP id u5-20020a814705000000b002f0150b37b6mr17142631ywa.138.1650896990085;
        Mon, 25 Apr 2022 07:29:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650896990; cv=none;
        d=google.com; s=arc-20160816;
        b=VnLx+gIdAAYrCLGGaUftp33fOeP4/7lSrl+Guv2smJD7AECHfCAfDce8rE+a3L4E9T
         hiSOrCtJwWyITDAPY2ZTZoPhzI6exWm9KrZCbV6ISxUHALzsh97sqT/BEQs5zObdT9nn
         +bUH5B6Fy1MBFyMM10grJjua7pul9p6/Q4jMUkzogsz73ZMApTbzcrU9NDz/yUt4e+4z
         W5Bhu2zcTr9vypoVZCvAZCk05uks8uhpjLS+j8+0SOzDYgm/Vq7QxmGSGuVFTmIbGAya
         45gif2hjkpEqCdxzoV6vn7Y+RZVTXPej5YSmwIwSlR3D+mdj44KJUe413jFI3D3+NIHs
         WlmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=s+hsRuLCK45nvPg8Z6TGOVYlq5imMc+N9nydMmwrdQc=;
        b=oUhZ94jG9yzJg8prQ/m13C6haYfKMuLTkAM90vAX63KdXO2OJ6xZtwdITrbiDH/0ml
         6sFMcAU+8HmkDWfWGj9E379ZmiAcL6vQWCwpTqITeKjELmkKTNI34VDrLFLPvEVmU38y
         YAFuTIyjKiR4eqbc/NKQzclwRWCV5HGfOhxGmvkPCRnEPNtP5J5M9IbZBW4M11d1GB3d
         xf6H8KktuXn/tHynXFcaU/n2C5QmqC3b5ttOBHuf6vppIIeqhqCRsrlCLMT+WNjotKhd
         yXYJ6qKom1wR38pJqjwHA4GBOfgV7dt/EoyCB8zpL8uVGe3qgEQsW/XYvKK5CcdOZnLD
         dcEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="TfojE/c9";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v72-20020a81484b000000b002f7e33a0b05si2621806ywa.399.2022.04.25.07.29.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Apr 2022 07:29:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="TfojE/c9";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nizin-000217-Ds
	for alex.bennee@linaro.org; Mon, 25 Apr 2022 10:29:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nizYX-00087H-9n
 for qemu-arm@nongnu.org; Mon, 25 Apr 2022 10:19:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nizYV-0003VQ-Jl
 for qemu-arm@nongnu.org; Mon, 25 Apr 2022 10:19:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650896351;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s+hsRuLCK45nvPg8Z6TGOVYlq5imMc+N9nydMmwrdQc=;
 b=TfojE/c95dYU5atXlwCDaISDw5pCjjZa7yh6QD4I4B+iQiBNUeYv+6Es9gHGPITgxRjWBY
 wcaaOxLBEx2tCRyFzuOQQu8y35owKq92LK2WDjhplOfJTK8fzLOZfnATvDcA4fjzC0tVGg
 H5WHcxrau1bpmHU4btbVlogaZ7e2hEQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-654-agVwhRL5M5iR7qHhMqsVpA-1; Mon, 25 Apr 2022 10:19:07 -0400
X-MC-Unique: agVwhRL5M5iR7qHhMqsVpA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 014C23C025BB;
 Mon, 25 Apr 2022 14:19:07 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.152])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4FFA1404D8F6;
 Mon, 25 Apr 2022 14:19:03 +0000 (UTC)
Date: Mon, 25 Apr 2022 15:19:01 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Martin Kletzander <mkletzan@redhat.com>
Subject: Re: [PATCH 16/18] audio: Remove legacy audio environment variables
 and options
Message-ID: <Ymat1RrqvJudYl7r@redhat.com>
References: <cover.1650874791.git.mkletzan@redhat.com>
 <c88cdd6f3b6d0d8e94753f36a154217a10fd4625.1650874791.git.mkletzan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c88cdd6f3b6d0d8e94753f36a154217a10fd4625.1650874791.git.mkletzan@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
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
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, libvir-list@redhat.com,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, qemu-arm@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Darren Kenny <darren.kenny@oracle.com>,
 Thomas Huth <huth@tuxfamily.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Gkm2e0eCBQ4w

On Mon, Apr 25, 2022 at 10:21:59AM +0200, Martin Kletzander wrote:
> Signed-off-by: Martin Kletzander <mkletzan@redhat.com>
> ---
>  audio/audio.c                   |  13 -
>  audio/audio.h                   |   1 -
>  audio/audio_legacy.c            | 555 --------------------------------
>  audio/meson.build               |   1 -
>  docs/about/deprecated.rst       |   7 -
>  docs/about/removed-features.rst |   9 +
>  qemu-options.hx                 |  10 -
>  softmmu/vl.c                    |   4 -
>  8 files changed, 9 insertions(+), 591 deletions(-)
>  delete mode 100644 audio/audio_legacy.c

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

