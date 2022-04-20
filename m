Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp3215002lfk;
        Wed, 20 Apr 2022 08:20:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxatbIbdT1ZSXKdKJJYR92HofF/2Ye0Z/KyPK24r0jDuA4RvHzSUr4778m1RfK6naqtj1VG
X-Received: by 2002:a25:7653:0:b0:645:6645:6ff0 with SMTP id r80-20020a257653000000b0064566456ff0mr1530513ybc.90.1650468001582;
        Wed, 20 Apr 2022 08:20:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650468001; cv=none;
        d=google.com; s=arc-20160816;
        b=YmVv9n679ntSx9XgPprg624xq46JYI7M+c+lhbb7b+QAYLIdEQCFkW8U3PCW7HNQz9
         +13zzF11t6jOYAxL/XdB7+iJZA7yOObl51MPFkdfo9e15xBm1ZY3wVDPKChJUjSxf9ue
         oiYSk499dCLhEtcfXeDE2Dnz1HXIl9QRE14ZhpTzOCoSvOFTucfow+3xuCDj6WQgemsY
         eFBWsjx4AxhkL2TYxAoLOTs3IWnCgs6mIprHUgrCeO8PpwUF6xS+lfnOTTl0IRvUXkdR
         vTlKq9n6t1lipwYFi0G5uJfyLvy1mkb7Lbz1EiWekZGa5Z/bJttdXQdV1R+SGgaB2Zi6
         8QtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=bwyNTkWlmLL4tjk3Wqq9Ot3RDGX0S39CGlieH0ahZFk=;
        b=mRriasf6f14ucII+jQRNQqD9iHsNVnyRVzWd8xps7QvHvNgwev0pwN+QIF5Nr2NWLI
         gdLVe0u7iQpeXv9mpTxYaxvKolWtUO4U8SByMbtBH7lprHnqLD5TPo5TQQXqJVg49pt5
         x2MWENvcOgr2bnOKAt7uXm3JRAmoSBSsIUuO4IXv/DiWj73KM5r9VKBQmj47pvaOWuGp
         G1uDpBTQG/s0ZUQ17CLEfM0pb6fdiS5itAkoS6y6NuBj40/pmEQK3Rfg4g4M/XglR/Xs
         jKjt+P/l9Qz5p6ECzQIuZGYRKU1KxjRtjQOmQXApwfYsHRKDFZbZlBwWkO5NBA1KKOx3
         FFPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=XPQg51aS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d129-20020a251d87000000b0064166125305si157873ybd.5.2022.04.20.08.20.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Apr 2022 08:20:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=XPQg51aS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nhC7c-0003Tn-VT
	for alex.bennee@linaro.org; Wed, 20 Apr 2022 11:20:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nhC7K-0003RI-6L
 for qemu-arm@nongnu.org; Wed, 20 Apr 2022 11:19:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41273)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nhC7H-0006ml-O1
 for qemu-arm@nongnu.org; Wed, 20 Apr 2022 11:19:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650467979;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bwyNTkWlmLL4tjk3Wqq9Ot3RDGX0S39CGlieH0ahZFk=;
 b=XPQg51aSqceLLj7HkZa8f0yLwQLRHyg+mSfi4lRha+7zrK42HHlYFw87d2WbfrU38pADyo
 QUK2Z0myGMyzf5eHAjNEDp9BEbnzpjxveLlroiOoV/43kithDoyZaOqFmfWGBC+ezYs580
 wq34+3mBCPRheCBANcl81jG3lop39G4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-557-xLEzqA-2OGaoQo7CkvD7Ag-1; Wed, 20 Apr 2022 11:19:37 -0400
X-MC-Unique: xLEzqA-2OGaoQo7CkvD7Ag-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 39C4B1014A67;
 Wed, 20 Apr 2022 15:19:37 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E34B572340;
 Wed, 20 Apr 2022 15:19:33 +0000 (UTC)
Date: Wed, 20 Apr 2022 16:19:29 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH 15/41] intc/exynos4210_gic: replace snprintf() with
 g_strdup_printf()
Message-ID: <YmAkgZur4Q41znNz@redhat.com>
References: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
 <20220420132624.2439741-16-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220420132624.2439741-16-marcandre.lureau@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "open list:Exynos" <qemu-arm@nongnu.org>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SoqMXaBaJ8DB

On Wed, Apr 20, 2022 at 05:25:58PM +0400, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> While at it, replace '%x' with '%u' as suggested by Philippe Mathieu-Daudé.
> 
> Also fixes a GCC 12.0.1 -Wformat-overflow false-positive.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/exynos4210_gic.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

