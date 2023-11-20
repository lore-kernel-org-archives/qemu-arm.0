Received: by 2002:a17:907:1006:b0:9d0:bf65:29fa with SMTP id ox6csp2181278ejb;
        Mon, 20 Nov 2023 05:37:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGNP7ZfaAAhYHlmySjtn4pcW+35LFzoQcAEQ9jzF6JJDYWXCcvj/pNmzplv0xN56bB8JAMS
X-Received: by 2002:a05:622a:1884:b0:41c:d1e7:27b5 with SMTP id v4-20020a05622a188400b0041cd1e727b5mr6894533qtc.25.1700487477817;
        Mon, 20 Nov 2023 05:37:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700487477; cv=none;
        d=google.com; s=arc-20160816;
        b=nlM3X05mASZXKVyzs2r22LSTJunES+jRgCfInqPbU2JCcj0g4fOo4KbYlj7zM4PhoH
         K69DfQFPhTPglZXXvO5Jv+pqFworZqRbDgO5GsgN7b1rCzQ69lZZ/vyOL0Q27r8vfhQV
         CaqEjIuZwB+2QTmMvcoMQ3fB2mR/0L8zSnWDIbIWusb9thaonw3IEdg7DsOOdNtptazL
         T4wlKok4nQ0i0U2jcgpbWeJkAZ++UW4IcNGXq8D67SUsJfdKA3wgakpEc9jt3jn5Aq0u
         sGvJS2dAVbrUBhX7v9FKS1RFh0JsxJIa1O8hojqcytXbTG5VAZCaPUXuMbwlsT1Ub55N
         rVUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=NtKlazPp0iTgnh4ebXcT7yEof+LWTyqM4DYya5SuJaM=;
        fh=DBwo5oYV+Zl89FPcGyBzo6mnqwnGCoM6YpiQGc4/RNc=;
        b=pDyIB4BtCgLxW0g0RnVdxGePKTzQJWeUYHQk7Wyg+l9EWRaXZAsw+4ttOtuoP4FrIW
         WUUx7tRgtTWxV3uiXSodERueGvadem7HECo0hUANQdzzNi3fQNzMdheRQ8WuMcxtFbF/
         H516nFx5FT61jwRG6zOzPHWBT9/MoDcN8C0vKWcAZtkSs0c0yLia+9oPCjd9vOIr7L+k
         j/4t84+bnCpfd/alBYtkt8ZTp+IS3Nk986DNGkuvt6KbxqmWOtvjS5ruadsu37UAF6Y4
         sGPQzmw57C/BYpROX40aYV7V9CoPUa/m9AvupAUXSptC+qjnYLW10xxpRaFzUw8L6bx+
         FjrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=ednA2H6w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bp39-20020a05622a1ba700b0041814c12507si7317810qtb.383.2023.11.20.05.37.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Nov 2023 05:37:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=ednA2H6w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r54Sy-0004zq-Uw; Mon, 20 Nov 2023 08:37:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mahalakshmib200011@gmail.com>)
 id 1r52wx-0004os-Q4
 for qemu-arm@nongnu.org; Mon, 20 Nov 2023 07:00:23 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mahalakshmib200011@gmail.com>)
 id 1r52ws-0002vq-Kq
 for qemu-arm@nongnu.org; Mon, 20 Nov 2023 07:00:23 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-280351c32afso3447127a91.1
 for <qemu-arm@nongnu.org>; Mon, 20 Nov 2023 04:00:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700481613; x=1701086413; darn=nongnu.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=NtKlazPp0iTgnh4ebXcT7yEof+LWTyqM4DYya5SuJaM=;
 b=ednA2H6w3vDipr5eRG5hU7W1mS4UldHcI5m2fq5KzYGQVz/hsXDVVqzqzuRimi7SRv
 7d3PhvYKhhi6piN1jdNw2fs0e2mcAqqEgnyl6X4q6wTXLmxFooN9mI653LawtU2CoTY+
 DF1KyxpEYrf7ayd1sWTBNcuho8wrx+2snAUsXvThLVyOqsUxY1RgwxL0Pxl+bPQDOj1O
 nLG7BRLVXRWi3ynBJclYZCUnT0Bs0fUIeReFDDTyZSfT0U9WS73lt22T8FiVPEf3KnEh
 nW4XM7L2fN57GE8q0jeZQdEHR3NhdPr0c0usoolgVeElny7UAzUIEqF2KQI+yI9clUA0
 qd/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700481613; x=1701086413;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NtKlazPp0iTgnh4ebXcT7yEof+LWTyqM4DYya5SuJaM=;
 b=V3onF8Wac+3UwJ2YgEWWl7Jr1r93rR+zhGd06eJMZOs6iv3x/SQwptkWENEnyvjQQA
 J/7oN9v1HAgPhjsH2CVgmoo8b+vbtAjY94dS+mrglQyzZHTmh83g0DVpdXro4b2kCcC/
 EBQISxXog5IwXZEoXQO1igC/B9c7OcTZaYim+rH4FRWkiH/oYOlg05uzRK2GkYO+rGCV
 J/f8bRwO3/6+22BiOS+4Yss0x1J3JCiHplJp1Akj5RGi2hu8j4xGdf1rAShFtAg2I+F8
 05Wwx3SKHVe/hOqKBUDcI9QEWDmMN467OAWcAcMxkK/VvlPFSTW3VIY6ho21AZWjHysN
 wC6Q==
X-Gm-Message-State: AOJu0Yw7XKhMM1/lb0UcZeBsuDzmTalZGO+AOKx1zlzkLTb/hJgCtszn
 l77am5zwCgzDqV7QuYqUbQIgch3uyg1dx6CjR27aTdJTTiw=
X-Received: by 2002:a17:90a:356:b0:27d:4ede:75b0 with SMTP id
 22-20020a17090a035600b0027d4ede75b0mr7331172pjf.16.1700481613342; Mon, 20 Nov
 2023 04:00:13 -0800 (PST)
MIME-Version: 1.0
From: Mahalakshmi B <mahalakshmib200011@gmail.com>
Date: Mon, 20 Nov 2023 17:30:02 +0530
Message-ID: <CAK6G2r58Aoz0M71Xskui+zf_Y++He8q1AAxVFhU-v9Tqn4=Kcw@mail.gmail.com>
Subject: Unable to get guest OS console from Qemu monitor console
To: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000082ac03060a943ad7"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=mahalakshmib200011@gmail.com; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 20 Nov 2023 08:37:27 -0500
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: AZmkX7kTnSyH

--00000000000082ac03060a943ad7
Content-Type: text/plain; charset="UTF-8"

Hi all,

new qemu user here.

I am not able to get the guest OS console, i am able to boot it until qemu
monitor console
I am trying to
-boot qemu with arm OS, my host machine is standard 64-bit Ubuntu 20.04.6

Thanks for the help in advance!

 Regards,
Mahalakshmi

--00000000000082ac03060a943ad7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi all,=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">new q=
emu user here.</div><div dir=3D"auto"><br></div><div dir=3D"auto">I am not =
able to get the guest OS console, i am able to boot it until qemu monitor c=
onsole</div><div dir=3D"auto">I am trying to=C2=A0
=C2=A0=C2=A0</div><div dir=3D"auto">-boot qemu with arm OS, my host machine=
 is standard 64-bit Ubuntu 20.04.6=C2=A0=C2=A0</div><div dir=3D"auto"><br><=
/div><div dir=3D"auto">Thanks for the help in advance!

=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">=C2=A0Regards,=C2=
=A0</div><div dir=3D"auto">Mahalakshmi</div>

--00000000000082ac03060a943ad7--
