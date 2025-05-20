Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp469507njc;
        Tue, 20 May 2025 05:41:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVpHDo652lbYg4VNG5U4G/P+st/sDyj8B2G6wDbOs1syyC/XavuWzlXFzuSm5f7vpQz8wOe0hY9aPTpbA==@linaro.org
X-Google-Smtp-Source: AGHT+IEUGzFqNydZmZsZWmM0MDaeMgJxlK5Zu7R57CVy+Ydw+llIQpLSOH9zInfkHHDP4fmOUYbw
X-Received: by 2002:a05:6e02:1523:b0:3dc:7fa4:842 with SMTP id e9e14a558f8ab-3dc7fa40f3cmr7161885ab.17.1747744901695;
        Tue, 20 May 2025 05:41:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747744901; cv=none;
        d=google.com; s=arc-20240605;
        b=JLBQlTyLlzmvp1hk00eh7rvhF9/LbixPMpyl2SEgrOZ/oA3iSUWIOXpmUux9PcvtYu
         WwvndR4k44BqOMaiExwe29t9nDTdC+2F8HhhlLDVgxSIY6VwWyPNrLfNumVJbqhPGiVw
         57xZ83jOFS4viyR2mEGq6rpe/JKyYQeytcG1yLaALfdp6JPmqj+g8t9t53CU68GMN68e
         Ig5Xt50VC2U9WHuLGHoEuoxuUK3F7ftQE9QKfv9AsyKamlSXs3+9emIJeskVRyFtZS5G
         gdPQXMQGbGkhgpO8T2HWNHihR8/3fTAFFSoHlLKD8dbxlBoHKX7ws+ckRZGXtmKeZHAZ
         Gx+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=C5/Lmygrmg6XoOb5JC0J9Qx4nki1DsHe28Maa24ur/M=;
        fh=ItjGgC1fUoVhMY4WHq0tv6IRVcOSXto5FZrETYUpRng=;
        b=RQ6kRFtQTxkYXSzzgu7m5dEJreJLH13HzE5bBu3re8eWcr93KaL0EfnzPkjsc0sAb8
         BWYTkXWedMpEyYf3YOLIl5xaMVsu8NVVAluT4UdpUwJDumm59YdKo/gOY87SmUmqmt7M
         MUr43ZsgapJ+ogO/79TpJpgAVNqvneFn+znBwqKFf+2mFSUdrT2oATbs608Xn5AuFwa1
         qMKkYT4CADZb3y3y/G7ofJR/Et/VsA/ylenI9xWQi192rgGMSosTgN5iTHcvPH452oj1
         xvb1UK/1qUCKRHyL9zoUK37dKKEmYDEKAORgSf1gHyqZnDLBVavPyFXwHKEwMei/Zqqj
         eAaA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@adacore.com header.s=google header.b=BizEpz48;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=adacore.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e9e14a558f8ab-3db85c632ffsi92280845ab.152.2025.05.20.05.41.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 May 2025 05:41:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@adacore.com header.s=google header.b=BizEpz48;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=adacore.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uHMHh-0006dH-7v; Tue, 20 May 2025 08:41:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1uHMHc-0006cy-7p
 for qemu-arm@nongnu.org; Tue, 20 May 2025 08:41:24 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1uHMHZ-0006G2-TV
 for qemu-arm@nongnu.org; Tue, 20 May 2025 08:41:23 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-601fb2b7884so2823373a12.2
 for <qemu-arm@nongnu.org>; Tue, 20 May 2025 05:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=adacore.com; s=google; t=1747744879; x=1748349679; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C5/Lmygrmg6XoOb5JC0J9Qx4nki1DsHe28Maa24ur/M=;
 b=BizEpz48WP3khNDSgjaDkw864/QRihMEjKLanfjmz/k5gQgc3a4R7bxGqn0Zsy1L+y
 +/IUr95xlNo2tc4+adyBZAnk++W83AHk6m68VjYOlFP8lKni9H/uKE80ViG8JSoiLU3l
 E6SKseTzJMSfF4EOVD9EindaGPwYUhkKy4pdtnjNIq7aqq9vpaDJT2BKfj1quUJmf8CP
 sp+r+HEicGuXbikl2RfPeHwZZ40l6+FXnt0+Y6S1vT2HKUECgMe0mJ3vCHGvhttpAP+5
 0SXSmjOoPU+7DF7Zn4jO0ZW2eT8ThtR+YLbQM/J234KcNey72RzyXFE3TqkLhaDNo8+I
 rfbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747744879; x=1748349679;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C5/Lmygrmg6XoOb5JC0J9Qx4nki1DsHe28Maa24ur/M=;
 b=CFGqIyH2odBjP5N9F2cqYCAj7otKphF/eMXbsg1jitI7eRfizl6qb1Fcib3tpKFlIr
 7MmW688AvOPLKwKDo5YR5np9XxpbK7u9ppLaHYgb/zftTlMAjgHu7jj0y/IBlkT6q8M6
 S3+79lqHeX2YYfCtkvkB5wj7znwbAMNcPGDS9MKKhBsy/8800C4J3dGPxNE34o9DOkjf
 o0xEZtWFVdWuX+Qsc0krXxsxwUTp3tGeUs0Qoj9h7TEwNkMQW3UuN/TAx72kwR+xOtFH
 OVSB2vk4ZcHfb/Vubvv/b77FSmtBEi87vl39VERNs5e07tOQRbsiqvCKiQ7KCgQ2tsGN
 V6tw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBRJUceKuQmlcyUz+Hx6Vcs3HU0jdaIRiqD6AoOsDSyEMo/Sbks7UWkbKRhUdp3yzgt82/y6NauA==@nongnu.org
X-Gm-Message-State: AOJu0YygYAn92FbK0rn9bvS97SlfNV2D3BIB29wik/HMusV8KyhRtp2v
 TpgpIwfs+xSyzqxcHNtJb9fLy3alrxiLx62BCd317/pMGPUnzsI4+vwOPDc87sEQnMpZubYqZO/
 Qnk9ajo+5tnWgtNN4l1qWKlBSWjCxb3NmeV+EkFPu
X-Gm-Gg: ASbGncu0aZLQbkVex9lDa6JZibbSFuiRQZt7p5hyzuS7+wtjHwkd5pjO/fGvjUmCCak
 d9kB41552AQ3C+JtLA9BILZnP5emZTboi8nMlS9eHOIpAiEI+Zi4QC+SbDixZDLcOC9s6letDIL
 Luw0uhK6JDYqGt0whYkCYttXOxiGR0Ubtyt2W29nmpa6M=
X-Received: by 2002:a05:6402:4410:b0:5f4:c5eb:50c9 with SMTP id
 4fb4d7f45d1cf-60119cc8f77mr13905530a12.21.1747744878652; Tue, 20 May 2025
 05:41:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250513141448.297946-1-chigot@adacore.com>
 <20250513141448.297946-5-chigot@adacore.com>
 <CAFEAcA8qA-ZyWihgSkw3Ubnz-WyXMB3m_MT9facnktqbXAM7MA@mail.gmail.com>
In-Reply-To: <CAFEAcA8qA-ZyWihgSkw3Ubnz-WyXMB3m_MT9facnktqbXAM7MA@mail.gmail.com>
From: =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>
Date: Tue, 20 May 2025 14:41:07 +0200
X-Gm-Features: AX0GCFtNX5fMX53zM9rw2kMDpyjIHgK0FqtVBTsMbycd8J1AkIw6lw9nPS87Sh8
Message-ID: <CAJ307Eiqdaki-v1JNY2t4idbxbDiBWcDTRJeBp8A6+nGYE+M7g@mail.gmail.com>
Subject: Re: [PATCH 4/4] hw/arm/xlnx-zynqmp: adapt cluster-id based on the
 boot cpu
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, edgar.iglesias@gmail.com, 
 alistair@alistair23.me
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=chigot@adacore.com; helo=mail-ed1-x52a.google.com
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
X-TUID: JWEzkb7llDzv

On Mon, May 19, 2025 at 5:38=E2=80=AFPM Peter Maydell <peter.maydell@linaro=
.org> wrote:
>
> On Tue, 13 May 2025 at 15:15, Cl=C3=A9ment Chigot <chigot@adacore.com> wr=
ote:
> >
> > When gdb is being connected to QEmu, it will be attached to the first
>
> (QEMU is all-caps, by the way)
>
> > CPU cluster. However, the ZynqMP board has two clusters, those being of
> > two different architectures.
> > Therefore, when gdb is connecting to the ZynqMP, it receives the target
> > descriptor of the first CPU cluster. Up to now, it was always the APU
> > cluster, which is AARCH64.
> >
> > When booting on a RPU, gdb will still connect to the APU. If gdb is
> > supporting only ARM32, it will receive the APU target descriptor,
> > resulting in:
> >   | (gdb) target remote :1234
> >   | warning: while parsing target description (at line 1): Target
> >   | description specified unknown architecture "aarch64"
> >
> > Adjust the cluster-id based on the boot cpu will resolve the above
> > issue; allowing a pure ARM32 toolchain to debug programs running on
> > RPUs.
>
> I'm not really enthusiastic about renumbering the clusters
> like this. I think you should be able to get gdb to connect
> to the second cluster via the multiple-inferior support:
>
> https://www.qemu.org/docs/master/system/gdb.html#debugging-multicore-mach=
ines

Sadly, that doesn't work. `attach 2` requires the connection to be
already established. But it's being aborted as soon as gdb can't
decode the XML provided.
  | $ arm-elf-gdb helloworld
  | (gdb) target extended-remote localhost:1234
  | Remote debugging using localhost:1234
  | warning: while parsing target description (at line 1): Target
description specified unknown architecture "aarch64"
  | warning: Could not load XML target description; ignoring
  | Remote 'g' packet reply is too long (expected 168 bytes, got 268 bytes)=
: ...
  | (gdb) add-inferior
  | [New inferior 2]
  | Added inferior 2
  | (gdb) inferior 2
  | [Switching to inferior 2 [<null>] (<noexec>)]
  | (gdb) attach 2
  | Don't know how to attach.  Try "help target".
  | (gdb) info connection
  | No connections.

FTR, I tried to find a way to adjust gdbstub.c to retrieve the
boot-cpu or have a different "first cpu" according to an option. But
this was far more complex than just that patch.
That being said, I understand that this solution is far from perfect
and I'm fine keeping it as a local patch if you think it would bring
more pain overall. There is a simple workaround/solution: have a gdb
understanding both aarch64 and arm32 when debugging ZynqMP programs
(something we cannot do that on our side for various reasons
though...).

Cl=C3=A9ment

> thanks
> -- PMM
