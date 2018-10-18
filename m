Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2542139wrt;
        Thu, 18 Oct 2018 09:31:49 -0700 (PDT)
X-Google-Smtp-Source: ACcGV614t+cxTzy429QaL7ckujc9gbMvEmAeNgfdsTK5aC18rAgRX/nCSWE30a0u1paMHryrw8GN
X-Received: by 2002:a0c:87b0:: with SMTP id 45mr31300652qvj.244.1539880309345;
        Thu, 18 Oct 2018 09:31:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539880309; cv=none;
        d=google.com; s=arc-20160816;
        b=cEtyBHv9Rdzubctc/aIQWsKsI1yDAa9IdehrToR937VQiaz63jk22dnh4QkSCEHRiv
         P7Yyu+foh+21c+vtaJsFLXNfDen6pIVllRFo04/yt+ZtJohkVsAvo+XgyyswgTN2OiOs
         HwMGpD/5UImML2zJ2gGf+yIzI2gmPknpMRf96tfx4nVdMHu0zykrq6BuBvTo1Vd+9ACk
         GjdjkszqKVSDt8CDQ9+h/sB1t6gnoXRX+DICgrLhgoYpyqQyiYXRKvWWVJxoa17clNed
         3q7mwFOt1Np7h/ZXBONegfQBdrukergM12K60FgdYXd7y/OtncmVLiCrJR5HaDk7sqmh
         K6dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=raUeuCHDDfYk4YbY3wf8Pb+t4hOIs5ayWnckkxwbbrc=;
        b=aKyXdCmec2+FMh2zSogF68O23WTvuWWSBGTdHzbMU4DB2x6vHKho8ywzDyWd3ZnNC2
         yVXccqNG04BcmRw9/4rYvB0u5s1k0lYjWv+yQ3xIzjkipTMCTQ6WXVVkHUZ4Bf0WhBM0
         YPdN/KbpRIeGAxQBrtK3yes31b+ehelxb/AsXZ8TqPQoTllk2kjQYKNy72ikj35Wa1+p
         bJo3YS58RzpgVtitqsq6vOR0KHNvNE7WUoWaKyOF9SdMKF+2XEoxpw+TT37FuhSoITW8
         VIeHFU/muX+lVszKw72OBqUZCx3wIgvANf8KU5LD7TEMdrAxKfgKfr61t7Z7lez4uLK4
         mBKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kz0gF+ng;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h50-v6si9482362qtc.140.2018.10.18.09.31.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Oct 2018 09:31:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kz0gF+ng;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43389 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gDBDA-0002ZY-Sh
	for alex.bennee@linaro.org; Thu, 18 Oct 2018 12:31:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51362)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gDBD2-0002ZP-MK
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 12:31:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gDBD1-00060E-Vj
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 12:31:40 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:35836)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gDBD1-0005cq-Nb
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 12:31:39 -0400
Received: by mail-oi1-x242.google.com with SMTP id 22-v6so24533393oiz.2
	for <qemu-arm@nongnu.org>; Thu, 18 Oct 2018 09:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=raUeuCHDDfYk4YbY3wf8Pb+t4hOIs5ayWnckkxwbbrc=;
	b=kz0gF+ngF96c3oqcP/p51yIKPcQDlatOPyFTMgzQ1yrmPSEpd7LlAMu+9X91ELGUvS
	DHMtngiUXdtXJ5GEPYBt09MGHB1vaDqNKy5yeFieDndmyNdMUyra+Qxo0kGIr4XCKEa8
	2TGaMHvuTnfkg7T6025jlgxiBxeHIMndyCLzU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=raUeuCHDDfYk4YbY3wf8Pb+t4hOIs5ayWnckkxwbbrc=;
	b=EQAXMVbcHhK2yI9UALIXL+KjHCxopmTfzCuPBIB69ercyATEgejaYA+KjmQPygfBS9
	DbZf/QH0/54RXPGxNNll8sZW/Brp1TXhEK9x6jx+eCdYTg98uoalzmM5P656Y3IrODDY
	Zc3T8nqh7OkZp+dgd7Ac62eaj3XT6iOmYM0lbPMN42YDnhlke/1r/Ke1YvXHA7Ul3c5a
	1uzcldr3u1M6fD+nQsC6b168S+2RL1IMuXQhj6wDAvZSEXuo8jmu3cC/jPr9wyzwECVB
	lIuBvzfKknnKybw/cGLbYLFUETJtcwUXSELJWZjSPs6J5A1lggK/zZ94rXioeaq1xaxQ
	QXzQ==
X-Gm-Message-State: ABuFfogE73tIf9XeaMgmQXwo24R5Kh2VPLk3f8is1+M1lg1pP1yNBfZ3
	/69mhZaahII/qKxYwZ7lsNA3HripWdXyTT4oh8YxeA==
X-Received: by 2002:aca:b504:: with SMTP id
	e4-v6mr17137147oif.25.1539880282446; 
	Thu, 18 Oct 2018 09:31:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:7c90:0:0:0:0:0 with HTTP; Thu, 18 Oct 2018 09:31:01
	-0700 (PDT)
In-Reply-To: <5bc854f3.1c69fb81.c9089.8940SMTPIN_ADDED_BROKEN@mx.google.com>
References: <1538067351-23931-1-git-send-email-gengdongjiu@huawei.com>
	<CAFEAcA97eSpOzU_xJZLFgFBZUCW1Z8mYDMzYsdpK99S5WiPf=A@mail.gmail.com>
	<5bc854f3.1c69fb81.c9089.8940SMTPIN_ADDED_BROKEN@mx.google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Oct 2018 17:31:01 +0100
Message-ID: <CAFEAcA-YkiqCfP9f2xxCEoNLsF3oem+wHzM=ROpXPzX-zZP5Rg@mail.gmail.com>
To: gengdongjiu <gengdongjiu@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH RFC v11 0/2] add support for
 VCPU event states
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
Cc: Shannon Zhao <shannon.zhaosl@gmail.com>,
	"zhengxiang \(A\)" <zhengxiang9@huawei.com>,
	qemu-arm <qemu-arm@nongnu.org>, Andrew Jones <drjones@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fW4av0RLtEW7

On 18 October 2018 at 10:38, gengdongjiu <gengdongjiu@huawei.com> wrote:
> Hi peter,
>
>     Thanks very much for this comments and very sorry for my late response due to business trave.
>
>      Yes, the reason that tag the patchset to RFC is that it just  hasn't been tested on 32-bit. if someone else can test it on 32-bit platform, it will be great.
>
>     I do not have 32-bit environment, so only tested it on 64-bit.

OK, thanks. I gave it a quick 32-bit test, though I don't have
a mechanism for inserting SErrors.

Applied to target-arm.next, thanks.

-- PMM
