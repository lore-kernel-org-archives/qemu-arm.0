Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp2377537lfk;
        Mon, 25 Apr 2022 06:21:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxhOwcXXUK5YyIzrD0XvUVV0wplLSxh71VgnTQzAtn/HF64Rr/LT/qQ6srSvNSbuhf4qlpu
X-Received: by 2002:a05:622a:120a:b0:2f3:5c49:2987 with SMTP id y10-20020a05622a120a00b002f35c492987mr9409898qtx.658.1650892862182;
        Mon, 25 Apr 2022 06:21:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650892862; cv=none;
        d=google.com; s=arc-20160816;
        b=GXmMkAsnHedRIRWekoDzOMQVR84YP3yUphqI4cLImvhEVV1mJQNtSMpomdLgdL2j7j
         PcsYcoYPmO3tBv4SA70wqlSzoFDkMNvRk01SltnVZVlRUbE1IfudL1scyGUvOnlqGnQ5
         X5a8OBk6uRMBtRhC9uk9r3V3FP/vsQ1p+mlcjL2iszLLmRj2yDxUMYsBsjULSt8CoIcr
         KJn1dt6ru2mhvUda+OyxHYHAkfnDZVUT658tlxv234TxKTdR53jmCFSlbduFZATUkRUj
         b9ex3n6APr43vrGL9PxZMqz0m+Rhgyz6mR8LIZpkexC0m2B3ZsdfcbI0HKKNH9syqe7u
         yJOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=++tvia/iVh3LAnW0YCCSS3jUptXgG2XgazghtCrLCgY=;
        b=02LI9i6DDIvxUepWB9MMZeKT0axacWSPp3v19jlCR+J47+TvErgTDxdIj65LdtHQhw
         9WgzdKidorSPE1P7f/ua5IkZEbjX0IM7cciD1aPAswUBXbpc2Tc8864saHr+/U33spV+
         ztygqLE5/qHFvHJvR9xdfyMQVDPrGPO8AImLhzV1n8038JOpsyjKzTlL+vVJbunwhswQ
         hfSI/8kR8AIB0IMpKF7QPTEiGhl6vt1USkMy7RFY5iQVqQYyAtvO9pCTqhF6vzhD06k5
         87c1BHI0PnuFQl0YT5IZyxsjmnUO0R1bw2hRTW6ASoHjif3YfAnLM7nkyU21e/QOz6FI
         9aLw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=dP+4XMPt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f12-20020a05620a15ac00b0067e98304433si4207567qkk.605.2022.04.25.06.21.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Apr 2022 06:21:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=dP+4XMPt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1niyeD-0002qd-K2
	for alex.bennee@linaro.org; Mon, 25 Apr 2022 09:21:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1niycX-0001ET-3Y
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 09:19:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44251)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1niycV-0001ju-Fy
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 09:19:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650892754;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=++tvia/iVh3LAnW0YCCSS3jUptXgG2XgazghtCrLCgY=;
 b=dP+4XMPtFr/JntUzNhdkb2OdkW85v1rK9+KKA79hEZWOFFXeHqB0nDXWz8aeDHgl+asknp
 wGvjBmV0RbozNbPU2T/8jIn0xFNbpaUyO85jjAyh/AsVJ/fjFnlynb17rir3mQHB8cHhlH
 MPLVkSTweyL7ODyYnNgbqDi5RmBF+/s=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-455-Nm2w-HjfOxGsm6p9dgDQVg-1; Mon, 25 Apr 2022 09:19:11 -0400
X-MC-Unique: Nm2w-HjfOxGsm6p9dgDQVg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9324C299E765;
 Mon, 25 Apr 2022 13:19:10 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.152])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E47C054C724;
 Mon, 25 Apr 2022 13:19:06 +0000 (UTC)
Date: Mon, 25 Apr 2022 14:19:04 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Martin Kletzander <mkletzan@redhat.com>
Subject: Re: [PATCH 02/18] hw/input/tsc210x: Extract common init code into
 new function
Message-ID: <YmafyFNoQlUQYJYg@redhat.com>
References: <cover.1650874791.git.mkletzan@redhat.com>
 <1d75877cf4cc2a38f87633ff16f9fea3e1bb0c03.1650874791.git.mkletzan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1d75877cf4cc2a38f87633ff16f9fea3e1bb0c03.1650874791.git.mkletzan@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, libvir-list@redhat.com,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, qemu-arm@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Darren Kenny <darren.kenny@oracle.com>,
 Thomas Huth <huth@tuxfamily.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: D1e/tdorqk87

On Mon, Apr 25, 2022 at 10:21:45AM +0200, Martin Kletzander wrote:
> This deduplicates several lines and will make future changes more
> concise.
> 
> Signed-off-by: Martin Kletzander <mkletzan@redhat.com>
> ---
>  hw/input/tsc210x.c | 68 ++++++++++++++++------------------------------
>  1 file changed, 24 insertions(+), 44 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

