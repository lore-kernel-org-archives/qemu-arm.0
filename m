Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp20906lfq;
        Tue, 15 Sep 2020 17:46:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJznDHehNAR2y9qcnV9sJOlPDzr0mtMemgvDZc2u5EC8JKzxcUUtp94P7qnLi1HPKVzZAV2p
X-Received: by 2002:a25:44b:: with SMTP id 72mr32643616ybe.270.1600217215572;
        Tue, 15 Sep 2020 17:46:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600217215; cv=none;
        d=google.com; s=arc-20160816;
        b=OqZap+1cjd9ISlc7MzbjDdQgKbnLR3Zax1AfCoNDAkbR46eGxs0nNq7W53kV5Aka8Z
         kMRGYDW4buofBN1q8t2b1C47VJ/TdcdfEi1yuGLLpnH4v8RWUyk0vBX1Q+yE64NXZYEn
         V5VsG9eslvgZNQ8t21oZ3kNfsmtBxS05akh+3v0CH6yJyPzLbI5sH3OQ/qb6ZDfagsDN
         W/abUPYcUqXN/rSCKRCGO2cCcj5ub1MPlhkh8bFnAIQdUByW0DE6867NpyEiOFDtL09R
         M/pe+k2y2tbtUX4kvOsttBX6YPPY++TrxcMSdLhzEFYuh8wt8BVDOnZiRjhSffTY4DsD
         04jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=yNC3S/khtq12tJRSCbvlPPiZVwJzXQmUa6AFIClVkY4=;
        b=tUwfNoXb+Qoamxwja6yn73Sl2RoEgZrNSMunvCuUm3l7nzxMrW3UzqOKrGdQ08dAsO
         Lt317peMUkjHnYwcX79PBldNKA+IpzYN3YyC4eydXHLdKe2npPt8pTrkpj52jmRuKcBl
         E547Bd+HFsHuOGzNSyQNWp36GTCWuOZTnSan5LGz7yTxMeXEgwm68/cBopekQPu1nfac
         JOC0GvNtXKwIMqaGtmO7crW3utNyBrF1jjsEiTKPQ5GNC17ECmO0F/4PJE8ws7ZVkFS8
         1mvrJnjmWyLKA3iSRpCzgAcRSjYRDpXzI6+0cahRBillpWSf03jlX5Xs83CYVxTsc//S
         YIeA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=t9a8vZ7R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n203si5298038ybc.67.2020.09.15.17.46.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Sep 2020 17:46:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=t9a8vZ7R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kILb4-0006Do-TI
	for alex.bennee@linaro.org; Tue, 15 Sep 2020 20:46:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kILav-0006C4-2A
 for qemu-arm@nongnu.org; Tue, 15 Sep 2020 20:46:45 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:42738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kILas-0001Us-5f
 for qemu-arm@nongnu.org; Tue, 15 Sep 2020 20:46:44 -0400
Received: by mail-pg1-x52e.google.com with SMTP id k14so2900146pgi.9
 for <qemu-arm@nongnu.org>; Tue, 15 Sep 2020 17:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yNC3S/khtq12tJRSCbvlPPiZVwJzXQmUa6AFIClVkY4=;
 b=t9a8vZ7RVzwtQjEt1J3AvjbyTZKrIuOQeg0s7nSJZG9F1LWO3SLgm5PwDxJ3DAE9i3
 q7n9XBArD+tloYxXm+vYjQabmP6m1qeGXccS62ucuNFVnGZEDc1OxQoPzFZu4rScBFUc
 /96SgSqFvhTiQatY8Ks4SLZUJKaa5MBkNP8XtU1chc8hU/2h45rJhlB3eWPR3LpDujKA
 sSQMyx48zVXVznCYLCHQsRScFLuQ9NSIPL2ShMg/gHTtD2YGrn/w0yp5DY5yO4U8UGmy
 Ml0cuUD96dTFzuqWfJ6VbzN+TxH+fLYtpCZeUqzdeQCgEXWjFoGSGyAUE+/97vEEzefm
 oP4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yNC3S/khtq12tJRSCbvlPPiZVwJzXQmUa6AFIClVkY4=;
 b=H/aCyE3U7u8rNbsfmDJmqhTz8HCU9u/nHan15w96V31hAWEAdbDicuvsFzObaeB6UM
 OvABXvWTuVJWv+/4yzFwAmYYjKcMYdBHMT4SgivPJCqVHmm2s13XNsTLYr6k6qGvVF1B
 h5GmLLDFM0MmzY7+1GmD0o6WWyzEnFlejeR7eqm4CK2/irETC5b67YQyNXvRkR0o2vNW
 Sn59rzZVWQc2o92IWomfciY9w6ADMYld5V7I8CKGEN6j41XSqOmiZK8OYb35JhmnGUUM
 rd46FwU5TaWBxQTqEa0LTOjdrmwxcRkpPOJ2BUwR9KgFH+Nn0kDACgKmWlmZ+29E5sN7
 9Z9w==
X-Gm-Message-State: AOAM531i9SMSu6hEK5reAsZVvJpNUg4QegGN/9Mx0ry8+O0Bdtj9khfZ
 lYrSrKyrizasBcIPj+0h8sr8eA==
X-Received: by 2002:a62:7c82:0:b029:13c:1611:6525 with SMTP id
 x124-20020a627c820000b029013c16116525mr20664512pfc.5.1600217200425; 
 Tue, 15 Sep 2020 17:46:40 -0700 (PDT)
Received: from localhost.localdomain ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id kf10sm611723pjb.2.2020.09.15.17.46.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 17:46:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/6] qom: Allow object to be aligned
Date: Tue, 15 Sep 2020 17:46:32 -0700
Message-Id: <20200916004638.2444147-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>, qemu-ppc@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: V8GoELH5rFrf

I've seen some failures on arm and s390x hosts after
enabling host vector support.  It turns out that the
malloc for these hosts does not provide 16-byte alignment.

We already have a function that can alloc with alignment,
but we need to pass this down from the structure.  We also
don't want to use this function unconditionally, because
the windows version does page allocation, which would be
overkill for the vast majority of the objects allocated.

Changes in v2:
  * Add _aligned_malloc patch for win32.  For what it's
    worth, this passes a gitlab cross-compile test.

  * Add and use qemu_max_align_t for choosing between
    g_malloc and qemu_memalign.

    I had been discussing extra checks for i386-linux with
    Eduardo, but then it occured to me that both linux libc
    posix_memalign is smart enough to not imply extra overhead.
    So qemu_memalign with alignment <= malloc alignment is
    handled easily by the system.


r~


Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Daniel P. Berrangé" <berrange@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: David Gibson <david@gibson.dropbear.id.au>
Cc: Alistair Francis <Alistair.Francis@wdc.com>
Cc: David Hildenbrand <david@redhat.com>
Cc: Cornelia Huck <cohuck@redhat.com>
Cc: qemu-arm@nongnu.org
Cc: qemu-ppc@nongnu.org
Cc: qemu-riscv@nongnu.org
Cc: qemu-s390x@nongnu.org


Richard Henderson (6):
  util/oslib-win32: Use _aligned_malloc for qemu_try_memalign
  qom: Allow objects to be allocated with increased alignment
  target/arm: Set instance_align on CPUARM TypeInfo
  target/ppc: Set instance_align on PowerPCCPU TypeInfo
  target/riscv: Set instance_align on RISCVCPU TypeInfo
  target/s390x: Set instance_align on S390CPU TypeInfo

 include/qom/object.h            |  5 +++++
 qom/object.c                    | 36 ++++++++++++++++++++++++++++++---
 target/arm/cpu.c                |  2 ++
 target/riscv/cpu.c              |  1 +
 target/s390x/cpu.c              |  1 +
 util/oslib-win32.c              | 10 +++------
 target/ppc/translate_init.c.inc |  1 +
 7 files changed, 46 insertions(+), 10 deletions(-)

-- 
2.25.1

