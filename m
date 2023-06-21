Received: by 2002:a05:7022:ef18:b0:66:7a29:38e1 with SMTP id qy24csp3803365dlb;
        Wed, 21 Jun 2023 09:40:35 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5Bzoj2sAxP5Hk3vQHQO5bGAedtS2VDRgIbfDFKszwT67JS1K/q85eJ08HPmRQLLFP/PF8Q
X-Received: by 2002:a1f:5546:0:b0:46d:e2dc:570d with SMTP id j67-20020a1f5546000000b0046de2dc570dmr5622771vkb.16.1687365635275;
        Wed, 21 Jun 2023 09:40:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687365635; cv=none;
        d=google.com; s=arc-20160816;
        b=GbfFloi3ihRytShYIDJxBU1AGikgMW8KRZ3ks470wpZ4X2gmXfMMwvw4uC7nwL+oAG
         4NZciDHbt5ZCOQ8UjG142alqQqZxTQ+w9AAs/lFyQab9yhyOD4ZipfBSo6d0E2rtu8J8
         AB5FpDZRGcSxc5UR7NhRgFZL1xdAzlxJB3g6RCXiavUxUqfMLV0GcH9iFvqtmc1EBrRB
         UL1Tfr5eW54ZD6EbGXwSFibc0jwefKm1jUdT+phG6e9HpN/uPZHdJy1cES29vQBlt8pF
         m6Y2IgF5YzPdzLj5UID/spdVpRE8cy6dDzrFBd2eZyxnZU87dLWqnCMqrIJRmZX5qg62
         fnJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=YJgOdlW3CSOckzkX2UgA+lpVjTX4djY2QtG3rkKnqXI=;
        b=n9YszhD/othtE20QPMGZlO1UXypALMEtTYUiZSF5Ocupj7WH0rNycFEiKpfF5WEOZI
         kIXgtbhODD1GT1CfzlyeN9jF1NCyV01pTJS8Q+TTWioKdF/TGv2Ox3hwvaFPMf4P9liD
         fr8Ggp9/LzSIApz4z3tCkIeVEll+Lw/rGy8svEbLzkp9yLVf9N9SlzhujwLexZx7Q5ny
         SO3ZP+ddqQ2v+RcjLAOXsUadTi+jJKSmIy8PJAgyaEuuvaByonKIWNUqgvmB/EtNz633
         5uu4Nsr0ox3PBEc4slPXYijLv07rmWl0SO192kLFPqueIXssJIWLRTQo+LGAjxNE6fwz
         /QTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cVBw4zOh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i17-20020ac85e51000000b003f22843a015si1834000qtx.752.2023.06.21.09.40.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Jun 2023 09:40:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cVBw4zOh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qC0sj-0005EU-OD; Wed, 21 Jun 2023 12:40:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1qC0sh-0005DG-5U
 for qemu-arm@nongnu.org; Wed, 21 Jun 2023 12:40:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1qC0sf-0002fL-5g
 for qemu-arm@nongnu.org; Wed, 21 Jun 2023 12:40:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687365628;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YJgOdlW3CSOckzkX2UgA+lpVjTX4djY2QtG3rkKnqXI=;
 b=cVBw4zOhm94OG5fjuzoAlySTTHpHRkYtEXJfYsniRgEu5IftuAVHyflG7F2IuVQWbRS9bq
 R3RjW4Z74YCR7k/1Ku3zv1+dr+mm3Z9Hgkm82hF1Yb6sb5B2DIP9qR0nb4M9+beqogEw7X
 yxgn2gctuznowOkswYfM4wxFrRhEYZQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-301-YG-1XYWjNnCNBGefJKuvpQ-1; Wed, 21 Jun 2023 12:40:24 -0400
X-MC-Unique: YG-1XYWjNnCNBGefJKuvpQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 78A71881B25;
 Wed, 21 Jun 2023 16:40:24 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.44])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CB13C200BA8B;
 Wed, 21 Jun 2023 16:40:23 +0000 (UTC)
Date: Wed, 21 Jun 2023 17:40:21 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org
Subject: Re: [PATCH v3 22/37] crypto: Add aesenc_SB_SR_MC_AK
Message-ID: <ZJMn9fzarTWBnM8O@redhat.com>
References: <20230620110758.787479-1-richard.henderson@linaro.org>
 <20230620110758.787479-23-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230620110758.787479-23-richard.henderson@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: wAgYVKWjBwck

On Tue, Jun 20, 2023 at 01:07:43PM +0200, Richard Henderson wrote:
> Add a primitive for SubBytes + ShiftRows + MixColumns + AddRoundKey.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  host/include/generic/host/crypto/aes-round.h |  3 +
>  include/crypto/aes-round.h                   | 21 +++++++
>  crypto/aes.c                                 | 58 ++++++++++++++++++++
>  3 files changed, 82 insertions(+)

Acked-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

