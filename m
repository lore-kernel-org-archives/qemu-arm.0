Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp3923081ejb;
        Sun, 12 Feb 2023 14:21:39 -0800 (PST)
X-Google-Smtp-Source: AK7set/4OKaDsYRegayT2rIfRLdUcqJmKHZrrJVcUYA0hKkhNIypFqZOXW4AqyKMeD0tJoAQV4Rc
X-Received: by 2002:a05:6214:ca3:b0:549:b4e7:a0d7 with SMTP id s3-20020a0562140ca300b00549b4e7a0d7mr43708791qvs.38.1676240499589;
        Sun, 12 Feb 2023 14:21:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676240499; cv=none;
        d=google.com; s=arc-20160816;
        b=hfMmVy9Yzhbv1Qi9kk73MoO5BCoDXLfQyen9PftQgfpNn+jfOHmieUUKCJeDFC3wsU
         iAD5PCfHGZoLb6sPXZKFY3jUOL6C7zCHPp9F3Rvcpol5+Kyy4HegsLcUekbOLdAq2jl4
         CxnaX3FG+2qmnlYULeHeoXZ+qTWEB7h3a7VcizRCH2QvICoemCF6BlcCsOHsbqOSMHk6
         SOTZwnlhdtyfurIiwkcllIHlvOlgCL1gbn7I2SdjtAZhFw7/cdqipZay7fp4gkEOvP//
         ftzoX4SYwFCP2XgSCRcsSDidaGHZ/p/NyO3V0JHyxOaq+T8uo3mf1E8nN4csBAvo6dLa
         dSVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=Pj98quVBD2bu+HlsBKQzkhqXzI113dwkiTVSoFytyq4=;
        b=ugIaXNyWGNXLzPvBUuyL31ROxsRQdSwbhXu0sB+G9GwLQomnj1KlW2BrAxfVqxSPNS
         gz7ZHRGSjTYR7MifrO7Y/g3Y/q11+nwinhhuhY+dpAXxOvl9TtNLW6kCQqWHepyXhRrl
         e0BXM40MTWIZeLsbMrBaBQTIax1OQ9YsdtP2bjEg3EdtVm7eLM2KrknmRkGzJThj/cFB
         bMyV3/Du9d9B/Bmf91NJ3dJJEMLyLrW6/8fa6hCYsNyGo3XWDdrdK/2NOPBzvUN/MV6g
         mtOWx7swhol2/yG7GYUioPueR8+xBUgMIswz1Ya3/z8Zn3gYZciRSg09JJJHBCYMoPOT
         FEYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=raNqmDp4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id az30-20020a05620a171e00b007204e6cc0eesi8297136qkb.90.2023.02.12.14.21.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 12 Feb 2023 14:21:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=raNqmDp4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pRKid-000691-Aj; Sun, 12 Feb 2023 17:21:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1pRKib-00068m-Sr
 for qemu-arm@nongnu.org; Sun, 12 Feb 2023 17:21:09 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1pRKiW-0008Ad-KY
 for qemu-arm@nongnu.org; Sun, 12 Feb 2023 17:21:09 -0500
Received: by mail-wm1-x32c.google.com with SMTP id o36so7528448wms.1
 for <qemu-arm@nongnu.org>; Sun, 12 Feb 2023 14:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Pj98quVBD2bu+HlsBKQzkhqXzI113dwkiTVSoFytyq4=;
 b=raNqmDp4QJG+xMKT5jXZ8RkHs9iEy7KPKQWOXB02I4dgjxrlWvObTczAeH/+rNssny
 fMiN66nECr1RtnqI8muFPZSdRdSuhHtLVcUpF2Xv04MT9srQzC8XMtkTzOHcQZnSqsVr
 NJoDvZFR9He5LsjyF62XqYWUH76ez9I87NLZSTEB22/GdnzeONDnnjPmfy4SQjXJ4JU8
 iOfvNBoPbo3uHB4qfBw7r1cgkNib4LTy9KzGgSFAZk0dbv4LhgFC92L+2Qje2SSRKu5p
 rWwp9r6jtD/VtOPaood6ZlaHtxL7aOuQdYhHXvH3s6LYc7CrHelM0mrlpZmzUAC2if4G
 LbfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Pj98quVBD2bu+HlsBKQzkhqXzI113dwkiTVSoFytyq4=;
 b=YUFd78Q2KFtKoFA6fDT4z4kDq4GQzCFaxeYb9sogxndK1fpDU9BTwLQ1FoBRP8K2pB
 SZ5iHGuzRqP74950BJCzlZEJ8pVYxCGOKVpfF2DveNWkjsVcP6Jmr6MkQaQIUTVJYrlk
 2/DhceJK3xwNPCvYgMkWqWwTrnmnqh/asuiD6e0Rj5lJ150IUgxfcG73HaoRwvUqyJhn
 n8Xuei6LJtBkjSm0i3IwObISrJP/kbNpTJKvPKC02v5zZXpmobY5fKNtDlnkv+4ul/ly
 e945OfjaaNzuvkNoBnIG5KGAM6hopBqFJXD31fSJ/zgDn/MdcoRxh0eV+OmPzfNZRE7D
 mHmA==
X-Gm-Message-State: AO0yUKUB6wU5wKCic3qBwBtDe5tO9EvpMeiYiu4G1GbRDRWWVX/FuO30
 HQXyBdT+fvUWtx3JOmQMfdQOQQ==
X-Received: by 2002:a05:600c:1da9:b0:3df:f3ce:be46 with SMTP id
 p41-20020a05600c1da900b003dff3cebe46mr376535wms.5.1676240463160; 
 Sun, 12 Feb 2023 14:21:03 -0800 (PST)
Received: from google.com (44.232.78.34.bc.googleusercontent.com.
 [34.78.232.44]) by smtp.gmail.com with ESMTPSA id
 c63-20020a1c3542000000b003df14531724sm15838567wma.21.2023.02.12.14.21.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Feb 2023 14:21:02 -0800 (PST)
Date: Sun, 12 Feb 2023 22:20:57 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, jean-philippe@linaro.org, eric.auger@redhat.com,
 peter.maydell@linaro.org, qemu-arm@nongnu.org
Subject: Re: [PATCH v4] hw/arm/smmuv3: Add GBPA register
Message-ID: <Y+lmSTN/mTow+JGe@google.com>
References: <20230210221951.1298668-1-smostafa@google.com>
 <9619db1f-5595-b95b-7643-ae345759a59c@linaro.org>
 <Y+joYrG4aKC5cje5@google.com>
 <e920aa91-c153-0898-d2d3-da141233d60d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e920aa91-c153-0898-d2d3-da141233d60d@linaro.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=smostafa@google.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: j3tFwBiDYJAq

On Sun, Feb 12, 2023 at 05:18:33AM -1000, Richard Henderson wrote:
> > Please correct me if I am wrong. From what I see, the initial for value
> > GBPA will be set from smmu_reset_hold which is called from context of
> > qemu_system_reset from qemu_init context.
> > And migration will start after that in migration_incoming_process from
> > qemu_main_loop context.
> > 
> > I validated that also by printing the value of GBPA from vmstate_smmuv3
> > pre_load at migration without GPBA, and it is the same as
> > SMMU_GBPA_RESET_VAL.
> 
> Is that from -loadvm on the command-line, or the loadvm command from the
> monitor?  It's the latter that I suspect requires the pre_load.

I was testing before with migration
-From qemu monitor with migrate command
-Load it from cmdline with -incoming

I tested now with savevm/loadvm from qemu monitor
On vmload command, load_snapshot is called which in the following
order calls:
- qemu_system_reset which calls smmu_reset_hold initializing the SMMU
registers.
- qemu_loadvm_state which loads the saved state.

So From what I see, pre_load won’t be needed in this case also.

Thanks,
Mostafa





