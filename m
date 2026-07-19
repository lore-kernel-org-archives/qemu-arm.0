Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21672C4450A
	for <qemu-arm@archiver.kernel.org>; Sun, 19 Jul 2026 19:29:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wlXC2-0005Y8-29; Sun, 19 Jul 2026 15:28:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wlXC0-0005Xp-Pw
 for qemu-arm@nongnu.org; Sun, 19 Jul 2026 15:28:52 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wlXBz-0004gB-7f
 for qemu-arm@nongnu.org; Sun, 19 Jul 2026 15:28:52 -0400
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-8487b7b3fc8so9434993b3a.3
 for <qemu-arm@nongnu.org>; Sun, 19 Jul 2026 12:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1784489329; x=1785094129; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :references:cc:to:from:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=tu/m4tbGZdTyQjqcxIPyBLhTphiwhax0W9CnBD40Gic=;
 b=jk/vbp6/JDH9hwkkUfTHCZ3TxTK0DbGj/7VwAl/uO79Px4QQz/lZp6tIG4UZ3IURMR
 uQNlwI5yZgeJ+vwdsZQ2jK9KBVre0cmN2PUOOlyfeBCtgY+jbuu1LHlfeqKWxxIL750X
 HO/a9rjlGPhvFyBu7qId+bG/znL2ISY5tEvbzXHI0di7T2pM1AydahlRSIbDpNc2+3Q3
 u0PP+qeXaU5cq31J59PoEykBKSCGDPkjpgCEsma/WkpGBHK+M/Py2iDyP5yg44hQd9CU
 yASbD6q9Sv6DjbAO5gs9niKxyivpR/awT2U4W6oo5LRUpQCcFpOxHFRf5MeEsGaybE8j
 x9bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784489329; x=1785094129;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :references:cc:to:from:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=tu/m4tbGZdTyQjqcxIPyBLhTphiwhax0W9CnBD40Gic=;
 b=pQjBf2NNOSO6pktQqwbHEmO7A1clmNcn9CP9zyg38lBNGz5TCRsrllaoPvsgzj+2pb
 emmLfGG3kyZglaDBno36G35GNcSS1oyFQWEVAJpXvZqC1srvC+LZ3sTYlsawSm5In/Vv
 +i23KFyt7qFZFM01w1xAq5OAx4XtHkyUgAbgp3XjcaTZt9EzTWpv6XtRIw9oH0UcHAvf
 5oCAv3A6kR+3qFBZYtXeX23/fspxLlj06Bbosyszuu9i1CUefQ0m7ryRjotOGnq18ORj
 PCnI9nhGR31P4tx+UuMx5bWR5YnxdS3Sk4V48gJcl9OfuTEEfV2Hb64EApioCtSAp2YQ
 A8uA==
X-Gm-Message-State: AOJu0YxwO69mYpGE7D9/4mvJZ4VnyrtheFu1zuRZsZpLbGGKYhZhX3iT
 gbprfZRYHxZkLT5tEuB/T8F7AY5GkVsQm2MQzi83CdXj1met5f5afFCdoEOsKDn0svM=
X-Gm-Gg: AfdE7cmwGDvZMKL1eebgLsgifBOeKxUcq+XJVetm/FFFN/64JLsI0NVvo7ETvuzdx7p
 CMW88kooCARx6TFKMkXkq1qEcMmN07e840niorsqNgstZ/BwdUm/nM5LALFI4lviuw0oE6PwldD
 DUL+izEmT1HKedG0Rnbv+YhV6PPBuyfaSM3vWJrBAFDeo1kadsn8GBrHlGgfZb0WJx4BxfnNn8V
 UxJCbXgvdVsQL0i0ul1Lj8Tyn+P5TDT2gPUEuYVMyPh6yGzS5/pYLUygDEDzOAmYeG3g9uO2391
 v6+T0Dv0qm+VbyWh/KGwdF8A75jleyfUEHGOHBu2HvNd3H4VWaeyUFn45B6yyjvH0dQRKNZSZ03
 5kfLpHU+io3zRAJznZkCZug//XBA94VPFbJ5Ax2fcPpzRuqHXy+aOHLqK6BL5naxhayZfdpqr/J
 TirWt6PgiFG4Lk4DA=
X-Received: by 2002:a05:6a20:c70b:b0:3bf:ba89:5236 with SMTP id
 adf61e73a8af0-3c3ad8083e7mr11963324637.33.1784489329161; 
 Sun, 19 Jul 2026 12:28:49 -0700 (PDT)
Received: from [172.20.2.34] ([32.140.233.50])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-3142a1de21asm28846339eec.23.2026.07.19.12.28.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Jul 2026 12:28:48 -0700 (PDT)
Message-ID: <bb5fd3cc-1e67-4cb3-9317-324cfba721df@linaro.org>
Date: Sun, 19 Jul 2026 12:28:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] target/arm: Split decode of BFloat SME FMAX/FMIN
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20260719174905.420725-1-richard.henderson@linaro.org>
 <20260719174905.420725-5-richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260719174905.420725-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 7/19/26 10:49, Richard Henderson wrote:
> +TRANS_FEAT(BFMAX_n1, aa64_sme2_sve_b16b16, do_zzz_n1_fpst, a,
> +           f_vector_fmax[s->fpcr_ah][0])
> +TRANS_FEAT(FMAX_n1, aa64_sme2, do_zzz_n1_fpst, a,
> +           f_vector_fmax[s->fpcr_ah][a->esz])

Can't leave b16 functions in f_vector_fmax.

If b16b16 isn't set, trans_BFMAX_n1 will return false, which will fall through to 
trans_FMAX_n1.  Since f_vector_fmax[*][0] is non-null, trans_FMAX_n1 will fail to reject.


r~

