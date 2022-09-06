Received: by 2002:a17:906:1c87:0:0:0:0 with SMTP id g7csp2922843ejh;
        Tue, 6 Sep 2022 05:32:56 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6KZtSEenbAzkbSaAZzpr5dli0+a9pnyJTi1r4YDsh+JTfvKtUPFT70nQy1HM56KH3YZqHY
X-Received: by 2002:a05:622a:15d4:b0:344:6a92:d8dc with SMTP id d20-20020a05622a15d400b003446a92d8dcmr42715298qty.114.1662467576269;
        Tue, 06 Sep 2022 05:32:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1662467576; cv=none;
        d=google.com; s=arc-20160816;
        b=ceBwVXUwVRy6A8KOahX55SqyHFiFxa3s17r3yVlgw374sC//zDksnFVRzHCQ6unx5G
         /eSkS2AuzvYmxGZU3iTsqFvKtLNP6yHKCn8D24RfDpa+ns0fy5oINtyCGUmNciBiTVgg
         L5gOZDBhll+9y4YHLSisxPzY49giAydvdpoQjgN1sgIn/13QQR9ALGZAz029y6y69ZYQ
         3gavOwxIr6jgxqFeDLYWkttmhgLlaShAvIqcJem1qQN6KWyo2mYGgcs98VyjfJdhm1lx
         Sf9F8HlU8NuFF0t/Gm7yZuSY81rxmxHNd/Hjwxn+fkr4qoiFy4Vw+wwPljysKk8+NDMt
         GYfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=zuL+cCFEWKfTQ5JgfGgEls+NkRLchxm1H06+O6Y9F9c=;
        b=kpupue8BrumEvTFKQQ98nJk1boBv01jf311Sk3Z8jAcEilbQKYWdrTvtDb3/x+uwZ7
         yXpsEBKAQ5Ffqobq5uEbqBx0xC7ZQiB5dW62zOQQN5WgLBx3EEaaoexIa72yuA2unNdg
         d3JK+i1Yv8K1Z5ycrBfTnbhK4wXCWk51Dkx/stSu5mw/20tBUN67+ie8BoASuSFIGLdA
         VdbKdAxAuLnQIqkXSaZc9LuucB1BlPkzvJIiW/nsbkQPwyeeLyqwraK6GEzPnIPYJVMK
         cDDduyeO1HvW305g62ye3+LSQ9eUss5Z3JdTCGjndEwIL+o0rhuNGO9j314klys3ZCoq
         4Ejg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=efTTP7R1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x11-20020ac86b4b000000b00342fa771fd9si6318682qts.614.2022.09.06.05.32.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Sep 2022 05:32:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=efTTP7R1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oVXl9-0006I1-LP
	for alex.bennee@linaro.org; Tue, 06 Sep 2022 08:32:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oVW1T-0002Sn-7r
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:41:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oVW1Q-0001Cg-J4
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:41:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662460895;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zuL+cCFEWKfTQ5JgfGgEls+NkRLchxm1H06+O6Y9F9c=;
 b=efTTP7R1btGUeEIVJL+XCRMqi/uqn3tYVZtKwLtkc0qlOBrsWs+aG5PBRphOdZmWWeNVYR
 1FuaZSeZ3VkmnWyHpoKqmQrAgNzb/GEu95drUYBii6oE9NWvtJSFx32pKok61VPMZsirrv
 RmlM76WXSxUWJLU+0oPOdIyUVQ6ii5k=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-328-2lg3nmUUMFq8UTO1QH9tUw-1; Tue, 06 Sep 2022 06:41:31 -0400
X-MC-Unique: 2lg3nmUUMFq8UTO1QH9tUw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E74BE3C01DFC;
 Tue,  6 Sep 2022 10:41:30 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.195.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 623C8C15BBD;
 Tue,  6 Sep 2022 10:41:30 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B24391800629; Tue,  6 Sep 2022 12:41:28 +0200 (CEST)
Date: Tue, 6 Sep 2022 12:41:28 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Song Gao <gaosong@loongson.cn>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH V4 0/3] hw/riscv: virt: Enable booting S-mode firmware
 from pflash
Message-ID: <20220906104128.zlwzvbbswlzyplkc@sirius.home.kraxel.org>
References: <20220906090219.412517-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220906090219.412517-1-sunilvl@ventanamicro.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 1nmqw9Z3NIXK

  Hi,

> 3)Make the EDK2 image size to match with what qemu flash expects
> truncate -s 32M Build/RiscVVirt/DEBUG_GCC5/FV/RISCV_VIRT.fd

Hmm, we have that kind of padding on arm too (64M for code and 64M for
vars) and only a fraction of the space is actually used, which isn't
exactly ideal.  So not sure it is a good plan to repeat that on riscv.

Also: Do you have support for persistent efi variables?  If that is the
case then it makes sense to have separate pflash devices for code and
variable store.  First because you can map the code part read-only then,
and second because decoupling code + vars to separate files allows easy
firmware code updates without loosing the variable store.

take care,
  Gerd

