Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp916772ejx;
        Fri, 4 Nov 2022 12:35:53 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7xvuPkmbZzh58qK9sgDAHlbCvoUYriBuhVszrP+6pb1yPzI7j1j7JQdvCwSeULDXCD5Rwo
X-Received: by 2002:a05:622a:4815:b0:3a5:25a0:9b7c with SMTP id fb21-20020a05622a481500b003a525a09b7cmr24499879qtb.668.1667590553283;
        Fri, 04 Nov 2022 12:35:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667590553; cv=none;
        d=google.com; s=arc-20160816;
        b=OtbTD4ftXNH6BEsHSBy1XP4xafyI0fSnUe8Sdrf+qOoQOSwNfz7kFdc9skTrK7tl7b
         zSXV6XcgeZIq1C/N/4i6M/oZ/y/va2PcXX1JUmOe8Fqq/5K4BZoBttWe5r1FqrYrQT+L
         Ty0iI81+ocF6RpEHJMDQo+egh1hUEEirSBiBDFelNXj6NhwL2KAewuZ27t/ZGulBhUhS
         YJ0XgWqyl32VoGTJ0j+HtZ87PK066qgn+PTuG/td/IXr+JdvHjvooI+WiNeIfyK7rldG
         Nx398q66ClXAtfx209SCqgzE3dyrm+96ca60zd9yewH1hqPaAlJ8M6MB++Bev5huY3/J
         pThA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:ui-outboundreport:references
         :in-reply-to:sensitivity:importance:date:subject:to:from:message-id
         :mime-version:dkim-signature;
        bh=sgIAFymNvoVsD/tCWMG5uEuQyVUl1jqrQ5m3A0EzVVQ=;
        b=AanyhMZpKNDbTUbzx7lR478NtVKtkcqQZ7b4gJ5Cj6Uez8fiJfBu1PkCF39xNd//Dq
         Gmgz/tksbmgL0D1diTs12hEaENgRAyHEN/qWdfJnYRe4qcwXNbSQVeyaZohH+OwgqoLU
         NVyH43LXpoSbo9z2vkznsAsyqTPDqMGnr/RWx9EXHC3FDak6lT7qjluh/wzphnl7oU3i
         82UzUNGJOk2KVosk+f5e4DqpKWnOdGF6zbT6hXfvcyaJ+v3tMdI/xcZeTRVFjxqXP5vJ
         ud/lgrTGIWR3bWK6gsBIsd55EAJK8n7bLBifhrzP+yrfuEdtqp5/yQbyiaPDWT0yhhhH
         8nDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@web.de header.s=s29768273 header.b=Lw3M4t26;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j19-20020a05620a289300b006ec5138f9d5si6583qkp.532.2022.11.04.12.35.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Nov 2022 12:35:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@web.de header.s=s29768273 header.b=Lw3M4t26;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1or2TZ-0004ef-Pi; Fri, 04 Nov 2022 15:35:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <strixner@web.de>) id 1or2TX-0004bW-Lb
 for qemu-arm@nongnu.org; Fri, 04 Nov 2022 15:35:35 -0400
Received: from mout.web.de ([212.227.17.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <strixner@web.de>) id 1or2TT-0003hB-Hx
 for qemu-arm@nongnu.org; Fri, 04 Nov 2022 15:35:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1667590528; bh=sgIAFymNvoVsD/tCWMG5uEuQyVUl1jqrQ5m3A0EzVVQ=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=Lw3M4t26LoLLtvrOadoFpnmqxlj9FnMuWK1Vai1erjgFoMINbULBGGq5qeC7FJE3D
 OmZZlHBuywPAjU+lrHHiGiW9eznvxKIZOP0G0xvpuzBkMoy5nN02RFQXM/PTxEOgnY
 P03Tje6Hj8XFrSzUq6+QFxgrRoU5i7zpW1UVhL0O4ISLdo7LqD5c8lGzxzZtWEGYIZ
 XojeDKwKydxMFXzodu6jCNxXLNuV/NgJlB42Qr8HmRf6y4qDAOVKn3TrHLhUWwFIrJ
 fIJbll/A1vdmjaeGwu03Su2/a0CTFeGQHtJuFxT/2FZ6MOaUV712cqHYLQESS7wwEj
 u/LZtkbeE11hA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [147.161.168.254] ([147.161.168.254]) by web-mail.web.de
 (3c-app-webde-bap10.server.lan [172.19.172.10]) (via HTTP); Fri, 4 Nov 2022
 20:35:28 +0100
MIME-Version: 1.0
Message-ID: <trinity-4820d005-d8aa-4b8e-8b4d-a14b6da85b7d-1667590528285@3c-app-webde-bap10>
From: strixner@web.de
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Subject: Re: Re: disable cpu features
Content-Type: text/html; charset=UTF-8
Date: Fri, 4 Nov 2022 20:35:28 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <CAFEAcA-jsfwqMpA7wQms-+-B6featT-bxUrc5Bqt7ebMLC87vA@mail.gmail.com>
References: <trinity-1a1f4562-d931-4e81-b242-5b94ee0216b7-1667582981668@3c-app-webde-bap10>
 <CAFEAcA-jsfwqMpA7wQms-+-B6featT-bxUrc5Bqt7ebMLC87vA@mail.gmail.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:ojxYnil2xPe51JrZWRIUlZZWprohOpBTq0W5KELKbmwsyhcjRXKTs9+cc+IRNis0PM578
 UqaWGqlgJcfTbWtKfFZs5v5KCI/lcmNLGhIURE1q38zrMbsosPRGVE1qq4BtL2ckVsNchGe27GwD
 Sadjik5qLueSCWsovnuzbPCG9dRzOxJdfXKsje3j/Qd/uqVJD0tlBtaj4IeJjiBGxMaQw/utdmGr
 nHP9egqIWZdADU30MOfEtrWfXkAKaurOA7p7TgVuBzC5Tb6q65ewtRr3giRKu9geVeZi14/o/bd7
 dY=
UI-OutboundReport: notjunk:1;M01:P0:1wfYX5J+Mno=;0XZdc+ssPJxUygCfdOU/OPIRYhO
 /a3jUwxILC8rx8j1qOq5S5uobFpnH352NTRWJMrDOWxXL/MCg/DdUY1a5qsc4BuwxEokKsbul
 Do047grNJwqQlT977xCRNEdIsHPsDfcRZQjkO5QAskYDNoHmxKG/ysO9BVXS5UWKIel5LfYT9
 ovjj76sROe4Sb0grhbu3Z4pqgg97lZfJJXaCg6i9hFjvt3XIa65+46d+ST/5qLIFOQcD+62aH
 9wiw81ZlgResf6EwaedkWMJOcEg4V7J6RcqWuM5tPp88CFo3utvPhC3jefHvGV3o2AbeiR0O5
 KUt2CJlmOF0wi0XAsdGsxHoZZb3a4tLTFvcBDmZkjVM0izYmX4MBxvt3zkrVrE6vEYwinh5O/
 s/xM3G9tvccFd0FnX4ISFHq95X4WUJCnyn5e6jADxnJ1d288P8yKDlBCu4feCfjNqIt8ZphlM
 wciX+JLEiW7T4i2uMmyUSWwbnKzOzDxEkJca0gWSS8oQT7FPsdGM5/32noYGpCp/PJ0qYN85w
 wFDJV2LOS5w7d5HDm8cIcbgHIBkT+helpaoVm1SwWjGIzlGuxHybl2AwMSJ++45VuVOGgYReS
 Qt28W81mmWrhgcYMxiZULFL5ek6l49+Y/JjGkbyDxh2a3RZRuP6iGd2qJezFbcwu2ogBI4Cha
 /I0kFiZgwOgBlNLkfe8s89ByhZmitypsQCZdBFLIYZnMz4S6cKMklSNr2NGh7b+eb71zAGmT7
 gBQv7SdcIjTgtF96BTKRa72gHHuAbCwZ/xDKSxIa1u6yr/88sibIB8nXNIsJNz7p3AMFqZotu
 xYu2nhPodFzXKjpjGocWJiOGfNO2sYHzmIcdUEfGKLS34=
Received-SPF: pass client-ip=212.227.17.12; envelope-from=strixner@web.de;
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
X-TUID: fXEecPEhi762

<html><head></head><body><div style="font-family: Verdana;font-size: 12.0px;"><div>
<div>&gt;That said, this:<br/>
&gt;<br/>
&gt;CPU part : 0xc08<br/>
&gt;<br/>
&gt;is a Cortex-A8. So &quot;-cpu cortex-a8&quot; will probably be<br/>
&gt;basically what you want. The catch is that the virt board<br/>
&gt;doesn&#39;t support a CPU type that old, so if you&#39;re using &#39;virt&#39;<br/>
&gt;you&#39;d need to sort out a setup that works on a Cortex-A8 based<br/>
&gt;board, which would be a pain.<br/>
&gt;<br/>
&gt;The simplest thing would be to tell your compiler to build<br/>
&gt;for a Cortex-A8 with Neon.</div>

<div>&nbsp;</div>

<div>Thanks for your feedback, this helps!</div>

<div>&nbsp;</div>
</div>

<div>Tried the realview-pb-a8 board with a Cortex-A8, but then I cannot boot the Linux image with the build environment: &quot;qemu-system-arm: -drive if=virtio,file=debian-arm.qcow2,format=qcow2,id=hd: No &#39;PCI&#39; bus found for device &#39;virtio-blk-pci&#39;&quot;<br/>
<br/>
Will try to convince the compiler to build for cortex-a8 with neon (Might have to rewrite a number of Makefiles as they don&#39;t seem to forward manual compiler flag overwrites from top level or environment to the sub-Makefiles in all cases... But should be doable. By default (without explicit overwrites) I already got a running binary - but apparently without Neon support).<br/>
<br/>
Thanks again!</div>

<div>&nbsp;</div>

<div class="signature">&nbsp;</div></div></body></html>
