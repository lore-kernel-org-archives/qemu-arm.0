Received: by 2002:a17:906:c945:b0:a38:6d10:c5dd with SMTP id fw5csp2322502ejb;
        Mon, 12 Feb 2024 04:32:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGBRICs1KR0e+KSp+sizKRBWbhqD4n9GxJdU1w/m1CB1favyTvSJ9gmuKeu2IBjmB6bUnBb
X-Received: by 2002:a05:620a:1647:b0:785:d921:41a1 with SMTP id c7-20020a05620a164700b00785d92141a1mr1369361qko.70.1707741161999;
        Mon, 12 Feb 2024 04:32:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707741161; cv=none;
        d=google.com; s=arc-20160816;
        b=TBhdNFOJlKzUzz+/THJZkt414ObszDcuJBypqaqyn/+yNr61zB/3xPAp7GEWTQmCrZ
         9nyzVeqG4fKJKmU5qH5CiFhoF5gb/VdpRcj/IXfaGK1ckFbXaZ1frhG/xwHvTppMm4Hs
         9o07S/HkojJrzHuFsOVm23ylezJ0HZoPdnYXGnBvah4dxEJO8MIc/1JRePVfAxWLSkti
         6vZIpJIHeVDz2nDwKMhgjbkZK2Yh+nO+/puhUWNw7TP4Fh3gzeFkKzdT6wV4/Eolpa2j
         Ply9cApOKWxJvwgYYVpWbkYU1pUqgyQxC1FkuFKiEnFhIVTOE4ztSFyPuADhPaaI8b2p
         ncDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:mime-version:dkim-signature;
        bh=n5+OP/V+bXhIhPzeg7Q+fZwnwG9v8oGGXWdd6REyCoM=;
        fh=OxaZDo/6l1Ydf1jZnKmE6qo6Zz4NDTMS8VtwutV6vXE=;
        b=O/TOrQJB4JjyITe3fckNNMlnFvCItgTuR+j2+pKR2K/7eTYdn9449lGO092k8svpbh
         1ySyZm3eoRoNvwm/rJwWw8CeidgehNguQoWo+J5Fo4XigFUdGZzxMlNMt1JUYd7huH4a
         OPppjtL6xqLXic2H3dmOILDQmHqi//5PdVrP6qSsE4XW/AuPsE4dU0dUL8A1fgnb5/W6
         H0kNGOQwpmyh9U2eloLG6FXLq9KcY6PP8kfEDDvaJdUhOqDPH5Xxq8PKn5pZhd/9OoOP
         EdqrStrGb4XKa+qkHIJ/0cRS868BNCAWZYqe5VnGN9ApO2PlpPs77ddN5pqd8CT6Ikio
         JZbw==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uUQpgjqr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=1; AJvYcCWzrU8Uvsx77zdVWRLGud7BQVhYXHR3oOrOGuH3c6inUaJW8rmSVekjFhXfDt7TcXoZkgxPQqOa2NCwzivuevavgccrCmEf
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bk29-20020a05620a1a1d00b007858fccf35esi6337833qkb.125.2024.02.12.04.32.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Feb 2024 04:32:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uUQpgjqr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rZVU9-0005aT-MU; Mon, 12 Feb 2024 07:32:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rZVU7-0005a1-QY
 for qemu-arm@nongnu.org; Mon, 12 Feb 2024 07:32:32 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rZVU6-0004qL-9z
 for qemu-arm@nongnu.org; Mon, 12 Feb 2024 07:32:31 -0500
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-561587ce966so3846115a12.1
 for <qemu-arm@nongnu.org>; Mon, 12 Feb 2024 04:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707741148; x=1708345948; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=n5+OP/V+bXhIhPzeg7Q+fZwnwG9v8oGGXWdd6REyCoM=;
 b=uUQpgjqrnMmykiD49T3QFJJdJK5iUZVzJ4bALx0epwiAJvOoJtF+IWO0QRliBVima/
 9FxyBBtE8nMQfcG96BlvNNk7V1MNMUDozISZHbrH1aUyzZ/9xf5TgHfIewmtyTG1aqgV
 5J7KexkRhVG7g5mm+m4aHFmNI3XilcpSbOX6k9iEgSdnN4WTPwYzPoSj/UlHxKheeySW
 n5tpBunUVeDLVARJdxhiyziM/GADaPHICjoHUwat018FTI730SvfWeE3RY0tTGYV1Szb
 1I40eBDleoOzzW7aovUcyYTy7cuCJZUeIIdfTIOwitbatydcles8ArILHkyDyy26u7Qf
 n7gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707741148; x=1708345948;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=n5+OP/V+bXhIhPzeg7Q+fZwnwG9v8oGGXWdd6REyCoM=;
 b=XcoglUwdmNSbnHspbo0837ayf/EnN5+IO4FiHbuP9sIVbnvCHnZatCwAfJON1QQK7o
 kijc/fp4crDl61g555umqQahi9WXtM6AsPFfOsQcH0TVDthKIAkdkiCoO2MVNOpnICqn
 Zkmz3qiKtvRnuCO0vpPNDIVD8NWgnOgQ9oBNUbYwEF5jPQEmCqdcMd0AZ6gxInGcPa0s
 MmfPhaZdx8uuIxwWs+kOFO9GCVtCiPhl4DqHyoJGuY3D8ikpu400xjVpxOx5G5StGQTg
 bUCiSPLbVBaHBV+VcKnkrLneGRhMgDlz0IX8+ZnMCHcUiXWFKrSXKoY/ZQhh+9i4PyAv
 auNQ==
X-Gm-Message-State: AOJu0Yw8RRoLqO5OXKjK61kfrFo0pXohIA8QNCbsBHCIfhBF6VckE6Rs
 k9UX55dWufFz/uDQ3d6WrkLmP0EZePfXY7cqh7ZcNDq4potV2SPBRvzwYSFbLoqRDspOhhus9cO
 SF0ewHIwVHgXOezAUI6lG/y+Q/Zm9QLYxRJFSyA==
X-Received: by 2002:a05:6402:35d2:b0:561:841f:ed03 with SMTP id
 z18-20020a05640235d200b00561841fed03mr5879014edc.14.1707741148266; Mon, 12
 Feb 2024 04:32:28 -0800 (PST)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 12 Feb 2024 12:32:16 +0000
Message-ID: <CAFEAcA88UGhjh8-iBvhxx6GdWg74dinYouiguTcz=qEe51L7Ag@mail.gmail.com>
Subject: possible deprecation and removal of some old QEMU Arm machine types
 (pxa2xx, omap, sa1110)
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, Guenter Roeck <linux@roeck-us.net>, 
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: mlj2pl5tCUQr

QEMU includes some models of old Arm machine types which are
a bit problematic for us because:
 * they're written in a very old way that uses numerous APIs that we
   would like to get away from (eg they don't use qdev, they use
   qemu_system_reset_request(), they use vmstate_register(), etc)
 * they've been that way for a decade plus and nobody particularly has
   stepped up to try to modernise the code (beyond some occasional
   work here and there)
 * we often don't have test cases for them, which means that if we
   do try to do the necessary refactoring work on them we have no
   idea if they even still work at all afterwards

All these machine types are also of hardware that has largely passed
away into history and where I would not be surprised to find that
e.g. the Linux kernel support was never tested on real hardware
any more.

So I would like to explore whether we can deprecate-and-drop
some or all of them. This would let us delete the code entirely
rather than spending a long time trying to bring it up to scratch
for a probably very small to nonexistent userbase. The aim of this
email is to see if anybody is still using any of these and would be
upset if they went away. Reports of "I tried to use this machine
type and it's just broken" are also interesting as they would
strongly suggest that the machine has no real users and can be
removed.

The machines I have in mind are:

PXA2xx machines:

akita                Sharp SL-C1000 (Akita) PDA (PXA270)
borzoi               Sharp SL-C3100 (Borzoi) PDA (PXA270)
connex               Gumstix Connex (PXA255)
mainstone            Mainstone II (PXA27x)
spitz                Sharp SL-C3000 (Spitz) PDA (PXA270)
terrier              Sharp SL-C3200 (Terrier) PDA (PXA270)
tosa                 Sharp SL-6000 (Tosa) PDA (PXA255)
verdex               Gumstix Verdex Pro XL6P COMs (PXA270)
z2                   Zipit Z2 (PXA27x)

OMAP1 machines:

cheetah              Palm Tungsten|E aka. Cheetah PDA (OMAP310)
sx1                  Siemens SX1 (OMAP310) V2
sx1-v1               Siemens SX1 (OMAP310) V1

OMAP2 machines:

n800                 Nokia N800 tablet aka. RX-34 (OMAP2420)
n810                 Nokia N810 tablet aka. RX-44 (OMAP2420)

The one SA1110 machine:

collie               Sharp SL-5500 (Collie) PDA (SA-1110)

Obviously if we can remove all the machines that used a given
SoC, that's much more effective than if we just delete one or two.

I don't have any test images for the SA1110 or OMAP1 machines,
so those are the ones I am most keen to be able to drop.
I do have test images for a few of the pxa2xx and the OMAP2 machines.

thanks
-- PMM
