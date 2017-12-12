Received: by 10.223.159.74 with SMTP id f10csp3870714wrg;
        Tue, 12 Dec 2017 06:16:03 -0800 (PST)
X-Google-Smtp-Source: ACJfBovluYKreVPnjcNAwviKyTKq6lO+GgAHaEtUjisO4iKU/9Ne4BYsvUC3diGdLdxD+Nv/pyfi
X-Received: by 10.37.95.73 with SMTP id h9mr3086994ybm.247.1513088163041;
        Tue, 12 Dec 2017 06:16:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513088163; cv=none;
        d=google.com; s=arc-20160816;
        b=SFQTgMC7MQonzWpVW5LI25xsgpiiiil2rzTMlOTIAtTRfP3Mrkyil4XnH52vl73M49
         xhv2s2tvAG36mC9MDhDR+zwbsPijrOL9e6YkyKB+x3eS718lU7l+zN21XxVyxB5IzavQ
         wSnA9GxKmkOgr7kFcRIxQz3MUkiOGx3gKLDDv8tKZxaiqzjyXa6V6X6GqZFQxxdxQbDS
         jXawslMh6cp7CZc08od9nJDlfS9+XVjJIPEZVbaJRwlJnTkel6SuQPEm3uIXlJYARLYM
         456asU+GDVp3iN7XDXjgCLX7NkaAsPZ4MJ1lUhmLHsgW3XhvYt2mrKaxrXEsq8GHGs1A
         +UKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=hGCD2uAKaRNiQTd9/nw+r/EFWEOjfGmLNp4F1Do1iDE=;
        b=Z8gHdF44SGR3KIfPgVljNCJ+rJtUOPUFecx2LW3F4Gcj6d+PgN2QJlfnOJohDP6cel
         MrJcOfmBx8zZWzf+BQwLuFEFic/uGKl7Ym1cVtN4W4vtz4nXO7CRGLZG7JdrlbE5vqY0
         f1klkIX0sW/fNGOgyY0MCsOecbt02/6sbZp6TdCNdKUtOFS4aVHmYcUempi7J2mJ7asL
         zWnxubtEHqy1J0fDG+DvCCXMyEH/EUV83TtiI9qEAAZZpWn2RKReLGhIHNNNOIgPi/jU
         2BcKUWDUEKKZC2kdxcfUh7B83pXBQXPOhjjxrX3BOj2wKRcVhpKEiAz85tkqNQ5KxOvc
         RBNA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fBbqXc8f;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h2si3645860ywj.553.2017.12.12.06.16.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Dec 2017 06:16:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fBbqXc8f;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58577 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eOlLm-0007ut-EI
	for alex.bennee@linaro.org; Tue, 12 Dec 2017 09:16:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42175)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ard.biesheuvel@linaro.org>) id 1eOlIT-00050x-0R
	for qemu-devel@nongnu.org; Tue, 12 Dec 2017 09:12:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ard.biesheuvel@linaro.org>) id 1eOlIS-0002xj-5D
	for qemu-devel@nongnu.org; Tue, 12 Dec 2017 09:12:36 -0500
Received: from mail-it0-x241.google.com ([2607:f8b0:4001:c0b::241]:34674)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <ard.biesheuvel@linaro.org>)
	id 1eOlIS-0002x5-0m
	for qemu-devel@nongnu.org; Tue, 12 Dec 2017 09:12:36 -0500
Received: by mail-it0-x241.google.com with SMTP id m11so17468316iti.1
	for <qemu-devel@nongnu.org>; Tue, 12 Dec 2017 06:12:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hGCD2uAKaRNiQTd9/nw+r/EFWEOjfGmLNp4F1Do1iDE=;
	b=fBbqXc8fHI46l+DCwBkTxwKeXEP1cyl4QiMJnxLRNGOnauHlcDEhhjbE7tACUe7Ld3
	S9TkLq4HQuKXrtiGgjfaE03yhl6E76GYcGo+KivzJIF1izHTvy+cFZRxB632E94U1I4Q
	9dXGHgIz0nDTztH/Hljkmerb4rdPGrvh47zqs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hGCD2uAKaRNiQTd9/nw+r/EFWEOjfGmLNp4F1Do1iDE=;
	b=O9eGn6KGUG0FzMhbhTj+ngqgMYcc+sVzoIK50BPj2p0b8rAh4ipgON771SEKBrHzDa
	QNz6mncMlyisGySmY74pF1NQS2BQzAJiqCkq7mFT/qQ0DjKfH350Ocs2mOoYipLv1rk8
	jBX2GXdjGmrrCUATvUVp0BVkiDQXxaNW3n1kGNeVKQ1AMqGjKPIQOXudif0K780ok/Nf
	rV+1/+qBUVQLJ+fplIAYLKnY+mHj3mJFFKZbBJozvax9BbxnaDeIFgae4z9qLVD8OEzk
	SRjkdfwBB5k/GU9K2tr9OtACXDzI1Tzr8Xd28IL+idbkQKhpyf5hy8STmV64MGNIaahS
	44NQ==
X-Gm-Message-State: AKGB3mJCBQpi66YThzn/T69Rybtuqb5iD9ncyDhgECh+o78AyJA7Y7a/
	k0bhTCA6/VlOEPHshGoOc+llm5TnduNHO75MtF/sQg==
X-Received: by 10.36.71.83 with SMTP id t80mr2547469itb.48.1513087955367; Tue,
	12 Dec 2017 06:12:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.104.16 with HTTP; Tue, 12 Dec 2017 06:12:34 -0800 (PST)
In-Reply-To: <CAFEAcA9JzK8sNF5TmENfXZ-NBJwfp03b2La4YQ=N2i1ZCzrNBw@mail.gmail.com>
References: <1512745328-5109-1-git-send-email-peter.maydell@linaro.org>
	<1512745328-5109-4-git-send-email-peter.maydell@linaro.org>
	<5A2F6ED9.5030605@huawei.com>
	<ac182406-8011-9f19-38e7-37328434095b@redhat.com>
	<CAFEAcA_9pee99KpL4zwVS5jJuiv2MCGp79crufpU1kH1Okg-Hg@mail.gmail.com>
	<6b4b6351-eeb4-a4d3-8ddf-5401516671ae@redhat.com>
	<CAKv+Gu-Ugm1g8twoKwgXAPtDfETvXntk2h4WzMVuUTDF7GhMvA@mail.gmail.com>
	<5e3798f7-e280-b6c3-1504-828283617c52@redhat.com>
	<CAFEAcA_+NnpeP9Le7bp9yrYQDwtuP79pt8GpVzJ4RBDMx1iomA@mail.gmail.com>
	<09e7b89f-27f2-1787-b371-7b0c0eff78b8@redhat.com>
	<CAFEAcA-357eVt3s_7ULWxssQttvAV0DkUv_tGkyk8umVgfH1QA@mail.gmail.com>
	<d776710c-2255-947b-22c6-336e9491bb81@redhat.com>
	<CAKv+Gu9e6qwJ4=t=UHHGsVs1XM26agh17Mgy0ckAvUsy+2xi2A@mail.gmail.com>
	<CAFEAcA9JzK8sNF5TmENfXZ-NBJwfp03b2La4YQ=N2i1ZCzrNBw@mail.gmail.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Tue, 12 Dec 2017 14:12:34 +0000
Message-ID: <CAKv+Gu_mzynBKSBSdtUhKRgNd3KmuJTwiNZpmvPCfkRDo_QCgA@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c0b::241
Subject: Re: [Qemu-devel] [PATCH 3/3] hw/arm/virt-acpi-build: Add second
 UART to ACPI tables
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Drew Jones <drjones@redhat.com>, "Jason A . Donenfeld" <Jason@zx2c4.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Andrea Bolognani <abologna@redhat.com>,
	Shannon Zhao <zhaoshenglong@huawei.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YRZ7gI1VK5B7

On 12 December 2017 at 14:10, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 12 December 2017 at 13:56, Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:
>> Given that the DEBUG output is only produced on DEBUG builds, couldn't
>> we simply stipulate that DEBUG output appears on the PL011 with the
>> lowest physical address? That keeps the current status quo, and is
>> probably sufficient for 99% of the use cases of people using the DEBUG
>> builds.
>>
>> Then, we can introduce some code to decode stdout-path in FdtClientDxe
>> (a higher level DT parsing driver) so that the actual serial console
>> gets installed onto whichever UART is described as the system console.
>> Also, given that ArmVirtQemu is tightly coupled to QEMU/mach-virt, we
>> could decide to only use node names in stdout-path (as we do
>> currently) to simplify the parsing logic.
>
> That doesn't actually usefully separate debug output from the
> console, though, because stdout-path is also going to point
> to the UART with the lowest physical address...
>

By default, yes, just like is currently the case. But I would assume
this new serial port could be appointed 'console' and put into
stdout-path by QEMU, based on the command line options?
