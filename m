Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp2086363njm;
        Fri, 7 Mar 2025 02:41:34 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXhY0NblEc8qSfNOGSqa3f0SCqvf9PV0g9WFbgW7d2158zXzAJUgq/+rI1S0zg9+HZ2nJ2LceqCZZd4yw==@linaro.org
X-Google-Smtp-Source: AGHT+IHGZx7uQFTojhChjbQ5fTx9PjBQNKuazJ43BUBd3QG2dgXvnPePe3RBVdF3Mqx+1lt8H4y5
X-Received: by 2002:a05:622a:164b:b0:475:331:db1c with SMTP id d75a77b69052e-476109c28d1mr35426921cf.30.1741344093821;
        Fri, 07 Mar 2025 02:41:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741344093; cv=none;
        d=google.com; s=arc-20240605;
        b=Dx2IiqXNoCOcotS64tMPI83QHpMvjk5XZN+ZQhIrgWqSncioHO7IrOhAJ0moTbPXs0
         Y1zZFZ3bz13k2NGvJJwMqnx+tnoN4JCtbTm95MD+rFWiolxicDSQxjo41mtKEbBfohnY
         PdloXrKGEZB7Rv1tz61M4TAIAfJJYluQEu4hUekg4goniFffAb+4TDC3pALuMqYtG4ui
         ePLbdJNf/aUTgesTMmLiECZ57YACJPlHQT57wNj+xa0SeQngnLF2hSdMZqCSrbaw6FDw
         ENB8qXPiKG10JPf9CnAwBkR/8rZ5yoeAuqHySTxJUJ+6X7djas34QMXn8tzw5PgWvSuE
         p7cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Or8nid5ZiXi3yxl/7VmAKOyJyaMIwbEgpuB/hf5xtIQ=;
        fh=MLHM+gxpjdRCX46UmlsHJq+wyb7s5ougP82NtFt1JKc=;
        b=PLcGRtYKERvMZy06yVwxrAQADcYD+x9yw9yIfpBLsn0g+cG04SVDzjsjqEi9FiMqH3
         ITf8J8yL4yhP/DN8i9iM0zo/7pWzcVuljAMw7cPQ1gttdDCgP4inn2fJ+kHKUmq5h/Qj
         yLGAgw7YhN3ZeXexrpm2yzigkBTNDyrOJnAeR+wCguLYw9U0fuXJ0Nc6gRyFi680DavA
         zJElXiEox6HBBn7q3TnIudQ+5Hc828uFUqE80ui+Nbt2Xhez42BiJByYUzGAUA7P/cPQ
         lvUOr4sJOFpXPucsgZfZWndfNyOI8+Z2t0WUTe1QEbdCQflh/gc4ZM4u6kzUvK2QfUPG
         dDHA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gRaBxdCJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4751db1ddf8si31338881cf.398.2025.03.07.02.41.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Mar 2025 02:41:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gRaBxdCJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tqV8l-0002nK-Rk; Fri, 07 Mar 2025 05:41:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tqV8j-0002lQ-3r
 for qemu-arm@nongnu.org; Fri, 07 Mar 2025 05:41:13 -0500
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tqV8h-0008Ln-9h
 for qemu-arm@nongnu.org; Fri, 07 Mar 2025 05:41:12 -0500
Received: by mail-yb1-xb35.google.com with SMTP id
 3f1490d57ef6-e5dc299deb4so1458718276.1
 for <qemu-arm@nongnu.org>; Fri, 07 Mar 2025 02:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741344070; x=1741948870; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Or8nid5ZiXi3yxl/7VmAKOyJyaMIwbEgpuB/hf5xtIQ=;
 b=gRaBxdCJTNv69zk5nxw5GahTLC83/ZndfQUslkyCzi61Og5YHfn00103j5ZAaqrvgz
 Ad64/g2J/N3bqQs9wIo3dkRvDMXD9UJKW7/3NhwSS25j03bGrHLY/urad+EDcyqEgYpa
 wwHzdkWSwHMZoP2F2Y9ZHHPM88CVM7CrQNUrKbky8iuklcntl3UorbsjFnxe8T6fRhJW
 maPdlm7ebQ8/ndZFmq1LCi7So2QmOO6eDQ/sir9yVh9DRP/2Rei/0RmL8anlBZthk3Gc
 FPS1WzBsHBWCA7Pm96j1DONMeVJrfds7mGwHbfwUwjTkGsSQuLG1Xjc50d0+IfUbt1fp
 3W2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741344070; x=1741948870;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Or8nid5ZiXi3yxl/7VmAKOyJyaMIwbEgpuB/hf5xtIQ=;
 b=Sf4ttw14QfRmzrvS+za0SAOXouQawYr7MyfxDjAGgc+NoCZnfgWALCx4x4PmazxBL7
 gFOLb5EWe/H123fwGoXKd0VphQNNY+5U6lQTjYHy0oxFLG/lhVQdJtOITAM+OE5i5+nq
 9v50+jPBGxrdjB6BarxZDRk1yQakfTllg8qQ35jvVKBtp/OHlsn5qPgPHzuvDvS2EAeO
 fG10TAVhm7XEsT3qHyDtX2MvLbb4ZVhMThIJu8MVqxztm2UZxqqPe+t0I29hKDpIpj62
 JohbWLBHJbznbFRAwqtjTB5ynwhUAWySb/bdO/3DUHI0fum7jURt2s2xlDhmIEcynj29
 9pyA==
X-Gm-Message-State: AOJu0YymE31JDCV4jlgrdixJDAW2Y+LdIVOg09XkWCu79tj6WAqzfxCF
 oqLBHZ8H7SVjvwCZjnFXmfJdFkCD6VCo+bsjaj8LMNFPMzPSMyCHTtsojS5kvT4dPGRYr/M4Trj
 cWuBE3XlntD35Ay/ntXn+NXyHuaU1/W6BkqQgCzFt8ZwHErJs
X-Gm-Gg: ASbGncv33cgB9XcnVbc/ash8usxF/eFByA4Jt9TTx3DnTSW6duZzf+oJ17bYvemcOzM
 hdiWDuVdTyweo27F0WVA4NjK1owqQVyEMwYjG/KUXbipKYFt0EdhpQy//Fz6CPeRYTQN+kVEtoX
 IU5GSV5+X6QhDA2SDC/rHLvReKzD4=
X-Received: by 2002:a05:6902:1b8e:b0:e60:a16c:d01f with SMTP id
 3f1490d57ef6-e635c1f4d28mr3524529276.47.1741344070188; Fri, 07 Mar 2025
 02:41:10 -0800 (PST)
MIME-Version: 1.0
References: <20250228174802.1945417-1-peter.maydell@linaro.org>
 <CAFEAcA9RPnZdf5zqFwu255-LdJ5inFbjtCA8SJ4o89aiUuabpA@mail.gmail.com>
In-Reply-To: <CAFEAcA9RPnZdf5zqFwu255-LdJ5inFbjtCA8SJ4o89aiUuabpA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Mar 2025 10:40:58 +0000
X-Gm-Features: AQ5f1JoIK5vHYIdC4x-PFgjp35sYufdDTGe4cFGEW41goOLjFhItfVdX-p0j9_M
Message-ID: <CAFEAcA8+oA6jJPrN_o3VDbSETyZugsFrRZH7uUSP9i6KdQE3vQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] hw/net/smc91c111: Fix potential array overflows
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: SnNFtkTcRFhf

Ping for review of this series (and the other smc91c111
patch I link below), please?

thanks
-- PMM


On Fri, 28 Feb 2025 at 19:22, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Fri, 28 Feb 2025 at 17:48, Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > This patchset fixes some potential array overflows in the
> > smc91c111 ethernet device model, including the one found in
> > https://gitlab.com/qemu-project/qemu/-/issues/2742
> >
> > There are two classes of bugs:
> >  * we accept packet numbers from the guest, but we were not
> >    validating that they were in range before using them as an
> >    index into the data[][] array
> >  * we didn't sanitize the length field read from the data
> >    frame on tx before using it as an index to find the
> >    control byte at the end of the frame, so we could read off
> >    the end of the buffer
> >
> > This patchset fixes both of these. The datasheet is sadly
> > silent on the h/w behaviour for these errors, so I opted to
> > LOG_GUEST_ERROR and silently ignore the invalid operations.
> >
> > Patch 3 tidies up the existing code to use a constant defined
> > in patch 2; I put it last so we can cc the first two patches
> > to stable without having to also backport that patch.
>
> See also the other smc91c111 fuzzer fix patch:
> https://patchew.org/QEMU/20250228191652.1957208-1-peter.maydell@linaro.org/
>
> (if I need to do a v2 of this series I'll put that one in too)
