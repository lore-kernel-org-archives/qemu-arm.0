Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp499009lfq;
        Tue, 8 Sep 2020 04:04:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy2Jx2TtMvWzOoQZhJks42kfZ5zwQlCJ+cW0sfAvmLcamEtiQSgVD199hMDLuBLVaprZeBK
X-Received: by 2002:a67:fb92:: with SMTP id n18mr9467348vsr.59.1599563057334;
        Tue, 08 Sep 2020 04:04:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599563057; cv=none;
        d=google.com; s=arc-20160816;
        b=VXHvY2G72MF8n60ywh/PUiEsgpzeQ3wcSKY4zI97tlpt8IVJi6vd/tDlAC1E3wchJd
         7KyHXiVzUgsWKzIYx2d3cLgUtv+uTsnqMHyDJ0pjJ4sf1pCaFwNtbCNkeKXhWY2QfZxU
         fA2xo0OLCZjenEasbKFR9m3ldr6x7NDq29vBchi32K9lZ48BrR3gK/Ujocb0AINR5xdR
         i6JMls6BsXqLeLC7rzhyQ5kdt9uK5r9RLztPIU8MKZsyDmnX9TZL4V5Tf7rrI9PvZp7d
         CpKyh1E32cmw8X3TmThrtWv4BRxVpikMAXId0tiBBIzP7Toe5QjW89xgbKopgKnIHI0N
         RVMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=idUlkRbzFmq+RjHulhjzdoE0VoHT8VVOsaXc5xe/lZc=;
        b=lgv8u3/cAI8GQGHSnt7KhcPuAeTTx3zHqthC+T2bdfVmjDyWpKXCRub6ts/RD4jj1Q
         yg+TFK/XbpYj07fslTcOT5YwwiiaEPrJDSexYezYLssfsOwUUdE1CI3m+tYH+U5G21pz
         nAEksBUtq7Vopi/K+n7RNUC0ObrhagYnojlvgAF6uimdrtf495Ocqs8n8uyfOMCYaEpr
         PXMzRx9bGXsr1BkC6T9BfeN2/AsksywNdKU1Jm/cTiutH2AyAIIlzpKK0IE75NnChGi9
         al0EM+xhl3lvLejpuyT+0mYCB21lsVdtQXnsjOB90mjJ+iRoR5NRlfrGSA04p2Ihajhx
         JzZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=XGmgTM46;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n4si3271334uap.124.2020.09.08.04.04.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Sep 2020 04:04:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=XGmgTM46;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kFbQ8-0005K8-OR
	for alex.bennee@linaro.org; Tue, 08 Sep 2020 07:04:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kFbPN-0004dw-9A
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 07:03:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kFbPL-0005CQ-Gj
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 07:03:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599563006;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=idUlkRbzFmq+RjHulhjzdoE0VoHT8VVOsaXc5xe/lZc=;
 b=XGmgTM46TA8aWAveS7gY9PqymRaf9ThNzB4I56OHYfBqDOohthweyf48q23F8O1ZcgoKf5
 lapQV6Km7YF5P6FfMsrY/h2u9EafF6/VzmlR3MuDb7A/svMSqAmh7n33ddeEiCBquTSPtp
 JbpbSs0EdGcIx3XoBBA3zSpkCuul5sQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-122-A4FJRq0TMLyDnfh9kNYxuw-1; Tue, 08 Sep 2020 07:03:23 -0400
X-MC-Unique: A4FJRq0TMLyDnfh9kNYxuw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7DB5810BBECD;
 Tue,  8 Sep 2020 11:03:21 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.192.171])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CECD9808BD;
 Tue,  8 Sep 2020 11:03:19 +0000 (UTC)
Date: Tue, 8 Sep 2020 13:03:17 +0200
From: Andrew Jones <drjones@redhat.com>
To: Haibo Xu <haibo.xu@linaro.org>
Subject: Re: [PATCH v2 07/12] hw/arm/virt: Move post cpu realize check into
 its own function
Message-ID: <20200908110317.efr2bwgkityzepbg@kamzik.brq.redhat.com>
References: <cover.1599549462.git.haibo.xu@linaro.org>
 <04a3f2e202d9e84cefa431101eaf4c7e0cbd1a0d.1599549462.git.haibo.xu@linaro.org>
MIME-Version: 1.0
In-Reply-To: <04a3f2e202d9e84cefa431101eaf4c7e0cbd1a0d.1599549462.git.haibo.xu@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/08 02:11:34
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, philmd@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uEfecxxw9M09

On Tue, Sep 08, 2020 at 08:13:25AM +0000, Haibo Xu wrote:
> From: Andrew Jones <drjones@redhat.com>
> 
> We'll add more to this new function in coming patches so we also
> state the gic must be created and call it below create_gic().
> 
> No functional change intended.
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>

This is the wrong version of this patch. You should use v2, for which
Peter has given his r-b

Thanks,
drew

