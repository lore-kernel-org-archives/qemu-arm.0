Received: by 10.25.0.198 with SMTP id 189csp160868lfa;
        Fri, 5 May 2017 05:45:00 -0700 (PDT)
X-Received: by 10.237.48.66 with SMTP id 60mr46519584qte.25.1493988300039;
        Fri, 05 May 2017 05:45:00 -0700 (PDT)
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id 88si4522114qtc.289.2017.05.05.05.44.59;
        Fri, 05 May 2017 05:45:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 9C39940C25;
	Fri,  5 May 2017 08:41:51 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: 0.911
X-Spam-Level: 
X-Spam-Status: No, score=0.911 required=6.1 tests=[BAYES_00=-1.9,
	DKIM_ADSP_CUSTOM_MED=0.001, DKIM_SIGNED=0.1,
	DNS_FROM_AHBL_RHSBL=2.699, FREEMAIL_FROM=0.001,
	RCVD_IN_DNSWL_NONE=-0.0001, T_DKIM_INVALID=0.01] autolearn=no
Authentication-Results: mm01.cs.columbia.edu (amavisd-new); dkim=softfail
	(fail, message has been altered) header.i=@gmail.com
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jFaWYOvfiet1; Fri,  5 May 2017 08:41:50 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id B2B3440BAC;
	Fri,  5 May 2017 08:41:50 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 5C62040B5E
 for <kvmarm@lists.cs.columbia.edu>; Fri,  5 May 2017 08:41:49 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7UFPWg3+xuR4 for <kvmarm@lists.cs.columbia.edu>;
 Fri,  5 May 2017 08:41:48 -0400 (EDT)
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
 [209.85.216.195])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id 23EEB40905
 for <kvmarm@lists.cs.columbia.edu>; Fri,  5 May 2017 08:41:47 -0400 (EDT)
Received: by mail-qt0-f195.google.com with SMTP id r58so605140qtb.2
 for <kvmarm@lists.cs.columbia.edu>; Fri, 05 May 2017 05:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=zB3WymH/nmWPQl00lZdRd/4QWwOGspy61UlcEt5Oj54=;
 b=kD+eN2N5SFWmcdylBlitKJXhyCDAGV04OGzgFpQzf+DG5UvwRjn14V+BrqCGL7xYF/
 ioWafiAzPHCil3iuWOwFdJIoC6xCluC92RZ5fbYAs/Hlver/1W5Ocu/7k4lVTF8mQSxp
 UTmsy5ZdX1xTeUfjkZZzM+gebROMLOsG8iiFP/u+WM5yrfEbyTxbzu/xat2bbb6TAo1U
 9L4+j6PnxxPjnuQC2IqdhHtSkPhQ7uTlb2jFdPRashqJ2F/r9j8nBTEDXuEukbmb5baH
 /Nv+M+5swwRZfckFBKEU+mmgzZk2ahHJBw59pr6LO5SZfEU4zopBgfJxsz8mAgwjnQIO
 ACdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=zB3WymH/nmWPQl00lZdRd/4QWwOGspy61UlcEt5Oj54=;
 b=SvGYhPzfITFBkn6In2ijjqltQGLnJsnQ8XocRO/cTDtZ6YbL4SMmVUCv033vpfSPMG
 mH3SLCdIn7cLfkAVxhGdv/dKqMIsmFxROscjS02fdN4f0W50AqBuS0KEHW1rjgb+pZTD
 uCL1mjPT1KJY2SDbhDPsly9+8LJGFfDnQixv5IqPKFFdl0OuiCSCuHWaKKaO2DafORpK
 HOVQCclp3+l1Ffen0qIIDCoyn2tfMQ3P1iKcsWd4KEFPjPmvtJ/Tq8nuJ2z90oky8lHT
 iupou73cNAKHeaCjE3S1IlnShP4Z47EQcF4rOVYQqafZzOoaevWiKRmLhCZUQLgn6HWY
 vQkw==
X-Gm-Message-State: AN3rC/5CakFVTtNs/PImhQQ/xgxqCH90kSwhvqZbGs07po2CrSMAfWyO
 yShGswG3fyj71+iWWwUL2MqBLkA0bg==
X-Received: by 10.200.34.39 with SMTP id o36mr45263110qto.189.1493988295590;
 Fri, 05 May 2017 05:44:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.19.211 with HTTP; Fri, 5 May 2017 05:44:55 -0700 (PDT)
In-Reply-To: <590B4D73.60000@arm.com>
References: <1493530677-4919-1-git-send-email-gengdongjiu@huawei.com>
 <5908A5BC.1060202@arm.com> <590B4D73.60000@arm.com>
From: gengdongjiu <gengdj.1984@gmail.com>
Date: Fri, 5 May 2017 20:44:55 +0800
Message-ID: <CAMj-D2Bjb=oDRUhY_dxUmZTuGkNZcCs6EYhKUsvjxAU4v55N7A@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] arm64: kvm: support kvmtool to detect RAS
 extension feature
To: James Morse <james.morse@arm.com>
Cc: songwenjun@huawei.com, mtsirkin@redhat.com,
 Benjamin Warren <ben@skyportsystems.com>, kvm@vger.kernel.org,
 imammedo@redhat.com, Marc Zyngier <marc.zyngier@arm.com>, pbonzini@redhat.com,
 Tyler Baicar <tbaicar@codeaurora.org>, qemu-devel@nongnu.org,
 Dongjiu Geng <gengdongjiu@huawei.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>, wuquanming@huawei.com,
 kvmarm@lists.cs.columbia.edu, qemu-arm@nongnu.org, huangshaoyu@huawei.com,
 linux@armlinux.org.uk, lersek@redhat.com,
 Xiongfeng Wang <wangxiongfeng2@huawei.com>,
 linux-arm-kernel@lists.infradead.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kvmarm-bounces@lists.cs.columbia.edu
Sender: kvmarm-bounces@lists.cs.columbia.edu
X-TUID: +7rpazrnItVt

Hi James,
     Thanks a lot for your comments.

2017-05-04 23:49 GMT+08:00 James Morse <james.morse@arm.com>:
> Hi Dongjiu Geng,
>
> On 02/05/17 16:29, James Morse wrote:
>> I think we need a new API for injecting SError for SEI from Qemu/kvmtool, but it
>> shouldn't be related to the RAS extensions. All v8.0 CPUs have HCR_EL2.VSE, so
>> we need to know KVM supports this API.
>
> Thinking about this some more, it is slightly more nuanced, KVM can always
> provide an API to inject SError, but it can only set the VSESR if the CPU has
> the RAS Extensions.

James, do you mean we need to add a new API instead of adding the
VSESR in the old API kvm_inject_vabt?

 /**
  * kvm_inject_vabt - inject an async abort / SError into the guest
  * @vcpu: The VCPU to receive the exception
  *
  * It is assumed that this code is called from the VCPU thread and that the
  * VCPU therefore is not currently executing guest code.
  */
 void kvm_inject_vabt(struct kvm_vcpu *vcpu)
 {
     vcpu_set_hcr(vcpu, vcpu_get_hcr(vcpu) | HCR_VSE);
 }



>
> Only offering the inject-SError API call if we can also set the VSESR looks a
> bit funny, but no-one has needed the no-ESR version so far.
>
> I still don't think we should let user-space make the 'RAS Extensions means
> VSESR' logical step.

 Ok. got it.

>
> So my comments on this patch become:
> Don't read id registers directly, use cpus_have_cap() which handles features
> that differ across CPUs or were turned off at compile time.
>
> Please don't call this 'KVM_CAP_ARM_RAS_EXTENSION', if we are building an API to
> inject SError, call it that instead.

Ok, thanks for your suggestion.

>
>
> Thanks,
>
> James
> _______________________________________________
> kvmarm mailing list
> kvmarm@lists.cs.columbia.edu
> https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
