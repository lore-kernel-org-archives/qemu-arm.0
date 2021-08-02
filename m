Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp1878946lff;
        Mon, 2 Aug 2021 11:50:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyX+Zu5q8xKFO1wR73vl3mzQ/XWZj0kWs2zu0BZI81jHrKztkK40JesNOqEOtKauhrK/pnG
X-Received: by 2002:a67:ba0c:: with SMTP id l12mr11816088vsn.32.1627930228103;
        Mon, 02 Aug 2021 11:50:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627930228; cv=none;
        d=google.com; s=arc-20160816;
        b=c6CsqI4vtpk5wVeiTHRPqabEfzqRNVZr+PRP4W4oDAz9HnGTp1KhX6jQmXhHo9xoC7
         RAccGsbASZPKtiVi8nINWHo3KtKOxuftQtBnP0yK+WEiRnlYfTGDBjNi2L9rllBXoSVg
         vyL9nIR492rMzE2Inj2ZTNeHlReUF7pQ6lbQEMkTewvbBmHLq1Wl0uSBtOqZ4dYt9LbG
         5aho1N0a9IpTtHQylNO3slcCtPUjy5xBfzHWhR02TKZvJwKOWKoIc4oXDNW+0HSC4aKg
         ZUKKRg+ysmObr0FZtxwQcunzJYKcvhzyenk2PqSBEFHV9MFdVUi3mFjWeoGparVw/gf9
         BMng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=QVX7/y96zMF5CL2+GQg0gRf7ibM3fYXV6K7BsIkR3pg=;
        b=Qq4OBW0jef/29eFM22GJ7eBCBXQa57Goo6QKkp4Zxg3200Vj2A/xGm2mzDsnkXoYnZ
         3Xv+khfvYNBkPOWyXzT9s3szQL3x7W7bphGlJkG9SXe13BQbwSAGx61o8o95RPy+BuA+
         7IiDQMBP4ZQgE6awKQ3HyuO9AYL36FKIBI2CQqKWJeav62a3X1V23TcIp/KEieCYvDvn
         Dgl9stea+aeXX8UIkNqu8uVviXu+YE5Dfmyy+H/yJlfoHcwKcYcGPvLNYU9MzuzpoTT2
         IJj1TkBa19WfGfvKLplJQao71eexYvhpeuygSZ2TD6jWxgKa/sg9RsANlpxD7w/Z9wlp
         F4JQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="fpPxqa/B";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u11si4731077vsh.143.2021.08.02.11.50.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Aug 2021 11:50:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="fpPxqa/B";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mAd19-0006Hl-8r
	for alex.bennee@linaro.org; Mon, 02 Aug 2021 14:50:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mAd10-0006Fg-1w; Mon, 02 Aug 2021 14:50:18 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:38596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mAd0y-0007GK-H1; Mon, 02 Aug 2021 14:50:17 -0400
Received: by mail-wr1-x431.google.com with SMTP id l18so22582284wrv.5;
 Mon, 02 Aug 2021 11:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QVX7/y96zMF5CL2+GQg0gRf7ibM3fYXV6K7BsIkR3pg=;
 b=fpPxqa/BPbFyAOv7w0/xNZoxXk8po1KAM/6QSUfj+GvRiJcxSjosMnqUxLcFcgZ0Q3
 uqcVgKtRdEuxPzTqDeb4JSH7TrfDRLgtqQxzKUeUldBk75rBFb9t0HIonLv1oi0zzfT9
 vNqyR1VsecIkZudBLMU8CwCKTegHRWBSbMWKk54+4/p6VktrfpK3aiNI13Y9uivk+EH0
 xPQJFszguPx61D0e1sTGfnjddStonZHPE995UOVAvY5CQAMErHmb+YbCcR+9BoDlb2lR
 16+E6lj4/Jzo5KgMZvTPnB/SN5i5Zs680mdyahjjnRlxyXQuGHd/SPYGzEGDblmTDACw
 TmPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QVX7/y96zMF5CL2+GQg0gRf7ibM3fYXV6K7BsIkR3pg=;
 b=QzC5VykTKwRJP7mQMx+xo7uUMoKxiPu40274AztPTh8Pl2rWUUNrTjdTmMRypeO7JP
 WwVof+mMiaCRJ6aA13mhS7HKsyu5caRT9GJRvaRyxK1om4m7dwvW/1loMorn6UQk4Wmj
 wHaQK/38uFbIfggxKTADiuDh4TXpFvZ/WFZ8hqYiYfOZPo6PHPmH3YDBrQsTC9feYnZF
 8JPWmb10hBzmpMw9acDq4GgBoRyLL2waVRer0x0u2pLRrEizpsux5rKUIDDU+X77igXO
 vnCAAaJg7zNFWXnFOJ1Rk+AIoEvkwyGRArnVube3A/B6TAR6yysnmKeWUJYxSn6rWkKm
 bCGw==
X-Gm-Message-State: AOAM533BYeVecCupVSwcZOTPAg3SS4YIGJWVEvF7mqLzhVuyfnQ2GPNe
 xxoKH9ucN0WHr5rhOgve0f2LCKd0GRQ/mw==
X-Received: by 2002:a5d:4a84:: with SMTP id o4mr18649434wrq.273.1627930213944; 
 Mon, 02 Aug 2021 11:50:13 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id o17sm10692281wmp.31.2021.08.02.11.50.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Aug 2021 11:50:13 -0700 (PDT)
Subject: Re: [PATCH-for-6.1 0/3] hw/sd/sdcard: Fix assertion accessing
 out-of-range addresses with CMD30
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210728181728.2012952-1-f4bug@amsat.org>
 <CAFEAcA-_tvVnDgATXaQeM2eZew+_Vr2K1YBVsLh=JpG1Fvbriw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <544c8d4f-9d3c-a4b2-48fd-e393ba6ba2e4@amsat.org>
Date: Mon, 2 Aug 2021 20:50:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-_tvVnDgATXaQeM2eZew+_Vr2K1YBVsLh=JpG1Fvbriw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Alexander Bulekov <alxndr@bu.edu>, Bin Meng <bin.meng@windriver.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DhFJFAEVzL9t

On 8/2/21 2:10 PM, Peter Maydell wrote:
> On Wed, 28 Jul 2021 at 19:17, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> Fix an assertion reported by OSS-Fuzz, add corresponding qtest.
>>
>> The change simple enough for the next rc.
>>
>> Philippe Mathieu-Daudé (3):
>>   hw/sd/sdcard: Document out-of-range addresses for SEND_WRITE_PROT
>>   hw/sd/sdcard: Fix assertion accessing out-of-range addresses with
>>     CMD30
>>   hw/sd/sdcard: Rename Write Protect Group variables
> 
> I've left review comments on individual patches, but my suspicion
> is that the fix for this assertion failure is just "the
> assert should be after the test for 'addr < sd->size', not before",
> something like:
> 
> @@ -821,8 +821,12 @@ static uint32_t sd_wpbits(SDState *sd, uint64_t addr)
>      wpnum = sd_addr_to_wpnum(addr);
> 
>      for (i = 0; i < 32; i++, wpnum++, addr += WPGROUP_SIZE) {
> +        if (addr >= sd->size) {
> +            /* Out of range groups report as zero */
> +            continue;
> +        }
>          assert(wpnum < sd->wpgrps_size);
> -        if (addr < sd->size && test_bit(wpnum, sd->wp_groups)) {
> +        if (test_bit(wpnum, sd->wp_groups)) {
>              ret |= (1 << i);
>          }
>      }

It is simpler and works :) Thanks!
