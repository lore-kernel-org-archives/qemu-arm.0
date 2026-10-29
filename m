Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232A6606A31D
	for <qemu-arm@archiver.kernel.org>; Thu, 29 Oct 2026 14:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=a8L3E5wT
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMRRf-0004vF-81; Thu, 29 Oct 2026 10:49:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xMRRZ-0004tw-PA
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 10:49:29 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xMRRY-0000DM-3E
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 10:49:29 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-8b0d91601bdso6716857b3.1
 for <qemu-arm@nongnu.org>; Thu, 29 Oct 2026 07:49:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793285367; cv=none;
 d=google.com; s=arc-20260327;
 b=gRrSclNgyJcbZ7eoXl+jqiWh8PdvQ0py+7Zd0PZzuhikMEFiQZJdRNYMduisBg81tZ
 +n6CNFfE5enVvKkuvzfGlqgPkMMuTffPkjkusep/ElIXBbxrjSwv7v9IzkTkAhJODhXG
 XIlDGc6YPz78f/bmh0n8Q7E+3Mn/7bsmLX2RLAkeh3IOj4En4e4Wow+lBe79fuL0nLud
 NlCwKpze/Gj8BkWNPYmaoMBFU/lSb0obvc3h4JjHM18TPlNoMHnma2lwsDXgwLbdre2a
 0Ee26J5jowEuxvqIvPTcYzIJzykJx5GqdAzPNBSTVTJopjtTx07ZoObdk02zDlrBVRa3
 eebQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=MgN094k1BFcqlTCztzZgWYZeEgqavZD4L+tZVF7wL1k=;
 fh=19GSH8QxriR4w9Iyla1XHJf9qWycuL8FDeFs5ASIwag=;
 b=adBxWmcjADdC8oREqjsMVOFzWtjH10jGvCJCDMsJXll4NNcxmVtmolaxyZh0RjOpaD
 kUAMlzHqgKsZMv7UJkZlhjZGhrGP+6Z2ik6oIk8pP78SEnLZGtarHR0jObXJRwB4Be5a
 +N2VTjckzL5385SkE3SYBMKXM63fE92LW5xQP4flkgzI8dODqaYlsf//8e3vBke9O+1F
 drz3maDT0/8YKzTjaAJA3R1epv+xB93C5IXsxDwZ+XthVb/7VWpUWv0Fh5rx2ywvfn0s
 fthVz26+YJAvkPSsYiXMMzsZej4vZb4jlDAybEOkWMRKtea6vYUPJpqMKqntSKqDddrx
 +gcQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793285367; x=1793890167; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=MgN094k1BFcqlTCztzZgWYZeEgqavZD4L+tZVF7wL1k=;
 b=a8L3E5wTqdmxcfREkcSuLZmP9CV/ABcKmDVfZ2xuYPB5lUNZ1BDI9B3ita1Ld8FQ7U
 eEUqaMdPn4BQ0/Q5/pNbDpWzAPTw2fIsUgMAESZfgObFjJ6COWYDoTcaCQjQoW0rM431
 9hxF+N7lrceT5JtGdtDAGhrdBafaX6HGUSab3qYCNenIY090CHCc+UCoOfdK+OUEc6Yf
 //ZSxW/jb92BLqZiR6S69Cx3SoKySmEg2jCLY99DtJwyROhDqrfzXq8f24shL64UlVd6
 BkBovMqQgPXTHSIWiu7VLsW80XzQgynUytW6wKCRlQPI1zPLLtMnyV2KdvbxaGyZcoy1
 HKJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793285367; x=1793890167;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=MgN094k1BFcqlTCztzZgWYZeEgqavZD4L+tZVF7wL1k=;
 b=ZVyPNBzYOz1bwpAW2b/2sgiIf17v4V2fgGsAcIH+7hamiPTmvX1X7mSKnpNiCewepb
 I6U0zL3IClt91njxEDs3VvsXXtig+E79eb6/E3mKKRdCGiF5hRmePwcbknkKAGylxwNI
 cpU1yEtpdCLN09/X+ByTBvWtD1jeZDBC3M9G0x9OOfLxASNghoWuDYYZgWz0Gy91/7YM
 YOhRSt8O69h4XS6yJ7n2I6KwMxGClZlLlh9mhMgtEaP81lndFt1aXCqiH1/w8zbVnllV
 h92HI6L04WLebytdrqHPHEtrAb7d8lg1SFXIxlZfPsNT1e/ttcmzkBK/m6rP02HKG230
 Iiaw==
X-Forwarded-Encrypted: i=1;
 AKwUvBzokt6vtFZQbcwLVRJUHMF/Zd6kHPt2hKktG1enK+ZDkJ4chQsBkA2MzO1KxuHmOy4VognwYw36rw==@nongnu.org
X-Gm-Message-State: AFq9FYKgc4DQrDR+bg5dPAgBhUF1IsyYYRsAvCOvLMsE2YRIt4yg6vLg
 FN5CJWHh4W5EgDlrAKbBrcYcjtvxHyEMkSUoBCqhedAW+fgBePhbMS9rxFNCuKsmpidJTV9vjnB
 KThkYVy/pwiqLiKE4h8m6pBr/L1lQjeVEq/ipziRqIw==
X-Gm-Gg: AYBFou2OtRdj7pzfNKafpNMgGKMkEXjg9Ka/LqPhH4Q0xaaJH+pmjzsAqlBRJGQ88aq
 keJqOv367yUUkl06XYgd6TERhjCkYww70aZ+xT5AqWY7s1JVY1We+ppeRFmuByQB1XjP2xkAjTs
 pBI8g4vwEyXpDDufTEnWIzu1XcP6kGbP0b/D2UCF2DHLUEWmX6Fxmib6+/ODkpzMN9G3GTHcxkC
 mkgsCP2cXVcNNR3M4E5d0VkzUc9OaTGSJKfGTfaZNrNDoltHXYqI4Jbue0EpYkJ4sT+sYhIYWff
 xhbJAo24mIRLAa4gQmoaqSHN2vdQHLKz5iDkbLdUypatVG4dI9q6iWSxQ7+0VrOUxnQArajjLyL
 4gh5OoXJALK/lKbjSyiu8weJpPQCzWH3A4UPURMO95db9Yxp5yKEsGgP5+xfvIu690eIqAnslvx
 qqMc2A4vWEenlbikGZX4Kh
X-Received: by 2002:a05:690c:6612:b0:8b1:6c4d:6b83 with SMTP id
 00721157ae682-8b1c6762363mr20010397b3.24.1793285366380; Thu, 29 Oct 2026
 07:49:26 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261029092307.281287-1-eric.auger@redhat.com>
 <20261029092307.281287-7-eric.auger@redhat.com>
In-Reply-To: <20261029092307.281287-7-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 29 Oct 2026 14:49:14 +0000
X-Gm-Features: AclHuK_QnTgYU6J5yARPKiW8vNTsLA2SYpuOAg5EmAHtKzsWF-GIopk7PrDDMDc
Message-ID: <CAFEAcA9NZ6kUCB3eLYdwYaG0pedZej_Wv7te1s94hYo67CpV+A@mail.gmail.com>
Subject: Re: [PATCH for-11.2 6/9] target/arm/kvm: Pass an error handle to
 kvm_arm_init_cpreg_list
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 shaju.abraham@nutanix.com, khushit.shah@nutanix.com, 
 richard.henderson@linaro.org, pbonzini@redhat.com, skolothumtho@nvidia.com, 
 philmd@oss.qualcomm.com, 7746591750@163.com, maobibo@loongson.cn, 
 harshpb@linux.ibm.com, amachhiw@linux.ibm.com, 
 daniel.barboza@oss.qualcomm.com, milesg@linux.ibm.com, farman@linux.ibm.com, 
 cohuck@redhat.com, armbru@redhat.com, mbawa@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 29 Oct 2026 at 09:23, Eric Auger <eric.auger@redhat.com> wrote:
>
> Pass an error handle to kvm_arm_init_cpreg_list(). A Subsequent patch
> will do the same with kvm_arch_init_vcpu().
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

I wondered if putting patches 6 and 7 the other way around
would be better but it doesn't seem worth the effort of
rearranging them now.

> ---
>  target/arm/kvm.c | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)
>
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index 28f199c03f..d454346037 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -872,6 +872,7 @@ static bool kvm_arm_reg_syncs_via_cpreg_list(uint64_t regidx)
>  /**
>   * kvm_arm_init_cpreg_list:
>   * @cpu: ARMCPU
> + * @errp: Error handle
>   *
>   * Initialize the ARMCPU cpreg list according to the kernel's
>   * definition of what CPU registers it knows about (and throw away
> @@ -879,7 +880,7 @@ static bool kvm_arm_reg_syncs_via_cpreg_list(uint64_t regidx)
>   *
>   * Returns: 0 if success, else < 0 error code
>   */
> -static int kvm_arm_init_cpreg_list(ARMCPU *cpu)
> +static int kvm_arm_init_cpreg_list(ARMCPU *cpu, Error **errp)
>  {
>      struct kvm_reg_list rl;
>      struct kvm_reg_list *rlp;
> @@ -889,12 +890,17 @@ static int kvm_arm_init_cpreg_list(ARMCPU *cpu)
>      rl.n = 0;
>      ret = kvm_vcpu_ioctl(cs, KVM_GET_REG_LIST, &rl);
>      if (ret != -E2BIG) {
> +        if (ret < 0) {
> +            error_setg_errno(errp, -ret,
> +                             "failed to get KVM register list size");
> +        }

This made me wonder about what the "returns success" case here
would mean. I think that's in practice a "can't-happen" case,
because it would mean KVM had no registers in its register list
(i.e. we handed it a 0-sized list and it said "sure, that's big
enough"). But we should treat it as an error, because otherwise
we'll return success here and then later code will assume that
cpu->cpreg_indexes and so on have been set up for KVM when they
haven't been.

But this is a pre-existing bug.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

