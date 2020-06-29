Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2904040lfm;
        Mon, 29 Jun 2020 04:41:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwB+9qoQFj3uS5Hb7F6jkY+7KyaCXTUB58pn6L99TTMC91p/TV1CmZpFiCBzNSYCFLtLlyq
X-Received: by 2002:a37:a6ce:: with SMTP id p197mr14177945qke.211.1593430904623;
        Mon, 29 Jun 2020 04:41:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593430904; cv=none;
        d=google.com; s=arc-20160816;
        b=iNjXDFRgykfOtrUrcZ1AQEbhQ5i8IXk6eSTETPO8LUID3Sx4f7pghhCrsFbgO6mJVB
         z7DTzJNSG+VEYYrzt4fMDrD2X5cwv1PKzLGyfY//TBnWFfoM8bNZSmRzJIV7aZM4U7Tl
         angd/ylmPK38Yw6U7VLX1mW54Br6JC5CdScbiqYxPAIOyGFj1iutIQsbgJMy/NmRqCGO
         f2QiwX2oTcRztm/D7bvvGISSPcp8obY/i7Rt61taYgWvLswQToLPCTYbF6MLZibiBaWx
         DLd5LXqAHbCwtarTKzTkKRpFUCsmCrR7/KN2KDptyKkqKPCSVAtmAiQbmDoEr7YLwmPs
         4woQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:cc:message-id:date:subject:to:from
         :dkim-signature;
        bh=6ZqDLKsNuJl/bhfzMl+gH2T6m7cc3NeLI7iWJSxJfqY=;
        b=Fu61D1yPTfSF66bujp8vb3KO+OWfOPJWLIohWaNt9KNQQYzF2Vk/6M7oXmJNVf5DOp
         uS8pU+8Yk5rBqFu6b9M/zAvxwK/wtTkWClIOaM3mxAEgYxniZsYMIIpAOcm0WutD3ESf
         6ZhuaxnwarD7nk40v7uCRUzt0TMs3OnlYUzqEfjZyWB3T6h/Om9oEYwsHqfLo2GOCitV
         ni3VFvkmNh3XS4kvZFlVIgygqui6DeLbPowXpAjq6fuvNecrRzIBt2Dkij3WdWAYik4m
         f4SYoBmY0HRkMbtbTrJKEBEIY8GJkVrb0RxxPAshh+tIib5Gx+qX4arTtgw/RZUt3kqr
         OeXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@linaro.org header.s=google header.b=ANL3jf3F;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id q3si17815318qtb.362.2020.06.29.04.41.44;
        Mon, 29 Jun 2020 04:41:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@linaro.org header.s=google header.b=ANL3jf3F;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 340074B3EE;
	Mon, 29 Jun 2020 07:41:44 -0400 (EDT)
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
	with ESMTP id Zy8zc25TwNjY; Mon, 29 Jun 2020 07:41:43 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 1E5CF4B3B7;
	Mon, 29 Jun 2020 07:41:43 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 84DA84B37D
 for <kvmarm@lists.cs.columbia.edu>; Mon, 29 Jun 2020 07:41:41 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c9w75K89yG6Q for <kvmarm@lists.cs.columbia.edu>;
 Mon, 29 Jun 2020 07:41:36 -0400 (EDT)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id 9CB774B353
 for <kvmarm@lists.cs.columbia.edu>; Mon, 29 Jun 2020 07:41:36 -0400 (EDT)
Received: by mail-wm1-f66.google.com with SMTP id g75so15040126wme.5
 for <kvmarm@lists.cs.columbia.edu>; Mon, 29 Jun 2020 04:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=35DefQSlDniBHNXxGwbXkQ0Ae4JMwjKJXltjc+2+jKU=;
 b=ANL3jf3FrDnXSbO2YeLHJZqIVP3nvNscZiBMvK44bM34qCdmdgqN9aXHBuTxP+w70R
 QxBA9m0WF89OWH1z4IKMuy71WEeld9p5RrFN1iYdphUb8K4o5o4522H5O4OdJLw36qls
 dhK2wP/oNJ5a9QoQSwnO6xwdVYkixZ8kzZ8Ny0jP0GlyRP8AlSpAelbtzDllt+JVDaIy
 9MgmfMWTBBnOGOrLnCkdpiw0yKbHmugY0rr5yUWXJPlY/LP5W97BdQQtSgGJYVo4yTU/
 QFuUTPOtGj/g0O6azPN4XgZniOAnWQy4MK8pPsdy/cBjuaUaEr35l6I7ZN1viYa41pEP
 yUSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=35DefQSlDniBHNXxGwbXkQ0Ae4JMwjKJXltjc+2+jKU=;
 b=kbVyUwDxrJpodcBUKASnjuVcpejBvIu1+sSBHGuus5uGTWGEE+ria7HFNpeUGY7Ahq
 dEdUKpoaSUV0RPcWKE7R1QHOuKaKrr7P2p+x8KKTHRNYDk+Fa+tiWTMcwl/+SwvNQts9
 SP9eCsXjKEklRQIvsmiJ5FqlcJOwrLX+COl5ahJkbvx74ww+Ci0K6frMnlYWZiUYot59
 z2LBzF/fluadFVhGzyxRv08ONeX77eRcOHIOsdV3ozKC5RrL51FXp5dTKq92FYMB3JAu
 Zdog8wq3i0n2FajC21PjgDRvGOZqtaaTDePWvbbDxJxPA9YvdZwymfKFACMIe1O7ziCo
 bElA==
X-Gm-Message-State: AOAM533tuQkKeiMnsEO/466sqaCxC6PSaHlSl1lL01wMzC1+xlacsouy
 0U2x2j0JPNM64KzdQtymAUZcaA==
X-Received: by 2002:a7b:c250:: with SMTP id b16mr9154890wmj.30.1593430895545; 
 Mon, 29 Jun 2020 04:41:35 -0700 (PDT)
Received: from moi-limbo-9350.home
 (host86-139-146-71.range86-139.btcentralplus.com. [86.139.146.71])
 by smtp.gmail.com with ESMTPSA id c2sm49486357wrv.47.2020.06.29.04.41.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 04:41:35 -0700 (PDT)
From: Beata Michalska <beata.michalska@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 0/2] target/arm: kvm: Support for KVM DABT with no valid ISS
Date: Mon, 29 Jun 2020 12:41:08 +0100
Message-Id: <20200629114110.30723-1-beata.michalska@linaro.org>
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
X-TUID: wpxiLn5mL/uq

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
v9:
 - formatting fixes

v8:
 - moving the comment re support for VCPU events - missed in previous patchset

v7:
 - Rephrasing the comment regarding abort injection and vcpu synchronization
 - switching to struct initialization instead of memset

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
 target/arm/kvm.c     | 80 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 target/arm/kvm32.c   | 34 ++++++++++++++++++++++
 target/arm/kvm64.c   | 49 ++++++++++++++++++++++++++++++++
 target/arm/kvm_arm.h | 10 +++++++
 5 files changed, 175 insertions(+)

-- 
2.7.4

_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
