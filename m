Received: by 2002:a17:906:494e:b0:982:8c08:340e with SMTP id f14csp2910626ejt;
        Mon, 19 Jun 2023 09:50:47 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5qD5JeUHfMA2otblzgc3rKJxpk0ETyAzTcJPNht8B+W9pUuyrpQcnz1GQvOEqG/OjQLVtL
X-Received: by 2002:ad4:5746:0:b0:621:700b:f9ef with SMTP id q6-20020ad45746000000b00621700bf9efmr4214995qvx.15.1687193447439;
        Mon, 19 Jun 2023 09:50:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687193447; cv=none;
        d=google.com; s=arc-20160816;
        b=D/5Kni9WNiL/woZLm3wxl8FVBaHgVAm7owd0517D2ICANB8th+veyMw6hHArmzZDBh
         /ZAyXda0F9DPNtBIcx0piRB7K3DGllPJk65gk1E+iQNKA/7PE1BEUokKQPzPHTxupK/g
         tMkVqZrjGX/n+pFxCwi1w6DB8MQj/1alX4rRghOMjgBorlX710v4mgASx4s5EdyZrdjI
         o/Y4+QP7y2TSyIoSRQkMS/x9FqNTcft/AqH82t+u0lPCfDLib1hrz7aNeMHvI9i+xUi3
         Y7IhpnYwPEzr2xAcFo04XmYbFyi7IqKovJCr9cyyRY+pTsR1J4m3keDS4fY1DVHeEEJX
         tH/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=9n58Lqm5i2hK98bcuJbfJLqpasaimpFTgsqHuYyTG5k=;
        b=kaX45IUHgltaDm4BcTgLL9GgaIqLlJZ0AqCJxQfBl9iWuQm8t0WVAT7zNL/S6SmRn8
         Kkb07pjI5cNW0fax0rpZzJyS2pOgAKUi4bQlnMEmwZdzD+ECg/gIq/YBZrPlP4KDvLto
         Sa7L3L9+4zdbyf1kqoFocXk1WlCuk0Mal/jvmjWqOMVgYz5LVSDXWxSnmHz2aRDw0kjG
         FX7nEZebXd+tEZkkdyI/t8f5SRAFCknANaELL4Dq05VzYLnSbXDphe1u4O2v36qPzv4R
         ZoMS9mGELBQKKWkacOjdJfx8DerxD9Y90vn5h2+uC2qepy7U458dNoxS6M4vmGp8Z3tw
         aSJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CSye9xff;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dv12-20020ad44eec000000b0062ddce6bf96si109957qvb.220.2023.06.19.09.50.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Jun 2023 09:50:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CSye9xff;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qBI4n-0000C8-65; Mon, 19 Jun 2023 12:50:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1qBI4k-00007E-BN
 for qemu-arm@nongnu.org; Mon, 19 Jun 2023 12:49:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1qBI4i-0003Ay-97
 for qemu-arm@nongnu.org; Mon, 19 Jun 2023 12:49:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687193395;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9n58Lqm5i2hK98bcuJbfJLqpasaimpFTgsqHuYyTG5k=;
 b=CSye9xffP/uUEqruvLbSIk/xxYT5LHZ2h/mJBCZvUqYfBpkl8ah3mT7teo9ZCQgE4szvY6
 gEaPqx2beUUOZ8g2zbfsu1xsaX2MaGr8lPANFZ6NqOMlj9uP1IU2KvSm1GJXULa+4OSByH
 adCfCnoznQKUAVkdT7fgCs5K1nhugoM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-543-KxOhP5yBPQeCwC1etxdKQg-1; Mon, 19 Jun 2023 12:49:51 -0400
X-MC-Unique: KxOhP5yBPQeCwC1etxdKQg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 390A818F026E;
 Mon, 19 Jun 2023 16:49:51 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.57])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 48A2C83B8B;
 Mon, 19 Jun 2023 16:49:50 +0000 (UTC)
Date: Mon, 19 Jun 2023 17:49:48 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, ardb@kernel.org, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH v2 04/38] target/arm: Move aesmc and aesimc tables to
 crypto/aes.c
Message-ID: <ZJCHLPZcO1gfW9xY@redhat.com>
References: <20230609022401.684157-1-richard.henderson@linaro.org>
 <20230609022401.684157-5-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230609022401.684157-5-richard.henderson@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: FRePceb1UmB4

On Thu, Jun 08, 2023 at 07:23:27PM -0700, Richard Henderson wrote:
> We do not currently have a table in crypto/ for just MixColumns.
> Move both tables for consistency.
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/crypto/aes.h           |   6 ++
>  crypto/aes.c                   | 140 ++++++++++++++++++++++++++++++++
>  target/arm/tcg/crypto_helper.c | 143 ++-------------------------------
>  3 files changed, 151 insertions(+), 138 deletions(-)

Acked-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

