Received: by 10.25.208.211 with SMTP id h202csp2755893lfg;
        Thu, 3 Mar 2016 07:28:16 -0800 (PST)
X-Received: by 10.140.94.106 with SMTP id f97mr3682033qge.95.1457018896433;
        Thu, 03 Mar 2016 07:28:16 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x143si4219558qka.122.2016.03.03.07.28.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Mar 2016 07:28:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:35793 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1abVAl-0008SB-Vb
	for alex.bennee@linaro.org; Thu, 03 Mar 2016 10:28:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51881)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1abVAi-0008Mn-Cv
	for qemu-arm@nongnu.org; Thu, 03 Mar 2016 10:28:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1abVAY-0006wd-Fc
	for qemu-arm@nongnu.org; Thu, 03 Mar 2016 10:28:08 -0500
Received: from mail-vk0-x230.google.com ([2607:f8b0:400c:c05::230]:36833)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1abVAX-0006wU-Vg
	for qemu-arm@nongnu.org; Thu, 03 Mar 2016 10:28:02 -0500
Received: by mail-vk0-x230.google.com with SMTP id c3so24702500vkb.3
	for <qemu-arm@nongnu.org>; Thu, 03 Mar 2016 07:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tg5cO5R/Fz0k9AUBRKjv6Vhk9e528CMCIucPXDGGRrE=;
	b=e0S+8NOq0T2nU6I1YTtBpxCzg6RUCEdL3QWYokhR1Om6Ab4sgfvIT9Osx8plV6XW0d
	wQG4xeWmwM4mhaUZquz7naeIG1VQjGZ+q/Yw3wAnujAFf94lEkGgqJWIsNxS4dr0x+hM
	mlKcVE24CyfUKCM3R8U/GMctvpLHSdJwEjHjE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tg5cO5R/Fz0k9AUBRKjv6Vhk9e528CMCIucPXDGGRrE=;
	b=eGblAwZcEo1vuSPCK/OoAo6nirJz4HykU8pKavMdASDD6eSnYXGCrKPgOpDVuwq4sx
	VH8zMXDjeCXT9SJGV2TYRfVbzbTs7ycrhW6pE3BHleJCTaw3a2xEXPg5PfrdaUPK5C9W
	pjn1k2fFv/KA2jH9Dmhd7XzwqHBLx3ZfCXa7vaowmvToZAk0I0yGmrLaLvs/90tdkiK3
	0JxJSTmfUrYtOezPFCJkRdWpoESDN1qgK6okmTcf5Wn8Lhka+XJKAcXEpcmGMCbrlQyN
	i/5lDsz+GqbDETYaWFLCvZ6S+naFPirfXjhege9TACx6EPMwDhmWLGy+xYvvXbbwPa8W
	bmPA==
X-Gm-Message-State: AD7BkJLcAfu5221DaiAy6+WkwV9eJhLbogBBVNlK9nheS/TMj40NpZzrUEOHwpxlSnr5WeuSOfqPtEYNzsR7yZcn
X-Received: by 10.31.8.210 with SMTP id 201mr2462077vki.90.1457018881611; Thu,
	03 Mar 2016 07:28:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Thu, 3 Mar 2016 07:27:42 -0800 (PST)
In-Reply-To: <130944d3702e4184b48ff43096aabfeb24f0bdf3.1456901522.git.crosthwaite.peter@gmail.com>
References: <cover.1456901522.git.crosthwaite.peter@gmail.com>
	<130944d3702e4184b48ff43096aabfeb24f0bdf3.1456901522.git.crosthwaite.peter@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Mar 2016 15:27:42 +0000
Message-ID: <CAFEAcA9oqKy3Hg=msxZcvVme2T3cL5+zL=_Fq4TDMcPNNRjCoA@mail.gmail.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::230
Cc: Stefan Weil <sw@weilnetz.de>, QEMU Developers <qemu-devel@nongnu.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	sridhar kulkarni <sridhar_kulk@yahoo.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Piotr_Kr=C3=B3l?= <piotr.krol@3mdeb.com>
Subject: Re: [Qemu-arm] [PATCH v2 14/18] target-arm: implement BE32 mode in
	system emulation
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
X-TUID: BsQigAv9INAv

On 2 March 2016 at 06:56, Peter Crosthwaite <crosthwaitepeter@gmail.com> wrote:
> From: Paolo Bonzini <pbonzini@redhat.com>
>
> System emulation only has a little-endian target; BE32 mode
> is implemented by adjusting the low bits of the address
> for every byte and halfword load and store.  64-bit accesses
> flip the low and high words.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> [PC changes:
>   * rebased against master (Jan 2016)
> ]
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
> ---
> fix ld/st copy-paste error (PMM review)

This mail didn't make it to qemu-devel for some reason...
(maybe the spam filters caught it ? :-( )

-- PMM
