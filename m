Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp815539wrv;
        Thu, 11 Jul 2019 07:44:12 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwObO8IPbeQ8aJ6ZCYAc18j2rQRU+JMHPOfckTDyBTPJnb6UC9Cpt0k2FM8qbY17lAm0py/
X-Received: by 2002:a17:906:b315:: with SMTP id n21mr3518599ejz.312.1562856252350;
        Thu, 11 Jul 2019 07:44:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562856252; cv=none;
        d=google.com; s=arc-20160816;
        b=JWqx13FdKBUb527t21EKZKRg3QXZkgfCR67a2BON0B5a2RA4rG5C+K7SX73F4iBBNS
         BbT44FXAbePVIIJF/j95O7PCk4QKbIPhMNfEVx/WlWexLfmipaUgki+SADWSkT9nhp6j
         bkaQqOCLKzGUHSjcM6er5jQFlE3rZgU22AP/4Z7ZXBTYDTQNI84echCkfjF8RXpsuq7D
         Fiy6qlo1buOtCkHffmXatRQHhW4L2ZbaTrIHLjWeHvSWcfH5JszC6tncEIRtN2BIawxV
         362pUeNmApTTdgD78qQwYme3ET+oMpxmNbDogs+VRlMnTzNb5+uzwZ6m3vqnxJAIq9ZE
         aYZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=juWF7t80AMiUy6W/39UirWfnLso33OL7l6jDlGM6Yow=;
        b=HGMdLlEuRajpRT0+Trgjt6mtgZlXT8xe85fTro+UR/1fsVzOkhmgtHd3qudiqe6r9u
         HrTHIdd/Mlb2c5yMIvMnydAhlQfxqiLuu1PU/YhPinPV/2tPj8Bp+QshWbW+2nvti7z4
         V3zQvOryEBoWqWZuNyo4NP4nqRgZyh0XtwYzt1T9RjMz01gw+qrvKgOXVX1TTPWeTiuH
         xkLZ3hKZsRoKnoxlANxnMwgJBqKbb3X0olg5qZ7SzTd6jPiW/WcMhcMnkDEdhvQmFpDJ
         toTw2D/2TAXkGhJEuWOh6HXyEkDpH3BL+J1Q2i6AMW3lLwUPNheUtAP7tNRiB37i9RGg
         u0mA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LuiMmOhq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y38si3622697edd.0.2019.07.11.07.44.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Jul 2019 07:44:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LuiMmOhq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hlaIt-0005jR-EV
	for alex.bennee@linaro.org; Thu, 11 Jul 2019 10:44:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38910)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hlaIk-0005iO-9C
 for qemu-arm@nongnu.org; Thu, 11 Jul 2019 10:44:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hlaIj-00046x-7D
 for qemu-arm@nongnu.org; Thu, 11 Jul 2019 10:44:02 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:44850)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hlaIi-000461-V5
 for qemu-arm@nongnu.org; Thu, 11 Jul 2019 10:44:01 -0400
Received: by mail-ot1-x342.google.com with SMTP id b7so6069223otl.11
 for <qemu-arm@nongnu.org>; Thu, 11 Jul 2019 07:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=juWF7t80AMiUy6W/39UirWfnLso33OL7l6jDlGM6Yow=;
 b=LuiMmOhqnpI9XVRm72HVh+6hcQhkkX5lIqkfffDeBpuHJeglqdRI4F7SBDDGaqvX9C
 OPPIEHViGUwKIVQ+VY9fdwJvDwKV08gYCljHjE8m/Wr7DvvKwRcl1CkYDUrjBmpXskPW
 4k4PDvBmhjCvX6XU/bupLM4Qg9YqgDn2+Ci+J6zxmZzoEJSX0VH4ywHYIOFaXxc1ZJd4
 MANakSkCidvUY+QtQ4PZ7v9ihwUkCp/sAh36urwlbvMS6TO74Y3L8jVjyCLPSjU2BrDz
 oT4si2VCFSjMa6roLdFd/zlqJTr1J2axG+CSFusco3hHerKBnL0fv/r/p6EZI6OI2Axj
 521g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=juWF7t80AMiUy6W/39UirWfnLso33OL7l6jDlGM6Yow=;
 b=fPTWW5ysWiuE4oa1aI5n4H5x7CKq3Z6YRbJlvF+fGBIHv9oCfeG13IN+4cPaisQeL5
 rYFmzo2nt8C09zMk75BRqpqBiNrz6B+xHeXpAbbUkhl9mUc4qoQTG5TytplzKbu9/m86
 SyxFqJKpsA5QZvMcIkv1RyNJXZ92G8tYfk6VnzFtNyUV03hCnJirp8bKrCV9mN8P4rlS
 VG+HDNCkYGThPRui6sUP3IHrmNug0BN5kjsa9itsAcxlASeXViWO4yZgrfL6rVulcHr6
 wfQ+DijPNt/FW9UuxR980yoOmSCt8+gzj2BYIWJFgChPjXsa6ArghwscVzjahr2navQY
 W8Vg==
X-Gm-Message-State: APjAAAV0KSSgfZ6eNSV4VdpeUm63f22y7Gl8Y1suxV3h2e2aUqoPdEK+
 czWwLvffPi/4B5+2waqd1cTKfnzayzQMtTRB3L+oeg==
X-Received: by 2002:a9d:7245:: with SMTP id a5mr3902765otk.232.1562856239945; 
 Thu, 11 Jul 2019 07:43:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190709123240.16298-1-philmd@redhat.com>
In-Reply-To: <20190709123240.16298-1-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Jul 2019 15:43:49 +0100
Message-ID: <CAFEAcA8h-ghRdj+K9x-6559Djfpth1-s9aPargLkQjTDA5HsLA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-arm] 
	=?utf-8?q?=5BPATCH-for-4=2E1_v6_0/3=5D_hw/ssi/xilinx?=
	=?utf-8?q?=5Fspips=3A_Avoid_NULL_dereference_and_out-of-bound_acce?=
	=?utf-8?b?c3PigIs=?=
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
Cc: Francisco Iglesias <frasse.iglesias@gmail.com>,
 qemu-stable <qemu-stable@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>, Prasad J Pandit <ppandit@redhat.com>,
 Lei Sun <slei.casper@gmail.com>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oq7YRS5XllVp

On Tue, 9 Jul 2019 at 13:32, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com=
> wrote:
>
> v1: https://lists.gnu.org/archive/html/qemu-devel/2019-07/msg01238.html
> v2: https://lists.gnu.org/archive/html/qemu-devel/2019-07/msg01586.html
> v3: https://lists.gnu.org/archive/html/qemu-devel/2019-07/msg01657.html
> v4: https://lists.gnu.org/archive/html/qemu-devel/2019-07/msg01777.html
> v5: https://lists.gnu.org/archive/html/qemu-devel/2019-07/msg01959.html
> v6:
> - fixed datasheet reference, added Francisco tags
>
> Philippe Mathieu-Daud=C3=A9 (3):
>   hw/ssi/xilinx_spips: Convert lqspi_read() to read_with_attrs
>   hw/ssi/xilinx_spips: Avoid AXI writes to the LQSPI linear memory
>   hw/ssi/xilinx_spips: Avoid out-of-bound access to lqspi_buf[]



Applied to target-arm.next, thanks.

-- PMM
