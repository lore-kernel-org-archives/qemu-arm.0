Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2906034lfy;
        Thu, 30 Jul 2020 13:45:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwO22oA6uT4vkRxetib/snP3BWoCLRWnh4bL4zgQcx16GoAdlBTs0Gwq6gkq6QAlslAoATJ
X-Received: by 2002:a25:c786:: with SMTP id w128mr1189232ybe.212.1596141951347;
        Thu, 30 Jul 2020 13:45:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596141951; cv=none;
        d=google.com; s=arc-20160816;
        b=mqhRP2aw/STNFVdJ78aKyuMsc+C8I3hTW5ksOnXrE2GR0sreLUPbQ4gX1opza3VCWE
         a+WGjX+8GGklyp0kqOr79XhUmh+dktK3bp8QjPiQ28xN1n/2ZJ0vx5V34Lq4Gy5jqXQ1
         maodR28jKyTvyjXScSye9wUHLb19RXjuXEQfbc7oJ19vgp1r113Rj8sVswzR/a7aog9T
         6pCh0kyG/sq/vY9AZk9N5IAEoiM4o/EaWvkDlwPOnudFUhl/xbtyYGEQerg23AVOEpf8
         R71mCBGLVno8sfAGGN45OfPtRGt3pXUycIcJHAuGr87b9PkRBZaA+ekYC+ky3lqAe5Vz
         xhCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=aBkYvXkJmJRapHaYhhDaM6BjCIDlswdRCmfla7GwHYA=;
        b=vMRPLIkfBj2eXgsBuev/CxLNkasEJS9iUx0ihOtjHyMzeWhZUNr1vAckAzwjOtjzwh
         nHTjxNntuID1ZYdiNuDZbRZGjdm/vwYnev2LuoKWl4gDtWu3T7LyltJswPvxhdDWm0DI
         Jaae4WOJE2g6yoW567a/c72xz8BJRclg7EWxi1D63BJTeyYLEJfuL9iyF3QsI5ce7Gx8
         y5QJbtgrRj4d7Mno7chVaS0EN1FbXJxIVxAlLgwUydJYMNclyn+qd2yalv9rN5zNnq4L
         ydkxKXOPIiXT8c0KZfzc76P49KY+UdbqKeKdCobQdqOamsptEUaL71cHtTjK+l2niMzh
         5XnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YqeGcrUK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d129si6923012ybc.158.2020.07.30.13.45.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Jul 2020 13:45:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YqeGcrUK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k1FR0-0001qI-Mi
	for alex.bennee@linaro.org; Thu, 30 Jul 2020 16:45:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k1FQh-0001pR-4Z
 for qemu-arm@nongnu.org; Thu, 30 Jul 2020 16:45:31 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:46072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k1FQe-0006lT-RC
 for qemu-arm@nongnu.org; Thu, 30 Jul 2020 16:45:30 -0400
Received: by mail-oi1-x242.google.com with SMTP id o21so4169400oie.12
 for <qemu-arm@nongnu.org>; Thu, 30 Jul 2020 13:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=aBkYvXkJmJRapHaYhhDaM6BjCIDlswdRCmfla7GwHYA=;
 b=YqeGcrUKOCr8MEeMA+/b1iof0fzvvJJGI2h4iuCJiTOHJn6XbV7JzYWArye73dG9K4
 YGpP9X1gbJ6at4WN48DMuH1g7/18XFb1V9zBFRgXYQsFWrOBQPvc8le7PUJxY/6kB7VF
 xjFdCbUhJDCck3K7MEvnWmI+YU21v4Dxth+PSzZ/KlJKM6hvKzVip/xqMApoLtVqzxSw
 uIO7LZpbzs4+c5yzobbT+pyagL58ot7yqABHPPgKEIYZJjgUHWYJVBmxLI65fDCLnFC8
 WeafOo9qO93CSR5uNw/ItnLzlTn/STRI2Uvkxv6+1ICcG93mY9WbQwwFMSLqAg1XtoC7
 RN0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=aBkYvXkJmJRapHaYhhDaM6BjCIDlswdRCmfla7GwHYA=;
 b=bMpGoDXeQfCEwiqTf4asSFW7grtgWdeaZEAJO8YT5oPq0lXVaN6sQhZdKVgww9CLfA
 xUHJ9HZImklfsrvD/ncXtlxgHGdWbXexZOSpTt9xgNILkIYiCIDaG9ljdUg0ntGp3cr5
 vAMCcaCSfCXjP3Wk3UaYeSaRDKAW6scfZJyHs2ZsfpDOpk8DPUdszriOXhwxqtjTu5By
 ZKucRn6wq01ScfQLQbb077Bd210gsV6GfqI3dsclcgUEaberaNM5WbI/1tjfGeqTzYb+
 YB/Vm4wleaRvFa8C3nDdTV73+rGBhY2axQBQ0O6I5GX5XzM0u9fkQRBf9yWrtsZXp8Li
 w8dw==
X-Gm-Message-State: AOAM533kwYjCpO8Dt+BvCPSMDUkvXxmBpxL0C48Vq5ZGEwDBVM3YYvw1
 YqZFuds+cynhsKICzUwJjfkJBmsrIfTIzZZMfDNarQ==
X-Received: by 2002:aca:50c4:: with SMTP id e187mr601881oib.146.1596141927371; 
 Thu, 30 Jul 2020 13:45:27 -0700 (PDT)
MIME-Version: 1.0
References: <1596110248-7366-1-git-send-email-likaige@loongson.cn>
 <1596110248-7366-2-git-send-email-likaige@loongson.cn>
In-Reply-To: <1596110248-7366-2-git-send-email-likaige@loongson.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Jul 2020 21:45:16 +0100
Message-ID: <CAFEAcA85xA=T389_M5_vjvm=TPirMqxNDt0za65G2NOfaDHdWA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] target/arm: Fix compile error.
To: Kaige Li <likaige@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::242;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x242.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: David Hildenbrand <david@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3AuOZtGS2FYR

On Thu, 30 Jul 2020 at 12:58, Kaige Li <likaige@loongson.cn> wrote:
>
> When I compile qemu with such as:
>
> git clone https://git.qemu.org/git/qemu.git
> cd qemu
> git submodule init
> git submodule update --recursive
> ./configure
> make
>
> There is error log:
>
> /home/LiKaige/qemu/target/arm/translate-a64.c: In function =E2=80=98disas=
_ldst=E2=80=99:
> /home/LiKaige/qemu/target/arm/translate-a64.c:3392:5: error: =E2=80=98fn=
=E2=80=99 may be used uninitialized in this function [-Werror=3Dmaybe-unini=
tialized]
>      fn(cpu_reg(s, rt), clean_addr, tcg_rs, get_mem_index(s),
>      ^
> /home/LiKaige/qemu/target/arm/translate-a64.c:3318:22: note: =E2=80=98fn=
=E2=80=99 was declared here
>      AtomicThreeOpFn *fn;
>                       ^
> cc1: all warnings being treated as errors
>
> So, add an initiallization value NULL for fn to fix this.
>
> Signed-off-by: Kaige Li <likaige@loongson.cn>

Hi; I've taken this patch (but not patch 1 in the series)
into target-arm.next, with the commit message cleaned up
to quote the compiler version.

thanks
-- PMM
