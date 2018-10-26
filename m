Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp1126155wro;
        Fri, 26 Oct 2018 12:16:55 -0700 (PDT)
X-Google-Smtp-Source: AJdET5d9BQX9ZUVBRTrQv8n/hanbNy8DclmyHYXdVKug1LS+8Nt6+oVK9KQ3RZrWI5V8iW3yij6L
X-Received: by 2002:a0c:ea51:: with SMTP id u17mr2804074qvp.56.1540581415840;
        Fri, 26 Oct 2018 12:16:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540581415; cv=none;
        d=google.com; s=arc-20160816;
        b=SGAH01YkkeLRiUa6gMmhdYPDOYTtHE+NDjVcUFxh5HReSBDVM1odFfXEvnV8rc4AN6
         Mx15WDWsPKt2BJCjBOs0TNtSZPZB0i/2mL6N/hWEQ7Te3bbTU5PAAQFnDAE4POtAaP6k
         TJv6gIaugGMRdwVxKPKi4lr957gcABCWiQHyc/KeP+k5q8TgLwXb5HI6Medyy09rsPd+
         T7Z3rDuuBXvlf9ssc8cCAZNwwLNDx76JHwSnRnXoctU2dhjOQRAMUQOQ9YJQQ8tq5ZeJ
         f557DR9Ya5MuHqlFJP4Fk/GKKKLJbtjW14VeA1RIVd7lulRjTaygMlWgI4hUMBSIzlgt
         RJlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature;
        bh=pnvfCd5kH9DuxP2YXVDB/Jm0bxWv5ynqLelwKWPQCcs=;
        b=aeoC2oEB6loK3KgRnmtHYfZmhXXxa3Xk9Bygz+2htYUeS3g4rrVBp7W7APPDKwsqgs
         /KKjgUFFMyt2vw/IixQqJLydOCqqyPSgSsf36twk0mWWxVth6eCsiQJR5FZsJkGCqUvb
         TkfyhcPytvbiEMrN66VmfGJbN8Pp5ru0x+4h0InUphRpSb3lc91p5L10y031UdXwrbEl
         d709+WGLUpOzhPrda44WkyxlhczUOVBDw41F1O8V1/DrxGKJrx+MZ6oJ1phAvNPLNTQT
         UoO/1KYSGEfbUbUCqx84wL80q79oXshehwAQcoVQx36xy2XEZ/qy8ZN5ClNLxuRPMB+f
         9fDw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fimtg4l1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w8si2854379qvc.170.2018.10.26.12.16.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 26 Oct 2018 12:16:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fimtg4l1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33872 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gG7bL-0007Dn-CC
	for alex.bennee@linaro.org; Fri, 26 Oct 2018 15:16:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57724)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gG7az-00076j-M2
	for qemu-arm@nongnu.org; Fri, 26 Oct 2018 15:16:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gG7ay-0002rK-T7
	for qemu-arm@nongnu.org; Fri, 26 Oct 2018 15:16:33 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:45139)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gG7ay-0002ml-Gh
	for qemu-arm@nongnu.org; Fri, 26 Oct 2018 15:16:32 -0400
Received: by mail-oi1-x242.google.com with SMTP id e14-v6so1942409oie.12
	for <qemu-arm@nongnu.org>; Fri, 26 Oct 2018 12:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=pnvfCd5kH9DuxP2YXVDB/Jm0bxWv5ynqLelwKWPQCcs=;
	b=fimtg4l1WDfd7hyjMlhsUxwLQWzGmZbyHJeOzYbZwXIK6KVdpb1H2JOP2pYVjghkoW
	TympJW1L7ULhP91dtzSEA5kSvGt1LVgrwXfjKMhzC7bm6whhmmvsanBbfXUi0UaEtn12
	OPNk+IwwDgNfAB+pCHtjSEWKbi24lTl/pBpno=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=pnvfCd5kH9DuxP2YXVDB/Jm0bxWv5ynqLelwKWPQCcs=;
	b=C6288u3X0yDwvaQXy6v8ntJhPIFqM5yhNAUCrfaAlVVZz3oIrF02DaLquGeMio9yXw
	Bh6b26aYauKpu3Xcb1+t/2/l53KQK9PWRG3tT3OOWShxRwjK6B1Hv0RCAicxnJgZ6NtC
	mvsSaRDBzfSrL9YFjIC9eYMmhmvhY8RIoRF9kppjLqlRs1vPxjhbGeAC9TNVX/NUuGV5
	+Q0eJpsh5qotDrF4EnrCaaSCPqWqRjki+uIomQcgGc6PgpT+YZhYsjiJSgTjHEqjzzz7
	H4WslrgIE4OB59TYKuEoOkGLB3LnM/Mem60g6BCV30yPCP4mMTaV+1YfgDZd1sl6koxC
	/Gfw==
X-Gm-Message-State: AGRZ1gIqLFC+N7/XiPJ/waempTGvW6I4/zquDwsR1/Fry026AOJIbY+W
	CHzhEhHxWvByYSAg6X/Ch89fSrMegZLNtAcWK7NaaQ==
X-Received: by 2002:aca:ed51:: with SMTP id
	l78-v6mr2773206oih.112.1540581385294; 
	Fri, 26 Oct 2018 12:16:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:7c90:0:0:0:0:0 with HTTP; Fri, 26 Oct 2018 12:16:04
	-0700 (PDT)
In-Reply-To: <20181025133301.16578-1-ehabkost@redhat.com>
References: <20181025133301.16578-1-ehabkost@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Oct 2018 20:16:04 +0100
Message-ID: <CAFEAcA-qe-Sa1-XtmBdokuwX36V2PAsacYNkv1guvXzoUfC1Jw@mail.gmail.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-arm] [PULL v2 00/43] Machine queue, 2018-10-25
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Libvirt <libvir-list@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	QEMU Developers <qemu-devel@nongnu.org>, Alexander Graf <agraf@suse.de>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Eric Blake <eblake@redhat.com>, Rob Herring <robh@kernel.org>,
	Markus Armbruster <armbru@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Richard Henderson <rth@twiddle.net>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
	Alistair Francis <alistair@alistair23.me>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	Michael Walle <michael@walle.cc>, qemu-ppc <qemu-ppc@nongnu.org>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EHYsRbvK2Z2E

On 25 October 2018 at 14:32, Eduardo Habkost <ehabkost@redhat.com> wrote:
> Changes v1 -> v2:
> * Fix 'make check' warnings (Igor)
>
>
> The following changes since commit 13399aad4fa87b2878c49d02a5d3bafa6c966b=
a3:
>
>   Merge remote-tracking branch 'remotes/armbru/tags/pull-error-2018-10-22=
' into staging (2018-10-23 17:20:23 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/ehabkost/qemu.git tags/machine-next-pull-request
>
> for you to fetch changes up to 8fa922c241e63f018f5b55c03ac494ae3d5fe594:
>
>   net: xgmac: convert SysBus init method to a realize method (2018-10-24 =
06:44:59 -0300)
>
> ----------------------------------------------------------------
> Machine queue, 2018-10-25
>
> * sysbus init/realize cleanups
>   (C=C3=A9dric Le Goater, Philippe Mathieu-Daud=C3=A9)
> * memory-device refactoring (David Hildenbrand)
> * -smp: deprecate incorrect CPUs topology (Igor Mammedov)
> * -numa parsing cleanups (Markus Armbruster)
> * Fix hostmem-file memory leak (Zhang Yi)
> * Typo fix (Li Qiang)
>
> ----------------------------------------------------------------
>
> Queue for Machine Core patches
>

Applied, thanks.

-- PMM
