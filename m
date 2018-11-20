Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp658201wrt;
        Tue, 20 Nov 2018 06:58:04 -0800 (PST)
X-Google-Smtp-Source: AFSGD/X8h5Cpnxnqlgg7oRCHve48lJDpyIpwxH0IeWguFgnmcNiT8m1t56DBEC1Dvc70WVIeY2ND
X-Received: by 2002:a17:902:28a8:: with SMTP id f37-v6mr2576439plb.264.1542725884679;
        Tue, 20 Nov 2018 06:58:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542725884; cv=none;
        d=google.com; s=arc-20160816;
        b=IF2J4f8+PqH7Q5k4jY6HlQ2OPZ/VHemKCltjdS5/vbLRMLjlxuYN3DKUtpFLBnkVc3
         7E75k5YIPxEdqq3pcjv/uGWo5JWh4AbOEmmB1Xf2ykdti6YMgNRq3MH9xngak5Qs1yxV
         o65lhOOei0RuSfdJ3Q0DCS7PGsHBoHR9oS7qXptZWQDomN/VriPLIQXUki60nisWXKck
         ora6jYpJySf61JXSF1We7KL2aOs1ojXZqsWNkR0xeotzvPQICOMnHUgpqWY+3Xwza6K0
         B97f1CqSUUSb0ZYD7Eb797mDvtXlvkLx1csxB99OsvjUqtUF942vun3UX8o1QA1w9yqY
         vgZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=fbfxrs4wBz7nR1I+XzTYC0vEFDsE7kNKXN1zKxd8L+M=;
        b=Z9R7JX0LAMH9reMhW9nKYiVK88E1RG2NzgsilEt7TKK6KUTRa618nKBxXGPXx8fVga
         MwS0ZKkdYRv4OjJXRtuVfoVSmDOaSqjQnFJYh/GuKIb44vLDWw4txl/SuJmB2G0AmvXn
         gDPW277urdSd+bf7zcYMp7BMkIIbQqQe5LmTH/qjpdB0t4wlCZ8EWSll1xfum8jlbtmy
         3e5M7lySD1FM8nxwYn4KCCLmJ1b4nUYH86odBIpx+jWQkMgSx2KcykO8n9z12ZV9OVSO
         3SEmpwSu1voi4GuLeWzJmkpCN2Y9HErjpUQH754ICwuZ0x90EXTospkmrEauN9cTs3py
         FMBw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SwkJYnce;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id b131si41870024pga.51.2018.11.20.06.58.04;
        Tue, 20 Nov 2018 06:58:04 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SwkJYnce;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725925AbeKUB1f (ORCPT <rfc822;francois.ozog@linaro.org>
        + 4 others); Tue, 20 Nov 2018 20:27:35 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:32790 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725851AbeKUB1f (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 20 Nov 2018 20:27:35 -0500
Received: by mail-ot1-f66.google.com with SMTP id i20so1927566otl.0
        for <kvm@vger.kernel.org>; Tue, 20 Nov 2018 06:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=fbfxrs4wBz7nR1I+XzTYC0vEFDsE7kNKXN1zKxd8L+M=;
        b=SwkJYnceSKk0zvZTU5CZdGSeIONleGANAYrFhleLxensEsqMoTsiY+F/qzLK8dz4PV
         Da466u0Mg6BrXpEtF+EsEhw2DOQQ+zXC2Wp1dgsfTdxttvSn0xPqz4N/NPZHzIeGB35w
         BY+EnthjkJ6/sbdFc92HvafWu3FNMKzlFNpHQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=fbfxrs4wBz7nR1I+XzTYC0vEFDsE7kNKXN1zKxd8L+M=;
        b=tm57woXtcCdKoQQNIV68uCg3kUULAsrEHeG5oW/AIsDSgMKE2VfP2pzWELGsBomfCA
         K/5J4mGfYDKr9+TROlsCVTlIpCUR60ci89nPYfnq4fqmj2gzjveHCBP6R69YHBdc9VDj
         duGN0mTiSDJFvs20v9OuHvERoA9Nd6Tu8Ezr5+ep0HcYQxP/xou0ZH2ckJh/YoD5EQXf
         PUxXRtnOBBjpMDc+s3pzsHx1OVeafWpWeVNyKhhXotJW7UvkbF499UGVSSjhY6g2LPN4
         SplXVmpbFsA2wIwJij9VEMlSl5gfYWX9W7mPLhwnxD8ivoDLcZO/oMUUBX2fgo0XE2T1
         1tcg==
X-Gm-Message-State: AA+aEWZyf5OErZbT1FXX4ZLswmVnottOxTNMmZWnUbCljCcAvrMRsv1G
        w43g277+WHkenL3dRtGHb7CU/glmJtPUPzux2C0Crw==
X-Received: by 2002:a9d:582e:: with SMTP id r46mr1398181oth.238.1542725882506;
 Tue, 20 Nov 2018 06:58:02 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:4b0e:0:0:0:0:0 with HTTP; Tue, 20 Nov 2018 06:57:42
 -0800 (PST)
In-Reply-To: <1541672989-15967-8-git-send-email-gengdongjiu@huawei.com>
References: <1541672989-15967-1-git-send-email-gengdongjiu@huawei.com> <1541672989-15967-8-git-send-email-gengdongjiu@huawei.com>
From:   Peter Maydell <peter.maydell@linaro.org>
Date:   Tue, 20 Nov 2018 14:57:42 +0000
Message-ID: <CAFEAcA9wLv96u_GYCBPFtkQMvntoHDKhQjremmN1noaJxsvhAQ@mail.gmail.com>
Subject: Re: [PATCH RESEND v15 07/10] KVM: Move related hwpoison page
 functions to accel/kvm/ folder
To:     Dongjiu Geng <gengdongjiu@huawei.com>
Cc:     Igor Mammedov <imammedo@redhat.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Laszlo Ersek <lersek@redhat.com>,
        Marc Zyngier <marc.zyngier@arm.com>,
        James Morse <james.morse@arm.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Richard Henderson <rth@twiddle.net>,
        Zheng Xiang <zhengxiang9@huawei.com>,
        Eduardo Habkost <ehabkost@redhat.com>,
        kvm-devel <kvm@vger.kernel.org>,
        Shannon Zhao <shannon.zhaosl@gmail.com>,
        QEMU Developers <qemu-devel@nongnu.org>,
        qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: Gy5x3dUawLqR

On 8 November 2018 at 10:29, Dongjiu Geng <gengdongjiu@huawei.com> wrote:
> kvm_hwpoison_page_add() and kvm_unpoison_all() will be used both
> by X86 and ARM platforms, so move these functions to a common
> accel/kvm/ folder to avoid duplicate code.
>
> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
> ---
> Address Peter's comments to move related hwpoison page function to
> accel/kvm folder in [1]
> Address Paolo's comments to move HWPoisonPage definition back to
> accel/kvm/kvm-all.c
>
> [1]:
> https://lists.gnu.org/archive/html/qemu-arm/2017-09/msg00077.html
> https://lists.gnu.org/archive/html/qemu-arm/2017-09/msg00152.html
> ---

> --- a/include/exec/ram_addr.h
> +++ b/include/exec/ram_addr.h
> @@ -115,6 +115,11 @@ void qemu_ram_free(RAMBlock *block);
>
>  int qemu_ram_resize(RAMBlock *block, ram_addr_t newsize, Error **errp);
>
> +/* Add a poisoned page to the list */
> +void kvm_hwpoison_page_add(ram_addr_t ram_addr);
> +/* Free and remove all the poisoned pages in the list */
> +void kvm_unpoison_all(void *param);
> +

In my previous review comments I said:
>>> Any new globally-visible function prototype in a header should
>>> have a doc-comment formatted documentation comment, please.
>>
>>
>> Ok, thanks for this reminder. Do you mean I need to add comments
>> for this globally-visible function, such as below:
>>
>> /*
>>  * xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
>>  */
>> void kvm_hwpoison_page_add(ram_addr_t ram_addr);
>
> It should be in the doc-comment format, which begins
> "/**" and has some stylization of how you list parameters
> and so on. Lots of examples in the existing headers.

Can we have a doc-comment in the proper format and with a little
more detail than a single line, please?

thanks
-- PMM
