Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp415789lfg;
        Thu, 20 Feb 2020 02:52:30 -0800 (PST)
X-Google-Smtp-Source: APXvYqwDqZoxfqHnDrRaGsGzestBS83pPaVXzqz7pYvfjZ+m+bqLJDwLOurU27YIU7DKNqBXCMlI
X-Received: by 2002:ac8:65ce:: with SMTP id t14mr25659246qto.72.1582195950575;
        Thu, 20 Feb 2020 02:52:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582195950; cv=none;
        d=google.com; s=arc-20160816;
        b=oVGNPDlNkwhJKjQOOmqzd5gLepASuc9LByVuchmF5AqgH/Z3PGHSNRM7rE6XkZT39K
         +T6hYuseghAm4ySiKuy0J3gdECBZXYP4CetGdxRj+IfiMZjb7iTE0N1Wa2p5uyO8pXRR
         gC9/WDKcnKZzPRY9AybE7cvFUuYlF824WwVPAqB8zehBmLVXQKgM6dpMzvIYTxqWXU5Q
         /RtiaFfYvbYH+j6RhXA6teZytxP4kUKc1bzYEZmIv0dyi2/M+n0tym56UpEQ71lJSaB+
         Ba7fDS+R0CTp6phoncBnb/9Tunua0Cc0OyupGoTkmuUP0utFhFkUckzFA+AsYQT0g0PF
         zPXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:to:subject
         :message-id:date:from:mime-version:dkim-signature;
        bh=sD2MrT4Y0kJ7NpZP4csCjzyWqkj+6vChQeOlPqIN+II=;
        b=ruJx29yoeqVnamiEf7db1bZBb5vyg9y+sz5Wx1WnGrDiFHXce9hP14TDd9l3bg+6OB
         D6p4m1UjwfjAlr55JM9BA0xADVM/SGvhTVO1TsPSv7QpVXB0ZPYOsqXKqTv0OmGWsXNA
         Kbe3Zo8sZ0qDYCzyyeqqVSD59EwMQdChQUgAn2QDuowEiYTk3XR8O4mAedU7UHn3cyXg
         pSzAU9m/0R/rrhi6F/Cb+3X6yjnTZhffLC28mSova/gaoPkuDhUzxUIyUd5g1AwgeHeP
         5rlEehPwXiDZQRRs3tQKro5ZGgBsscvQ1Myj8UrZjdyM7TW8tupqag4bQDabdG1iFKn9
         7Xww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="bQ/LBnam";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j7si1232120qtd.283.2020.02.20.02.52.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Feb 2020 02:52:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="bQ/LBnam";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:39748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j4jRU-0002ll-Ka
	for alex.bennee@linaro.org; Thu, 20 Feb 2020 05:52:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35881)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kamalpr@gmail.com>) id 1j4jRO-0002lT-37
 for qemu-arm@nongnu.org; Thu, 20 Feb 2020 05:52:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kamalpr@gmail.com>) id 1j4jRM-0006ZU-WE
 for qemu-arm@nongnu.org; Thu, 20 Feb 2020 05:52:21 -0500
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41]:34640)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <kamalpr@gmail.com>) id 1j4jRM-0006YD-Oy
 for qemu-arm@nongnu.org; Thu, 20 Feb 2020 05:52:20 -0500
Received: by mail-io1-xd41.google.com with SMTP id z193so4174279iof.1
 for <qemu-arm@nongnu.org>; Thu, 20 Feb 2020 02:52:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:reply-to:from:date:message-id:subject:to;
 bh=sD2MrT4Y0kJ7NpZP4csCjzyWqkj+6vChQeOlPqIN+II=;
 b=bQ/LBnammtZUqmkNEbpTOvRN7OoBAUEo7mSipju5UNOed0Xj/1KOeB0CkRPUkr6mU4
 a3tHIU6g0gSfZiDu0tZSLMfmrLIpFiPmYvZUYqABk1CVDDJJ+hUqkw4tsrXHChDu4yW+
 tsq4VWMs5C9L2er0Wosg3zW4J6hFkTq/agiY6iWCtbYOa2Te2bgAZs8ThXS952EcGSdU
 Usy6tcTxZ/vy6lhVObAnF8VVmnSNtAf7e3p2JATWJpedpoB+6eQfjzv0TpDLkeZXPKz6
 nlKLufVCymKDrBEmwsAv9jr+G92qDgZcbuUaCIYUqUiDSKFgU2a7aZe7XvtnoKLT+RPw
 StUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:reply-to:from:date:message-id
 :subject:to;
 bh=sD2MrT4Y0kJ7NpZP4csCjzyWqkj+6vChQeOlPqIN+II=;
 b=WDrgsIXN5Uus8l5EVDnvGsdrWhe59cihCCfYXyF7Fwq0I7fedK31oysRSmeDAnflcD
 lhRPCnAMEWJg6DU9T7qKT6pIHlkY94QDdeEISm9gBAWm1fVc+3JEwOtfv5f6NJMW7gTW
 ua/WOfqL/vIsvpgjTXfu9LrtuWkllDn+NZdSdVq4g0XoLdlWlU2ohpFlzcSLZe4e7V44
 7TsHy28kelwtLm2xCjFCouk1LdgdeNau3SIbjHZ6Jv3Ip4T8VI64k1sVXnC7WAAOdm7a
 JT0P7ndDcF9l/u4btkTtROsuI9oNjtj0vLZ2gQr7tNOGin3emhH963HPabRVWDMZg9uK
 KyLA==
X-Gm-Message-State: APjAAAWLryrwFmykVyDCcwU8R5rfbhB1xlsaGUKcJ+a9BV9Les9RlACk
 LeDYbu17HXA7LT2KEryGxJvsnwfqEg9g03NSW/l5aRDsyFvRpUc=
X-Received: by 2002:a6b:fe0f:: with SMTP id x15mr22214732ioh.219.1582195939611; 
 Thu, 20 Feb 2020 02:52:19 -0800 (PST)
MIME-Version: 1.0
From: "Kamal R. Prasad" <kamalpr@gmail.com>
Date: Thu, 20 Feb 2020 16:22:08 +0530
Message-ID: <CAK=yUG+jKnNYV=QiD_CHYhjKQOWky1Y2g9gGDbPnABH5hSwx-w@mail.gmail.com>
Subject: load a freebsd derived kernel on Qemu-system-arm
To: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000f21746059effb2f9"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::d41
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
Reply-To: kamalp@acm.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bhzWnsdFjZ5n

--000000000000f21746059effb2f9
Content-Type: text/plain; charset="UTF-8"

hello,

 when I try to load a freebsd kernel onto Qemu running on my Mac, I get
this error:-

# qemu-system-arm -machine versatileab -kernel ./kernel


qemu-system-arm: GLib: g_mapped_file_unref: assertion 'file != NULL' failed


Can someone tell me what I am missing? The code is built for arm but online
linux, freebsd build does not generate a vmlinuz or ignited file. The
target is a cortex -arm quad core board (from Broadcom).


thanks

--000000000000f21746059effb2f9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">hello,<div><br></div><di=
v>=C2=A0when I try to load a freebsd kernel onto Qemu running on my Mac, I =
get this error:-</div><div><p style=3D"margin:0px;font-stretch:normal;font-=
size:14px;line-height:normal;font-family:Menlo;color:rgb(0,0,0)"><span styl=
e=3D"font-variant-ligatures:no-common-ligatures"># qemu-system-arm -machine=
 versatileab -kernel ./kernel=C2=A0</span></p><p style=3D"margin:0px;font-s=
tretch:normal;font-size:14px;line-height:normal;font-family:Menlo;color:rgb=
(0,0,0)"><span style=3D"font-variant-ligatures:no-common-ligatures"><br></s=
pan></p><p style=3D"margin:0px;font-stretch:normal;font-size:14px;line-heig=
ht:normal;font-family:Menlo;color:rgb(0,0,0)"><span style=3D"font-variant-l=
igatures:no-common-ligatures"></span></p><p style=3D"margin:0px;font-stretc=
h:normal;font-size:14px;line-height:normal;font-family:Menlo;color:rgb(0,0,=
0)"><span style=3D"font-variant-ligatures:no-common-ligatures">qemu-system-=
arm: GLib: g_mapped_file_unref: assertion &#39;file !=3D NULL&#39; failed</=
span></p><p style=3D"margin:0px;font-stretch:normal;font-size:14px;line-hei=
ght:normal;font-family:Menlo;color:rgb(0,0,0)"><span style=3D"font-variant-=
ligatures:no-common-ligatures"><br></span></p><p style=3D"margin:0px;font-s=
tretch:normal;font-size:14px;line-height:normal;font-family:Menlo;color:rgb=
(0,0,0)"><span style=3D"font-variant-ligatures:no-common-ligatures">Can som=
eone tell me what I am missing? The code is built for arm but online linux,=
 freebsd build does not generate a vmlinuz or ignited file. The target is a=
 cortex -arm quad core board (from Broadcom).</span></p><p style=3D"margin:=
0px;font-stretch:normal;font-size:14px;line-height:normal;font-family:Menlo=
;color:rgb(0,0,0)"><span style=3D"font-variant-ligatures:no-common-ligature=
s"><br></span></p><p style=3D"margin:0px;font-stretch:normal;font-size:14px=
;line-height:normal;font-family:Menlo;color:rgb(0,0,0)"><span style=3D"font=
-variant-ligatures:no-common-ligatures">thanks</span></p><p style=3D"margin=
:0px;font-stretch:normal;font-size:14px;line-height:normal;font-family:Menl=
o;color:rgb(0,0,0)"><span style=3D"font-variant-ligatures:no-common-ligatur=
es"><br></span></p></div></div></div></div>

--000000000000f21746059effb2f9--
