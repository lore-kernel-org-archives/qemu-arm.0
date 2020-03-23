Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp1334225lfi;
        Mon, 23 Mar 2020 04:32:44 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsvJwsHf7K7BIzgxl7k9VW7BqHs+o7g5AexQXPDxjTFwExY+BLA2dj/yLq+xRO3H9qq+M5j
X-Received: by 2002:a37:4ec1:: with SMTP id c184mr19992457qkb.0.1584963164745;
        Mon, 23 Mar 2020 04:32:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584963164; cv=none;
        d=google.com; s=arc-20160816;
        b=WuDeYqMqvA4Jn2eeOdM+uyYLXfvmJsw/gukQytqrJgUcOMoImoelHoUMpjibEUvaq9
         oqhPnT2mJi0m+/AAOowwB7FiDFzKReEB1S009FN9DwfWxMGKdFwM8aQ2J6fJjP5QMvHb
         huxs6el+bjatEY90ZR+V8w/cB6fQFsHfS0iRz4itVTqSM2HR4yRg1REvgDP3sW8hza/b
         unaWpgrmUHc8vjmA1AoSgmbqiZBN/5PMhSEzyeguYR/mziG9LFpyUYUo7sdxqU4c0LDV
         /m658fYr9kyuBT1Q9dx3BY4zUflFhNm61BoiPpmyY4u9o/pmAQ0SrN5A3L9zjSY1xSKs
         EDuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:cc:message-id:date:subject:to:from
         :dkim-signature;
        bh=swDSyXC98geyy625No7UuEQ++llEobRrrqzTE+4S+c0=;
        b=kLX+/5l8ycuAbRx8gJSDd9IGM4FPKusyubeyqLAKMdtw+FEqkOVkjnPBoFOjE/V52L
         RWJw43VCO5UheIAqPminSWGnoramCHy9RdnZHMD16BiaJZ4bLT0f+sMVW92KIJpOWjM+
         eN2eu/C96duMdBtoMuppoGKSzkErQ/8CVZYSJ5Gojq1zL8/TxB1pwxwAuhDmAnp0Fvjl
         sMpfpDBgvPG/HKMltATCJZwArQne8YGHnmAOb5zCckH8noPs7xRfrVK8bmRN0cBQrrzN
         OaUxojHUQelRVOm1R+1MskdDQElTmEPm3fT5oxwM6xcQZGv/88D2N6Hh/SxMbhNV7/4c
         AqmA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@linaro.org header.s=google header.b=w8JoIfan;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id m47si8538632qtk.198.2020.03.23.04.32.44;
        Mon, 23 Mar 2020 04:32:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@linaro.org header.s=google header.b=w8JoIfan;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 5D1944B0B2;
	Mon, 23 Mar 2020 07:32:44 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: 0.909
X-Spam-Level: 
X-Spam-Status: No, score=0.909 required=6.1 tests=[BAYES_00=-1.9,
	DKIM_SIGNED=0.1, DNS_FROM_AHBL_RHSBL=2.699,
	RCVD_IN_DNSWL_NONE=-0.0001, T_DKIM_INVALID=0.01] autolearn=no
Authentication-Results: mm01.cs.columbia.edu (amavisd-new); dkim=softfail
	(fail, message has been altered) header.i=@linaro.org
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q55V4eiOvMSe; Mon, 23 Mar 2020 07:32:43 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 48F9D4A4CD;
	Mon, 23 Mar 2020 07:32:43 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id C44674A4CD
 for <kvmarm@lists.cs.columbia.edu>; Mon, 23 Mar 2020 07:32:41 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NVsYSyDA+wJ9 for <kvmarm@lists.cs.columbia.edu>;
 Mon, 23 Mar 2020 07:32:40 -0400 (EDT)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id B02F84A4C0
 for <kvmarm@lists.cs.columbia.edu>; Mon, 23 Mar 2020 07:32:40 -0400 (EDT)
Received: by mail-wm1-f67.google.com with SMTP id c187so14235622wme.1
 for <kvmarm@lists.cs.columbia.edu>; Mon, 23 Mar 2020 04:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=OFr1tIi8cNqRn/vqOmjCgvVbUW9BNVMVGSEGEidMUQo=;
 b=w8JoIfan95I4XznIjXQzVeNo8l6Xh0dvD7b1TIGqibhY+C7dgyZ/uXfIkOs0/tLca3
 mu5gXprM3b/6ukW0OSYSqSj2gDCyiKxXm4nAMftPVr0s4SNfld/kLo8Tt2Q7XnFf1JWc
 VSLpLWnfJjB/LpDlmkuCEmW9fxNDKJw2TwyD9jhaROX0AHoKXWd98KK0p3YVV/VOIFVO
 Xwi0Qi9/+noDPudjzi3zC1ALa+dYBodZl3uAsU6PxxIVp/Nz6O4Tr/4Y92ydDyzY6uZP
 a4QUMBMN9CD8+8HMKbQ8QSgg5FMODQV8g6/I4ALDRRRB+xkMfJfqOvG4mc+EVC5gUtfi
 0NYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=OFr1tIi8cNqRn/vqOmjCgvVbUW9BNVMVGSEGEidMUQo=;
 b=AOkg8Db3h5MQMgzuS1uvde4fdCRzy+uxL8QJlWEKzGkFU5wUnDQT2oPA4ve4K/m3as
 BowhkHf6ByyL36PR9hJyCB9FqoPn5VBK8ofPyNCJExfseqykFCwVAhaLxXSi3rGMGtsQ
 gIZ35IoFflTG6Ik+X4iTQAIgHOTXxmO+3ZS+qb45ikEb9Waziw9iMC4a7WigFGBC4MDi
 /nRLcH/m6UXSZPAfefxzoLG9DWxkQSozr5msBM4Z0C5YIa6hl4R1lcg94m5w0tuWNv1S
 9HJe7RYhRVPKbRQnzol1cHtkxbw+fepYa0vKgfoxPv8E8nOaAam5qH4zn6I3kK5Mwgyu
 wlqw==
X-Gm-Message-State: ANhLgQ3WpBhJlu6CfKhvEI8HdJbnbR/gdC0Ltbvq3bLHaXQRF+4QXe3k
 p4Gvk+fLvVId3GgautYjTHqSxA==
X-Received: by 2002:a1c:9904:: with SMTP id b4mr26621677wme.34.1584963159658; 
 Mon, 23 Mar 2020 04:32:39 -0700 (PDT)
Received: from moi-limbo-9350.home
 (host86-177-220-180.range86-177.btcentralplus.com. [86.177.220.180])
 by smtp.gmail.com with ESMTPSA id 98sm23288473wrk.52.2020.03.23.04.32.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 04:32:39 -0700 (PDT)
From: Beata Michalska <beata.michalska@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/2] target/arm: kvm: Support for KVM DABT with no valid ISS
Date: Mon, 23 Mar 2020 11:32:25 +0000
Message-Id: <20200323113227.3169-1-beata.michalska@linaro.org>
Cc: qemu-arm@nongnu.org, pbonzini@redhat.com, kvmarm@lists.cs.columbia.edu
X-BeenThere: kvmarm@lists.cs.columbia.edu
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: Where KVM/ARM decisions are made <kvmarm.lists.cs.columbia.edu>
List-Unsubscribe: <https://lists.cs.columbia.edu/mailman/options/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=unsubscribe>
List-Archive: <https://lists.cs.columbia.edu/pipermail/kvmarm>
List-Post: <mailto:kvmarm@lists.cs.columbia.edu>
List-Help: <mailto:kvmarm-request@lists.cs.columbia.edu?subject=help>
List-Subscribe: <https://lists.cs.columbia.edu/mailman/listinfo/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kvmarm-bounces@lists.cs.columbia.edu
Sender: kvmarm-bounces@lists.cs.columbia.edu
X-TUID: I7Lhxkl/wvNZ

Some of the ARMv7 & ARMv8 load/store instructions might trigger a data abort
exception with no valid ISS info to be decoded. The lack of decode info
makes it at least tricky to emulate the instruction which is one of the
(many) reasons why KVM will not even try to do so.

So far, if a guest made an attempt to access memory outside the memory slot,
KVM reported vague ENOSYS. As a result QEMU exited with no useful information
being provided or even a clue on what has just happened.

ARM KVM introduced support for notifying of an attempt to execute
an instruction that resulted in dabt with no valid ISS decoding info.
This still leaves QEMU to handle the case, but at least now it gives more
control and a start point for more meaningful handling of such cases.

This patchset relies on KVM to insert the external data abort into the guest.

v4:
 - Removing one of the patches as it is being picked-up separately
     target/arm: kvm: Inject events at the last stage of sync
 - Moving handling KVM issue to a separate patch
 - Minor changes wrt the review comments

v3:
 - Fix setting KVM cap per vm not per vcpu
 - Simplifying the handler to bare minimum with no default logging to address
   the potential risk of overflooding the host (adding support for rate
   limiting the logs turned out to be bit too invasive to justify the little
   add-on value from logs in this particular case)
 - Adding handling KVM bug (for small range of affected kernels):
   little bit of trade-off between what's reasonable and what's effective:
   aborting qemu when running on buggy host kernel

v2:
- Improving/re-phrasing messaging
- Dropping messing around with forced sync (@see [PATCH v2 1/2])
  and PC alignment

Beata Michalska (2):
  target/arm: kvm: Handle DABT with no valid ISS
  target/arm: kvm: Handle potential issue with dabt injection

 target/arm/cpu.h     |  3 ++
 target/arm/kvm.c     | 82 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 target/arm/kvm32.c   | 25 ++++++++++++++++
 target/arm/kvm64.c   | 34 ++++++++++++++++++++++
 target/arm/kvm_arm.h | 21 ++++++++++++++
 5 files changed, 165 insertions(+)

-- 
2.7.4

_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
