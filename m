Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1724903lfm;
        Thu, 25 Jun 2020 15:04:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwAfAIcJYs074bfqnRNJZx+U/LA7b6sNtdqNVh2+pAcgHdDCOqS1EBjVYlkEtA2rHmFdEfZ
X-Received: by 2002:ac8:4c88:: with SMTP id j8mr24050234qtv.57.1593122657595;
        Thu, 25 Jun 2020 15:04:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593122657; cv=none;
        d=google.com; s=arc-20160816;
        b=nOX6FamqgqEO7QtK64uH+dKcv7QasKd9uPaAMyT6+ZDlBE2V1cdbb6RGx/Sjp+fOds
         eeYFq+lNzaSqLD6g0dXTPGXgeSFhH9w7A20aS6Z72894t9vWXkQe+M4/gF6oBG5t+bAW
         daMa328JQdC9I0ts+DUl0mYOOCG8bhvK9KQ7//MWNVrggg6HXUjukbBiHdlY/bG1QOED
         zkfriLC+ebPtrJ9VLmH6ZFbQlCQ9C9pDr04sNTVKQd1MhS93kCnwN/l0n8BrkkinmB5i
         StKWYBIRCUzTw6ftSU34dYGl6fhvanuKLJIWE+wTS92B7uBj1zAW0G4e+WWgchaZ3Fbp
         rAsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:cc:message-id:date:subject:to:from
         :dkim-signature;
        bh=AVK2/+TtO31Wv9d041kiAAgnKTMcZ5pT8HV4KvCSFcI=;
        b=QT40ImcpUxps36lRHGSMmWsis9fPS7z6jBFmzmIlIJqNVJQs+cd3G93NsY8AzJBcbQ
         8bN2WCTmJX+XMA9ESMBjc/Qw4OExA0ulGKMDHy2qHNrqaIaNsrrVZp0xoOK/REtB4paz
         w1wF7/XnWm9SsmoS40VKXyg+wbJQ0yHSAE4vkdMSWAaYHW5gHkFRZoa45oJp3N+VHo60
         1cXf6J3Oi3TAfVVtRgp75QPh5y2ufWgXjouLbIJ5tr0GnQiQfwvS0hfGV15WyGA8EHiI
         ps7AXZ5ARMMXB7lk0waeOV8wD14/kvLf8j6uRydgmFUhit3UBHKoqG9n2RdA1f8/4w2s
         WcRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@linaro.org header.s=google header.b="Jfo/beSc";
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id ee17si13664496qvb.220.2020.06.25.15.04.16;
        Thu, 25 Jun 2020 15:04:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@linaro.org header.s=google header.b="Jfo/beSc";
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id D8AA94B1B4;
	Thu, 25 Jun 2020 18:04:16 -0400 (EDT)
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
	with ESMTP id 6sYD-+BnXQi4; Thu, 25 Jun 2020 18:04:15 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id CF7A54B1A2;
	Thu, 25 Jun 2020 18:04:15 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id DCA8C4B1A2
 for <kvmarm@lists.cs.columbia.edu>; Thu, 25 Jun 2020 18:04:13 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FKhXPclukjli for <kvmarm@lists.cs.columbia.edu>;
 Thu, 25 Jun 2020 18:04:12 -0400 (EDT)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id A6E1D4B141
 for <kvmarm@lists.cs.columbia.edu>; Thu, 25 Jun 2020 18:04:12 -0400 (EDT)
Received: by mail-wr1-f66.google.com with SMTP id b6so7431197wrs.11
 for <kvmarm@lists.cs.columbia.edu>; Thu, 25 Jun 2020 15:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=dhNRoBg5bwpJi8jqJOz5Pclx/wgnmMVQ4FYzgXqH1GI=;
 b=Jfo/beScBb8NqlCqTrzCtVVwcAgNebsFj272lm3s4ysDEL1egJNxtbzpSuyzodo8av
 ZlVnNZ/ASn2AYqRFq/5BEpyxX8WA1gsrFosUzgi2axcQGNKdMCuMDJxYvUXqhvbpXfNm
 keRJJo6cuI8bRnSAvWCtSOr9Vu7ZgQ+RCvQazVW/b6klF+hns/aN5oT18ZbkyQFNsH6K
 6AJp8W0UltKwzahDTzRZv64AMRumcopvNT46k7MkY+HQ7YK/oDy4cJj8slraNlNN8uyJ
 TdJebyu/t3Vvhw00vwvrD2Ud09pUnX1maE3Hp265bvPppOSgSNW3R5Ij+wRwE5njy+w3
 uO/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=dhNRoBg5bwpJi8jqJOz5Pclx/wgnmMVQ4FYzgXqH1GI=;
 b=WFJzfXAbtp69JLFIMjgPh+8LmgOSOUdpDkQeR/gjaUY4qD3JTbSMwN6qzPPwyFcsrI
 RemnAKTJznknJYTZXfJnUBV+kqle/jLAnpM2SXK560uhE4r5B/AM0LAMDl6F/yT41gr3
 LvNSjOM3y6NbZ0pT4Gyla20gM09v36BCPdl2caeoCrYfhsnJCFnfEHRVDYflLHiMhaZv
 TqVbwotEjiaddDug79gNDwPm4CUs6NRjFKJrpszr2uGzWMMqMqlDdCxXneHNv8shxriP
 MOjdwEtecI5zqorbUVRDccp2+L0hAGTNKE7YbpnAVWIRONkCawVhM1+KMr/ZFGSfWFJt
 ulOw==
X-Gm-Message-State: AOAM530Ii9Dpsb04+lgn2ab8aH3ro6TWJ4A5FERaYg8Di7I14BHAzUv2
 ctDPp99MPOsk8hhPl7EbB++uTA==
X-Received: by 2002:a5d:4a01:: with SMTP id m1mr348715wrq.250.1593122651573;
 Thu, 25 Jun 2020 15:04:11 -0700 (PDT)
Received: from moi-limbo-9350.home
 (host86-139-146-71.range86-139.btcentralplus.com. [86.139.146.71])
 by smtp.gmail.com with ESMTPSA id l190sm13939277wml.12.2020.06.25.15.04.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jun 2020 15:04:11 -0700 (PDT)
From: Beata Michalska <beata.michalska@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 0/2] target/arm: kvm: Support for KVM DABT with no valid ISS
Date: Thu, 25 Jun 2020 23:03:34 +0100
Message-Id: <20200625220336.10186-1-beata.michalska@linaro.org>
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
X-TUID: G5bY8zr+H74E

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


----------------------
v6:
 - replacing calling kvm_put_vcpu_events with an actual ioctl call
 - making the handler function static

v5:
 - Drop syncing vcpu regs in favour of calling kvm_put_vcpu_events directly
 - Fix decoding DFSC for LPAE case
 - Add/clarify comments
 - Switch to reporting error case failure when enabling the cap

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
  target/arm: kvm: Handle misconfigured dabt injection

 target/arm/cpu.h     |  2 ++
 target/arm/kvm.c     | 87 +++++++++++++++++++++++++++++++++++++++++++++++++++-
 target/arm/kvm32.c   | 34 ++++++++++++++++++++
 target/arm/kvm64.c   | 49 +++++++++++++++++++++++++++++
 target/arm/kvm_arm.h | 10 ++++++
 5 files changed, 181 insertions(+), 1 deletion(-)

-- 
2.7.4

_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
