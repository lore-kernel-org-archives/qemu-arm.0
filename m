Received: by 10.182.158.201 with SMTP id ww9csp495769obb;
        Fri, 20 Nov 2015 06:01:23 -0800 (PST)
X-Received: by 10.13.204.198 with SMTP id o189mr12902887ywd.288.1448028079180;
        Fri, 20 Nov 2015 06:01:19 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s187si8858302ywg.32.2015.11.20.06.01.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 20 Nov 2015 06:01:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro-org.20150623.gappssmtp.com
Received: from localhost ([::1]:47528 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZzmFa-0004ys-NN
	for alex.bennee@linaro.org; Fri, 20 Nov 2015 09:01:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45886)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZzmEf-0003zl-UA
	for qemu-devel@nongnu.org; Fri, 20 Nov 2015 09:00:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZzmEb-0000YK-0H
	for qemu-devel@nongnu.org; Fri, 20 Nov 2015 09:00:21 -0500
Received: from mail-yk0-x22e.google.com ([2607:f8b0:4002:c07::22e]:34285)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZzmEa-0000YA-FW
	for qemu-devel@nongnu.org; Fri, 20 Nov 2015 09:00:16 -0500
Received: by ykfs79 with SMTP id s79so163585778ykf.1
	for <qemu-devel@nongnu.org>; Fri, 20 Nov 2015 06:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro-org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=hXQ5E/LRjqtWlQpCOvZbm3YpfUqWS1Z9tzPCnGgLLVc=;
	b=s3sJsdHZWavXcgtrrRl4+K3nNRMLGq/lAPoIfQaUu1hM9klEEq1/c36A29wGx1jAjK
	ztwPu6/rL8etT5+tSD9gfyC0bUmx5Lgplqz8lEWDauOmNVyVGAig4sR5PE9FL7ILuBaT
	wwdZRmFol4x+oW+OEDDUE87qLPf+tX3+RdguYGUHslDhplorFrroaFJEAh7Lw14ZuWC+
	WxsFUgYg2EUVTdw1vzU3C+M+KrRyYZF7gYyEQGyAm3UWPSv9uudx/0miFniBX0crsEAF
	PiU856AlU+dajDheRQxa/7YBAlvjQoD3YlJFaO/CxhpbSRuMrDN0YKSF1uxy1P5ZcE0y
	eNlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=hXQ5E/LRjqtWlQpCOvZbm3YpfUqWS1Z9tzPCnGgLLVc=;
	b=Y2mXtRDcEqJmYQSugAjLrModfHebFM9B2ZKy/YAOqbggz20F7uOeVVFvVVa2u2iVdd
	9ho5mmREAn5lY0YE2H8LhhwaH/mnjfbgFu4kE5WwNGK9k7bI5IaAuZtxc1wwL68m55y0
	gO4I/7oPqmnpA4SvmA2Haunrfclj0rtS+kvivZZj99HNguID50f0LaCE0n0Z9AeEo1Ll
	rN5+CbgqGV60n6JzTtk+cfTTU+/Ul1EkfFHokjuxVhNNoKyCM2/gIHOe0IHGu/HkXrO1
	+wl/f/v1XpKt2U2v3PZ0NCn+iEYq9bqhcZYuZuHrJWicfRYNXP677M/dny1DkK7JoLIP
	A4Jg==
X-Gm-Message-State: ALoCoQk8E7CszxZSw5mB6eaM0Wzubvi8TP+Ucdqptqu+ZhobY1I2D0YcCVR7cxQe8F5X9Uy2ETQJ
X-Received: by 10.13.235.135 with SMTP id u129mr14320607ywe.48.1448028016016; 
	Fri, 20 Nov 2015 06:00:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Fri, 20 Nov 2015 05:59:56 -0800 (PST)
In-Reply-To: <CAFEAcA-WerwObfwekpnRbfpcsUdkvV3Gqxr+krfiSJAFP-CxAw@mail.gmail.com>
References: <1447031505-12477-1-git-send-email-mdavidsaver@gmail.com>
	<CAFEAcA-WerwObfwekpnRbfpcsUdkvV3Gqxr+krfiSJAFP-CxAw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Nov 2015 13:59:56 +0000
Message-ID: <CAFEAcA-_g4BD-A6qka5iKFNufLO-=nzGjDHHEdf6opZ_afGPNA@mail.gmail.com>
To: Michael Davidsaver <mdavidsaver@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4002:c07::22e
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>, qemu-arm@nongnu.org,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-devel] [PATCH 00/18] Fix exception handling and msr/mrs
	access
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
X-TUID: NBt/yD5Keoxd

On 17 November 2015 at 17:07, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 9 November 2015 at 01:11, Michael Davidsaver <mdavidsaver@gmail.com> wrote:
>> This series grew from a previous incorrect patch attempting to fix
>> some incorrect behavior.  After spending some time going through the
>> arch. ref. manual for v7-M I think I understand better how this should
>> work and have made a number of changes which actually improve the situation.
>>
>> These changes have not yet been cross checked against real hardware, and
>> I therefore don't consider them mergeable.  It's gotten big enough though
>> that I'd like to get some feedback.

> I'll reply to the various patches individually with comments.

I think I've now done that at least for the earlier patches.
There are probably some other finer details that I'll get to
in a later round of patch review but hopefully you have enough
to do some of the fixes and restructuring of this patchset for v2.

I think the most important thing here is getting the structure
of the changes into patches right so they're easy to review.
The general principles here are:
 * each patch should aim to be self-contained and to do one thing,
   not several things (for instance, avoid making several bug fixes
   in one patch, avoid putting "restructure/refactor code" and
   "add new feature" in the same patch, and so on)
 * at each point in the patch series QEMU needs to still compile
   and run (this is particularly important to allow bisection
   of bugs later on where people will want to be able to narrow
   down which commit introduced a bug)
If the structure of the patchset is right it should be fairly
easy to review your improvements against the architecture manual.

thanks
-- PMM
