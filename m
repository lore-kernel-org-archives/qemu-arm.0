Received: by 2002:a05:7022:ef18:b0:66:7a29:38e1 with SMTP id qy24csp3804382dlb;
        Wed, 21 Jun 2023 09:42:19 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7AbJ1dAzyc00Ib9wsShFzEfMSS1t6Y13mwGUBx0h7GgMYtKAEiTMglYMm9VtT22XB6E5P9
X-Received: by 2002:a05:6214:19e9:b0:626:33bb:3fd3 with SMTP id q9-20020a05621419e900b0062633bb3fd3mr9796760qvc.19.1687365739171;
        Wed, 21 Jun 2023 09:42:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687365739; cv=none;
        d=google.com; s=arc-20160816;
        b=pjX2NpZnWpYk97w3IDBpEpoNQZ4OHjB8H/ke+HsAEj67oYmk+drUbFCO5qHjVYmJ+0
         1tRHBGuF1CNi9wICHfXr06kvuJBEmA8fdE5lgSDWXptN1N2Qsi9rW7WpRtzbqlyi1l1U
         CeK+bVhmAv4+JkSRM67ZufC22ThGlhIJStHY0TZVPLXP8gc+8ZsyzpNOg0I+JWsaP0L3
         HBmj88b1RBOx1gGNPuAUQ/SaRYF3dRodc2DHqukTSPxUOZQ7eRoWrsN3uTZQ/1bDAkQL
         rUZxioJoME1CTXBa6VFnu0at7j/H7qLOWAXaPid2wBteYQp8xmzLKr0pigu8RodDMQ0i
         kyHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=98e8z/9LqmOyYXEfqKdU+egMzEAfEKb+HmIjv54oIds=;
        b=CyXOJn/1qijkihRCXYGSjgyJumE8ZmCgAdoLqWqPM/T8P0yJbgXvXs6MgqBlYOsnve
         TRyF9QhsI8ZePCmluayDy+pnoik/H4gEn3/pd7tQb/1GlMo61e3N5HYLL+eUAzJLPWN1
         QVuEeAeT0tfOX2hdSfE6dAVJBrzVoUu24GMz9hLaPRLdq1xD67xjCQbd4Dse4TrFMhbH
         dqhIULTKrRmPINcU1SngKdMJlxraQ3adD9zhhNVw50cvpxJ15qPz5zsaXV44dbTyzx54
         FnTSut5ngQA3N/J8bx+mnC0MDrp3MIOdGStCpw6cpqR1tfEYK0eLwmxiUvyCKrcokcYo
         QXxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="IjF6/Dkl";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id if14-20020a0562141c4e00b005ef46551916si1920492qvb.413.2023.06.21.09.42.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Jun 2023 09:42:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="IjF6/Dkl";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qC0uM-0000J0-UJ; Wed, 21 Jun 2023 12:42:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1qC0uL-0000IY-VW
 for qemu-arm@nongnu.org; Wed, 21 Jun 2023 12:42:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1qC0uK-0003en-Aj
 for qemu-arm@nongnu.org; Wed, 21 Jun 2023 12:42:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687365731;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=98e8z/9LqmOyYXEfqKdU+egMzEAfEKb+HmIjv54oIds=;
 b=IjF6/DklMyYSoGlvMf4CxWKS0DdC/sSPdVMOpwASzZObmiKpvvBVoUFP7jj6+LtvRdecmH
 /VGbeQ2Gn6Uor/KjF1mQ2qK9F0Ja8CD4ZKH448nGbkiUq2JP81fElO15OklYs/MayzhiQ1
 KpD2MkTZPCT1eZO7kqnz9fZUz8i946o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-656-5xX-7lD5OWS3LzQ3ttYILg-1; Wed, 21 Jun 2023 12:42:08 -0400
X-MC-Unique: 5xX-7lD5OWS3LzQ3ttYILg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 60E408C589A;
 Wed, 21 Jun 2023 16:42:07 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.44])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9B48A40C206F;
 Wed, 21 Jun 2023 16:42:06 +0000 (UTC)
Date: Wed, 21 Jun 2023 17:42:04 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH v3 32/37] crypto: Implement aesdec_IMC with AES_imc_rot
Message-ID: <ZJMoXMT5ULlBbZGK@redhat.com>
References: <20230620110758.787479-1-richard.henderson@linaro.org>
 <20230620110758.787479-33-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230620110758.787479-33-richard.henderson@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: lb58kZrRvcVA

On Tue, Jun 20, 2023 at 01:07:53PM +0200, Richard Henderson wrote:
> This method uses one uint32_t * 256 table instead of 4,
> which means its data cache overhead is less.
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  crypto/aes.c | 42 +++++++++++++++++++++---------------------
>  1 file changed, 21 insertions(+), 21 deletions(-)

Acked-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

