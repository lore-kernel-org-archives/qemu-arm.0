Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp4435278ejy;
        Thu, 6 Jul 2023 10:09:26 -0700 (PDT)
X-Google-Smtp-Source: APBJJlElcGE1xS7asJmu3KTDk2n7meDGlsbmzh6IyE4MOAtAVh6gjyaMnNGyIJfmvviYHxgGB0bE
X-Received: by 2002:a0c:e254:0:b0:635:df49:719c with SMTP id x20-20020a0ce254000000b00635df49719cmr2560021qvl.22.1688663366033;
        Thu, 06 Jul 2023 10:09:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688663366; cv=none;
        d=google.com; s=arc-20160816;
        b=gSjfkBQYk+cOgaIlKzt1ev/xoFPSXRn04PC2ctfhmWMqD8Cq0wBlKstVm05I6i70Yk
         BTwkP6nBOGUnWVrIaINMuz1u82BdH0xx9KTMULdQPr69Q8uID4OP3RLRjRiR2+ZVNF5t
         3/prhMfbuRss3JwBYb/MwPWOzun+gijhiYnIpsv1ashPwGFoD7V6NjXQkTxDPZvGeFPi
         IOdLXWbRndrqIpgzpG2UII9ribnisok3y+SoKhzcnHYDclJhDyOMLinh9buG7vVAf39n
         gQMPSMz0cjMkk1nf7TjVIOxB3U/pUXEa99hfC/8BAKDt3UDzewELyyFhRgvBGwjZjvzr
         0Iug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=qC/u4zuYGuDcIM2yt5VnHbMIZOg+fAB8iyX/XNkh1s4=;
        fh=tMq2s3ZMyBTGjqldGfNY7FohCKrR0WyYi9EeR7LqRRc=;
        b=OHDsvyo9Lny9k2TmJZDQe5zob20R4/34H4ZJoUGVAsKRr9wb61n2vtVbsWcflXkIA7
         yqAVGWYiQ4BuOIToisL9TWIVc0dkmcz1LzvIMSdsaWzbuEhF6aCuuPkv1NibQY1aEDCx
         2DsyVyk1MFZFI/pe/95+6tfgXs6UF4N487bM28AjNvu21JU1AggDQdkjg9+2a2BYdAl9
         ZWRPL9V5EdxGs21hl46Hxm/BUE5vBsgLTjGgMODuHlkZVmRKu++z1DjLgZI3DU917Apk
         qZVwPFXvB1RUYpL4Zk76YQQT/6fvX8b+JeUHgCWaLcStcCDGZxYTXwHei2DOGI1tmvZq
         JSRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h18-20020a0cf212000000b0063020a21b85si1239970qvk.174.2023.07.06.10.09.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Jul 2023 10:09:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qHSTX-0000LH-DZ; Thu, 06 Jul 2023 13:09:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1qHSTV-0000Kc-Ky; Thu, 06 Jul 2023 13:09:01 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1qHSTT-0003ul-Or; Thu, 06 Jul 2023 13:09:01 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 8211412195;
 Thu,  6 Jul 2023 20:08:57 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 847BC134CD;
 Thu,  6 Jul 2023 20:08:56 +0300 (MSK)
Message-ID: <dca5c64d-e973-ea7b-89a4-31d73de3bf70@tls.msk.ru>
Date: Thu, 6 Jul 2023 20:08:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] hw/arm/virt-acpi-build.c: Add missing header
Content-Language: en-US
To: Peng Liang <tcx4c70@gmail.com>, mst@redhat.com, imammedo@redhat.com,
 anisinha@redhat.com, shannon.zhaosl@gmail.com, peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20230706150839.1180137-1-tcx4c70@gmail.com>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <20230706150839.1180137-1-tcx4c70@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -69
X-Spam_score: -7.0
X-Spam_bar: -------
X-Spam_report: (-7.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.091,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: gk8ERx1sfSCF

06.07.2023 18:08, Peng Liang wrote:
> virt-acpi-build.c uses warn_report. However, it doesn't include
> qemu/error-report.h directly, it include qemu/error-report.h via trace.h
> if we enable log trace backend. But if we disable the log trace backend
> (e.g., --enable-trace-backends=nop), then virt-acpi-build.c will not
> include qemu/error-report.h any more and it will lead to build errors.
> Include qemu/error-report.h directly in virt-acpi-build.c to avoid the
> errors.

Applied to my trivial-patches tree, moving it higher as suggested by Ani
(to sort more alphabetically) and adding the Fixes: line as suggested
by Philippe.

Thanks!

/mjt
