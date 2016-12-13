Received: by 10.25.205.13 with SMTP id d13csp2177605lfg;
        Tue, 13 Dec 2016 04:45:54 -0800 (PST)
X-Received: by 10.55.188.198 with SMTP id m189mr80784359qkf.248.1481633154153;
        Tue, 13 Dec 2016 04:45:54 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id h94si28083819qtd.16.2016.12.13.04.45.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Dec 2016 04:45:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37909 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cGmSt-0002Me-Jt
	for alex.bennee@linaro.org; Tue, 13 Dec 2016 07:45:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57240)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cGmRB-0001Xq-Ra
	for qemu-devel@nongnu.org; Tue, 13 Dec 2016 07:44:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cGmR7-0007G6-IH
	for qemu-devel@nongnu.org; Tue, 13 Dec 2016 07:44:05 -0500
Received: from mail-vk0-f47.google.com ([209.85.213.47]:35907)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cGmR7-0007Fx-DD
	for qemu-devel@nongnu.org; Tue, 13 Dec 2016 07:44:01 -0500
Received: by mail-vk0-f47.google.com with SMTP id p9so59101228vkd.3
	for <qemu-devel@nongnu.org>; Tue, 13 Dec 2016 04:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=a+hE+7s0y/YCG7rop2cX7h1qk6mbSJI8KKoPs0vzjwc=;
	b=Xc6w2M7KxKyDqJ2gwgtrq4b9Cyseo+vPkGgNrabqwcDT0Mi1qg7X77SMbPQKZm+egM
	gaSw2oXVfjW5tMPOAVTOkd81giE3sGPdhjlIgHqPeKyQZUp2m0BtBSK0jka6Tb8oLmSi
	GVJW23FMjh4zILjbqZTDxApEG/fhwMKmVub9w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=a+hE+7s0y/YCG7rop2cX7h1qk6mbSJI8KKoPs0vzjwc=;
	b=HI4epgouTGoyusQcSNehPF55+fOnIeFpR0rI/JtbL9HzBF8Q4w4M2vMdn8nzykdlkK
	NL9LvT/FuYIh0NyBLRbxIzlsAjyFs9fBIpT3bSCn/2/nxYPPhiBr/D7xMrzlTBQ2GfWe
	U44XNA5CEfpjFDGZ1mdCAaTZ96yid3YG7TfDoEl8JfcbQzmtv8LrhfT1Vryz0FyCu98N
	0qZuayU+xTziWxDhdZh952q6MpI374me6+DCirUaCmMuFKfEXKj+0gYhAjOGWrBe+5Cu
	0TOuY602OEBa/rPff5OCaCMzE0dwxNFMNyq8F6Sa2Et1hBIJUTbpHtZRoR9XjstOhYoT
	n++A==
X-Gm-Message-State: AKaTC03wgRUcSHcBbZ1HR5+y1YzkVQeveZxrObwNIZJOpC1/ZecO2X6s7x0bmC6YXCC8ckjk4QznoAt6T7Pju4d9
X-Received: by 10.31.75.198 with SMTP id y189mr33703223vka.51.1481632980581;
	Tue, 13 Dec 2016 04:43:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.176.14 with HTTP; Tue, 13 Dec 2016 04:42:40 -0800 (PST)
In-Reply-To: <1481085020-2614-1-git-send-email-rth@twiddle.net>
References: <1481085020-2614-1-git-send-email-rth@twiddle.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Dec 2016 12:42:40 +0000
Message-ID: <CAFEAcA-NNVttaOdBivqsZYDhK_hkfQwOjXH-ZDM31bZO4bFkew@mail.gmail.com>
To: Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.213.47
Subject: Re: [Qemu-devel] [PATCH 0/2] target-arm aarch64 big-endian fixes
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: K77KID8LbX0W

On 7 December 2016 at 04:30, Richard Henderson <rth@twiddle.net> wrote:
> I ran Alex's risu tests on an s390x host, and ran into two
> problems not related to the s390 backend.
>
>
> r~
>
>
> Richard Henderson (2):
>   target-arm: Fix aarch64 disas_ldst_single_struct
>   target-arm: Fix aarch64 vec_reg_offset
>
>  target-arm/translate-a64.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)



Applied to target-arm.next for 2.9, thanks.

-- PMM
