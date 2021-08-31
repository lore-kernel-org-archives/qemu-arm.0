Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp4889330lfb;
        Tue, 31 Aug 2021 03:20:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyYwJZc3qBPZ4WOo1788597Wes+gGUi+4OigGQHgXwmm9i0Dw13Ky6shxHe2wC8HALN3W/R
X-Received: by 2002:a92:d24b:: with SMTP id v11mr20139824ilg.218.1630405247185;
        Tue, 31 Aug 2021 03:20:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630405247; cv=none;
        d=google.com; s=arc-20160816;
        b=HKvBAWstBk6r3fdUrREDZ7RHoenMkWDevdTWxoZGdWMGT0IKmDI6BTzPdM5E+tTq5b
         eSc9IOFKpcgCZ+8oVrNDbspRmtts11B+eSntaNi1m6wJWcETzwnSPtOrJ/fxbz8lRBWF
         d0601rKdioQ3jE/edL04lcnrEVXWZqJG8cnUKSH6cHLm2gkTMklh6+eIRBtxJEsEK1ar
         y9rwW9TSh3HFi58DJ3HVLlU1PAZUhUK14DKZ9J94sgeCkawJvZIaZFMw+iIhFc69gTwR
         CWkJPQS8Sbzhwv1ikp26G/XJM3ntiyHJalbYmsllyuDdPL4h6gD85wuz8QhRrU6RRz8D
         0KiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=msBAw3ZvKqshq2WICcsx+b/9T2Wi8pHm3imgBJKoj5Q=;
        b=URKwX5+2IwuxRR1mlTxHmfIgugVoecco9fW4fjSxfkkre7dyKOP/wqKfTNVvhmnqjn
         nh7nFckfEo2RyqiDLgvNDPjyFZ5O8fWIoIGh6MHENZrKz2y+h4eLzKwtdb67kXtqUUYL
         kymLObCBIUrADtnooMX+wpDKmiec2SESXrTW4m+MsEO+RZixAJpFMAOHQOHZvOAXxdPa
         2xVD+I8GzFD8heHvh0pBU7FVGWdaRQllPaQbdo4oJ0vIYkbvW4Po/LSK02u1aM2/8ouU
         CPVrfWYhuzSqF5c7RlLYM1SQSPEhfXIME8xrBaiO3SKw913HW1ZnYwcJ1Awtry/z0wwR
         9CIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=D1+YziCe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o14si19342104ilu.101.2021.08.31.03.20.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 Aug 2021 03:20:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=D1+YziCe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mL0so-0007my-H9
	for alex.bennee@linaro.org; Tue, 31 Aug 2021 06:20:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mL0sF-0007KB-93
 for qemu-arm@nongnu.org; Tue, 31 Aug 2021 06:20:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mL0sD-00034B-Cv
 for qemu-arm@nongnu.org; Tue, 31 Aug 2021 06:20:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630405207;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=msBAw3ZvKqshq2WICcsx+b/9T2Wi8pHm3imgBJKoj5Q=;
 b=D1+YziCevEmgR0r82isOy9qpgWzOKzzC7t/NZtD/7EiVRlPh9ctK1m/V4fuuWlA2WrAoEU
 6oZRm8rp/POIsTSmvKHPG6W/iY8Hnv8F8gVyUaLbRJhrxxC6hhq0qEjY1L6r6PIDsU1qT2
 2hxF4cov8QJTuksb76AxgkAHbhy3aBg=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-Zlq0-MJfPwmaaqxjKlKPqg-1; Tue, 31 Aug 2021 06:20:06 -0400
X-MC-Unique: Zlq0-MJfPwmaaqxjKlKPqg-1
Received: by mail-ej1-f71.google.com with SMTP id
 n18-20020a170906089200b005dc91303dfeso2375500eje.15
 for <qemu-arm@nongnu.org>; Tue, 31 Aug 2021 03:20:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=msBAw3ZvKqshq2WICcsx+b/9T2Wi8pHm3imgBJKoj5Q=;
 b=DZ/yZap3Ye9TR6cS6zS0jhZ8R4DgEnONEFckWLPyropUXV0IIfxQ/atGmFfNQf1XuM
 itARdhl716UfySMzNhTIBtTHTXIvQKTq8Ikur4lK3h7qOAtID9CfaahItgzBrV/HzAKa
 A4njwHDlnT3XJ6+Ap3wrkyHei+5B+kM5RSWywcS9d2BjRfSOLGhUSCkwDkYvzdlpyBZX
 sR83+2qhpEQDuEXGcdwEqIpFwAy8atgjM3oJl54n9gXcW7KsIIxGS6sZFjQ7etOwBf6o
 vlg4fs6qXNn2Uxg92ehkBL0yZGQzUpjtpi6+KkNIkd/FmygTxzkEbXZi2grU1Ya6ba70
 IgWQ==
X-Gm-Message-State: AOAM532cIvucR/tU1SpHVZdO3ipDrDd6e6hAoWtEJDF4LOzowradGjbF
 fkTUbR9ue/BRn1Y30zerBk5/0+hmOpQzylOYzzJ1o7wdkPC+JhLnW+4d07VfPHkgfrahGQBjuXJ
 ArudsgMFYnaQM
X-Received: by 2002:a17:906:3809:: with SMTP id
 v9mr30657270ejc.355.1630405205145; 
 Tue, 31 Aug 2021 03:20:05 -0700 (PDT)
X-Received: by 2002:a17:906:3809:: with SMTP id
 v9mr30657245ejc.355.1630405204844; 
 Tue, 31 Aug 2021 03:20:04 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id cr9sm9118339edb.17.2021.08.31.03.20.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Aug 2021 03:20:04 -0700 (PDT)
Date: Tue, 31 Aug 2021 12:20:02 +0200
From: Andrew Jones <drjones@redhat.com>
To: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
Subject: Re: [PATCH v6 1/3] target-arm: Add support for Fujitsu A64FX
Message-ID: <20210831102002.baj3yipk7ulvi32i@gator.home>
References: <20210831082940.2811719-1-ishii.shuuichir@fujitsu.com>
 <20210831082940.2811719-2-ishii.shuuichir@fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <20210831082940.2811719-2-ishii.shuuichir@fujitsu.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9HdsEpe7kgvZ

On Tue, Aug 31, 2021 at 05:29:38PM +0900, Shuuichirou Ishii wrote:
> Add a definition for the Fujitsu A64FX processor.
> 
> The A64FX processor does not implement the AArch32 Execution state,
> so there are no associated AArch32 Identification registers.
> 
> For SVE, the A64FX processor supports only 128,256 and 512bit vector lengths.
> 
> The Identification registers value are defined based on the FX700,
> and have been tested and confirmed.
> 
> Signed-off-by: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
> ---
>  target/arm/cpu64.c | 48 ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
>

I already gave my r-b on the last posting, but here it is again

Reviewed-by: Andrew Jones <drjones@redhat.com>

