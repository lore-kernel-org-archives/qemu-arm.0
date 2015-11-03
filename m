Received: by 10.182.105.169 with SMTP id gn9csp1842738obb;
        Tue, 3 Nov 2015 05:33:16 -0800 (PST)
X-Received: by 10.140.237.209 with SMTP id i200mr38078456qhc.92.1446557596668;
        Tue, 03 Nov 2015 05:33:16 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 19si22237637qhq.94.2015.11.03.05.33.16
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Tue, 03 Nov 2015 05:33:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro_org.20150623.gappssmtp.com
Received: from localhost ([::1]:48400 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1Ztbi8-0002PA-A0
	for alex.bennee@linaro.org; Tue, 03 Nov 2015 08:33:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35988)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZtbhG-0001JM-2b
	for qemu-devel@nongnu.org; Tue, 03 Nov 2015 08:32:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZtbhE-00034Z-Mi
	for qemu-devel@nongnu.org; Tue, 03 Nov 2015 08:32:21 -0500
Received: from mail-vk0-x22c.google.com ([2607:f8b0:400c:c05::22c]:36090)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZtbhE-00033y-Fm
	for qemu-devel@nongnu.org; Tue, 03 Nov 2015 08:32:20 -0500
Received: by vkex70 with SMTP id x70so9112922vke.3
	for <qemu-devel@nongnu.org>; Tue, 03 Nov 2015 05:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro_org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=bpc6musgMpzIMVhAog39lSN8WleQ0Lu5U7V+4jxCTZk=;
	b=122nodopOfaHIJyGwkcK/kCBDDvx3xzWBqVnfQwi2u/E449Dyapyi2H+nax1OZme2K
	zWFPpYah0346qo26S0lSqtE2zWXbrQJsqO0boNMpge4C1evJTvKC3NoOwRzNiKRAVCW6
	zW7T1Bxs2xY+NH8B4cRmKYsMXeLo3PvgsV9lBYOJDPyLL8v8rUktJjSq+EM/F3ZcX27S
	Vrr7ZIFDxffx5oPYlc43ouOiv5hSbYIC7+JakQ220tEiu8wqRRB4usieLUFxvQpnDeFK
	iJFQ48ELodaEuS+hKot5BfaRS5kCEt4kneY+phXUdROF7d1heOr8oBj3hkfyQsLxljoc
	dK1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=bpc6musgMpzIMVhAog39lSN8WleQ0Lu5U7V+4jxCTZk=;
	b=IYayLIhRxmZmq8mwVcuTL/ZiXZF9F35d6rin+yLAk79jk/VPJSvc7FzDsR2kw4MYhv
	CrdRpzQ6BmJC4yy/glLenQTvuoB0QA2hKJvQ65g9s2BZ0V9DmW6VRFgiDmRVyaiWdl55
	hD2MXhKLb99iA4JgfMeUnO7auCVddRhzKvmnOoG+1bBBR5SnblA5EY3TgbDhhBgV2oJw
	N2kkVKj+QtMkpUIT+JuZX1GKtVC2JGZdK1n4j0zc60q2F52T+/6vy6R5/bmleAcKYaC7
	cnw++l0s6F7yOxfIbVLUHDIU3C6UymWz+cpRU42zGoUq92KUuW1+xTSLVPR12XBFaBnl
	/gVA==
X-Gm-Message-State: ALoCoQla2k8oYEOS1Dvo3XjDWz/MnCMAks5l2WWpwa2pxVZmLB4yk57ueJj7NOliBiJvFNGCVHxf
X-Received: by 10.31.131.141 with SMTP id f135mr18962097vkd.37.1446557540166; 
	Tue, 03 Nov 2015 05:32:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Tue, 3 Nov 2015 05:32:00 -0800 (PST)
In-Reply-To: <1446285001-7316-1-git-send-email-zhaoshenglong@huawei.com>
References: <1446285001-7316-1-git-send-email-zhaoshenglong@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Nov 2015 13:32:00 +0000
Message-ID: <CAFEAcA_iYvSoSaPLhXbeAdRdph2v8PAx5MQ6fQFxzY6w3LZgOQ@mail.gmail.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400c:c05::22c
Cc: Shannon Zhao <shannon.zhao@linaro.org>, qemu-arm@nongnu.org,
	QEMU Developers <qemu-devel@nongnu.org>,
	"Huangpeng \(Peter\)" <peter.huangpeng@huawei.com>
Subject: Re: [Qemu-devel] [PATCH] ARM: ACPI: Fix MPIDR value in ACPI table
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
X-TUID: nnY5wf+fMjJM

On 31 October 2015 at 09:50, Shannon Zhao <zhaoshenglong@huawei.com> wrote:
> From: Shannon Zhao <shannon.zhao@linaro.org>
>
> Use mp_affinity of ARMCPU as the CPU MPIDR instead of the CPU index.
>
> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
> ---
> This patch is based on below patch.
> http://lists.nongnu.org/archive/html/qemu-devel/2015-10/msg06919.html
>



Applied to target-arm.next, thanks.

-- PMM
