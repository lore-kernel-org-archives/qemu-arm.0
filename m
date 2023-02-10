Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp1867540ejb;
        Fri, 10 Feb 2023 05:44:17 -0800 (PST)
X-Google-Smtp-Source: AK7set+522TjymXn5A22hHu7fHQAFHxSNMtO+8Q208kMVM8xfNIDCX+i053//E1IjzPh9z18zi7y
X-Received: by 2002:ac8:5e11:0:b0:3b4:79f8:26c3 with SMTP id h17-20020ac85e11000000b003b479f826c3mr25658700qtx.33.1676036657044;
        Fri, 10 Feb 2023 05:44:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676036657; cv=none;
        d=google.com; s=arc-20160816;
        b=AFtmSNIH8ytiRBWahvmwsiSQF1w+ptLEgvoHKKBnrz8ZJrGS9DNX1fdBsWQCuwjI7r
         VjWdfROH0bi7pJ1bIXqeV9G/g3nS32mpNP0OLlncYYkHtvOmFNDAtLBRe+ZIFNdEWaP3
         7zrtt9NsbB+SO5HCtEMQtnTbKC/v/+OrfgisB0ujQmepc63GUR2fXDgEm64vEbmZnCGE
         Qht2CpWDN6H03swxC7dCsnDjcGwCtkiArwzn4YB+EerY+3MG6q5D/IPCn3jCyYPzWkqG
         XfgHH5AZi0YFfrykOaxSHS2cH1d7rNtotPq451Xq1QHESQPynN5FP8Gmpe96gvhm40kY
         dMwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :message-id:in-reply-to:date:references:subject:cc:to:from
         :dkim-signature;
        bh=EL5rrRPFH49W9UBSKsqsaxrZkA2Iu8IOm+DsRbOGSqQ=;
        b=BcMduabT5DtTaCq0HHspbNWTgW5E8Y464/KfpekS/qfV5GeeteD+Kge6ZadpxgwHw7
         A7wrEJ1PQYDmie8HbAb7u/M64ACNqTEC+30M9PIyrEK/rUNn8ni/U4c6kwKf7LCS0eoB
         QhPeGpU1iPTjhs7wx6ofu64HiPRbBYHr7xpsZHedBKWsfXvWu4c38UHzWVifM5lnnl5M
         Pgcg2WOtOOTlsRHW0gm9FjKuhg2fM9X2nL9ENztDksZtiTiCu5zPPPG92PLCxLKxekpL
         nRpUCevJ7nEUPUv6PD2Qu/O6uKN1Phc8MViUBJ8XNgytTdHGDoL9ABfA5uQriwsAVgI1
         LuBg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dvDEx6Bp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w18-20020a05620a445200b0071e1107074csi4399293qkp.279.2023.02.10.05.44.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Feb 2023 05:44:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dvDEx6Bp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pQTgw-00082I-Ta; Fri, 10 Feb 2023 08:43:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pQTgu-0007zJ-6b
 for qemu-arm@nongnu.org; Fri, 10 Feb 2023 08:43:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pQTgs-0000Mo-9q
 for qemu-arm@nongnu.org; Fri, 10 Feb 2023 08:43:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676036629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EL5rrRPFH49W9UBSKsqsaxrZkA2Iu8IOm+DsRbOGSqQ=;
 b=dvDEx6BpLBsZW9nlmtHx3xZexpXSU1CIIqnWH29YWmqjr0Q266xJQBPnZNudTUgD/QwcoS
 Z/JDjK+8YGGkTs/RtfOKY9QqtCYQXTFUIZUDTJ6FzDZMwvA+fwwBKZ01qK2E7TgFuUDUTy
 XnFJszg28KL7CZ74/LjDs5iCjKPPhA0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-136-Xuv2iYDuMpeXP8pNnXx8Ew-1; Fri, 10 Feb 2023 08:43:45 -0500
X-MC-Unique: Xuv2iYDuMpeXP8pNnXx8Ew-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C4FE097108A;
 Fri, 10 Feb 2023 13:43:44 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 99B0B400DEF3;
 Fri, 10 Feb 2023 13:43:44 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 87A3021E6A1F; Fri, 10 Feb 2023 14:43:43 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org,  qemu-arm@nongnu.org,  qemu-trivial@nongnu.org,
 Beniamino Galvani <b.galvani@gmail.com>,  Peter Maydell
 <peter.maydell@linaro.org>,  Strahinja Jankovic
 <strahinja.p.jankovic@gmail.com>,  Coiby Xu <Coiby.Xu@gmail.com>,  Gerd
 Hoffmann <kraxel@redhat.com>,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>
Subject: Re: [RFC PATCH] Do not include "qemu/error-report.h" in headers
 that do not need it
References: <20230210111931.1115489-1-thuth@redhat.com>
Date: Fri, 10 Feb 2023 14:43:43 +0100
In-Reply-To: <20230210111931.1115489-1-thuth@redhat.com> (Thomas Huth's
 message of "Fri, 10 Feb 2023 12:19:31 +0100")
Message-ID: <87zg9lpre8.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 8lzIYc4x3132

Thomas Huth <thuth@redhat.com> writes:

> Include it in the .c files instead that use the error reporting
> functions.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  RFC since it's more lines of code - but I think it's still cleaner
>  this way.

Yes, please!

Reviewed-by: Markus Armbruster <armbru@redhat.com>

