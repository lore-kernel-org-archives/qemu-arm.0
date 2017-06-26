Received: by 10.25.15.197 with SMTP id 66csp1747854lfp;
        Mon, 26 Jun 2017 14:32:15 -0700 (PDT)
X-Received: by 10.101.70.137 with SMTP id h9mr2093220pgr.50.1498512735712;
        Mon, 26 Jun 2017 14:32:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498512735; cv=none;
        d=google.com; s=arc-20160816;
        b=eUX8aBQG7oRLOoyDVEaR1f+Y84uPwpGUVSJptfWmUAw3AUaJoJx2twS5FDvZ0pusuz
         lcInRT2e24zEsK06bSZ1xS5GBtqzAXB9zTxPUNpBTMPBdXa2DA6VNWmPr1jT4wXhUO/v
         j3hwNv66tFSy+jacxK7gURNtyoaxIz23QArSSfx28X0hFk5IuFssrNX4CP4LkzK0wcvf
         3RiA+YIjZJ2gWbaz7ECrlM/hfXwMbL/CKLQZ6ooymvKcMQovFt7+72vi1DrB88VPgYzu
         BAK+NHn9EKGijfW9NNE0gj5Oeuh4siSmLr1ajBTS0bXjmz4l/Mx3BIPcDtF2lMsDDLvn
         Z3Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:in-reply-to
         :mime-version:user-agent:date:message-id:from:cc:references:to
         :subject:arc-authentication-results;
        bh=LDJKSgJK24Z8j0pCL3gXe5hxVwac85hq9y1rwiB9G+E=;
        b=ugb74ye/SytTDrhC/MSoPniYFTk+KOqp7Zv/apsTEvqNAqmR8sJSA8YAnvv6N/aJg7
         AQP0ycmweq75TvE5OipLjFKZhQls/Bg0oYebOLw7KGbtwRwbXN5S2uDOWydeTRk9WxQC
         RVwnNv7igby+KJI8YYvKZWnf1EWBS3ojWSPtQqPvT3x6H3NiPLCRtr21SPZjTiTA4dsX
         8RS7P1QXs2rntpcV1LiGsKsuRrWStYM2YI4e8XGV2Su4vShZOXBF1NPpogWY7aw8eHOA
         BHPyWkVKk7qrNfvMabOd0+e3wpxatrorwq1xc/nCwG3m+GxkEH0MqYtyBCEN8mGZGeKa
         ICCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id n12si672614pgs.521.2017.06.26.14.32.15;
        Mon, 26 Jun 2017 14:32:15 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751476AbdFZVcO (ORCPT <rfc822;francois.ozog@linaro.org>
        + 6 others); Mon, 26 Jun 2017 17:32:14 -0400
Received: from mx2.suse.de ([195.135.220.15]:43014 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751381AbdFZVcN (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 26 Jun 2017 17:32:13 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (charybdis-ext.suse.de [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id BC7DEABBD;
        Mon, 26 Jun 2017 21:32:11 +0000 (UTC)
Subject: Re: [Qemu-devel] [PATCH RFC v2 2/2] ARM: KVM: Enable in-kernel timers
 with user space gic
To:     Andrew Jones <drjones@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>
References: <1479133935-63848-1-git-send-email-agraf@suse.de>
 <1479133935-63848-3-git-send-email-agraf@suse.de>
 <CAFEAcA9yW+pOcdE6d6-FUxtVZtEcEXZyEkjwACZa89CbnJ9Y8w@mail.gmail.com>
 <20170626150334.fba6stzqzto4nvcb@kamzik.brq.redhat.com>
Cc:     Paolo Bonzini <pbonzini@redhat.com>,
        qemu-arm <qemu-arm@nongnu.org>,
        QEMU Developers <qemu-devel@nongnu.org>,
        kvm-devel <kvm@vger.kernel.org>, cdall@linaro.org
From:   Alexander Graf <agraf@suse.de>
Message-ID: <afd9127e-1b06-cced-714f-f55ab8dffdad@suse.de>
Date:   Mon, 26 Jun 2017 23:32:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <20170626150334.fba6stzqzto4nvcb@kamzik.brq.redhat.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: cqX7Ldw55PrZ

On 06/26/2017 05:03 PM, Andrew Jones wrote:
> On Tue, Dec 13, 2016 at 01:20:50PM +0000, Peter Maydell wrote:
>> On 14 November 2016 at 14:32, Alexander Graf <agraf@suse.de> wrote:
>>> When running with KVM enabled, you can choose between emulating the
>>> gic in kernel or user space. If the kernel supports in-kernel virtualization
>>> of the interrupt controller, it will default to that. If not, if will
>>> default to user space emulation.
>>>
>>> Unfortunately when running in user mode gic emulation, we miss out on
>>> timer events which are only available from kernel space. This patch leverages
>>> the new kernel/user space pending line synchronization for those timer events.
>>>
>>> Signed-off-by: Alexander Graf <agraf@suse.de>
>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>>
> Hi everyone,
>
> I probably missed a refresh of this patch, but as I didn't see anything,
> I picked this one up today in order to test the KVM support recently
> merged. Tweaking this patch a bit to fit the new ABI allowed me to
> instantiate a KVM guest without the in-kernel irqchip (tested on a
> mustang). So, FWIW, this is report of a successful test. Is there a
> refreshed version of this patch someone can point me to, which I should
> test instead?

Sorry, this did fall the cracks way too many times now. I've sent a 
respin that hopefully is slightly more future proof than this RFC :)

If your tests passed with this patch, please extend them to also cover 
SMP support, as that was broken with this RFC.


Alex
