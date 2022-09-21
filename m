Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp2179603ejy;
        Tue, 20 Sep 2022 20:36:35 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM59kjnuZUHMAsRA93Zb+reJVPvIXuVO7+PCM6oaO8hZJrkmbhpBuBzOqlHrcCDY9h3y5bpH
X-Received: by 2002:a05:622a:50:b0:35c:ee8c:c643 with SMTP id y16-20020a05622a005000b0035cee8cc643mr9132343qtw.315.1663731394908;
        Tue, 20 Sep 2022 20:36:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663731394; cv=none;
        d=google.com; s=arc-20160816;
        b=m/5dJm2j7ypJpjTCvAhjYPp+NBctepj5q3AKx35z5pokezwN055AklvfsShV5zUzVT
         h5JA5XvQlBUcewHfeYs8kmiUUIp+x6b3XVdn71o//0YOOgml3O6Y+ijshjylryLjirgB
         uAE1CuE7PBX3D84LlJO59CrHBb5Gid11YWHY91b52vmN4e2N8zpLdl2Puc/Lhhx79K13
         aqPeU5upt9gKURBWTmN5g3VFZoywc6gfvCjpofZARFxwDWIkIoEtf4SOXCKdfZ/D61vK
         IT9iKdrBCB7psb09CVQGBE76ir4xtbQe0hfT2HwTIWN0P/exnzB8zJBVyoCzFmGW/Vcx
         3pDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :message-id:in-reply-to:subject:cc:to:date:from:dkim-signature;
        bh=XTK1AEMLeWi+QR+6ss5HmHhYJD8qrWb2RJXVIIuUrow=;
        b=szQgEkHr67ZRuqUfu8CQBSCrgDbxsK+p+nvOFaC99HtbVumTZotbYLeynHWAhFcR2R
         s2wt0+im/W8f/HLUkdSFE+uKWKWo+DYlt67GhX6TCsL67+X1AMjBDKVDGBUOj5UUcM7T
         iJrDuig8Yofpef65fP9817iYhmwjkHotanrkYPhn9idclFKMCpTrRPpog591VA7pyfV5
         tOomUJMmzLl22gWtTpYAASK4HSith7q8zYMe01Z55endK7hKVvbPFvbRm5mRFx/OL/dT
         oxFFovRf/Ma6Xyam677pu+upGVeF7hbyJOzrro9y4FX8J7cm2D0yzot9VhLwAIlah7P/
         NlWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@anisinha-ca.20210112.gappssmtp.com header.s=20210112 header.b=7ln2HliO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c11-20020ad45aeb000000b004aab21f63f9si833064qvh.508.2022.09.20.20.36.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Sep 2022 20:36:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@anisinha-ca.20210112.gappssmtp.com header.s=20210112 header.b=7ln2HliO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oaqXK-0002ml-DX
	for alex.bennee@linaro.org; Tue, 20 Sep 2022 23:36:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oaqX9-0002mS-14
 for qemu-arm@nongnu.org; Tue, 20 Sep 2022 23:36:23 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:42514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oaqX7-0003Mu-5W
 for qemu-arm@nongnu.org; Tue, 20 Sep 2022 23:36:22 -0400
Received: by mail-pg1-x52c.google.com with SMTP id t190so4646470pgd.9
 for <qemu-arm@nongnu.org>; Tue, 20 Sep 2022 20:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:date
 :from:from:to:cc:subject:date;
 bh=XTK1AEMLeWi+QR+6ss5HmHhYJD8qrWb2RJXVIIuUrow=;
 b=7ln2HliOSWpiJswp9oRmrfmeShkVAozTJTgehOvnr7gmvNXJ6YnEltfCrrXijHaiSq
 BmI0WGalaVizYsKopcMfBJXQuaowFUCtGssGvNIYsTkFojG2pTSxViBiYPm0KoY8X+Xb
 CG+U6uJdp+ZXJ2Gv43C2PgCuTibZeU8k3gvFPU1fG/SE9u1/JrsAewdzNcFECQ0EvuR1
 A4FfUUi0hXf1SWFucs6Kx3zMQ/qarIB2n7XSX6EcTJOahR2UAO4U/IemM7qP1TfEzUfB
 /9riTOTYbyurYgre5S48DF2JAnQ3lTDYHC3H5wCjM9s6fwBr93+KYenSTSChdMOkwTVf
 0kcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:date
 :from:x-gm-message-state:from:to:cc:subject:date;
 bh=XTK1AEMLeWi+QR+6ss5HmHhYJD8qrWb2RJXVIIuUrow=;
 b=pcoBUHiq/H60D4MQGLbkKs1yC8ftJZ6iW96IqMS/JJS376d91c7uRAVjXehxvx0Cpv
 7uAWS2UvtRd6E4+JsFP0ri3fW1r0tjpOS587+L9yVq4Rrwgrti5CSZQmcBYNR2Pojlst
 WcK2dd79A3NVbTP/+w92mvko+PQSictCK31VxRTH/Khs8tbm68WNdaU6wBtOt76wINd8
 49K08I1sBdmGJ3jXT/WFfHM0S9TsVv99gvZdnYnnsU5AZXNcTc666kGgSsLVf0cgvlTD
 WgKr10SkvjPeM/ryAfz0j3IRHmEmgiqL2a54/L3VWTQc9yyG9Y4x6lA914XPtONiBDNk
 4+oA==
X-Gm-Message-State: ACrzQf2ywHzk5JI6MglUpCo6+95Tt85/VyAwmX+XUSnTJRFWUvexKvi9
 PmZ02z5D/pIQfp2Vbs2RfgHTeA==
X-Received: by 2002:a63:1945:0:b0:439:d86c:3343 with SMTP id
 5-20020a631945000000b00439d86c3343mr17241373pgz.402.1663731379052; 
 Tue, 20 Sep 2022 20:36:19 -0700 (PDT)
Received: from anisinha-lenovo ([203.163.244.51])
 by smtp.googlemail.com with ESMTPSA id
 u6-20020a17090add4600b002002f9eb8c4sm729308pjv.12.2022.09.20.20.36.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 20:36:18 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Wed, 21 Sep 2022 09:06:12 +0530 (IST)
To: Miguel Luis <miguel.luis@oracle.com>
cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, mst@redhat.com, 
 imammedo@redhat.com, ani@anisinha.ca, shannon.zhaosl@gmail.com, 
 peter.maydell@linaro.org
Subject: Re: [PATCH 1/3] tests/acpi: virt: allow acpi GTDT changes
In-Reply-To: <20220920162137.75239-2-miguel.luis@oracle.com>
Message-ID: <f5da8d15-5176-ea8b-df68-9655ca10c0db@anisinha.ca>
References: <20220920162137.75239-1-miguel.luis@oracle.com>
 <20220920162137.75239-2-miguel.luis@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::52c;
 envelope-from=ani@anisinha.ca; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
X-TUID: okwfaVZlUSgU



On Tue, 20 Sep 2022, Miguel Luis wrote:

> Step 3 from bios-tables-test.c documented procedure.
>
> Signed-off-by: Miguel Luis <miguel.luis@oracle.com>

Acked-by: Ani Sinha <ani@anisinha.ca>

> ---
>  tests/qtest/bios-tables-test-allowed-diff.h | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index dfb8523c8b..957bd1b4f6 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1 +1,4 @@
>  /* List of comma-separated changed AML files to ignore */
> +"tests/data/acpi/virt/GTDT",
> +"tests/data/acpi/virt/GTDT.memhp",
> +"tests/data/acpi/virt/GTDT.numamem",
> --
> 2.36.0
>
>
