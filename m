Received: by 2002:a05:6512:b9e:0:0:0:0 with SMTP id b30csp4972173lfv;
        Wed, 3 Nov 2021 09:03:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzwAgLwEFo8sHxjTW8uAQCJLyG6ZRS9ifw8nXt9uIk9ha70vuWOW6EqK/HPyl/uR8qQTCSO
X-Received: by 2002:a9d:17cc:: with SMTP id j70mr25945058otj.70.1635955435011;
        Wed, 03 Nov 2021 09:03:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1635955435; cv=none;
        d=google.com; s=arc-20160816;
        b=k1HnqackqWZfo+eJ8urz/mTV6EYVyiZjoh9h3XshC/6c8hfRbakWbqO4waA8AllE2b
         ST3NEj+nPvwigan6ytt4YgB/kLB35N1UnLTZivinkigEA9i9z++baiv7POApYQ6pla1N
         f4y4f1Ua8V2AfsYrKKLCil8IJqaEyVdNpPLoX/TTPxdA0JjvJIirkE7Q2KmuwAjoJ1kv
         yZyRqh4ukhyb781pgrnJGnNbfNtBOKF1EqkdcqWcxOCbNIH02fZT8wv/B+8TLlXo5tib
         zTeYyfmY2EdTJjoUK1hr4ouoUzG8z8yEVGPMom9EkJ0V0E9sHnTj2geujYtwiG2uU11W
         5dSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=4iKiqyXdu7WV6bWbZ59pyGswiQOYecrNX5A+IGrhSAQ=;
        b=TGit52D95iO8AjcRFCcgJDwUY0Hc/g4+CP04MYMyXbXrAqTfrFT6XuFYZizN0sI0OG
         ZJhBEkQN5+VdDbWC7bl1ffNKmNxJR44755wEePg3JhkIztpLXQVM3e40e5blq3iMkxMD
         y0rvI9bKNuiVXqcbeHgDFLEWA7nR+tLoQFkFQJeqzT/B6cD+aM2K6GTolfCAZJb61xxl
         7pXzoIVtmo5UpyjuvQ6xuomJ1JrpmHbzozEVjKg6t3+ukjzKBL10/erNLBhKfRDLHD6W
         R5MP7eI3Xz3fa9VTjJ87OWhYiagmW/Eh9LRjWFkeXDDuxGIsFyYnV+RsmAvXckkH2sV1
         0wmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=Y2e4wPtq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s20si3731455otq.170.2021.11.03.09.03.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Nov 2021 09:03:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=Y2e4wPtq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:51322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1miIjy-0003rP-Bf
	for alex.bennee@linaro.org; Wed, 03 Nov 2021 12:03:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <coltonbweaver@gmail.com>)
 id 1miIhG-0006yM-3Y
 for qemu-arm@nongnu.org; Wed, 03 Nov 2021 12:01:08 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:44621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <coltonbweaver@gmail.com>)
 id 1miIhD-0005Ep-EI
 for qemu-arm@nongnu.org; Wed, 03 Nov 2021 12:01:04 -0400
Received: by mail-wr1-x431.google.com with SMTP id d13so4294368wrf.11
 for <qemu-arm@nongnu.org>; Wed, 03 Nov 2021 09:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=4iKiqyXdu7WV6bWbZ59pyGswiQOYecrNX5A+IGrhSAQ=;
 b=Y2e4wPtqTn5IanAZKY+7BuM42brpZ1+ifPja/12278X90PoRZW/T2TMJNWhK7hEa9r
 kVTfVeUP+Xut7SFSWdRdn4INVBhWPmvE15t5dyWLseKrSR7laV9LjKTWxQPFIDXOwKVQ
 cQeJtU02v86kENEFeKgb6+54y8FPwR6ptu/b/90Z/cwi1txiTyxGXlpCylgFclJmhQER
 aAkNewDfDaPkVD3TbDWWomwNycDOLlvPQ1O20klFg1rweMU2YI6648Zlx2cC43ktc0k4
 qGZ/HweEzpE1q6UNa5bMNsPHiTYTSO7BWyYjW7L1iU5ThwehoHebovMDwnsxKc8K8Pcw
 VZIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=4iKiqyXdu7WV6bWbZ59pyGswiQOYecrNX5A+IGrhSAQ=;
 b=foHCqYF9Q8t4OLjPH3DDJfCrrRgQPgE322ayqvNEZiRFruf8E9wYuVbuHLx+Eco6g7
 /8Jij+Qho+uXziD2D4AqEhty114L01t9Zpgciy/aVaSsRHRN2mUUhfSD/gXMe+73077z
 5mCx2tAHbXnlnQSFKMyfCY+/W3Zeo/yNaGWTGeCzTs0y6iejYVls3h4dIpuEWdnOaNps
 f9FJcT+A1P2zEKDpK700zEYU68VZmdDDieHYlYkXnzdinqBWPCHj4Vq6QvdeBhqr8BLA
 2CNoS4C6pH/vjiR9LCIviKWvZM8ugXzL3sd8l6iBxHb50YefV5+VGX6E48mNmkPI5GPm
 HTog==
X-Gm-Message-State: AOAM533IgqBXqnD4GnYM2lm6dHJzPmoTe2BKOTaEIaqwSjga6olm23Sl
 fPi5TvU8y0yRo0p+2fjFIdCUF2j0ISMN2nORiM1MzsWLmbs=
X-Received: by 2002:a5d:4d51:: with SMTP id a17mr27470615wru.384.1635955257741; 
 Wed, 03 Nov 2021 09:00:57 -0700 (PDT)
MIME-Version: 1.0
From: Colton Weaver <coltonbweaver@gmail.com>
Date: Wed, 3 Nov 2021 09:00:47 -0700
Message-ID: <CAJZtUfeUWkkTZo-nGPk94JEL-sv9c=FFJEquq3VUNEo9VvwqKA@mail.gmail.com>
Subject: Rust Compilation on M1 Mac emulating x86
To: qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=coltonbweaver@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 47qmfcLsZxj1

Hi all,

Apologies if this is a well-known issue in the community, I just
couldn't find much more than this github issue to docker:
https://github.com/rust-lang/rust/issues/80346

Of course, this is no longer using the Docker preview and they've
since claimed this to be a bug in QEMU. Does anyone know of any
workarounds to such an issue? For those that didn't open the link,
when compiling rust for x86 on x86 images in Docker (emulated on
QEMU), I get: "thread 'rustc' panicked at 'invalid terminator state'"
after a segfault.

-Colt
