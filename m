Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp3343833lfy;
        Tue, 25 Aug 2020 04:24:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzPEhWcjsbkiUSAkfdWVa38+L8kMayTgAsAoNm17wm/2WyK7z1pyqWqnL8EmpggSlo8xXgF
X-Received: by 2002:a25:c0cf:: with SMTP id c198mr15140643ybf.457.1598354664122;
        Tue, 25 Aug 2020 04:24:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598354664; cv=none;
        d=google.com; s=arc-20160816;
        b=M1gd3hshBX/90k5WLav/XbVpO1QORPBMkj+7kwtFZu0m/+bwNs3SsmYuQVDV3DV3YW
         2+SoCiKQkWvX7ck6G4m1P3bgdjEn5CR1TcqiGaptY8G6HlWDFKWFcG3jyQPE5pzSRWGS
         3JxdDMm9FxlZMCYmiW1SpqzFH+0+17o8Mus0YoonbMkWydkXAecbztCD1IhhqochSkju
         76juC/8pKj8xHkylJiifnILTfUHP9WNtK2msyp+n1GjOlpOopwnC2Ne+yTgfQRROSMjp
         bPO47OCIeByecx+ilsDM2CvhStkxfBhHvDvQGnggd8vUYDpRMDvMG1Mjei/k1myL6aET
         R1Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-disposition:content-transfer-encoding:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=DNfzs8EKST4ceM/F+GsbFvrL6Vn0MaYHMUiN1MhorjQ=;
        b=J+lXqsLa5yoPWQJmqzZzN6uILbBgswOm64SUzUiP3oeFMx/kce9iD+S6aOTYh4gsF8
         CGezRFn5pTpdZImChXOKUPhQViC40FKVaCp5M5zXzfq7CpnEPYmlA5SVUnBVtwQRbfr4
         Ruinu2fMm0ASM/GLcY2cgf9gwk63Byyct8kMu9LpRW+1izu8IzpYQ2vZDu68uTsvQ3ni
         VZColK6unqJ1SMMMwhgLv8ADAND/BdkwTl9bSs/J9NZaYxVTU8eZykHVEv+Dg0RnsL9A
         0pdfME1eekRzAnss0giR8vbmHC1YUL3noS8xlyzoJ/65fSf5VbdEgk6u/RXxoXlpw5se
         wUtA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=LdQSbr1E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j132si14165327ybj.327.2020.08.25.04.24.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Aug 2020 04:24:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=LdQSbr1E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kAX3v-0004oi-GI
	for alex.bennee@linaro.org; Tue, 25 Aug 2020 07:24:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kAWzc-0004jZ-LG
 for qemu-arm@nongnu.org; Tue, 25 Aug 2020 07:19:56 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:46976
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kAWza-0005Xx-Rk
 for qemu-arm@nongnu.org; Tue, 25 Aug 2020 07:19:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598354394;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DNfzs8EKST4ceM/F+GsbFvrL6Vn0MaYHMUiN1MhorjQ=;
 b=LdQSbr1E/YI6MpFFdT5xjPbINSDj5AJYvxDsFSJ4gfTwXflAxMuFsdZtHq2z424nHB4kXI
 /F0LniWv0PzgdLjI3U/SwaKcq5hIjXu6cYDwO/evZT4aum8pQfbqTSldQdVqSRaDvdHd4K
 L4/dG1KOfXkHqcdUsYoJC0S2y9Fv1Ak=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-JgBPEo4ZPlW9tDgw9Q6pDw-1; Tue, 25 Aug 2020 07:19:50 -0400
X-MC-Unique: JgBPEo4ZPlW9tDgw9Q6pDw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2FE62427C4;
 Tue, 25 Aug 2020 11:19:49 +0000 (UTC)
Received: from redhat.com (ovpn-114-231.ams2.redhat.com [10.36.114.231])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D01C60FC2;
 Tue, 25 Aug 2020 11:19:47 +0000 (UTC)
Date: Tue, 25 Aug 2020 12:19:44 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH v2 39/58] pxa2xx: Move QOM macros to header
Message-ID: <20200825111944.GF107278@redhat.com>
References: <20200820001236.1284548-1-ehabkost@redhat.com>
 <20200820001236.1284548-40-ehabkost@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200820001236.1284548-40-ehabkost@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/25 01:36:47
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.958,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Andrzej Zaborowski <balrogg@gmail.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8+4ZMxQp4juj

On Wed, Aug 19, 2020 at 08:12:17PM -0400, Eduardo Habkost wrote:
> This will make future conversion to OBJECT_DECLARE* easier.
> 
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
> Changes series v1 -> v2: new patch in series v2
> 
> Cc: Andrzej Zaborowski <balrogg@gmail.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-arm@nongnu.org
> Cc: qemu-devel@nongnu.org
> ---
>  include/hw/arm/pxa.h | 13 +++++++++++++
>  hw/arm/pxa2xx.c      |  7 -------
>  hw/pcmcia/pxa2xx.c   |  4 ----
>  hw/sd/pxa2xx_mmci.c  |  3 ---
>  4 files changed, 13 insertions(+), 14 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

