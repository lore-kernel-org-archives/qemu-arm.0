Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp2950294lfq;
        Mon, 11 Jan 2021 11:50:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwbL3lr6/FwzjB/9z1U8veTidX9HSLBXSYjNrUfy2hL6Tzk5+WG4ymcSp5awKPO4oLmE9T8
X-Received: by 2002:a25:80c4:: with SMTP id c4mr2158081ybm.95.1610394645534;
        Mon, 11 Jan 2021 11:50:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610394645; cv=none;
        d=google.com; s=arc-20160816;
        b=e3GKHGwjYTq4pKdKAPwbxuQ+RaTuT6KnyaWhBO09pllLNlUkUTB1bmhKtWPQWP3Y7P
         wleZlfaIaJUhuMoQWPEI+x0/KXXl27HZ42S79howpbGARzXNAlpb5yqjX6Ypj3CNDRvi
         krfj27PE7G+NpzP6uHDKmbneRqKCQYBmZtXc8S+QP/Cufm+6cOp0zOAuA0B9/jjYp0Uq
         UTHpmYzcC9FYLGpOHlrELrppFirmqfNvqaTfhewAmVTEP+OkpvjXGF8QvqbO5cYQbCGk
         6hSBn3w5e5Tzwbl3xQMtWlR5anY6gKb/3syMKyM2YDI9j45k64ARamHYKEc1PCUy+HJb
         50uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:to:from:subject
         :message-id:date:mime-version:user-agent:dkim-signature;
        bh=hqWwZfgMLr0NjKuAfYqiVquXpWN9vChPhG7NhKj4Rfk=;
        b=R610GCNQRqQkq11SqZOCe5jv86joHKkVBck3b35WgwJrWOTmKOpu0Sok2hMOcDE2z2
         CmyiZ9ejBttD96Ilql2E/Jh7WlKHl0YXr6aBttUSgSOukLCHdiHg+XKXp22vCL8sB07R
         TiEVSJarFXOconHlGLVFr0h9HTgZGWg3zSTFNeOHBta39f/QoQFNCVc37heAnwq58Z6b
         nSDAK/UTKhzjYU34UXAWpzkVdhS4AhOYJkUGj6bnCba4qkhZIQaVg4pQR86qjK3V9pQa
         +N/nuZOxpvHFf2hH05YzzD+1gp20AEBwzIg9aLkQmo0NRaKvfFUFeD5opwHwpVxHL1uB
         MdEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@freenet.de header.s=mjaymdexmjqk header.b=FXqVHB2d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l20si812307ybj.124.2021.01.11.11.50.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Jan 2021 11:50:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@freenet.de header.s=mjaymdexmjqk header.b=FXqVHB2d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kz3DA-0008Kv-F3
	for alex.bennee@linaro.org; Mon, 11 Jan 2021 14:50:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andschlick@freenet.de>)
 id 1kz2f4-00020h-EK
 for qemu-arm@nongnu.org; Mon, 11 Jan 2021 14:15:32 -0500
Received: from mout3.freenet.de ([2001:748:100:40::2:5]:52356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <andschlick@freenet.de>)
 id 1kz2ev-0008Ma-Nl
 for qemu-arm@nongnu.org; Mon, 11 Jan 2021 14:15:26 -0500
Received: from [195.4.92.127] (helo=sub8.freenet.de)
 by mout3.freenet.de with esmtpa (ID andschlick@freenet.de) (port 25) (Exim
 4.92 #3) id 1kz2en-0005ID-S9
 for qemu-arm@nongnu.org; Mon, 11 Jan 2021 20:15:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=freenet.de; 
 s=mjaymdexmjqk;
 h=To:Reply-To:From:Subject:Content-Type:Message-Id:Date:
 MIME-Version:Sender:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hqWwZfgMLr0NjKuAfYqiVquXpWN9vChPhG7NhKj4Rfk=; b=FXqVHB2d4ljKvRioTy3rk9a+6f
 PVoAodT1EApPvGH7EMW9DSrGT08kA6/FVQ/NZn77YA4dl/zyuSP1anLoUNZnL55QQFfpkVl6kc6Qu
 ukkJKI6cmqmABD4DqEUoMw+lFXIhAX1T6RR0GdvO5BC0JXeudwpNmiwx1bb/OpGOwM/k5UhSwrVFq
 tqIFDIeS4mEmpBJ6tCitIYvAEnnOerKwYPqKLYFog17ZarOvOsSdgSCkl4NIGi0+rzSDgtA6KxWNW
 DAu+75tptubN5u1YE2yij8xM4T4W14CXxOjrInWFEWyVmZI1yEMKfHGxZgeu53t4i5I8Jv3YDHuM4
 WZ/fTp0A==;
Received: from api04.emo.freenet-rz.de ([194.97.107.169]:33898 helo=api04)
 by sub8.freenet.de with esmtpsa (ID andschlick@freenet.de)
 (TLSv1.2:ECDHE-RSA-CHACHA20-POLY1305:256) (port 465) (Exim 4.92 #3)
 id 1kz2en-0005hB-QN
 for qemu-arm@nongnu.org; Mon, 11 Jan 2021 20:15:13 +0100
X-Abuse: 000000 / 84.149.233.20
X-Originated-At: 84.149.233.20!1234
User-Agent: freenet-api2
MIME-Version: 1
Date: Mon, 11 Jan 2021 19:15:13 GMT
Message-Id: <71df6296a8a7133097d6e0eda7168a2a@api.mail.freenet.de>
Content-Type: multipart/alternative;
 boundary="------------000706050306000208060103"
X-Priority: 3
Subject: qemu-system-aarch64 error
From: andschlick@freenet.de
To: qemu-arm@nongnu.org
X-FNSign: v=2
 s=2D0C065C46E01C2E7A70251AC7006BF19577A31FBEBFFBEBA2A6162051B632B8
X-Scan-TS: Mon, 11 Jan 2021 20:15:13 +0100
Received-SPF: pass client-ip=2001:748:100:40::2:5;
 envelope-from=andschlick@freenet.de; helo=mout3.freenet.de
X-Spam_score_int: 7
X-Spam_score: 0.7
X-Spam_bar: /
X-Spam_report: (0.7 / 5.0 requ) BAYES_00=-1.9, BOGUS_MIME_VERSION=3.499,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 11 Jan 2021 14:23:57 -0500
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
Reply-To: andschlick@freenet.de
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6nqUABVs/dtO

--------------000706050306000208060103
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=utf-8; format=flowed

                       Hello,=0A I installed qemu on a windows 10 laptop an=
d wanted to start and install opensuse aarch64 version under qemu-system-ar=
ch64.de and I get the following error message.=0AC: \ qemu \ qemu-system-aa=
rch64.exe: No machine specified, and there is no default Use -machine help =
to list supported machines Is it no longer possible to use aarch64?=0Agreet=
ings=0AAndreas    =0A=0A=0A
--------------000706050306000208060103
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>   <head>       <style type=3D"text/css">p {margin:2px 0px;font-famil=
y: Arial; font-size: 14px;}</style>   </head>   <body>       <p><span class=
=3D"JLqJ4b ChMk0b" data-language-for-alternatives=3D"en" data-language-to-t=
ranslate-into=3D"de" data-phrase-index=3D"0">Hello,</span></p>=0A<p><span c=
lass=3D"JLqJ4b ChMk0b" data-language-for-alternatives=3D"en" data-language-=
to-translate-into=3D"de" data-phrase-index=3D"0"> I installed qemu on a win=
dows 10 laptop and wanted to start and install opensuse aarch64 version und=
er qemu-system-arch64.de and I get the following error message</span><span =
class=3D"JLqJ4b ChMk0b" data-language-for-alternatives=3D"en" data-language=
-to-translate-into=3D"de" data-phrase-index=3D"0">.</span></p>=0A<p><span c=
lass=3D"JLqJ4b ChMk0b" data-language-for-alternatives=3D"en" data-language-=
to-translate-into=3D"de" data-phrase-index=3D"2">C: \ qemu \ qemu-system-aa=
rch64.exe: No machine specified, and there is no default</span> <span class=
=3D"JLqJ4b ChMk0b" data-language-for-alternatives=3D"en" data-language-to-t=
ranslate-into=3D"de" data-phrase-index=3D"4">Use -machine help to list supp=
orted machines</span> <span class=3D"JLqJ4b ChMk0b" data-language-for-alter=
natives=3D"en" data-language-to-translate-into=3D"de" data-phrase-index=3D"=
6">Is it no longer possible to use aarch64?</span></p>=0A<p><span class=3D"=
JLqJ4b ChMk0b" data-language-for-alternatives=3D"en" data-language-to-trans=
late-into=3D"de" data-phrase-index=3D"8">greetings</span></p>=0A<p><span cl=
ass=3D"JLqJ4b ChMk0b" data-language-for-alternatives=3D"en" data-language-t=
o-translate-into=3D"de" data-phrase-index=3D"10">Andreas</span></p>   </bod=
y></html> <br><br>=0A
--------------000706050306000208060103--

