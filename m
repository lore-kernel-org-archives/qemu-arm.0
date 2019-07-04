Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp1870144wru;
        Thu, 4 Jul 2019 03:43:28 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzhBDSccTO+gn8fVSmWIjpmwfHO8w+LILvOFEXGbBseT/rN6R4W2x2oS61+zbDHwiKLLRKa
X-Received: by 2002:a50:b87c:: with SMTP id k57mr46942963ede.226.1562237008364;
        Thu, 04 Jul 2019 03:43:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562237008; cv=none;
        d=google.com; s=arc-20160816;
        b=pOR7Ze76XeBI1ClQC5o5/A52VsWM1mQ+v/Scjcb0w9ttXcwkGCCMDorNXgdy8WbYG9
         gWQ+qq2hlaywEICRPT1MS5tDts0xpvu2zP0eOGjvt38mfGW9+VrZP2eP98hRg9LM03rU
         1u9UMdnPoU9rvnYM6+EqSO2NrHre3Fb/IDjl1qSW8t2aREsLeR56y1v9wWKbCuMduW3V
         m/tmXpQXJrX/jRIysxUuPcJ46FxfIcYvnWceg5+HYGRkgg4bitA6iGWaouBfOqSIyJqI
         VFJo2QZy9Jz5zSu6R45rdKJKQLLq3bC32/kkHbSmxEkRCHCB+GMWZ+RY6MfAstmdG9rU
         lRmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=aTD4kYXTKhIbspsnLWc3FKHoQnDn0j8oDEKhaY7HNSM=;
        b=icBSxdhnAr0qyIveHrwfFIRtz5H15hJGnQILBlASAkmQZOfKW09h7ZSz8mtHo/gdt1
         ft+SaozkPvBvakBEbvyvdOLDm2uVjvgyo4GHu3WWt3Q8jbWKT7GPesyy7nuLpCQ0WIVU
         N5WlWszgNe8YzHac9z0bCQpoR/Mbmp4KKHrSmJPGdFqhsN9y+xW862SI4PVNZbTYNBDQ
         4dD6hidz838RsrF9h+4hRrOCQGtatgha+ibN/eRbNOkqFl67ZLFaLFeRa7sd7cBB/izI
         q4/fu3vBND1IcI40FbAemMZqv19vygXGbR37ms/tEgf5EWX5cifegpg4J7r6Po9lO8KD
         JAPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vlsg7fjR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id va11si3829118ejb.358.2019.07.04.03.43.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jul 2019 03:43:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vlsg7fjR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hizD5-0006jQ-GT
	for alex.bennee@linaro.org; Thu, 04 Jul 2019 06:43:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50382)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hizCm-0006ih-QC
 for qemu-arm@nongnu.org; Thu, 04 Jul 2019 06:43:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hizCk-0004AI-Rs
 for qemu-arm@nongnu.org; Thu, 04 Jul 2019 06:43:08 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:34615)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hizCk-000491-L5
 for qemu-arm@nongnu.org; Thu, 04 Jul 2019 06:43:06 -0400
Received: by mail-oi1-x242.google.com with SMTP id l12so4625403oil.1
 for <qemu-arm@nongnu.org>; Thu, 04 Jul 2019 03:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=aTD4kYXTKhIbspsnLWc3FKHoQnDn0j8oDEKhaY7HNSM=;
 b=vlsg7fjRufkcg2NVfOZYzIXcVgcvSUtOwFwBI1Ju/H8FhJVYmEfsM0wYr+9+aV/AML
 yxVJVBDO3tjsRRcDeG9YWc2j+xs7Sb0zmCXJFqixu0rfRp2j2i/sNIu3hOt/m5DdB802
 JnZqYB6Ei2AryM2kce6mvavaz9DiX2+gpkQ8sviQWRDn6wK5K8zYieFG01VGtozr2ec3
 BmCd0CbPrxe0u358x4bYiFY/p5Jh3OBVP7fJpENwsGvb/c+CRofnVgM/uxhCsA5lwa3n
 vhMHTzX0uqDNsKO+9JizIDxK3Q7bOnd5nH8HbknMFmZgNll2URPyxH713uXbfML5ibkI
 P06A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=aTD4kYXTKhIbspsnLWc3FKHoQnDn0j8oDEKhaY7HNSM=;
 b=UwNta5Cz/MoGUysNJqLVqISlXRpH5r939q3Letg7BLGi+ImsxkPv0x81rRxs4pT0Rs
 pY2Tm2+hmWUnXo7WiS1V60GkP/Tvn/2zYRGy93TT+9sa33sqnI82DxjJuFbLdCyQSPuh
 Y0vJIi7NEtjxTc6at9OQTxNJ+kOBlIAU3O6nib7CuChGTOhDwBDbW2vf9Do2+QsBn0xX
 hupO/YASNkxTeRYcTVQ7QKanBtxb6LEiWuEZ2ijOot/WJWHJ4EZSTQjTU6jkPEzF4qKa
 lwlEt0JPJpejC6FZ2A93CAcp3Rv3LInCil+86RRtQKVMUt5wolimeCbjllLYOhmxZzEf
 8Wfw==
X-Gm-Message-State: APjAAAULNUpimrXpd10l3fxm73ZDeFKuykq0o866DfApmiXgpmbfQaU+
 uNf28jzbKbvfYVEaYYlUjh2qa4ZbSHa7KA1wBFN0Cw==
X-Received: by 2002:aca:ac48:: with SMTP id v69mr1402704oie.48.1562236985537; 
 Thu, 04 Jul 2019 03:43:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190703190615.31436-1-ppandit@redhat.com>
 <59f87427-3d1d-928b-ac87-0a0a4049c4f5@redhat.com>
In-Reply-To: <59f87427-3d1d-928b-ac87-0a0a4049c4f5@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 Jul 2019 11:42:54 +0100
Message-ID: <CAFEAcA86=RDpZEzWF_5QL_ix8Bghqxvn7ykXUBkAzTWp7KUVcw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw/ssi/xilinx_spips: add
 lqspi_write routine
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Prasad J Pandit <pjp@fedoraproject.org>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Qemu Developers <qemu-devel@nongnu.org>, P J P <ppandit@redhat.com>,
 Sai Pavan Boddu <saipava@xilinx.com>, Lei Sun <slei.casper@gmail.com>,
 qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0kmknOMtbmMJ

On Thu, 4 Jul 2019 at 11:11, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com=
> wrote:
> However, looking at the datasheet 'UG1085 (v1.0) November 24, 2015',
> Chapter 22: Quad-SPI Controller, I understand this region is only
> accessible by the CPU in READ mode, as an AXI slave.
>
> So, if we model this, even logging LOG_GUEST_ERROR is incorrect, we
> should trap some AXI bus access error.

Well, that depends on what the decode and the device really do --
often datasheets are pretty sloppy and just describe what
software "should" do, not what the h/w does if software does
odd things...

thanks
-- PMM
