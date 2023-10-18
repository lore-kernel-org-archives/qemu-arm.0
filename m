Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp4503755ejc;
        Wed, 18 Oct 2023 02:16:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7Ujh00y97xtSElSsBxeGOqTdTC6MnS/kBC2yjVlu8/GiZse259FZaFa2XnAUlPX+iFdik
X-Received: by 2002:a05:620a:4555:b0:776:5135:d98c with SMTP id u21-20020a05620a455500b007765135d98cmr5926112qkp.15.1697620603144;
        Wed, 18 Oct 2023 02:16:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697620603; cv=none;
        d=google.com; s=arc-20160816;
        b=zK0rGeKwe+VbGnqpRryJW3RvdCHS7KV/bf2Ua51Z72jhAFaEkLnR+a6cSRPAx25B7r
         NpTXCDn39DuTkZ9dflj307TJhrJC+UtgdveH2b2vdD0zYmTxqSZFQ39K3PAA2CnCoGNi
         ies/bG8v0cgmkiuvUtlZRm5gYC6H1Va1Y/0J7om7oRxjayKSehx3gAlava3zObOPre4l
         o8rqCXDT4Y2bhFYdPPwWpqTIQKVczaMkHxoIvxPe6qtpkL08mrBcuFEOo9NqHfxp1h/D
         UkDsuFFU401uoTUAXhRqs/hYOZVGKznPiLE3VUN0S/n/M1Yh38PBK59EJU0pou4JXQDl
         +gNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=XaUzPEIWjN9McRUvu8oKXiUVW7MxHrr8bcLsZXc0z+k=;
        fh=Pfhq8wFxCkpFzniIvj4dX8EJ6qNAeD3ht3csU6tASyU=;
        b=fwwKdIq5H0fz+2uVJktahkyVRHVcdzPDQUXiVC5R5UXppHOEIK8zo+yc9UXBhXhpla
         m19YNcw48vSSYqLO49+uL2/1xYQ7d5tMZaqlmSWTZLQEEAeLpffOnj5iek6uXKAJInFS
         19TcrVMMeKOwAwvutS/7Y38y5FBqmNr1RwLguHnZDEXmyoM693K/kyvLFyIb5s+TIP7/
         lsP8UibEZTicQbbI+IT4MO95K7RBcK0osHCKyI0Pc24acOt1aWhRzsdicEDZfnTpE/7l
         VuDSU6bVLak60OFkA2gUaXQCR9gGp7UU9OG/KppQICQ5S5LfwCSVdGiMVnpr84d5aZeV
         k3WA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q02vmj2h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c6-20020a05620a268600b00773c2679f12si2352376qkp.754.2023.10.18.02.16.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Oct 2023 02:16:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q02vmj2h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qt2fL-0003R9-7I; Wed, 18 Oct 2023 05:16:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1qt2fC-0003Qj-8R
 for qemu-arm@nongnu.org; Wed, 18 Oct 2023 05:16:27 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1qt2fA-00062F-2m
 for qemu-arm@nongnu.org; Wed, 18 Oct 2023 05:16:25 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4079ed65582so12553485e9.1
 for <qemu-arm@nongnu.org>; Wed, 18 Oct 2023 02:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697620580; x=1698225380; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=XaUzPEIWjN9McRUvu8oKXiUVW7MxHrr8bcLsZXc0z+k=;
 b=Q02vmj2hR5oinjrqeScRO5bbyxmVcyjK4SGKWXl61TlGzG7ZgtcEFuYpug4LFjh5xb
 k3LjNLWPLdQcBPqThA/ISjUKxewDYqEPv+gBdjhVuwKaMuHDLlxQo1Kj7znt07Fe/9SV
 mkA8ppd9sv9yWKzaqVYZueFFvbrvk1rL8BUgHixB/gB7fABEF7/HKVLswxyzPDc17XsI
 CpSHMMw3vZbMvNkbjtLcULU0iKVcByToxDRAx/60fsccOHDIwrnFmCFI6G4k8nc6hFL2
 Y4tVPx4KJ9i5aIazmUUtjrtMLskLI3CCppo8z1QXb2raXMNHWaHXmz/gAT05i4XjoIyq
 ygLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697620580; x=1698225380;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XaUzPEIWjN9McRUvu8oKXiUVW7MxHrr8bcLsZXc0z+k=;
 b=K4dmBaoRBwNguoPHsiczaIFURMhXdg9MhoXDrgya+ayfNXK/rugMiuEtCYZftjY4Id
 RbKIdo8H83A1lgVl4LwrtyuZRF22XHaRLYnIwuoP5lse4Ds1kc93UOYz66Dh3d1AuBTx
 luuJRzJ100/p6qVR21odMwqs01SkqmohQUQJJEFbBpIKS0qBDSm9/8OPlMvEY0CD2BTj
 l5OYSPlTZ5UTjPxWNvMZR2sKaj844Z7rj9IH3gHyBXTFbLbR7yxVWQ15Qr4WCdbe0BEH
 k8N0ka3XUsctmnU/xHniDwdo2as+FIvkmMQe8SqFADnbwSyZ5ByL/zrUR+IS74YVZeiH
 IWTw==
X-Gm-Message-State: AOJu0YxKqrh/EGdm339JyHAhVt/20aaCnVxVrQoEPI77mnlPj+nWQGD4
 OPsyy1WE9Wmmxvy8Dlv5eST8FA==
X-Received: by 2002:a05:6000:1212:b0:32d:8cd8:a2b6 with SMTP id
 e18-20020a056000121200b0032d8cd8a2b6mr3865989wrx.2.1697620579665; 
 Wed, 18 Oct 2023 02:16:19 -0700 (PDT)
Received: from myrica ([2a02:c7c:7290:b00:fd32:2b31:6755:400c])
 by smtp.gmail.com with ESMTPSA id
 p4-20020adfcc84000000b00327de0173f6sm1653997wrj.115.2023.10.18.02.16.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Oct 2023 02:16:19 -0700 (PDT)
Date: Wed, 18 Oct 2023 10:16:24 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Itaru Kitayama <itaru.kitayama@gmail.com>, qemu-arm@nongnu.org,
 Shashi Mallela <shashi.mallela@linaro.org>
Subject: Re: Quick start guide on RME emulation
Message-ID: <20231018091624.GA1153412@myrica>
References: <CANW9uyvsD8UWJ9yrrvgb4i7nEoDAXNaepk-zsJWuyw=tp_W9oA@mail.gmail.com>
 <20231002102231.GA3075015@myrica>
 <CANW9uyu85z9+-v8ait9EWcjWRu1+C8Xx3cM__8oBKof7fJwRwA@mail.gmail.com>
 <20231004105558.GA1454132@myrica>
 <CANLsYky87enj0bkSs_PaKE=rM7odowfXZ2bT6W0KJ1RFyZApwg@mail.gmail.com>
 <20231017135647.GB835650@myrica>
 <CANLsYkwwKRKW8qD__JvmpJteSgmzh0nEVVmR382oer+5v6ZuCQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANLsYkwwKRKW8qD__JvmpJteSgmzh0nEVVmR382oer+5v6ZuCQ@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x32c.google.com
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
X-TUID: jtJmqHEGTU4X

On Tue, Oct 17, 2023 at 04:39:08PM -0600, Mathieu Poirier wrote:
> On Tue, 17 Oct 2023 at 07:56, Jean-Philippe Brucker
> <jean-philippe@linaro.org> wrote:
> >
> > On Mon, Oct 16, 2023 at 03:30:30PM -0600, Mathieu Poirier wrote:
> > > > TF-RMM
> > > > ------
> > > >
> > > > The Realm Management Monitor (RMM) connects KVM and the Realm guest.
> > > >
> > > > RMM gets loaded into NS DRAM (because there isn't enough space in Secure
> > > > RAM). TF-A carves out 24MB of memory for the RMM, and tells other software
> > > > about it using a device-tree reserved memory node.
> > > >
> > > > Status: QEMU support is currently under review. Additional patches are
> > > >   needed until QEMU supports a couple additional features that are
> > > >   mandatory for RME (PMUv3p7 and ECV).
> > > >
> > > > Repo: currently at https://jpbrucker.net/git/rmm/ branch qemu-rme
> > > >       official is https://git.trustedfirmware.org/TF-RMM/tf-rmm.git/
> > > >
> > > > Build:  git submodule update --init --recursive
> > > >         export CROSS_COMPILE=aarch64-linux-gnu-
> > > >         cmake -DCMAKE_BUILD_TYPE=Debug -DRMM_CONFIG=qemu_virt_defcfg -DRMM_TOOLCHAIN=llvm -B build-qemu
> > > >         cmake --build build-qemu
> > > >
> > >
> > > The -DRMM_TOOLCHAIN part puzzled me since it was not in the RMM build
> > > instruction for the FVP model.  Is it mandatory and if so, what
> > > version of llvm are you using?  As with the FVP model, I used the
> > > following:
> > >
> > > CROSS_COMPILE=/home/mpoirier/work/cca/optee-cca/toolchains/aarch64-none-elf/bin/aarch64-none-elf-
> > > cmake -DRMM_CONFIG=qemu_virt_defcfg -DCMAKE_BUILD_TYPE=Debug
> > > -DLOG_LEVEL=40 -B build
> > > cmake --build build
> > >
> > > The "aarch64-none-elf" is exactly the same as the one in the FVP model.
> >
> > Both GCC and LLVM should work, but I had some trouble with GCC and haven't
> > had time to investigate yet, so I provided instructions for LLVM (v16)
> > which works for me. I'm probably using the wrong GCC toolchain, because
> > I'm currently getting these link errors:
> >
> > /usr/lib/gcc/aarch64-linux-gnu/13.2.0/../../../../aarch64-linux-gnu/bin/ld: warning: libc.so.6, needed by /usr/aarch64-linux-gnu/lib/libm.so.6, not found (try using -rpath or -rpath-link)
> > /usr/lib/gcc/aarch64-linux-gnu/13.2.0/../../../../aarch64-linux-gnu/bin/ld: /usr/aarch64-linux-gnu/lib/libm.so.6: undefined reference to `__strtold_nan@GLIBC_PRIVATE'
> > /usr/lib/gcc/aarch64-linux-gnu/13.2.0/../../../../aarch64-linux-gnu/bin/ld: /usr/aarch64-linux-gnu/lib/libm.so.6: undefined reference to `stderr@GLIBC_2.17'
> > /usr/lib/gcc/aarch64-linux-gnu/13.2.0/../../../../aarch64-linux-gnu/bin/ld: /usr/aarch64-linux-gnu/lib/libm.so.6: undefined reference to `qsort@GLIBC_2.17'
> > /usr/lib/gcc/aarch64-linux-gnu/13.2.0/../../../../aarch64-linux-gnu/bin/ld: /usr/aarch64-linux-gnu/lib/libm.so.6: undefined reference to `__strtof_nan@GLIBC_PRIVATE'
> > /usr/lib/gcc/aarch64-linux-gnu/13.2.0/../../../../aarch64-linux-gnu/bin/ld: /usr/aarch64-linux-gnu/lib/libm.so.6: undefined reference to `fwrite@GLIBC_2.17'
> > /usr/lib/gcc/aarch64-linux-gnu/13.2.0/../../../../aarch64-linux-gnu/bin/ld: /usr/aarch64-linux-gnu/lib/libm.so.6: undefined reference to `errno@GLIBC_PRIVATE'
> > /usr/lib/gcc/aarch64-linux-gnu/13.2.0/../../../../aarch64-linux-gnu/bin/ld: /usr/aarch64-linux-gnu/lib/libm.so.6: undefined reference to `fputs@GLIBC_2.17'
> > /usr/lib/gcc/aarch64-linux-gnu/13.2.0/../../../../aarch64-linux-gnu/bin/ld: /usr/aarch64-linux-gnu/lib/libm.so.6: undefined reference to `__strtod_nan@GLIBC_PRIVATE'
> > /usr/lib/gcc/aarch64-linux-gnu/13.2.0/../../../../aarch64-linux-gnu/bin/ld: /usr/aarch64-linux-gnu/lib/libm.so.6: undefined reference to `__assert_fail@GLIBC_2.17'
> >
> 
> I had the same errors, which is why I switched to aarch64-none-elf
> [1], the same as what is used for the FVP code base.  If you have
> time, try that on your side and let me know if things still work.

Nice, I can confirm that switching to aarch64-none-elf fixes the build
issue, and I can boot a realm guest with the RMM built that way. It feels
like some compiler/linker flag could enable building with
aarch64-linux-gnu as well, but I don't have time to look into this at the
moment.

Thanks,
Jean

