Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp1687533ocs;
        Fri, 30 Sep 2022 05:28:48 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM79HvfETj/RokLMYiw0KW7AxQmGhEgQgfmZu3zcyeqE0fEPcFJo3/nnak7QOd+MddA6zPTp
X-Received: by 2002:ac8:5e52:0:b0:35d:1a18:3cdf with SMTP id i18-20020ac85e52000000b0035d1a183cdfmr6486145qtx.240.1664540928263;
        Fri, 30 Sep 2022 05:28:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664540928; cv=none;
        d=google.com; s=arc-20160816;
        b=qatX3uVfa8Ldi5h5mDq4WB3Z5dnTp/o/K0Y6R/7dNxxe+aEYB27ubr3QO4VfD8O5Us
         N0NkCHyOjSkv31tbRSa7nkVRh8SGrc4lHdqh1nAKDyiLpU3PG3CiUZD3YdpQnoP9KIgL
         NIcviqG133MYLIoLCQhJ2wX7SabqMZeebb4NEv4+niFyP2M8mzw8lkukzt4hcxzCwwT/
         s2XVJFnnMzxO5bzVXKpOQrgGmPNm/vgRmD+jTFquo17tQOCe6lXyonczrnUQ1Fz38BjG
         FUicv51SDUUviqlRBWcWX/kC6eq1SJLHMZa9VsvNNk1MMpuE7yb6NZcSJ9JovjKg8FLt
         u/wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date;
        bh=c43ua0H+6oqFwbzheATKBEv/dEJ/Pntb6gH7orkFW9s=;
        b=dEqiNCOSZOrtfgcF00iIaMfVCYRoOqNJnmvYfbciU5+gRt3AJBV+RyDwklC02Ox2Mh
         K+7BCtZjrDXChRvRTA2a/GvtuLtihNzBYjKDwC+Yz9RWJQXtBJTar+WWpUDNc4UYEPKW
         L3xxM9P634sDUTwxSVDQQr/Levbtw+kFILgKKKPfPXztgIvTwQm8q+WJYo6+z2MJ8yh1
         KipcGmzcBfEwRw1jY2FSiklRQ2/RxnOY7c891e6FWj8SWp7B2x7XDn6jQcm8kX/+jyBY
         fWboZfWKPXtVh9w3OY/WzYwZk+h+hz5c+jYMXUXylUt08rdBy6ok9BvH+EY8p6Pb//+c
         xJjA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d5-20020a05621421c500b0049909a07f9esi1196858qvh.340.2022.09.30.05.28.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Sep 2022 05:28:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oeF8J-0003NV-Sh
	for alex.bennee@linaro.org; Fri, 30 Sep 2022 08:28:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vt@altlinux.org>)
 id 1oeF88-0003NG-Tt; Fri, 30 Sep 2022 08:28:37 -0400
Received: from vmicros1.altlinux.org ([194.107.17.57]:35232)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vt@altlinux.org>)
 id 1oeF86-0002V1-Sb; Fri, 30 Sep 2022 08:28:36 -0400
Received: from imap.altlinux.org (imap.altlinux.org [194.107.17.38])
 by vmicros1.altlinux.org (Postfix) with ESMTP id EADDD72C90B;
 Fri, 30 Sep 2022 15:28:30 +0300 (MSK)
Received: from altlinux.org (sole.flsd.net [185.75.180.6])
 by imap.altlinux.org (Postfix) with ESMTPSA id DA2D24A472A;
 Fri, 30 Sep 2022 15:28:30 +0300 (MSK)
Date: Fri, 30 Sep 2022 15:28:30 +0300
From: Vitaly Chikunov <vt@altlinux.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Marc Zyngier <maz@kernel.org>, Eric Auger <eric.auger@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v3] target/arm/kvm: Retry KVM_CREATE_VM call if it fails
 EINTR
Message-ID: <20220930122830.3k32ki7ntqeukay6@altlinux.org>
References: <20220930113824.1933293-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=koi8-r
Content-Disposition: inline
In-Reply-To: <20220930113824.1933293-1-peter.maydell@linaro.org>
Received-SPF: pass client-ip=194.107.17.57; envelope-from=vt@altlinux.org;
 helo=vmicros1.altlinux.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
X-TUID: ruYPg3YECOxK

On Fri, Sep 30, 2022 at 12:38:24PM +0100, Peter Maydell wrote:
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
> 
> v2: correctly check for -1 and errno is EINTR...
> v3: really correctly check errno. This time for sure!
> ---
>  target/arm/kvm.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index e5c1bd50d29..1e4de9b42e3 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -79,7 +79,9 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
>      if (max_vm_pa_size < 0) {
>          max_vm_pa_size = 0;
>      }
> -    vmfd = ioctl(kvmfd, KVM_CREATE_VM, max_vm_pa_size);
> +    do {
> +        vmfd = ioctl(kvmfd, KVM_CREATE_VM, max_vm_pa_size);
> +    } while (vmfd == -1 && errno == EINTR);

Reviewed-by: Vitaly Chikunov <vt@altlinux.org>

Thanks,

>      if (vmfd < 0) {
>          goto err;
>      }
> -- 
> 2.25.1
