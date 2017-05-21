Received: by 10.25.0.6 with SMTP id 6csp936857lfa;
        Sun, 21 May 2017 02:08:20 -0700 (PDT)
X-Received: by 10.200.56.93 with SMTP id r29mr16566754qtb.259.1495357700330;
        Sun, 21 May 2017 02:08:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1495357700; cv=none;
        d=google.com; s=arc-20160816;
        b=LI/UYYzgtoKnCqShF9B1iaOsnE6y1xGml3SD2BbPMikWK5/LKGYDsxw498dUqmNIHD
         7VMDO/wxBDNJ1MyJ9WBfCbC2dchIwcrqV670E/uWrt7g67hNewxFG8SQSznTAT/rPH7r
         Vi8v/hl/pq/XqNBMNMB5/LGm7DwDHX7EZlcUbOvLmYpqLB9LEblLF6FvdBxWS2ahErfF
         qn/rfiGq+vpBU+X46nnm8OV9tsZ9/97+sCZBvTKXNZrxkrI5LXEJhwIg4zW6rbsF7OuY
         bW17AKX2CBOwWHB/l83Qd2p8E5m/9DKQIDkDYRnXdIl8GJC13+yNXM6qjORtDJb8bsDV
         NrpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc:to
         :subject:message-id:date:from:references:in-reply-to:mime-version
         :dkim-signature:arc-authentication-results;
        bh=/WlydUsGEInwsmluKk9pHDLFdG3eOLDsdEiJ32hXyOs=;
        b=tTEpsZjVk7Utsq4jkqCwWXZSc+GhCN7R0X0MaR1EnpqTZR6pWQQ5Wy/5By/6IaWTaa
         u+fyuU8gf4jtbJvDo6wsbjEd5IfXcOa4izP/j6huo3JYGc/eAT32N5R2rhPSB4N3H009
         rG1Pow7jAPVMaHQD8YIgZ7e4ozzRpIn7ANjEJH2vRRu3CCFpnBYi7PhCQh0DFLVBZwtx
         8/aa0dfh9qk3VF9Qb4MRue/EyZkJnAnD6CWKxXw07NTIRBT8TyXkqoZ9HzvLvaXJHQ0j
         wwrnh2nDCx4eDMM7LtE6rB/Y8CvlUZ72eMmohifzTREhfrqfeISPbemf43cMEvwWeEON
         pzFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id l1si7753764qtd.80.2017.05.21.02.08.20;
        Sun, 21 May 2017 02:08:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 2426E4095A;
	Sun, 21 May 2017 05:04:43 -0400 (EDT)
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
	with ESMTP id TqlzAtJlOVCv; Sun, 21 May 2017 05:04:42 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 2278140C4C;
	Sun, 21 May 2017 05:04:42 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 3E8F840960
 for <kvmarm@lists.cs.columbia.edu>; Sun, 21 May 2017 05:04:41 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g7td2VAk-O9v for <kvmarm@lists.cs.columbia.edu>;
 Sun, 21 May 2017 05:04:40 -0400 (EDT)
Received: from mail-yb0-f196.google.com (mail-yb0-f196.google.com
 [209.85.213.196])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id 314254095A
 for <kvmarm@lists.cs.columbia.edu>; Sun, 21 May 2017 05:04:39 -0400 (EDT)
Received: by mail-yb0-f196.google.com with SMTP id d72so3699044ybh.0
 for <kvmarm@lists.cs.columbia.edu>; Sun, 21 May 2017 02:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=ZV95PraDDpQV8ZKrswqkG4kFhZ40sZ0TWIYq3L57CzQ=;
 b=ECm1IWPbn/GluvztP7/Tdm8ikWZGXQ4o+FOOVQg1w5+YcRM30iaTlIzIh6bYarKAmw
 ggQ29+eqCfL7N8x1fLflb+7p5lKRv45R/7MRaL7ijSDV+GS/9P/ip7E2INW1FSjwJW3B
 ENnVZwu/v13C6d3GTBrkGUz4pDBDFdKv4oIcMCyk1xjQKG4oSSLE+expiNy0pvn6Hypu
 mVXCbLOIi30PChwxSd9SwS7mG40ud/BmXfBdbqKkUiXVry7hSkZSiL2ehOKAXKIwJrer
 uK+wUMG9Rs2ec5hocmMjQ3jAtq2hOpQgfki40OHWk+wQobP8rv+GKcz385G/3ImF6l05
 hwTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=ZV95PraDDpQV8ZKrswqkG4kFhZ40sZ0TWIYq3L57CzQ=;
 b=NGgPnNqXEJHFqUm3qbFWZ8mFJZVliwlyXtjZMaSaSrQRr4oFdMcVaJOZVYol+Xa0oa
 FjwRWK8jffp7sVOubX565dBsiNJJpU52Qe05QXupa8s3lZAZMs3BkcIDe+fC/Fl6g3mU
 t2f8dJ/dSwBG9OlaDNkm+utFxp5QERiuMyWECSmGKkWQZ3g6OZRdd45AB/6dn6fq6H5R
 t2OIrzaEcsK4EfdNtdRTYNIfILPt/hzp7N1ypCgPwfxtuwgIOrYe2UpOd/aC7marQJr/
 aZYoytmY9NvfQNDSDWqKt06XriA1oJaGw2J65zDRYHm2hCig+j7QQTUpPV3BzViPHAbL
 e+dg==
X-Gm-Message-State: AODbwcDYbelitd1prd6j+H0NTSmsxZPhFTYUVWVaDXgI21gRdwFJnATq
 HLPdmFkViKXooLOOTMcOwCvkKtWcZA==
X-Received: by 10.37.79.5 with SMTP id d5mr14848016ybb.6.1495357696172; Sun,
 21 May 2017 02:08:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.129.172.99 with HTTP; Sun, 21 May 2017 02:08:15 -0700 (PDT)
In-Reply-To: <5915EFCE.7070202@arm.com>
References: <1493530677-4919-1-git-send-email-gengdongjiu@huawei.com>
 <1493530677-4919-2-git-send-email-gengdongjiu@huawei.com>
 <5908A7CE.7030008@arm.com>
 <bbceff7a-1ebf-e6de-abc6-e35b71c939f1@huawei.com> <5915EFCE.7070202@arm.com>
From: gengdongjiu <gengdj.1984@gmail.com>
Date: Sun, 21 May 2017 17:08:15 +0800
Message-ID: <CAMj-D2Cyj=1TthEko=Z-Nq7ntsm5hdUYUzSuPJ5YgBM+mHL_BA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] arm64: kvm: inject SError with virtual syndrome
To: James Morse <james.morse@arm.com>
Cc: songwenjun@huawei.com, mtsirkin@redhat.com, ben@skyportsystems.com,
 kvm@vger.kernel.org, imammedo@redhat.com, marc.zyngier@arm.com,
 pbonzini@redhat.com, tbaicar@codeaurora.org, qemu-devel@nongnu.org,
 gengdongjiu <gengdongjiu@huawei.com>, ard.biesheuvel@linaro.org,
 wuquanming@huawei.com, kvmarm@lists.cs.columbia.edu, qemu-arm@nongnu.org,
 huangshaoyu@huawei.com, linux@armlinux.org.uk, lersek@redhat.com,
 wangxiongfeng2@huawei.com, linux-arm-kernel@lists.infradead.org
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
X-TUID: gA6jotcpIhEi

2017-05-13 1:24 GMT+08:00, James Morse <james.morse@arm.com>:
> Hi gengdongjiu,
>
> On 05/05/17 14:19, gengdongjiu wrote:
>> On 2017/5/2 23:37, James Morse wrote:
>> > ... I think you expect an SError to arrive at EL2 and have its ESR
>> > recorded in
>> > vcpu->arch.fault.vsesr_el2. Some time later KVM decides to inject an
>> > SError into
>> > the guest, and this ESR is reused...
>> >
>> > We shouldn't do this. Qemu/kvmtool may want to inject a virtual-SError
>> > that
>> > never started as a physical-SError. Qemu/kvmtool may choose to notify
>> > the guest
>> > of RAS events via another mechanism, or not at all.
>> >
>> > KVM should not give the guest an ESR value of its choice. For SError the
>> > ESR
>> > describes whether the error is corrected, correctable or fatal.
>> > Qemu/kvmtool
>> > must choose this.
>
>> Below is my previous solution:
>> For the SError, CPU will firstly trap to EL3 firmware and records the
>> syndrome to ESR_EL3.
>> Before jumping to El2 hypervisors, it will copy the esr_el3 to esr_el2.
>
> (Copying the ESR value won't always be the right thing to do.)
  James,  thanks for your kindly explanation, understand you  thought.

>
>
>> so in order to pass this syndrome to vsesr_el2, using the esr_el2 value to
>> assign it.
>
>> If Qemu/kvmtool chooses the ESR value and ESR only describes whether the
>> error is corrected/correctable/fatal,
>> whether the information is not enough for the guest?
>
> So the API should specify which of these three severities to use? I think
> this
> is too specific. The API should be useful for anything the VSE/VSESR
> hardware
> can do.
>
> VSESR_EL2 is described in the RAS spec: 4.4.12 [0], its a 64 bit register.
> I
> think we should let Qemu/kvmtool specify any 64bit value here, but KVM
> should
> reject values that try to set bits described as RES0.
>
> This would let Qemu/kvmtool specify any SError ISS, either setting
> ESR_ELx.IDS
> and some virtual-machine specific value, or encoding any severity in AET
> and
> choosing the DFSC/EA bits appropriately.
   it sounds reasonable

>
>
>>> > I think we need an API that allows Qemu/kvmtool to inject SError into a
>>> > guest,
>>> > but that isn't quite what you have here.
>
>> KVM provides APIs to inject the SError, Qemu/kvmtool call the API though
>> IOCTL, may be OK?
>
> (just the one API call), yes.
   Ok, have added.

>
>
> Thanks,
>
> James
>
> [0]
> https://static.docs.arm.com/ddi0587/a/RAS%20Extension-release%20candidate_march_29.pdf
>
> _______________________________________________
> kvmarm mailing list
> kvmarm@lists.cs.columbia.edu
> https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
>
_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
