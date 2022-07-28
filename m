Received: by 2002:a05:6512:1086:0:0:0:0 with SMTP id j6csp331649lfg;
        Thu, 28 Jul 2022 08:04:31 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vFvcuP0xEbCl3e3baFB5tdCgILHMcU82Sz8OSph9KTsXUSew3cU8fbOFDWEasqqBWK/6Cm
X-Received: by 2002:a05:6214:501e:b0:474:5230:f0c3 with SMTP id jo30-20020a056214501e00b004745230f0c3mr15832443qvb.110.1659020671343;
        Thu, 28 Jul 2022 08:04:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1659020671; cv=none;
        d=google.com; s=arc-20160816;
        b=OkMyHAP4mvVx8VNE44uMa+aQ2rOEewIoXaYDd/WZV5V5RNQoUZVmLWP0X5chYSf6/m
         FS9kNvBVLQewEGlanVxHWuf7N8KslAMJxoGSgYeYWR5H0J0gGPr6r63nH0zSnfMH9JQu
         Hmmd09F+AwXbakHPM6upiixfseRaSi7YIAWy5BePQ9f8QFSTU9OMoAzaQ1vdNPHCDBxV
         dhET4wFUzW9VweEChiL1YxaLQ0fE1m8jo1BXwm6N2s62C2c1EGy5t7lDa0YI41H52+Uc
         Xq2d6xJoCrj0dwQChVXWCn4TXrmN2QPRf2rJfdUe/RZaFCzmGCHan6badWCC8qpnHUk8
         nsVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Lnf+TMUXbt/kQAgMdjh+++TtQJ+1pRGY9fD05kQD3to=;
        b=vcq55wrBrSoCVRiFMk3cPN7I9lZvyNsbV54IHLRUC/at6JVF6swtqZr8f5haaxItnG
         egzTDbgvqZmj5Qzp4ImIHEhlGCyZ9upFmUO9j08fTFBd2NhnpgE0Hg7r5GVGybO6NGef
         okR2xAfql+n8dGZlwU6whrfnTJ4Op+LNvHDexLNsWoSk3J9WPVylWXM9zDCS/4dj+Bhq
         bNGsTVt647ISBuvcNrLDWHm+FKQuhj8fHvi98mFwjqctswKPua71Phhw9/8lYZBLB6aJ
         aMoxBUvcqs/+++JS5YQ7IE45DuZQWtTCEXNxvUboAw2D+pYA2hdZ5tVqLzdHhDb9SH5R
         12AQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=j7DnhQbF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kd3-20020a056214400300b00470597b4aa4si485861qvb.302.2022.07.28.08.04.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Jul 2022 08:04:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=j7DnhQbF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oH53s-0002tK-G9
	for alex.bennee@linaro.org; Thu, 28 Jul 2022 11:04:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oH4z8-0000MG-Ji
 for qemu-arm@nongnu.org; Thu, 28 Jul 2022 10:59:34 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29]:42709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oH4z7-0002XW-1i
 for qemu-arm@nongnu.org; Thu, 28 Jul 2022 10:59:34 -0400
Received: by mail-yb1-xb29.google.com with SMTP id c131so3652308ybf.9
 for <qemu-arm@nongnu.org>; Thu, 28 Jul 2022 07:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Lnf+TMUXbt/kQAgMdjh+++TtQJ+1pRGY9fD05kQD3to=;
 b=j7DnhQbFs1O0d+7Wq0j4LIKrHMAYISEL9TX3ChQ2WLydSnw3jVL3gVGq2nVu8NQPuU
 J1jXCzQKXN41CnMcU1hL/JJUO/FjgYyxL1ff1C7x5JXRdyUxr5Jgd78FZsbDpT2ofPYB
 /wAwcTwx1NaBpQ3HFpu5LJQEM+hSYecFs49WYg6dHP3dVH+VhIlA5fCLpobM5hRFKz9/
 nL76RY5XvoeYkOw/nynwciBe0IyQuRs5uyA1o89yNW2UWGuRgPJf/H91dH5N8oeZmRLB
 nWUn9VdgAVJNmiD6RSF4SIjsyw9fhwwPnbwC6q0Xz5TxIJnqfVSb6iz6sEbj+Qpgygln
 2N2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Lnf+TMUXbt/kQAgMdjh+++TtQJ+1pRGY9fD05kQD3to=;
 b=jfniKvNXiyCJbHUsBBBLrDoapXR1SC7Tk80+29NSw1S3RJbGbhIjdiVqt8nj0gOJZC
 y2anmOvXDMmtcCkyCLR42Sqyo+z61vrJjOiuYBjIsNU8XrFmAmpjKpfBjK1NcXnwbRuh
 rC3k0UwEDZrGhLY/qHTEZrPArG5Ba3JkuWChPX6992FQHNbc/glyLh674i4GtpbcZnMe
 JRtJwUynDgXkYv3qzWSFwCc9TShk185IZNcbu+gs/zBvx5UsUX2mfhDNYEt3A8//U65B
 cXPDPgbAkS+J0oAT2YHX/P8XUOZaebRSwY9BLAhps9z1EMyfIDweTXvXWXL5CAd69isb
 ETsw==
X-Gm-Message-State: AJIora9azkzBviEw+aDFFEWQN8surJe2ryshXDcafkQVBFH29Tx6Sx3q
 6xjty+m5fslsKelSldjgOtpcM+5cDggqWV/8CfapMw==
X-Received: by 2002:a25:cf47:0:b0:671:8224:75c6 with SMTP id
 f68-20020a25cf47000000b00671822475c6mr6284216ybg.288.1659020371965; Thu, 28
 Jul 2022 07:59:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220714182836.89602-1-wuhaotsh@google.com>
 <20220714182836.89602-6-wuhaotsh@google.com>
 <87ilnuda33.fsf@pond.sub.org> <YuGMFRDj3tLOIJK7@redhat.com>
 <CAFEAcA-_TkDW4tPxvmwEt-Rr6VAr_7aWNX2++CE+1G5cBPtiBg@mail.gmail.com>
 <YuKPVi9UjmZVqw5a@redhat.com> <878rodxpeq.fsf@pond.sub.org>
In-Reply-To: <878rodxpeq.fsf@pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jul 2022 15:58:51 +0100
Message-ID: <CAFEAcA_=PPJO5K8r5QFKJRhX4j9jwPPSceAUPjhK0z_bmLdyrA@mail.gmail.com>
Subject: Re: [PATCH v5 5/8] blockdev: Add a new IF type IF_OTHER
To: Markus Armbruster <armbru@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>, Hao Wu <wuhaotsh@google.com>,
 richard.henderson@linaro.org, 
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, venture@google.com, 
 Avi.Fishman@nuvoton.com, kfting@nuvoton.com, hskinnemoen@google.com, 
 f4bug@amsat.org, bin.meng@windriver.com, qemu-block@nongnu.org, 
 thuth@redhat.com, Hanna Reitz <hreitz@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb29.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 74aG3DL/wZiD

On Thu, 28 Jul 2022 at 15:50, Markus Armbruster <armbru@redhat.com> wrote:
> Kevin Wolf <kwolf@redhat.com> writes:
> >
> > But if you have more than one device, it becomes hard to predict which
> > device gets which backend - it depends on the initialisation order in
> > the code then,
>
> Really?  Board code should use IF_OTHER devices just like it uses the
> other interface types, namely connecting each frontend device to a
> backend device with a well-known and fixed interface type and index (or
> bus and unit instead, where appropriate).

I think part of the problem is that unlike the typical disk
interface, where there is some idea of bus-and-unit-number or
index number that it makes sense to expose to users, these
"miscellaneous storage" devices don't have any particular index
concept -- in the real hardware there are just a random set of
devices that are connected in various places. So you're requiring
users to look up the documentation for "index 0 is this eeprom,
index 1 is that other eeprom, index 2 is ...".

thanks
-- PMM
