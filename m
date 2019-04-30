Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp4822205wrh;
        Tue, 30 Apr 2019 07:54:59 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwoz54yqoXjp5RIqPYfmqJ/zx4KPpA+ZOb3hvsmvTsCUbrOsjHO1uVgnEANBoQ6qIu7jOfo
X-Received: by 2002:a1c:f311:: with SMTP id q17mr3510617wmq.144.1556636099263;
        Tue, 30 Apr 2019 07:54:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556636099; cv=none;
        d=google.com; s=arc-20160816;
        b=vP3oDKz+a3YwqBZMl3N5btDT6UVMfds9NVxtQ/GqA0xl2VDNO0dzwh0vxBZwNRNlZZ
         ygbBHbp4oS00mWz0tbvvpSrLGpY5I6hj+iUOsWmeoLfr3MFPRpG9XzRO4rWhCtER5wsy
         H9Ov9G0tUKxRI4j+iwv+ldYucelkYRDesje1XqkiHSTxISQQLDFzKbk3432RBBmvzAd6
         roBKLHCOgZDt8DOIwsqmyGpU1sd2t5f7ddvN3KAr3nfMAcLCdxjETsvgiEWvwxdetZoh
         4v+QyRgf6N/nsei9OwEkrr+zCbhjNRiPXWML8Rznqa+qxk0M27/Z5kmTg3DQC7jPH5LM
         lpcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=fe85NQgEPctR6hv2f5PevigENLCdm3EecXi182qnPXU=;
        b=euYdnds4FfbP5gLJ0gwYM3xA27S6/Z5aNrlzMZ8/7jaOjCMcS0nyRlO8zCBgEumZIi
         9lE3zC++8pyOYEnBDPvvQSPG6iuriSH4eWl8dNs1nLR8BqwtGEmGgWi4RBR8lhgHPT87
         WsP3tVS5O9SeTiMWfR47nchDsFxgZYRsVLrZTquSU+a26JdYXJk08qFK2/dJxCY7NQZz
         ZhHjfqkt45SPfRsKpkSkNGUIhPf1zkY3XvJ5qXM8yKQAhtOP7cHF63u9fGym/XAWX8M1
         VDak7XDixK7S5qJDDq7LZNFZAtkDKP6K7hlaOFdzMpZiweL5LHPHEamVhVT+xcQWYBcW
         UsIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hWbr2UEw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t7si1739667wmg.51.2019.04.30.07.54.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 Apr 2019 07:54:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hWbr2UEw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:48223 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hLU9q-0003vr-AY
	for alex.bennee@linaro.org; Tue, 30 Apr 2019 10:54:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36501)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hLU9L-0003jL-68
	for qemu-arm@nongnu.org; Tue, 30 Apr 2019 10:54:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hLU9K-0006gV-3E
	for qemu-arm@nongnu.org; Tue, 30 Apr 2019 10:54:27 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:32873)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hLU9J-0006fg-Ta
	for qemu-arm@nongnu.org; Tue, 30 Apr 2019 10:54:26 -0400
Received: by mail-ot1-x343.google.com with SMTP id s11so7848126otp.0
	for <qemu-arm@nongnu.org>; Tue, 30 Apr 2019 07:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=fe85NQgEPctR6hv2f5PevigENLCdm3EecXi182qnPXU=;
	b=hWbr2UEwlPDxRYKoul08cAXoJieeE/SaHGI35AdZPLWaYdLKvEvDwRwUFO61V1NArn
	wEYjbRQcN3GcKh9XUqy9RkkVZPC/IGndiDCgiM9GJbECpqoUPjuIHUTpnLcbxuZwPmLK
	UTk9ZG8L7KrcMLb5N9YuWyWKb6AcFcbO05OjK02xF+kofSY7qUw8Yn6v4kNngplMztHJ
	6ycq+3GXXONk68WwLdJNeaHf689A3CYyvyE2jp36N5vFOKYGhG8l0Q508nqVwnYAhywr
	oRFH2BsQOaEhkamdOdHYwkXfjQ7ScXBvQXw3CIJtnvsPia4gBFfDL5S9iO2Y2m90gTk8
	XHxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=fe85NQgEPctR6hv2f5PevigENLCdm3EecXi182qnPXU=;
	b=CJd1RRL+ClJgweRRcLvwmUaCtQ2ZX8ucmNNtJyBLSGmmAh7Z1cnkF1UGmAkURgslSk
	4XqQoN+m5klKoDxNIoBmrDbHw4mRePP2niBAP6bBBjp6VtTehRB+1trQCWhjJL9Q+UQg
	iPZ/ms+uI20CgZu6jJ/+1gYL0pVCKzjLXARAzajqWNVtIjS2CaNR5VH+KfPJEa2z01Ob
	8nTZm5P6U5pljgxVSxgchYUTr36ephVxgfXtw3KpnSaTFssa5zb/3Q4ZMCqvUQbWsYF9
	lpde9ZgKOzJxi9VipMDmYMQWefYXh4mn+Dx6gQIBlM/OJpV/yTPnd4cCyumljf5/Jodb
	PHdw==
X-Gm-Message-State: APjAAAXpE2KhMfprI/femlSkiMD+Dwb/dmZPX4U/mCn56KC1nopMUtvB
	2vBrI4XRQ0h9JH9XJwSTSxEm8Ij9QG10sosc2cFzEw==
X-Received: by 2002:a9d:360b:: with SMTP id w11mr16396392otb.238.1556636063416;
	Tue, 30 Apr 2019 07:54:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190416091348.26075-1-armbru@redhat.com>
In-Reply-To: <20190416091348.26075-1-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 Apr 2019 15:54:12 +0100
Message-ID: <CAFEAcA-9aXpYTarSUw2r49PEeihZ4eyQub7f+DdcwqcJ8GXXGw@mail.gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-arm] [PATCH v2 0/3] hw/arm/virt: Support firmware
 configuration with -blockdev
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
Cc: Kevin Wolf <kwolf@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Max Reitz <mreitz@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VznISQfH1lmX

On Tue, 16 Apr 2019 at 10:13, Markus Armbruster <armbru@redhat.com> wrote:
>
> L=C3=A1szl=C3=B3 asked for feature parity with the PC machine types.
>
> v2:
> * PATCH 1: Split off PATCH 2 [L=C3=A1szl=C3=B3]
> * PATCH 2: Factor out the loop body, not the whole loop
> * PATCH 3: Rebase on previous change
>            More detailed commit message [L=C3=A1szl=C3=B3]
>
> Markus Armbruster (3):
>   pc: Rearrange pc_system_firmware_init()'s legacy -drive loop
>   pflash_cfi01: New pflash_cfi01_legacy_drive()
>   hw/arm/virt: Support firmware configuration with -blockdev

I appreciated the commit message on patch 3, it was very helpful.
Applied to target-arm.next, thanks.

-- PMM
