Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp3855825lfp;
        Mon, 10 Feb 2020 05:44:43 -0800 (PST)
X-Google-Smtp-Source: APXvYqxTxT5LENGkc54LWIbkdEEEkJpgoA/TM1Lp2cI5VKVjTjz9i6MsjLLZs5fGYAzdB+zW28Q1
X-Received: by 2002:a05:620a:c91:: with SMTP id q17mr1407782qki.168.1581342283316;
        Mon, 10 Feb 2020 05:44:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581342283; cv=none;
        d=google.com; s=arc-20160816;
        b=ATzQXLFt10zbMi2wvzXQA7Drzn1dR7l6AVBsPM61DSXW1+oN6LkN3M+UaX71DL84G0
         jQS8PAvsP/OzNPrOSxys8VCmtr0rbEthrvZ+O5usHA+k2I4JDM0V05pIolxi2NLenOsA
         80tBncuyJr/NkQpVOIkK5nugdNQHnXI5BPiLPC7fO+xhS+UnSHBYLvmJh/yidSJGG6yH
         V5UPev9e4fnWJSHcqpmqic4LaHGqGbL/9xVBn15qISvgrO/sp0kCG9HVFySgAPZV912o
         WsLIKqTtp5zlTQ6v0X1z5UpRfD+E/imqp7eDZhUKovYFow1Q6ZxBSNz0PEO0BjBRuJM8
         AdVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:date:to:from
         :resent-from:content-transfer-encoding:mime-version:message-id
         :subject:in-reply-to:resent-message-id:resent-date;
        bh=yd7qUdZkmo8mIVYzXpH6FI8rxf7tRm/4qn8dF19QPeo=;
        b=t+Ii//jCf0q1dfYSR0WQoWIgrEYG1RZPdIE5IwpybAS1IYi0XkH3zw3McLoI2RvaUH
         /39ZxbVMj2JXvdgaeVlOFyRKB7lzRyxRALR3/3BugfgirGu19a/YtfGSCR0TAAF3MTOj
         DaEPsEKtC4KmxvSsIv+ya4cGOQkFnGNIpr0SVoFt/cxs7g3HuQ8RIyTw7IIJE9TEYoqO
         J1SUXJzZ66MJnL/hShA+GBndJ3jxYn3sl0irOVxFG0N8boSDBHFltCRvKGokz7M3PAGb
         DVYPJGGVmM2/S+A31JiNHYTa6Vq5ZtyjP6J1z+rkWEX5iVMNhorcbHF2FjfffSuVdDqv
         MKHw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y8si168645qvn.213.2020.02.10.05.44.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Feb 2020 05:44:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:33926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j19Mg-0005Bt-O4
	for alex.bennee@linaro.org; Mon, 10 Feb 2020 08:44:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50400)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <no-reply@patchew.org>) id 1j19MY-00057z-6r
 for qemu-arm@nongnu.org; Mon, 10 Feb 2020 08:44:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <no-reply@patchew.org>) id 1j19MX-0006zg-1u
 for qemu-arm@nongnu.org; Mon, 10 Feb 2020 08:44:34 -0500
Resent-Date: Mon, 10 Feb 2020 08:44:34 -0500
Resent-Message-Id: <E1j19MX-0006zg-1u@eggs.gnu.org>
Received: from sender4-of-o51.zoho.com ([136.143.188.51]:21188)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <no-reply@patchew.org>)
 id 1j19MT-0006xu-Ue; Mon, 10 Feb 2020 08:44:30 -0500
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1581342243617677.5462869362311;
 Mon, 10 Feb 2020 05:44:03 -0800 (PST)
In-Reply-To: <20200210131523.27540-1-eric.auger@redhat.com>
Subject: Re: [RFC 0/2] vTPM for aarch64
Message-ID: <158134224175.6574.17653625255794632377@a1bbccc8075a>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: eric.auger@redhat.com
Date: Mon, 10 Feb 2020 05:44:03 -0800 (PST)
X-ZohoMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 136.143.188.51
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
Reply-To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, philmd@redhat.com, qemu-devel@nongnu.org,
 eric.auger@redhat.com, qemu-arm@nongnu.org, marcandre.lureau@redhat.com,
 eric.auger.pro@gmail.com, lersek@redhat.com, ardb@kernel.org,
 stefanb@linux.ibm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZN3yoPVebb1S

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMDIxMDEzMTUyMy4yNzU0
MC0xLWVyaWMuYXVnZXJAcmVkaGF0LmNvbS8KCgoKSGksCgpUaGlzIHNlcmllcyBmYWlsZWQgdGhl
IGRvY2tlci1xdWlja0BjZW50b3M3IGJ1aWxkIHRlc3QuIFBsZWFzZSBmaW5kIHRoZSB0ZXN0aW5n
IGNvbW1hbmRzIGFuZAp0aGVpciBvdXRwdXQgYmVsb3cuIElmIHlvdSBoYXZlIERvY2tlciBpbnN0
YWxsZWQsIHlvdSBjYW4gcHJvYmFibHkgcmVwcm9kdWNlIGl0CmxvY2FsbHkuCgo9PT0gVEVTVCBT
Q1JJUFQgQkVHSU4gPT09CiMhL2Jpbi9iYXNoCm1ha2UgZG9ja2VyLWltYWdlLWNlbnRvczcgVj0x
IE5FVFdPUks9MQp0aW1lIG1ha2UgZG9ja2VyLXRlc3QtcXVpY2tAY2VudG9zNyBTSE9XX0VOVj0x
IEo9MTQgTkVUV09SSz0xCj09PSBURVNUIFNDUklQVCBFTkQgPT09CgpxZW11LXN5c3RlbS14ODZf
NjQ6IE9wdGlvbiAnLWRldmljZSB0cG0tdGlzJyBjYW5ub3QgYmUgaGFuZGxlZCBieSB0aGlzIG1h
Y2hpbmUKQnJva2VuIHBpcGUKL3RtcC9xZW11LXRlc3Qvc3JjL3Rlc3RzL3F0ZXN0L2xpYnF0ZXN0
LmM6MTQwOiBraWxsX3FlbXUoKSB0cmllZCB0byB0ZXJtaW5hdGUgUUVNVSBwcm9jZXNzIGJ1dCBl
bmNvdW50ZXJlZCBleGl0IHN0YXR1cyAxIChleHBlY3RlZCAwKQpFUlJPUiAtIG1pc3NpbmcgdGVz
dCBwbGFuCm1ha2U6ICoqKiBbY2hlY2stcXRlc3QteDg2XzY0XSBFcnJvciAxCm1ha2U6ICoqKiBX
YWl0aW5nIGZvciB1bmZpbmlzaGVkIGpvYnMuLi4uCgpMb29raW5nIGZvciBleHBlY3RlZCBmaWxl
ICd0ZXN0cy9kYXRhL2FjcGkvdmlydC9GQUNQLm51bWFtZW0nCi0tLQogICAgcmFpc2UgQ2FsbGVk
UHJvY2Vzc0Vycm9yKHJldGNvZGUsIGNtZCkKc3VicHJvY2Vzcy5DYWxsZWRQcm9jZXNzRXJyb3I6
IENvbW1hbmQgJ1snc3VkbycsICctbicsICdkb2NrZXInLCAncnVuJywgJy0tbGFiZWwnLCAnY29t
LnFlbXUuaW5zdGFuY2UudXVpZD1iMjkzOTM3NGY0MGE0NGExYTkxYmQwYjU5Nzg4ZTNlNCcsICct
dScsICcxMDAxJywgJy0tc2VjdXJpdHktb3B0JywgJ3NlY2NvbXA9dW5jb25maW5lZCcsICctLXJt
JywgJy1lJywgJ1RBUkdFVF9MSVNUPScsICctZScsICdFWFRSQV9DT05GSUdVUkVfT1BUUz0nLCAn
LWUnLCAnVj0nLCAnLWUnLCAnSj0xNCcsICctZScsICdERUJVRz0nLCAnLWUnLCAnU0hPV19FTlY9
MScsICctZScsICdDQ0FDSEVfRElSPS92YXIvdG1wL2NjYWNoZScsICctdicsICcvaG9tZS9wYXRj
aGV3Ly5jYWNoZS9xZW11LWRvY2tlci1jY2FjaGU6L3Zhci90bXAvY2NhY2hlOnonLCAnLXYnLCAn
L3Zhci90bXAvcGF0Y2hldy10ZXN0ZXItdG1wLWJxbHQxejdwL3NyYy9kb2NrZXItc3JjLjIwMjAt
MDItMTAtMDguMzIuMzUuNTQ4NDovdmFyL3RtcC9xZW11Onoscm8nLCAncWVtdTpjZW50b3M3Jywg
Jy92YXIvdG1wL3FlbXUvcnVuJywgJ3Rlc3QtcXVpY2snXScgcmV0dXJuZWQgbm9uLXplcm8gZXhp
dCBzdGF0dXMgMi4KZmlsdGVyPS0tZmlsdGVyPWxhYmVsPWNvbS5xZW11Lmluc3RhbmNlLnV1aWQ9
YjI5MzkzNzRmNDBhNDRhMWE5MWJkMGI1OTc4OGUzZTQKbWFrZVsxXTogKioqIFtkb2NrZXItcnVu
XSBFcnJvciAxCm1ha2VbMV06IExlYXZpbmcgZGlyZWN0b3J5IGAvdmFyL3RtcC9wYXRjaGV3LXRl
c3Rlci10bXAtYnFsdDF6N3Avc3JjJwptYWtlOiAqKiogW2RvY2tlci1ydW4tdGVzdC1xdWlja0Bj
ZW50b3M3XSBFcnJvciAyCgpyZWFsICAgIDExbTI3LjQ0NnMKdXNlciAgICAwbTguODQ1cwoKClRo
ZSBmdWxsIGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0cDovL3BhdGNoZXcub3JnL2xvZ3MvMjAyMDAy
MTAxMzE1MjMuMjc1NDAtMS1lcmljLmF1Z2VyQHJlZGhhdC5jb20vdGVzdGluZy5kb2NrZXItcXVp
Y2tAY2VudG9zNy8/dHlwZT1tZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9tYXRpY2Fs
bHkgYnkgUGF0Y2hldyBbaHR0cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZl
ZWRiYWNrIHRvIHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNvbQ==
