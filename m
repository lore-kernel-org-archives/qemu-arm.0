Received: by 2002:a17:907:d043:b0:9d0:bf65:29fa with SMTP id vb3csp149349ejc;
        Fri, 27 Oct 2023 05:17:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHS+GEPSVTjWAibAQlSNLREq4Kp2Iq9AqpNu0tVI8exZXB6rsCPz19J90witnE21mE8G1q
X-Received: by 2002:a25:aaca:0:b0:d9b:90d2:aadf with SMTP id t68-20020a25aaca000000b00d9b90d2aadfmr2602751ybi.49.1698409020781;
        Fri, 27 Oct 2023 05:17:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698409020; cv=none;
        d=google.com; s=arc-20160816;
        b=PVsZWyTgnmr7HgzsrgOVXx3Bzz+uLtbwzfwGJbgwb+39vhnFTo7GVK4YTNQvxfdil+
         HbOR/lPPOwZE5bjlLMkPscACIHiex+LdwX5ZHvVgIEtrSg3Dn5uAKwOZeTIcIfZD/46k
         4HBY7FvuKxxK4PisZLt6kIOZulizdnevhPBlv9LEe2IMZ2B9RVCk88l/dfHf5ZKkGe3c
         OlX0EeWPEW2uzOyIefmuO7biyDQJ4pQEe7Uijo+eenm7owWPWPeZ046fN/1qETJmKI6X
         F3r2gwtMumAoO0LY/oASbtriGtPB9EGONoJUyulLaSvY6LH/iJGaCoP6lUkFXSND/26b
         Hyog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=+niAB94xkwrpIXtX89f78vV3+CT29Hlo7jQqkO4CSGY=;
        fh=AzswT6i0x5VifN6t6e7cFRAfmFUzzjusx2oAttgKAqk=;
        b=z1uqDU8nswzwj58rE9/VK/T7Ej8dnc52z3oKBSEyQe8tRHGycZY8lKp9AWpZ29ooKt
         uBYFI+I8qwm+uLDaiPb7zC9TL0plKZkV0t0oH+jGkxcUz1FrIwyrDPdxfXhvOTBvk+uy
         ftfsPT/lQVcqRjQiUIwe8xyNHeAfThggbmif7W+vCqH+GGho68UpyQlrMjs0C7DyKnel
         S4KNrK9Ab8FnnX5b7n/lBZnXcgj7MfjWqRlQzkQJlrGfIW9Z2aAy6JCx9LMqEqTDEe6Z
         05YXcAeU4U0zoy/JqnkCkTIJDJoVYtf4s5XjEIidHM6xQsdGEyI0rhQXGdCZ7J8bN60Q
         +UiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LT7FDkJ1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e9-20020a255009000000b00da0b6904d15si2505836ybb.284.2023.10.27.05.17.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Oct 2023 05:17:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LT7FDkJ1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qwLlB-0004aO-E4; Fri, 27 Oct 2023 08:16:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qwLl9-0004a4-QB
 for qemu-arm@nongnu.org; Fri, 27 Oct 2023 08:16:16 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qwLl8-0006qY-22
 for qemu-arm@nongnu.org; Fri, 27 Oct 2023 08:16:15 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-53f9af41444so3399173a12.1
 for <qemu-arm@nongnu.org>; Fri, 27 Oct 2023 05:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698408972; x=1699013772; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+niAB94xkwrpIXtX89f78vV3+CT29Hlo7jQqkO4CSGY=;
 b=LT7FDkJ1DeRGe9/hxpgpeclFa3PktcPDd6e6ogf+LMzsxRVoZ+3ZRCPJlwcxeeN2IM
 KqW6IezXxY6aSc7V0p4Yl4wYQqhx9MYXEBNtslh02sbiySChXBtzeGN1z4JGzAAHYtbw
 xpcmvcs4p5ZgSQDbDApRVt6Zg7OGUSVSoKYFYip3RGNxMoq9STLeH9A3vbIdPAuZhwg2
 C0k56aVN2iauBw3vWwaHl89prg+KQqZ2yQ7Drar3DeLR/QdGQkRraofUe28E+EQ4MJ+R
 p3RG1jiPUoCuix4du1cfcxO+QJZ70qFt9hpvM03pwA2XVrYElAVqotD4Q6jilMvQ4yv3
 IVXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698408972; x=1699013772;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+niAB94xkwrpIXtX89f78vV3+CT29Hlo7jQqkO4CSGY=;
 b=bhtk5UTtim7eydEE1OvdNe+e+qOBnq0BE4S6OpSGfhYn6J9irQ9gb6k1YR+J5efvUE
 VMtK0xOZV+49wyiS5+wsVPBFNi+qBamow4ructwDSLKrFWR7jww5cg7d3dWv1fI8scJa
 ToHOcJRUk7w6JOzixjjOlXjfkw2jLIn0jeFBDtwvjtW34FY6qbVUkgAVRHz0koE0rKH3
 Qw1GvLwWHp+jUYL2UeIWC8IOaqMq2IaJDKTGCYIhVXNuLt7MnUr9edLyaZNlYXmF0o7W
 JVl4oJdc0W/sIo19v7Gusf7r7Lo6tPbAc48X9WrX4xLHua7szdPvMSI9xxcOzq4KBPOK
 vAvA==
X-Gm-Message-State: AOJu0YwSRzvyZ5sRN3y6whdj0ezQViqZLapskXlVclen8g6HhtvWzIwa
 zL1Er+wDevLQ3T5Yr7RvSzj8UzgehJQC/SPq0RK8Qw==
X-Received: by 2002:a05:6402:8c1:b0:53e:afc0:ea43 with SMTP id
 d1-20020a05640208c100b0053eafc0ea43mr2338947edz.4.1698408972054; Fri, 27 Oct
 2023 05:16:12 -0700 (PDT)
MIME-Version: 1.0
References: <20231017194422.4124691-1-luc.michel@amd.com>
In-Reply-To: <20231017194422.4124691-1-luc.michel@amd.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 27 Oct 2023 13:16:01 +0100
Message-ID: <CAFEAcA94NgfP52=y0dxE+ao_--DsLU+2bBXtjKvK28q-biabNQ@mail.gmail.com>
Subject: Re: [PATCH 00/11] Various updates for the Cadence GEM model
To: Luc Michel <luc.michel@amd.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, 
 Jason Wang <jasowang@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Francisco Iglesias <francisco.iglesias@amd.com>,
 Frederic Konrad <frederic.konrad@amd.com>, 
 Sai Pavan Boddu <sai.pavan.boddu@amd.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Sloqdhzwdc4S

On Tue, 17 Oct 2023 at 20:44, Luc Michel <luc.michel@amd.com> wrote:
>
> Hi,
>
> This series brings small changes to the Cadence GEM Ethernet model.
> There is (almost) no behaviour change.
>
> Patches 1 to 9 replace handcrafted defines with the use of REG32 and
> FIELDS macros for register and fields declarations.
>
> Patch 10 fixes PHY accesses so that they are done only on a write to the
> PHYMNTNC register (as the real hardware does).
>
> Patch 11 fixes a potential bug on hosts where unsigned would not be 32
> bits.

Applied to target-arm.next, thanks.

Note to Sai for the future: in Reviewed-by: tags, as with
Signed-off-by: tags, the expected form is "Full Name <email@example.com>",
not just a bare email address. (I would actively ask for a change
on a signed-off-by line with an email alone, but for Reviewed-by
it's less significant.)

thanks
-- PMM
