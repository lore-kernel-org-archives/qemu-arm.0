Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp4360862wrt;
        Tue, 29 Jan 2019 03:46:47 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4hwZ7e15bN3qdYNOUQ3ego8ONbiOtq37Qa/0s2xJuMy7B7gFgvNCNyVQ7tb3UOzS1qgZ+4
X-Received: by 2002:a05:6000:51:: with SMTP id k17mr24388497wrx.259.1548762407850;
        Tue, 29 Jan 2019 03:46:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548762407; cv=none;
        d=google.com; s=arc-20160816;
        b=bvPNHJadm0ah/cu4oCJaGw8L3PIU23Vhggeh5dQ91CVLefQrPqv216dCZOIzmn3RfU
         9VtaNxTvnjt8OLLzqbm3qNt7/iy33zdH33xlwnSGo2MTQt9gMKjWKH9NvHsA63vjgbot
         geBbLh3h/Eao8mZltn/B6xwV95gmtfUfBIHFaeG/lDHFbK8y1zUnERMMgLLR+iJbZzP2
         YOntklNyN82uFUDhHB78soyGcjH4/fL9eVADHfJ1BCvFeBNyrxdkui9j9h0vzSnUaHNe
         uPK6oAiYSWHEJn/hPtDYxnNCZ0/d3QnBJKVdQxEXgD6ZqAgbp3MfeZeFmUtSP7QSCnBL
         GuBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ViQJuQ0mGdiDcTaoDVEnSYJ89LcctvoXGlJvXQVvY4s=;
        b=MeCatGGnUVXeAXpPm558N/s37XTDSdDlBy5eAk/izBG6aJtk5VIt8royDQIu4xkwkC
         6L4758wncqUkg9kXJj+jS0hlOEQM3sGPt8LaEkMQFoGcDEBrQSrkHgcJdtKyslz4bu/x
         HHMc6lYjb/zpKIxqPsWT238HRkJf8lbUrvobFa/OPmBNjGccPGzzEiJW8KznOjqD/iCg
         XbWAT+s1SlE2583IL0+zWcKqSwt3AsCBj8MvpyAbu93dTrx4zNULZG1s4aSLk5wbu1fn
         e7LGB2vb+fTRHQj+RH6KifxCDzyfZhirCMhLIPHN/0hPkLokc7EEqs7LcGFhvbbloWsK
         a0iQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jxkNPbc9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s20si63269689wrg.424.2019.01.29.03.46.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Jan 2019 03:46:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jxkNPbc9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:47894 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1goRqo-0006mb-SX
	for alex.bennee@linaro.org; Tue, 29 Jan 2019 06:46:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40936)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1goRpz-0006lK-Mr
	for qemu-devel@nongnu.org; Tue, 29 Jan 2019 06:45:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1goRpz-0004GN-23
	for qemu-devel@nongnu.org; Tue, 29 Jan 2019 06:45:55 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:33618)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1goRpy-0004G6-T9
	for qemu-devel@nongnu.org; Tue, 29 Jan 2019 06:45:54 -0500
Received: by mail-oi1-x241.google.com with SMTP id c206so15920382oib.0
	for <qemu-devel@nongnu.org>; Tue, 29 Jan 2019 03:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ViQJuQ0mGdiDcTaoDVEnSYJ89LcctvoXGlJvXQVvY4s=;
	b=jxkNPbc99W4CdpgIg6g33WmZ4QfjRvOfy4CQ5cOkMUe5GdWFdXR5lPdeXfNbxgzSqk
	vNYoeZKw4sF0CXocfAn/OOziWfDRkKIyJEFjZCrRhPc9wBqkaOo+WOMDxA4+H5SZiVGu
	rUm/P0Pkna/zUOeqz2UzZQuHLZPe9cqppYzVg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ViQJuQ0mGdiDcTaoDVEnSYJ89LcctvoXGlJvXQVvY4s=;
	b=EZ/iVxGNPBeTyzISJMH83yuVlK1Gll+zzs6jOGUtq5GfWIAuLRsEIVaImiL+NxtPQf
	g0tDCqQfvNGn4fwh6Ht59ZYBpI5d4iy4kFsGrOHfJXgG8eld62ywg4ibj7wldc91bIOD
	SZX6Z8kLffjtSc6vVI5JT/VNZ6IPq4rTzOSMrFm/JRVQXuv9MmcOKQ5Kc1ZHwITvWE2U
	eeZQ56ln23DSXW9r0BduPxvCk3vVlv+EFMn7QevIMWjvZkoERkuWsupLkku09MNd1yT/
	EfjbhK2okU4j9+ASoRS0HrceIn3Rr2pZeoqaVEMHN5EwKmLVBqjJicURD77IS46SUsew
	Cv7Q==
X-Gm-Message-State: AJcUukfbk9w5V/zrL9QfNieHj7uKqzzgDyD/XiBAaj6BtUnvjcnSSl9C
	GrG9pbsRoC0suxMO9/sFoFxg+VL96qBmn29y4BDXiQ==
X-Received: by 2002:aca:c501:: with SMTP id v1mr8620188oif.48.1548762354157;
	Tue, 29 Jan 2019 03:45:54 -0800 (PST)
MIME-Version: 1.0
References: <20190124141147.8416-1-stefanha@redhat.com>
	<CAFEAcA_NBtWFZi8G8goXrX0OHHeHheW6MK3W9ByHVi1DNX3JWw@mail.gmail.com>
In-Reply-To: <CAFEAcA_NBtWFZi8G8goXrX0OHHeHheW6MK3W9ByHVi1DNX3JWw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Jan 2019 11:45:42 +0000
Message-ID: <CAFEAcA_jJCXjt8y7G-LBTxMS1OFJYZs-jjYZW0F26FFnZshAhQ@mail.gmail.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-devel] [PATCH] tests/microbit-test: Add tests for nRF51
 NVMC
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
	=?UTF-8?Q?Steffen_G=C3=B6rtz?= <contrib@steffen-goertz.de>,
	Jim Mussared <jim@groklearning.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
	Paolo Bonzini <pbonzini@redhat.com>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rfVEb7EtLhZd

On Mon, 28 Jan 2019 at 19:01, Peter Maydell <peter.maydell@linaro.org> wrote:
> This assertion fails on PPC64 hosts:
> ERROR:/home/pm215/qemu/tests/microbit-test.c:181:fill_and_erase:
> assertion failed (qtest_readl(qts, base + i * 4) == i): (16777216 ==
> 1)

For the moment I have dropped patches
 hw/nvram/nrf51_nvm: Add nRF51 non-volatile memories
 arm: Instantiate NRF51 special NVM's and NVMC
 tests/microbit-test: Add tests for nRF51 NVMC
from target-arm.next (but have kept
 memory: add memory_region_flush_rom_device()
from the nvmc series).

thanks
-- PMM
