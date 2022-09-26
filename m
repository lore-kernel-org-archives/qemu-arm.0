Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp48538ocs;
        Mon, 26 Sep 2022 11:49:46 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4fXvSw2pNb0oqLNHRk3y2y/BfMOAKfkJ0mqmzqRF9peXzw0ghjqMAtLg3sVWBcrezYcJKB
X-Received: by 2002:a05:620a:2495:b0:6ce:bbe6:5bb4 with SMTP id i21-20020a05620a249500b006cebbe65bb4mr15453036qkn.674.1664218186695;
        Mon, 26 Sep 2022 11:49:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664218186; cv=none;
        d=google.com; s=arc-20160816;
        b=eiP06HLOwL2XiV+2KkShHuJGfhER46w6cbq5nByNAchY6ONk6xgViA3liSANL9IduF
         L0TSFbMbqFDPbe5XZrEaBlmknHRL3O2lbIuccbPYPsvfoHLKqPfbpwtWJ7mXgek9GzQw
         KInTM6mIwvAA/0H/hGVVX9AgoYXDHauXjQ6eElBxjnrPIkUFH+RrOo4GkH3Uu46eBCMW
         JuPAjcbmfMxgm8YtH7OzN4o8F4k8N0yyNVnygwlgFTTOCEi6LSg5vfANnS0Tqen4xqmQ
         jhFmToF2uCXsajOb7IPQCB9GDMEvdCR/uBeFxg5LI8gksqxfq6/mNL7XRqkZIIlJr2Xx
         z6lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date;
        bh=vBla3nd4PhjK6tUS31nYvWCHUsAv311m8UdR3r6B5xw=;
        b=S65g2RrvV1fh5R6TJXq/VZ3NPUtqxDDoScB98HDyDMgnrgdKqjQaNY3MepWwVt/JtD
         SDxeSUG79fl594dX3Zfd6BCFUVTTzgxsO58EY04dsW1vqf2leDAMf9/od2z3S2NdfSIj
         xpQhgCj7BkLzKSSc8jzK5Y/rsOqLjhNBbhiOkIBwiTfG8wlF90TL5h7QtkhWOuOI5WFB
         SBb95bGbPhffP1dVCbS8hhcwWy2XVI5awC7FFfi92FnajMPW6IIUocsSNUNRapzS3S+W
         iTnlFJmLusq1r4UwHi+XashI7p9O5ZsSjgtGIVGDEu5aW1BrCH1f3W7+i5s7Qa3cxyHE
         Z8RQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d16-20020ac86150000000b0031f402c9688si11042087qtm.653.2022.09.26.11.49.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Sep 2022 11:49:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1octAo-0004ux-9K
	for alex.bennee@linaro.org; Mon, 26 Sep 2022 14:49:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vt@altlinux.org>)
 id 1ocsWg-0005B4-Mz; Mon, 26 Sep 2022 14:08:18 -0400
Received: from vmicros1.altlinux.org ([194.107.17.57]:50142)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vt@altlinux.org>)
 id 1ocsWe-0006dI-H5; Mon, 26 Sep 2022 14:08:18 -0400
Received: from imap.altlinux.org (imap.altlinux.org [194.107.17.38])
 by vmicros1.altlinux.org (Postfix) with ESMTP id 2FCB972C90B;
 Mon, 26 Sep 2022 21:08:13 +0300 (MSK)
Received: from altlinux.org (sole.flsd.net [185.75.180.6])
 by imap.altlinux.org (Postfix) with ESMTPSA id DCDE44A46EE;
 Mon, 26 Sep 2022 21:08:12 +0300 (MSK)
Date: Mon, 26 Sep 2022 21:08:12 +0300
From: Vitaly Chikunov <vt@altlinux.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 "Dmitry V. Levin" <ldv@altlinux.org>, Marc Zyngier <maz@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] target/arm/kvm: Retry KVM_CREATE_VM call if it fails EINTR
Message-ID: <20220926180812.oojocmldqsf7kl2o@altlinux.org>
References: <20220926133644.1345269-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=koi8-r
Content-Disposition: inline
In-Reply-To: <20220926133644.1345269-1-peter.maydell@linaro.org>
Received-SPF: pass client-ip=194.107.17.57; envelope-from=vt@altlinux.org;
 helo=vmicros1.altlinux.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mW0Ge8pin7hD

Peter,

On Mon, Sep 26, 2022 at 02:36:44PM +0100, Peter Maydell wrote:
> Occasionally the KVM_CREATE_VM ioctl can return EINTR, even though
> there is no pending signal to be taken. In commit 94ccff13382055
> we added a retry-on-EINTR loop to the KVM_CREATE_VM call in the
> generic KVM code. Adopt the same approach for the use of the
> ioctl in the Arm-specific KVM code (where we use it to create a
> scratch VM for probing for various things).
> 
> For more information, see the mailing list thread:
> https://lore.kernel.org/qemu-devel/8735e0s1zw.wl-maz@kernel.org/
> 
> Reported-by: Vitaly Chikunov <vt@altlinux.org>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> The view in the thread seems to be that this is a kernel bug (because
> in QEMU's case there shouldn't be a signal to be delivered at this
> point because of our signal handling strategy); so I've adopted the
> same "just retry-on-EINTR for this specific ioctl" approach that
> commit 94ccff13 did, rather than, for instance, something wider like
> "make kvm_ioctl() and friends always retry on EINTR".
> ---
>  target/arm/kvm.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index e5c1bd50d29..2982d216176 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -79,7 +79,9 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
>      if (max_vm_pa_size < 0) {
>          max_vm_pa_size = 0;
>      }
> -    vmfd = ioctl(kvmfd, KVM_CREATE_VM, max_vm_pa_size);
> +    do {
> +        vmfd = ioctl(kvmfd, KVM_CREATE_VM, max_vm_pa_size);
> +    } while (vmfd == -EINTR);

This does not seem correct. ioctl(2) returns -1 on error and will set errno
to EINTR (in this case).

Thanks,

>      if (vmfd < 0) {
>          goto err;
>      }
> -- 
> 2.25.1
