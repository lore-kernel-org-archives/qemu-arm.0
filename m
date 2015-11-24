Received: by 10.182.158.201 with SMTP id ww9csp2337382obb;
        Tue, 24 Nov 2015 14:02:20 -0800 (PST)
X-Received: by 10.129.130.132 with SMTP id s126mr28960084ywf.131.1448402540727;
        Tue, 24 Nov 2015 14:02:20 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c186si12534993ywa.251.2015.11.24.14.02.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 24 Nov 2015 14:02:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro-org.20150623.gappssmtp.com
Received: from localhost ([::1]:41635 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a1LfI-0000Ed-AM
	for alex.bennee@linaro.org; Tue, 24 Nov 2015 17:02:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58519)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a1LfG-0000ER-9y
	for qemu-arm@nongnu.org; Tue, 24 Nov 2015 17:02:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a1LfF-0002rs-G0
	for qemu-arm@nongnu.org; Tue, 24 Nov 2015 17:02:18 -0500
Received: from mail-vk0-x233.google.com ([2607:f8b0:400c:c05::233]:36813)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a1LfF-0002rP-8x
	for qemu-arm@nongnu.org; Tue, 24 Nov 2015 17:02:17 -0500
Received: by vkay187 with SMTP id y187so22161954vka.3
	for <qemu-arm@nongnu.org>; Tue, 24 Nov 2015 14:02:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro-org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=XjBPLGQci4VHB4SjGYNXQjKIV8mx/9BhwGEbKIYq404=;
	b=VyQNfa9P1OhgL+Mm+rQTC6lFW5Bmc1jDdZoKiHo7GPDZxw8x4sa490v0612n/we2qF
	1yFFYYUms/xvbc/97BQkLAAMG6BOtqbVThHG17B9Qh5AYfyc3ggUv2GiaxOQ32Mxj3cY
	JPidY48gMqtfcA1VckC5E/yytKTIFu6SaL6Mf8cnEw766TJRTuSRUajhzWuGkA/fsenM
	s8gqYVY0xVWG91kkvGpM9faKcd+vw3TzJyVpbT8VUmsmCDGG0nOVgmzenqPD+HpfvB8K
	6rJBAMzZTwgUzBT9PtSKCAwlFyn9agbro+cLNdxdbvdD0PqAe3uP2M0uWMrd7ans1nQL
	Y6Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=XjBPLGQci4VHB4SjGYNXQjKIV8mx/9BhwGEbKIYq404=;
	b=AhPxV/RY81ribhS5gXza+DPyZDIPrSjqX2qCIgYJsu0jnAPAQH9JczI75GPBs9tRUH
	dxfZP1oIOMWOTf8OZx5HsXwfNkw4zOK7Ji5j5QWBxDVqA+vHCsa6vrmJIpyCYvr2Z2ym
	d7Q+ITZqEOBfPTQuJyqOpy06frOspP8EFUkNz6fnyfV+TMo4bagXbClth14X3kilCvtL
	wq3Ronc7ogYz3ZmPVKyOaEA53C13iF7IlqYZhk+Y7x6sFJ1VAUcKU4Feb6qJLdalGPa5
	0HgsiO9lzTInvKoIMa9ozPC+ymO+83ZpDkih2DMteu1ZXMp6uHoUs1fewWpN2rq4WDU+
	ah6w==
X-Gm-Message-State: ALoCoQlIcbGAMKglQvIwTldJFGUP+GNq4yIFA34gemnzxEELUKTyaOEF1tI4XTJu8IzRPy4iDdiu
X-Received: by 10.31.16.214 with SMTP id 83mr27529680vkq.139.1448402536788;
	Tue, 24 Nov 2015 14:02:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Tue, 24 Nov 2015 14:01:57 -0800 (PST)
In-Reply-To: <20151124214543.GB4383@hawk.localdomain>
References: <1447944817-13286-1-git-send-email-drjones@redhat.com>
	<1447944817-13286-6-git-send-email-drjones@redhat.com>
	<CAFEAcA-NJUUQnOiXzZJ22NSh5AsiSzmHSvPLwzDQPxkCYba-Hg@mail.gmail.com>
	<20151120214121.GC20402@hawk.localdomain>
	<20151121150537.GA3701@hawk.localdomain>
	<20151124205231.GA4383@hawk.localdomain>
	<CAFEAcA-E8hkOY05QVkZjzytpqYOYUJ2kDdCMNBjCaZ4A+6wo_g@mail.gmail.com>
	<20151124214543.GB4383@hawk.localdomain>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Nov 2015 22:01:57 +0000
Message-ID: <CAFEAcA8HhVF7A4VNeYj_ADKR1+TLBMX8rw_z0=CtE=DWu_b+Cw@mail.gmail.com>
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400c:c05::233
Cc: Alexander Graf <agraf@suse.de>, QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 5/5] target-arm: support QMP
	dump-guest-memory
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 21YJyYHsTZ/u

On 24 November 2015 at 21:45, Andrew Jones <drjones@redhat.com> wrote:
> On Tue, Nov 24, 2015 at 09:08:29PM +0000, Peter Maydell wrote:
>> Also, if we're currently executing a 32-bit guest when we take
>> the core dump, you probably need to call aarch64_sync_32_to_64()
>> somewhere.
>
> I think we're covered here. We have
>
> dump_init
>   cpu_synchronize_all_states
>     ...
>       kvm_arch_get_registers
>         if (!is_a64(env)) {
>             aarch64_sync_64_to_32(env);
>         }

That won't work if you're taking the core dump on a QEMU
which isn't using KVM...

thanks
-- PMM
