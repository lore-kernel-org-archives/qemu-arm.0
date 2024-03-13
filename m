Received: by 2002:a17:907:991a:b0:a45:b507:d90a with SMTP id ka26csp2547568ejc;
        Wed, 13 Mar 2024 08:46:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUnsfiPq0K8hB65SrSOkSQJe4DTTJHtfugRfB1OQME9lBaHwMUbyNrysjzxsyKnQ6qw2/fQ1nOgbGF5BR1Tt1TFNp6VHqT4
X-Google-Smtp-Source: AGHT+IGUSpq/TZklVao706CiFH4mfqk1vAQw7F42P06aVnk2GAWe1Q8d8VYr3NxudiRTK+9GUdOD
X-Received: by 2002:a05:620a:4055:b0:789:d140:5ab7 with SMTP id i21-20020a05620a405500b00789d1405ab7mr189556qko.11.1710344819500;
        Wed, 13 Mar 2024 08:46:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710344819; cv=none;
        d=google.com; s=arc-20160816;
        b=PuR77kb8qGxggwhlICqIvqG1I/9R1O3SKXJlh3phBQCIC9UvEH+hILDfbYC+xF1r0u
         /kFYw7tU8BtlkTaCKaOmX/BP4mkr5Fq0g3B/EPRWJEyhDXtAm1Nnarv90m9VDleWEEiK
         mvBr9eFxcu09uAnYhywUQ+nTVAdiHu2OdAC/XMQ77QMlwD9dV02ZIITf7vFKpi8Xn0Hk
         R56w60anJi1HjkqIL6BTwfbv8VEEdyc3AWgK5MNAxLZRIctZASzeg4m/oGwk4t4hSCdo
         3iq41IdF3kMRzy1S2MzXciDvBR4LbDBMe96EoCEImvNlMKZfL3++D1HoJDKjl0Swruav
         f52w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:message-id:mime-version:subject
         :to:from:date;
        bh=HMKP6XyoiRZvcdX56a+yBt32GPNWp/AkA+rOU+Lp68I=;
        fh=DBwo5oYV+Zl89FPcGyBzo6mnqwnGCoM6YpiQGc4/RNc=;
        b=VRapjiZ8PQ3Zg9BL+ATug2zwFcIyuvvI9PvXPzc53nQWWCmz43d4ObYZ6ExEdeYuAv
         +EfQwD8rQTHIrAHfzDiHSpFEsi/4vcxGyvUC5QVRKxsf+48vmPXxrceQnhRxioDykGJz
         /AIqkiP8PJD9g4+06XdaCQsoTPB0IdfJGJQmpYywCSJchZILzI4/zmUylLxXiRlnDz0m
         avyT+5mXDCDUtqLt+mxtitfXc5FiJZuxdvK1MgM2kgFiY7qLnFlaMSpMn0m9mwukpdwH
         2dQx1bGpQOgOilvbi2Ze4dEKEffIU1RK+rukM6XkrywpoJ8eUIdq2E+h09sQaEQ1mjFm
         IGlw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bj19-20020a05620a191300b0078839b2e9b4si10771175qkb.245.2024.03.13.08.46.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Mar 2024 08:46:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rkQoU-0003r4-ME; Wed, 13 Mar 2024 11:46:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhouxia_icsr@zju.edu.cn>)
 id 1rkPc3-0007H4-Op
 for qemu-arm@nongnu.org; Wed, 13 Mar 2024 10:29:47 -0400
Received: from azure-sdnproxy.icoremail.net ([52.237.72.81])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhouxia_icsr@zju.edu.cn>) id 1rkPbz-0004Mw-5F
 for qemu-arm@nongnu.org; Wed, 13 Mar 2024 10:29:47 -0400
Received: from zhouxia_icsr$zju.edu.cn ( [221.218.138.111] ) by
 ajax-webmail-mail-app4 (Coremail) ; Wed, 13 Mar 2024 22:29:28 +0800
 (GMT+08:00)
X-Originating-IP: [221.218.138.111]
Date: Wed, 13 Mar 2024 22:29:28 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: "Xia Zhou" <zhouxia_icsr@zju.edu.cn>
To: qemu-arm@nongnu.org
Subject: Will QEMU Support ARMv8.9-A Permission Indirection & Overlay
 Extensions?
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT5 build
 20231205(37e20f0e) Copyright (c) 2002-2024 www.mailtech.cn zju.edu.cn
Content-Type: multipart/alternative; 
 boundary="----=_Part_101905_1831961221.1710340168870"
MIME-Version: 1.0
Message-ID: <4f10e5bd.71e7.18e3837dca6.Coremail.zhouxia_icsr@zju.edu.cn>
X-Coremail-Locale: en_US
X-CM-TRANSID: cS_KCgA3W79JuPFl02N6AA--.8454W
X-CM-SenderInfo: p2kr355ldbxudvu66yvxohv3gofq/1tbiAg4TBmXxrqoBHQAAsV
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
 CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
 daVFxhVjvjDU=
Received-SPF: pass client-ip=52.237.72.81;
 envelope-from=zhouxia_icsr@zju.edu.cn; helo=azure-sdnproxy.icoremail.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 13 Mar 2024 11:46:38 -0400
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
X-TUID: vNlkOHy2mB+v

------=_Part_101905_1831961221.1710340168870
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

SGksCgoKCgpEb2VzIFFFTVUtQVJNIGhhdmUgYW55IHBsYW4gdG8gc3VwcG9ydCB0aGUgbmV3IHBl
cm1pc3Npb24gaW5kaXJlY3Rpb24gJiBvdmVybGF5IGV4dGVuc2lvbnMgb2YgQVJNdjguOS1BIFsx
XT8gVGhlc2UgZmVhdHVyZXMgaW52b2x2ZSBGRUFUX1MxUElFLCBGRUFUX1MxUE9FLCBGRUFUX1My
UElFLCBhbmQgRkVBVF9TMlBPRS4gQVJNNjQgTGludXggaGFzIHBhdGNoZXMgZm9yIHRoZXNlIGZl
YXR1cmVzIFsyXSBbM10uCgoKCgoKCgpbMV0gaHR0cHM6Ly9kZXZlbG9wZXIuYXJtLmNvbS9kb2N1
bWVudGF0aW9uLzEwMjM3Ni8wMjAwL1Blcm1pc3Npb24taW5kaXJlY3Rpb24tYW5kLXBlcm1pc3Np
b24tb3ZlcmxheS1leHRlbnNpb25zCgpbMl0gaHR0cHM6Ly9sd24ubmV0L0FydGljbGVzLzkyNTc1
Ny8KClszXSBodHRwczovL2x3bi5uZXQvQXJ0aWNsZXMvOTQ5MTI2Lw==
------=_Part_101905_1831961221.1710340168870
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PHN0eWxlIGNsYXNzPSJrZS1zdHlsZSI+CltsaXN0LXN0eWxlLXR5cGVdIHtwYWRkaW5nLWxlZnQ6
MjBweDtsaXN0LXN0eWxlLXBvc2l0aW9uOmluc2lkZX0KW2xpc3Qtc3R5bGUtdHlwZV0gbGkge21h
cmdpbjowfQpbbGlzdC1zdHlsZS10eXBlXSBsaTpiZWZvcmUsIHNwYW4ua2UtbGlzdC1pdGVtLW1h
dHRlciB7Zm9udC1mYW1pbHk6InNhbnMgc2VyaWYiLHRhaG9tYSx2ZXJkYW5hLGhlbHZldGljYX0K
W2xpc3Qtc3R5bGUtdHlwZV0gbGkgcCxbbGlzdC1zdHlsZS10eXBlXSBsaSBoMSxbbGlzdC1zdHls
ZS10eXBlXSBsaSBoMixbbGlzdC1zdHlsZS10eXBlXSBsaSBoMyxbbGlzdC1zdHlsZS10eXBlXSBs
aSBoNCxbbGlzdC1zdHlsZS10eXBlXSBsaSBoNSxbbGlzdC1zdHlsZS10eXBlXSBsaSBkaXYsW2xp
c3Qtc3R5bGUtdHlwZV0gbGkgYmxvY2txdW90ZXtkaXNwbGF5OmlubGluZTt3b3JkLWJyZWFrOmJy
ZWFrLWFsbH0KW2xpc3Qtc3R5bGUtdHlwZV0gbGkgdGFibGUge2Rpc3BsYXk6aW5saW5lLWJsb2Nr
O3ZlcnRpY2FsLWFsaWduOnRvcH0KcHttYXJnaW46MH0KdGQge3dvcmQtYnJlYWs6IGJyZWFrLXdv
cmR9Ci5kZWZhdWx0LWZvbnQtMTcxMDMzOTMzNTk3NnsKfQo8L3N0eWxlPjxkaXYgY2xhc3M9ImRl
ZmF1bHQtZm9udC0xNzEwMzM5MzM1OTc2IiBkaXI9Imx0ciI+PHAgc3R5bGU9ImZvbnQtc2l6ZTox
NnB4OyI+SGksPC9wPjxwIHN0eWxlPSJmb250LXNpemU6MTZweDsiPjxicj48L3A+PHAgc3R5bGU9
ImZvbnQtc2l6ZToxNnB4OyI+RG9lcyBRRU1VLUFSTSBoYXZlIGFueSBwbGFuIHRvIHN1cHBvcnQm
bmJzcDt0aGUgbmV3IHBlcm1pc3Npb24gaW5kaXJlY3Rpb24gJmFtcDsgb3ZlcmxheSBleHRlbnNp
b25zIG9mJm5ic3A7QVJNdjguOS1BIFsxXT8gVGhlc2UgZmVhdHVyZXMgaW52b2x2ZSA8c3BhbiBz
dHlsZT0idGV4dC13cmFwOndyYXA7Ij5GRUFUX1MxUElFLCBGRUFUX1MxUE9FLCBGRUFUX1MyUElF
LCBhbmQgRkVBVF9TMlBPRS48L3NwYW4+PHNwYW4gc3R5bGU9InRleHQtd3JhcDp3cmFwOyI+Jm5i
c3A7PC9zcGFuPkFSTTY0IExpbnV4IGhhcyBwYXRjaGVzIGZvciB0aGVzZSZuYnNwO2ZlYXR1cmVz
IFsyXSBbM10uPC9wPjxwIHN0eWxlPSJmb250LXNpemU6MTZweDsiPjxicj48L3A+PHAgc3R5bGU9
ImZvbnQtc2l6ZToxNnB4OyI+PGJyPjwvcD48cCBzdHlsZT0iZm9udC1zaXplOjE2cHg7Ij48c3Bh
biBzdHlsZT0idGV4dC13cmFwOm5vd3JhcDsiPlsxXSBodHRwczovL2RldmVsb3Blci5hcm0uY29t
L2RvY3VtZW50YXRpb24vMTAyMzc2LzAyMDAvUGVybWlzc2lvbi1pbmRpcmVjdGlvbi1hbmQtcGVy
bWlzc2lvbi1vdmVybGF5LWV4dGVuc2lvbnM8L3NwYW4+PC9wPjxwIHN0eWxlPSJmb250LXNpemU6
MTZweDsiPjxzcGFuIHN0eWxlPSJ0ZXh0LXdyYXA6bm93cmFwOyI+WzJdJm5ic3A7PHNwYW4gc3R5
bGU9InRleHQtd3JhcDpub3dyYXA7Ij5odHRwczovL2x3bi5uZXQvQXJ0aWNsZXMvOTI1NzU3Lzwv
c3Bhbj48L3NwYW4+PC9wPjxwIHN0eWxlPSJmb250LXNpemU6MTZweDsiPlszXSZuYnNwOzxzcGFu
IHN0eWxlPSJ0ZXh0LXdyYXA6bm93cmFwOyI+aHR0cHM6Ly9sd24ubmV0L0FydGljbGVzLzk0OTEy
Ni88L3NwYW4+PC9wPjwvZGl2Pg==
------=_Part_101905_1831961221.1710340168870--

