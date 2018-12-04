Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp8083247wrt;
        Tue, 4 Dec 2018 05:43:51 -0800 (PST)
X-Google-Smtp-Source: AFSGD/UE/0ItfTN+CXtJI4PZmpirO+POhxaomp7L9YB3cnqx529ha+yCbB6Zm8+SNCS1EF7PTo0j
X-Received: by 2002:ac8:75cc:: with SMTP id z12mr18992938qtq.249.1543931031643;
        Tue, 04 Dec 2018 05:43:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543931031; cv=none;
        d=google.com; s=arc-20160816;
        b=Vd4H8pGXRfF2HiwpNQsmXd0P7TlkMIxK8HbFVjFuH58BhOpmnV9qCCNUz8OfAJNRib
         xrzYS7hI5f/31hH0yncpsg0+Ql5wtswcpYmW9J0J9zeEaXaH8OCXqgHnq3xvDU0NrZ8Z
         /RVWTonkdQENwngInnxNBXqTtKcWq1l+hX/T8H8AHfQVax3mwRUeW8fUGlbI8CHY3WHW
         CgSp3QE+lUKLlskBGbOndJ4WHIAC8pXYmCXnFkuCq9AN0HKi0q3t5m+D/0SYYR3fVCcs
         4613fxfHU3zkYWXE8Vocx0K2sS4tl0gTuHYsykWI5Ou4R0EeuTVjhM29P5ophztPzK9a
         lruw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/BLmJ7QDwd+e/2xJg7XzWuEIppqMB1CZfabhY/lC/0M=;
        b=wI4R0pMziIJ29/1JdhIRDX+a1s9NzrXdeanYquuP+/LF+7utt4JP/4Hyfs1tnoE9zk
         8KogWDm9tUPJ+t4DH53QfgB63+A9Wj1PJbewKhESRCwwAhSHF3yZh8NBPBgFZ6SpUbdz
         b3/bcqpYHSy3czKfKwDeCB5VSLKmJ/Azd9qHbYUDar6x5te06c/fhYJ6lil0WwiaUXSQ
         UjzrHySHJo3opdm3qVUfp+F5U4TaNETCOMIR/t05pgG2cU38sjMtq8ck5KSRcVlvU/Em
         qpN9gUuQT5ITI9SloGX4tpYFaImsjeyLN8m5KNUDeKnYTRrHjeGGMKk0e+oscqMhIeyx
         ng0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jru1OvU2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a76si8194067qka.92.2018.12.04.05.43.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 04 Dec 2018 05:43:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jru1OvU2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56845 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gUAzO-0003Yp-Rv
	for alex.bennee@linaro.org; Tue, 04 Dec 2018 08:43:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34705)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gUAz7-0003Us-8O
	for qemu-arm@nongnu.org; Tue, 04 Dec 2018 08:43:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gUAz6-00055r-B1
	for qemu-arm@nongnu.org; Tue, 04 Dec 2018 08:43:33 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:36261)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gUAz5-00054a-TX
	for qemu-arm@nongnu.org; Tue, 04 Dec 2018 08:43:32 -0500
Received: by mail-ot1-x344.google.com with SMTP id k98so15189843otk.3
	for <qemu-arm@nongnu.org>; Tue, 04 Dec 2018 05:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=/BLmJ7QDwd+e/2xJg7XzWuEIppqMB1CZfabhY/lC/0M=;
	b=jru1OvU2/ycCn911moE2bm6Ip60dE7YnWxJZnM496E54y8Tm7JFD1jCl73DXqhXYXu
	Fa2dXNGs7uJjZpzcbDJIjUZnAEKsV1dwdiN1aQUNYevOFXKXbL5Xeppm52l0zkY9kwor
	2dt0CEAbku6HGPRst+E6cIktsH6ufs6L0Ckso=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=/BLmJ7QDwd+e/2xJg7XzWuEIppqMB1CZfabhY/lC/0M=;
	b=J3iI+CxkG9QhDrkZ6ZKzR22gpeshYoNgz9nVo7tPSEjDlkNnidYSDNeoa+LPW+bm5Y
	4b1SDe3vy9tC4pZcXLMuAQHpppuDzIS4iscLmzx/CmAJ27+8iF7u1h3jBKpby07iQaXA
	fMHUlNhVtZCvGqSa9gQeWBewjW25AQzQM/vuX9ox0Oa8ZeyIfhTRsHDBS9M3J/4frwhR
	5Q0UJ1ppHss+1+LXJgC6Ptth5++rfuUzVYNhc/A3zMqBFLM5qhiCyqzo4aiKm7R8KMja
	xiduv12P2wccMalwyqP3JTVu60SSYZFVnC/hF1ENmfUgfz3RKZKn6D4lHJLorpEnEgSZ
	g1ew==
X-Gm-Message-State: AA+aEWY3e9eIT8GaN6NQsK99jNrFdVyArYGwaWfn0A2NcpTHm6W4DFgU
	Jb+5ArD7itXZCFyKJTyxCNXEoT3qU5xeA1+AVg1Bwg==
X-Received: by 2002:a9d:12d:: with SMTP id 42mr12300864otu.352.1543931011082; 
	Tue, 04 Dec 2018 05:43:31 -0800 (PST)
MIME-Version: 1.0
References: <1543865209-50994-1-git-send-email-peng.hao2@zte.com.cn>
	<CAFEAcA-oFFz-NtfwHmORxQd4rHsfKa1=tV1kyvPuGQoOZwDB3A@mail.gmail.com>
	<20181204124739.GA17825@redhat.com>
	<CAFEAcA_ovMgKPPjtYVASFqhzM7MX79EJYMZuFY4-FGRh4oqN8A@mail.gmail.com>
	<9ad451bd-7eb1-902f-6023-4b48bb84249c@redhat.com>
In-Reply-To: <9ad451bd-7eb1-902f-6023-4b48bb84249c@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Dec 2018 13:43:18 +0000
Message-ID: <CAFEAcA-tzZVVXk+vV=uWOeL6dU3EnFiFRzLu8KR69Ju4PsPrJg@mail.gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH V11 0/8] add pvpanic mmio support
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
Cc: Andrew Jones <drjones@redhat.com>, Peng Hao <peng.hao2@zte.com.cn>,
	"Daniel P. Berrange" <berrange@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GPB1h1DY4NWK

On Tue, 4 Dec 2018 at 13:30, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 04/12/18 13:59, Peter Maydell wrote:
> > ...and if we'd done it that way in the first place for x86 then
> > we wouldn't be having to do anything at all now for Arm.
> > That suggests to me that we should do it that way now, and then we
> > can avoid having to do a bunch of extra development work for the
> > next architecture, or the next interesting Arm board model.
>
> Is there any case where we have anything but ISA and MMIO?  (We have
> 8250 which is ISA, PCI and MMIO, but that's kind of special because PCI
> is only there for hotpluggability.  pvpanic hotplug is not interesting).

The point about PCI is that it is the same everywhere and
discoverable, and easy for the user to add to the system or not.
MMIO requires extra work for every board model that we want to
put the device into, plus extra on both kernel and QEMU side
for every system description mechanism (ACPI, dtb, whatever
some future architecture might use), even if we have the basic
"mmio pvpanic" device code already.

> Also, while reusing code in general is nice, sometimes there are
> platform-specific ways to do it.  For ARM, for example, would it make
> sense to use an HVC/SMC that "extends" the PSCI, and pass the number in
> the PSCI device tree node?

If you want a hypercall then these days the arm HVC calling convention
includes mechanisms for discoverably determining whether a particular
hypercall is supported, so you wouldn't need to pass anything in the
ACPI or dtb. But I didn't get the impression that anybody wanted a
hypercall for this particularly.

> Related to this, is there a more or less "standard" watchdog device on
> ARM that could be added to virt?  There is the SBSA watchdog, but it's
> ugly for implementation in KVM because it counts down with frequency
> equal to CNTFRQ (which I'm not sure if QEMU has access too, and also it
> doesn't play well with live migration).

The i6300esb is PCI, presumably that would work?

> > I notice also that there's a mention in that thread that the pvpanic
> > ACPI table entry on x86 resulted in unhelpful Windows notifications
> > about new devices it didn't understand. Is that going to be an issue
> > for Arm with this mmio pvpanic ?
>
> Yes, it is probably the same as for x86.

I guess we need to find out if that is a problem before we can
merge this, then.

thanks
-- PMM
