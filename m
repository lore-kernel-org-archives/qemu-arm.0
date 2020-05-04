Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp526296lfb;
        Mon, 4 May 2020 07:58:53 -0700 (PDT)
X-Google-Smtp-Source: APiQypIYJWCAB9V6UUVQq2w/DFN5xtetqWohBTgQaWACLeNwsOB/vypZE4nVemM3UU+aucq+5GBc
X-Received: by 2002:ac8:893:: with SMTP id v19mr17608932qth.40.1588604332901;
        Mon, 04 May 2020 07:58:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588604332; cv=none;
        d=google.com; s=arc-20160816;
        b=GSGid96seBmCSJHAr9d5NBJ7RhAg7O/VJqBoQQoLbwen48biYkV0lG/g+PAlrCYeCL
         NBkp5HgULBtpqZj8V1eW90kOn2PUmFtppysUb4PkJRT/Vduxy35tboZznWGiU00/Cake
         zDSgo8XkA47+Jj5F1k1Qf4Q343TbNNnoDlZ3D/qPZUcTJwsfqhAX5CuVAvMmu6bli6Nx
         hBO94qZ3MHJvmv0m1pcHTa1AHlD+4KdVugs3bwToXug6WQjJzAEVHV4fCKxaGD1Ys8lo
         l3WyLfmg3A/zVc1DV5Kn0kECC+lEf5iFgl3BbtcxpSWo7PsVI1YXcbejlY08XKBXpB6+
         DAnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:to
         :from:date:dkim-signature;
        bh=ahp4fnyRnrL8Druo+hPCRIyKLsfKFpDywTu0QTqLkyw=;
        b=p/3bE+zAo0KvaVaCoz+Li3a2+fe66OJbCwuv8QogYLKJTEmv7PdfW9/5ymd5ehCnoT
         4H7xe+jPhoqD6l7d5OwPGIojOBq6Tl6lak2TAZiSSMUJWgbKZY3MUn8mh4H+m1bVm07e
         YR7AKk59VY5z3VAvZSk2uQnlLUV2qBWVJXcOEsKSUL/hZ4AByTiLDr3TWqOwm7g5+Zcf
         L9U0PkS5gU0HjbtepXUqnDuRK593MJrgysJKrDM95fQuB8jsAuLfrpd7kQkThh7PLO2/
         gYrm6hQCokJHub7rqHeyaWTB5Gy6I+HGOrzDiT8rUT/6ojEFTqAWJRoS6g++76TIGtha
         fQTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=OX0s+Kmy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id x8si1149514qki.32.2020.05.04.07.58.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 May 2020 07:58:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=OX0s+Kmy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jVcYW-00080Z-73
	for alex.bennee@linaro.org; Mon, 04 May 2020 10:58:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1jVcWx-0005l1-Sy; Mon, 04 May 2020 10:57:16 -0400
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244]:35506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1jVcWv-0002vp-Mj; Mon, 04 May 2020 10:57:14 -0400
Received: by mail-lj1-x244.google.com with SMTP id g4so9989927ljl.2;
 Mon, 04 May 2020 07:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ahp4fnyRnrL8Druo+hPCRIyKLsfKFpDywTu0QTqLkyw=;
 b=OX0s+Kmyf6gdeAuS0aGjr83oD8yNj6a5SKX7JmVq0Yx3VsL7lbQTuJm3CoLT/vd0GZ
 XodHmSeRP2qpjsXP0eyNnvFMZJgNnImtrr8zQ5kcWXoux9rG0uIZJrw3K7XkfykqT9EF
 zfAtZXfhw2cEqOMyIM3Wn+KD3NM6CXg72eVzjGVVjZ9iPa25EjnMkNvSxNNCj7R/khum
 WG6qQsnu2D3vorZxq1Y7FOLzG0yIF7M08N86FivZVJsEqHy9UceWSlyLbN4YoR93hIiK
 Yx5lnTqlCIoGC+oxH69jeecXpqQ59LC5xMEG2ojA3vOzXhNXNi6NqLeG6e5IRY/DqNhW
 wLyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ahp4fnyRnrL8Druo+hPCRIyKLsfKFpDywTu0QTqLkyw=;
 b=oO9I0JqUyPvOWuaLYqQuwuR4vxWYc/f62Y4XwTfKKeW9a+7rHbGDG84/zO1tpNw/em
 febf50CfJgoyoh41Is14IFo0AdRDgkJ2yNrIO9sEwKBK/eH+nd2DVyhhwR8jO8vFskIu
 AY0FI1X3iUp3rCnT8Z1PUIEq8N3YPaphXrei5+nFr6S7m2g7Yk2X2vOyQeW0Ei3fn4fE
 CWsKzLcta/CZBS5/7736P+XZ8AMGRmD+xKDDxtZAc9B7Z96cj0uXVeg2K7TmzAeyViFx
 HNdJfNxqg5lX5JE7aP3EGSgAu54vPZAkjOou8wY81kke0FR9cd03gn0fMXT3B6qhxySQ
 2JHQ==
X-Gm-Message-State: AGi0PubMOylDEvuSp67iMYB1BaMvlsQQQ0FYBl4oIs1l5l1Kjs2HS7TT
 1w/bUwpFYPBAMrbe9x5VQv0=
X-Received: by 2002:a05:651c:403:: with SMTP id
 3mr10214393lja.231.1588604231538; 
 Mon, 04 May 2020 07:57:11 -0700 (PDT)
Received: from localhost (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id y21sm8416959ljg.66.2020.05.04.07.57.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 07:57:10 -0700 (PDT)
Date: Mon, 4 May 2020 16:57:10 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Subject: Re: [PATCH v2 04/10] net: cadence_gem: Define access permission for
 interrupt registers
Message-ID: <20200504145710.GD5519@toto>
References: <1588601168-27576-1-git-send-email-sai.pavan.boddu@xilinx.com>
 <1588601168-27576-5-git-send-email-sai.pavan.boddu@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1588601168-27576-5-git-send-email-sai.pavan.boddu@xilinx.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::244;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lj1-x244.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Tong Ho <tong.ho@xilinx.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Ramon Fried <rfried.dev@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hmDyPFyGX6Ym

On Mon, May 04, 2020 at 07:36:02PM +0530, Sai Pavan Boddu wrote:
> Q1 to Q7 ISR's are clear-on-read, IER/IDR registers
> are write-only, mask reg are read-only.
> 
> Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
> ---
>  hw/net/cadence_gem.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
> index a930bf1..c532a14 100644
> --- a/hw/net/cadence_gem.c
> +++ b/hw/net/cadence_gem.c
> @@ -458,6 +458,7 @@ static const uint8_t broadcast_addr[] = { 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF };
>   */
>  static void gem_init_register_masks(CadenceGEMState *s)
>  {
> +    unsigned int i;
>      /* Mask of register bits which are read only */
>      memset(&s->regs_ro[0], 0, sizeof(s->regs_ro));
>      s->regs_ro[GEM_NWCTRL]   = 0xFFF80000;
> @@ -470,10 +471,19 @@ static void gem_init_register_masks(CadenceGEMState *s)
>      s->regs_ro[GEM_ISR]      = 0xFFFFFFFF;
>      s->regs_ro[GEM_IMR]      = 0xFFFFFFFF;
>      s->regs_ro[GEM_MODID]    = 0xFFFFFFFF;
> +    for (i = 0; i < s->num_priority_queues; i++) {
> +        s->regs_ro[GEM_INT_Q1_STATUS + i] = 0xFFFFFFFF;
> +        s->regs_ro[GEM_INT_Q1_ENABLE + i] = 0xFFFFE319;
> +        s->regs_ro[GEM_INT_Q1_DISABLE + i] = 0xFFFFE319;

Shouldn't these be 0xfffff319?
Perhaps I'm looking at old specs but mine says bits upper bits [31:12]
are reserved and read-only.


With that fixed:
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>





> +        s->regs_ro[GEM_INT_Q1_MASK + i] = 0xFFFFFFFF;

> +    }
>  
>      /* Mask of register bits which are clear on read */
>      memset(&s->regs_rtc[0], 0, sizeof(s->regs_rtc));
>      s->regs_rtc[GEM_ISR]      = 0xFFFFFFFF;
> +    for (i = 0; i < s->num_priority_queues; i++) {
> +        s->regs_rtc[GEM_INT_Q1_STATUS + i] = 0x00000CE6;
> +    }
>  
>      /* Mask of register bits which are write 1 to clear */
>      memset(&s->regs_w1c[0], 0, sizeof(s->regs_w1c));
> @@ -485,6 +495,10 @@ static void gem_init_register_masks(CadenceGEMState *s)
>      s->regs_wo[GEM_NWCTRL]   = 0x00073E60;
>      s->regs_wo[GEM_IER]      = 0x07FFFFFF;
>      s->regs_wo[GEM_IDR]      = 0x07FFFFFF;
> +    for (i = 0; i < s->num_priority_queues; i++) {
> +        s->regs_wo[GEM_INT_Q1_ENABLE + i] = 0x00000CE6;
> +        s->regs_wo[GEM_INT_Q1_DISABLE + i] = 0x00000CE6;
> +    }
>  }
>  
>  /*
> -- 
> 2.7.4
> 
