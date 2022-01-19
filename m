Received: by 2002:a19:ca48:0:0:0:0:0 with SMTP id h8csp3780631lfj;
        Wed, 19 Jan 2022 09:39:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzNiZYcPhHr/GMXrEDEIi7CG8bVmOStFplsblkZyiQ2tj1m+6CUugocrxjzs9W2KBLSQ1R8
X-Received: by 2002:a05:620a:21dd:: with SMTP id h29mr22382533qka.80.1642613995700;
        Wed, 19 Jan 2022 09:39:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1642613995; cv=none;
        d=google.com; s=arc-20160816;
        b=krOZEqivH8gNOvNtEMZxASjP6MMBSR9L+0cfll5sWnlkdFRV4Q5aTCER0i5Ht5u75j
         dUCg3rJ51c935XdL6zZDRWMBshax/AdBavrsXPucEApWkBvu9poG1lmWDRowVM7SZt/e
         2wqGcgd/LNUozSNqTjLp+oOTn838Wu4k21iqEMDFgdK/8i3L5dXGgP6/rhI7CCygKaUm
         bcXW+b6SAgXyy/VwPzlSh+j2DSgMSFKa9rzJ7uPO7t5rSMcjEzhiDpg4vLS9fgz8pi/j
         mud27DW0qWvLLeYeiHk77k6xroajSY0unQ9R8MnOQi1wEY+WQP1tkz0ouauLuoKo6UkT
         6eUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=jZq3HSXyt3m0FVWiE70YNLHQpaa1ILRf8ubhjDauh3g=;
        b=PvA+mJelSRNEvS5iUH1KCJXlxwhWX3xBS/OPx/mXOElBAJOGW+KIJPOIJ2wZ7qCfL6
         XzZhpZvJcvxvsYISdcSk7QRMdQZUcxklnLB1mtQBHcDdBzVnnFlCMAtMy8yYKSss/zIg
         exevI8ycFrmdmJIHePpNu5++5juj7fwJ1+txFPlZDlx36qRaoNG5jYNWToIcZi2vyzxp
         pQ/jExjMM53f6Y2zIBjG5GI450yyjgz5RTGoUo0bc4jCpQ8OGyY1NSs1TSK/MD9CPVmf
         puONRNNHCYBJtw4AgSqQ9gZjb6nUhUuzeb7cFSbIgnffbb/R4WZnPKM9S1XJMxD3uAtQ
         KbKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=n7el9kvX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 42si256204qtf.494.2022.01.19.09.39.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Jan 2022 09:39:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=n7el9kvX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:52192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nAEw7-0004qZ-2p
	for alex.bennee@linaro.org; Wed, 19 Jan 2022 12:39:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAEqh-00007j-Sw; Wed, 19 Jan 2022 12:34:20 -0500
Received: from [2a00:1450:4864:20::334] (port=54928
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAEqf-0002vM-1N; Wed, 19 Jan 2022 12:34:19 -0500
Received: by mail-wm1-x334.google.com with SMTP id p18so6553947wmg.4;
 Wed, 19 Jan 2022 09:34:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jZq3HSXyt3m0FVWiE70YNLHQpaa1ILRf8ubhjDauh3g=;
 b=n7el9kvXYZ9W5UcXac8Wr41OM4I5ZN6bwPPUU/6fjwQy40BpsJW+sQLycndTl6t1Uq
 GugTOpbiYz2lORO8Qs1+0iLx4jRaxluqvXFh+fEG1w+86zIHZTlDa4wmzEC9oHllkXe/
 0LumKVyA+AlgUQYIpS+9peVuN1RGYS7bNWvipd5XqwI4MWOj/YeelHUONBmeZWXfFBB0
 LOuadv+QUgioc3Ub8FcO/Dn+2vz100OKxyIETQxQR2Lo1QLqn11sYvsESl1CQvqnu7nE
 IhEXE2r9gOE8nYEo8UBYKuLFZLPX4VYfsNATsv/F4uScKRX0OK7uAzxCtyKi0mkO4tYo
 DR6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jZq3HSXyt3m0FVWiE70YNLHQpaa1ILRf8ubhjDauh3g=;
 b=0j9FR0X0UxLB4W9qOm7IYy0EvhesQ2F/7I0mG7urf0M8GVM4rpzQ/f6L5qoC8crnuA
 FhzEQYZ39RpjNx7ClJbRB00M28ByDGxHr70+cvryHFidpgV8HQcwiVd9KkDeJXwot8zf
 BQxXRTkmSAgMtpKqqggSgln1euk0RPD8W68OoB7W9bpZkjW7yVxsruy76LRHKI8DG50j
 leuqYsY7I0gIF/GvFep6SNCHFmkqJqDGpLhuFhHW+qsKr5BvdEPk4WnBWdax8+uPRZtt
 PuuHA60p2dTD/bwRr9G4cDhXMqjPLn/ACA5HhKIl7VoSgxegXqX/kD/E1fbcAohs9g04
 b1MQ==
X-Gm-Message-State: AOAM531gULZb6if/sm2jCF+hE8ndzxjm2JADnmrAAG80NhnGDvBWHorK
 QuyDUDuicwfeyVHStFiZeYQ=
X-Received: by 2002:a5d:4288:: with SMTP id k8mr7232770wrq.657.1642613654523; 
 Wed, 19 Jan 2022 09:34:14 -0800 (PST)
Received: from [192.168.1.40] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id s9sm157622wmh.35.2022.01.19.09.34.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jan 2022 09:34:14 -0800 (PST)
Message-ID: <4e3cdf08-b767-9a00-e4ca-70580bba4aa9@amsat.org>
Date: Wed, 19 Jan 2022 18:34:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [RFC PATCH v3 1/3] hw/intc/arm_gicv3: Check for !MEMTX_OK instead
 of MEMTX_ERROR
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Peter Xu <peterx@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20211215182421.418374-1-philmd@redhat.com>
 <20211215182421.418374-2-philmd@redhat.com>
In-Reply-To: <20211215182421.418374-2-philmd@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>
X-TUID: QZ9rwfdbSpa3

Hi Peter,

Can you take this single patch via your arm tree?

Thanks,

Phil.

On 12/15/21 19:24, Philippe Mathieu-Daudé wrote:
> Quoting Peter Maydell:
> 
>  "These MEMTX_* aren't from the memory transaction
>   API functions; they're just being used by gicd_readl() and
>   friends as a way to indicate a success/failure so that the
>   actual MemoryRegionOps read/write fns like gicv3_dist_read()
>   can log a guest error."
> 
> We are going to introduce more MemTxResult bits, so it is
> safer to check for !MEMTX_OK rather than MEMTX_ERROR.
> 
> Reviewed-by: Peter Xu <peterx@redhat.com>
> Reviewed-by: David Hildenbrand <david@redhat.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/intc/arm_gicv3_redist.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
> index c8ff3eca085..99b11ca5eee 100644
> --- a/hw/intc/arm_gicv3_redist.c
> +++ b/hw/intc/arm_gicv3_redist.c
> @@ -462,7 +462,7 @@ MemTxResult gicv3_redist_read(void *opaque, hwaddr offset, uint64_t *data,
>          break;
>      }
>  
> -    if (r == MEMTX_ERROR) {
> +    if (r != MEMTX_OK) {
>          qemu_log_mask(LOG_GUEST_ERROR,
>                        "%s: invalid guest read at offset " TARGET_FMT_plx
>                        " size %u\n", __func__, offset, size);
> @@ -521,7 +521,7 @@ MemTxResult gicv3_redist_write(void *opaque, hwaddr offset, uint64_t data,
>          break;
>      }
>  
> -    if (r == MEMTX_ERROR) {
> +    if (r != MEMTX_OK) {
>          qemu_log_mask(LOG_GUEST_ERROR,
>                        "%s: invalid guest write at offset " TARGET_FMT_plx
>                        " size %u\n", __func__, offset, size);
