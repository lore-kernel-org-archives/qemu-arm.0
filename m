Received: by 2002:a8a:1930:0:0:0:0:0 with SMTP id be48csp67709ocb;
        Tue, 4 Oct 2022 03:20:32 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5RDtKWKO2sSWOz8wAZbvYpJu15coEh1bYxo45zyu6CLsp/8jArT0e6JtYYg/kOGmyWkNyw
X-Received: by 2002:ac8:7c46:0:b0:35d:147c:38ff with SMTP id o6-20020ac87c46000000b0035d147c38ffmr18801634qtv.1.1664878832610;
        Tue, 04 Oct 2022 03:20:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664878832; cv=none;
        d=google.com; s=arc-20160816;
        b=z6ngTSMrenajMZuHw1Ux2gDzL+H3RhA+qtkS31Jx1UBzjhj29UkJf9ZP+j3zEDjm6U
         vK6ctQoonMdjamKJIj/9Xe3pM4FEZj1Qr3k4BPdh3PGpblh2hYF+jmGnXyviZvYGMHGv
         8y0561A64ovpNnCx/QE8T8j/fyVA2NrdLnjromkfHzF5do2MtV+5vSOzk7LR2NkcO6AH
         Pcq8tV1ALWPMpfaLjGHBGYnGVIGOHYAId8Ee1cuW2EZtLOKJPzdFTts5oMBvyEUxjOP+
         B3D/ruv3QoJH9d9N7VvkGG+cpuCHCgc5U4OEIx8n3svcp4UOgv0SiFFU2k4qaFWm4he2
         M9Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :user-agent:references:organization:in-reply-to:subject:cc:to:from
         :dkim-signature;
        bh=sqrfX0TgWILJIiENmB15OBjvH/Ska7zU43OnzRtuTTE=;
        b=0cesfPOD7MniZcC9M3tmjFdjXnq+qT/lfmRov3Lkiv7objLSzU+vmdV1LtFiRA9J6H
         sM334H/tNvnAeHz8AjghqljaVa/yrQAlr76B1P7NUpE9lvpxiUDVXqz6qEVx6mEA6/tK
         aGBvJ5NIqpGEkWDTI4ufpgvXUKA79f6FByOQ1auiZLCw2SOkQ4OflrkEnqge0xftvDea
         mSttBHqLPfFmPA1wcbRAQE3LoFXodbiVRHRyMdVHsf/O0Xrsfwfoh1dbJkHqkqtQi6Ra
         oDMiYagIiL4uy+VlPQEfm29pimtBMKJ2Ix604BEAUHupUAPTUrNEA6kOqPqosmQLvrSd
         Qvbg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=A04FkUMS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y12-20020ac8524c000000b0031eb57e2ac7si4537907qtn.75.2022.10.04.03.20.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Oct 2022 03:20:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=A04FkUMS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1off2O-0002xB-7Q
	for alex.bennee@linaro.org; Tue, 04 Oct 2022 06:20:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1off0w-0000cr-9o
 for qemu-arm@nongnu.org; Tue, 04 Oct 2022 06:19:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1off0u-0001D6-Gg
 for qemu-arm@nongnu.org; Tue, 04 Oct 2022 06:19:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664878740;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sqrfX0TgWILJIiENmB15OBjvH/Ska7zU43OnzRtuTTE=;
 b=A04FkUMSFcV4CzcslIlGs+HLCyA+Gntv9WwzgYueHR0+W6mxaEu/PXvtEzr6kLlQu9zl8W
 1e3rZJeoOwFT9j2J8DCJrNDd+cCkJ1Rjgez9mzqlftvKY8pZ6waYAHLq2Qx/oLogZ7PW2y
 A49TVlO5PSQWEHqV3WysHfuofk45o/0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-206-jlo2J32rPCSxl9rsBnxm9w-1; Tue, 04 Oct 2022 06:18:58 -0400
X-MC-Unique: jlo2J32rPCSxl9rsBnxm9w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 64C1C1C05144;
 Tue,  4 Oct 2022 10:18:58 +0000 (UTC)
Received: from localhost (unknown [10.39.193.73])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 15C632027061;
 Tue,  4 Oct 2022 10:18:57 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, eric.auger@redhat.com,
 zhenyzha@redhat.com, richard.henderson@linaro.org,
 peter.maydell@linaro.org, shan.gavin@gmail.com
Subject: Re: [PATCH v4 3/6] hw/arm/virt: Introduce variable region_base in
 virt_set_high_memmap()
In-Reply-To: <20221004002627.59172-4-gshan@redhat.com>
Organization: Red Hat GmbH
References: <20221004002627.59172-1-gshan@redhat.com>
 <20221004002627.59172-4-gshan@redhat.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Tue, 04 Oct 2022 12:18:56 +0200
Message-ID: <87h70joprj.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: i9miixMPqW4m

On Tue, Oct 04 2022, Gavin Shan <gshan@redhat.com> wrote:

> This introduces variable 'region_base' for the base address of the
> specific high memory region. It's the preparatory work to optimize
> high memory region address assignment.
>
> No functional change intended.
>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/arm/virt.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>

