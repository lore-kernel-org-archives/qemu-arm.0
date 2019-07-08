Received: by 2002:adf:a557:0:0:0:0:0 with SMTP id j23csp2617546wrb;
        Mon, 8 Jul 2019 09:09:29 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzbkb3rtuWvK2y3eNXx6ANBuq/OiN2QCD05gKH52rHSl7f9fUzyxobv7tGgU+nHtaDVyz4x
X-Received: by 2002:a50:92fc:: with SMTP id l57mr21080017eda.206.1562602169759;
        Mon, 08 Jul 2019 09:09:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562602169; cv=none;
        d=google.com; s=arc-20160816;
        b=pSpzk7tBeEgbJU/gzJp1vtu5HgJZz3n3gHMKLd9NPu3RUn/u8MhSTUXKznNa02+yLg
         MI1092dUJwGGQR4dYtzd5fTD/R5IesqG/EEyR7WW2fDEm+kZ17xPNmokQX2ouBfcFSMj
         BzqA42VUXVAhdkN9qL/qfvyX/HD6p1leiFpF4XjTNdjbi3elBjZUSskjWUdfoRwsfYlF
         BJpw96iPMWH2gjNTwc+aht1h2F2LHXqRB7CcPfdPfXAWMZU14Rst9TIyLw4MedH5rVA/
         6gVxH6+C13bNRDm2tHeGCHaQjOy3IRIYGDpzfGQ9Xn0D8UiQ/5+vsRVfZY/XsFFvReYO
         h7sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:to:from:date:dkim-signature;
        bh=KBRi8cQQBvYj9KgVf2TGXS8dksaF/hFUiXEmkZ/cCDY=;
        b=ujlburuBTel6Exj9zTcaPpWM/00bqhJQIb28No6PrwSqIPPE4sTJ3xVZKPJt560P+Y
         xf1/hpQxLDZor4tPDLT8T16+ITurwp9WyYj7nm4mDJ4CiwSs1Zo8UzwqyK3KRZxqcY7N
         dgLSP6GMoVjdA9WGwXpQQnzdE1k8un1IlOL79Ws9f0AV/zRA43su+UziDKDu3jzi61zk
         MCFQnILRspnn10KR//+g1QCC2UVzTXvVbJUEx2gXDCpNueQjmE1JE1PEO6zy8FVIyUZL
         dDpP1tFjuYsjFV0691bKLOKiFwlzNYTW+eVxZ8gu3+EF+vSnjfG6cNpy6FVPH2to7vBz
         b4GA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=a6oz8I6g;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c55si14500070edc.323.2019.07.08.09.09.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jul 2019 09:09:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=a6oz8I6g;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:43176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hkWCm-00006l-SF
	for alex.bennee@linaro.org; Mon, 08 Jul 2019 12:09:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42410)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <frasse.iglesias@gmail.com>) id 1hkW7D-0004oH-Lc
 for qemu-devel@nongnu.org; Mon, 08 Jul 2019 12:03:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <frasse.iglesias@gmail.com>) id 1hkW7C-0004po-A3
 for qemu-devel@nongnu.org; Mon, 08 Jul 2019 12:03:43 -0400
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241]:44919)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <frasse.iglesias@gmail.com>)
 id 1hkW7C-0004mD-0x; Mon, 08 Jul 2019 12:03:42 -0400
Received: by mail-lj1-x241.google.com with SMTP id k18so16468282ljc.11;
 Mon, 08 Jul 2019 09:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=KBRi8cQQBvYj9KgVf2TGXS8dksaF/hFUiXEmkZ/cCDY=;
 b=a6oz8I6g+LvCFA04palZPcwOX+tiqF8U9i9sx8lVPAbi41jksm29RNZYh87lVcIT9f
 p4wQ4hwrpYeVK2cQpQRiSDHprReCbZ0CXjh7Oks3nB7tN52XkyBitBPsqgHoUqEolaGd
 5jYzyehU5JNNdT0mjq0z56kQvlQ6Kwl/eGURP0kQmxnGIVj9FDnQWsSThC4Vp745+X95
 1Wt2nWf8rNfLI4fqqC+qxj+v2wcw9795rhS317Ts/YT3XpQ/CNE9XhOyXP8WXwzlMYZc
 qyA13i3M47e1fpSz946Jk2D6gU+RkVNzrT4N20N+MG+mjsnuLXhx9HfGoudnN33z8bII
 7jpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=KBRi8cQQBvYj9KgVf2TGXS8dksaF/hFUiXEmkZ/cCDY=;
 b=TQiNa+AY5HCkWNY24w+JH3zaqSY8uc1HYgJuLjYH68vebdtxhnvltIa3dT2zbdjp10
 UiQ98G124aGKwIvGdTmdXhV0JKayziQEOzBxGntaGaO5VW1C1ULzcUcT3K4aTefZVAzZ
 CK55es5IIRbgtMRix7Q/Of1x82pJtDbeScoBYocTP+OEueRY5TNsHnyQqclhHQTRtN7n
 FkE3w7hYksuymHZuWE6sX40YDQEbQB/GJaB36VNT35uXhmys6UOhge6wN2ZwkcqxuCfA
 3XKR6LC8t1HRQELfU+B8IpxvIAJzVHCVjenfklgkclaLFvXWNMxhNtsUfRCFRMuZCAax
 QBFw==
X-Gm-Message-State: APjAAAValDi6gP3Yg26kYlDyWY2X4jo+5/9MkjA3AoCDkGNWjTeSfKI1
 EDUsyg/p32ijmn2910GHuqo=
X-Received: by 2002:a2e:868e:: with SMTP id l14mr10710670lji.16.1562601819690; 
 Mon, 08 Jul 2019 09:03:39 -0700 (PDT)
Received: from fralle-msi (31-208-27-151.cust.bredband2.com. [31.208.27.151])
 by smtp.gmail.com with ESMTPSA id
 z17sm3756526ljc.37.2019.07.08.09.03.38
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 08 Jul 2019 09:03:39 -0700 (PDT)
Date: Mon, 8 Jul 2019 18:03:37 +0200
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Message-ID: <20190708160335.u3zamevyrbnx6nvb@fralle-msi>
References: <20190708104750.1071-1-philmd@redhat.com>
 <20190708104750.1071-4-philmd@redhat.com>
 <20190708142622.k4s5oknmzzj4brxd@fralle-msi>
 <41f075ef-9b80-cb66-0fb1-d03079cd93a4@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <41f075ef-9b80-cb66-0fb1-d03079cd93a4@redhat.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::241
Subject: Re: [Qemu-devel] [PATCH-for-4.1 v5 3/3] hw/ssi/xilinx_spips: Avoid
 out-of-bound access to lqspi_buf[]
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-stable@nongnu.org,
 Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 Prasad J Pandit <ppandit@redhat.com>, Lei Sun <slei.casper@gmail.com>,
 qemu-arm@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fnfSBzhTiiVH

Hi Philippe,

On [2019 Jul 08] Mon 16:58:29, Philippe Mathieu-Daudé wrote:
> Hi Francisco,
> 
> On 7/8/19 4:26 PM, Francisco Iglesias wrote:
> > Hi Philippe,
> > 
> > On [2019 Jul 08] Mon 12:47:50, Philippe Mathieu-Daudé wrote:
> >> Both lqspi_read() and lqspi_load_cache() expect a 32-bit
> >> aligned address.
> >>
> >> From UG1085 datasheet [*] Chapter 22: Quad-SPI Controller:
> > 
> > s/22/24/
> 
> I'm confuse, Chapter 24 is "SD/SDIO Controller", so it seems this Xilinx
> datasheet is not stable to refer to. Maybe I should simply use:
> 
>   From UG1085 datasheet [*] Chapter on 'Quad-SPI Controller':

I just clicked on the link and ended up into this version of the UG1085:

'UG1085 (v1.9) January 17, 2019'

But your right its probably better to refer to a specific version of the
UG1085 instead? Then both should be ok, either to write the way you
suggest above or refer to the chapter number in that UG1085 version (as it
was before).

Best regards,
Francisco

> 
> > 
> > After above change:
> > 
> > Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com> 
> > Tested-by: Francisco Iglesias <frasse.iglesias@gmail.com>
> > 
> > (I tested all three patches so the Tested-by tag can also be appended on the
> > other two)
> 
> Thanks!
> 
> > 
> > Best regards,
> > Francisco Iglesias
> > 
> >>
> >>   Transfer Size Limitations
> >>
> >>     Because of the 32-bit wide TX, RX, and generic FIFO, all
> >>     APB/AXI transfers must be an integer multiple of 4-bytes.
> >>     Shorter transfers are not possible.
> >>
> >> Set MemoryRegionOps.impl values to force 32-bit accesses,
> >> this way we are sure we do not access the lqspi_buf[] array
> >> out of bound.
> >>
> >> [*] https://www.xilinx.com/support/documentation/user_guides/ug1085-zynq-ultrascale-trm.pdf
> >>
> >> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> >> ---
> >> v5: add datasheet reference, drop RFC prefix, fix build (Francisco)
> >> ---
> >>  hw/ssi/xilinx_spips.c | 4 ++++
> >>  1 file changed, 4 insertions(+)
> >>
> >> diff --git a/hw/ssi/xilinx_spips.c b/hw/ssi/xilinx_spips.c
> >> index 3c4e8365ee..b29e0a4a89 100644
> >> --- a/hw/ssi/xilinx_spips.c
> >> +++ b/hw/ssi/xilinx_spips.c
> >> @@ -1239,6 +1239,10 @@ static const MemoryRegionOps lqspi_ops = {
> >>      .read_with_attrs = lqspi_read,
> >>      .write_with_attrs = lqspi_write,
> >>      .endianness = DEVICE_NATIVE_ENDIAN,
> >> +    .impl = {
> >> +        .min_access_size = 4,
> >> +        .max_access_size = 4,
> >> +    },
> >>      .valid = {
> >>          .min_access_size = 1,
> >>          .max_access_size = 4
> >> -- 
> >> 2.20.1
> >>
