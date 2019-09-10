Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp5189756wrp;
        Tue, 10 Sep 2019 01:38:58 -0700 (PDT)
X-Google-Smtp-Source: APXvYqye8jK5gv9bnzNBON7X42ffRAYKRJVYFaPwaIeFKbGTJnXPu3LVTb3xpm0ci4mO9SmQR1Vd
X-Received: by 2002:a17:906:4dc3:: with SMTP id f3mr24055634ejw.38.1568104738942;
        Tue, 10 Sep 2019 01:38:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568104738; cv=none;
        d=google.com; s=arc-20160816;
        b=qiG9j3zz9zU8MxEsZYSsNDI9IOkHth1110KXP1gVLZQQF3gY/dsGatpgn0dP4ojaf1
         ESrM7g1aRcImzV4gyZ//tNVhh29izPV+WfVJ5sbIWk96GZ2hE5wJpX8I7gbNo+QdHkuj
         GL8ziWTPOdW6PYjJ8bd5SjTrOJJMfRMc1mKdqCPYtDK4U4wqGJFpBAbBmNzbFzl3MQDA
         3MBbyTlZTX0hNUYBnFayUeK3fJ/4sMrVOsQOXiU28kjliR0ePRazgHbw8I0B41Vk8lWr
         d/osvIbsssxKsGrrAn5A+uVEkFG8CXR6t6S8eH6Yt/Tw3/jSJ8dOM5l94wc4AyShnG8C
         EMLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :mime-version:dkim-signature;
        bh=n3EdLZ/I+9KgAyrX3nxszcZrA5OOqP42Y3tI2lwoT8Q=;
        b=QoV8RoyAnvKIa9skVJTP4aXT0znA1aN/KcTJeTaVYJ4XI3N5OKI0b4hpQ77yOE27rx
         /kqcT3QOPX6Klvvdq/uOvYfZFK131tpBRVQHMgo4zCZgt53V00OI/OTli8vsvo50vvf+
         f2rUQ0sR9tej6A2zs99Be0mejeexKmS4TwLuPPdA2gTO/D3UAHV4izGsysBf72msLvrH
         4Vac1b4dkNatGGtQ3O9EXRzlxEUIbd9YyHwhtlm2HJ1BIb8N2/m/jaghfTrJB1erHJCG
         HeEdIVn2KpOFoJHlAGVKAv7IIGxm4QVi2rniOzfIA0Oq6Dkmt8tBw4NnzMwmv1rNhYyM
         lQLg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Hh2Vc7Pv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id qw15si9113168ejb.11.2019.09.10.01.38.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Sep 2019 01:38:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Hh2Vc7Pv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i7bft-0005qb-Nc
	for alex.bennee@linaro.org; Tue, 10 Sep 2019 04:38:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34767)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i7bfO-0005Xc-Ot
 for qemu-arm@nongnu.org; Tue, 10 Sep 2019 04:38:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i7bfN-0003yk-2a
 for qemu-arm@nongnu.org; Tue, 10 Sep 2019 04:38:26 -0400
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c]:39896)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i7bfM-0003xL-R3
 for qemu-arm@nongnu.org; Tue, 10 Sep 2019 04:38:24 -0400
Received: by mail-ot1-x32c.google.com with SMTP id n7so17233034otk.6
 for <qemu-arm@nongnu.org>; Tue, 10 Sep 2019 01:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=n3EdLZ/I+9KgAyrX3nxszcZrA5OOqP42Y3tI2lwoT8Q=;
 b=Hh2Vc7Pv9uFaSRK3z8ll1rZZU5FlGVkvIafMQp68JyjRkEir64gn8GAA6wav+Nn3ni
 rwGYmSjqAKHiTcWfIyYQJ2zwVyvZxxeplCiIIVqymC5toqRIj4wVftWvXNTJAjaiAXj0
 x+V0NCLGHgJ2bZc7docEkvzQcleLCurBzHLos6BUeqthvkR5Qd9Bj02RLmNaWt1lukr8
 3LCoGjc7Xvm0hkUJoNXqw+7e4xElQBIgFVQ9QqsX0nWw8U3Mm5QQwNTLz9t4CI8BmFOR
 GLHSvE3gWERr1UcWswPF2+5197+2Tg0f3cgpUTcGEhGkLlua+Nt1LWtx/TJ5yZS5OcAX
 GRRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=n3EdLZ/I+9KgAyrX3nxszcZrA5OOqP42Y3tI2lwoT8Q=;
 b=twbwtay9IJywgbbVZNVcA9SPauLXkZftcNwBxkxJ7JK7Y+EQvPJTIwDcmtNzJaiNqr
 5l6srvY49nZamOD6TyIkxmWRUYTkxJ2U/FfF2hmIcXnkBiokJM22NupceVMkCEn6lGe+
 21HoY4VHHULcgy61FXvgT0lhJv+GSdpkd4IhlzyRfOnXMHW74sjVp7/jTucgvni04qpG
 5IfqbSKIONyHZy2yzptzK/C9mQ6TBwLQdP0x8vN2jVI4CmNK1s+ZAWfgTHywYBwuNTE1
 6u1Ig2e3zyAbniNRtH0dMACzXKjd+lObSk+kNDLY2UgFvCX5p2FgFS1JFixoJwSioll6
 r4Pg==
X-Gm-Message-State: APjAAAVEgYWH6m5jGgus7ysrI67T59j9BZBzsjPQRgqvrxwWp3mtMwPj
 x2STLkG96h93zmUGFEDa/EwTdnJjooy3YcWffDWgxg==
X-Received: by 2002:a9d:5e10:: with SMTP id d16mr25207209oti.91.1568104703388; 
 Tue, 10 Sep 2019 01:38:23 -0700 (PDT)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Sep 2019 09:38:12 +0100
Message-ID: <CAFEAcA-14O3vYbUzCP7stDPffvHKaLrA-=apPXvGzRWoD1SXuw@mail.gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
 Qemu-block <qemu-block@nongnu.org>, qemu-discuss <qemu-discuss@nongnu.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 qemu-s390x <qemu-s390x@nongnu.org>, qemu-stable <qemu-stable@nongnu.org>, 
 QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::32c
Subject: [Qemu-arm] ANNOUNCE: emails from this mailing list will soon drop
 the [qemu-*] subject tag
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uMtskDz0/p5U

Hi; this is an announcement to let you know that in future
emails to all QEMU project mailing lists (including this one)
will no longer have the [qemu-*] tag in their Subject line.

We need to make this config change because having the mailing
list server edit subject lines like this conflicts with the
increasingly common DKIM/DMARC anti-email-forgery system. We
used to work around this by having the list server rewrite
email From addresses instead, but this has proven to have
bad consequences (notably that patches applied from emails
to QEMU can end up with incorrect authorship by accident).

If you were using the Subject line tag to filter QEMU emails,
you'll need to change your mail client's config to instead
look at the "List-Id:" message header to identify list traffic
(you can do this now without waiting for us to change the
list config to drop the subject tags).

Apologies for any inconvenience that this upcoming config
change might cause you.

thanks
-- PMM
