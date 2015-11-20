Received: by 10.182.158.201 with SMTP id ww9csp9595obb;
        Fri, 20 Nov 2015 10:22:40 -0800 (PST)
X-Received: by 10.31.12.77 with SMTP id 74mr749151vkm.28.1448043760173;
        Fri, 20 Nov 2015 10:22:40 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b8si687362vkf.47.2015.11.20.10.22.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 20 Nov 2015 10:22:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro-org.20150623.gappssmtp.com
Received: from localhost ([::1]:49215 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZzqKV-00068x-NX
	for alex.bennee@linaro.org; Fri, 20 Nov 2015 13:22:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59253)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZzqIZ-0002yJ-41
	for qemu-devel@nongnu.org; Fri, 20 Nov 2015 13:20:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZzqIY-0005we-9j
	for qemu-devel@nongnu.org; Fri, 20 Nov 2015 13:20:39 -0500
Received: from mail-vk0-x22a.google.com ([2607:f8b0:400c:c05::22a]:35409)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZzqIY-0005wG-0y
	for qemu-devel@nongnu.org; Fri, 20 Nov 2015 13:20:38 -0500
Received: by vkha189 with SMTP id a189so3022081vkh.2
	for <qemu-devel@nongnu.org>; Fri, 20 Nov 2015 10:20:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro-org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=TGmhebuppM1pvk/JtOdStlS2C4ByIVc6bsvDfTmrNjU=;
	b=jYfZxG1cqWZ80hXmqhD1WPEVjtex5QfUM3vQlhS5WGuUpGrszoDDLx7mA4o5+9ueYi
	vcVU5/k6rnrUXrPcIAMAPVm/iGWCUq/bNhzkn+Lmh0kjdm2b3mJBAUpX2/qp7Jz9IUlI
	NxjzMYgEfhAd7GQEGQsaj60b9GCeUDD8B8NFMFXPrtVI6c0VAntBY4NIYYXishkyB+8l
	uQs9ObFHIQLi1YguzZM/en+NGXRBlJnZ7V/UDF2pDPmpYNde8hmApuEpBK9R6QtJ0LdR
	i/CD3ti7L7l/uA49GW4ivQLkq6qvGKpV/sJbPreI8x4oPBZK+wm8Do/fIXjwgRuP330Z
	+6cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=TGmhebuppM1pvk/JtOdStlS2C4ByIVc6bsvDfTmrNjU=;
	b=RMJE4zRZaDtejspRUhliy5QhvIZQMxpWHgfzfS35Tb0KLl4At2H9oQrvA7SV2XTIhA
	Q10ikejoEwFCsmcMy0TfJ3ygyqYyZm+sDNbbY1B5RXsbvAyULUQ3inh+SQv+KCreTZu8
	NbvwIwBfZDL3Rp5lSBJ7Go+/YWmxc449/CaMpyenvmf11iFlzkCnNEcVXzPKgFoXqImj
	eINf1amxP9TFBcMc6Xn8AjmucU4Zo11vRaDx/FyCZ+1kEHO9PW56VKqSKbhRHmFAzI+S
	eUOk77okOpB/7G+DfUsnyHHo/gqitBcNnH4r6CZR094UBOG9VjvbfzTQRDWgSGvKQYMy
	ojuw==
X-Gm-Message-State: ALoCoQle37DgbmUEpx63v7KnS76yQK32II11WkPKA4VtbtwKH0DE3f25hkSUJHSY8mOgBT2DD77M
X-Received: by 10.31.194.201 with SMTP id s192mr760129vkf.92.1448043637255;
	Fri, 20 Nov 2015 10:20:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Fri, 20 Nov 2015 10:20:17 -0800 (PST)
In-Reply-To: <1447944817-13286-3-git-send-email-drjones@redhat.com>
References: <1447944817-13286-1-git-send-email-drjones@redhat.com>
	<1447944817-13286-3-git-send-email-drjones@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Nov 2015 18:20:17 +0000
Message-ID: <CAFEAcA_588RmW5n27CGOLv4P_XgaoUB-9G58iF=k5P7pG0VC7g@mail.gmail.com>
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400c:c05::22a
Cc: Markus Armbruster <armbru@redhat.com>, Alexander Graf <agraf@suse.de>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm@nongnu.org,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-devel] [PATCH 2/5] dump: qemunotes aren't commonly needed
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 2xKAiYse4Ml+

On 19 November 2015 at 14:53, Andrew Jones <drjones@redhat.com> wrote:
> Only one of three architectures implementing qmp-dump-guest-memory write
> qemu notes. And, another architecture (arm/aarch64) is coming, which
> won't use them either. Make the common implementation truly common.
>
> (No functional change.)
>
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
