Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp836660ejx;
        Fri, 4 Nov 2022 10:45:25 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5EgTt7yRKNssa53kj2gG/XmSC6XysqBBwoiR8rWnOFuvovXLK7kFykVS9WXyX07wY84nv7
X-Received: by 2002:ad4:5f0b:0:b0:4bc:27c1:f832 with SMTP id fo11-20020ad45f0b000000b004bc27c1f832mr13244643qvb.99.1667583925007;
        Fri, 04 Nov 2022 10:45:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667583925; cv=none;
        d=google.com; s=arc-20160816;
        b=L1/ayxbHee0kH/vyGz7p1bCEU1wNLdTmQ/nbOxoL6noYvQUsEk62Qklh5JDj36JzRd
         xjZOUtzOuXo6CnUMg+xhxahdGCoY3cGGnNem+AKD61qri0vG8mZmSZxUgAIe5YixRs1P
         GF2e5oSJDAzKoR699e8MHT9+jIO0kgDzci4wKtFdk1B/QG0BCqZqSl2kQrl6OUHJUnGo
         1ZxoAuFGh42nQIw2jPhX+j9Vh0JhZEgQ9fkjge1xu4xP5IrtHu+Cqs81HP7aPOHmEJ61
         jzJ6HPSt3gaMHltxot7dH5LT+S/T6drnDEJKQG8nfBcOxN0I1P7pUCsbOncLCPlcRxPY
         KC4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:ui-outboundreport:sensitivity
         :importance:date:subject:to:from:message-id:mime-version
         :dkim-signature;
        bh=9vGFIha4tpIHSqNAZqCdRvpMTonnSdI3tdglif3hLR8=;
        b=sEaXQY/DlxC23v2ANVfjO6UYgp3wwLF6AsixCx824g/aGP01gxlZCsvYq7K4t3/Jhl
         WE1Ue402dwqGZivVu9ZylfVlpjryofKSYXfrrCyOWbFSm3p1tlgTLI57/MGr4zZn8+ir
         AFTe9fFvd7nSodJCt7kklcc/dGipvwo3dmSA+e8+2G95/A8LLOJzs5G2hNcVxn9xA6L9
         tWl6RwOMi2ommy/xK46KI5tEKawz1eFsNa+qR0Hl7iHyhpCkCr2Badstc7bghWS251LF
         Sd8fIbTmkO0GN68+jv0zWqaB+ZcSfoDV6BmEaeB2wQ3Z9f9pVD8qAlzpZVdm/FYwf5vz
         lGGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@web.de header.s=s29768273 header.b=OMXZg6pS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ez8-20020a05622a4c8800b003a4d3a5ce56si2800905qtb.245.2022.11.04.10.45.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Nov 2022 10:45:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@web.de header.s=s29768273 header.b=OMXZg6pS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1or0ks-0007J3-6k; Fri, 04 Nov 2022 13:45:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <strixner@web.de>) id 1or0W5-0006MX-N1
 for qemu-arm@nongnu.org; Fri, 04 Nov 2022 13:30:06 -0400
Received: from mout.web.de ([212.227.17.11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <strixner@web.de>) id 1or0W0-0002s5-AN
 for qemu-arm@nongnu.org; Fri, 04 Nov 2022 13:30:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1667582981; bh=9vGFIha4tpIHSqNAZqCdRvpMTonnSdI3tdglif3hLR8=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=OMXZg6pSDqw84doxZMCqPkPjaMybdzUfpueB6JoQAmgLo0qu6Ckyy3gcY+wiR7VBs
 +wETmbSL0lg13IsO6Hf7dXN+Xm+6r0SDG4HhR03tGWcitEGn+LzY5NqEjM0QyRU4ug
 PEMD6Rqx94UqWKQwnG65s1esC9scMY6lt2m6fklpkT0/R4KJc3SX3cU1d7MRjxsltr
 UsovACL5mI8H+LZvOaomDkI9xVxxuwtywSkZBO9ammrgVmwcgVLoIy+gRAhJH0E8CG
 V1SHxpsQJcCcYtwIpkFjcQMbe20uOgOZtH39zP9eXQPelgX02O3h/wzF+C5drKBFWV
 QxJ1JRAl4qx+g==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [147.161.168.254] ([147.161.168.254]) by web-mail.web.de
 (3c-app-webde-bap10.server.lan [172.19.172.10]) (via HTTP); Fri, 4 Nov 2022
 18:29:41 +0100
MIME-Version: 1.0
Message-ID: <trinity-1a1f4562-d931-4e81-b242-5b94ee0216b7-1667582981668@3c-app-webde-bap10>
From: strixner@web.de
To: qemu-arm@nongnu.org
Subject: disable cpu features
Content-Type: text/html; charset=UTF-8
Date: Fri, 4 Nov 2022 18:29:41 +0100
Importance: normal
Sensitivity: Normal
X-Priority: 3
X-Provags-ID: V03:K1:rrDLgQGCAcDIBQcTBH8/qcj1IZOgYN6yALrDg8sXHgQyk1F8NzCCpSeh1f2h+0G/EYjaC
 VcDA11jGAcKgEphxDUq3kiHfLcdRS16dQhK9tAPz+awFbn+7MjirUYqmy/hGDvaZw/p5tA73RTuq
 GoqYI0q6eD4Ri2RTUT4XnUCWgvqzrSF3ROddpUdn6dYYSOg94g87N0BquX1WivIfmHIEwqPj7fMI
 B5y7gMQVq01FQlLSWJBc9jQEkv1E+2clAC6xn2HQu4DHvVzO/bHt7WUMDQj1Yh/IUo5hfaiFEtSU
 zE=
UI-OutboundReport: notjunk:1;M01:P0:omwQ3lZOS3o=;Tu2vfExTNe9YKB/9kR3tz/URjhw
 7qd96o0BGfBv/d5wgUHwMa7JgfdUM+9jPGvo1J7Sjc5Z5wLDEPmFqH3AAsMsDSQ3a2eNmmqqd
 O/8siPZapmA8zms7xXomU6gW4SG8OZsvWi0tCSbw2YdBDZlTQHSZt0ORPEe7XVmPeUlZrkcdU
 m5zN33voFYeDOrRMWXqd6neaA7Y4hQhQN0UfhfJIBfxgDzi1w9Yo2CFa2nPH7iMxNsXzzyD3N
 SU9ygyXiliIWrvmIW7ulTcNApBz78GPyTmHQzvxgj+f66N/kxN5zREwfKaEpH42Ti8wB2Orpz
 RR3t8bC9Pth0jTjTD7zaQzNbBlfax0GmOoMbHOlFoNCvjFF1AkWGAJ3Wn4V8No8XfNmrS6vf7
 vBSqDRXJsW5Lewdr3/jsca2zrvKlz0ZLb2VvZgPNDHezQG3JDJAkcKCiMLvtvCzbsUSm1CRRH
 +3EQ2MIP/a2GYv6cMpmJgpAC4ll4muhhOWpgolj8AAWSsa4SElD9k8udDMU8wDbM6cGz93cSR
 ez1w+zI0sg8exEgac5PKgk3EskoDOdV4GzxBU66IFbCGaPR3qDGH5U4bnFWVijb9U1JbXpIGq
 ZEazQW3RdcWv+q4w1kZPIeEYUtJ6jkK6jvrZBk7OGlLPB7mmrIHnUKpYU49+eYY8ZKfUknUve
 WxR0B4nVsIFv75u+Bo4ug43XH8jVaq44Lb04Opl+JdY/jgHTwVRIO+cJC7RgmfHJmQfnS0jZy
 Fvh/SfP0j9QDj7QoKEJsC290lKPK7yQ9qqSgAE0c2UQlMz1t403QXevJYAthMAcKQFVqJX/E0
 4bd/TbRr36aPxsARWCW+jgUMl8KyO+SHsatEn0yWB+ffs=
Received-SPF: pass client-ip=212.227.17.11; envelope-from=strixner@web.de;
 helo=mout.web.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, MIME_HTML_ONLY=0.1, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 04 Nov 2022 13:45:13 -0400
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: "Qemu-arm" <qemu-arm-bounces@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: n5oqT5BpnfhY

<html><head></head><body><div style="font-family: Verdana;font-size: 12.0px;"><div>Hi,</div>

<div>&nbsp;</div>

<div>
<div>I have a real hardware with these features:</div>

<div>&nbsp;</div>

<div>&#36; less /proc/cpuinfo</div>

<div>processor &nbsp; &nbsp; &nbsp; : 0<br/>
model name &nbsp; &nbsp; &nbsp;: ARMv7 Processor rev 2 (v7l)<br/>
BogoMIPS &nbsp; &nbsp; &nbsp; &nbsp;: 598.67<br/>
Features &nbsp; &nbsp; &nbsp; &nbsp;: half thumb fastmult vfp edsp thumbee neon vfpv3 tls vfpd32<br/>
CPU implementer : 0x41<br/>
CPU architecture: 7<br/>
CPU variant &nbsp; &nbsp; : 0x3<br/>
CPU part &nbsp; &nbsp; &nbsp; &nbsp;: 0xc08<br/>
CPU revision &nbsp; &nbsp;: 2</div>

<div>Hardware &nbsp; &nbsp; &nbsp; &nbsp;: Generic AM33XX (Flattened Device Tree)</div>

<div>&nbsp;</div>

<div>
<div>Now I want to emulate this as closely as possible with qemu in order to compile software for that real hardware (there is not enough RAM to compile on the real machine). But qemu (for machine virt and cpu max) simulates this cpu instead:</div>

<div>&nbsp;</div>

<div>&#36; less /proc/cpuinfo<br/>
processor &nbsp; &nbsp; &nbsp; : 0<br/>
model name &nbsp; &nbsp; &nbsp;: ARMv7 Processor rev 0 (v7l)<br/>
BogoMIPS &nbsp; &nbsp; &nbsp; &nbsp;: 125.00<br/>
Features &nbsp; &nbsp; &nbsp; &nbsp;: half thumb fastmult vfp edsp neon vfpv3 tls vfpv4 idiva idivt vfpd32 lpae evtstrm aes pmull sha1 sha2 crc32<br/>
CPU implementer : 0x41<br/>
CPU architecture: 7<br/>
CPU variant &nbsp; &nbsp; : 0x1<br/>
CPU part &nbsp; &nbsp; &nbsp; &nbsp;: 0xd07<br/>
CPU revision &nbsp; &nbsp;: 0</div>

<div>Hardware &nbsp; &nbsp; &nbsp; &nbsp;: Generic DT based system</div>
</div>

<div>&nbsp;</div>

<div>Thus when compiling an application in qemu with -march=native in qemu then it raises an &quot;illegal instruction&quot; error when executing the binary on the real target machine (it runs in qemu).<br/>
<br/>
So long story short - is&nbsp;there a viable way to disable the additional features on the qemu cpu that the real hardware doesn&#39;t have?<br/>
I can recompile qemu if needed. Tried to find the place in the source code where to e.g. disable features like &quot;evtstrm&quot; (which only has a few occurances)&nbsp;&nbsp;- but couldn&#39;t find the right place. Or is there even a (potentially undocumented?) command line option for that?</div>

<div>&nbsp;</div>

<div>Thank you!</div>
</div>

<div>&nbsp;</div>

<div class="signature">&nbsp;</div></div></body></html>
