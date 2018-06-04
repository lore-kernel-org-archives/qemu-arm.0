Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp921161wrq;
        Mon, 4 Jun 2018 11:21:23 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKszmd7HKJifnvdanYS09KJ7HJiBQMBb7NMt6vMBuuxutArYUYfbu95AWVIRvHmnVXVp13d
X-Received: by 2002:ac8:1b62:: with SMTP id p31-v6mr14566738qtk.280.1528136483910;
        Mon, 04 Jun 2018 11:21:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528136483; cv=none;
        d=google.com; s=arc-20160816;
        b=wJDYOY11bHxviQJisU+T1m/q1/mJlaqUNvkwX03S6glOT+bb1S+h67UVPwjJp1hG3E
         RS8yMhqul621vv1tZHe0ioqYRjSxR65gWbH0Vg+X8A8fzM3rruCN2u72cLa56O6AZg86
         Th/en5jnmpXDf5fYRkAQt/7qBaU+aO7EjWyC7aF2EVnNdz21PUVNOvhgXXo4+ZxmZDED
         O3MoauehFB2pELHTC9eIuD0rXBIji4WDgEGPq4+Y5P1mFbiFz5f3QWty+x21iZHqhdP0
         3IyEwy+F+9Uj0HrbOpGcIJlHz6UohIteaDOVNp/mfMgyUdnhgth7R2t1lJ7k8a8CMcj7
         acig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=STTMpjOSucjmZV/tlqWzExIvKMFiUP4UIF3iHqYngzE=;
        b=c2Y8toZZUQZLD4Dwa2jbup8b5DIbg7JS+bIfa+cUCxU1g51MD+gpPjZwNnnxxef+UR
         gVMQ2oBcvAtxowVS9JmYweHe809FzPBsOXIn1a4HughJz4tTN595AgliqiJboHDZ7gUv
         PFATCHDQ0/9xlN/3LeKaWr/UmMcaWzNHyP2r4A+igzrjuTxP6O3R0FqvtKGkOcyOR2no
         /78mhOHFejp7YRUPd1fE/HPuxdxy6Pc2VAZ+Wr02zGMg0+m6fdSibBC8neufS6q7d5JG
         +n3hscTtxXx/cQ5G5gW9qhRissxPiYQ/9hhB1urIKsjLH2RmoPJw6cjzUitfo8Rvgg4y
         AKkw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=EusjhD+/;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t18-v6si3503172qvd.95.2018.06.04.11.21.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Jun 2018 11:21:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=EusjhD+/;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41390 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fPu6d-0005eO-Ee
	for alex.bennee@linaro.org; Mon, 04 Jun 2018 14:21:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60765)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1fPu6S-0005cr-3z
	for qemu-arm@nongnu.org; Mon, 04 Jun 2018 14:21:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1fPu6R-0007KU-2l
	for qemu-arm@nongnu.org; Mon, 04 Jun 2018 14:21:12 -0400
Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244]:39108)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1fPu6O-0007ID-8y; Mon, 04 Jun 2018 14:21:08 -0400
Received: by mail-lf0-x244.google.com with SMTP id t134-v6so26713435lff.6;
	Mon, 04 Jun 2018 11:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=STTMpjOSucjmZV/tlqWzExIvKMFiUP4UIF3iHqYngzE=;
	b=EusjhD+/fOOxFMmCS4+Y+Ub2Q0dNQOlv9DoHnzYgHAzNpkLTpFnKBy5+KnyHjEiNX3
	juRYBmsaDo6JKYt7zxFCNLGhdJE/k3gFwGZrtHOOEBylG3WG/y+FrXtOFYQQ9OfiuT/T
	d+bR5UIcudAnyTX7efLugfGNVI+Q6l427+CGP9onv5sLJjbAbNoUw8wkMUkNfUr1SrjG
	SLQcObUAlK5cSmqbRpi2H5u58QgG9u6eUXlRw1FbWqPAJxu6+JvUYphvU4TK916vdFJS
	zyAt6qfMfwAwBKFirP/0UllkPIv86P3QQOz4AH9oGNaetx2uqmwg4Kl+EHkvh66V1DVb
	laIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=STTMpjOSucjmZV/tlqWzExIvKMFiUP4UIF3iHqYngzE=;
	b=P3Pn9k3TfY5nKbaeesO/jID/Z6slkGksk6+jONNqxLkA7yQ07aAl6996YLVpUDw6ck
	XbVkzJ6vgNted7df/HrzdVmu8135jWkgdCGJnJx5quTfbgeXmGmEQh1y289PqxJPdzwu
	/So+ZlwfnNtZZJghvnxrN+9NMkun2QxxvYsSwdk0m9+nUtZGkNBCP9xU06prBcZP7StL
	73tWmHWFD3ZvCdUuN4aTXBGvuhT/4u6Sc1I8qknks6vvTGkF0x0zJK+nXsqabLdalSZ5
	GTolPx8JezbJNPG0VcwHXQoZxGXhgddDRhicQ39xMMkru9q+LkcAm30jGLicoBTjOVbD
	plcg==
X-Gm-Message-State: ALKqPwfQ07y1elN68vCHyx2XWx/BABIxCouzn6THcZcqkiUUeuPR3jga
	DFGdjKtvvKl80s7T722YH6FIR/6RiLlI61XCRw0=
X-Received: by 2002:a19:eb4d:: with SMTP id
	j74-v6mr12853194lfh.1.1528136466898; 
	Mon, 04 Jun 2018 11:21:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:98c6:0:0:0:0:0 with HTTP;
	Mon, 4 Jun 2018 11:20:36 -0700 (PDT)
In-Reply-To: <20180603000827.30872-1-f4bug@amsat.org>
References: <20180603000827.30872-1-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 4 Jun 2018 11:20:36 -0700
Message-ID: <CAKmqyKMgmsuqPqM=h6y85e-psAxRpQxo2hvkcS0Xq+FftwUTfw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::244
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 0/8] sdcard: cleanup the SD_SPEC
 version
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Paul Brook <paul@codesourcery.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6SX2iQSGJoeb

On Sat, Jun 2, 2018 at 5:08 PM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
> Hi,
>
> This series adds a 'spec_version' property to the SD Card device,
> to allow to limit some commands to specific spec version range
> (some firmwares use this feature to detect which spec version the
> card implements).
>
> This restore the SSI/SD support of the Stellaris LM3S6965EVB board,
> which allow to stress the SD Card code with a nice integration test
> (waiting for another series to get merged to add the Avocado test):
>
>     $ qemu-system-arm -M lm3s6965evb -serial stdio \
>       -kernel sd_card.bin -sd sdcard.img
>
>     SD Card Example Program
>     Type 'help' for help.
>
>     /> ls
>     Open
>     listing
>
>     ----A 2012/04/25 17:44        12  README.TXT
>
>        1 File(s),        12 bytes total
>        0 Dir(s),      61182K bytes free
>
>     /> cat README.TXT
>     Hello World
>
> See:
> http://lists.nongnu.org/archive/html/qemu-devel/2012-04/msg03790.html
> http://lists.nongnu.org/archive/html/qemu-devel/2018-06/msg00353.html

Do you have a branch with all of your SD work available?

Alistair

>
> Regards,
>
> Phil.
>
> Philippe Mathieu-Daud=C3=A9 (8):
>   sdcard: Update the Configuration Register (SCR) to Spec Version 1.10
>   sdcard: Allow commands valid in SPI mode
>   sdcard: Add a 'spec_version' property
>   sdcard: Set Spec v2.00 as default
>   hw/sd/ssi-sd: Force cards connected in SPI mode to use Spec v1.10
>   sdcard: Disable SEND_IF_COND (CMD8) for Spec v1
>   sdcard: Reflect when the Spec v3 is supported in the Config Register (S=
CR)
>   sdcard: Disable CMD19/CMD23 for Spec v2
>
>  include/hw/sd/sd.h |  6 ++++++
>  hw/sd/sd.c         | 47 +++++++++++++++++++++++++++++-----------------
>  hw/sd/ssi-sd.c     |  2 ++
>  3 files changed, 38 insertions(+), 17 deletions(-)
>
> --
> 2.17.1
>
>
