Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp797991wrq;
        Wed, 20 Jun 2018 06:57:32 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKUn0cgLv7vVZIZr0mWxo0KPtJW8+L8v/fkfnrK11E8DTi4GM38IDww5bodCb3iUcyUij9J
X-Received: by 2002:a37:a8ce:: with SMTP id r197-v6mr17249540qke.93.1529503052608;
        Wed, 20 Jun 2018 06:57:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529503052; cv=none;
        d=google.com; s=arc-20160816;
        b=zgXcxGF592EIZLN+jDR262PZ9wgK0wmzY8jvKA17cfToOrK+SNRUo4rS1U5Hbkqq2/
         hZWHnuQ0SUc5LzVQjk/8tWGVb8P+Qpo6ZhUX0H5N9X+1Dyj7rVUOUMCDjp22mNvHumBk
         WC7lHci3qERyBhvDXuUxJxWZmLIbo2aSN3BvhD9VoTVAZ7GGhURs3JXc7O+vgNVBp3ea
         gRywihFnHoFG+jNj97dKgGpij/0UAwtEJ/WSXGJVs76Je7IQS4K8fVU/DkBw7QydDgt8
         0fNl0qI7M2xudP1wCi0nBnqaqQSQ1ToZhJuS2QTIGtPsPZ813xYYiXhI6YqVHB7zeqOK
         D+3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=zKSNyN6wEtiq7PnriE6xznYrF7LN8MCv+Ubi1/MG5sA=;
        b=peJWtEmdqrNRkG/3cA7xodh2J6Zpu+hlLyehOFmhiMWJcVtEyR8P/iB7XM+PvvpVNO
         OZGc79Myjwn83u7/cNvUftcbXZzibrSKjzw2ZbDC2HLx7f3UXw1/6m6N06myzrmwmAT5
         Jfk3EKVqfdtjWINKpS9cW+qHgoESONNR5Ja1sbrZg4XpsCGATmTUnZrD87EYlIgrqZah
         0u5EVgEhdNf2zCw6Q33mApO59USvA6twnwjMbaKTQCx/4C7JW01IkkiufGlywH+7Ar4+
         lnxwYnXxsDUoeAmuw6iJ7DX1F29wN9ji98sAlL8/6ZikRelvAD76CPf/fGqIhaYDEQJn
         1R6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jBFA3Qm3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h13-v6si1294415qkm.243.2018.06.20.06.57.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Jun 2018 06:57:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jBFA3Qm3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49850 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fVdc4-00017M-6d
	for alex.bennee@linaro.org; Wed, 20 Jun 2018 09:57:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36206)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fVdbu-00017C-UQ
	for qemu-arm@nongnu.org; Wed, 20 Jun 2018 09:57:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fVdbu-0000dt-7M
	for qemu-arm@nongnu.org; Wed, 20 Jun 2018 09:57:23 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:33408)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fVdbu-0000dd-1h
	for qemu-arm@nongnu.org; Wed, 20 Jun 2018 09:57:22 -0400
Received: by mail-oi0-x244.google.com with SMTP id c6-v6so3107556oiy.0
	for <qemu-arm@nongnu.org>; Wed, 20 Jun 2018 06:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zKSNyN6wEtiq7PnriE6xznYrF7LN8MCv+Ubi1/MG5sA=;
	b=jBFA3Qm3Tb5r6wPGilo8NAIfrlaZnCxBmlOje2u5Rmuw2kVTW64h9bntxo5UuidAfz
	K8acPYDxlgZqYHrS2rUfgBcpS7KIh/EnNDQCSCW03hx847ICe8a6uhdJ3h/5cgHtVa9s
	O2iusyVYLT7cqjrSvfkEoHKa3BBS6VWEYO6FE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zKSNyN6wEtiq7PnriE6xznYrF7LN8MCv+Ubi1/MG5sA=;
	b=evQK9HxnnTPQ+A82Z5AQurgh5LCzCHS1kcy8d7gaXJVFBLl04AE2pds8Je8qVNRVpM
	VHMzs0zMUWxEFwAVkhxkvpjMMaTWWehRZPGk459QJaTtJ1Oz5DGIQcAOXm3Lmgu14Vqd
	wp6P5kgn65DTZv8EWwgo/rBswa5aYjAKX3ELnKBRS9m36DgvmSaUFaztpHqqd6c3C8/x
	e1pbM+hbKCfcfDGei88x+fOvEc9CB2W7mmIinN/4gtxB3h1WCRChkvtYHuVHGkLEgMWL
	xTctSKb7a9+TO/6cSDZc8hqhCMNIZs+0RsZirKf1Xzasr1Fx5p8Q9xeQT6TWXFkX8NUf
	Wwsg==
X-Gm-Message-State: APt69E3fCmeML6MxXen4FIVOkhzfIsh0vxLpgTVDQGJpn0SjKns4phZj
	1JqTIwGjjLSeB6n3wHeRAfWQNvJKCf168H00qIIDIA==
X-Received: by 2002:aca:d4c7:: with SMTP id
	l190-v6mr12538329oig.102.1529503041303; 
	Wed, 20 Jun 2018 06:57:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Wed, 20 Jun 2018 06:57:00
	-0700 (PDT)
In-Reply-To: <1529072910-16156-2-git-send-email-eric.auger@redhat.com>
References: <1529072910-16156-1-git-send-email-eric.auger@redhat.com>
	<1529072910-16156-2-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 20 Jun 2018 14:57:00 +0100
Message-ID: <CAFEAcA-wS9oy1JSgpwrCZie9GQaKLOf2wQxZOUtaLfw+HGP_GA@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-arm] [PATCH v2 01/11] linux-headers: Update to 4.18-rc0
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
Cc: Andrew Jones <drjones@redhat.com>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	Marc Zyngier <marc.zyngier@arm.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Christoffer Dall <christoffer.dall@arm.com>,
	qemu-arm <qemu-arm@nongnu.org>, Shannon Zhao <zhaoshenglong@huawei.com>,
	Laszlo Ersek <lersek@redhat.com>, Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: G5j86M+jN/ef

On 15 June 2018 at 15:28, Eric Auger <eric.auger@redhat.com> wrote:
> commit b357bf6023a948cf6a9472f07a1b0caac0e4f8e8
> Merge tag 'for-linus' of git://git.kernel.org/pub/scm/virt/kvm/kvm
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

What's 4.18-rc0? The upstream kernel doesn't have a tag by that
name and looking at the Makefile the last thing before 4.18-rc1
was 4.17.

Still, since it is a commit on mainline I guess we're fine?

thanks
-- PMM
