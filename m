Received: by 2002:a17:906:f20a:b0:98d:b2f5:1316 with SMTP id gt10csp2279392ejb;
        Tue, 8 Aug 2023 08:43:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRj4GftZu3mo7+sPgALCMz1AjQsSFhJ4VihCafK7O5/1xtAiv+TQOLk5RDxKr/yu3w3Asa
X-Received: by 2002:ac8:5c47:0:b0:400:8d99:48db with SMTP id j7-20020ac85c47000000b004008d9948dbmr52028qtj.41.1691509392716;
        Tue, 08 Aug 2023 08:43:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691509392; cv=none;
        d=google.com; s=arc-20160816;
        b=w/9ez+VPH/tW4VALPDarc7K7wf4cer1S3L6AVAo67KGru+UewVN5PFT7VkgpVv60wR
         O5Tf/6qRGAXL0lSOlR2MQuOC2YqRTKNeQ67VdCBuw/hdYCr59DfFLYWO0MuJdpaeGauA
         CTi+A35+RjSkLr1V4ufYz8pHZzxBrDDIQ6C+1KZVIZNcJSXwGR3Nysyycgxu1NPPE7+A
         dEyNk+TlvmzeOVYczqvOX4I+zlrSw9gRaJjFo3hqZgnI10C45FT8iaSpsLdCpPt4G/3S
         Z2MxmbVG6d/BPvdzftfZSW1+GpGE3sSn0eMvYTQY2Y8y4B/AWMbLEfOva4uVk6pyf2lA
         ftZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=91G9Pk0Exz2mrf4Mv1KaJG1Ne+IHpYla8z7w4QzCQVw=;
        fh=fQnwaKIEQMqsAzE+eYhY7gj6V931W5BTEhkADypqRyw=;
        b=HomnUHKqbtVWrTJklqpMbmptH6TFvAK3yUCj4vzPP9CiTYObuAD8SLMsUoF14Gp24c
         l1TXcKM5kgEopbcA9kgaaSfmHevW+YDp2LhMy2fgzyIJHqnhLI39CgaY73nbgoiPuQil
         NO9AYv5TNGaPtg/f/JdW0o5rkeSCvqudbLH7VLqLBMP0d9aSF9RJ8d+m1HEfYXl6lMx3
         T/Y3ifk7ol8AQ4lu+PUGI9HZTDBUFQNJpwx9fi91eMrYwQ1R3Yo10cq+5WX1s6WGnhGp
         fUp8a1rGrukY/AFH5EJXXMK0jSkzkehBmto3w+vt41rdUXX5Waj5+bJoVQquBFoufToM
         2bmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@mail.uni-paderborn.de header.s=20170601 header.b=qcsIPBCW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=uni-paderborn.de
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o15-20020a05622a044f00b004009b446cd7si6344575qtx.258.2023.08.08.08.43.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Aug 2023 08:43:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@mail.uni-paderborn.de header.s=20170601 header.b=qcsIPBCW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=uni-paderborn.de
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qTOrF-00067W-2f; Tue, 08 Aug 2023 11:42:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1qTOrE-00067K-0i; Tue, 08 Aug 2023 11:42:52 -0400
Received: from collins.uni-paderborn.de ([2001:638:502:c003::14])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1qTOrB-0000af-S1; Tue, 08 Aug 2023 11:42:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mail.uni-paderborn.de; s=20170601; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=91G9Pk0Exz2mrf4Mv1KaJG1Ne+IHpYla8z7w4QzCQVw=; b=qcsIPBCW/vDZKar83LXCiFUh4Z
 SaXGG+ZnklQThYtxlVJaYU2kjjY0Mfub+l6ZlvgT3Y0yl+407uRaC0NAzm0aOHBIFj1p36g/995vB
 ujhAw5ZaBI8JdcytHYayMuFsdzvTUXJJfLFLVrAOBRE9oZwQRWHgZE1jLkIu4wE+jUYA=;
Date: Tue, 8 Aug 2023 17:42:37 +0200
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: Re: [PATCH 09/24] target/tricore: Replace gen_cond_w with
 tcg_gen_negsetcond_tl
Message-ID: <sodhcladibb7xf7ibqdirlwqfmcsj3xabthqheixzldqwhpogw@kujjnqe4aoed>
References: <20230808031143.50925-1-richard.henderson@linaro.org>
 <20230808031143.50925-10-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230808031143.50925-10-richard.henderson@linaro.org>
X-IMT-Source: Extern
X-IMT-Spam-Score: 0.0 ()
X-IMT-rspamd-score: 14
X-IMT-rspamd-bar: +
X-PMX-Version: 6.4.9.2830568, Antispam-Engine: 2.7.2.2107409,
 Antispam-Data: 2023.8.8.153316, AntiVirus-Engine: 6.0.2,
 AntiVirus-Data: 2023.8.6.602002
X-IMT-Authenticated-Sender: kbastian@UNI-PADERBORN.DE
Received-SPF: pass client-ip=2001:638:502:c003::14;
 envelope-from=kbastian@mail.uni-paderborn.de; helo=collins.uni-paderborn.de
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: NQioX/31W3q3

On Mon, Aug 07, 2023 at 08:11:28PM -0700, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/tricore/translate.c | 16 ++++++----------
>  1 file changed, 6 insertions(+), 10 deletions(-)
> 
> diff --git a/target/tricore/translate.c b/target/tricore/translate.c
> index 1947733870..6ae5ccbf72 100644
> --- a/target/tricore/translate.c
> +++ b/target/tricore/translate.c

Reviewed-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

Cheers,
Bastian
