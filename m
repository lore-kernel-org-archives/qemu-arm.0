Received: by 2002:a17:504:6454:b0:1be9:327d:8ee3 with SMTP id g20csp808233njh;
        Mon, 12 Aug 2024 07:53:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWGN0gfTSdm0XrLJH8+IrvqasuZgRzdg+2+KaSn+KGSkjzzFwENGh5vB0cHKAaqOY2JVhkV21CxF4X8g1cPXeCoOjReNnqn
X-Google-Smtp-Source: AGHT+IHCvO7UzOIrbPVt05uMomCnX6ZMAYeYCdiK0jLp1GtD4akZsECHESVKeIaBRvlrkBeJlZ2J
X-Received: by 2002:a05:620a:17a9:b0:7a3:56dc:d419 with SMTP id af79cd13be357-7a4e19f5940mr66547285a.6.1723474383494;
        Mon, 12 Aug 2024 07:53:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723474383; cv=none;
        d=google.com; s=arc-20160816;
        b=EvyB+vA1sDRStxPDReCvlEmif5yhwoZmJkI4qYmC7NMF88jiyjIWgI4bPE/Vi3XDM6
         GgHNn1V0kwd287GervSA8d+5RrXCnnWI5We9K/AZ7vDdtbSMNJL+OMRNZ7y6RAwFGnBa
         bkE0dcdgBDuRp4zhiGN/Gjbg1nbWtZurmZvvkijmj+PvMO04jkFh3eCsCyzxP/UfH6Q7
         MDS164flZlYKkJhiPIq4E1aLowKp+BS3xpq8HdFwmQrzAkpoxefedPOqNFjcwY5a6dhK
         iKIkADpApvylIvXqj3pCAtr/wPSy//qL21gutz9Ppa9pTjK3YOaFVb3z2oeznt54njpH
         WN9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=BvKfA4dq24MnUXUUHJj74n+1dW1G21oBcWQ49sONrZ8=;
        fh=1qyegHeJFNM1Izz9HJ8CALsmnpnGUdsdiAUT60Bo1qk=;
        b=sxQTPw4nviJZN9use0BM6ANIrDTeAQznZ7u520Pn1b+bQDwnOHdLBasU3zOtJLTqyF
         ncjxRGjFchkNjaVUXCHrBdrLHBBcK8lkOXtBNnoZzmTmJL6VxpuR+GfSRs16eB5XkB4o
         l1tM9Zhzz8EbsBexPQrGAW8919fgHz4huBM6kggTlRtdkPqXBpO1W1IJXVw8egTnYD49
         tYDK1Ae4hXbkzHL73dSPI0QlKkWGQlHJUnEobwTbxsQdYH/six/2IXVnX9azNWMo1IWj
         9koRmUKhPa+IzBkJ8cOd6OiBdV6FDn9HGqFTRAzI6I/vc/95hG8fD436LhAttUrhrQ89
         0OWA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tgiuXSrS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a4c7d660dbsi650192385a.89.2024.08.12.07.53.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Aug 2024 07:53:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tgiuXSrS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sdWPL-0003jI-Lt; Mon, 12 Aug 2024 10:52:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sdWPE-0003Zq-0c
 for qemu-arm@nongnu.org; Mon, 12 Aug 2024 10:52:20 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sdWPA-00031w-OL
 for qemu-arm@nongnu.org; Mon, 12 Aug 2024 10:52:19 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5ba43b433beso4627827a12.1
 for <qemu-arm@nongnu.org>; Mon, 12 Aug 2024 07:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723474335; x=1724079135; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=BvKfA4dq24MnUXUUHJj74n+1dW1G21oBcWQ49sONrZ8=;
 b=tgiuXSrSC8ygXiRS6gXXFNBzpkzwunaepP3DCPJ7ZGXvDRphdSKcCJtA2M48VybNlV
 2ZzXNWqSkBnJGnZYgzAa3YJ1i+I8SHBe/ooOdnaUxvODLpF3aCLtowLpKF6iw/yuHAky
 kYpyOT58wp3gYWy3Q5Qu1rhJ7PDL22jQdm4oE8aM7+ZSt/+MN5QSNF077c2iBzKuqvay
 lwnZnB7FqJldBZjIAmKXILuqnpKM2JRVElkam0p9cs+XE5DJcMlgaTPy60lqya7y30z3
 tVt1d66gcsX8F25J7CfyIKD4R93ah5aHqlt11RWmDyoKo/03fL7jpq3TCjpF7zqwJSg+
 LX/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723474335; x=1724079135;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BvKfA4dq24MnUXUUHJj74n+1dW1G21oBcWQ49sONrZ8=;
 b=AyYvcZS2KdhppBdtA7Jx8xDrKxqjqp1a9B9xIFlzXZ52e9ajqUXG4z2In1F+yhmo0V
 uvPa5ctTdIR8jtp7hut+SEJHWa3XbfLeDmIXwq4ulbN7LoeLI7/4lx5J9CTRGVk6f23F
 vh5C5enY0zeTBM0VufpMJB2Jj0A1XMQgotChuhukVEsqPIKcWV5B+saLZ3idd57yR1Xm
 wGnmZyCmIRDaPerg/SlvZ6J0J+HG4zSzjDLd7dj7vTXZHDyxhRBWexclqsHVCr+yCe60
 cWOuVPKvNKaNoKga8OHcXzAENJsYcVjSbjNVem5R7VYMZu6c5W354u7lptvZh14MqM8w
 Rdrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW59vVDCMHgkQGhLAoImZZvTjqlySBvGd5T4pwipE7FZklWISLdFjhmDVJXtZ2Q2OhCMQybqlPmpbkAJOSc4EtMcmQ8
X-Gm-Message-State: AOJu0YzzoqMqwrFSXhjWFKTLjxXy7lkmQQBvCW6sgMR9Ok+WEw421E4m
 LeKS+sFHvxFSw2VdWU8keueQu3yxJni3+qd+LMiexzS3LnTmHx8J7NpmeE4ZYHEiWRlwdm9sdiE
 vWusLAenDd3o7/T+/j1lJJFdI1jQaLcR9jnMsYi23EJ1ASDqj
X-Received: by 2002:a50:858a:0:b0:5b4:cd20:f13f with SMTP id
 4fb4d7f45d1cf-5bd44c6a293mr357680a12.24.1723474334567; Mon, 12 Aug 2024
 07:52:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240718230031.69641-1-danny_canter@apple.com>
In-Reply-To: <20240718230031.69641-1-danny_canter@apple.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 12 Aug 2024 15:52:03 +0100
Message-ID: <CAFEAcA__WZ=uw0VLcP0fLbUTwmctsZ1y=FRf9bXMT9WJC2sRFA@mail.gmail.com>
Subject: Re: [PATCH] hvf: arm: Allow creating VMs with > 63GB of RAM on macOS
 15+
To: Danny Canter <danny_canter@apple.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, dirty@apple.com, 
 rbolshakov@ddn.com, agraf@csgraf.de
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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
X-TUID: jWhFlo2UU1Vc

On Fri, 19 Jul 2024 at 00:03, Danny Canter <danny_canter@apple.com> wrote:
>
> This patch's main focus is to enable creating VMs with > 63GB
> of RAM on Apple Silicon machines by using some new HVF APIs. In
> pursuit of this a couple of things related to how we handle the
> physical address range we expose to guests were altered:
>
> The default IPA size on all Apple Silicon machines for HVF is
> currently 36 bits. This bars making a VM with > 63GB (as RAM
> starts at 1GB in the memory map) of RAM. Currently, to get the
> IPA size we were reading id_aa64mmfr0_el1's PARange field
> from a newly made vcpu. Unfortunately HVF just returns the
> hosts PARange directly for the initial value and not the IPA
> size that will actually back the VM, so we believe we have much
> more address space than we actually do today it seems.

So just to check my understanding, this means that with current
QEMU, on all Apple hardware, attempting to create a VM with
more than 63 GB of RAM will always fail in the same way,
regardless of whether that CPU's hardware has a 36 bit IPA
or a larger IPA? That is, we don't change the default IPA for the
VM, so it's 36 bits, and then the hvf command to map in the RAM
to the guest address space fails with HV_BAD_ARGUMENT, per
https://gitlab.com/qemu-project/qemu/-/issues/1816 .

> Starting in macOS 13.0 some APIs were introduced to be able to
> query the maximum IPA size the kernel supports, and to set the IPA
> size for a given VM. However, this still has a couple of issues
> on < macOS 15. Up until macOS 15 (and if the hardware supported
> it) the max IPA size was 39 bits which is not a valid PARange
> value, so we can't clamp down what we advertise in the vcpu's
> id_aa64mmfr0_el1 to our IPA size. Starting in macOS 15 however,
> the maximum IPA size is 40 bits (if it's supported in the hardware
> as well) which is also a valid PARange value, so we can set our IPA
> size to the maximum as well as clamp down the PARange we advertise
> to the guest. This allows VMs with 63+ GB of ram and should fix the
> oddness of the PARange situation as well.

So (again to clarify that I understand what's happening here)
for macos 13-14 we'll effectively continue to use a 36-bit
IPA range because we clamp the "39" value down to the next
lowest actually-valid value of 36 ? And so if you want >63GB
of memory you'll need all of:
 * a host CPU which supports at least a 40 bit IPA
   (is there a definition somewhere of which these are?)
 * macos 15
 * a QEMU with these changes

?

(That seems fine to me: I'm happy to say "get macos 15 if you
want this" rather than trying to cope with the non-standard
39 bit IPA in QEMU. We should make sure the error message in
the IPA-too-small case is comprehensible -- I think at the
moment we somewhat unhelpfully assert()...)

> For the implementation of this I've decided to only bump the IPA
> size if the amount of RAM requested is encroaching on the default IPA
> size of 36 bits, as at 40 bits of IPA space we have to have one extra
> level of stage2 page tables.
>
> Signed-off-by: Danny Canter <danny_canter@apple.com>
> Reviewed-by: Cameron Esfahani <dirty@apple.com>

> @@ -929,6 +977,66 @@ void hvf_arch_vcpu_destroy(CPUState *cpu)
>  {
>  }
>
> +hv_return_t hvf_arch_vm_create(MachineState *ms)
> +{
> +    uint32_t default_ipa_size = hvf_get_default_ipa_bit_size();
> +    uint32_t max_ipa_size = hvf_get_max_ipa_bit_size();
> +    hv_return_t ret;
> +
> +    chosen_ipa_bit_size = default_ipa_size;
> +
> +    /*
> +     * Set the IPA size for the VM:
> +     *
> +     * Starting from macOS 13 a new set of APIs were introduced that allow you
> +     * to query for the maximum IPA size that is supported on your system. macOS
> +     * 13 and 14's kernel both return a value less than 40 bits (typically 39,
> +     * but depends on hardware), however starting in macOS 15 and up the IPA
> +     * size supported (in the kernel at least) is up to 40 bits. A common scheme
> +     * for attempting to get the IPA size prior to the introduction of these new
> +     * APIs was to read ID_AA64MMFR0.PARange from a vcpu in the hopes that HVF
> +     * was returning the maximum IPA size in that. However, this was not the
> +     * case. HVF would return the host's PARange value directly which is
> +     * generally larger than 40 bits.
> +     *
> +     * Using that value we could set up our memory map with regions much outside
> +     * the actually supported IPA size, and also advertise a much larger
> +     * physical address space to the guest. On the hardware+OS combos where
> +     * the IPA size is less than 40 bits, but greater than 36, we also don't
> +     * have a valid PARange value to round down to before 36 bits which is
> +     * already the default.
> +     *
> +     * With that in mind, before we make the VM lets grab the maximum supported
> +     * IPA size and clamp it down to the first valid PARange value so we can
> +     * advertise the correct address size for the guest later on. Then if it's
> +     * >= 40 set this as the IPA size for the VM using the new APIs. There's a
> +     * small heuristic for actually altering the IPA size for the VM which is
> +     * if our requested RAM is encroaching on the top of our default IPA size.
> +     * This is just an optimization, as at 40 bits we need to create one more
> +     * level of stage2 page tables.
> +     */
> +#if defined(MAC_OS_VERSION_13_0) && \
> +    MAC_OS_X_VERSION_MIN_REQUIRED >= MAC_OS_VERSION_13_0
> +    hv_vm_config_t config = hv_vm_config_create();
> +
> +    /* In our memory map RAM starts at 1GB. */

This is not board-specific code, so you can't assume that.
The board gets to pick the memory map and where RAM starts in it.

You probably need to do something similar to what we do
in hw/arm/virt.c:virt_kvm_type() where we find out what
the best IPA the hypervisor supports is, set the board memory
map to respect that, diagnose an error if the user asked for
more RAM than fits into that IPA range, and then arrange for
the actual VM/vcpu creation to be done with the required IPA.

This is unfortunately probably going to imply a bit of extra
plumbing to be implemented for hvf -- that MachineClass::kvm_type
method is (as the name suggests) KVM specific. (Multi-patch
patchset for that, where we add the plumbing in as its own
separate patch (and/or whatever other split of functionality
into coherent chunks makes sense), rather than one-big-patch, please.)

> +    uint64_t threshold = (1ull << default_ipa_size) - (1 * GiB);
> +    if (ms->ram_size >= threshold && max_ipa_size >= FIRST_HIGHMEM_PARANGE) {
> +        ret = hv_vm_config_set_ipa_size(config, max_ipa_size);
> +        assert_hvf_ok(ret);
> +
> +        chosen_ipa_bit_size = max_ipa_size;
> +    }
> +
> +    ret = hv_vm_create(config);
> +    os_release(config);
> +#else
> +    ret = hv_vm_create(NULL);
> +#endif
> +
> +    return ret;
> +}

> +uint8_t round_down_to_parange_index(uint8_t bit_size)
> +{
> +    for (int i = ARRAY_SIZE(pamax_map) - 1; i >= 0; i--) {
> +        if (pamax_map[i] <= bit_size) {
> +            return i;
> +        }
> +    }
> +    g_assert_not_reached();
> +}
> +
> +uint8_t round_down_to_parange_bit_size(uint8_t bit_size)
> +{
> +    for (int i = ARRAY_SIZE(pamax_map) - 1; i >= 0; i--) {
> +        if (pamax_map[i] <= bit_size) {
> +            return pamax_map[i];
> +        }
> +    }
> +    g_assert_not_reached();

We could implement this as
       return pamax_map[round_down_to_parange_index(bit_size)];

and avoid having to code the loop twice, right?

thanks
-- PMM
