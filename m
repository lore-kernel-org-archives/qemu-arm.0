Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp9974439wrv;
        Fri, 9 Aug 2019 20:39:02 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzJLXlL/5VPO9YPQE5qPaZMcD5fuAaou0XJmBnPazf4hM2uSiE1a0ReUPutU6FZUkZyv26k
X-Received: by 2002:a05:6214:1254:: with SMTP id q20mr10482431qvv.164.1565408342594;
        Fri, 09 Aug 2019 20:39:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565408342; cv=none;
        d=google.com; s=arc-20160816;
        b=OSUc6gaz8Bmx20UOe4cljv818AuvHb/2xOcjiSG1lAdTiFfXwrKl6QDD9/jRKxb5CI
         DK1z7gM/AZK4Iw2licXQdwA8fnfYV7+TuO7FTu32ISrcUaKOnS+jVGx2i2wj5iYNL5p8
         BrcZdKT1oyEDHIPDDC6QxF8MTCdvVvVy1ePtBC6Qem6UXJa4cAH/vQ3wudGza6TvLgJs
         Vlh2+VX7lC1RGi4xGWerfVqW7ixUwZnhGTcibZ+QfvU0Y3oqQKwTBsBk2iX/l5kwhzDs
         9aiNzVV86ManltHyeXLtgJhtK6Sa67l4YNF6a9UtZWIy/HN11+nQVmjFOx/4kjWxpc08
         0p0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :mime-version:dkim-signature;
        bh=NYYfnDPDKe7HhMJeGbGiBZbd7S1he31CSCw15ZyXz8U=;
        b=rQbfJLlcgmOX2wePubmt0VnL260xOGyBBpswuVYp0sNIapqSrqBWqmpOM1xItQvXvK
         atSjo+e8co4nLMLc48Ge3v28w3afpLSK/c/wKxgPz4jZyiDr4X+sgnctb+eehHWGRh60
         c3l7UfB47lvXU++4/P8UwsXNiM8VIDIwX+276YH+ElSCHNOKaAGS/KqmCLPyyB39ix04
         jcY6GqHFzOe5p2/CPviGhuwHJQE0IWabVjcM2IBhPDdeAuHjtF40S9CYC74G/4gaXEPW
         40hCFiEtPoFjpP7Om2vO9FCExS8ZzJ8gqtuhaYc4AWgaprEDgggMroVoqV/PlG9ri7HN
         LFPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=dRNwFAUP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w194si55722604qka.122.2019.08.09.20.39.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Aug 2019 20:39:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=dRNwFAUP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:34718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hwIDe-0006Di-6H
	for alex.bennee@linaro.org; Fri, 09 Aug 2019 23:39:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59739)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <estebanbosse@gmail.com>) id 1hwIDZ-0006Dc-Fz
 for qemu-arm@nongnu.org; Fri, 09 Aug 2019 23:38:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <estebanbosse@gmail.com>) id 1hwIDY-000779-Jz
 for qemu-arm@nongnu.org; Fri, 09 Aug 2019 23:38:57 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:35568)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <estebanbosse@gmail.com>)
 id 1hwIDY-00076L-Bn
 for qemu-arm@nongnu.org; Fri, 09 Aug 2019 23:38:56 -0400
Received: by mail-ed1-x52b.google.com with SMTP id w20so97211699edd.2
 for <qemu-arm@nongnu.org>; Fri, 09 Aug 2019 20:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=NYYfnDPDKe7HhMJeGbGiBZbd7S1he31CSCw15ZyXz8U=;
 b=dRNwFAUP2ZCQHBlWw49td3kXimvcVSK0TLkslyw0ycVhS0VGCneyVsT5+k9cPW1/ph
 zZM5A8T03bivH+imtmm/EBD/VHkbUPkjtWp61u/B53jJ2CH9ns5ZvUmTLt3e4IS3wtlW
 +fVgXCGkl1KP6Lyp2XBboIYkUY14UDZFgjwkXfXcPZ46PhGkwtOt7hZdS2haxw6hm+7p
 Zuiep4DhaSy/i/thecDzHp58yCmYg/VE4x+mJUP9H0HWKzfy2rAp9I7or6OvNuuqHZjY
 2BQWXIPJJX7XIZl29EUGx+QemkyDFO7G3P6zCL1nr/lwZ/vujepA2/FAJtDnCHG9VRHe
 BIsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=NYYfnDPDKe7HhMJeGbGiBZbd7S1he31CSCw15ZyXz8U=;
 b=meu8Pox+pk/nDLKxHx7T0WfSSj9o51F7dFguM/WAbHdP3aJYn3O8Jm/IwHPmlugYRw
 e22c1X5sstqoJY+/Gi+vdcTVeS9yGb3PdIIIpwlHUnw6/phl+LsQ2h1UobaKuJCTiWDJ
 7Ax8V6rZ5yPAeGm3+oyeY1dqOTERUUd/x6LdpyXhl8dyJDrAZ5wxCHGuNIM2NhLL1YVh
 OPtyEGdCfmRMcxz28R54DRZ/XLZAXOgPKxCJKbcu6HeNOY4hgT62ohJoi4OJFQq0ZalT
 VRWrp5W1Fisjddr4J4eO1fc5XV6bSZBFDJEU3gDC4whEB8s0TrJvG4bumqYhDsbW587x
 Ry4w==
X-Gm-Message-State: APjAAAU+BQkNniuAJeLm4YEZVNOsuxgANkTMUbAc20GQvMC7M4CsGjuc
 ryAlHz2RJJMg4Lf7KoOqEhIJWdaAlN5eHHIyUU9Q+JEz
X-Received: by 2002:a50:8752:: with SMTP id 18mr13399409edv.96.1565408334531; 
 Fri, 09 Aug 2019 20:38:54 -0700 (PDT)
MIME-Version: 1.0
From: Esteban Bosse <estebanbosse@gmail.com>
Date: Sat, 10 Aug 2019 05:38:43 +0200
Message-ID: <CAGbAg_ANKR9zyAp3+pNRo6eVydQPaWrny62xk5NWr0DOD-7Jxg@mail.gmail.com>
To: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000b55173058fbb0760"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::52b
Subject: [Qemu-arm] Beagle Board support
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
X-TUID: a4TvGWb5dUm+

--000000000000b55173058fbb0760
Content-Type: text/plain; charset="UTF-8"

Hi,

I am new in this world, but I want to port the old beagle support for
qemu-linaro to mainstream.

Someone is actually working on it or is interested?

--000000000000b55173058fbb0760
Content-Type: text/html; charset="UTF-8"

<div dir="ltr">Hi,<div><br></div><div>I am new in this world, but I want to port the old beagle support for qemu-linaro to mainstream.<br><br>Someone is actually working on it or is interested?<br><br></div></div>

--000000000000b55173058fbb0760--
