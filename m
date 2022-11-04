Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp837047ejx;
        Fri, 4 Nov 2022 10:45:53 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4C2IRFLJuMcxqxJUuIf2GQqKqRlhkvwpaU5qEtQvZx4nBdWeoN1Fh142hQO56Js0wJiNME
X-Received: by 2002:a05:622a:e:b0:3a5:723d:9de3 with SMTP id x14-20020a05622a000e00b003a5723d9de3mr1834992qtw.432.1667583953320;
        Fri, 04 Nov 2022 10:45:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667583953; cv=none;
        d=google.com; s=arc-20160816;
        b=z/hfXQsgHxngNnIokOLIt0DXB4NSiXGydnog3z19gVzeypIOoTUt6pivah8YaZHLdt
         UDl2ZheaiOtqkho8Kx141i/MgGgWU736aL/2pxmkqhXRY+xF3fkEpDgoFb/mZMMdtQAJ
         hh0F2xXRJA187zXO3Cq3lwtUL2bMH2g74F9t9ahsoz9TzR1Mo6BXTG3FIoF49r/DjkZl
         K+sKjZnAA01zDWeTe21E7LXMpB6ZN8zA0W+w4FlxqffRIu2JoRi9ZcJCfzf9vlWuqi4G
         Pyj6befKZuFGbfSpyhW+MKSZdcTkU/OIt5MNqsW/0e2FpmhInKb8OY1nEi5T/XA1/INI
         tqCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:ui-outboundreport:sensitivity
         :importance:date:subject:to:from:message-id:mime-version
         :dkim-signature;
        bh=85Vlo+bkPOyC0Zeww+G6Thhy+Cciw8DW4PLylkzTK2g=;
        b=mUpU9iGfLBO71Ile+JyUKfJwfyvNZ+XOM5sUIKdF3hUPHMpKO/k0p7eD5PuAcT/Ovx
         Fa6NydfQdVerAXdmjjlJLQVDC7GWF4u+ds5vrwpUMN1cH7eTp4uGMCK/xiXI66p8B350
         EgX07PFwYA02vqlMmH9N9WtMTTAaJeGiN7qaxLBJ+PDWSuwh6EYdKNhrPeJSUFi+rN9S
         FAWX84i7ituE6IVx4BXvhgnml4cmrdg4ltbiwEYksGPg7MsSlphWIZjfJ6srSPvRrDGT
         Kmrsc3e4cy922R5tEjKKM0UHpHbr2SWeOphQvvk0B4jRqa7EN9ZUuCUHkmSUPZfS+5sc
         ZMjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@web.de header.s=s29768273 header.b=CAo1GID0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w10-20020a05622a134a00b003a4fe7c1e80si3637102qtk.431.2022.11.04.10.45.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Nov 2022 10:45:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@web.de header.s=s29768273 header.b=CAo1GID0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1or0lG-0007nz-Bg; Fri, 04 Nov 2022 13:45:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <strixner@web.de>) id 1or0lD-0007kA-Cu
 for qemu-arm@nongnu.org; Fri, 04 Nov 2022 13:45:43 -0400
Received: from mout.web.de ([217.72.192.78])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <strixner@web.de>) id 1or0lA-0005Ax-PV
 for qemu-arm@nongnu.org; Fri, 04 Nov 2022 13:45:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1667583938; bh=85Vlo+bkPOyC0Zeww+G6Thhy+Cciw8DW4PLylkzTK2g=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=CAo1GID0zEg4AxOfQHCr7aJZlH81FLR7c2kmDWQmI6jiV3Q3waTIcRSEv+wfGxV/H
 Tkxh1npDKA0NtQs1CYMwkuvW3RnT8uNcJBZ+rCYQWVAy6vxWil1bKIqQSojmQyvqdw
 jgd7hMg72npSY05G7YyfqsuF9/2jH7KsIjZQ25jDIPtFwEek1XstjPUgCO68zKxAmr
 yThzI5aOYcIQVejKAVC0gyJQ7e/xu6XftkWpgnilgCGa8vlt4+dWyVeFD1Jrh7azSc
 y/pEjBEinBfhY4/TD+SOM2YWGzcI25mUCmWMx1EyNyX3f8iIH5CK9YiQGcE5pD9D3d
 m1TrgI1r0SoUg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [147.161.168.254] ([147.161.168.254]) by web-mail.web.de
 (3c-app-webde-bap10.server.lan [172.19.172.10]) (via HTTP); Fri, 4 Nov 2022
 18:45:38 +0100
MIME-Version: 1.0
Message-ID: <trinity-c2857f44-3ff6-404c-8abf-f5bdf2b89eba-1667583938829@3c-app-webde-bap10>
From: strixner@web.de
To: qemu-arm@nongnu.org
Subject: disable cpu features
Content-Type: text/html; charset=UTF-8
Date: Fri, 4 Nov 2022 18:45:38 +0100
Importance: normal
Sensitivity: Normal
X-Priority: 3
X-Provags-ID: V03:K1:RSvahkQCktxeS1ZXqPcU86kbFkaILBbbq5Sy1ECr80YexzvsLlRPN/D4Uk//1XJ/ZnudJ
 Y+IavnjLpoPtSvvIAX7Jt6aCYNYYr5cYIhojjtbRjP9DvnjQjGim6BZaxKRFheqAyhiYCJ691bTL
 BktsEANB89isHu3uCFaLyhbFuSmCpY+ApYWtOWsH69T4jXSQH9B0ewcRVnainywaoRaFZtUOYo9q
 3nUP8HanDCHxjruAsD7XbbXbcPpiW8/UGpzFbHwej7sLVGymirXo1HWtTwfTHE4Z7tZX9/g63x+X
 Ic=
UI-OutboundReport: notjunk:1;M01:P0:wUlvQlNfyqQ=;uYHxWVJJauI/2HrPSoQskOgHD2i
 L/e0mKWuUfWEeW2sNY7zTmTh2G7DC+jR1hTZpu5LszikzuXBFUL9HrGDw+Qe13HiKcO42VHPh
 skGbzmYs0HhlJcDWnERiVTkpv+ZkT0ffGzNoFAMfnuwZYriKHSDtejEgjDbaSVbMKZSWGL1v4
 g3ax/io+UT0rbKfn7lV+LfLFCOnJLwVaUIte7XuN853CMgaaYE5YMdjoc6Ucbodfn5XivuxX4
 JfUppHc2tWPKSrnsWDII4j1xbzVwGQsxQV06tJek62bSykV8U/rA8sae9KDWCNqHeq+hgd92j
 Md5zU8nkt9DjK3BEluBuxAnQcSCWL0Aysf7VddHXoZTtUojocH/688lCVAZnNhKFG5TSQA2R2
 npY4e0hgelndzx5UWMFvGQNDkgLFxXenrdTFLr+iX/46iCStKiFJnFM7ItWEXCgMLe15bdL+O
 KnjnHGCeR9tniguuJV8RNOi384RaZ95O0ZLOLgC4eQzGlQe3O/RFrsMRsjNjCCRGzVNTzH2O2
 6wZkaOAYOHQ8a3VlvcRXI825+OWG6qKvDKuBiX5IUwHDLaFODH/fojNtNxA8w+tq6C2z0uVdj
 0eTV9NanqFGVkeAK+wJTWBulp/n8PDI7uLrmZUPmXfQ3xHhgTkWhygaVA873/hqKmszDj1Or5
 xTb4O5P4OWji5RwrwF6XVcrc6dgq6Wa5LoABkg5Epvr8BySvyfyP0l5cjPuSFlRwObGQq7o1u
 FUjP6XoUgfPJfjymj/R2uMfcso4OmvdXXqAqHU/gm/5KIfLoUUvPD43es59Cf5XEZcx1a4uwB
 TxDiYiqLcb0nBy+8ugMuUwzNEzXueSDIGc7S8rlRMRz54=
Received-SPF: pass client-ip=217.72.192.78; envelope-from=strixner@web.de;
 helo=mout.web.de
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, MIME_HTML_ONLY=0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-TUID: 310bTLhxcXE/

<html><head></head><body><div style="font-family: Verdana;font-size: 12.0px;"><div style="font-family: Verdana;font-size: 12.0px;">
<div>Hi,</div>

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

<div>Ferdinand</div>
</div>

<div>&nbsp;</div>

<div class="signature">&nbsp;</div>
</div></div></body></html>
