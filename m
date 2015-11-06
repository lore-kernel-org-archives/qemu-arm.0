Received: by 10.182.105.169 with SMTP id gn9csp1111655obb;
        Fri, 6 Nov 2015 06:55:15 -0800 (PST)
X-Received: by 10.31.47.207 with SMTP id v198mr13553940vkv.145.1446821715344;
        Fri, 06 Nov 2015 06:55:15 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g37si433081vki.103.2015.11.06.06.55.15
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Fri, 06 Nov 2015 06:55:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro_org.20150623.gappssmtp.com
Received: from localhost ([::1]:39204 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZuiQ7-0004C3-2D
	for alex.bennee@linaro.org; Fri, 06 Nov 2015 09:55:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38266)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZuiQ5-0004Bu-Jf
	for qemu-arm@nongnu.org; Fri, 06 Nov 2015 09:55:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZuiQ4-00064K-QZ
	for qemu-arm@nongnu.org; Fri, 06 Nov 2015 09:55:13 -0500
Received: from mail-vk0-x235.google.com ([2607:f8b0:400c:c05::235]:36758)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZuiQ4-00063z-MP
	for qemu-arm@nongnu.org; Fri, 06 Nov 2015 09:55:12 -0500
Received: by vkex70 with SMTP id x70so15504634vke.3
	for <qemu-arm@nongnu.org>; Fri, 06 Nov 2015 06:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro_org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=aggxHrytrCg4/+tNt64uS0Q9boi0/WZ7cZr8gJweK84=;
	b=ljHDpVjSqk4rr89VjSBqU5SVxNyyLdYiGBbVrePex3Tyg2H0TZSgPQW3j48KAyTs71
	OgUOH4tWZJhaYY7FnLRgKi3yZ5k4bjLULX9uWZfmnOrR0+loJI6IVxie44RGhMn9H6HL
	m3hIycygoFWiEzGE9d8ZbJIDSFoX6vHKLNp0dWq2eHk4S7mfu/fYKkrNTwHWFmEY25EG
	BZeV8n+ER3W159su7CGaHsiD1NRXGwQDJbQhqRz0Dwmar3Y1sv7jV6XpS5mwzihgDmEE
	I9eJtBvNyl/OIkG8aGVbYMvSk+bGQal/bpupP48HOUs1pCMDdPAXK4bmskB1Gv9KYCS8
	+C9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=aggxHrytrCg4/+tNt64uS0Q9boi0/WZ7cZr8gJweK84=;
	b=jzDh+NGQcU9kqjB5ljLi2Xg8uQWF2LX8fzlhcpOgd+eK+Pwqdz9n229HkG6QE9EwIQ
	nvvSSAcvS9+W8B6aS8ZmA9b+E6DmErjCoSG+fG24W9YC+F5kJlKVS3s3x7m+B71QpwZ2
	W1VdpwpmgYnpwYbh/hB00Cc6+oDQUAE6/R3sUOBN2FO4DeAj6Ne6Oi7pZGfznKEdCXjW
	YeSfoPhRba0p4Rx65+9HEZ/8QSvV7+AbrglZw2XOh9bA8gQW8otlJSCGS7dEN3EeHcwf
	HSC6n/vtV7UrIU4S9ESrvqk0seUqMIeKAl7SGB8k6OGCjF8KTDpm4sGNlw1/knr2ozUt
	0PKg==
X-Gm-Message-State: ALoCoQmycBS2j4608k6DmcBEptPi/xLeKDGxnpvL8la7ueEX0mjbzsrtySWleUzdzy822lAruZZk
X-Received: by 10.31.161.146 with SMTP id k140mr13864987vke.90.1446821712294; 
	Fri, 06 Nov 2015 06:55:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Fri, 6 Nov 2015 06:54:52 -0800 (PST)
In-Reply-To: <1446744293-32365-1-git-send-email-wei@redhat.com>
References: <1446744293-32365-1-git-send-email-wei@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Nov 2015 14:54:52 +0000
Message-ID: <CAFEAcA8FiEj=h_Z3NafSvnWv3aOvbLW3OTGAWYAUwZuDxWh6CA@mail.gmail.com>
To: Wei Huang <wei@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400c:c05::235
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm@nongnu.org,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH Trivial V2] hw/intc/arm_gic: Remove the
	definition of NUM_CPU
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
X-TUID: 2Ws9wulSOdXf

On 5 November 2015 at 17:24, Wei Huang <wei@redhat.com> wrote:
> arm_gic.c retrieves CPU number using either NUM_CPU(s) or s->num_cpu.
> Such mixed-uses make source code inconsistent. This patch removes
> NUM_CPU(s), which was defined for MPCore tweak long ago, and instead
> favors s->num_cpu. The source is more consistent after this small tweak.
>
> Reviewed-by: Andreas F=C3=A4rber <afaerber@suse.de>
> Signed-off-by: Wei Huang <wei@redhat.com>

Thanks, applied to target-arm.next.

-- PMM
