Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp760262lfm;
        Tue, 18 May 2021 13:40:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzCsszS5R4qowMT2V/VHeCh21HrCMkeqiVsBW3NALrEbjyneY7VrJJV5YLka98A/6SAiqae
X-Received: by 2002:a5d:87c4:: with SMTP id q4mr5540263ios.141.1621370459673;
        Tue, 18 May 2021 13:40:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621370459; cv=none;
        d=google.com; s=arc-20160816;
        b=UE8hIKvE6LQYVbe2EeBy++cV2jnG5npEdq5yNtvMxT+zjVQ0tZMLe51b4JY5qffGYa
         i6BM+E+ji6XRDAeumPIbBjO01IQhDJ7JLH+pqxFjDUffCyELcBkFNgFu7UhjjKvIZsh8
         ZN8MbfIIpcLl9xpTrwTe2Gm0wVP+G6JsCNEDDbgoTJi6aKZpP4QklYwQ4OoUnWwskr9L
         wPgNw5ciQgXEg2JtrJkM5U+7rYSGi/wrG8LRNCABH97vdqIwVy28V+tbXXpACamLpEuS
         CY2aIFQ9fogeW5TUo/0hVekFh7rWRnCY4fkyNirFzaoJLGY+fZh1yFBuXYROXBVXphc/
         2Z9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=Xkl/2ZEDENxEjZbdG3QQKiRzwO2UJoeP0s/IdTGEfR0=;
        b=oyOD8XScfAHepRuGaweoO1Np3oPxFF6ce0uKuxaIP1pmVoC9CFmN8+F8gRHMyObBvu
         OXZeFZ1e4zgnaxhTn8PafoSjUjJrRLCWJakyPi+kt95u3eavrAlN0wr1knhFgdRme2UM
         oWxAq+2aLq9BxqARXUcZiJX3vA/gQsckIvDGQein7/WZebNw5IiuTCBTXVa1tm/KCDgN
         IU5Y/qcf6FpAYoZa9pU47EKh9CN3gDhwfUVTZ+l9aC2Qfse85OL0wveFdnIkLvMbtBuR
         O+sfcJRGsC5RKjjLnWJ0aafPD6WQhhK9lL5uxMDNap2P93UP35RTiTm1vTx2DuWsQQko
         D0qA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=YQHaleDj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q17si12423014ilj.87.2021.05.18.13.40.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 May 2021 13:40:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=YQHaleDj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:52016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lj6WR-0006k2-1c
	for alex.bennee@linaro.org; Tue, 18 May 2021 16:40:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saadmohamed2011@gmail.com>)
 id 1lj6Nd-0001Rl-8D
 for qemu-arm@nongnu.org; Tue, 18 May 2021 16:31:53 -0400
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d]:45892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <saadmohamed2011@gmail.com>)
 id 1lj6NT-0001Jm-Kn
 for qemu-arm@nongnu.org; Tue, 18 May 2021 16:31:52 -0400
Received: by mail-oi1-x22d.google.com with SMTP id w127so7194400oig.12
 for <qemu-arm@nongnu.org>; Tue, 18 May 2021 13:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Xkl/2ZEDENxEjZbdG3QQKiRzwO2UJoeP0s/IdTGEfR0=;
 b=YQHaleDjyqEBwZcuhvUb/wWmKPI9fXalP/jlzllFRACx07iyMcFN427oDcbNyQsRiP
 Wdeam35GOZnXIDSdJCImYmJB5GsYAIiljFoXbW2H5Kl5puB/Z81+jOzRHcFWL3ECkeoM
 x3Dl8YM3vyloxxJO6PM6lI1PGw3VuR0WhZF7uqHvHmWIjkg5JzgIbCFe3k2XFFfPeTfl
 Bux+MIe1OszXS9lv5IyFYw0H0CSE7kGouLbSOh1QQ3QuBL2bXwKgRgXn76YCwEnrVSY1
 SHJzEof5GTVricUAcBpOCR5X6ehRkumPIV2+pmLWdJrzpoIxFSJmB9/tqhLBY1/7aNo6
 5gfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Xkl/2ZEDENxEjZbdG3QQKiRzwO2UJoeP0s/IdTGEfR0=;
 b=QD23g67OVnQbtdZ3LLKy6i6Ay8CYi4kUc332rga4Ry+4iIAufBovCXBfNJufGc7Uhd
 ZudR/SOak2cFzPyAelhFBtH+/EGObgBYEqej6CbqOt3O13M/tQhcJ+MUhhZz2LzMSOmj
 b/thL+erEp2IuT9TvQH2uYsBWz9/WVxlvjaDfzfW1hreX1GFXHdfPK1uMa0E7iZbeoaz
 grEQp8hvO/vqQv9bkFo/2kofD49TrfHevUYjkvTlzE6yFjeOebJd/sFqcxNS++TzDB/1
 zbglHLk2YuioDvW3yGFwa82Tmvl5fAHRTz+31aRI8MU/OjdgUxWXRdvoz11hJ51afS5v
 6WDg==
X-Gm-Message-State: AOAM532v29mLzrlOGK61XyoQU1qR75fRVb+9SmJT0fo/sNSMc+izUmn9
 BH07/LVUXjIhRJwRWXelMIbTxcCLFjZPP1iBbY+JzyQcMZE=
X-Received: by 2002:aca:5e8a:: with SMTP id s132mr5366865oib.94.1621369901427; 
 Tue, 18 May 2021 13:31:41 -0700 (PDT)
MIME-Version: 1.0
From: Saad Mohamed <saadmohamed2011@gmail.com>
Date: Tue, 18 May 2021 22:31:30 +0200
Message-ID: <CAFSPhnvA0AiZVGkSp+jtUD6=NJ9fF27GzwbYzsFSfQfmXQOyuQ@mail.gmail.com>
Subject: Qemu Support MAC to MAC communication
To: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000062de905c2a09902"
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=saadmohamed2011@gmail.com; helo=mail-oi1-x22d.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-TUID: fUVueHMUWWL0

--000000000000062de905c2a09902
Content-Type: text/plain; charset="UTF-8"

Hello All,

I am trying to emulate ZCU102 Xilinx MPSoc, which contains 4 Giga Ethernet
Mac Controllers. GEM0, GEM1, GEM2 and GEM3.

I have a petalinux running on the APU part which controls GEM3, and I
managed to communicate with windows application through GEM3 and Phy
transceiver Model for Marvell.

On the RPU part, I have GEM0 and GEM1 controlled through FreeRTOS and lwip
(TCP/IP) stack.

I want to ask if is it applicable to connect GEM0 to GEM1 directly (bypass
Ethernet Phy Models), where I send from one GEM and receive on the other
one.

Note: I am using *user** network* as I don't have privilege to use tap. I
searched a lot on the web to find a solution for it but I didn't reach
something similar.

BR,
Saad

--000000000000062de905c2a09902
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:arial,he=
lvetica,sans-serif;color:#000000">Hello All,=C2=A0</div><div class=3D"gmail=
_default" style=3D"font-family:arial,helvetica,sans-serif;color:#000000"><b=
r></div><div class=3D"gmail_default" style=3D"font-family:arial,helvetica,s=
ans-serif;color:#000000">I am trying to emulate ZCU102 Xilinx MPSoc, which =
contains 4 Giga Ethernet Mac Controllers. GEM0, GEM1, GEM2 and GEM3.</div><=
div class=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-serif=
;color:#000000"><br></div><div class=3D"gmail_default" style=3D"font-family=
:arial,helvetica,sans-serif;color:#000000">I have a petalinux running on th=
e APU part which controls=C2=A0GEM3, and I managed to communicate=C2=A0with=
 windows application through GEM3 and Phy transceiver Model for Marvell.</d=
iv><div class=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-s=
erif;color:#000000"><br></div><div class=3D"gmail_default" style=3D"font-fa=
mily:arial,helvetica,sans-serif;color:#000000">On the RPU part, I have GEM0=
 and GEM1 controlled through FreeRTOS and lwip (TCP/IP) stack.=C2=A0</div><=
div class=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-serif=
;color:#000000"><br></div><div class=3D"gmail_default" style=3D"font-family=
:arial,helvetica,sans-serif;color:#000000">I want to ask if is it applicabl=
e to connect GEM0 to GEM1 directly (bypass Ethernet Phy Models), where I se=
nd from one GEM and receive on the other one.=C2=A0</div><div class=3D"gmai=
l_default" style=3D"font-family:arial,helvetica,sans-serif;color:#000000"><=
br></div><div class=3D"gmail_default" style=3D"font-family:arial,helvetica,=
sans-serif;color:#000000">Note: I am using <b>user</b><b> network</b> as I =
don&#39;t have privilege=C2=A0to use tap. I searched a lot on the web to fi=
nd a solution for it but I didn&#39;t reach something similar.=C2=A0</div><=
div class=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-serif=
;color:#000000"><br></div><div class=3D"gmail_default" style=3D"font-family=
:arial,helvetica,sans-serif;color:#000000">BR,=C2=A0</div><div class=3D"gma=
il_default" style=3D"font-family:arial,helvetica,sans-serif;color:#000000">=
Saad</div></div>

--000000000000062de905c2a09902--
