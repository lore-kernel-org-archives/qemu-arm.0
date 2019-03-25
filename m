Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp3658974wrx;
        Mon, 25 Mar 2019 03:02:10 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzplyjhZZ9XhcVVj3AXKbo/KrkJP7An3VseRIaH1GP/Z/9BF1xy8SsAFwflSEkBKE62lnpx
X-Received: by 2002:a25:2586:: with SMTP id l128mr19003640ybl.118.1553508130817;
        Mon, 25 Mar 2019 03:02:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553508130; cv=none;
        d=google.com; s=arc-20160816;
        b=1EbgHxvEBAOS8mv/+ZC50AkvUXla77SXlYaqB4XTVLcSSXWuJgLc1bXHfTOov3zIYb
         q0TeDYcY4p9EScFu35iZwB9I9E0/YEDHh6pJYkTeq2Vy79bCPcrOlZGxbDHrJzfOXP+u
         lyVF+mo/jWHW/aqgudUSxyYJXRmWlHtRAiu4+hH5Xo7jpjDlbOcb80rU7kdqNEnY0d0U
         VllgAGijRtu5j9VQ7o9z34L26mvwJkdQolnIBNSzb5tJr8/RzYPG5us9DSD48zAW93u+
         AzZuOB7CrtnSC9MdwnHHz2A7a0TdCQbxk3Ds1L9syneZsgO7nMWpSx18RkTQ4PnnBoSX
         AgeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6SpsIwAqIed4GUx8E7H4MUyTO0UEaULTBIxYJrnrQ8I=;
        b=YF5cS1Wha0I0ndqMsRorBfKfFhRNGes1qc8cWUpxPnMXQjEsBxnbmB5cxxpF52EKMv
         PQHsWQgwSruJbkqy8VqSgPePllfjHT+H0p3dmKMAA8Jz/Vvi+SPoJrfpMr17Ie6Ft3G4
         01McLDcOgG7uHA2+mQ86C4wblJZ4QAoClOzE2XeQ6+joNo6KoatNSyyl0Bkr0w2MW/lB
         +gHZF0MKLLmchZi54Xs057qRVwcMHAb4taIUQks0Lv902d2KAd3XyQU+WSC5VLMFqGBr
         ShqfPrhqsckIXADk/4WYyn2sCxC393LswZmEhrkSEuXHoHjYTpeVb5SZ8vI9k9alF2mm
         dK/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=pvIUwZ0Z;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c25si9483448ybe.250.2019.03.25.03.02.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Mar 2019 03:02:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=pvIUwZ0Z;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:39596 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h8MQk-0003O9-6J
	for alex.bennee@linaro.org; Mon, 25 Mar 2019 06:02:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46098)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h8MPx-0003HE-TD
	for qemu-devel@nongnu.org; Mon, 25 Mar 2019 06:01:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h8MNO-00024u-RU
	for qemu-devel@nongnu.org; Mon, 25 Mar 2019 05:58:43 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:38754)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1h8MNO-00024a-Gq
	for qemu-devel@nongnu.org; Mon, 25 Mar 2019 05:58:42 -0400
Received: by mail-oi1-x244.google.com with SMTP id w137so6441411oiw.5
	for <qemu-devel@nongnu.org>; Mon, 25 Mar 2019 02:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=6SpsIwAqIed4GUx8E7H4MUyTO0UEaULTBIxYJrnrQ8I=;
	b=pvIUwZ0ZQ4FyPWKo0A3KB62cqRnwsweLGwxCBd5SCjA/cKJ8AVcMTfHr73Ci+9LgS4
	69ZzUNMfC8VdUtnB8AcCByoe2socVHhs7f/AWqv5Dh0EZCH1gExKfgaqHLz1jb/lBwhZ
	9ILUarho3PoOgsBOEVIIDVGmHp9/37v3hJNxBL/zdtjeyzDoLFFMY3vFWOawYS2GflSu
	NXaOiYb9GOlFNdgM/M3sBuZIXdWzAA3+HCbN/UB8pCuujYbFaknGieFoQal/4NIBbNip
	sCrzHSZElgiuux7C4dGGZXBgCJp/qndxgE8SegBe1XitMlin1fDwvFRAZ9/G7e0ij/jw
	oK2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=6SpsIwAqIed4GUx8E7H4MUyTO0UEaULTBIxYJrnrQ8I=;
	b=GsbqeGh2QTqfzhA3SFg9v8XtBIu9/iGnj+1bGBZiceMPLAEpcpOCiQw7w+damaX2AA
	gmjddeZfXSsxh7Z5ah8yMk9d+/73kpk66cSf16M4i5FA9FNOlmxaex50NISRBjCiCV6D
	nBwvKUGySrH5RamCmW+XemWQcP1puToW/HlhUaRowQ+YFW0HNvbjeLqVlOK/7sxWKZJf
	alm0VBht3RfpkAeCwq5Xon93I16uXhpDhdF5kfLtYIQpDiTORBI7CIKKV31I2r7a3tPl
	cS/dkq3Z7KvJhg1g/lSuw2i5irz9xjeF1Pt71Rq8SuFr2JhIC+1uXHnaRDbWp5gyCNZj
	iigQ==
X-Gm-Message-State: APjAAAVMALZEj+gIc0X6Z5dmc6gkwq+B384OUQF0Yde3GtRTOqYOHsxE
	m0aJTRlqi56Bc3/83istAJzm3+mTH/YCns3PPSvCv6Di
X-Received: by 2002:aca:c1c1:: with SMTP id
	r184mr10527256oif.146.1553507921399; 
	Mon, 25 Mar 2019 02:58:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190322162333.17159-1-drjones@redhat.com>
In-Reply-To: <20190322162333.17159-1-drjones@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 25 Mar 2019 09:58:30 +0000
Message-ID: <CAFEAcA8k1MUm9yr95anL7=QYt_exLvOVzwpgeS+=sHKncH3pww@mail.gmail.com>
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::244
Subject: Re: [Qemu-devel] [PATCH 0/3] target/arm: pmu fixes
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
Cc: Aaron Lindsay <aaron@os.amperecomputing.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: V9wMAy99CYTj

On Fri, 22 Mar 2019 at 16:23, Andrew Jones <drjones@redhat.com> wrote:
>
> The first two patches fix a regression I found when running
> the arm (as opposed to arm64) pmu kvm-unit-tests test on tcg,
>
>   $ git clone git://git.kernel.org/pub/scm/virt/kvm/kvm-unit-tests.git
>   $ cd kvm-unit-tests
>   $ ./configure --arch=arm --cross-prefix=arm-linux-gnu-
>   $ make -j
>   $ export QEMU=/path/to/qemu-system-arm or qemu-system-aarch64
>   $ arm/run arm/pmu.flat
>
> After checking the QEMU code I found it's also reproducible with
> the arm64 test if the PMU is removed,
>
>   $ ./configure --arch=arm64 --cross-prefix=aarch64-linux-gnu-
>   $ make -j
>   $ export QEMU=/path/to/qemu-system-aarch64
>   $ arm/run arm/pmu.flat -cpu cortex-a57,pmu=off
>
> Those tests used to pass, but now QEMU was crashing. I've broken
> the fix into two patches because the second patch is a bit of
> an RFC since I don't know if it's safe to enable all
> ARM_FEATURE_PMU code for PMUv2. Maybe that feature is only for
> PMUv3? This patch also enables the pmu cpu property to work with
> those cpu types, i.e. we can now do '-cpu cortex-a15,pmu=off' to
> remove the pmu. Although it wasn't clear to me if the PMU is
> optional (permitted to be removed) on those cpu types from the
> manuals.
>
> The last patch is just a trivial cleanup.
>
> Andrew Jones (3):
>   target/arm: fix crash on pmu register access
>   target/arm: cortex-a7 and cortex-a15 have pmus
>   target/arm: make pmccntr_op_start/finish static
>



Applied to target-arm.next, thanks.

-- PMM
