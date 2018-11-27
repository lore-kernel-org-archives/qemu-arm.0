Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1425705wrt;
        Tue, 27 Nov 2018 07:36:46 -0800 (PST)
X-Google-Smtp-Source: AJdET5cyM7/HH/6O4bjS5ZHsIqIUE9NpHByolQHXAhCuDVQi6IaKaKMXSpeK/Ykkd1O5G9+CvMhW
X-Received: by 2002:a25:f06:: with SMTP id 6-v6mr34403892ybp.467.1543333006058;
        Tue, 27 Nov 2018 07:36:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543333006; cv=none;
        d=google.com; s=arc-20160816;
        b=ueBA3KJhYTr5nMiIi76wNu/j8sVspJUz/JR+4+T7ikQ+yo2RVjNIqBU6cEQNuvIQ5n
         g5mjoEQyr87uN1kATPVwODEiH61rBFKezwNU+ttFWa2lP3BrD1eQozlCnwxUre+8R4Rs
         xxkFMIPlW8Wqt8S8GU6MM4WZK1DFKJt4vnNuoFq1rjw7sCaJRI93Zp41DU29HhPij2vY
         UMzV4eS7Qhb7ZLzxVCVml0zCNr20RBvwF/DvQ4TTzO5OndVXZcTAITNFR3+J3uj2hzap
         vAgD6lpTE1a5Ph+w3oIRlrEQkGN0Y24BogZJf7It7IQFPxQv4HiS94D1ouMZXJSnoBaw
         SjTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:to:from:date;
        bh=7G4X5Ce88E/4Ov2cgTxhpsIyW+I/+/qEQ5ql6EUYJ0g=;
        b=NgP6jvHXEjIdrBlugPjnB8swPE0UW9C3sp2EYipa8Z7r7bFtYWDdmMWkRnqc0PyA1P
         mU/DQF7QG6LDVCPOyiVom/gCgYznPEIpWWQT0WrhPVvjBCyr9CnKK0MdTXOfIoVhdXNG
         S6MUmkRatgN4bblwZ3Q1XjTyHkBwHyzon6SF9jEBqnICgpobT18cMSAGf2m0iPXp970Z
         03ak3xS3vRGJWREAhaU3Tk6xHHpWqi6ZsnZ33JMLrJYGCcjmzCp1cxfQb8BDyb6dKu5T
         DFg6eG/fXdk7jbXXqoi36leoIY8EWq+CZcXoV9eOPx9lxWy56U0WFHI0Y52lKKwx8DjG
         oDxg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k84si447180ywb.147.2018.11.27.07.36.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Nov 2018 07:36:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:43025 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRfPp-0004FE-5V
	for alex.bennee@linaro.org; Tue, 27 Nov 2018 10:36:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52978)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gRfPg-0004F6-EN
	for qemu-arm@nongnu.org; Tue, 27 Nov 2018 10:36:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gRfPd-0003Cq-3J
	for qemu-arm@nongnu.org; Tue, 27 Nov 2018 10:36:36 -0500
Received: from mga03.intel.com ([134.134.136.65]:12206)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gRfPc-00034Y-NV; Tue, 27 Nov 2018 10:36:33 -0500
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Nov 2018 07:36:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,287,1539673200"; d="scan'208";a="101272418"
Received: from sdommett-mobl2.ger.corp.intel.com (HELO caravaggio)
	([10.252.8.174])
	by FMSMGA003.fm.intel.com with ESMTP; 27 Nov 2018 07:36:21 -0800
Date: Tue, 27 Nov 2018 16:35:51 +0100
From: Samuel Ortiz <sameo@linux.intel.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20181127153551.GC4393@caravaggio>
References: <20181113165247.4806-1-sameo@linux.intel.com>
	<20181113165247.4806-5-sameo@linux.intel.com>
	<CAFEAcA9wvrnshOTYz-jZ0n6m7SfusYY+bnB-iPnQuVNqqdg5Ww@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEAcA9wvrnshOTYz-jZ0n6m7SfusYY+bnB-iPnQuVNqqdg5Ww@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.65
Subject: Re: [Qemu-arm] [PATCH 04/13] target: arm: Move all interrupt and
 exception handlers into their own file
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: W9vj4w21u9SJ

On Tue, Nov 20, 2018 at 01:45:03PM +0000, Peter Maydell wrote:
> On 13 November 2018 at 16:52, Samuel Ortiz <sameo@linux.intel.com> wrote:
> > Most of them are TCG dependent so we want to be able to not build them
> > in order to support TCG disablement with ARM.
> >
> > Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
> > Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> > Reviewed-by: Robert Bradford <robert.bradford@intel.com>
> > ---
> >  target/arm/excp_helper.c | 550 +++++++++++++++++++++++++++++++++++++++
> >  target/arm/helper.c      | 531 -------------------------------------
> >  target/arm/Makefile.objs |   2 +-
> >  3 files changed, 551 insertions(+), 532 deletions(-)
> >  create mode 100644 target/arm/excp_helper.c
> 
> You'll find that you need to rebase as there is a recent change
> that your moved copies are missing: commit e24ad484909e7.
> (I have just discovered git diff's --color-moved option which
> is great for checking this sort of code-movement patch.)
> 
> What is your plan for dealing with the way that the KVM code
> for injecting a breakpoint exception into the guest works
> by calling the do_interrupt code ?
> (see target/arm/kvm64.c:kvm_arm_handle_debug(),
> which calls cc->do_interrupt(cs).) This patch moves those
> functions to a file which won't be compiled and a later one
> in the series seems to stop cc->do_interrupt being set at all
> if CONFIG_TCG is not defined. That will result in QEMU crashing
> when it tries to inject an exception, won't it?
Yes, indeed.
So it seems we need to inject an exception back into the guest when
doing hardware assisted debugging and when we have not set any
breakpoint from QEMU. So it's essentially handling the debugging from
the guest case.
Would returning an error when that happens be an acceptable solution? So
when building qemu for arm64 with TCG disabled, one would basically no
longer be able to debug from the guest. Something along those lines:


diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 0a502091e7..3e8a871272 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -1079,6 +1079,11 @@ bool kvm_arm_handle_debug(CPUState *cs, struct kvm_debug_exit_arch *debug_exit)
                      __func__, debug_exit->hsr, env->pc);
     }
 
+    if (!tcg_enabled()) {
+        error_report("guest debugging not supported");
+        return false;
+    }
+
     /* If we are not handling the debug exception it must belong to
      * the guest. Let's re-use the existing TCG interrupt code to set
      * everything up properly.
