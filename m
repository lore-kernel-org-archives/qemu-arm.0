Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp2560204lff;
        Tue, 3 Aug 2021 06:49:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxH2oSnDDd5aJt/5n7K3S4pkB5ZOC1Hyqo2kc9VEG2Q38g8HJOKPkXDTugwgERb2YSnL12y
X-Received: by 2002:ab0:71d6:: with SMTP id n22mr14360213uao.65.1627998573419;
        Tue, 03 Aug 2021 06:49:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627998573; cv=none;
        d=google.com; s=arc-20160816;
        b=usNu0d5SDj8aeT+gdgTEuToMiuXTUMI80w8zxsGJqFXF9aBVmGBRHZWA8Z3JnQcQo6
         2pkzttQOPD0YVcPlOgM67VCf1vGR2K53TzCz9mILc53y9Asd3W3r9YiPP7swhPOffYc3
         BFNZ9LKOCPpO9Mt4jLTxfkdIvko0leelDpi//tGXJXsy+laiqfD3GO2WlXI6vBOPlWbP
         ufgNc+VT3edG7VSF+5g+dy9Wd4FXewCWOafzwaZLtFH2qN+ee0P0GmKZjQyb7RMFLhb0
         XeccireA+HeQriBs64lY8c/eNKe0TmANlShgCaiDA+8gYHcqBr8ZCQtIz45MUhQ+UMl1
         vTFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:to:from:date;
        bh=Cs+vriW0btGXybF72vvhMp5P23leshKnBw6Vbkzwk5A=;
        b=p+ooogh8iWLQt2HljvApCNhlpKgL2Kj9DbzAZU2EEtNvulqK2tnxDCJAFvekyM8nwI
         0+/hzgIgUl9ZCDCMZ5FIQqVg5namSV38aARcEqQalCkSRNOCR6eQOpBqkK9yjnOLgj0k
         UqMIbtrK98mi4TApzJJaMjLZtF8qm0isDyYO7IfZzRVEKxuiIjm0a5xmz6zeZlMRdh9e
         hId+0AHvFoRJBy+mQaDw8J4c0ldnyNioGwnMktf770v5GYq1sL+wr7TBa6oEYhCqm56f
         G8GbvvC5G5IHzqfS2pwvR0XtIeUO5EXaSYpc1tB4RELVFSmBX+2mtNj5BsfL9UmPgQ9U
         cHZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bu.edu
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x8si5211650uai.228.2021.08.03.06.49.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Aug 2021 06:49:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bu.edu
Received: from localhost ([::1]:33156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mAunU-0008Cp-Or
	for alex.bennee@linaro.org; Tue, 03 Aug 2021 09:49:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1mAulu-0005hD-Nz; Tue, 03 Aug 2021 09:47:54 -0400
Received: from relay68.bu.edu ([128.197.228.73]:54240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1mAult-00007C-4U; Tue, 03 Aug 2021 09:47:54 -0400
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay68.bu.edu (8.14.3/8.14.3) with ESMTP id 173DkbXT010490
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 3 Aug 2021 09:46:41 -0400
Date: Tue, 3 Aug 2021 09:46:37 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH-for-6.1 v2 0/2] hw/sd/sdcard: Fix assertion accessing
 out-of-range addresses with CMD30
Message-ID: <20210803134637.nfrjsnhjnagjt6e7@mozz.bu.edu>
References: <20210802235524.3417739-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210802235524.3417739-1-f4bug@amsat.org>
Received-SPF: pass client-ip=128.197.228.73; envelope-from=alxndr@bu.edu;
 helo=relay68.bu.edu
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.998,
 HK_RANDOM_FROM=0.998, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Bin Meng <bin.meng@windriver.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iWxOjWK1VTwC

On 210803 0155, Philippe Mathieu-Daudé wrote:
> Fix an assertion reported by OSS-Fuzz, add corresponding qtest.
> 
> The change is (now) simple enough for the next rc.
> 
> Since v1:
> - Simplified/corrected following Peter's suggestion
> 
> Philippe Mathieu-Daudé (2):
>   hw/sd/sdcard: Document out-of-range addresses for SEND_WRITE_PROT
>   hw/sd/sdcard: Fix assertion accessing out-of-range addresses with
>     CMD30
> 

Fuzzed this for 20 mins, based on the OSS-Fuzz corpus, without finding
anything.

./qemu-fuzz-i386 --fuzz-target=generic-fuzz-sdhci-v3 -jobs=4 -workers=4 \
-focus_function=sd_wpbits \
~/oss-fuzz/qemu_qemu-fuzz-i386-target-generic-fuzz-sdhci-v3/  

Tested-by: Alexander Bulekov <alxndr@bu.edu>

Thanks!

>  hw/sd/sd.c                     |  9 ++++++++-
>  tests/qtest/fuzz-sdcard-test.c | 36 ++++++++++++++++++++++++++++++++++
>  2 files changed, 44 insertions(+), 1 deletion(-)
> 
> -- 
> 2.31.1
> 
