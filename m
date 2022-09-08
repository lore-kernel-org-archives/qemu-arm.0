Received: by 2002:a17:906:1c87:0:0:0:0 with SMTP id g7csp237402ejh;
        Thu, 8 Sep 2022 03:45:27 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6vVEQgGjES6wVnAtF5HqlMw1X2PBuytrzfvjw386XpfYJ+DydEsR9CtdkBdWkGszLrAQeT
X-Received: by 2002:ac8:57c7:0:b0:344:55d9:dcd7 with SMTP id w7-20020ac857c7000000b0034455d9dcd7mr7302516qta.162.1662633927601;
        Thu, 08 Sep 2022 03:45:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1662633927; cv=none;
        d=google.com; s=arc-20160816;
        b=LNRs9n+Sua5kagHGtLY5tvpqQVdIFV7s9MaAyWL9aS4R+5gUMCnmfz5NVZrRrREoIS
         FHzHoQG/+LIfur4GOWP+87RBi6SvWozZNYtfMFrYZQvEtlPPu80VBHmyMG1s/pvu5ZPX
         SOWUapZJEsRy8ix71+Ogz2K8O8aXi2vdA4th2q+L+IyCGmR5lvB6CYwZ5we2ZfkcAL59
         Cdog+Rfes2YDeruYwVpxRaBiVUFvqtR2p22NtHTSe6Mc8v0awI+dhGVNOIUtVGnYbnuL
         tt7Sj1KdlaPpVzCo4/IThmv4PPp4z0q4gj3ZI2VX3gML5/GrXFBO8HTuqlMgR8gYnB7v
         9ECw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=adJDRS6AMKloAvz10NEIG932vsL+jMGhzDfJoNsC4Z0=;
        b=D7xR5PR6asKNHbndHJU9RrU0y7MV++K4vGmQIZbE9d4G7lzATKQVz4ueUPkM4XOsLm
         C0NlxZ3ndyBVHC2RbmTtDkXkGI3yrAbnctijLPleyKgOkMMOn09lD/O416QqD6HugySM
         trMNoXFoTlofKs2LhKNgvwNKvxfE9wDqR3yGqUP1KCSH+rcon/WXe6KJNiDoOV62FFaO
         t8anxMixwBCv5XbUwZ4F+7vI4NT8JCqUYDsX7WS0KSZlWR+9sbo7kWMmWKF0uXg9f1Ng
         wr7JL9R4FTNDj9bljVTpQpfOPieZvTV3tB7yyu/gBKHqPBTNSY9TjasfkdDzTLrm4T40
         ixHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=QuT3bmA4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o2-20020a37be02000000b006bb286a68d5si8957667qkf.111.2022.09.08.03.45.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Sep 2022 03:45:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=QuT3bmA4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oWF2F-0001ek-23
	for alex.bennee@linaro.org; Thu, 08 Sep 2022 06:45:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1oWF1L-0000dO-8b
 for qemu-arm@nongnu.org; Thu, 08 Sep 2022 06:44:31 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:36464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1oWF17-0005X2-PP
 for qemu-arm@nongnu.org; Thu, 08 Sep 2022 06:44:30 -0400
Received: by mail-pg1-x52a.google.com with SMTP id s206so16346374pgs.3
 for <qemu-arm@nongnu.org>; Thu, 08 Sep 2022 03:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=adJDRS6AMKloAvz10NEIG932vsL+jMGhzDfJoNsC4Z0=;
 b=QuT3bmA4RvBeRsXhpSFAtGahPp0e7LiEjC5lxn3cWRNZj5ht83rZOix3GjxQw6whq1
 28YZug29Rd++JklEPc4Hhs/PAtEc+BCZRJhyrEUUWyirOV/fctwav28TGzf/VuuU0eKJ
 aOnZMXnUb30TlyHC9uOSs2YTFO7SogBIhqP3LubTtpaJNxeQ2wyBBjGfM+kcLMnhMwGd
 jcP88KRe8RxgHld2vbxpHzIp19B+bABVrrb9dWcZv1588W76K3ceaHYNlPfBELxj9qQf
 mjerGvtZPOP4DvkXUgC6WyA0gr6hat0Le2Snz8/Wk85SaQ3xcCk2qoTYZfFzwU/KPbSk
 NXKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=adJDRS6AMKloAvz10NEIG932vsL+jMGhzDfJoNsC4Z0=;
 b=EW6LKkC7byfuh/k4sKZ17PaRrwfmmP8aY2WXOCxX1uUVoVUIYsgQ9SQQ+tCWaW6bdx
 7+9CdovHTiKg8olROWf/w9aQad3pa/KxbdREp0k/zQVn4ZBrrRpEiU+pWgH7LHLQoRVD
 5NchXnl5d+N5tjbwAqF5GKtNTsScar9xNXWWxwxx8k5eWqmvIiqBs8hzeGFv6gVVpobm
 FBwUViopEwa236z788zkKW9Z1R7JSvT1YHnK83i4zcysejYNpWBurMFbFqC6iVYnE81B
 eOXq94PTI/caWJno/xT2Boup9gkdZw0pzYlthqK1dCA1+ztIWYXCb3bZ7OvrB+xUZyHL
 V4GQ==
X-Gm-Message-State: ACgBeo2zpebFejRYYxSHUkWHXW16bmRGp9V7eB10dsv2egO0Ej82zvf3
 ch5Jxu9qVgi1+o9f60FPIBaFyA==
X-Received: by 2002:a63:1c2:0:b0:430:710d:4c85 with SMTP id
 185-20020a6301c2000000b00430710d4c85mr7316475pgb.12.1662633855385; 
 Thu, 08 Sep 2022 03:44:15 -0700 (PDT)
Received: from sunil-laptop ([49.206.11.92]) by smtp.gmail.com with ESMTPSA id
 17-20020a631751000000b00434e00227a7sm3585314pgx.4.2022.09.08.03.44.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Sep 2022 03:44:15 -0700 (PDT)
Date: Thu, 8 Sep 2022 16:14:06 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Song Gao <gaosong@loongson.cn>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Pawel Polawski <ppolawsk@redhat.com>
Subject: Re: [PATCH V4 0/3] hw/riscv: virt: Enable booting S-mode firmware
 from pflash
Message-ID: <20220908104406.GA103508@sunil-laptop>
References: <20220906090219.412517-1-sunilvl@ventanamicro.com>
 <20220906104128.zlwzvbbswlzyplkc@sirius.home.kraxel.org>
 <20220906123200.GA237800@sunil-laptop>
 <20220907071037.tnnewqhi5v2xmiln@sirius.home.kraxel.org>
 <20220908102527.GB88864@sunil-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220908102527.GB88864@sunil-laptop>
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-TUID: iAXV7Au4t4Iu

> Same thing can be adopted to arm also since both seem to follow the same
> logic. But I think that will be a separate patch than this series. I
> will run that as a separate RFC patch. Is that fine?

Just to be clear, I meant RISC-V fix as separate RFC patch. Not the ARM.

Thanks
Sunil
