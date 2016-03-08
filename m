Received: by 10.25.208.211 with SMTP id h202csp1940225lfg;
        Tue, 8 Mar 2016 05:46:39 -0800 (PST)
X-Received: by 10.141.6.136 with SMTP id i130mr37452720qhd.21.1457444799434;
        Tue, 08 Mar 2016 05:46:39 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f125si2997029qkb.95.2016.03.08.05.46.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 08 Mar 2016 05:46:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:34684 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1adHyA-0003ic-RD
	for alex.bennee@linaro.org; Tue, 08 Mar 2016 08:46:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52752)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1adHy3-0003c6-2X
	for qemu-arm@nongnu.org; Tue, 08 Mar 2016 08:46:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1adHy2-0002O6-7K
	for qemu-arm@nongnu.org; Tue, 08 Mar 2016 08:46:31 -0500
Received: from mail-vk0-x22a.google.com ([2607:f8b0:400c:c05::22a]:36308)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1adHy2-0002N8-2e
	for qemu-arm@nongnu.org; Tue, 08 Mar 2016 08:46:30 -0500
Received: by mail-vk0-x22a.google.com with SMTP id c3so16593528vkb.3
	for <qemu-arm@nongnu.org>; Tue, 08 Mar 2016 05:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=siBrARxFV32Tbae6lvqQWstpbqsLsHOjpL2Wz46COxY=;
	b=kuJ69eaXmY5ZY+hLvlOZKfuyM+QlRTo/wIWZCw75vv9Qd89WAkgDD6KjEXQq4Fah6p
	scq/I7UU5GQXCAnU3Fzmvix2zd9ll+1nilRti3f5c4r0QhP5iVjQlJq1wXdVxxlR+4l/
	8ivCWXRtqaDliVIAxLo0vBXQzcLWTiC7KhP8Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=siBrARxFV32Tbae6lvqQWstpbqsLsHOjpL2Wz46COxY=;
	b=BE7T0CJdUcaVP98lPL2UCTmVO+y34mAI7uen52bshjOGA6yFLHq8/y5gSU0kM3LwHX
	h87und7XFSjin3PCXyUE9Cy+oRYyFcfiVZiMgQKdgYEJGg1k8nAIFt8eFGx2G1xgNnPh
	GXNplnW3+c9YRnX7CVa4T/DEbL1wbr4UQPmANW6DCQ/kPs6jwU1ZPE1+QQ4WyDUEF9Kd
	zraY9tW+mDVF1fJDC7NkOj7BzsQH9hgwGm60kNp05UFiBAxih0HxN1kfm21L361mEDbJ
	WumXMnUxG03ELEoAgAdMGH5QHBzGVLovfQ/tJN65jCD5kNmq4QtitNKdUTO8J7iiCSFK
	Lrog==
X-Gm-Message-State: AD7BkJJD3tizLAE/PTipmCdaZFPYsQ4bBMWURg9/KA7nl2nATGclG7OYUF/Jp4tWXU2Z56DbuZAhi+qE5zTovzDs
X-Received: by 10.31.8.210 with SMTP id 201mr26394227vki.90.1457444789232;
	Tue, 08 Mar 2016 05:46:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Tue, 8 Mar 2016 05:46:09 -0800 (PST)
In-Reply-To: <56DECE5F.6000207@redhat.com>
References: <1455288361-30117-1-git-send-email-peter.maydell@linaro.org>
	<56DD9C58.7050306@redhat.com>
	<CAFEAcA8C2VzkD=87W5Jn7X523cFZLZL6onxjKDoOcZsCPMQxZw@mail.gmail.com>
	<56DEBF6A.6070809@redhat.com>
	<CAKv+Gu9LzTTzdw5CSCDfpCyjSgB2h6+KawTTJQXSqJ7mhV_YdQ@mail.gmail.com>
	<CAKv+Gu8OgSK5+X71GLrvWLkcGcQ9=MuwOuFAsQroQTa3bWbHNA@mail.gmail.com>
	<56DEC234.70907@redhat.com>
	<CAKv+Gu-joM8MqtM=G_F7NLZEwpxLBMPeqimDwZv7yivTjYBFVQ@mail.gmail.com>
	<56DEC860.1060707@redhat.com>
	<CAKv+Gu91CH9WURYaLFtP7HHEm7Z18FMk19HXEWaj1=LBqM6mCQ@mail.gmail.com>
	<56DECE5F.6000207@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Mar 2016 20:46:09 +0700
Message-ID: <CAFEAcA_sN+Rs=o5d6HnhFgpw+1pxg7oJmfBiygeca6JeCu7xEA@mail.gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22a
Cc: Markus Armbruster <armbru@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>
Subject: Re: [Qemu-arm] [PATCH 0/4] virt: provide secure-only RAM and first
	flash
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
X-TUID: S4RRW8o/i3Je

On 8 March 2016 at 20:06, Paolo Bonzini <pbonzini@redhat.com> wrote:
>  I cannot think of a good reason for hardware not to let you virtualize
> hypervisor or secure mode

Regardless of whether you can think of a good reason or not,
it doesn't let you do it...

thanks
-- PMM
