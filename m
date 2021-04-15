Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp607007lfr;
        Thu, 15 Apr 2021 08:01:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwm5BJ+9AA53cna4YOWJn85+I+F6f1zxEjTeO5NdRNrELnDdqCfuzMW1gqqRkoo9Ug4m0bG
X-Received: by 2002:a02:1c07:: with SMTP id c7mr3260247jac.111.1618498904344;
        Thu, 15 Apr 2021 08:01:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618498904; cv=none;
        d=google.com; s=arc-20160816;
        b=D/Bfa9n0VHh4/t5+Xr/80+BO0MbQhYzhZtn7EqaOYP7AvGBzJAHc+ow7kvvuhf/gzb
         MxNNgd/jqugyWl+z2BdXaY9WaW8UU2PdrHJkoq0GdJ+qOyCnF+ez9bA+hHqcSgGB3m5j
         HESzU9reWrL2yAziUBZQcrGe+zqAwXyBMc/No/6xocvGya9aDhudQTEXOcitLdaMSgkH
         LPbF4EksXC+aq3MDfShd/p/Y5y6qujGR3eKoOCzhCblnCru7WOjzAMyBB+qpLoKUzh/5
         p+0ABwgZmTbqQmLIpkEEuDnNUVApZVbY6q/u7o9YqGncg4iaBmezjEng7bsvC9RU2RJV
         xuLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:to:from:date:dkim-signature;
        bh=ek2ZboNs3N7NikmlRssAamesZ5Gv66almwdp8Po0v0c=;
        b=CNaj88nXpO9NvS5K85TuiXZLZFExRx1fmPInyOzLibZINwGPTalpWAMSuuxrAXqHhL
         niVR5zqp/GKkFkwNsaVh85hwL2p6hqKcIhnxuiHOneUtOi4pTViSgJiNSxatRRUawPNZ
         Arag+COhuIhCBSwujhXTGrxNuDoR67mcKnlElidfcOUXih2I74r59W9whL15FMI454AO
         WfNCfe20KGKabjy+ocJKPjoxSnrsOI8DAmczvdyBNkVunK4wbJlyZ8JsIqkWDro2Enmy
         TTovAeakH80vnvK/H5HaIRB9kHWwuY+o9ocxtFojdptrZueDXs3ahom3X2fwhyXVM657
         vQmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=VoNaruiP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v19si3051033iom.33.2021.04.15.08.01.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Apr 2021 08:01:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=VoNaruiP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lX3Uv-00029I-AI
	for alex.bennee@linaro.org; Thu, 15 Apr 2021 11:01:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lX3TY-00024U-HW
 for qemu-arm@nongnu.org; Thu, 15 Apr 2021 11:00:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lX3TE-0004xx-BK
 for qemu-arm@nongnu.org; Thu, 15 Apr 2021 11:00:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618498785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ek2ZboNs3N7NikmlRssAamesZ5Gv66almwdp8Po0v0c=;
 b=VoNaruiPi04rNAYKY9KCHS31kQnD4IFoZjJL6IfWL5cNHHjx54/cO7Qi4574FldCut93Pt
 jXNqCgdN1mmZL8P5+gMx+L4KgFtts8Dzcmxyf7B6mEYI08q4/vt/jqM++KC4iMgyfwYm6I
 AxhpkzPKDFVVT+ObRAXJbZylptEzV3w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-5inTwRgrPoK6grZLdWcVDQ-1; Thu, 15 Apr 2021 10:59:43 -0400
X-MC-Unique: 5inTwRgrPoK6grZLdWcVDQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 24A916D586;
 Thu, 15 Apr 2021 14:59:42 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.192.57])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DB0C819C93;
 Thu, 15 Apr 2021 14:59:40 +0000 (UTC)
Date: Thu, 15 Apr 2021 16:59:37 +0200
From: Andrew Jones <drjones@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH] MAINTAINERS: Add qtest/arm-cpu-features.c to ARM TCG
 CPUs section
Message-ID: <20210415145937.trnl46pedoababsa@kamzik.brq.redhat.com>
References: <20210415130148.4066310-1-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210415130148.4066310-1-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +qpxggMiiO3J

On Thu, Apr 15, 2021 at 03:01:48PM +0200, Philippe Mathieu-Daudé wrote:
> We want the ARM maintainers and the qemu-arm@ list to be
> notified when this file is modified. Add an entry to the
> 'ARM TCG CPUs' section in the MAINTAINERS file.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 36055f14c59..d5df4ba7891 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -156,6 +156,7 @@ S: Maintained
>  F: target/arm/
>  F: tests/tcg/arm/
>  F: tests/tcg/aarch64/
> +F: tests/qtest/arm-cpu-features.c
>  F: hw/arm/
>  F: hw/cpu/a*mpcore.c
>  F: include/hw/cpu/a*mpcore.h
> -- 
> 2.26.3
>

Acked-by: Andrew Jones <drjones@redhat.com>

