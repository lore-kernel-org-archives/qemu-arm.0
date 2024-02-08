Received: by 2002:a17:906:c945:b0:a38:6d10:c5dd with SMTP id fw5csp149611ejb;
        Thu, 8 Feb 2024 06:43:36 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVWGMDupPKVsRO5tsxudTaVrxKacyr1RUao3t1EHngsMTO51/rlDM2jnv1m3ZpcMQUlXlUNsKVfYwOeDwUD+lUTlbSQPEI2
X-Google-Smtp-Source: AGHT+IGcr/YCzZ920U3prtK6pPMi7achYfAtwUXlHZjwzK/SPYQvgYqEbhDfCTH4Jz7up8wQHojr
X-Received: by 2002:adf:f350:0:b0:33a:eb35:6317 with SMTP id e16-20020adff350000000b0033aeb356317mr5388679wrp.43.1707403416108;
        Thu, 08 Feb 2024 06:43:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707403416; cv=none;
        d=google.com; s=arc-20160816;
        b=Xj05iNuWcOVJBO35f9UhlUZaBR5yLnSMG7GNSdJXY3SGO1frfhhkDVfp/ioBbomfks
         ewrvRJpXctfafAvvPcL/MMhZ7kXlG9jCTmjmA2j9UG0Uq7pRA+/nlsNYxcGyeMt9AyNk
         xXpvsBaloN1sLRuk9hh1ySWW/4UllC9LU/vyKsKM+1wn/Z1gvlULfAKCj3rq2mmwGcvh
         E2V1gjWeFECyCsWNVNPaZyOGC+t6SftACoBHmSgCVj1k6n4+FTOD0pQaqWnXPEvRDhxW
         oP1nRiM+0Pj+ePjb/rSttBlGdNOXT0891Ka3xabFbwC5OZuoEcVyoVJbUOSHN5TnooLI
         QQ9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=DDEzf0VLlSmb+7qiyrgB4qv8T95Iv7kpgIkLoN8gBwQ=;
        fh=YXlt18RgwavtBuzGD66GFevyJFBU9S2w2TjJJE6TkHo=;
        b=nP+f8U8ecT2LjkxK/TffX64UnxZyoyl/pOxh1SAjwj7IAXNtyAaaZW0NaVBGkygNH0
         y4NTHtZ10qHn57W8rnW9igp1Mc7tPQ+YU9OWFDyqlJtqA+jAGFs5KdrLeHoqbnca/Lm3
         WTjvmBT3FoS39CFcGUrG85Zl80aPbqguyi5U48RDJrkSuFThXUHMC1wBaZWlfmqUnFyQ
         Pq1OgDltYS2I6cNc+ocUterVl1ZBC4MXWGKcwSZL3Y/kFw7gRGggKgIyw7WCq2uP/6Tq
         l9TjJBYpJFWEf/OPE2sp6zfczuYXU73I9ZDL4QyLsXD72kyBJ2pSG4L4lxyyLWqREWYi
         YcUw==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="t7wQ+F/g";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=1; AJvYcCXGJBmnAnP2OZzAZ9XerHtvPQT2o+hlevD/xKyQOHtG26w17ftHEkGbfPX8bT0jnUwYbG4KNcB79l3WvgQk8mz8CXEQmdjr
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dd21-20020a0560001e9500b0033b21d0ff63si1906536wrb.537.2024.02.08.06.43.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Feb 2024 06:43:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="t7wQ+F/g";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rY5cX-0007iz-Nc; Thu, 08 Feb 2024 09:43:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rY5cU-0007i6-5M
 for qemu-arm@nongnu.org; Thu, 08 Feb 2024 09:43:19 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rY5cS-0001sD-Id
 for qemu-arm@nongnu.org; Thu, 08 Feb 2024 09:43:17 -0500
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5605c7b0ca2so2113415a12.3
 for <qemu-arm@nongnu.org>; Thu, 08 Feb 2024 06:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707403394; x=1708008194; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DDEzf0VLlSmb+7qiyrgB4qv8T95Iv7kpgIkLoN8gBwQ=;
 b=t7wQ+F/g0Kt6OCXClzfEktvNGfrhYSJn/9bSb/Z8cEynQVcFAPUXii4cQ1ZLQ1bWD3
 YuqccDz+5vQ2Btj9HK2EJQjpTcjB3LaJLkurao9BZorb/uAuRIr+WwVhwzs8dyFjfyyq
 MQPcUC7agwDlZfHvlopvR0Iot6OWW1COsBGXNmpWWqrTkLLjGqenXXEDzEjC88EyCw8l
 2Vz3HKfIwS7jXt5n1qaGYLDE8Yzm3lj++0hxSn6hQnpC5lFOPkaKtFnCbzJtbXoEwrTD
 LeORXGeVVD2OQnfm+U63OENTeGz94PmqNKIn5xMeU/iiZwu4B0VZGK1NTLJRDwocrF99
 WMRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707403394; x=1708008194;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DDEzf0VLlSmb+7qiyrgB4qv8T95Iv7kpgIkLoN8gBwQ=;
 b=Ih8CbCW+G1he22QvMmHwgQmuPlmH3gmoaVmpvkye2hw+jpG2EmGiN7E1CzU9yB20Aw
 JWxkkU16egYtZXMGSnr+c6NhkAXfOk3tVjLeq3lC3P993atBpSAWdKKKI2xat8DwGPjc
 1drsHlAZmGIeA06mVTdAXQMdVgzidtRD2R/l5jdirzGKFfLEVV0TTN7XNoMBSGFDLgGQ
 TS00oWJ+SbCMjn/tbbbLrRUrxNwhy4cWyk9NGMY+BwYsmSPZfuEDvmOh3KevPPbuPuJ5
 f8MDZ93SFFhrNQFvDLe73N0crCWQTDBnup3NNKEpB0dzTC8osmVF8VLCYBrVTBPenwDx
 DrEw==
X-Gm-Message-State: AOJu0YyVM6aL4EchE5taD32jEOC9vfLA4PQnd0uanG8Bj1BUDQ4cSrTW
 lvQ9+S3O1epKjadfFV3pDGR+Ywsj95KA5WJwGRP/TpnMHBJFpQOnr+cSPLEkWrAjE5fF3UOHd8L
 qFoztqGZ8/2l9MSylMWu/fw4w8jMkcO6DChP5+Q==
X-Received: by 2002:aa7:de04:0:b0:55e:f9c4:3525 with SMTP id
 h4-20020aa7de04000000b0055ef9c43525mr6686403edv.30.1707403394624; Thu, 08 Feb
 2024 06:43:14 -0800 (PST)
MIME-Version: 1.0
References: <20240206232337.1043760-1-nabihestefan@google.com>
In-Reply-To: <20240206232337.1043760-1-nabihestefan@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Feb 2024 14:43:03 +0000
Message-ID: <CAFEAcA_mpxnXWX=9mYTUPnrqPrwK+VWgJxb4p07Q9y-xuZY5ng@mail.gmail.com>
Subject: Re: [PATCH 0/1] Sending small fix for NPCM GMAC test to properly test
 on Nuvoton 7xx
To: Nabih Estefan <nabihestefan@google.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 wuhaotsh@google.com, jasowang@redhat.com, avi.fishman@nuvoton.com, 
 kwliu@nuvoton.com, tomer.maimon@nuvoton.com, Hila.Miranda-Kuzi@nuvoton.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: OiHpXSNEXAva

On Tue, 6 Feb 2024 at 23:23, Nabih Estefan <nabihestefan@google.com> wrote:
>
>
> Nabih Estefan (1):
>   tests/qtest: Fixing GMAC test to run in 7xx

This fails "make check". Perhaps you forgot to configure QEMU with
the arm-softmmu target enabled when doing your build and test?


=================================== 34/357 ===================================
test:         qemu:qtest+qtest-arm / qtest-arm/npcm_gmac-test
start time:   14:32:48
duration:     0.34s
result:       killed by signal 6 SIGABRT
command:      MALLOC_PERTURB_=46 QTEST_QEMU_BINARY=./qemu-system-arm
PYTHON=/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/pyvenv/bin/python3
QTEST_QEMU_IMG=./qemu-img
QTEST_QEMU_STORAGE_DAEMON_BINARY=./storage-daemon/qemu-storage-daemon
G_TEST_DBUS_DAEMON=/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/tests/dbus-vmstate-daemon.sh
/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/tests/qtest/npcm_gmac-test
--tap -k
----------------------------------- stdout -----------------------------------
# random seed: R02S12ecd459925511b522511dd789dfb6d8
1..2
# Start of arm tests
# Start of npcm7xx_gmac tests
# Start of gmac[0] tests
# starting QEMU: exec ./qemu-system-arm -qtest
unix:/tmp/qtest-797739.sock -qtest-log /dev/null -chardev
socket,path=/tmp/qtest-797739.qmp,id=char0 -mon
chardev=char0,mode=control -display none -audio none -machine
npcm750-evb -accel qtest
Bail out! ERROR:../../tests/qtest/npcm_gmac-test.c:254:test_init:
assertion failed (pcs_read(qts, mod, (NPCM_PCS_SR_CTL_ID1)) ==
(0x699e)): (0x00000000 == 0x0000699e)
----------------------------------- stderr -----------------------------------
**
ERROR:../../tests/qtest/npcm_gmac-test.c:254:test_init: assertion
failed (pcs_read(qts, mod, (NPCM_PCS_SR_CTL_ID1)) == (0x699e)):
(0x00000000 == 0x0000699e)

(test program exited with status code -6)
==============================================================================

-- PMM
